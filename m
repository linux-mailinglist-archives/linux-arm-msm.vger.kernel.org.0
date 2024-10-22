Return-Path: <linux-arm-msm+bounces-35403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE5F9AA052
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 12:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0B5D1F21614
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0EA19D06B;
	Tue, 22 Oct 2024 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O9uiQniK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159F19C54F
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729593990; cv=none; b=k+bsr/L8asGjTidKu/j/K+jn+VSjEDMsbB/aqKv9XRTsNtmWuP8gcwXbDylE0LtQQUF24EoIYJJVaYI/Z0LqZrs7cgZZrvaYhE5qi70r8SKZPOhYSlT27FInya2jdPvitKA4ISLWw5GUH49+2/My9EQDxER3fnw9pQG0s3eEp9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729593990; c=relaxed/simple;
	bh=HnTSSieNZnln6w8Vcr1MEzPJufKQo6Dj8CE0MlH5veg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sgkacqTdrLKJhztMD2hNQQRlocllPWg3VzBOHvVas4+VlDx6/WDB7ZdChR9mP/r1PXw6TFqaWZMlFpvQVTn/6ghbKEM1n7udEZMZpUsHDiMKTzknypvwgpfBhUKoEOElpjh5MyT12yKj6ZITdUxrQDtGT7to0LOeo8OiQ8Ycb/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O9uiQniK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315abed18aso50991985e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 03:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729593986; x=1730198786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW3qGb3ZL5G/B18IQmAOlU1aRnTk8u0KXdkSlfqu380=;
        b=O9uiQniKRrf/qkNkbF5hQJvIih9cywmdrqV0iiRLDqOJHLUZ+Ix5WA8Rww8FqWFrFO
         RCm8jctiRH0NG6irlsjJEdiDW6I8iuqJXG26d9dqb+jNMKiMdNXOmI9Gdk723/P34QBL
         2VtVcvYbNJ1x3RZxGmO4VEBr+2qt8eAqdz8r9eNicl3vGmND5hltelcRuFqZJzEyJZIq
         lxUpC8ehkUPQsCxOoT5wGUkmxYsBsC1XDGSNmocYZDODs+7bbpGXwb2tuYbUMkbvKlR1
         ftHY+lI4vTqKfvHVLRgfeadtxYUhrylVM1HjxS3Xv1l3XTCUYtQvhYiVBUluza199n2I
         OR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729593986; x=1730198786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zW3qGb3ZL5G/B18IQmAOlU1aRnTk8u0KXdkSlfqu380=;
        b=aV3OfDujuPp+bhpDeq4TmTR5lvBBL2/vD0MkhThagjW5r/FtNVZnYRHM8tlWQXZO0Q
         ZzEM3503NWmZTf9oudWZL7Nb8BBVOHk/2scHLhfweDbCnaAcmpBI1GG8IfOR4NfYvUKs
         iKjjQ3Uk189mACSpQvJvjo/9ag8VuL6c7WZsHxQO1SS4AOhiHTzsdWnXYcNQGx9Vvt/n
         Tz6ZKNngJw29JwJ+QASgPFls32JW3JG47qAq+lyp/pDMyufqhxKatt22SZAF7rjV817E
         OF6TQek7l3KSoDiioBy5XmCdGkA3V3XjGqF/VdaYo7PbcqHgih6f9QCDW9/dqlMBSjNC
         pOsw==
X-Forwarded-Encrypted: i=1; AJvYcCU1BDrHi9CYXnKYmtwEHm09/h6VGCd6fvi+jzW1EACHy3kojDx3gZDNmMPMIUKOZL9v3bPm9eT6ISIBLrvs@vger.kernel.org
X-Gm-Message-State: AOJu0Yygq3t3Gl6sNrQq+J+r2l8HIy6JDxuI4D1aqtETDlnNbIxGoWYK
	0pMtma28CWEfP5gQQCxzFwyLWMkiDlCdJz2bs9cHyZZ6moEkbl7ZErKOhX6Vl5o=
X-Google-Smtp-Source: AGHT+IHWyz5wiWkL1gLHnapTjbhzPMcFdILnDlv1ASWwLLUS2W9b26cj/y0Xv+s9Xpgn84JXtBikKQ==
X-Received: by 2002:adf:fb45:0:b0:37d:4ebe:1646 with SMTP id ffacd0b85a97d-37eab728744mr9793149f8f.48.1729593986521;
        Tue, 22 Oct 2024 03:46:26 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37e1asm6351943f8f.20.2024.10.22.03.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:46:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 22 Oct 2024 13:46:10 +0300
Subject: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-qcp: Enable SD card
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-x1e80100-qcp-sdhc-v3-3-46c401e32cbf@linaro.org>
References: <20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org>
In-Reply-To: <20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnF4J8X5kOFGgSwfgft9bWqpCsIXyCcZsi6r37H
 SlJO9TKFdeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZxeCfAAKCRAbX0TJAJUV
 Vt5+D/9jaiprJ3yJnoVGdRv2WEQiVxq1yOKMPMLfFMqJCmePNrorpIcfP36j8Z4TAKYkEEzjpji
 fSOXWFXSP3D2/6jx7o0QEA52I2hVATds4vgIsP1vtbiQi1AWS66AYusmLfdBVqPgGVhvU98DATo
 +ebifQ3Jnrin9h4boqjgMPpXLDmfon1kq7lYwGH0RxAkpnuuMfWnXJ5dfzJVRp+WssZQ7CUWEqF
 vfnqcc/eCVOukavPcQTkMZs7EwcIQrYJuIwlTkJWqhMT0tAFVxGYlu/4vIyQN+G3/YK977BPh7V
 Z3ZNwUAUlWmAV4T1fM9zxE213Q4GEffE57Q4BA8nbEiR3wqTBkYhtySYuV0Utt/C5WeeQ/gi6Yv
 WwmIxGS+/wakOcCKK2s88dZ52HBBWjEPGu/IRy9DwASp7RgheMhOAEKPRS4Jun8sI9IuHJ6ktP1
 H6cDqNlTUbtotZzsHh2n9Sn4BzP715zijwP7p58KTAZ7w+lEfhEv5RRgUp3x8JBaQT2R6r9Gh03
 /lqBX0l5L6r6tx1vD3ocYd7GjW9XNfVLSRjQtvW19PJqNV5c0Bttw/5wt/lOwj+qwcO6y8OZYpr
 zI4na/roGV9/WpjxnxCn4QcvoKPIJ+T3vj9Unsj08e9p9m9oH06UMDUl15WAtlj48r/fvI/4yxy
 mo6xw2QPHaje77A==
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


