Return-Path: <linux-arm-msm+bounces-45138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0992EA1252B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 14:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21003164354
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 13:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CA4244FAD;
	Wed, 15 Jan 2025 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/NEDQo5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35CA2442E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948650; cv=none; b=JuDEthZws+bqOTTXaeQ4LjuIweJfGP3goTIUE2n3cd8bKJDYgR6mXCKakVNy5gx3A7BsQ8c547NLKJqYZyyih+PMW4ONDbKWp1ursfgpJocbPEnlCkBtgr/Lg2tc2qmKBMWujFVQbenqYqLm9j0N3rIusckGvqsLrcFppD2Xb+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948650; c=relaxed/simple;
	bh=G+vZObNnRDWqAE6J7EdI3eZxpn513I1znR6UzYgEtJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAa3AajtMFtwbZuHHV3vsnmQibOWOxQSBrZco8+ZnJQ5xRLyo4nm3lSn/Qp6hZAZ6edGVRbmKaMIe+yli2OYE1KANDI931ZzfKvBZ6VSyXn4E+0yDLy9/60u/Qo/ND34duQzaNj1MUevq4WqmDNqaQJ5DcvML8OdbjJsg21kEbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/NEDQo5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361815b96cso47953145e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 05:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948646; x=1737553446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhvyVviTU4AdLP13f2Q2+Swx0qWQ/KJ1oK5KBR+xFKA=;
        b=F/NEDQo5M+6JGxpYTeE146Yf8JUBG4iRW5wEeyLzUdPhBp7YXDkSe69R83RK1Tdkgt
         fYbaL9VGtWngYohvGEG5335drRmsKjjVMZRG/wTiwvN5EaiHHYvvumt03pg9RTXXiFc3
         YosKS1TDzcxB01xJqfTg7wCsuk4rFQtyJJVP+J7MKbzIvg3ZIrmKG1goJyVZ9BLKqyII
         CVkWq7yL90CSfD4T1eLu+TATSyb600W/iHuQSr3FkiVAIlKb2sU8RC8/Bq/y12tmQmCW
         VjeWkc40EodeF5gVC/MPvcsqTh9efQiehzGNG87kF/Dz4leKP1HREeXLaQvP3C4Qv4MX
         ckvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948646; x=1737553446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhvyVviTU4AdLP13f2Q2+Swx0qWQ/KJ1oK5KBR+xFKA=;
        b=iL2WqHUIU9MVyxbaq6vNYxlKcQQPTLPEeGma4VgbGcNcn9Ix9pnIVu2ZsS1wBJNnT1
         /+O9e3Lrj+qFEvTccyKj50MeejSDSpV5gO5E39Gai7eC/PWJqbEoayFvIJinveQj1Jxv
         bW0FbNCXKc55F0Zzajegwl1ev1yzJEK22+sbsjk0gXE3CEsg2MwyZv4IgNrlCczGOIk5
         CQVLxP4YxkZ92K08Hgtd89QU0F+/AMHFCHx9OfFTgzznS3x9/h6pm005mpgl/8ZjwSmF
         5L/4Yu+1cCLMM5rvOiJWCDRaWswY4WczgX5nDijvNvF3X2k5li3UOCbLEtIekE5oPwcx
         2V+w==
X-Gm-Message-State: AOJu0YwX/Y+QTckhG421L6t5qatpznpifBZnCtJIPCblqYLpF/vBLXZ1
	ms4t5JOPxD1FlLZSig8DQvP6Uc7uqAo7Svz/2zmhxQs6VxFF0whCjxLnz7KWLKA=
X-Gm-Gg: ASbGncvrUJVJD+3uKoyPKGgPK7OLlePclmjPIEFECirDyniI2y0jDTZakSUQWVF7XQx
	IK7ni5njsnUiBojk/Xy6Y8aTVeb4GPC42I3om+ZHYN36Ker/Lz96SdEiAK3TNbDI/Jb3CcpthKK
	AdtO4MudVPDQ0BeGv32wbhmr4lo47G6NQZTAIBDrol95JFnCyB4C9Tdqm4UlxNoLvDtqgSsvAjH
	xVOz/q452elmxQumoq2dnEuQowdcDilT2xz6hVCK64+QXDvjBnQGOlY93+6sHVK/GEsnjqEBxK6
	Xw==
X-Google-Smtp-Source: AGHT+IHzIBqL27LZE9vCqM6EM7Bbpb+1qg9xx45Ns3NFmQfydoj8etGWJrlR8QXtZ4kccYArfEHRTA==
X-Received: by 2002:a05:600c:1884:b0:436:f960:3427 with SMTP id 5b1f17b1804b1-436f960357dmr115648405e9.22.1736948646182;
        Wed, 15 Jan 2025 05:44:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7540ae7sm23454655e9.33.2025.01.15.05.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:44:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 15 Jan 2025 14:43:59 +0100
Subject: [PATCH 07/10] arm64: dts: qcom: sm8650: add USB interconnect paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-7-eaa8b10e2af7@linaro.org>
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=G+vZObNnRDWqAE6J7EdI3eZxpn513I1znR6UzYgEtJ8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnh7udSn+2/bhWZ2zBwrBRnfa02lshVMtGjp3rdd6y
 coLFAV6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4e7nQAKCRB33NvayMhJ0bxVEA
 CdfWZfgBJlv8cQzBPlvMNiNcHfzsVFC4jDBlNUOzmYndIQTR2IblKjNuyb4oAs0yntpXT5x0B+JmcF
 B6YugZtWO5dS8bxdeoHFzQeg/NYtW7+M6t4sjrPreVLGhCgrWKsIDLkj9292rJ3tVvQeGeV9LlAD+H
 cp87PggkCNsvNiFhOSyTR+ShL4/Qf7ZFwqK6ub6w+S1ZkDkA02N2iR40yduJeURx3XB1Qt94kgBi4N
 lRuvcgncMVeeMuaOvnaiXY2bfb7Mc8b5lMwaV3aHbyB6gB95LMmbrhNrr5qIKlNyH6ORRjGqVZWnT/
 grRgAmYqzOaZnkX2jx6M0B7n2eD+Vts2ztCC0ohH/YI78xT4Azaj+FraaJDLZOjnICRhYWBon8nATf
 aE8E1ITbd3/JkBtyMRUxneGf6V+xEf9ewA7aPChK1GmJmWwWrXM0M9tfBfldi3ybQ/AJeX5jqfURY3
 7iHCJr3JwKME3xWf08WgDyai7iXn27/2ilcQ/kdoKUpUzFAV8l690kWbdRSWON9X3v4EoiGqRcM4I9
 cGeJoiLP1KUVDrbfC2fH8Ho3vlhTJqzZpMYvsNBOtWVc3wx6SlePpGtB8iZeuRp6LgwLGXXPLSPhQs
 gdlLIdy8esNCP1/oXoRMXNrVjYuIWoMh4Z+YjjsT2LGOgvJ5hCRt96CHu8XQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the interconnect paths for the USB controller.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index a72087d5255899fba03ac90a3f0241ee3905504e..5982fd4d66d903d638f0eeaaac221f3007abf68b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4148,6 +4148,13 @@ usb_1: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
 			power-domains = <&gcc USB30_PRIM_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 

-- 
2.34.1


