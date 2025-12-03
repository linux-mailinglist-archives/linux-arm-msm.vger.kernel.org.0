Return-Path: <linux-arm-msm+bounces-84146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2322FC9DB62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 05:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 176304E0223
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 04:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB52272801;
	Wed,  3 Dec 2025 04:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K9u0NpPs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B6426F478
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 04:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734756; cv=none; b=LOWBIeJRICcwThXqc3y6JGULbIcT0U9TQsL156BeNmu2WWQfuQ16FdRq9Zfux1HdQutXdw0BunbbVVXMjpD2NAS6HCMxMGf2uqv8IrqwxSlt4y7RwJ1eZkWstCxaUSr4v7/90Ab13D3g5YlDPPEgmDhxgZGuVw592IqMKk/Blw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734756; c=relaxed/simple;
	bh=8gPTGSfVhldl04iagfbGMSvO0tGM0wITylkAZZbG578=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+9P35DjKgnGsPLsfRK92q6ExEcq9wC/9LiL5zEIUacUIXmj+c6/sl6D9bE6JtZ4riXMwq/XVDRu2DgJZdfLHEpskPj2XF5CjmzVRVDyrDdukefiv+AdRTuOsGjF+Vt5k2+FRYwElgS+elUFkaxqBwBUz6NojimJDtv0ADXFhs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K9u0NpPs; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37b8f270a3dso7676851fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 20:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764734753; x=1765339553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAq2J3qjMasFQ0CYSi/SkDTAJg6TbS3ZtIzBBvNDYJ0=;
        b=K9u0NpPsCH312qyJamaeFMfkUAIwQwvfTwe8M382YBzOPds0U4xcqIL8RxAgvniBam
         bKzTIAtvhOWelVOXjxSHqpm236EK5bKDNDaSfe5UnYpMBm20b9FGjJPejE/93Vxxn2o5
         VMIBqEliRaa5Hvmu6DTcZWhGo/xAaMRw4Ny1cGTTYIncxvGH51y6PTTUFvVXgObh8lMj
         jL/rDmcK9loiGUdn5ZsKdaiQi2AALniFQgeeInJx99OVKTNn+sGXPyHCYke2c74X7Cb/
         xcGFfgKpxSN/uQ9aFNuM4/88TVcmpvho9ws39KxFeAi+DycsLfOMj5Sp4F0cIK6zr/2Y
         MD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764734753; x=1765339553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cAq2J3qjMasFQ0CYSi/SkDTAJg6TbS3ZtIzBBvNDYJ0=;
        b=GwN/oEddwIVcsllShqvM//kGFQFdj8sSnp+fCU/YzQVz9rosmXYlrNsZjvQBk7UOUs
         ieZ5sRq8bYDc4FPpqJIfzFzZw47RtMxBCAgdA5ePCxGIqlNpCDHfKz83ssfHyV4pYuLj
         s13HpC9aNOOP6fNF1Z9RP2fvPz1EnqKZ/ThhVSIm7O4PGjuwxpqsqmkJ3WZcsbqfBgdQ
         ZVRnsKHkku849wywk5GCL7xytL3o9mBGtm15RAjq9HlM958wtVrW4tvf5OtSGS7nQBgc
         6oz2XAlSzyec2ndNKMEBx/MWeSQSTZMPcOtov4LmMo8PonNaqv17cZlU9tkna8sVm2y5
         daAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfyvQy5WlL2rjvl0rN657O5Xx8XlzatAnUiWe87bihKVxGX0FW3k804eaMwtCqqH9YW7sbML1Tw9oxSwPt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+h/Nz5rxUpR8WycjPOMb1BzZ+f7fgj0B5DU3l7m/FSxEPBYr9
	pjJkdIEQ5Dr25r6ZZHsW3wPVoXEWuXIrOHoDlfIDFtCgOEwx2hWAK+CIMbzQCq9oeUM=
X-Gm-Gg: ASbGncuI6L6qB0hUi0PxaaWwkBqvGuOyHZcqKAWbU2HVk8aJbNayYLwVRbABhBnLrJd
	OLNCO/2WwIw4yzzOuaCrtg0CAH9KJEL8oBdVs7uJi8GIAICxPfpKcpnFpugK6mhqYcHy4gLFHr+
	jd8uTL2L19rpKC95FfkauD928HDCd+2Mvomll811+FYz9FJ+mjqEMW+pQN5wXqfudnHtYi7xQdF
	tOv+KvcNOigEbHZnLR8ZiQWkkunSFjPkLfBj+B3pyYFK8n/lwYFC2/fpEzTSGn91HjNYcnaWjnh
	fyrHvdi993018AHy5TDiFCgEGKCBaIosyx65vmC91L5i1/CfcRm0QOHTm8wUKrik0wZxOXZSiEM
	E7VEpLBtxUg/O6LYXa4GNLWAHEd8kjqOohXpGDVoG1P3IGxVUKerd+agIZjTzqOWSVO6qe0gl0o
	Yu23mtze6iHxA96LV7RU5OM1kgL+d9qmVYsWIPjBRwKSgsHk38lbFanRk1jE8eT7L9
X-Google-Smtp-Source: AGHT+IHwgCJfY//qB4eDTqRZL9KBx+5vmclJk2v4zC0kAkBd2+Jt6HI/6eEu9Pe+sbdMvvdjNC/pKQ==
X-Received: by 2002:a05:651c:210b:b0:37a:42ac:fb8c with SMTP id 38308e7fff4ca-37e66cad9bbmr232331fa.4.1764734753126;
        Tue, 02 Dec 2025 20:05:53 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d240981cbsm39505631fa.24.2025.12.02.20.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 20:05:51 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: qcom: sm8550-hdk-rear-camera-card: rename supply properties
Date: Wed,  3 Dec 2025 06:05:36 +0200
Message-ID: <20251203040538.71119-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At first voltage supply properties of Samsung S5K3M5 image sensor got
names following a pad name convention for Omnivision image sensors. Now
the property names were corrected in the sensor dt bindings documentation,
and it should be updated in the SM8550-HDK with the Rear Camera Card
board dts file.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso b/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
index 66bec0fef766..e80de190eef9 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
@@ -52,9 +52,9 @@ sensor@10 {
 		pinctrl-0 = <&cam3_default>;
 		pinctrl-names = "default";
 		afvdd-supply = <&vreg_l7n_2p96>;
-		avdd-supply = <&vreg_l4m_2p8>;
-		dovdd-supply = <&vreg_l5n_1p8>;
-		dvdd-supply = <&vreg_l2m_1p056>;
+		vdda-supply = <&vreg_l4m_2p8>;
+		vddd-supply = <&vreg_l2m_1p056>;
+		vddio-supply = <&vreg_l5n_1p8>;
 
 		port {
 			cam_tele: endpoint {
-- 
2.49.0


