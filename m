Return-Path: <linux-arm-msm+bounces-27980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B82C2948C50
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 11:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1881EB25529
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 09:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857831BDAA0;
	Tue,  6 Aug 2024 09:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D7vOFL1R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1F315FA96
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 09:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722937548; cv=none; b=ldTrDwiGEog1zff6aWGToCVWb0H7HEhEmWFcRvdkTGv/YdfLhgta5QDuWns0r9Yw1V2aJJc5A56U8t3+AfYIS8yhA9z4PZuAalcfWAkBjbpkGnbvuTeFYCnvLxvDY8W+utqEW0KTWdfxkZJtt37sJa66aIo1urKzKTOTzgkaG88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722937548; c=relaxed/simple;
	bh=sG15rXXXSPIMMMb+O2lzEs0y6AvRlrpv9K3iytvLjOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r1wp7vOLl0VG5D7Ou2bETWF5fMGxBz4qz0YVpnqHyEZsLkPNdj/mXFbzZqzloGKuL4HvdE7WUzepemq9oVg/gUHxqWVAMewWQrlNI3XJA5EbzWBi+s1PYS9UUUDD+NZ68AGjjWYYbJzkWsAslHThgjHnhgIg5pey0Z3y3uqFUHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D7vOFL1R; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42803bbf842so3941325e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 02:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722937545; x=1723542345; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R4fBquWHWaKLLRoqUdtkBAlqZxmnlK2mo4ilabvnbQc=;
        b=D7vOFL1RjZA1nEYrEiumqq6pW4xeQL6NHo0K27vY1GynNoPk93IKfknhsFGCIwlPQx
         VV1qDOl0o5CdDG4LUnXgNWzzIeRj4CmH2ZCxkOwK98g1PvuyfGK+zHk9UsD044vKX0Wj
         1PkzNoTjvzxs01DMtEHGf8MoOGrbH9YcFgjtI0OAzuxa01zWDeX5wDnEWHy56T0m+O/A
         Po2N94uQcbDRnLlYmk6ryjYma+0fO1AshvCPbDO9P9Y72scJmq6J2VYY3ybfSxZFs4iu
         plWXgI4z9ccLsei2CDSMKHLoXKIocsHL8ucfUKtctHl2ni3mfn6sjTJwI7XfL9zChyt9
         cfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722937545; x=1723542345;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4fBquWHWaKLLRoqUdtkBAlqZxmnlK2mo4ilabvnbQc=;
        b=A8jgd+1Z8u+ygp9C+1JkUcoM5t+RsaAr84sUx+AbBN69cOpO56z2if5Ruvi7F3Oqcl
         OsGWEdlrWlf0/kL7Flop5HR1Xw43ebdfN8x0F21LuvTu/kBeIKOqV2SfNpM1k97PKzHe
         EnWzyUtutu0fPtT9XNhO1XE7jromkw+l+oFzAYmA0Gn/Qd5LSegQj+mdgYXtkAUU2OHA
         uh3EhZE77Q3NXU0TPWscqNsXsC49xE0vnFOKb4o5sf6m+FbP6m8ONwOxNgTxPlIa0xN5
         xip+L53z6/arz/pjZFcFpDTZI385JTHaOmBGD9SQ2VQUgvAg2jEcLP/dF5X6JAP2hzpR
         Nzvw==
X-Gm-Message-State: AOJu0YwAhKhn+5eesBlJHlLzZ0xKSMhpFAJks1P4QLBwLFQoIeOB2+ei
	lfKm1dQwn2ZKZ/hypLfAin9B68javumrZWCn/hXRIFOlb7CbBBlyfjvcXz8LV+JFek56RkwJYAy
	B8w8=
X-Google-Smtp-Source: AGHT+IGIPe+z1e8RuQyOzsZlnu6BsE6b4DF/uP6nkuiCRN/xYnQcCnV14a4Xv2mBXRQ37/DCbEDx/g==
X-Received: by 2002:a05:600c:35ca:b0:426:545b:ec00 with SMTP id 5b1f17b1804b1-428e6b2f0c5mr132732785e9.19.1722937544607;
        Tue, 06 Aug 2024 02:45:44 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e7dd9esm172526605e9.30.2024.08.06.02.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 02:45:44 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 06 Aug 2024 10:45:43 +0100
Subject: [PATCH v3] arm64: dts: qcom: sc8280xp-x13s: Enable RGB sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-v3-1-199767fb193d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMbwsWYC/53OQQ7CIBQE0KsY1n7z+aUtceU9jAugtJJUMKCkp
 undpXWjW5czi3kzs2Sjs4kddzOLNrvkgi+h2u+YuSo/WHBdyYyQBLYVBy1gdP45gbfTA0gAtlB
 qo24pQTKSJE53GK0POUAcNGSCmmpNNXa9loKV5Xu0vZs29Xwp+erSI8TXdiLztf14Ev/zMgcOF
 TZEplFohDyVCRXDIcSBrWCmb4T+Q6ggSqKqkHda8eYHWZblDQ0vAFRcAQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev

Enable the main RGB sensor on the Lenovo x13s a five megapixel 2 lane DPHY
MIPI sensor connected to cisphy0.

With the pm8008 patches recently applied to the x13s dtsi we can now also
enable the RGB sensor. Once done we have all upstream support necessary for
the RGB sensor on x13s.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
The Lenovo x13s has a five megapixel ov5675 sensor as well as a one
megpixel ov9734 B+W NOIR sensor for low-light face detection login.

This patch enables the RGB sensor.

A gpio exists in the upstream dts to indicate camera activity which
currently we don't tie to CAMSS activity yet.

Running

- A Linux distro which ships libcamera > 0.3.0
- Firefox nightly
- Setting Firefox about:config:media.webrtc.capture.allow-pipewire = true

It should then be possible to use the on-board MIPI camera for Zoom,
Hangouts etc.

Changes in v2:
- Drops useless assigned-clocks entry 
- Link to v1: https://lore.kernel.org/r/20240801-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-v1-1-30622c6a0c48@linaro.org

Changes in v3:
- Incorporate Vlad's review
- Add Vlad's RB
- Link to v2: https://lore.kernel.org/r/20240802-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-v2-1-a80a301dba16@linaro.org
---
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index a7c5a3f5926c7..6a28cab971891 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -592,6 +592,57 @@ vreg_l10d: ldo10 {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l6d>;
+	vdda-pll-supply = <&vreg_l4d>;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			csiphy0_lanes01_ep: endpoint@0 {
+				reg = <0>;
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov5675_ep>;
+			};
+		};
+	};
+};
+
+&cci2 {
+	status = "okay";
+};
+
+&cci2_i2c1 {
+	camera@10 {
+		compatible = "ovti,ov5675";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAMCC_MCLK3_CLK>;
+
+		orientation = <0>;	/* Front facing */
+
+		avdd-supply = <&vreg_l6q>;
+		dvdd-supply = <&vreg_l2q>;
+		dovdd-supply = <&vreg_l7q>;
+
+		port {
+			ov5675_ep: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&csiphy0_lanes01_ep>;
+			};
+		};
+
+	};
+};
+
 &dispcc0 {
 	status = "okay";
 };
@@ -1436,6 +1487,22 @@ cam_indicator_en: cam-indicator-en-state {
 		bias-disable;
 	};
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio17";
+			function = "cam_mclk";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		sc-rgb-xshut-n-pins {
+			pins = "gpio15";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio25";
 		function = "gpio";

---
base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
change-id: 20240731-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-525b250dfb84

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


