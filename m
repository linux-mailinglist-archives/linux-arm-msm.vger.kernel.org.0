Return-Path: <linux-arm-msm+bounces-16915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C320289DC38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 16:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C92BB274FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 14:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2F912FF9A;
	Tue,  9 Apr 2024 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZztIbxbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFFF12FF65
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 14:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712672897; cv=none; b=bp5jdZ3MC33AzRzH4vJA5GlUn00fewqOQUuo+lzgCsSP+vYSqpD+eydxdMyBCUCjmh5YlAYy4a1AhNPtRGkZBMDTpuprea7rW7f1LdO+XXNhR8Dz/u5qywcCzhXcOqc9czvKQlyOIothErBh/xl7tixJkWgtPEpKLKCwqVMVeA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712672897; c=relaxed/simple;
	bh=TbTQFDkUrypej9KLx3hPuKqpyqPFSoUkCov9DpWTtn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdZTJt5fCT55x7m5Xm5ccUoPFUBh5OnSb/A1zZoFlSeLyF9gcpqVYPFmcZrqrYqOuAxcPgLrZdbjb7Mx7pCiuyOqtZmGcRf6gyQOKIc6Bv5O55O40xqkffNQh+seA8qpl3OYroBPtrzBdNWiM2QmQR7mHm+/VHh7h4PRoH0uLnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZztIbxbE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d3a470d5so5233946e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 07:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712672894; x=1713277694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkXYzFk7GPyWpkaw27Q+vOynSin5mr5h6aDeNoi3mHc=;
        b=ZztIbxbERIbc+mRWZT8Jz5chmY+EZ1iQG24hl4megeqXM7AR+hckPrplnrALk2EfSI
         i2NPpfzjlUzz9Ou1fYXh9LhwWprZmMIkTkRP8CdXjXQYCR4zjlM70tp6AV2S6+EFbxeF
         oAwz0U7vfo5DXztcC5mggHKU/GJQNV1iKB6q06LX2/k6/aKytl1kXgG1LsVLgadVeExQ
         S6SjUXNqHxCKwkItLtPzxafP6k+3ALiS47pqDtFXuS8JzHEW1FrlQSjRAADVNTGEzJSs
         tZt+ISXcImI/eHOU/fMgD9KBOPqUW9KYLaWTkhMBYvECgCq1AHzZ2o38RS7bx4KEa7aL
         +rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672894; x=1713277694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkXYzFk7GPyWpkaw27Q+vOynSin5mr5h6aDeNoi3mHc=;
        b=YtZSG3LGnlynhxxBl5ft9jucUt0a9BGFDzHoqMQsPyl9EC7oqbjKEP9ZojLjMhKwrO
         B1FSFcngJRD2tTFftrykbcvUDd99DZBWtMGE9YjHX1hnch97559Gx9tj+V85L8tgtUcC
         OjtxGXKvI3aKQRdosY0WX5Uubhe1SJe0XcciaaVUHaGX0kevf5r/TIpCiusLskJkLLEr
         xJXw8bbcOcWkqDzJz1XSjo65+LWeo/BeqSmOS3pmNj9QUYHDXAJSVAR1dDMdX4IjBc3U
         Oui0LKVusUDyu+BicAdTKldNwhnN9OACrFAH1uF0xVJhMhTVw7lAkGaKyqGUKV5acyRk
         BV1A==
X-Gm-Message-State: AOJu0YzctvO3fd9iULwnX//fysObORjrBIzQ6dSVqEPl5IKwMlkSRLLJ
	gkoxOHcgSZZU1d1oob1VhMjGBOj6wLzTTFpdjlfwUxSKwDXAgH4REEhkbXVl15+K2jqkH4ceVBE
	k
X-Google-Smtp-Source: AGHT+IFH9y7oqTEM/5eahdo6OL2FPV25IBfIds4+wHhIy3Oe3Rtk6gNkzuwYJ7GLjZlMZ3ymjTYSgg==
X-Received: by 2002:a05:6512:3106:b0:516:d30c:7236 with SMTP id n6-20020a056512310600b00516d30c7236mr9819529lfb.18.1712672893873;
        Tue, 09 Apr 2024 07:28:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020ac25ec9000000b00515d2ee5b38sm1556445lfq.48.2024.04.09.07.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:28:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Apr 2024 17:28:11 +0300
Subject: [PATCH v2 1/5] dt-bindings: soc: qcom: pmic-glink: allow
 orientation-gpios
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-hdk-orientation-gpios-v2-1-658efd993987@linaro.org>
References: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
In-Reply-To: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TbTQFDkUrypej9KLx3hPuKqpyqPFSoUkCov9DpWTtn4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmFVB7Mvm9gjI1SBnJ92XnYYhEfNT+koaGVbzQg
 CWI/LnkflGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhVQewAKCRCLPIo+Aiko
 1a3EB/wIqngfR7NxDF9yVy8dMLH54KAo3R+qOZHcOggDDukB++pUZvCoq3sDCReh4B/847czw46
 UDTlR9snER03Iv8HST6LPv2CJ1E4KeDyoKHCDVY5s2hWOJ8gQTqK0R5G/xq39Fk9lAX2mvUGAet
 aS9jcEDNxzKk3ygUyGKP0WqM6z4myL6/7eI/1jO1Nefciste3AdRQ1tKvKtTyE2DrylaiRxR50J
 WF78ne4mLqOyQWPlENTUXAGqD7iqzdzQFtdi3D2BLcQyzY4oL2oE27CmSUAMjxGY3Gi4OZUHFHI
 +y1xC0tksT29rBD2y9EmpvYNsEPuu4nG2HhOIcqjxv5CdAXA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The orientation GPIOs are not limited to sm8450/sm8550/x1e8000
platforms. Allow corresponding property to be used on all Qualcom
platforms.

Fixes: 65682407f8f4 ("dt-bindings: soc: qcom: qcom,pmic-glink: add a gpio used to determine the Type-C port plug orientation")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml      | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 4310bae6c58e..4512390f90f0 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -58,20 +58,6 @@ patternProperties:
 required:
   - compatible
 
-allOf:
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              enum:
-                - qcom,sm8450-pmic-glink
-                - qcom,sm8550-pmic-glink
-                - qcom,x1e80100-pmic-glink
-    then:
-      properties:
-        orientation-gpios: false
-
 additionalProperties: false
 
 examples:

-- 
2.39.2


