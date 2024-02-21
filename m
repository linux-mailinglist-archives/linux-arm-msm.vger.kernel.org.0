Return-Path: <linux-arm-msm+bounces-12074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6091E85DFF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 15:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0F11B26D60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 14:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D261C7FBA2;
	Wed, 21 Feb 2024 14:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9YN178Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F2180601
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 14:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708526343; cv=none; b=cPQecjSyLInhnAq87yW0nJHxkhvqmEn86bmDPlb/GyZaip9R5k4fDavRwH8Wg5n5o1SgHWCnQTiNdLbMLj9XsWYa1GF0AqpxaK6/R9+QSX/7ev6bk7bGjjHrtmtwcOUrUiSRYouQfEa8mFx3laBmewKG7ycTHKHHfgr74BTc1ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708526343; c=relaxed/simple;
	bh=NdMZsQCHyDfw5FxmmKzy1ixpjMxRsMbi4uk5Uhz/3EI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ulxLl0pMgofYtMEJBMli3zjPZNW9gLULB+ouN8iY06cH/K9Yy1lSgZoCZLD1nt0MRq0M2d6cMJEa8/Yz2DgP4GX+zjywFgPw8XEW2ec8ebp3zGDXD1kXlj8j0HiTPCUeNAwckm5B2/JHKHVFl+AgbHbIiLqXiXA078R6MMnmqVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B9YN178Y; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5650ac9a440so850975a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 06:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708526340; x=1709131140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkpQ8pQMIT9WUBGGMu/y7XNXjhOVEi41ToHDWoFMF8A=;
        b=B9YN178YOJt+STQaNoQRUt/U2Im09H4naYqGILnSWUV9OfncknJ40mEU9DeWgOk7SB
         Cv8/HeFHD33hZNw2jm2G+WSf4Hz657DwvbxiPWtAVEsVo0/rz+GEKz8snHWycqOtOjzj
         GiXAVShhk5RkoSDo46pA+7n/DJ4qinveo55ywld3WnEGV0qf+l4de6oWpF/U4GaKJddh
         qKJa6fg/Wvwb6q/Gg737yIQ9lYOamnMWmbYL8TcAIMFkW0/5kdCaxQd/pSG6dEj99XGp
         1KIUx5NYwuKTR1vPFUTZb23FoaQcn6yPinGwl8vtIzoCYA8B18RwluUn3IbCy0dVj7zc
         uUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708526340; x=1709131140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkpQ8pQMIT9WUBGGMu/y7XNXjhOVEi41ToHDWoFMF8A=;
        b=dSSOiGCz/3PI4LcUUMmAF1LKIsDwAdVk68z5n9TdXMaQyxBza6nTfPr94QErqKsoN5
         jtDAiwfQiz+zhDyqtQbWJf4tIIvPXhgnQLm3+DzR96DEGJf8TwavVTy/vR6owR8ammah
         1JTaSje3zKrc9dShBtXhIQz7nEC/VzBHIip688/wDOIud29RKMjx65ACkGuqBjtaePB1
         jJsxv8QR6jjB8fouVhMZgQe9iGqOylpGjJqnMqv84a+qqZfnQL7KPuSDQaoXWOuxL35i
         xgJGFZMDb/yXGZcsWN8jd29UXQ/OFuAvuVecpvjWp8srzK1tFmYcKvJoAYmmxM+nvEZa
         5EXg==
X-Gm-Message-State: AOJu0YxXkjapzWtHcKKls/qUnn0jQJkbCsi2gt44rzj6ySTaTZYsjzg9
	1vzWsr8/E1tcSypyHcAT4WeTTpKbVL0hh1NUH5b7deq8qdcRVn+2WEUS5HkUyALtgBHthsAGo+6
	W
X-Google-Smtp-Source: AGHT+IEu5rk2ggib2DO6P5Av34zzrcvAbzt3sAKGDCfOwmC97l80tisxuJhuFgJTB4SHd6Fzhm15IQ==
X-Received: by 2002:a17:906:7141:b0:a3d:48d0:d518 with SMTP id z1-20020a170906714100b00a3d48d0d518mr11820750ejj.53.1708526340057;
        Wed, 21 Feb 2024 06:39:00 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id wp12-20020a170907060c00b00a3eb953335esm2653970ejb.44.2024.02.21.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 06:38:59 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 21 Feb 2024 16:38:34 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add repeater nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-x1e80100-dts-smb2360-v2-4-037d183cc021@linaro.org>
References: <20240221-x1e80100-dts-smb2360-v2-0-037d183cc021@linaro.org>
In-Reply-To: <20240221-x1e80100-dts-smb2360-v2-0-037d183cc021@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1780; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=NdMZsQCHyDfw5FxmmKzy1ixpjMxRsMbi4uk5Uhz/3EI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1gr8eLIgSbl1/jlBxAZs3F+95jN8hJWf9Tyhb
 dmrCw0ZOb6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdYK/AAKCRAbX0TJAJUV
 Vo9AD/wPkKkdRWl5Yq4nIOcQdiNBRB70cH0xNpx2vJV1XMxaFNyVYIGsRU1pkiM7ZODfbTZq4Gm
 ynjhrueB6NM/ggUe+5c2CVHWx03zXTLkJ+G5+tCXtMdcn3yxjwy4XTB//SNaKCA3BU5ZG4SBj0d
 qifWV5QsZTg0oLLDNcPvSlSsJO2uoybfzOFfDcg7gIH09RHHYFD6iRY4XkAshbAkJ2hZ+x1sNzp
 epkHpQ13xse1YWjDHmdND5swblg9/Lywky8XLiUVD6lPrSA7lOl2xINbkdLNb+SO9IjNBfjSY1M
 +IWZKcnlXIk4mdFpgadA8n5eMz8b53ZDdT9EVUOQ1/jHoZ8zNQ8L8D07TC06pYqq8ZbtgH8yg/D
 XKDZ5VpM5Gp+uwpjpepAJNPijNdrMdaoI/wd7syjjEiX0/Ch57+TPDHLFBmL1Mo/H6hfckISmI5
 /X5Z3dGIbFyl39TiHf4cgxBSmPRmCcKKcXalrYvX0gbUGpyLq7iUTj6V6Yx1Hdb6ziPOuwdgTx6
 iU3SABdu5kV1aS8xQS72hReYMmNGd9KjQV8lhm4nQKbZtuTGVE8WThdVBrfGHwRcafmy0Bpkgti
 xLyDYOmxSFP6PE13Hla2lsHkbVYC+4a+V62zM2DX8UKl6YKuuE39QX3RywqUA51Jb8czaDs1bgc
 SX8pZfGHupvlsCA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Include the SMB2360 and add regulators to each one of those 3 eUSB2
repeaters. Tie up the repeaters to their corresponding USB HS PHY.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index e76d29053d79..2b960d31b261 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
+#include "smb2360.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. X1E80100 QCP";
@@ -491,6 +492,21 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_1_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l2b_3p0>;
+};
+
+&smb2360_2_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l14b_3p0>;
+};
+
+&smb2360_3_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l8b_3p0>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
@@ -513,6 +529,8 @@ &usb_1_ss0_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&smb2360_1_eusb2_repeater>;
+
 	status = "okay";
 };
 
@@ -533,6 +551,8 @@ &usb_1_ss1_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&smb2360_2_eusb2_repeater>;
+
 	status = "okay";
 };
 
@@ -553,6 +573,8 @@ &usb_1_ss2_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&smb2360_3_eusb2_repeater>;
+
 	status = "okay";
 };
 

-- 
2.34.1


