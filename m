Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7BE3AC9A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 13:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbhFRLTM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 07:19:12 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:9544 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFRLTM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 07:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624015020;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=2IEraGzNWXmVYdeSeEGKrT4Xkx/HJOG80MAY09qwzKU=;
    b=MhNpCRSVeiykPgc+vZZ4PyWh2hpCLJfiJdRDeHv6NjGfqhrEjC0GVkvPysJ3IQtrP2
    z+SvB8yDvmfaqM/eAGzwlwxX6Zd5LLb1vyk2CI46v23FobqKoCPwO1ErzgFSSQym/K3F
    UECZKSXYM9Qav/Uv8vc286lowUrWOqQj09azCHSy9QGrngNZ7gHS2dFEd3x60UaIPKf2
    BBvAij1NWNxvqnyZS+RCb3y1wSw4KhBqoyXdO16FOJrwwLB/rd+ygcr1ETDaj89GpLhV
    EKMjCu4gWVJtx8J7v+vKiuoQBuVsNTuxZwriEx+pwBqM8d4KAwrysjkVVWZwgOV+0osQ
    FJvg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxA626EOg=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.27.3 DYNA|AUTH)
    with ESMTPSA id 000885x5IBGx5MN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 18 Jun 2021 13:16:59 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/3] soc: qcom: smem_state: Add devm_qcom_smem_state_get()
Date:   Fri, 18 Jun 2021 13:15:54 +0200
Message-Id: <20210618111556.53416-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is easy to forget to call qcom_smem_state_put() after
a qcom_smem_state_get(). Introduce a devm_qcom_smem_state_get()
helper function that automates this so that qcom_smem_state_put()
is automatically called when a device is removed.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
I use this in my WIP bam-dmux driver, so it might simplify coordination
later if we can somehow get this in for 5.14 (if it isn't too late yet).

Similar code can be found in clk-devres.c for example:
https://elixir.bootlin.com/linux/v5.13-rc6/source/drivers/clk/clk-devres.c#L7
---
 drivers/soc/qcom/smem_state.c       | 36 +++++++++++++++++++++++++++++
 include/linux/soc/qcom/smem_state.h |  7 ++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/soc/qcom/smem_state.c b/drivers/soc/qcom/smem_state.c
index d2b558438deb..31faf4aa868e 100644
--- a/drivers/soc/qcom/smem_state.c
+++ b/drivers/soc/qcom/smem_state.c
@@ -151,6 +151,42 @@ void qcom_smem_state_put(struct qcom_smem_state *state)
 }
 EXPORT_SYMBOL_GPL(qcom_smem_state_put);
 
+static void devm_qcom_smem_state_release(struct device *dev, void *res)
+{
+	qcom_smem_state_put(*(struct qcom_smem_state **)res);
+}
+
+/**
+ * devm_qcom_smem_state_get() - acquire handle to a devres managed state
+ * @dev:	client device pointer
+ * @con_id:	name of the state to lookup
+ * @bit:	flags from the state reference, indicating which bit's affected
+ *
+ * Returns handle to the state, or ERR_PTR(). qcom_smem_state_put() is called
+ * automatically when @dev is removed.
+ */
+struct qcom_smem_state *devm_qcom_smem_state_get(struct device *dev,
+						 const char *con_id,
+						 unsigned *bit)
+{
+	struct qcom_smem_state **ptr, *state;
+
+	ptr = devres_alloc(devm_qcom_smem_state_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	state = qcom_smem_state_get(dev, con_id, bit);
+	if (!IS_ERR(state)) {
+		*ptr = state;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return state;
+}
+EXPORT_SYMBOL_GPL(devm_qcom_smem_state_get);
+
 /**
  * qcom_smem_state_register() - register a new state
  * @of_node:	of_node used for matching client lookups
diff --git a/include/linux/soc/qcom/smem_state.h b/include/linux/soc/qcom/smem_state.h
index 63ad8cddad14..17c56a50302f 100644
--- a/include/linux/soc/qcom/smem_state.h
+++ b/include/linux/soc/qcom/smem_state.h
@@ -14,6 +14,7 @@ struct qcom_smem_state_ops {
 #ifdef CONFIG_QCOM_SMEM_STATE
 
 struct qcom_smem_state *qcom_smem_state_get(struct device *dev, const char *con_id, unsigned *bit);
+struct qcom_smem_state *devm_qcom_smem_state_get(struct device *dev, const char *con_id, unsigned *bit);
 void qcom_smem_state_put(struct qcom_smem_state *);
 
 int qcom_smem_state_update_bits(struct qcom_smem_state *state, u32 mask, u32 value);
@@ -29,6 +30,12 @@ static inline struct qcom_smem_state *qcom_smem_state_get(struct device *dev,
 	return ERR_PTR(-EINVAL);
 }
 
+static inline struct qcom_smem_state *devm_qcom_smem_state_get(struct device *dev,
+	const char *con_id, unsigned *bit)
+{
+	return ERR_PTR(-EINVAL);
+}
+
 static inline void qcom_smem_state_put(struct qcom_smem_state *state)
 {
 }
-- 
2.32.0

