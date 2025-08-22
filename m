Return-Path: <linux-arm-msm+bounces-70407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4736DB316E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 14:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23CB4623653
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E2A2FD1DB;
	Fri, 22 Aug 2025 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Llma4aak"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC49F2FC03B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864279; cv=none; b=qCqMvpKoGh1afsno5hkR3VpT5ZrYuxWb1L2NM2BE0RgCJO4nUcva01A4MwMoU4VFLv5Chkie09FtQVxP3Hu859wBBHP8Q/t/dHOQGHouyO2tnwDJbsE+Krr36nlWXJzIuWmyG53UGyBwMhlKIKRcYtrQQIR3DLMITg51MeTcAMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864279; c=relaxed/simple;
	bh=OCVEyfZsmduHsQ2pwqWIjQ/SJx9iQwmx6PReC1njVEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JyGITtzMnlLx9TL7bB2nukSwN9I5EPVEt70yrGY/p8cQ9w80Mylf96vA3DVH41iLbS8XbL4X1uKdHo2D5VCSWonD3Kmoc2xkj12/Y82EqB/dOmARtqjSG1h0bUucqIHoLG/AdTKORVozbkHpfeBTQLLvZvHYauCi/Qd0iZQ2b1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Llma4aak; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61c20df01a9so85003a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 05:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864276; x=1756469076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbNbh1uggrI7c0rz9EqY0zCPLDYtUgVB5Awc7BjaJHw=;
        b=Llma4aakW2bOZqCqJ3y3PL8j+7mogMGCSxtBhBVSQRTnTksmS5o2uggroDsxkoHIQU
         kZUW4B+UYHEZjqystqHgkE4vlGEsDw22wkFv6vgGP/O+P0m5rzYu9STeimnbA3+mZ6bZ
         fxlys3ZBTu0bYtdVb0X+FfCMeIA/nfo35JZ8wM2dr0LtAf9pBwPhN2oYhvnrebAja7A0
         xNYtzACnRREIbdfYRu/NnrO9QYC6VcWMlM/ByXyPueJN3G48maz0ot4Bqeh1mMPmAIMW
         NnO4lhtbAF7b8/P869/T0yCMNa+WrRcrsQL3n9/KWUmSUP4ziRv6gEtnZ4wMeevlQdab
         FwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864276; x=1756469076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbNbh1uggrI7c0rz9EqY0zCPLDYtUgVB5Awc7BjaJHw=;
        b=gGZ5ekozoKn4jGio4ADZPZ9ACCwEr08SnpwCATE4fjushufjQVgXvwyJX5VCq+FeF6
         8QFRV+eXETlOv7rus8S8DoYsLMqq8rRw+aIKjxTwNHuJ7HI8icXM8zzF/0Mj47e7Q1SM
         k/ZGsP6gRA3BLaFM/27GNIb5w0ELe99GMIurIegedxRJzPx/vC8b7VU42kukXIB4c81w
         4tm+M3pptdbfBUSjfAQSyY5DIt+D9hdQTqiogvyP+j0JvtRQP/BgypfMBVWSAgMPiy91
         wJbQ9NbviviLP0YuUd337Fv9JwDI2eAg4E/xkcCqTCjY35hyEizXBuz8DlhrVX/WliJj
         Rqrw==
X-Gm-Message-State: AOJu0YyLF0j6DyPfJEfNe/Ixy0FeQtaDi8lbTrNOedJco0BxPtS/hCx4
	RERCoz4i41vgmJNtLP5yzHKsywRzdoZkZJqaP6t8mrbKKH7SzrLwFLbdRdHshJ5XKnI=
