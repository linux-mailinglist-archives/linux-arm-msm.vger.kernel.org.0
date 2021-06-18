Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A60A3AC9A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 13:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhFRLTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 07:19:13 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:24758 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbhFRLTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 07:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624015021;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=TmiQ4yvqSb411vIWyt9OmjsSoyUm3e6fKITRv5hMjZ0=;
    b=TuF0zFzCVQBcn43eeOTknFqSjg/c81Y+v1CBUJLBznrVpcyWxhYHBfmfQaDrn4w7fn
    OSRAJIy4HAFgDKtgfxrrEVPkYrXtWjO6tSYahq0kvUPVPbUOH5peecOTyezdznS8ZaVd
    4nXMJL5QbhCXUj6VYwLCGD5muyh+TtVIDr4nnFXYpmHE2C1g6JUiiYM3fK3jOM1BD4YX
    7i1YeSxnT+c/YkTu8l3QQ4lBj6nAEl+PdcdFaDe8uveEHw0MzF73idyFt6/jXBR6/pcY
    +5oh5nZYNimV9hlJLpyHONgOfwEUu86f0l+FwjcTaFsWlnjnQY6Ys2EpVg+EgYkiuLDP
    Zqmg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxA626EOg=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.27.3 DYNA|AUTH)
    with ESMTPSA id 000885x5IBH05MP
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 18 Jun 2021 13:17:00 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/3] remoteproc: qcom_wcnss: Use devm_qcom_smem_state_get()
Date:   Fri, 18 Jun 2021 13:15:56 +0200
Message-Id: <20210618111556.53416-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210618111556.53416-1-stephan@gerhold.net>
References: <20210618111556.53416-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the new managed devm_qcom_smem_state_get() variant instead of
calling qcom_smem_state_put() explicitly in remove() to simplify the
code a bit.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/remoteproc/qcom_wcnss.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 5f3455aa7e0e..f1cbc6b2edbb 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -624,8 +624,8 @@ static int wcnss_probe(struct platform_device *pdev)
 	wcnss->stop_ack_irq = ret;
 
 	if (wcnss->stop_ack_irq) {
-		wcnss->state = qcom_smem_state_get(&pdev->dev, "stop",
-						   &wcnss->stop_bit);
+		wcnss->state = devm_qcom_smem_state_get(&pdev->dev, "stop",
+							&wcnss->stop_bit);
 		if (IS_ERR(wcnss->state)) {
 			ret = PTR_ERR(wcnss->state);
 			goto detach_pds;
@@ -659,7 +659,6 @@ static int wcnss_remove(struct platform_device *pdev)
 
 	of_platform_depopulate(&pdev->dev);
 
-	qcom_smem_state_put(wcnss->state);
 	rproc_del(wcnss->rproc);
 
 	qcom_remove_sysmon_subdev(wcnss->sysmon);
-- 
2.32.0

