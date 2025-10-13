Return-Path: <linux-arm-msm+bounces-77067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D000BD6CC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 01:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DABA8403B9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 23:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858A32EC0B7;
	Mon, 13 Oct 2025 23:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lTkV02sy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21012FC897
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760399723; cv=none; b=ngTOCb65Mw0O2Ec15Q26LsX+PSpFVpv7v7ba3dsZvIbol2o0Kj+vIIDZ/JLfWO3hJgRvedKk9iUE46Qo5cAX2RwMnRh8TUNso4nwm4K+lFrTH/aSU3QX8RRvN2mU3yAIv1poZ8+tY6qzxs9hxLJDwOE+8DhsgiUIBbrifbs4CtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760399723; c=relaxed/simple;
	bh=z2rAgQyOBPFcVVSSorypkkhezLw5RAdCYmhQT07aWg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsT2JCr5oeeJ/bTK7O7GhPxQmaLz1FqJLE2LwwaeFo7pXDJNIxLSCb6/hcEtVzldXNUQPqcPgLlxCjLiEbDoUt62QfmOW0cT0tLqfIOzae+1b7e8Lq9Rv68Sf0nwneJTtmDF1xMDns4iNd1PetbSu+wju0R9q3SSxcqyogefi7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lTkV02sy; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-58b037243d5so885781e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760399719; x=1761004519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJWa+s3rtzd6mnuJfdQ8PEY5fqM+cuLQHiEGXe9wIik=;
        b=lTkV02syK3IsPjx2pTAl1y6vy2YGHJqOnXwkZgjkKU9B5OdFW40rFNCqNp5SiZHb7Z
         23bvYrVxsyku9qUhLPWgx8Qodgn3NO8hhr3FtLzMoB0FOaxmVeVBE9Sfi79JAsoBJd1i
         JS+Yhd9Y3jyrg9CBYP3eBCfq5GGNrfyEtcizMx+L7X6IvRkOY+51Qi73gkCNFOECsDlp
         7LoB0pMRCZ9sqyds9tKDjnGp1Ei/jgjeJrv8EctWJsRgW+1VZ92ufzmeSJ4TigR9S9yu
         XC+8fUrxzppaFtvSSXcCgMkHnz70qrVkQQG2XzrATupqWA9feGw3/qTHOJar8qC9aOJG
         7Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760399719; x=1761004519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJWa+s3rtzd6mnuJfdQ8PEY5fqM+cuLQHiEGXe9wIik=;
        b=pfkesCP/Xu3baQz5j+sFDvbnxQ7hgFlelc+ja2uhARuU6ktCm+FWf4CeSN9GQ4/Utn
         lK9OpSDeSfiLmBayeEunnRbGZ+cyLYcWQ+FJDdqW64antSsQXsFVMwqGZkUk8g+CrSC3
         aY1DmLAYT1vSvZq9yGZWWqLCLCBthKBPKwOjbCgKAcQXfEDHEPGiokybd3pNaUIsSdfR
         ZyiK8mo6QEYcvmxHKNvZWFhO+JvI+yY3862df1vYWYjBQnT7e6Zuz3tlsSeWPjja926V
         Iq0yOyEzrw5MWOWUZQNsAyAVtycRUIXNQZtDxGoIvnFOXLcPusaYLVypfu6VeLgKnka2
         YsJw==
X-Forwarded-Encrypted: i=1; AJvYcCXGSDz/X/0+qA4m6gm6rv0nz3ogQLjKcNi8sFvxbKZPD7kcCjNZdYjM/OlM/eHaEEqb0GFdvBq5Kxvd+K13@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3qZ71+gsXI4XhuUIz3dWPOEGr5I4vVtSmT3VtKXXpa4owDYYF
	95yp2v2TEcV9Pxt54ucPI4U7W/Usjsr2c85pKI5Fmz/v3kUy2388w5kKs5ykoCj7MPk=
X-Gm-Gg: ASbGncuhy3FoXIHpklNVH0xuINNj5U6noR1KYrHd8GR7qMAaY4ok7y2+nqdjsYbBPl7
	CBbfXZcxKiYudvZ91grIuKAw2HtexQ5WV1uYsaIkvK+JvPFCzCeK5vs0ceT3QEx1QB/WoZ8y1rt
	cX+IjxFNtgQWT5aDiN2fTBXNhcqFYXKnoFuyAK93Sfj1YRV6JRRHHK+NhkuSG9dLFqHSBaYZ+bw
	loBsa08xl0+185Bzs0EaOkk8cWbDz3ruu8odIGL5fMvSiCXC5sYQRSCYqEyL8ZYYcb88b6iG8id
	akJZGHx+B1NQGmek06IUxL7pIO2qcdGqdnI2kpwRj44XkiaKL0S2X466v8V/A5rY55u6Rwue1vS
	8WV9sE5Me+eYUaHO8OHam88RV46Ow0+VmLsiX0HrGIHjXFOfViTBHz6VqlaacyUj50d95vFejVq
	Mj1GGfIF+WGI15
X-Google-Smtp-Source: AGHT+IFhblWqJ/hOZslW39XPAtfqw9ScwJ3EIOYpEv0GJWIuX74YXY30HJ91elyLx856wHdxm6RSjw==
X-Received: by 2002:a2e:bc1d:0:b0:36a:f4d3:82e8 with SMTP id 38308e7fff4ca-37609c979dfmr31140421fa.1.1760399718786;
        Mon, 13 Oct 2025 16:55:18 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ee2asm34880741fa.50.2025.10.13.16.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 16:55:16 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sm8550-qrd: Enable CAMSS and S5K3M5 camera sensor
Date: Tue, 14 Oct 2025 02:54:59 +0300
Message-ID: <20251013235500.1883847-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
References: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CAMSS IP and Samsung S5K3M5 camera sensor on SM8550-QRD board.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 46 +++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index a3f4200a1145..9af2a4fd02ea 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -716,6 +716,52 @@ vreg_l7n_2p96: ldo7 {
 	};
 };
 
+&camss {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1e_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	ports {
+		port@3 {
+			csiphy3_ep: endpoint {
+				clock-lanes = <4>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&cam_tele>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	sensor@10 {
+		compatible = "samsung,s5k3m5";
+		reg = <0x10>;
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+		reset-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam3_default>;
+		pinctrl-names = "default";
+		afvdd-supply = <&vreg_l7n_2p96>;
+		avdd-supply = <&vreg_l4m_2p8>;
+		dovdd-supply = <&vreg_l5n_1p8>;
+		dvdd-supply = <&vreg_l2m_1p056>;
+
+		port {
+			cam_tele: endpoint {
+				link-frequencies = /bits/ 64 <602500000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+};
+
 &i2c_master_hub_0 {
 	status = "okay";
 };
-- 
2.49.0


