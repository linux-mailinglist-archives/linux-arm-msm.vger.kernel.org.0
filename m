Return-Path: <linux-arm-msm+bounces-47383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8A0A2E7C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A907118872D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 09:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319CC1C4A06;
	Mon, 10 Feb 2025 09:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MLZqfyCL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2A01C173C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179972; cv=none; b=QMM1i4g4Lsxk/fehENWqUz15N2FZ1bvoAFznpteNuOVmUtKDAw+Mdx4Ln/MEFvdXBBsdVAZX/QpUSSYG+A87nr0bm2ium/09NRBqA0MSW9l28ZWh6HWni5Ww/WanmJS7y5KeEIgPJyP7Xt9xm/6nTbJ1wsdQ+b5H2sWFnl+0Rcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179972; c=relaxed/simple;
	bh=6FKLI8BR9LrbuUjWiYTQpzeLNsesqx1ffA2+NHG9+q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQxcEh3rJ1twYHnmRf3u8e71/+ic6h4nHaGUnfnBegzY7ZaU6mZsZHYoCaqjXaCtWj7yfEGrBhK7YGwRJx3PK613/wMl1snkDXfcI0bOvXlWF/fjmjnaSlvzm8euEdSLt1dEQoOd9CmE6uxAHV1Zi+Bw6oR/yqVqNifW5eJhY9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MLZqfyCL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so5911305e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 01:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179968; x=1739784768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7Mf7/b8tRR9xW5dgasegab0Mde3i6bGZYAhw62oPdc=;
        b=MLZqfyCLbOVk/QhNXdz7HQGceWi5lxWeh6jkMdwCm8XZBBZ5drN1va6gKvgQxU6f0e
         mpIh87CIpPpj4SbkGFmbuijys218/rrg3bTfqbOWYvmi7LAKqTo8zfV9aMjs7l+IelZl
         bGw7LWKYNk3bdt8MEbWS9OenYS0UKevdm79oDWZLcJTfkrrHPZb5z6A62lvdZx0XCtao
         5olfcfRFVMmRILCPgJNb8Sc4pyzukpPnSC731cvq7uhy8xYnGqHHhfgHPHOekPT2cuD+
         BZmX8hu7H/jJJ23O+bmo5UXLUqzQBFbRz0rtawKNT7hxpcbFmVB8GFLYo+Oj5YOdxRgu
         2hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179968; x=1739784768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7Mf7/b8tRR9xW5dgasegab0Mde3i6bGZYAhw62oPdc=;
        b=bohZTrJV3teuotKm7UNVEj9P+sIpkzPVDp3OdWOTe0P5u3aXAJadf3lbZjXxiYykEY
         4rQIZaK4pdiF9jjxHqaCUGZHKOz+2kE03VL+023TjztcgIaI1/nXqUdEDLsoVF0DgJtS
         9tqhEQ2rdA4NphSDlHgs2hW7VtasfoSdAdItlQSh9L0b1+jnLNMX/V4msv5FT8ogPnDl
         0LThRmhA9RuouF4fzhqXUwFkPiqePJLqJPkGyq/UiqTl8DGqgOsqJCiw6CPTAOy1wJ7R
         pykSZqVDDC8KUykgNdn3p6HYZt41UM6jJZQ9WsdNyJVOyCErBbdZCMa8m/wvgrQ5/RXB
         cI0g==
X-Gm-Message-State: AOJu0YwP3wCuiqONn++fXZDno4BHYa6jmsKI0Xtt2YLwViTRApZlY4/I
	J7o9VBh28UmMYLLZyb9I3iNYPHS5+9ocY2w/gmdKf8FMeD/JroardkLh7NauReU=
