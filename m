Return-Path: <linux-arm-msm+bounces-47918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AFDA34A6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33C733A3F1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386E726E140;
	Thu, 13 Feb 2025 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7LwYRK+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E00269885
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464090; cv=none; b=WmOMmH46bGpyaFJ/9S2WW1RhwZ1CL1OsTr0CQsS1p8ihLRjQ2YLP4BornmHzC7NQkKL76HnSJWHjaV2/eCrsNIc0bRuZmf5HzjokAFbK8kJbJNT5/1TJBZ9wYoWxzVZJPkGfG+1JC2jVvlAx239qxemf+ip2v7nDfRnIiaP3WWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464090; c=relaxed/simple;
	bh=my+RB9Jrip9aPGRvZHAD/1/UpXRs0+h6VzBYQ3PsJO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tg5X1IPqZHE0aeAh5h+oiewXYWCorRH/4DNkiPtGrWdeVbcM2C6WI3k9DnVCDBtpQVXmbTwEMPjGRw6bUSuVIDkg0Rp4/PGWdzCRiz32r5EVAAHKCX0WAPYATeU4f2VhDV5Jqa3dDYm6oLN9MtybX+l+6S+mOYFgcFH4Y6wjyHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w7LwYRK+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38ddfee3ba9so862971f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 08:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739464086; x=1740068886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDc93kMEYWIE43KW8M1DQx0zrLSt7yqt1TtwJm30k9Y=;
        b=w7LwYRK+uXZAOyPIid0n7u7N1ejfpPwANfXf9ElIZF6rZS31Mr48Ep0y75Oa0owNRF
         hP1ecq7c2iAKEphQOilQGgI9nGtOWGIdhnUlIr6uKMUU7YvjQUdh6V6GjZ5Owji8j/gl
         bhtYLJyGo9sFieE7pn++2gciuoadPAK6SBk7cL7v3uHjiMtQp8r5kmv7pKYkp/uN8tF5
         /N63LIf7NZ4dpi/kteZplOpxD5pMc7xSgMU3eagZprbLjrDjNbPsZ778mM4NJ9nPZycz
         y9DKDWTb2dKoUdb/95LQ7Acu5hd9OzZRJGIEhgovNXl+ceOXkusQr3dkH+xXP4VL15td
         E4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739464086; x=1740068886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDc93kMEYWIE43KW8M1DQx0zrLSt7yqt1TtwJm30k9Y=;
        b=Qz6gM8UCmZUQBSc03P9ZZypWk4vc+WPRCL90KZSfXjttwQ3pp7pf/USLHURdzGNCb1
         cjlNsV8evvX4NL4bgK0YmVFdz0CZXk7J0JZz6zPVMzLUXs0PnAuAczITA4yq0kQBWmMX
         Lf4QMR9nZdGxV1OQkrXNtv1eZAjDQ18Wti/8XmMFXiKfeCN2LQcN+kOGuiaQQZnwlqbr
         O9sTmuDem5FuGSL/A8+Vv24SfWKEpde8D9Cq6HxEK2ytjUqJjThDeg7+YrbcSEF13oP5
         Ks1xmR0qHb8+oE05v2YVJQIhZz8hnXYD0Jmbwub/wDInS9GUGzu02Kn9b16U3rGjJO8L
         O6lA==
X-Gm-Message-State: AOJu0Yz7zm8/46vLb9TMbXxT/DzsoSLjwhkYrnMHyPdpWNnEcwgz1Dly
	dnS4dko7QljvbQ29Fgb3qlfWoOA9nn5l22csSX9bqOIy9BzjXJq0c/S4Cy+cJo0=
X-Gm-Gg: ASbGncvtS4rT9o0bgOXDOSduFARKEhEnIraVWfkU8ehbfmJ+sS3hzXv8zX2u2pRwYX6
	vGUNtQzYwLnBouT43CTFUXRFPfWTWmKMY5k+5T3VRQWAiyk90hZYbTeafk3ZzBVrnr3lrLRkB0u
	DlVkjvlNuwLZF7r11wPiLjhobFQ+HcZr1TLaRqigNyAsU7rHI86zgjeb1n32gns5bw1YzxmtwNy
	7ZMsvWuxHoQZBf75to8EUobVpvR1PpZBt77tR1iDZP+N+xIIgVndKkeBjmU6UT0Yj0GbZ2OkPYk
	8mCywrTcyO5FWyxIJsGwWF0xnV917xuakFgO
X-Google-Smtp-Source: AGHT+IFU/9Ezw9WpHOEwKFHI3agr//zJrArAr/XSAw2dHqAeOMUzEQHlgonTqcBFZjTTclKxtAjURw==
X-Received: by 2002:a05:6000:186d:b0:38d:dffc:c134 with SMTP id ffacd0b85a97d-38dea2eb4bfmr8227417f8f.39.1739464085999;
        Thu, 13 Feb 2025 08:28:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b412esm2274382f8f.1.2025.02.13.08.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 08:28:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 13 Feb 2025 17:27:59 +0100
Subject: [PATCH v4 4/4] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-4-3fa0bc42dd38@linaro.org>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1271;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=my+RB9Jrip9aPGRvZHAD/1/UpXRs0+h6VzBYQ3PsJO4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnrh2RyIwuxEyQJnCqN4BQzwBgsz22oIe5p3/foBpN
 3ycZJKeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ64dkQAKCRB33NvayMhJ0Z4JD/
 9QWqppUyEnVCwdINgX9VFB0i8zoyuyZeu6IuDCoC9ZEqWoOs8NkpPN3ASdQr13S8PSIYLl377Y1oyp
 5eeA6/WQAaEysK6t2aXfsQ3/ReD0a5Ac3DdRrNmleh6ZlEeaU0+AmQIoTygKbsAwZPRni9ZA9K98fl
 /NQ8weA+fwoAs+dY4XyM1Mh3m1kA/oq27fC/jiAe8K4S3OS2WaLDRZ3B0SmJMkY82b2fjv73YjqBRV
 3htFOiOZTllEcFeMvAT7w+fE13umvRgT/kXrTsnd36VAvyDaZFltGUz6ymHB4kJVzytzc0UwLEMDmL
 E4z5cc4mtjo6iEE2Xlc0uY3OQz9pQ/Ni6m4RckyzTQ2ZackPXKh8WuINx/IwLSGFtY4K6i7OgB+YlV
 49QaGlZgn4Ns7+BI/r8wuaAZHnijxZ17M1a0871JFon21oS/3XOfIDj+PIqVQH9bWGnV1erkdHce7R
 XJK8ffMPB/BQitgVl+Mm3J4mGbVgoTgfO9yjSi3fsoejYJGmspR9wnA5mDszU6zgeLiqYpeOD+hPSy
 hlcMhtnhos8K5RDwdhWfZ7yj/fYr9K4Rv5hxb8jbgxyLbaBMVqXVI6MgSA1Ya5MJnGDI/7uioYE4wW
 GTZlXhTPjsoFcf9wfs4Ga5/nJ/HJjdfx/ymjSsOzPSybrYUrT5wB+dYZxK6w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
add the missing cpu-cfg path to fix the dtbs check error.

Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 483ae63e6032823e8cc13e8aeb6db70e3948f02d..1737265d364601494c329e79174c082c98e4d0ec 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3997,8 +3997,11 @@ mdss: display-subsystem@ae00000 {
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mdp0-mem";
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 

-- 
2.34.1


