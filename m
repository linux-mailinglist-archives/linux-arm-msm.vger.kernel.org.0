Return-Path: <linux-arm-msm+bounces-10409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD6A84FF29
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DB0A1F223B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8BDD294;
	Fri,  9 Feb 2024 21:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B77Kr5br"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E367F107AA
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707515438; cv=none; b=NaDMtVWjRMfzDwmbUmK9in5ssMyK2Ax8ts3vXOfM6VtdNaZiXREGaLpp8sI/84vgflGSejO69IkvOPVmitGlB7m1mNIDt2xQ1GAB0xGuiGZk90T9lPg0rUiu2VTmY53tSlZ6vHDjPNCzbqyNvxDKExjohIS7LevWOZTyEvgYfOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707515438; c=relaxed/simple;
	bh=zXQTB0UTbLqKL0nxwT+xbYvoKu354PiK4225HNhdxm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KYs9s0/zLFY7oUDRR30krZmNQyOAxTmXvchqBur9g3rB2QE3yzx0XhTHM+1LbLsaNpOKy9Zk53V4O7V/vNcJLFCKskA/eO7DayvgDhDkQiDEGl3iBW0hHnMJuW2SPdep2IYZ3u4gH3aQserzC+z0puF1ZRhGvhRcsHJ/xCgJxM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B77Kr5br; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d09bdddfc9so16444101fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707515435; x=1708120235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sfbHX5QAyUBZOUDcGHw44glG2jhZqLX/qM5eWSG9kw=;
        b=B77Kr5br0RC/jfhNyssAgxL2Z7nVNC2i/5+PcwizRKJKYpYeij6iEOtCqw0WLAWXWH
         cUvnWpvy46NuUWKX1BEHQNFgauQlBFjqu8g2qHFVfzzc/TVX5ul4tR+Ka8lFHgpnjt4s
         FdOKH7+aLln5JddIVRpZzkPI9zhMao7sNVNKPmnIX4LgD91dZNidvcy5uRYNyukmw8QN
         su7iU7IaDtka+d3hQEm6AWU45mC9VlqJx8n/3jOZz7jv9Wp0nVyWJcd96R5GysVitOxt
         GfaS5wXXwyKEllToAw1g2k5oXHiDIW+MeMhZSHzS1LvLILxIzg2WmrBYHGPe5qKP6kX8
         +bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707515435; x=1708120235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sfbHX5QAyUBZOUDcGHw44glG2jhZqLX/qM5eWSG9kw=;
        b=K8agMXuqG46diEWP4bSYRB+z4zcOM2J5Qh+0ZER82FkykxGB5VISvFQmMjS9h64hjr
         doBmgFtnUaNKzeOpkEyfpYxpar3P2n1aiosDyGyIkByZAzLElrl6lo7RFDizc4qPSdFi
         V3k8AzvG515HThW8rwYRnCqVt3m4QouDZtZXa1p+zcRiA9IRWnsOntOMjbiFAZeJQ+0E
         utIAo2MBbKYH2TKK5YxjuMHL7vIYwsDDI6c/Ox2YMblDF3F/YwvlNR7jhut2IPubyuJ7
         c3rN6JBSiyMnc4VO+QqU+sax2vBFZSynlAoGJjTj9TLHIkESnpyH+js6UsEPBCkvhZRK
         elvg==
X-Gm-Message-State: AOJu0YwWc52pkeQD6F0nVta4DcRFrxJk50UcR82JuRK6wyevLwGJJ7N0
	4bOcJEWx+acGZekUfN+Giur14NgxtvjWmiJQA3bIBB63CfcvH2paN1hMNUwFRnc=
