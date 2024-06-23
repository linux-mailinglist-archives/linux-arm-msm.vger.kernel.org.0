Return-Path: <linux-arm-msm+bounces-23786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 069EA913DEF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 22:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292511C20D27
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 20:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DBD186E21;
	Sun, 23 Jun 2024 20:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkSmZ0oy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDC9185E76
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 20:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719173014; cv=none; b=b7JeEq4DqJKqaO12bPt7m5N3ASbOansv845foN2hCpJTy65U5nWBaU1VluYp13PPUil7f3pKc7JinARTQXfF9hvJfAH1+G5YsvTpfWmFQH8vF9Xv30sNaXHw3YFdcm+jQ00u3PsnrNJYQ9iXJSQLkYWdhPHTlwzRByrM1m3hgLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719173014; c=relaxed/simple;
	bh=uYQQZshlwOKHfwbC3/MKr6ThTNfJ0nfXfyifQvYX5aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mPxAI5ayxWNqcR7pw6X27jxfx+Zdc1V2HqdsdSQnLpF8R7/usZOz2JW10kcudRPVcTJxdrTu5LqSU0KlW52nsxTjw0lRnUGFXJTP73tLLTdoXREra3F+Ip2xT4nUowf0t0W2Rt2VKx2LVlnQOzil/HfUr/vecm4E5WqKNGu8Xc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nkSmZ0oy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42172ed3597so21036505e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 13:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719173011; x=1719777811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ow/UhD/hlWMO1wQnP7yw4KEZ9Zhh7chAKMjsQ2L54M=;
        b=nkSmZ0oyXO8mlQyHxhT6RnBu2203ZHg2TZjOVe7UeIFH1BfRHHDeML/DPDiFL1cIpk
         qC/oLUY6HTsCrjGSpps1qnH0ryk1JXUDrbhzbGWG5zusBOYsW66/pSp9yBgubKiV71jY
         9XBcqn1Gn+TzmSPCwdOXrgFaFKhUjYeqoKoczxrhl6Q5C+qw1DDvJRGey5cYnyZpn2an
         Y+nfjkhHHn3V7n8jlbl04bjS1k+7f9pFAETNNajXyq+Gm8uBA8xHuD7f7gIWOWBXg+AI
         oIS2nqVLgi1sbdOmM7dh/WnHyv77EWyD8Ax89mjHJ5opCGgtlNk1/KrOPfdy3eeOw3CR
         p2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719173011; x=1719777811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ow/UhD/hlWMO1wQnP7yw4KEZ9Zhh7chAKMjsQ2L54M=;
        b=hf9YabzEgwOB25jktGqdTtVPHcAZ8RszBbhnx5Ts2fBgW1NE1e/GSm7+qqgxQLbBGE
         cbZQmpOt2vP6XgDSA1b3x6uY39UtaP5x5AqrBp3yZnYPBW9iw52bvzHSncktfzzf7xlm
         6Tv/W6mrcp0nAdWSuKJWwjNV8QT5Dreno9g6RkN7Ftn9MhvOd+idhI9uiouw43vggjQn
         3xB+l6CzLJuoWNvNUWpC3DVG2v1Ov4nUypSmjKGlaSYnNa3pDueEamj8+RALjogqgtG/
         cD9QmEEAOSM+S9NaPpWiKIcGJtEAnETlbHLyWkDSiOE/rKMFAotakkJBXy+SiTZskgbH
         rL/A==
X-Gm-Message-State: AOJu0Yz5ZYam048YjzFWi9tE65wz/aKYc2bsnPz+vQshexBTwekGlV6B
	WncIpdlC/upXWUKta1aAL6HZHnWVsdLIjj0lFdZeST7Iq4xp4D1K/c9Y3DFfigg=
X-Google-Smtp-Source: AGHT+IHrrG07tlhKq0T0Q79qbLjtMFRHlvGdVpaV7mYi8SG2IESOG+UD+fskJ99LX6kwwDcvImU8NA==
X-Received: by 2002:a05:600c:511a:b0:421:b906:8088 with SMTP id 5b1f17b1804b1-4248932858fmr38166325e9.0.1719173011286;
        Sun, 23 Jun 2024 13:03:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54c9sm150685345e9.27.2024.06.23.13.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 13:03:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 23 Jun 2024 22:03:03 +0200
Subject: [PATCH v2 4/4] dt-bindings: display/msm/gpu: fix the schema being
 not applied
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-qcom-adreno-dts-bindings-driver-v2-4-9496410de992@linaro.org>
References: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
In-Reply-To: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uYQQZshlwOKHfwbC3/MKr6ThTNfJ0nfXfyifQvYX5aw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmeH+JCn5CmF8odDAYUWyh3ZfkGfRdXyfcRPrJC
 IUygQKvOO+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnh/iQAKCRDBN2bmhouD
 1+3WD/44hZ2+Ejzsx7aMXg7D/6Ygl8Izp702yxIeltA13k0IeWn+kA+5s2BTVil3rTgt/eg87Ow
 pNEQEF2kPTwsKyWTK0Bwbx7IK3JSLwM3aO2Uj1616luFBxWM9iVZwbuzBB+QTZi9EkOA2kLNKqb
 cbaBPJnQanCj2mWNljqDNzqTdKI7jQz//kb3+lwgiyUUQAdlyJ8ADEWhIyzi7UMdJ/zxtPkOkM5
 o5HLek/GG/EHEUbmwfDVCbf5pY8hvvSN+67LfWH4bVhHuwWohjw9HyJZtKgsYGML1sgywvSxW9v
 pNp+lTs5c9YNRSZthyT/h3WaAM/l/8Jtn9jappiCgUVs9GZr3A8O2wt+8d7HhSWZC9d17JCVzVp
 Uop25wBsZd/YFGz8kpUcbhfkWl+1Sv4th0n+VRnKamr2a0s8sxRssNagsSIeqb89dUgxhDexXbA
 zeNwrh9uuRvimJXbSgDGsYEYUo1ElgfTAz+pMCwNEliycnK3lhhIVswP4dIIT4iAKHHO/CLldnn
 pO5RPMxBKYpHl5w9i+Y2uEG1JM7h/5AxcWKzmfhY4pnSrEBqnhcjS0YShfrTBOzjmXZebLKO3qR
 jmrwZayAczdOZrTwDuHNN7p4irlhLZqBNytEjqQJVghirPOHu/Erx6xpbOtHu7zanf/Q9sP8Xss
 vcRgKjFhttepKyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

dtschema v2024.4, v2024.5 and maybe earlier do not select device nodes for
given binding validation if the schema contains compatible list with
pattern and a const fallback.  This leads to binding being a no-op - not
being applied at all.  Issue should be fixed in the dtschema but for now
add a work-around do the binding can be used against DTS validation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This will uncover issues with DTS, which is expected and fixed in:
1. Incorrect AMD compatible:
   https://lore.kernel.org/linux-arm-msm/20240623193420.333735-1-krzysztof.kozlowski@linaro.org/T/#t

2. alwayson clock:
   https://lore.kernel.org/linux-arm-msm/20240121194221.13513-6-a39.skl@gmail.com/
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 03aaced1abda..6ddc72fd85b0 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -10,6 +10,18 @@ title: Adreno or Snapdragon GPUs
 maintainers:
   - Rob Clark <robdclark@gmail.com>
 
+# dtschema does not select nodes based on pattern+const, so add custom select
+# as a work-around:
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,adreno
+          - amd,imageon
+  required:
+    - compatible
+
 properties:
   compatible:
     oneOf:

-- 
2.43.0


