Return-Path: <linux-arm-msm+bounces-4953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15774814F0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 18:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C758B2892D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 17:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3605A30134;
	Fri, 15 Dec 2023 17:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UKKnEbME"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3BB30120
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50bfd3a5b54so1015129e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 09:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702662124; x=1703266924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnnM4NLYYXQL9h/0MUW7hGGl0ViRyq8ukmFIOJoxzgQ=;
        b=UKKnEbMEKj1eBV1g1ZKv1c+cObyXkcVDWhBnGj0OU53tcpRvqUsu/4fVXfRT8w4LR5
         GVCwcCgzvtA+jFQB510txW2VAHeejyLT1Ywht4eti6Hqy6RA2EH5ZbRcayY2Shlibo6k
         6BUovs1mxarKqAmp3teXzN0852hsxCZlW2y/UPnbVepPOxN6z/gVsspiuOxXTKG4XMtd
         6Nnx9VuO5ByyU4RQ2+N2Jlj6xgQx+I05CR1Hy9MaPYaY8gq6uOdftRmL0PuDhXzc0Tiq
         BnJmugmuHN8d3wLPzHQIo7l5yvHRQBiRI9BwuK2OF3SvVOnIKYZqAd6lcPMyA7ITGTZR
         GE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702662124; x=1703266924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnnM4NLYYXQL9h/0MUW7hGGl0ViRyq8ukmFIOJoxzgQ=;
        b=rUN8sGJnOWz0aO/UcTL6SrMGGeJByzFeaimI6mAAbtXyh1fyao6rVBdFuspWqwtlSw
         yoCdP82Bjgc7rHxztGDpRm5AaexVaXgtBVtuW38V97lvbQq316SRcBliofnwONHzA0Vj
         JK4L8nMk1xWOXQ/rFNECkU6RvlCiLrhNB7EPkZTEWJ/erL/29jK5UO8eLmHFCXf4PXZN
         xKoc7QMVHkk4xWeiS9stUwc+oeTcikCXUYqmo1pNiF+KZG6egXrVSmUsDcggEgn8DnBG
         dMzVkwl1rkSL8kWcCD9Rs3qnqM9/uICOvSfUxHTiOiES6Jf1NJB5SBBGK8FCszVlNUhS
         3chA==
X-Gm-Message-State: AOJu0YyptNHhoOFL/oBgpovfqVTbKqIG8I6NKJZYvworsij7gYUYhKqO
	VRMstRQ/GTOhRrx2sPwMcHxfPA==
X-Google-Smtp-Source: AGHT+IHkwyZNCl+tIBTF8hgjNJYrcVRsjpKNHb8C2OrOlBAiZNUrlviD7eIsR4mKIlz+PVc+wmHZSw==
X-Received: by 2002:a05:6512:2807:b0:50c:c63:1d20 with SMTP id cf7-20020a056512280700b0050c0c631d20mr6510772lfb.76.1702662124630;
        Fri, 15 Dec 2023 09:42:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (85-76-13-188-nat.elisa-mobile.fi. [85.76.13.188])
        by smtp.gmail.com with ESMTPSA id c16-20020a056512239000b0050dff5bb793sm1389263lfv.143.2023.12.15.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 09:42:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 6/7] arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB host
Date: Fri, 15 Dec 2023 19:40:38 +0200
Message-ID: <20231215174152.315403-7-dmitry.baryshkov@linaro.org>
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

Expand first USB host controller device node with the OF ports required
to support USB-C / DisplayPort switching.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index d29dfdd0583c..fd50fa79dff1 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3608,6 +3608,25 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+						};
+					};
+				};
 			};
 		};
 
-- 
2.43.0