X-Gm-Gg: ASbGncuEW8eWD9ErIlh7OPbfN3GEOpTOjnETPKaQlxVmDtZ5VtF6DahwGw0Eti+QFKZ
	wQxYLWXDkOzw3Pwia1khEMJfprN53MOKYaNHt8535r015ihzWTZ44Bl007KOFshVhEOAV/uggFi
	lTsyEF6bj9GdzIYpmuBQXW/TREziIj28gYYIaC48Aq7d6UYY12+u3ixVNJs7hf2cR/PRfInJlG8
	/91sok75tINaGKVIgsZYU6HTwDJO2tg+EgD+gvyDRN89tBohitWuPknSALZRYtosHT+FLd/scFw
	hzPnVg9em3EOgMiGoxiHDdpIOPP77TlMHvBa
X-Google-Smtp-Source: AGHT+IFTndcSWfI5oaRE/Yk4AmwYCk2TTxoLS17TnO045AWTTpQhU8hrDcvXFUIacIha8y9Rh24cjw==
X-Received: by 2002:a05:600c:1f81:b0:434:f767:68ea with SMTP id 5b1f17b1804b1-4392497dbdbmr113510775e9.5.1739179968306;
        Mon, 10 Feb 2025 01:32:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:32:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 10 Feb 2025 10:32:39 +0100
Subject: [PATCH v3 1/4] dt-bindings: display: qcom,sm8550-mdss: explicitly
 document mdp0-mem and cpu-cfg interconnect paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-1-54c96a9d2b7f@linaro.org>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6FKLI8BR9LrbuUjWiYTQpzeLNsesqx1ffA2+NHG9+q0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce8QdvaOHqukMQloNHxUMY3QOwnJoaYNNprKn8N
 iY0JjaiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHvAAKCRB33NvayMhJ0awED/
 4xRW3wc2J0soAkiPwhFBNDsJS+LFpMnO+8t6ChgyXGIyn08CvVELsbOi+xAcxvvwRDbVHnmxioHgqe
 DhNQ5BRTTwzEIHmxPG7/zc4C60SYZX9RvFfbRaVdQqjuto4OWub6YRQXL9pAqFvvh+542UdwssFL9i
 RRf42lG6RQzryiDSXipivC3g4/xiwVdUx3tRkFR5prIYNb8I/4hIPYNnv+EoXqtCJySmZZunDFePRL
 9V782oINlu0BjFzGfNiXPeVoxbHMVwvnMXUYGJKF7EGpHyur4GUvITQu/Nz4jKfPXo5E3gWMm11ENe
 ZJrOaNTo+k7YLqyzpuxrtWGtVRhqAqtdFVywFRG8Z486z376yI58tPCmnGzwBHmKmMWUJcIcpVnG/e
 7hNiHuDxIi2vfPv741Csxh/X7aZknzhet5lcWsQ/YhZmiH4LlQUb/fgN2t06ejihgBVKZ0LR22rzFC
 HCBv2pJpJgsTzmWNI+6NpHZz0D2DMWX4ZsG9WBRrdPGa6DPjbR2QCZDcozpnwrR0F7uSHLceZmmzf4
 uQFkynLNOZnGqI23oHoIChySVi6XcrFNnBIz591bTB0lPPLVMlSM7zLuoiEzKZeFbvqqLVU0JStL1f
 oT73IMjDltqsvzNqU+NAA42pAHtC9lzaufAcGosCpfBbzDnaf9Ao/0KkRoHg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The mdp1-mem is not supported on the SM8550 SoCs, and having maxItems=2
makes the bindings not clear if mdp0-mem/mdp1-mem or mdp0-mem/cpu-cfg is
required, so explicitly document the mdp0-mem/cpu-cfg interconnect and
add the cpu-cfg path in the example.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml  | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 1ea50a2c7c8e9f420125ad30a80b4ebd05c9367a..59192c59ddb9c126ada43ada1430fa7569651f99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -30,10 +30,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 2
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -91,9 +95,9 @@ examples:
         reg = <0x0ae00000 0x1000>;
         reg-names = "mdss";
 
-        interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
-                        <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
-        interconnect-names = "mdp0-mem", "mdp1-mem";
+        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
+                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
 
         resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 

-- 
2.34.1


