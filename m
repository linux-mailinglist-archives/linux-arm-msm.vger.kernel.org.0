Return-Path: <linux-arm-msm+bounces-34250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B85699C2E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E5DD1C2109E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 08:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EF115539A;
	Mon, 14 Oct 2024 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C/N6EQyB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47154153BF8
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 08:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728893992; cv=none; b=d0CZR1CCmkCBdBtNp8yGQu4xydZxYvKy5FkNqm0G+erIODFOnRdyNG79zgHF4dl3kW80/CT4WyS1xoUFs/CaBc0YzMmXbh5fr/KlCr4FficAkVFeVIFjfmK/jGS7UCbhj9Xov2441Q2nHSrxuJP0q0QSoQXfGz3XcQUV2f499AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728893992; c=relaxed/simple;
	bh=HnTSSieNZnln6w8Vcr1MEzPJufKQo6Dj8CE0MlH5veg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PERE5wUbMUNrhnagin5L7Nj267bXmNdbeE6oNqiDsaJlNZU6rHozrrOm86WrFqY200IZ8CfI1kfhMoR6y1ADg4tZAXsaQBtyco9pRQWObi66bZLeQensgKPo36rSUokgRC4sHxlT6eQQ6EdHVLk0N9fwBZTDuBye9FH0gGJSksM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C/N6EQyB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431160cdbd0so24589125e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 01:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728893989; x=1729498789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW3qGb3ZL5G/B18IQmAOlU1aRnTk8u0KXdkSlfqu380=;
        b=C/N6EQyB/aI7mLAL2LO840jSPOzUGlxp05zrQ3G9JpfnNOIi89Kt/efUB7/gplkBCQ
         rmmTvm6MCuFlE0GatqSxsGDurJts57VggHa49FoQ6h4lKN5ciZ6jfmOByKTu4mdjlnE6
         k5Te1OckxgPhemuB+30Bhb4OnD3Rsziv5qxXtfkbYDUEA40oMYav+nrXK38JiY9chjOL
         +F4+Wwod/m6hdUxVWuCBx87u33+SKgLuQ+273P0NA2cfzyJVshE/yYRm/VxuQ3u4Zd6o
         QcP3MVsY7lWzgBWZMBreKBmPpORJ7otwFfhmV6lcqAYHwDDGJa8uIO0C+lWsbNS1OYYo
         KBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728893989; x=1729498789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zW3qGb3ZL5G/B18IQmAOlU1aRnTk8u0KXdkSlfqu380=;
        b=NWmlyCL2HD5KYqypmtx8e/k3tv5uaBQcPFPdgowuGbaUrkB9NHUHcOK3btru6YQByl
         GFQxTYMWi2AJHgfvcM1feIQJTtvGSF3L1p0R+pw0JHhG6/7XIWZ4gAJeeP3ZErEwnaBO
         7oMWEhyeco+1NqsX1MvHxI3gAanAktTtOVed5zCjyypSKgwb3eGt4WKIZomSjUQbXr9O
         +YvSu+Hey9JzClQ3S6YtOAZoV4knTiAff08tC+8fZIhRV+Ol0Lnv+x2yfHcvTub/Emsx
         aNv5IkJF3t4VI7q3oXUKC5+5W5NW100x6ZgI4A45deT5zMzFgMaZcFYnkHjAzqpUuMl2
         HlpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmcLgyyXoyrBwpqkCnCM6HYf1kMkcAj+5rHZpDEEYF6Um3l7A+nrbJvqceUSB7tt+hjryaLZ1TyqXbQedC@vger.kernel.org
X-Gm-Message-State: AOJu0YzTg0WTB+galbyk/JHQGNyCQLv59xCDs67iMGNsnCPgKL/LCzdT
	ik8/bTGhyWcGrR472GZN7B3WGQ/DcdDJd8xWYIqkOKTE8yHpTyBL66Yg2RzVGtk=
X-Google-Smtp-Source: AGHT+IGxn+WeQp9+QxMCE4CBztQKGsBv9JXvh5PNFEr5NEqaEOzVYJTaKsDMBs2RvhtpyVysbWTIDA==
X-Received: by 2002:a5d:58fc:0:b0:37c:fdc8:77ab with SMTP id ffacd0b85a97d-37d481650acmr10412332f8f.7.1728893988606;
        Mon, 14 Oct 2024 01:19:48 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bd04asm10715752f8f.27.2024.10.14.01.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:19:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 14 Oct 2024 11:19:26 +0300
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-qcp: Enable SD card
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-x1e80100-qcp-sdhc-v2-3-868e70a825e0@linaro.org>
References: <20241014-x1e80100-qcp-sdhc-v2-0-868e70a825e0@linaro.org>
In-Reply-To: <20241014-x1e80100-qcp-sdhc-v2-0-868e70a825e0@linaro.org>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnDNQdM0pI3ZQ8YkP4iXpuc2dWwsY1N167CKnpi
 rR4dY2C2IKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZwzUHQAKCRAbX0TJAJUV
 VpOnEACkzkNVzJuydaaRA4WznajS/7DEI84hieTuM21xa3ar1MODXbdQ7fKzg6ljeRpA7Vp/krf
 sARl2fPNSi9UR1Cq7G809avY/P2KNB4qXsh2ZiNVg/iB8jOhOcZ80/azN92s/CzW8UqUAvwT2fc
 3CpmlXWWmadgoivighiTaRnPVTMHU1jGKrvhGQUDU4k33iB3Ohzp87xXdm+L7FQbxG/jsz7AFqG
 izvUcpQVdlUvBlIgl/2B0nNkTuvB4V5H/WM7e748coIJHJSuN993Y9Ap1heaXZsDwWrFh8XTiBL
 Z3qyyBStp3YG8dZZR7aQOGcB6Jjp8Y4YLcC75RhGvSTdrYJW+a5lbjU93jXoCQve9mCMwGigtML
 u9T9MqOfHq9UATI8OXehod+8mmv1TXhOLTAl6VrVv3Egyn9BUk4cipk8EJ7P6B+dA+awwxaQDOS
 LwQ9wKlYgHPVU6WdU2yvZpOu8ODO+SiAcNVrxVT2dRRLIefR5o8zIijecAPgAXrvMgQelO4PiQI
 12p7TsBeoQ3n5k7Q1JpXcex4kzuCpTGda0SpPuhG25h8D53yWyuYLbIgavFs9iUapkUlrusCs4E
 DkTGf0j4rPqh3+xJYCJQurphsUagG6ksRAE/Gh2+JQKePxZ9zJAfTQewIPfsoIo+nNYAL+WYHEu
 6Kegb85WoMl1i6g==
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


