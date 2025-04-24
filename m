Return-Path: <linux-arm-msm+bounces-55393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F1AA9AE74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 15:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CC7D9A12B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 13:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07B427FD7E;
	Thu, 24 Apr 2025 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HnSJdYvB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3E127C866
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499887; cv=none; b=aYtEkrZ+n3RD7g7z7TOBxF9cyqpbC249wdDYsVcpsmR2GzVKHZcaMMcOSsLJ+ojHYZsrJGvPX/sXFZWAMllTwXgjmZaFYa6y5WltBSMPg/YX/Z768NKTvA2eHMmw6gX5+7INbXIUJzF5clx74bE0T8NJn54G/fhnchAnXE/Uuco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499887; c=relaxed/simple;
	bh=i9iAShUceIpLsFwMkQWLMhsv4ypR95GsTISxh9DtKsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eRpnK/VdHO4dOrsC072T0mTAuvvxXCKh4448IRQn70cylSnvutP3k0jt5VU/shVEdp+MPaQRAItTkB+RAMjr0f1q4BY/hTn6E1rhj9ZdkfK4Ns11hl9B2pztu994y3dYpVlUd9zs0JsudNLE5W5uK/7tKfuiMfmbj9bbLlIOFnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HnSJdYvB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac73228ea73so10150866b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 06:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745499884; x=1746104684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFy6LfZrrQ3Ec4dLUHga70j/5w640VgvYLPY8K+UokE=;
        b=HnSJdYvBgexTvw7V3Oo3A2X1IWJgk5hZlaxnjCP9BFQkuT0gOjfFeD5Ow9+CpXMTHt
         4IYr67Frlugfb4UlpJzW4ADulbzubntUG6+KPqccUV/0Xv/wDv0kgXDnYqckWzvapRvp
         nty07PHxWw+lzcv8J4u3Q9FMNpNuPCwJmcgYbFHvVfoHzlL5gTvmDea9Sp5ldjkpG/p2
         uMj2pdiQZHWpKb6sb4gYvExKpFKsNduXAUbfcawsFtx2BCO/DHsrpgwhHnt/Wuhpw9Ct
         5YogcxtzE9ZVy5RpRa2I8zUYcS/Q7DKylaQfg/nYdjkhBr7EdMr+g29/W8KJqDrn9Dvj
         fyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499884; x=1746104684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFy6LfZrrQ3Ec4dLUHga70j/5w640VgvYLPY8K+UokE=;
        b=tkmkhayTEuc9LoV3wvxmmJm5e5kJiOWJMGVmm7g34kTCq8C7fff881Pu7FAopI55kj
         xO+a60Rx8xEzfrWIA9A5XpF7Wrx+NQQyHW4RuI8FEH2cbt7QGhs01rHUTrde4fvK6BQ6
         8gDPcreTxY46+zVyKv0OVnV5gmvoeoP2R6q5U48oopPktvfnL0Wz8kPGMZCYhPU7ECkK
         SNycY8J9Ip8w3uRSIlCFZBtsgQ1FsZ4qF5OxkOAAaNW8uZGwe83Lh6vmj5VhAcPgagKG
         llhBziAoNB/C2ZWerPyEHrmi4z4snLR4sLLu7pXB6DRs08+6a+YmmTmh93udd2C5Qs/k
         PRQw==
X-Forwarded-Encrypted: i=1; AJvYcCWfnp8hwoRPYainVPR267QnK0hWn30Z3Mkt+oiu2Tr4gfQqMj+Bh9AJpNryNdvRgRADN9Y54OSQtJifPgNI@vger.kernel.org
X-Gm-Message-State: AOJu0YwTdiBHWWnrks261hiAf62s98EmPEgmHDpeLRIeALtz5M68jACx
	HH31GHbutDJsV9ZP8K7uyKBZ9XqHVJ67FdfNcmp35kNsgTh0j2JDH6j+Usozyn4=
