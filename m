Return-Path: <linux-arm-msm+bounces-33576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172AA995128
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F019B2AB01
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C44B1E008B;
	Tue,  8 Oct 2024 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L2UEhF5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E571DFDAD
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396390; cv=none; b=sW8gRZKwrbD2hdeMZUz1IgZn7mXkmrtaD6wtnzTJEdxRbGW/M+ZUzDkVNwy2ZBvTSzHhAFOU8N389lPV29hCiWpmPsG5THIBii+iUEfkKp3z/VB6BjT89d9xTh3hmSmrRk4rsUitNyxb7L7a4d2NigjhQWRPSaaJh8ca5urUZ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396390; c=relaxed/simple;
	bh=HnTSSieNZnln6w8Vcr1MEzPJufKQo6Dj8CE0MlH5veg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HVGJAHWi48vzab7b0+jgBbnhHsYAHoNsw020Avji/sIOYsnBdIo3UAOsenh818O+cvKLj1q5iqCSEzGw+jh2cOMjqtKiYl+wORbmqFztVtIchQ6eYlO6ZEzTDotbBhBrUQm3sbqaHfCQuD12bkNiQRSmWOEABSdgn8ISOGhOzgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L2UEhF5V; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c88b5c375fso6943881a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396387; x=1729001187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW3qGb3ZL5G/B18IQmAOlU1aRnTk8u0KXdkSlfqu380=;
        b=L2UEhF5VUs9R12tbWFCoX8Et9NTFKu8WyrjwUfTgaebieVH5Glf7udVwKSKR+x+RCc
         WTIDomeuXolsobBkJ3dXg5s4H6ZehFj2JzXO08l2YyZtAQ7g7LhL9Be+HjyHHutnM83i
         +SI/ow9Kt6xzOd9Tjj74Xj1F4zkO3Ha2VMjUK2v4pod5yz7EwMzEJiNoEzp2peoim7Jy
         WcVb46oN2thPvMdddlLEJbA6tJgstDO0tsEh6W8eG6RDvM83ZztyRkMZ7aZD5YRhSUlP
         3ejnL608nG5OBSyI6Dju/CZFnQMD1sMpuuUcnhSIJUqmtUKZN4foUCVdqdA7T1hjRDkH
         w0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396387; x=1729001187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zW3qGb3ZL5G/B18IQmAOlU1aRnTk8u0KXdkSlfqu380=;
        b=DdjjJEn3hgSERalClpN/jdYyRkEhdflwc7CgNmin0nD/N0wOPc8pOx8dwTN7JwpNaX
         2N4PUyx+kkVYGHNHqeKBulrFS90bSpQ6+QhSdU037rhUCdCykZFBUcUJMLSFp0Q14PYQ
         QiozbeqUqPKrYnrg1+7KhiFO7I+muAx/D2Rz3gD1wADkgtNzJWqZ+NFCUUAavbNt4mS+
         7+jDKg3Fzfl8HnhGJeL4/H4YF+3sQ1+6Xum0+jaZwjeEtTiKuTHHNUknhPpKZDq4+vkI
         cB1bMGhd4YgsHNXDgGBEMU6gc5gRPMJBFs8ApZfg9pOq0WyqFA0/q0eQnqZNdzUYJaQG
         z4uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVImZFF/AOHW+KNVcvc4i2JObALtOmgkwVs24xjcruJgzf33I7x/wFVC6FMmlyPebBIP/DkPTuLlGR8Fsvv@vger.kernel.org
X-Gm-Message-State: AOJu0YydB9qUn89QwFsZhZHnY8l77e1bkQnBNjBBVKuDzYI5HqYQvl3Y
	E9d0LSp4gSCxQhk50Hk+PhiVWSS6zQxmNH+vJv8lJQ/lPIsew8CYzzt5Y1zoMZg=
X-Google-Smtp-Source: AGHT+IGAPJkU/2BX77pEu6SdzFy5D21IvcpFCtEIlOIooAmaIEi6IbF3ADl1oZs59SG5qUVOIXYKVg==
X-Received: by 2002:a17:907:f767:b0:a99:4acc:3a0c with SMTP id a640c23a62f3a-a994acc3ab6mr795246066b.53.1728396387114;
        Tue, 08 Oct 2024 07:06:27 -0700 (PDT)
Received: from [127.0.1.1] ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994f50fcd4sm320714266b.171.2024.10.08.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 07:06:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 08 Oct 2024 17:05:58 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: x1e80100-qcp: Enable SD card support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-x1e80100-qcp-sdhc-v1-4-dfef4c92ae31@linaro.org>
References: <20241008-x1e80100-qcp-sdhc-v1-0-dfef4c92ae31@linaro.org>
In-Reply-To: <20241008-x1e80100-qcp-sdhc-v1-0-dfef4c92ae31@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=HnTSSieNZnln6w8Vcr1MEzPJufKQo6Dj8CE0MlH5veg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnBTxZ5pw5/X59abM1PzRowDFyBM4dfWvQvCZKC
 68ku9qUTSiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZwU8WQAKCRAbX0TJAJUV
 VsDpD/47F+PiwUrg4V1wuq9sTBq0KrtQ4LmgaCq02mRN7AU7b/+bCIEpW9nYZw7XIs0WhZZp3xP
 DdVQeHV5HUcPZr4CA0ZghAO1InQYeiwD6sciR0tuN02VYftouZx+Eu9LD2zamJslkzZiaFcbCQ5
 gXzgh4S0lyOXM/d6Rsdn3H27D+z5BVRgBXCBEUzRGxFxPCJnCMjCyjl3KTqPBwTBxi5EHGgue2n
 MHo1wohwNVZ8K6Y5gEha9m6c0RZub5OMgVls5z3I4UQY7DSHcAc3kOHP2bgiTfDBHJK/CMqevP1
 oW3emd8H3KMhEqW9HwgW4bzTkiIUgIkSw0CS/os5GK6bEv8A3jRS50wizmaKSij/DJmqnkxTJwy
 yauuZs0Sd2HxFITFWNv5IxPL9blpOhtgQaZviOcFmBn3KGY0mbnIn6cuaXbACC8H2b74lQXQRAD
 Xm30RKgAFAZRx5WVPFozoMsZx6JFiCNgHl/X83uU1UlxOobqgrf6HVpf+l6P+PTIX0M2mBREkZ/
 aMHzq8jxS+d/PYnOzU1wDj9CQ0IJ2NXlFMMp1byiG7ccklfWVJG0WU5SLHjorLK76IjtktFfL1T
 U+k6IBktWgDNVdBDhRSgRTn5aq1VgDSZhkvu9UsjadAF0FX3xnFO//J5dx3px54cc8vrrjV+iDO
 +mI/ECC0kKtrJeA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

One of the SD card slots found on the X Elite QCP board is
controlled by the SDC2. Enable it and describe the board
specific resources.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 1c3a6a7b3ed628e9e05002cf4b4505d9f4fb1a63..a82fabaaac9010ce3b8d6718b3425e84d8864171 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -729,6 +729,19 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l6b_1p8>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	status = "okay";
+};
+
 &smb2360_0_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l2b_3p0>;
@@ -870,6 +883,13 @@ wake-n-pins {
 		};
 	};
 
+	sdc2_card_det_n: sdc2-card-det-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio191";
 		function = "gpio";

-- 
2.34.1


