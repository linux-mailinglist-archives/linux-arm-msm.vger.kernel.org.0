Return-Path: <linux-arm-msm+bounces-47290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8385AA2DB32
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 06:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE2B11887D65
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 05:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA371B6D14;
	Sun,  9 Feb 2025 05:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aPzqkLMW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CD51474B8
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 05:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077648; cv=none; b=VIrJfvNgrSTg14zOWcslg0cH9AOv9Qt29JOSVD92DpsBo8376uqzoEEntk5ENG+tFX+Dw8/XdoLKYLw792oyHHUW2TuKtz3D74Z9EaC2hXu1PC+TZMryuTRNcnH+Q2/6g9fmepfDcK4QJOUYsZMbv40gYisknABxqXkv3XbUjwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077648; c=relaxed/simple;
	bh=rBkvGR/qHrfxPlnsg0QzXfiNTIC9RTO2ROzJ5dKz7zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2FEcpEP8UQrQlWxFHXrrdSK/n5DmdXIfoYYoqrYnUsCisvNAY+FXHw1W2RO35VeuUeiuhW05oFEQ/+Fznz4alN71bTl45UIght0CE2UCd7GeHwFfi73/FZcWFcI059P1BbnbAE36KQ24wi789xTP1qPtDigZbZnoxBviI62hlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aPzqkLMW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54505191cdcso894896e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 21:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077644; x=1739682444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfNMfzUAvdO5axXrtOPa21BH0I19Ed6M3V+EZ2kcNQY=;
        b=aPzqkLMWbFX+7NFvOmEk2laOqFOFfeDjqCedQUpe2La/Ysrc9V08RAhrJ8NY22NYbV
         lgUrp8qss3uZjh2Pqgk+Oni9M7/s6l52Yji1bRmkgP/vTYUtbUJrNl/oPaL+nKlv1Iut
         1S92mWsas8hjc2FZpstSHE+iBzKXQiD1WrySs5pavDGsnH0ThULdY76s34TNG9bJzPNd
         pU1rs0KhY2CTNTVnQMi4kfOcVKk3cY3/niA8QB0s8lRXxoT/5Ug+NXJ08QzWDgDnRJFU
         zsTUeJqjIic7OxzKq5KdvHwE+7vye+DU4K02KbGZsKopWZuituIy/8fK/fdei9NNR1PO
         Tuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077644; x=1739682444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfNMfzUAvdO5axXrtOPa21BH0I19Ed6M3V+EZ2kcNQY=;
        b=d00U5VnG6AEx4P13ZfWZUDQKp8vBz9RZb5dGFbAkIMUHq1CukJZbYS+7xPVCEWowsi
         9vOHUAQW27BhIO0ZKbG5Sy64FLULwe0hGNNAua5cvR60tRbcJstE7NTZOn6Nvd5QYEBI
         cUHVZH+F/VfS11/FrhDN5FE8k6XWP7wj3qenYpr4TwBvAJhOw0ZVpywd0XH7C1hljhMg
         nGzsegbtUzfdUd1Z08U3g+xmCAwlFfqy6MElmFexrKqEcoCLwMXxjQoWaijvs2AIzOg+
         64vAjK05p9YrUS1Jbqr7emX3ytjfNvw8hYvjVBIKTUSxpObMwFpY/Hm6FbSsaE9gT4rr
         Niog==
X-Gm-Message-State: AOJu0YwNxKHsZJvFF6rvH2Wg8NcSGVvuCAwHZFvyzCK0QLD8q9d3XgeD
	GL5OVcGUkCRGhdXTJbJi7nB+lor/DW0MVqwhnR76ByJOhSSxwasTx+Yn8Kel4JzbM1Qnmu8j5Ka
	JprI=
X-Gm-Gg: ASbGncuQtvTNcuRBB+/puHs/oPoeI2HlRgsK80UPHYRH6nzDATgnAttQpL5Gqb/173o
	BVB6iFeQpSGz8xZ1Ny7BiQxYqus6eeUu6k/Vlz47p0xx9WJ7MtX4rUAuH0oWG9YhJGUoMw5+k1C
	GPRfWVJYf47tkVCUNgVdLZD1UNohV4KzC1MYHTOql9gCHTVmgikZCBo8Nqg5p5oXZd13CHstc7O
	JPigu+l8AKE6QuRyumZ1vAz4pcwasTVaB5kzF4m+c740nRbegbKs88yMsnHGfykGBvR6br4pL5j
	G+hkgFbrbvqbOKSna+9hJKY=
X-Google-Smtp-Source: AGHT+IEAJIpGx/KtWJ3FoMRxqCJZCMQixEialyC+rYX1C/PQUXahOHBcURaFNniiUGHQYiTxLHEVSg==
X-Received: by 2002:ac2:568e:0:b0:543:e4a3:7c3d with SMTP id 2adb3069b0e04-54414aa8782mr2874988e87.29.1739077643911;
        Sat, 08 Feb 2025 21:07:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:07:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:05:00 +0200
Subject: [PATCH v4 16/16] ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD
 GPIO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-16-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rBkvGR/qHrfxPlnsg0QzXfiNTIC9RTO2ROzJ5dKz7zg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfkPKZGcgzKdMYQrmr8xg29SeVv5ZTbQNhMP
 Xm71FFkyTSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g35AAKCRCLPIo+Aiko
 1UN1B/9p99p14mAy2cJWH8bo5AHu/xitIDMYADBNYVdsUQXslx1MuCaXPHSz/9EQQ9j45ItPAmv
 EzCEf17MZ//D1/qHLqCjloL9Ltx37KTjBGPz1FUsmmbU8crIut7dokT0vvrXN6tGLdefXI/Hxuc
 awkE7CsVIlujLKcvm1MIvFQt1sbsJ9STP7ppIKasGV7yZiTxpCfT5SglZtHAbrupQBqNjuOhnWd
 3K8IniuWpKDQQBT71UqooHwEvF5Y9+OSbX8IlfDHj0Wp18urN40IFGX3Er+qj4JGg0EX+RWVWF7
 5mfvkADq0u6kX/boHk9kXmppgY4vT3pNzviaOXQ+R8XuVeKu
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to specify separate HPD gpio for the HDMI block. Use
built-in HPD in order to detect if the monitor is plugged or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
index b3ff8010b14985c55c580e0083a5c8ea23c03962..717bfd74edb75b278eaf5ab37954fcede1f7ffb0 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
@@ -138,7 +138,6 @@ &gsbi7_serial {
 
 &hdmi {
 	core-vdda-supply = <&pm8921_hdmi_switch>;
-	hpd-gpios = <&tlmm_pinmux 72 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 

-- 
2.39.5