X-Google-Smtp-Source: AGHT+IG9Z8g0DPyp7EVYupXf/1ancgNAdrRrmH8adceFQRG8TYM0Ce9q6b0PIVHzmjWhIOmTDQfaew==
X-Received: by 2002:a2e:87cb:0:b0:2d0:dfa7:8a87 with SMTP id v11-20020a2e87cb000000b002d0dfa78a87mr180106ljj.8.1707515434943;
        Fri, 09 Feb 2024 13:50:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsHbHPIyAqmzStAXa3zlKh9046xx0UWO24AgG3d2Ae/5CvzBucYjMcAD0UC5in7vJAQnqKYGUhY9GKDm40LLnUCF0PFA9W4ijayoAZCea5/JjypHrNdkZhQ9rR5cro8NWwxio+ec8kdcIAUXWXicrj5BqCFn9Fiyk2hxWg0EYxJfowxKDp2A2KYS2vOLcWqcZjyhZHm4rubviNtZn1Xhb5hszAH4JIi538SzrV/4DMYhHymATxUMOJP5dJqJ8JlkwIIC8/jwEVGy3NOML47cUV4WTmm2GS26k6I5XXgtVUsU58kWljKm5WWCCNkUlslA9kwutRf2O08LJifp7oaikXXZBVCSl6rEUyGX8eO6MWAzYtar/d57DP6C2k9GhSGSc48SQjyc94MEeM1xk1qsE+ob6vLmuTKlyc1NUFHK2dV1i6iqrHNlJUBGOy0yVuS4LhOvLRWJDr5tkfD3PCOKMuDIZ5G/qO445UksBlH/HD2fvRVj3VtpqNFdbqW1OqDnBdklOjiqX1D0Gqk2NH7u0dOONPFu9h0Rggq+LajrYxwZYPPmR+cvkmAc8XYCIJiwzkHTPbi7CafD7Rykouw/9fRIctOsn4Oog=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t1-20020a2e2d01000000b002d0ac71862csm391162ljt.9.2024.02.09.13.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:50:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 09 Feb 2024 23:50:31 +0200
Subject: [PATCH 1/8] dt-bindings: ufs: qcom,ufs: add second RX lane on
 MSM8996 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240209-msm8996-fix-ufs-v1-1-107b52e57420@linaro.org>
References: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
In-Reply-To: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zXQTB0UTbLqKL0nxwT+xbYvoKu354PiK4225HNhdxm8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxp4ndlknkuTjzr3YIUwDh2PR22rrOETju3Aes
 xxGv6YOUdGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcaeJwAKCRCLPIo+Aiko
 1f3yB/42hjMD4zHwA5aBzdnkKQvx+zi1nWnB61HhTZp/FugvwIPPdsPLpLz8BIaZKjmTsUhVvmC
 Jfhr2ctqhCPbiRB1JJ6UEYTD9WIWLlaDCM6pEtRxqu0wc0HFUZaoYpbA6KR0SAOTI0ENv93WQpM
 ixbdwIAUM2JIVTBVXHBcYAOZgZYJ5bQnj9ySI7C347lsi7Svjy/niwTzFCIjdNRguf15DLmbOAl
 q2o9eP22t/AR/gdSlbJPXk0hKsZwlW+2CFQvj+3k6+RPn5XV2uagTaIjFnHC3HoFrZ5STpkcGAm
 FKaKmmaMwoqntvRNPs6BjP44Wexd8qSgTvo3647WzqvqLmMR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Describe the second RX lane used by the UFS controller on MSM8996
platform.

Fixes: 462c5c0aa798 ("dt-bindings: ufs: qcom,ufs: convert to dtschema")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 10c146424baa..f1de3244b473 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -43,11 +43,11 @@ properties:
 
   clocks:
     minItems: 8
-    maxItems: 11
+    maxItems: 12
 
   clock-names:
     minItems: 8
-    maxItems: 11
+    maxItems: 12
 
   dma-coherent: true
 
@@ -188,8 +188,8 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 11
-          maxItems: 11
+          minItems: 12
+          maxItems: 12
         clock-names:
           items:
             - const: core_clk_src
@@ -203,6 +203,7 @@ allOf:
             - const: ref_clk
             - const: tx_lane0_sync_clk
             - const: rx_lane0_sync_clk
+            - const: rx_lane1_sync_clk
         reg:
           minItems: 1
           maxItems: 1
@@ -257,7 +258,7 @@ allOf:
           maxItems: 2
         clocks:
           minItems: 8
-          maxItems: 11
+          maxItems: 12
 
 unevaluatedProperties: false
 

-- 
2.39.2


