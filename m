Return-Path: <linux-arm-msm+bounces-84143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 26452C9DB50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 05:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C6312349C97
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 04:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DD626F28F;
	Wed,  3 Dec 2025 04:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WCHxXBQl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85037270557
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 04:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734747; cv=none; b=bpuG6FPetBQCPjziFoRO6xosKo9JHxtG/wXVw5pd/DuiKlwpwIf1/oj/0asPppKHRrjauNE+xuxHUrf+kjNILbBXU3AXdYw+A5uZwBQefiOgMTNftYu677HK2ctR3Y0XS4AUkLxWcZZPSdsv+HgpcXQyQTghFEUt2NABBRih9dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734747; c=relaxed/simple;
	bh=nUUvt6bCpdyUlj04W2yoXSYMiNWx/MmDymoKDyVQVHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aaBiwSOCOM1axl/SAjcbkq9UTyzfy9x5R3Y7xSD+LW65zU4x2KOrL3gG+iQLxGkSxp5v9Y2hfbb7wnS+eLmBqkv5/vcT7PeQ7tBOX1Q2YpDf/tDhb7plVX+0i6NqXTC7uPeGO7KqLfQNvhu2IqAdB3RI+sUUTkl6v1Tgzpfmp6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WCHxXBQl; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37baf2d159bso8748201fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 20:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764734744; x=1765339544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYAjeVRzePHcmocoxGrnCVUp2pgL4UnGFLxhN/mpap0=;
        b=WCHxXBQlIacsnhDvL2Jgazx3PSG0mB74ppcpb09KcHLuk+abzirmdOpagZr0MVAXdR
         z1vLLUDJjIb5jQO6e3s1D9LDuoeCmsGRfAX2J7+mtzozn2TRdQBecVjGqyeo42KYBeEc
         I155Wu2I+nHUKf1SN7y7gKRolPWrJ11hPio7prasg+InpXyyNf9xz22qkRbbtsFZwyUv
         UTBjIPdx3R8qnqWN7V9dekxh4Xx68kw8YaOqh4kxQBsLUcnz1Kg4IDBJlSNJR3p9xAcr
         bD3ZXGc8LSOY9YW+SARB+Cw0ZVHwr6X4PeQVjOnsGq26pyL3ltjygPP2Sq1O81LIDjB8
         rGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764734744; x=1765339544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FYAjeVRzePHcmocoxGrnCVUp2pgL4UnGFLxhN/mpap0=;
        b=TTws5RSL50WxB6mVvwZWkn1OjuVeHKKN5i7RUJaS7shv8D6f+rVr7TqOAu40fPoSiL
         2pJNlen35eS3DI9YHxCJHviO401EWOiV8dDphuPjdMuh4rTKOu0k1vHNwmwn0tCW3Kwp
         uwgHPdRfs5FAS/m3NoUm645atg+QzPwd8PB7Be4tw54Bqd3k108OfiL8wOn0EPwhlJnV
         +iWFQ8+5PMnQb9BaletTBVYA1uR4fYxbDyLhh9OPaVE3rb8qm0vzVcL5FRR/Zq8zi8MU
         EsXbJYRFk/zRMgOZzNux6rhzPyP0R0OdVwP2kI3Gi9DAwBBxA9IqPeJJko5lE6pmoN0i
         UokQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcbdgo90X0Wle60YYvUs66OOTKDpDmfu6uf5iCnTV8t5Gi4T+AKsYswTr/A8vMg60M0ufAV2PqYRXHwRYs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy8ecaHHLo8Qi+mRCbfC9bK5kMe26XOpOHtwd+GZqOmFX8Ip2k
	wXVSJswxCq/ALvLpyXjHffyg3DWMXQ4LvqKRgRyl2CXCBV6vFcFjp/eqx4A41SLcr98=
X-Gm-Gg: ASbGncv3pyWA/n49I/fpA2vcGBwc8+ymUAFrlGG4ZBJ1tfDuwhsO17A0kcRZnBn/whg
	vtxuKxPbN3+N25jowkh8t2e2zmXahD272ERRrYlyebBR4hrWnas+JqpP7/cMoWnKFxFCph5LNJ1
	iK5bncRF2UFTwVaOtofRwFmG6sW/ulYK52xv4w35AVKkJd/2bP5rFmTMplDOfE42Ig/O3CEjU1B
	6AUfSfksBM5ujd2VGWfk9wCQTK/fnLDvXaQFihtnodSbjQH7Y5G2hGbKAHnaYpcsEZtlo7ponJP
	5+QHIQs4a9yawXA+HMWZfugKS2YjPh6HzvTbta+LcdFgWQCHaY+gt3kMJmtCsvgmPN/1Pe1pJLz
	P+g4lkdDshqH0e2G6p0nANIcJQGlNeY/wUpQQno6wO37O3dkYVCDQfXS+NxahMyHdBsuhgd688I
	oKYU5DYVFhKBId8IdHPXdQcqiTcHUNHOGVayAoqrjScPqHrQ2nAHxu3A==
X-Google-Smtp-Source: AGHT+IHmXqXE8Htr/1ZWJI/C+pN9P9erYWJYrPujLQl3VvZgLQiwUjq2GEpxSai4MMkQG23fGL6vZA==
X-Received: by 2002:a2e:b8d1:0:b0:37a:5ae5:a1d2 with SMTP id 38308e7fff4ca-37e66d76ed5mr246901fa.5.1764734743598;
        Tue, 02 Dec 2025 20:05:43 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d240981cbsm39505631fa.24.2025.12.02.20.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 20:05:42 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/6] arm64: dts: qcom: sm8550-qrd: rename image sensor supply properties
Date: Wed,  3 Dec 2025 06:05:33 +0200
Message-ID: <20251203040538.71119-2-vladimir.zapolskiy@linaro.org>
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
and it should be updated in the SM8550-QRD board dts file.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 9af2a4fd02ea..77a7e45660b6 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -748,9 +748,9 @@ sensor@10 {
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


