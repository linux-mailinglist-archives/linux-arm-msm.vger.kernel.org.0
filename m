Return-Path: <linux-arm-msm+bounces-20772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBB88D1D35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FE28286E5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840DD16F0EF;
	Tue, 28 May 2024 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTb5wdh+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA86B16C68B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716903413; cv=none; b=NFFM5shcBCfDjm4uAM5ntyXqT58NHvx85yyZi4obl8aTgBwb7t3wEW4MJDlIryGADndg+Cn8/T15GSqDCYHtWTpHaVjoMaL0BuJVPOhJfL1i1sn5Vbm1CrqLYd1bHhXPzkVckVYivEYruUYbME7r3ZaJKkowmWmfN+xFQgjWXVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716903413; c=relaxed/simple;
	bh=LcFYy25T3EVBDfPNggp7aNeBJ3nKQigviyyutbZj/ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G30cmH3Gl6oRzD5a7g0fTR9t64SYJ3X28GzoHkQXNRhsvb+dUya232Yhr4Cd4DS6vM4nMwb6WvLAgwWdTLCxEDBJWtpdfwSy+5flpYrmYxKViuf7P7tE3lFKcyLXb96YFJbp7CyOP8yFsg7zHVekdSSMAHo3SxBoVN08XkeTodA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTb5wdh+; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e95a883101so9993891fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 06:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716903410; x=1717508210; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bYb7kOPdOLKl3Fm8ZrNzYyGK5OCoefcEw1BChMcgKI=;
        b=jTb5wdh+UozWoOAN2ihLdkippy6N+LSuKVLIEHeX+VCpGOvKfGJVcS6Jynj7C+qzeJ
         1RhUkhyEivROVups+94YyQDuSe0Nu2M/FevkmfKJDdT+65vWcaLc5PDa1+C3/uAaLV+T
         XGCbTOMGok//ADntUjcSAXSXgbWXUoZt6vI6UgW//DJQJXaz9Dvep+/cC32nqA5APs3H
         1BkUOD5wnBtTxqVqd12NAecmB/ra1atKhE44ouHItjXeKuL/Qoxa+XhzO1MxnMnDZ9hz
         QmVIo2Huar/A34v9IpUGGxJhKnOmz11ZwjbVRm2wsgImfdfdZKGbyGCAlGyWAcJskSbU
         w2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716903410; x=1717508210;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bYb7kOPdOLKl3Fm8ZrNzYyGK5OCoefcEw1BChMcgKI=;
        b=aelOo729a8F66Ch+C9LD9JaRYmmsZVXrrDpKsgDfB/uRXAO6BPoKHFueD4FuuquglV
         zL7HeXHFE6a8beA55M4eiLlKfGn7uKLcXx3cX6QURk0HcYQk1xdQgjD8KwbKPe0b5Kb5
         AO+0ax/nna6BypDr5JMLMPxPlGQB/f970aNxWsy9pX0SW06slFa5TFXzOh3N5BUeq7Xl
         lW6KJp/vhERpmvA8L2PixBT12HXVEN03XbSnqj/kJvFKDDOoZw1/CrMOC3z7R8KesdfD
         snFrncBkKq4l6ulTuPtYWa0PuRlqB1FER6T94NrTPEk8S9bCzJwa5n/lHiTX/1VzsXXR
         UDJA==
X-Gm-Message-State: AOJu0YxEsopyHQy+tQDeRSsrwn2tww75ZuP2CSkPiu8W09ez+FuuOiZ2
	XBJ8i8SeaD5Bc3df7P48Uyo1GOpcc63KteiARkVIGSC/IZgqjf9Ry1Dy7WkkpQs=
X-Google-Smtp-Source: AGHT+IHI1raF5XEZx6ugM9rq7xZ+1m35vsCAfIsmrZNbGvF40rrrsZfXEL0MmMw0rXWJdsHE/hDoKg==
X-Received: by 2002:a2e:8e95:0:b0:2e1:bb65:8306 with SMTP id 38308e7fff4ca-2e95b27ee28mr86320561fa.44.1716903409814;
        Tue, 28 May 2024 06:36:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcd8e4bsm22566981fa.41.2024.05.28.06.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 06:36:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 16:36:48 +0300
Subject: [PATCH v5] dt-bindings: ufs: qcom,ufs: drop source clock entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-msm8996-fix-ufs-v5-1-b475c341126e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAO/dVWYC/3XNQW7CMBAF0Ksgr+tqPBkndle9B+rCScZgqSTIh
 ogqyt0Z2EAVWP75+m9mVTgnLuprM6vMUyppHCTYj43q9mHYsU69ZIWABAheH8rBeV/rmC76HIu
 ODgLXPfWui0pWx8xS3cXtj+R9Kqcx/90fTOZ2fW9NRoM20LQW2TaE8P2bhpDHzzHv1A2b8Akw1
 RpAAWoLjXUd1mTdCqieAbcGKgEIQmjJSxGqFUAPgOAFQAIwm4Cujc42/h+wLMsVV2nY2nIBAAA
 =
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2765;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LcFYy25T3EVBDfPNggp7aNeBJ3nKQigviyyutbZj/ic=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVd3wjxYDqABMNJG8T5NY0H+WB1xmn+b7lcWY1
 UEH8pkv8xKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlXd8AAKCRCLPIo+Aiko
 1aZGCACuCYcdAXdlGAUU4r4RYvSftl/0cmcCSR3mhiLgGYLGBYCHqAvmzDoLvdh3vD/+sAc2qDd
 bjFixwJ3a5PrTL9W55wg2zRHdKuQaGfeRrfZr9Gb24wxCvUQoYuoNW7FcHJOWJT9aTJ/Wui77bx
 hufH5/z2e1vZsHNKmGAvbkJXJ/3tx2vJku+6wSFivZ+/XXs3ixTYFemkuNRjsZ3aYAqFfc2i78w
 NgScSWVF1N342XvdbTPf6y3pouTmC1nWv6Fztf5FJ6ydyRS7FqIgGv4J4hwKxkzy28NmFuPvPDY
 Hht6JhNGV0HZxSbieaaXLdCgv98mtPxzizVMYgv0+/nNLEQy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to mention and/or to touch in any way the intermediate
(source) clocks. Drop them from MSM8996 UFSHCD schema, making it follow
the example lead by all other platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Rebased on top of linux-next
- Dropped arm64 / DT patches applied by Bjorn
- Link to v4: https://lore.kernel.org/r/20240408-msm8996-fix-ufs-v4-0-ee1a28bf8579@linaro.org

Changes in v4:
- Rebased on top of linux-next to resolve conflict with UFS schema
  changes
- Link to v3: https://lore.kernel.org/r/20240218-msm8996-fix-ufs-v3-0-40aab49899a3@linaro.org

Changes in v3:
- dropped the patch conflicting with Yassine's patch that got accepted
- Cc stable on the UFS change (Manivannan)
- Fixed typos in the commit message (Manivannan)
- Link to v2: https://lore.kernel.org/r/20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org

Changes in v2:
- Dropped patches adding RX_SYMBOL_1_CLK, MSM8996 uses single lane
  (Krzysztof).
- Link to v1: https://lore.kernel.org/r/20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org
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
 

---
base-commit: 652f7c84aa3d99568e9e57d74b08cad927adba4e
change-id: 20240209-msm8996-fix-ufs-f80ae6d4d8cf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


