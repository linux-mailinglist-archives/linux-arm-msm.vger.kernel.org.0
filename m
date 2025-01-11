Return-Path: <linux-arm-msm+bounces-44776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC93A0A1FF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 09:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CB8916BA17
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 08:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E23315B980;
	Sat, 11 Jan 2025 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIaM78uj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D9324B22C;
	Sat, 11 Jan 2025 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736584427; cv=none; b=eiFz+lBR0fwXvOa6IQqI5wcxj54jMYS3xPT1DmL9trN+dKBIxVE8cnlgkdwn72HsapWEJCrmrH80c1cvIoiqeEBCuQiC60Tg+tGhwMxpnPNyPxPwDRhtglsXuSwDre9Doi8MkoSKTGBggEf7OCoAB4dG4oHQGkTDXPr1LDxeI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736584427; c=relaxed/simple;
	bh=ySnKGRM/zKHx9eQNSC+JTuF9YIj++vO03SwnaqeqVmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPcok6Ld4lUKuYC9PA4kr8aJWUYgTKoDaFGOzFXSAAaVouhxYbG3rwErC5HJFlt5Ae/DkT44PxT6ncyIW9csNpFS//d5lX7sgoXf40okW+BssU+++vzKskBCg6ZNdToOLCWGMh4LTyxn1feusaHhT7sw7/QOpyWOAig5fGMZ36o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIaM78uj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163b0c09afso49908095ad.0;
        Sat, 11 Jan 2025 00:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736584425; x=1737189225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4b/LB0Ux4JJmdMJUe88KB+PNR+gt0GjqvwSU215vkE=;
        b=DIaM78ujPOsPmTz/XcZuAm7zE/SvAEJHexjT/iHctklJBcePVa87bf0BcFI7gBPPEp
         uzH0n3sTT65YHm2qePGhabk7S6itDAnmp84XshF4ZTTe+quf7S9BdzfY7Bfwign2IrjI
         IzJPLJhDt0XUy55SPcQT9pEmP2wU2efDfqhkqbkBkcsg2wCcIsDBUfKu6aJK9e350xLJ
         ZNhrTx7l0qCqqS/xnEyGIxpBvcs1iJLNZ+CwbVuel0lnrSLnlUnBfXlng49r9xi9hWIt
         EAZ4YCLo6wPAC7MmAEdW88/VKax7wPn2hb7gSmAfAp9HSoDoW3rfiK1BWN+tJ98gMUIa
         lt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736584425; x=1737189225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4b/LB0Ux4JJmdMJUe88KB+PNR+gt0GjqvwSU215vkE=;
        b=uFE5sM4eGqQAFVm21z8q5uiZf5mWhv67akmJoI2Rq3GnakNehfH+4Ubx/UPzSJ5EWh
         cVLg8ekxQH59hqxYdflpnFRo8LiWU9jpLwRYT7dJmhUPDCssSxe+iTa/GabikS6DBznh
         ijXSDFApN6VLIu7pG5pboin8ZtovAX4ukbNi+ygEkq9DG04E8n7PiunUyyAC8V6NFDxz
         BQaC6SIg+u6DqILOXfFz37byUt7WcNDQvNtFCLKOz93SO6zCWGIuxLIeHGhYYBgGxaI4
         pZOS88LlOILcysP1E9kQ/2W5oHTA5r0Qi2+3srdXzo7fpdOsPWKdTCoOjIzH2zHudS3m
         3j5w==
X-Forwarded-Encrypted: i=1; AJvYcCUygAj4ePAmQiGMJ3Hrcsu7HvbJEtgQg77CZvXzD8K8v0eKob+jO0sd/+7egIaihcwU5gNTqwEyl10txashhA==@vger.kernel.org, AJvYcCWRdWgKPuB+sRvcOpevdF61UTI+bTZ+CyQ147TE7YgF9VRE/wj/3kW3pFLmkrLgRhcPB0ibnZQpz3Nm@vger.kernel.org, AJvYcCWoazKgmiaKybstP+9iMsh+SMCiI46TByRg7QcHQEvIGwkr2pxG7kuH59+CRscE9AR0JwIlVp/0+POtl1vt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5zgxa+fuItg9Yo94X0G/xySWJVElbJFr5CYEN3GGSHaVJKXfT
	HQY82rZTxsn+r2RL2l+qG9nh0FeiPTvJNzG0PWYKHJNsQckb1Lyzw8pdzBfhmVY=
X-Gm-Gg: ASbGncudx+mX51cIaZ2PuFyfDpeDY4g72iNpFGsA/T8GzkOxzVIYeuvXkllWCGrBA7s
	KpTI1PtgrIzbz9t4KMQJUFfgRiBROY82rIQinNDsCVO8xw3aBNyHuWGEGeZrVy5N5fMyI5reW0B
	rueXRQ46zqa0hVIKVxJaGRRtguoDE6wv2sW8WALiVv7pFQbbpsaA8TtBHh/e+mXOcaV9eikRL0v
	Sxx5aGnbfYehlurPuO6pSC2BTkeJtWklp2uferZjWyFV3+O2oer9IE=
X-Google-Smtp-Source: AGHT+IEnHx8ZchudlBirXi3YohInviHQ+NVE0qwD3tuLagTStOixww/Kz/6tSww5mzi1lVQcirj4Nw==
X-Received: by 2002:a17:902:e552:b0:215:b5c6:9ee8 with SMTP id d9443c01a7336-21a83f33a44mr164593225ad.7.1736584425237;
        Sat, 11 Jan 2025 00:33:45 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f86bsm23443845ad.36.2025.01.11.00.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 00:33:44 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sc8280xp-pmics: Fix slave ID in interrupts configuration
Date: Sat, 11 Jan 2025 16:32:07 +0800
Message-ID: <20250111083209.262269-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the binding for qcom,spmi-pmic-arb, the cell 1 should be
slave id, the slave id of pmc8280_2 is 3.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index 1e3babf2e..c19fb9c39 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -212,7 +212,7 @@ pmc8280_2: pmic@3 {
 		pm8280_2_temp_alarm: temp-alarm@a00 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0xa00>;
-			interrupts-extended = <&spmi_bus 0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			interrupts-extended = <&spmi_bus 0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			io-channels = <&pmk8280_vadc PM8350_ADC7_DIE_TEMP(3)>;
 			io-channel-names = "thermal";
 			#thermal-sensor-cells = <0>;
-- 
2.47.1


