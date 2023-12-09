Return-Path: <linux-arm-msm+bounces-4106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0D780B776
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Dec 2023 00:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99FFD280F47
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 23:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24942030B;
	Sat,  9 Dec 2023 23:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u8IX79F2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3E1D54
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Dec 2023 15:21:37 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9fbb846b7so36645651fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Dec 2023 15:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164096; x=1702768896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgDxAEuhsmBMeANv3N0te/wPGHFbBpN6eVt4De9yE3Y=;
        b=u8IX79F26AnVEj39zeGc6Uyoirw3WFaciJ9cS5OgF85Vq0SNvgcUP88PepS7m9nNGz
         Qy7t7fO+OYx7nuftWVuGsImKI28lpjzKI3qx9/DYSTDtEDsDX8XHLQIHT68oj33067GS
         aYtgExbeWtpjmwlRqlpiC2Oy0NZ1elkL0+8uJsmmi0gT8IuTVrrrd0U7uu0H/wyhMXHh
         pOw1+/Ur64cndcIziKt0uxsrIkQuRBFj5jLb9HByPGWYRzCmWwb6saqzx+sMtd5SygKY
         M3tsMhFwYlkuQVqSFmt9+lGNaBmRF2yASvD2gw/BjH7zPOV64jN1VL/xt1BQFhQgW7zu
         S4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164096; x=1702768896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgDxAEuhsmBMeANv3N0te/wPGHFbBpN6eVt4De9yE3Y=;
        b=YEIIUAkDF2gjhIs31gP/mrdzcDEX7agDwjXQgxN4Tp7ePLDRqZrE9z2VQbCCJjpKFE
         fKRcaGlmiAAAI5bFK1VQfG820NzLibMvBhCiD0hWVU8/Tdu89CgkEyYhcwsZVQBcDpSR
         s/RFuyy4aDK67fTwq6IxgwdP0HaJ4f0IBJeV5Ioi/lvkn7m5GLlXopx+yqV4qRKunWFc
         uTuPujZgZZ1qw7YH1mhgZ25KLq7WGo0AM58KFX4EXjU4gzxH02psq0OW3AtbWXal0ig4
         y8/DzqGBzk1YUkixzC0JW9Nj88OLAbZ9gJPP1riJ2S0Xu0nIR4//F46S3mhsykoxaSFf
         +KsA==
X-Gm-Message-State: AOJu0Yxhv31KMO134bT9V9F19A7Y67Tj5gD0ECFhkfLFYles13ZsZ6XD
	KREnPl5W/yufMTnDayrklRMuog==
X-Google-Smtp-Source: AGHT+IGUzLLBnvyzByTUcEtcoTK0ECG9194KSNjYB+OpKYDRaX+qfDCUoY7QFKr9d9SKUTVhFBsolA==
X-Received: by 2002:a2e:94cd:0:b0:2c9:f4ac:ccc6 with SMTP id r13-20020a2e94cd000000b002c9f4acccc6mr704022ljh.46.1702164096346;
        Sat, 09 Dec 2023 15:21:36 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:21:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 3/9] arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
Date: Sun, 10 Dec 2023 02:21:26 +0300
Message-Id: <20231209232132.3580045-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index fb41f91cefc6..153c531c1d41 100644
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
2.39.2


