Return-Path: <linux-arm-msm+bounces-40808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F17F9E7465
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4A318861A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4800E212B2B;
	Fri,  6 Dec 2024 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R6mbSWtk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C33211704
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499202; cv=none; b=QNgOkc0Nwbn/s+AUcgHuK+zuvkpVr/Afjh00b+7LNryMSfzMScD8pcJveouoHl55ijoNdn5+cIded9aFY/Z1oysydnqGyV4SNLi+ASGDvmy27Bq/wNbZgJUjWkw+Tx8sPQP8GPZBPHaUNIP8jihr0HTc/+uNe5tRoO07eeeAuH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499202; c=relaxed/simple;
	bh=2fl2O/AUpR0bLpLteoMjAC5NAtdGIyzGUNZ1dSot4F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BRaZOSHicTpMAHdSvCDxxZ4lZSWWJ+oXaoCbd2zAtD/BvJJRB6t1wZEfWK5q5lbwZKFfHZ+zlO/JeYRV5+1imvI/JjTH7VS4FQUXBEjaAHEoKqbH+OiqRMJL1wQSp742EgSuaFF7op++AgGHtbP5Pejvs2iZiwU7iDVKGaqYcRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R6mbSWtk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a7cef2e3so2377455e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 07:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733499198; x=1734103998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fD/Cp4H2IwfTRceuKCiAIRFatqfvUoXRpn3HvEZXKRA=;
        b=R6mbSWtku/nxwBLjZUiI+aCFoISUkjyQKsDjZu55+8PV48GBx2crAigYXESeadLWtz
         UciJvlDqaiP56OBaTmFsEmeOBggqJLBpbP78uQEGswg/BCSx8RlUfppmtLym6zdZbwh1
         5nX/VI/VZU/bF2To2KliT49oc1MWdPJqag3bD3xFUJhAfJ9lDguskK7dQzpSzz603CA1
         NUj2GmZ2H0JKZIHGKblrMlQn8MKoiDkPjjxwwz4/kdoSiHKBXo1AqfEPDeaT0tIiW095
         AmSWaca3kLayukuddKrh/DVrlfPIGn9yAczjFGZLoCxGJ2lRVbDP6saPy0Mrb2mm+erf
         tWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499198; x=1734103998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fD/Cp4H2IwfTRceuKCiAIRFatqfvUoXRpn3HvEZXKRA=;
        b=OXICHvOJaur5sSpf6w0BN5vbYeha2YpvXDESVJAtB+EP6whkhwfv3b15Lnn5SHaW3e
         AWpclmZ/FAhbKNZcfHdXrlItj3QKDNvFetdm6xjE4+H1bCiBSUvygrKTjIIB8YTFTUcT
         JRUvlQ6k/S1YHbnaPdEwAlqkBQjgSYORIoIqXvQES2c6veNhpHHmKz3cTxVmPnwLIX7p
         dZzhl1GXeJ4ciNxGd7rcOGKhfv9BvAJ3Lz6HrqPXi8tbpC0QQwK8X0p54Ct3CjGMRAvo
         zi6up8Zb+W54Qzx0ZVHRwrub4PkHHx8nG92JvJHpXVlqqc9euAD27POfAsKRvsMpTU1Z
         gYCQ==
X-Gm-Message-State: AOJu0Yw5YBUzOylKe9VkD52Ot0O2+S0riGa4nS9ZM4C4LUHYIXeuMi1B
	KvUPka55kMJYCzunc4JEKCsUN0j23VWeguDOVqxuG1IVKjZNNlM3bsk2J7C0ePI=
X-Gm-Gg: ASbGncuBXo/ZP5adbMCi00aXBJ4nqzVzQcuyHKOqFLrGbx4zU6dSbJu4h1ouIqD5m4v
	B2kfGaj736zC3Mwrr/ULOxmQYbv5AZ2Kt6X3OnjOhNzwXSPSSuViHN5nfOWqpdzzOU2/YNOqQNb
	eJLVHnx9Emrub0f+XbtyjINe2dEmZhmYdOwgY9u/KiI5F7/IBud2ADvQPslDxsBg8MMFDGcNDmk
	iDbuyNAaE1Icews5crjQGFDOrMuImUdJXzpl8xj4V2Bhdzk6BH2Y1wdmHOm7KzQZg==
X-Google-Smtp-Source: AGHT+IHVxiR13OppEQiyXbPVNuiDOPexgg6Ygz/OZc+Es3AH5c61URgOHkJncWaTyU/GO0uyNH5yiA==
X-Received: by 2002:a05:600c:46c5:b0:431:4983:e8fe with SMTP id 5b1f17b1804b1-434ddee9482mr12894465e9.9.1733499197800;
        Fri, 06 Dec 2024 07:33:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113580sm61158035e9.29.2024.12.06.07.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 07:33:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 06 Dec 2024 16:32:40 +0100
Subject: [PATCH PATCH RFT 16/19] arm64: dts: qcom: sm6350: Fix MPSS memory
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-dts-qcom-cdsp-mpss-base-address-v1-16-2f349e4d5a63@linaro.org>
References: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org>
In-Reply-To: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2fl2O/AUpR0bLpLteoMjAC5NAtdGIyzGUNZ1dSot4F4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnUxkbIdHwPb2WgSA2POWnLBssRbuZlxIhRdgpG
 Q8Yex8bh0OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1MZGwAKCRDBN2bmhouD
 1zZSD/wKfXn/j+J154hZg6xr0BFcJ7aBsKJUwGc3nhDSs4hEXYl4LgiGdx5NeUO7HoylOD7XWwD
 Cg9tOULYtJXcXwxRxCv27EmqwK39oUA3TjOoAvmlUbjb/bbQlZFehaIDZh5vhbj3jXxdw1kMAwE
 yCTQpyNDEo7Yq9rQP0u4sFt+vi88x3z22V8j8dwnuV+iTIGSwu3ZW03Isf2ThNjkd4/Wi7i/wpR
 QAuJtGORtyKdzcEU0UDYiu2uShZBwb9lXs/EWqPpzxH/rJCu3nu99975U+UMWnPtijQWJ29TF0p
 XSG1Kl7j++5Ayf/pk3gIF+2VFcEzry2DAFIrurSkAeJyDr7N3PDiJgJjZ4Fk/UCdMURqqd5XZfR
 HVYCPIIL1x18pQ1I2fjNIyE1yDtcJ+mQbwsGCHw7QGldxROE+m6jsFHqAgyaeflgMkf+O+arHd5
 l1UJYTVQ4yyuFJtQcYUPIfUn4UdCWZpJchgTMuEwG88GM2kDfYZsLKN6XCr2bs9zJJluG+4kK80
 hYYUEd1QSoe/FM3xROTM4uFKyawt4S1r3vTiluNNXyH2K5gebiiSlyzJZDCkmfvmbOi+iZCkBJX
 TaoGptNQk12qujXhhfXRDiUpqtXs0xr1tpiELEkKM9iiMWcnBXkGZ9jDXHqPpdrKLsjGeku9dS8
 isP4BXTOh21kI2A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in MPSS/Modem PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
copied from older DTS, but it grew since then.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 3df506c2745ea27f956ef7d7a4b5fbaf6285c428..64b9602c912c970b49f57e7f2b3d557c44717d38 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1503,7 +1503,7 @@ gpucc: clock-controller@3d90000 {
 
 		mpss: remoteproc@4080000 {
 			compatible = "qcom,sm6350-mpss-pas";
-			reg = <0x0 0x04080000 0x0 0x4040>;
+			reg = <0x0 0x04080000 0x0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
 					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


