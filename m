Return-Path: <linux-arm-msm+bounces-4948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E26814F02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 18:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F0A289059
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 17:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9A382EF7;
	Fri, 15 Dec 2023 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hydavoa2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983C330109
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50c0f6b1015so1035109e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 09:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702662116; x=1703266916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05m2TTjXO8qRbBF1AwJ78a9lW4yXOGZ2LJactcujacI=;
        b=hydavoa22AyJTMEVxLkz7q2iy4JhKP6ICzExVPHfI9GOCLkfPof9045dAAu/VSlOB/
         KuUWvtYF7aRahBYf/zDYA37X6EReaZf2PAhT6OpIOBCbAH05mFcP3Dk/BSqk6TizF06G
         YWm0gXAufYmMMgKu4MNB67IPM3IbTtI5aa2/ykip4XbqWd4eEvkSkGlrlOHrpAMayXu6
         KHttK3S8QJIJ2BHwhff0/xyj94fwOUcrNTBzHfUvdVswKWtuEbRXekcl2m0Unw2Rop0+
         yOfTkb2l0qx03KNsa5pl8vUBO+DlppzRx0/9kjZ4ybzYJ3yY3SclmCOez08s1Am+boMI
         kIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702662116; x=1703266916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05m2TTjXO8qRbBF1AwJ78a9lW4yXOGZ2LJactcujacI=;
        b=TAr46Re+7b0aLblddrrRwgDcffIvvXRa/yzJ2spygbbJIOEH6STjN9pYsx7i4re9Rb
         VGjOLfR6vGW/WupK9SEINeIbRCQ5OdwqgI1I53okqyavr5EqN+qbWO3ji5fSIiMwJECU
         Oa17CvmSMq+DP/UTV+akqYCYKVGMZHAqEbD9z1/t83TNqKbMlBDiUQhbtHckdDBp7k9v
         fZ96cSrjPfcRRWGg9tAr62z9B3ISfdRetq+4Kb2HKEiSc6boVxPB1Kl4nx615SDPMmyN
         1nwPInfBpwpgtSBevKqS3hJxhumJBlev8mhrjmyh9tQ4IyiKvPI9mX+OXKI+yrMOvKd7
         +5Tg==
X-Gm-Message-State: AOJu0YxALoqFTxKuO39Hh6JVv3+9nOIra4tpHErTd/+lE6tfZzczinkh
	FbjumVbxGi4LtA4SDFx1cuFoiQ==
X-Google-Smtp-Source: AGHT+IFX9tez/i09CQndRfQ6lADZJ2grBe3Db83nFkfalE8QYv/sN7r7tEzrIxu27f6ewcbJKJkSTg==
X-Received: by 2002:a05:6512:68a:b0:50d:15be:f07e with SMTP id t10-20020a056512068a00b0050d15bef07emr7492031lfe.74.1702662116687;
        Fri, 15 Dec 2023 09:41:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (85-76-13-188-nat.elisa-mobile.fi. [85.76.13.188])
        by smtp.gmail.com with ESMTPSA id c16-20020a056512239000b0050dff5bb793sm1389263lfv.143.2023.12.15.09.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 09:41:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/7] arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
Date: Fri, 15 Dec 2023 19:40:33 +0200
Message-ID: <20231215174152.315403-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215174152.315403-1-dmitry.baryshkov@linaro.org>
References: <20231215174152.315403-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add required-opps property to the display clock controller. This makes
it cast minimal vote on the MMCX lane and prevents further 'clock stuck'
errors when enabling the display.

Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 2ce07910dd13..ad03ede906bb 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3925,6 +3925,7 @@ dispcc: clock-controller@af00000 {
 				      "dp_phy_pll_link_clk",
 				      "dp_phy_pll_vco_div_clk";
 			power-domains = <&rpmhpd SM8150_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.43.0


