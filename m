Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707633C28A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 19:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbhGIRpz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 13:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbhGIRpy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 13:45:54 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D99C0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 10:43:10 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id u11so13145400oiv.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 10:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4L6LE8ktaz0dOCXgnCDHnv0IIw+yGdBizQsgg4SQBw0=;
        b=tJISju/9KR1SDzZ9iNBfbSZaLeUMKTVBprNl2w6zSLUoiO2v8uLqxy3BNtKYxjXdsn
         oVoDYExLLJLlWw8HGIgNxuhKLUXKL0pl8B0ZoIYh6MMz+aPmaUF14kMa4pkSHm65wK3R
         VGd3Eo5riZrNFeGwQExMZCz11vji9H5+ah5Zobr52PCgRfrMsNkoMzEIi3Lx+w+k8n8R
         6gWyGmo7TGS4dWuuqKqbNXPjNDxZs8Z40BCI+bQAvCvctDNpUBD/df2/ddA+PaMfmBck
         Rv07R4vlufpsMQeGUiG+6+MEoVLoojgx5aqWqJy4rOebh4BUu1WgXefggowL5OSDB7lS
         tcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4L6LE8ktaz0dOCXgnCDHnv0IIw+yGdBizQsgg4SQBw0=;
        b=JgfyjDTBEqHOQR4XE4MHasgELwj2c4/AwhA4qmtqVLpLIpLvRm+ZbHifaE7JCv03tS
         TCs1rBFZtcDoPoJAm44mxgRT2rrNiWZLisQYXlm76X8vOCGt4gTUlLxK3lranSuw+22y
         VxdOVRMBIslWA5PpWHHPArot73Gw0MQig9SLWDgdwOKnX9vCVfqo5EM2p1pqOSFTY3mG
         d2pJIatxiuoi54EK5ILqOQFQRttrBNrt6DXJxi28vSBSVqCJIN6TDoAjNECZZK+/iYIv
         ig80nTlHulJ5U3276CIS2Ky29N+zWfwVbMNjewc27WtzCleiSsSoLyUH+9dtc2Dl+xdG
         ln/Q==
X-Gm-Message-State: AOAM531gliS5HzgBplNKrkYxmeoU08IszSa0+2O2ZtTwdcOj6KIWK0iN
        6b1i/8Luzvjy5eMeEXQyr4mJJQ==
X-Google-Smtp-Source: ABdhPJx9EhrKSE4MsvxYeX7dudoaWQkhNF849lFTZGJcfa+rkaIZMFmhnPjIVgji2r2qRlms8nAGbg==
X-Received: by 2002:aca:5f8a:: with SMTP id t132mr102862oib.72.1625852589984;
        Fri, 09 Jul 2021 10:43:09 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 100sm1263446otv.32.2021.07.09.10.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 10:43:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi S <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: soc: qcom: aoss: Add SC8180X and generic compatible
Date:   Fri,  9 Jul 2021 10:41:40 -0700
Message-Id: <20210709174142.1274554-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210709174142.1274554-1-bjorn.andersson@linaro.org>
References: <20210709174142.1274554-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a generic compatible for all versions of the AOSS QMP to the
binding, in order to allow a single implementation for them and then add
a specific compatible for the Qualcomm SC8180x platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Mention the generic compatible in $subject and message.

 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
index 783dc81b0f26..3747032311a4 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
@@ -18,10 +18,13 @@ power-domains.
 	Definition: must be one of:
 		    "qcom,sc7180-aoss-qmp"
 		    "qcom,sc7280-aoss-qmp"
+		    "qcom,sc8180x-aoss-qmp"
 		    "qcom,sdm845-aoss-qmp"
 		    "qcom,sm8150-aoss-qmp"
 		    "qcom,sm8250-aoss-qmp"
 		    "qcom,sm8350-aoss-qmp"
+		    and:
+		    "qcom,aoss-qmp"
 
 - reg:
 	Usage: required
@@ -70,7 +73,7 @@ The following example represents the AOSS side-channel message RAM and the
 mechanism exposing the power-domains, as found in SDM845.
 
   aoss_qmp: qmp@c300000 {
-	  compatible = "qcom,sdm845-aoss-qmp";
+	  compatible = "qcom,sdm845-aoss-qmp", "qcom,aoss-qmp";
 	  reg = <0x0c300000 0x100000>;
 	  interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
 	  mboxes = <&apss_shared 0>;
-- 
2.29.2

