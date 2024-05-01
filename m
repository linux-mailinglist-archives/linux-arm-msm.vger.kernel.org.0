Return-Path: <linux-arm-msm+bounces-19077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 930048B8E15
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 18:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9C6B1C21014
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 16:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBB7134406;
	Wed,  1 May 2024 16:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rC0HJo1v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47994133421
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 16:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714580398; cv=none; b=cKXCJlzBv9XOH/px5s5eFg2i/6+I6yqrnaU43Ntx+owg7aBiZfgH6+KVTUv9/V68uIz9lCYjdoVgVGz6JPT2lMfaLXeNXudWH0V1WjPOc2WTl9QbF9NEzc83KjK7S9tzTD5uA4RV/DuzqeAt+DKKoWLP3wgOhbjZChPxUMT6oL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714580398; c=relaxed/simple;
	bh=Bi5rhyr14KcQQ7+MOAD5H9S1njlLb5FKYBD685uF7IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rVGjnqn1fz6DGrEmwVl/l5MWmfpca1TpD1+PpuQfGKiRNcbxs4t1+RePbFjnl01F5oCCqL8XRA9pv+EPlFVufKWYHYPIDSE9DYQdoBBRkIk2yhqhw7l9EyR5I++EIMcc9A8eStpPyqdknJZAucnV0N+YuXC2ILV9MNwPpe1Ndzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rC0HJo1v; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e0933d3b5fso38417621fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 09:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714580395; x=1715185195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qbl1bY1oXPc/BrE+BcAYxIg4JVPN7Au51+xkWvlhws=;
        b=rC0HJo1vxz4oDhy2zl3cRFGglXj3n1mS7eHGZRxuRimBpBTJaohvMA+MOvjPodmlES
         J5HWpeYwvCXxw8pWzBJGzGg3BVZt29LvohvQgMD2yhe5RvW8PNiwJmTZ0FwZ8xPqRCA7
         rRvgktMbLhMUwZcqPJ88PDEvbP8TitUOTdiRzcHZs9gYpNIUwUkMwfPJO5PB1xNcaVhD
         Q5pXF5rhZaof2J44YzEzKi6CNtyrFQkxiTYwTQRz2oU4duMon8oY9VX/lOguZgqKoeOS
         5b4c+U3p2Cx8Dzxw7r5GVqcYy/M9dcTpCE9D+hhRoAQExRvrx2mnCU2IOzVNFBGvgzUE
         OjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714580395; x=1715185195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qbl1bY1oXPc/BrE+BcAYxIg4JVPN7Au51+xkWvlhws=;
        b=c4HhOPp9OimufzJvmdzIjuA7FaISJ2oV6EV+LUceqLb+Uh9yOBB8TwWYu6J2v1XbA5
         1W+5bZ0SimGuo6jLRVz6KN8jnXqkbAAls5vVlvtrvl/vo98DDwRqyQCKYZE+K5hjCSaA
         M9x2cIWrUPTVT/4PiZsLJtnK/FQXf2i159LBjtk7k3rzTsgo63lAFV3jKcb/B6Q8xH5i
         YM+NXgCWXv/5LDAGCxPh9++eQD7ZRFyJZPLdXGaB8SC2MBL18nJMA7AXqYtKoYSJuOpi
         cN1MikCgoQvvmxflN8bnfc5zzdDNRmT/PaH/0qgW7tEgJzpwCwmVbjChT5iLZPvwwCyS
         rTAw==
X-Forwarded-Encrypted: i=1; AJvYcCVZRnsMF+4zWdtOs+OgkxADGo1X/fBTNaszVjbOJh/ithJCyejhhX1W75dZlYXb+SZQTqawehDRfrVzXzRaa2cM3MgkM83WiXBB1jBNqg==
X-Gm-Message-State: AOJu0YyUFqgV7pppJGDpRKqLKGkC7W2xhES3Tbbq3p8e5mKhH7g9/bOT
	iw1WBBTWikMK8BsoVKzP6Of2o/T/1macY87m/DPjTAUl4BLaOwgoHlTOatCKrrU=
X-Google-Smtp-Source: AGHT+IHsMijjwWCg5z5tsLM+qCe+9yqE2j6ZSGFnxh1tYEFb+8CyeD5Rpg82R3EDRP+9OglQQR/VWQ==
X-Received: by 2002:a05:6512:3991:b0:51d:2eba:614 with SMTP id j17-20020a056512399100b0051d2eba0614mr2448878lfu.53.1714580395645;
        Wed, 01 May 2024 09:19:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d30-20020a0565123d1e00b00516d0029383sm4909306lfv.28.2024.05.01.09.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:19:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 01 May 2024 19:19:39 +0300
Subject: [PATCH 13/13] arm64: dts: qcom: msm8996-xiaomi-common: drop excton
 from the USB PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240501-qcom-phy-fixes-v1-13-f1fd15c33fb3@linaro.org>
References: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
In-Reply-To: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 David Wronek <davidwronek@gmail.com>, Andy Gross <andy.gross@linaro.org>, 
 Evan Green <evgreen@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
 Iskren Chernev <me@iskren.info>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=880;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Bi5rhyr14KcQQ7+MOAD5H9S1njlLb5FKYBD685uF7IE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmMmua/n9RREl+g5vb+gDOANKfA9kBoBl8gO6sK
 3bZBBDzZ5eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjJrmgAKCRCLPIo+Aiko
 1XM9B/4ymPAO5auW++iWtOUKx+7lvM+O9UCLKdBYi2MFlVxEAEY4dD9Wu+t5d1FLyExiTBUH6Df
 LDuTXwplLk/XawajHzlKSm1GVDM4ZtN+wDT4artifItPVaJdZ1/nVPZrG6LztFBuHcWx30d0zsn
 oO4wOUe+3mvjI1/3Bm26rTNiyajJw2klIc7LXhOQqKf1R4jnx2BBz69BvoHZJlUKr60Tg0YFyuH
 Q6DRxDfJ95xEnKyvLb7zC/8GL2UokUK5QIVNMFR7R5U8H9e4C9OaewxPKeUi4X8L9ptnhNu8ACi
 GT/6H8+ZUvpepneqmOxY5XwGHBY7IfVw4IAIMihGfLvudOFe
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The USB PHYs don't use extcon connectors, drop the extcon property from
the hsusb_phy1 node.

Fixes: 46680fe9ba61 ("arm64: dts: qcom: msm8996: Add support for the Xiaomi MSM8996 platform")
Cc: Yassine Oudjana <y.oudjana@protonmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 5ab583be9e0a..0386636a29f0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -405,7 +405,6 @@ &usb3_dwc3 {
 
 &hsusb_phy1 {
 	status = "okay";
-	extcon = <&typec>;
 
 	vdda-pll-supply = <&vreg_l12a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;

-- 
2.39.2


