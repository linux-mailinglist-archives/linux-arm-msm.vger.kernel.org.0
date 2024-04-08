Return-Path: <linux-arm-msm+bounces-16715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A389B4DD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 02:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5A5EB20EC6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 00:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D2EEACD;
	Mon,  8 Apr 2024 00:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZ8KdP2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4616B65F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 00:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712534679; cv=none; b=lweqkQ7Gq6ybLv1kApWUCWbHfKZjb4lDQKYKLmErVOLOAbPLdHjVXgXchoQ12rdwTM7fw/Yg16vDvbm32f4PNOm8Gj+ezyQQ13udGfkP4Oht2cUtjIATo8abCWJ+hY6Wiz3RF6pT+jORiu7U0W/qsA/1YFgWHlLAXF+g2oOGHeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712534679; c=relaxed/simple;
	bh=ujbZGwCQVSFicv5U4QZnOYsJOvN6YgwCkXPaQJFXvlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E2lpqa7oAiauAvJCldCOCRoUk1KKgcFfE0bOQgkz0whk1rWYCzZlRRA+doCsGZ95odr9+x90JBR8vlB+TFWWn4+Im/5W0RqtqpiI7YLIuN4YtuLmSdK/z4z3GemP25ZwXI+bRWHX/UFas2HXVHYrpzdybBWDDOadMmRKSKObi/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BZ8KdP2x; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d8743ecebdso17732761fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 17:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712534676; x=1713139476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TppMUcMr2yR9W38oBDScEa1smGAMohoFGiEc810Rdso=;
        b=BZ8KdP2x47LaF0mTQXdQQzZTKIEcxS2u5ISO4k9c+JMuX/cwv94/xrKb0aLTIVoXef
         ZBVA9jNbfJOKxvOm5ch6mS17nbOqsJD1h0mue9TNEeOEJguPo8b2584cQ0mvTmsEloUZ
         6whbT4p+crZs3abhpqGLdDJ5oENyEmdxUIX26h7Oj9NLGxoLnAPpzPpSKeJlsV/x+F9V
         Z+mwMS3VEizAKR/68rYl+AfZLuszjofTNVMq3mC0ojSF3+s3gughk7E0FuI8ACefqVMW
         +GExZcVj1xGoP8iN0KNyjYNr7Ltj+OwEfDR3foVO8Y8FzNLws2eLQykQ6h6NfiecNSzU
         kz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712534676; x=1713139476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TppMUcMr2yR9W38oBDScEa1smGAMohoFGiEc810Rdso=;
        b=H28jil+mQrVsLIP/BgYi1q7aSyXGcxFIXtZxgSlkZVWxWwOJ9W16YsB1i/L/jnhO4B
         sJFsor/aGiYaeXy782g2YvMGRcNVhG03qMIfeQS++SR4U7tnqD+mMurEhfBtpCEpqlvb
         cvKtw9YoAuoCsqidfOrCmcOcnz8SropXXSsg8dur+erdz+E+dwEMDGZ5ecLSKDZgrRFo
         79WVmGeFrXLzj7L+lpgpuPisFvcakZjzHA2wqAWnSt3O2QHFdOIXPTwX31x785fui0f/
         03KOzpDbljZwpllPBbfLlFE2MNWmRIeUehY9qrz/oncfCS6tp8TSCVc4vLExQFiqsnZe
         jigA==
X-Gm-Message-State: AOJu0YwQYef/83li3wtPJkKUJsuq18aoS1B14q1oex+j3/4OGGAcx7z0
	u2oj/x5byA/8UuOX5B9M15Bk2hoK0z7yqFwjBcaiE4+VAN8T3/DwcMD4Nut/c2s=
X-Google-Smtp-Source: AGHT+IEgdX7SagcjwVcbNloa6iTiQ87oY/sJXKXIqyU+ATaBfwmgr/P6/KvV8I2jBX09PBLSujG4fg==
X-Received: by 2002:a2e:86c9:0:b0:2d8:63a2:50d2 with SMTP id n9-20020a2e86c9000000b002d863a250d2mr5580332ljj.6.1712534675849;
        Sun, 07 Apr 2024 17:04:35 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002d2191e20e1sm947077ljj.92.2024.04.07.17.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 17:04:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 03:04:33 +0300
Subject: [PATCH v4 3/4] dt-bindings: ufs: qcom,ufs: drop source clock
 entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-msm8996-fix-ufs-v4-3-ee1a28bf8579@linaro.org>
References: <20240408-msm8996-fix-ufs-v4-0-ee1a28bf8579@linaro.org>
In-Reply-To: <20240408-msm8996-fix-ufs-v4-0-ee1a28bf8579@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ujbZGwCQVSFicv5U4QZnOYsJOvN6YgwCkXPaQJFXvlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmEzSQH6Xu+f4sKTcOZgOBk88mBu3dwm8nIQgXZ
 KjzQz592N6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhM0kAAKCRCLPIo+Aiko
 1a/sCACqSzi0I0S/2zfYNr8MFZkwVzw/aGSqUhxhzw7U886308UpRqwsu9EfwToW4SfHKp5MG2I
 zqxOnQk+bqi+clAXD7z1ngxa+ZcfhSrWlReV2kAFwuvALByRm2NOAHxwyUs3JrWP/m783/ApoEE
 qYqcDdKq8qmroZMprGvpCL/DBUawWljMq9Lo/HxIVdd+BBJkKnQS+4LT1aafFaKPkDS6gQSH70Q
 3d0IuPMf3+G+oUBTSnFbM8bxQOW3x/D1B9eJlUlsl90PybL2roZ6jtQoZaPSBR9R9DmOmjVpSJs
 gBAFx/2JEOJdyF7pjJG3jvwPpy1I+IOE7BP2SxOH/Uce/5/W
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to mention and/or to touch in any way the intermediate
(source) clocks. Drop them from MSM8996 UFSHCD schema, making it follow
the example lead by all other platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index cd3680dc002f..25a5edeea164 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -46,11 +46,11 @@ properties:
 
   clocks:
     minItems: 7
-    maxItems: 11
+    maxItems: 9
 
   clock-names:
     minItems: 7
-    maxItems: 11
+    maxItems: 9
 
   dma-coherent: true
 
@@ -217,16 +217,14 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 11
-          maxItems: 11
+          minItems: 9
+          maxItems: 9
         clock-names:
           items:
-            - const: core_clk_src
             - const: core_clk
             - const: bus_clk
             - const: bus_aggr_clk
             - const: iface_clk
-            - const: core_clk_unipro_src
             - const: core_clk_unipro
             - const: core_clk_ice
             - const: ref_clk
@@ -287,7 +285,7 @@ allOf:
           maxItems: 2
         clocks:
           minItems: 7
-          maxItems: 11
+          maxItems: 9
 
 unevaluatedProperties: false
 

-- 
2.39.2


