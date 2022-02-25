Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 286104C3C6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 04:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiBYDa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 22:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237037AbiBYDa7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 22:30:59 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B3B15471A
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 19:30:27 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id j3-20020a9d7683000000b005aeed94f4e9so2770628otl.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 19:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fXXZvdlTybfcJufCRJu6AzZ8AhUXW83H0a85LXNskao=;
        b=EYCQiacCdeDF0+9tvuZErbGuAPAIvcBmUw4GMyBwZJuLA/ACOPsZCm5rpU4i847Czd
         Fe5ydtfXeye3HqVmCvPApOoEZM83h6vV10MulxJPDFxAkTA7k7MOa2AED/wS1jCQzAtJ
         nr7W0HcR44jCemYM0w4mWDTcoMzlqQYlxxqgBTZWvOP8Dr+Vjnh1cwkkCst/FLj2VJOg
         HgYi1S4m0K5WVsajI+WUVeCq7YPf4Xqei7pjGLPyZ4oo/OYtmtUOy2y9c76Ohcj7LdTV
         p5ufXq6u011pqS1tGWR1ORhDrhb4FbWmpmgsnAUV0lFWUb9nTv6vwpCtz8c+LaeGjfeo
         RGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fXXZvdlTybfcJufCRJu6AzZ8AhUXW83H0a85LXNskao=;
        b=2CTNIylE7cE4gG1wwk8WVjJhZvlGzR2IVOlEKF0wrimfWQqleepyjaBfNBtM7YFMF4
         5h2CYTuEQQrHk+IufeKzyTtpq1W/fZbS8vktnRYkFKEMVhAlieUWFrnyyuHtDrlcc2ew
         ChyFxn2lCIKqURaG1IGDj43fsuXD7vxVxiagQTDkMN6Fj02Cpw2yZ2iee784cF9kXOV3
         cpDzfaCl+6o8flqqSm/DXphpQVoZZ9oU8VEc/Sixwuk43ntJXOQtllBtvEUhzNaLht24
         qy14KHpaaqrq/S8PDAYKKfgusNjYZleMpGr6mFb6Pbt1+PvYBJwCyXwQLcG/uR4bnlsx
         ujSw==
X-Gm-Message-State: AOAM533HL/fizMb731guoo12vrH/WlHpocGmNyfRQNewa5MtwI9DA5CL
        sxsJfZsAb+tFCMIrT4WTftwW7w==
X-Google-Smtp-Source: ABdhPJyKdA0REsFSweiq4F2TgdrIsVFq4tGWuKvM+LH6k0VZ5nIshAagqnGhRkkxnv1GYtUDpQVkAw==
X-Received: by 2002:a05:6830:33cf:b0:5af:4018:fc2a with SMTP id q15-20020a05683033cf00b005af4018fc2amr2116489ott.161.1645759826638;
        Thu, 24 Feb 2022 19:30:26 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id a23-20020a056830101700b005ad0bd6fe0csm598253otp.47.2022.02.24.19.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 19:30:26 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: q6v5: Add interconnect path proxy vote
Date:   Thu, 24 Feb 2022 19:32:24 -0800
Message-Id: <20220225033224.2238425-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Many remoteproc instances requires that Linux casts a proxy vote for an
interconnect path during boot, until they can do it themselves. Add
support for voting for a single path.

As this is a shared problem between both PAS and MSS drivers, the path
is acquired and votes casted from the common helper code.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Sibi posted recently a patch to add interconnect votes from the modem driver,
today I needed the same feature for one of the PAS remoteprocs. After
essentially duplicating Sibi's patch I realized that it doesn't look too bad to
put this in the common Q6V5 code.

The main difference is that this would be messy if we need to support multiple
paths, so we probably would have to push it out to the individual drivers at
that point.

Sibi's patch can be found here.
https://lore.kernel.org/all/1644813252-12897-3-git-send-email-quic_sibis@quicinc.com/


This makes the implementation pick up one path, relevant DT bindings would
still need to be updated in order be allowed to this in the DeviceTree files.

 drivers/remoteproc/qcom_q6v5.c | 21 ++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5.h |  3 +++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 442a388f8102..5280ec9b5449 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -8,6 +8,7 @@
  */
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/soc/qcom/qcom_aoss.h>
@@ -51,9 +52,17 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5)
 {
 	int ret;
 
+	ret = icc_set_bw(q6v5->path, 0, UINT_MAX);
+	if (ret < 0) {
+		dev_err(q6v5->dev, "failed to set bandwidth request\n");
+		return ret;
+	}
+
 	ret = q6v5_load_state_toggle(q6v5, true);
-	if (ret)
+	if (ret) {
+		icc_set_bw(q6v5->path, 0, 0);
 		return ret;
+	}
 
 	reinit_completion(&q6v5->start_done);
 	reinit_completion(&q6v5->stop_done);
@@ -78,6 +87,9 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5)
 	disable_irq(q6v5->handover_irq);
 	q6v5_load_state_toggle(q6v5, false);
 
+	/* Disable interconnect vote, in case handover never happened */
+	icc_set_bw(q6v5->path, 0, 0);
+
 	return !q6v5->handover_issued;
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_unprepare);
@@ -160,6 +172,8 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
 
+	icc_set_bw(q6v5->path, 0, 0);
+
 	q6v5->handover_issued = true;
 
 	return IRQ_HANDLED;
@@ -332,6 +346,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 		return load_state ? -ENOMEM : -EINVAL;
 	}
 
+	q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
+	if (IS_ERR(q6v5->path))
+		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
+				     "failed to acquire interconnect path\n");
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_init);
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index f35e04471ed7..5a859c41896e 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -7,6 +7,7 @@
 #include <linux/completion.h>
 #include <linux/soc/qcom/qcom_aoss.h>
 
+struct icc_path;
 struct rproc;
 struct qcom_smem_state;
 struct qcom_sysmon;
@@ -18,6 +19,8 @@ struct qcom_q6v5 {
 	struct qcom_smem_state *state;
 	struct qmp *qmp;
 
+	struct icc_path *path;
+
 	unsigned stop_bit;
 
 	int wdog_irq;
-- 
2.33.1