X-Gm-Gg: ASbGncuROpIdbJ+oIfpgJqLaYObKZ8p115kS6Rhv4I87XUwzwm4Yt42QjybRQFHvdIt
	Inca2yKwjn4w55aT8jmaCWMcDLDkNd69NgPrd3l2m5Ya3nd2lQGcDLIfnSxWihq7DgL24K39ksx
	PYwaiJHdCpdT6RThV8sc7Hx3cPRRP0vZrY5ufFsLk0BV32LiLp50wDrXtQpk1poDsddskYvhPMC
	ybtTZBooqNpwRpWy1MpFjftEnLJ+s+sHIMdsuih9ceqQ3jaEXWr2YC1n21IbeBpGYw4CZaxZepD
	GvZbcvmf45jLWDgoZYcFk+1R4qzn73uHnLeHnHpSoOULVZxDp+unUKqSlWzIgN/l5xlJ7GehOL8
	HUqxYMD6t3/NkrOe6FNf71JonyBiz4FyAUajdsG0=
X-Google-Smtp-Source: AGHT+IHgbtme2gSQCnlMKJRH453zapVNKI2in+vG3hMMdOFmiOOPEHuUrAFiHlXZjmT0ZZA6WVduCw==
X-Received: by 2002:a05:6402:34c7:b0:612:f2fc:2b9b with SMTP id 4fb4d7f45d1cf-61c1b3c8ab4mr1076837a12.1.1755864276058;
        Fri, 22 Aug 2025 05:04:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757b9b39sm6690444a12.48.2025.08.22.05.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:04:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 14:04:07 +0200
Subject: [PATCH 07/15] arm64: dts: qcom: sm8150: Add default GIC address
 cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-dts-interrupt-address-cells-v1-7-d54d44b74460@linaro.org>
References: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
In-Reply-To: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OCVEyfZsmduHsQ2pwqWIjQ/SJx9iQwmx6PReC1njVEg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqFzAkYzjEdMLyDADg2ES98MKYflaZQHXEsp1B
 qL3wpzxTQiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhcwAAKCRDBN2bmhouD
 18ppD/9TXtTJUS+UEKMaIZ50PrAQaXDRs1lfAxcJOsLj8GJoQGE9huyrxT/MO3lTK4ykZcc3bDC
 vnfRXmQg0VJVt1Cptflnl/fZ/WBtbt5b5ViBTBwIdWK9Pu2vnWr55eBYjMzpF11eZtr+pPNq9l6
 PtEN1fTEfO5oM1ChlsZPNkJa52ZgMuc6z8UOztLf9G3QjT1s1yV2C7L52thf8ZiEL2tcsALOYvx
 QpBag2KaLDSNOY23wO9ZvXCEoExVZwpI5nKthsgg/g5H1rXTdXS2e1/9GRBdEGq8OiOMYJhE2yW
 r5yzq5b67jQ5K+QtzLCEjILl9dS3BoxYURzOpsk/UVcNYcMHDXHlTwff9zNQEJiI2GECXcfOlGE
 ExK6C9Llg2bd1QUL9sXwDM71oThQrymSVsueMoC3qtYStQImzCaIXPo01QJKI12GGeYgky7Qlg7
 3ypiB7OSBdNglg1aOLOqfk8bmwbSrWnfl85lc4fsWu4FMkBpY3lCH8bOz2ht3zuBnb15O1PKAjf
 +3aXaFeHHfVmmGZCra00wiyZeYw/4iyU+4hLYwZTCYDvFBZtlz0wCagaQ6B9bl/SzY4DkXmzD9z
 H85fe8JKFNCPO4wMkJR8l6J3cL4w53VT5LGxB4ldyx3HWJ6gZW4DR9u53h51Nbu7vTeXBQzn+aw
 uGiWYuvN6oKwxyQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 4b347ee3244100a4db515515b73575383c5a0cb7..12e7b74cde520009d73d381adfa1deeb8788621b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4366,6 +4366,7 @@ compute-cb@5 {
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			reg = <0x0 0x17a00000 0x0 0x10000>,	/* GICD */
 			      <0x0 0x17a60000 0x0 0x100000>;	/* GICR * 8 */

-- 
2.48.1


