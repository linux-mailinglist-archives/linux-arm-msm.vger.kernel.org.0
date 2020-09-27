Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF17279DC9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 05:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730292AbgI0DhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 23:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730284AbgI0DhR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 23:37:17 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE09C0613D4
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 20:37:17 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id s19so1510660plp.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 20:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2a29PGE7XTP2XdT1J2AnCKNgX28qIiZ+/+2Zu4a2uQE=;
        b=fhdDdL8E05WQHKrOKWK5qT9OlOg8GnhnYtli9FeqYHIuqfdNMU7sCnG9qh4nRrDoRt
         aMD4I+TKMarcB7oi5g+c88JHjOOb32MAIpvc5Q8CvjnKh4WYvdeA5pEPiGp+g2g9QLHW
         Abzz2gNhEmwzj5on/mChvlRdGI5ACKlVDMRxx1NYU4beRIFliQsF2dGvvuILEVMumjb+
         YABUMyR49fjMIKIXIcjFw/4SmSKysDikSLLagUBSSFUMWNIQCThJEDXwHsj03/pKANku
         3R5BcKmT/F5NGUkTVHv9w3nJFhVFVWV3s6CZOUaJ03jNIyc7iV0CMmqAfnSD1gB3YAuA
         NiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2a29PGE7XTP2XdT1J2AnCKNgX28qIiZ+/+2Zu4a2uQE=;
        b=qSMi1s+gYhBDLtdPwVbUEwBI40sxljBZPtYmGpCOFBk8pj0FdZPuQm2s2JzDCSJCx2
         4aWLx+BkzZqOObagD1nGTcvB/PJssCF1eI4Hk1iH93mr9Co4j+qaFxXLvG2VMRhdW1RC
         uL/9vnPittvy7nWQ1eVn0nd6OP4ZXMNLDErAZ7gGK+/SItfzLdWKA8JV8PDlljcgwcc4
         jxvAculHH0mNTMOa571PYzuE/e5p+njd3NFWqyU/LOtANBBTpDZTkGvV82VPmuHYSXSF
         cMATXNN92GKS1DUmKuG40cfNt5H1Kw2OHHASkIcJhjnTHR4x9w/Hxdz4OoEInea7l0QZ
         otrQ==
X-Gm-Message-State: AOAM533KpnFIT7uLQC2alcrbTRY18nyfgOv4WbvxSZOpVV1ONQoEVbkG
        8d7RQ9uEnwzuvqAR2g6DXMsnmda26IFJ4kk=
X-Google-Smtp-Source: ABdhPJyYz8jA0RgFc1iLqQrAalCxXpyFKMohA/fqUfh4rO0uATYFhZY0qqtgFK7O3ITsHvYlcKUsoA==
X-Received: by 2002:a17:90a:6e45:: with SMTP id s5mr4028288pjm.12.1601177836840;
        Sat, 26 Sep 2020 20:37:16 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:980:cb63:5c53:a3bf:dd6b:614d])
        by smtp.gmail.com with ESMTPSA id gx5sm2821439pjb.57.2020.09.26.20.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 20:37:16 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/5] net: qrtr: Start MHI channels during init
Date:   Sun, 27 Sep 2020 09:06:51 +0530
Message-Id: <20200927033652.11789-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200927033652.11789-1-manivannan.sadhasivam@linaro.org>
References: <20200927033652.11789-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

Start MHI device channels so that transfers can be performed.
The MHI stack does not auto-start channels anymore.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 net/qrtr/mhi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index ff0c41467fc1..7100f0bac4c6 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -76,6 +76,11 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	struct qrtr_mhi_dev *qdev;
 	int rc;
 
+	/* start channels */
+	rc = mhi_prepare_for_transfer(mhi_dev);
+	if (rc)
+		return rc;
+
 	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
 	if (!qdev)
 		return -ENOMEM;
-- 
2.17.1