X-Gm-Gg: ASbGncvlyrf52otu03mr5OafsrS/YxIbPrflZgwkGCoVgUxME/rMxse2e0fkEH3RinA
	ojyf3M+jnCRKZErM4T2RZ6YgOSAaXiZ0gz7S6CpNtRr+aHwlrDrN5g3rfMhQMz/4XQ8EHoNfCu+
	tUxhggHYmzEfkjg5ToMmrJEDhrmWeqQZTbwS2XHTV8wDT/TVHndOyuE9b2Ii14d3to7ImA4d5Ze
	Kmlzk6JOz+Zl2JKNav+SEh2bcxU1GTMPZBvlFyZz1BkRLg50NAzH3H7yCz1WsO8K1cQ8VopoDy6
	YmU8ax9F2/4LQtpb1v/c9FrkxC9Ak2jQutj3OH91TeYX674n7xPkHWnximjDp6UzLqfYbw==
X-Google-Smtp-Source: AGHT+IEqxlm+C4zPmUZztYOo+O71IivVUdD9uO2+BCuxgVw8VPVSB/N0y3iidE3AdXsH1B8+9cD06A==
X-Received: by 2002:a17:907:868a:b0:acb:1e98:1a19 with SMTP id a640c23a62f3a-ace5727e5bbmr87084566b.8.1745499883800;
        Thu, 24 Apr 2025 06:04:43 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59898006sm105101766b.46.2025.04.24.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:04:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 24 Apr 2025 15:04:26 +0200
Subject: [PATCH RFC/WIP 2/4] arm64: dts: qcom: sm8750-mtp: Enable display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-sm8750-display-dts-v1-2-6fb22ca95f38@linaro.org>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
In-Reply-To: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, 
 Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2390;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=i9iAShUceIpLsFwMkQWLMhsv4ypR95GsTISxh9DtKsE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCjbkxCX+DFB/zE/Qp++piPauiqNmcTUqvonna
 jMHHJqsMISJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAo25AAKCRDBN2bmhouD
 17F7D/9bgvsuSmXLFGIGmhVmwzD42p821ZAgY6YcN54VKz2jXNUmZQ2zan1E3AW/200n5WMIUW1
 GVbeq5QsnclztXLLuICZQKFmNCPTRmxfxDKDvpXw+eGV9rRlPNuxSaKyeLVkhpGuRc3tdPJlJEO
 DIAq17Rlo5YcKCuaKWlCs0KSdqvTmfZqAuHuYU1v0cZVnj3goIZTGF/JaR+KDEAukqTx/FDcPBC
 pxtJxeH4UKPiJAqec/6FnydilJgpIDJtUat8b3tAmp8pkHLSA6DSTk1A/g6j2POkxrDdcPQFUkS
 5E4H3HGCoRhYkUDuLiwDQ9wVyVt1Z4ANasEh9riZ54xY6Vu6afdvC1Z/3sW26nvb/IQGOyy7er4
 uBcwlSzMCVKvVAflJMvGcyV54X72Hf3gK5o2l/W5a0xfzYzTH9LmZmpBtVPa9wi8Ia6kzSgdbNp
 600CfEz+oli1W2gqglSXevEFS8CwgfQGMAr4XZnxDfFE9OYvOy2/H5s9pcRxW5mtyHKHNZpAanb
 aWsMp/7aMa2uEYPifO1L5LfwxVOxb1xyiywiTCShPzUF+A/M2H3NJ+7lkzWmZuha9dOpJtdldp5
 ajVY92vIEW5DBlGD3Q4vf+PhUvCXU2gKWrqw02jP/Az7uBxMKGyxxEdo0ckghaugYzj+2K1l8xr
 RpA0RXDdB4b7VKA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable display on MTP8750 board with Novatek NT37801 panel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on WIP
https://github.com/krzk/linux/tree/b4/sm8750-display-panel for display
panel bindings (novatek,nt37801)
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 70 +++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 140a3a36d03008f700bb54ca52f437f81e6c68e2..bd0918e8a7a7e03530eea577c7609454fecfdaf7 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -853,6 +853,48 @@ &lpass_vamacro {
 	qcom,dmic-sample-rate = <4800000>;
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&vreg_l11b_1p0>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync_active>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l3i_0p88>;
+
+	status = "okay";
+};
+
 &pm8550_flash {
 	status = "okay";
 
@@ -1078,6 +1120,34 @@ spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 };
 
 &tlmm {
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_active: mdp-vsync-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_suspend: mdp-vsync-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio101";
 		function = "gpio";

-- 
2.45.2


