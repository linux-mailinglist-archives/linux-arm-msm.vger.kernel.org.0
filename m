Return-Path: <linux-arm-msm+bounces-86084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F4185CD491C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 03:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F47830053EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 02:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1FA1E487;
	Mon, 22 Dec 2025 02:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zC4gcPQP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2B0322557
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766371126; cv=none; b=lkC/zo/C56zsn4/VdYg4++ml+jdk3WbBpQ7cbaZJ7yMe57CtjskGsSzIfhQhGvupYjU/lEuDfBTBO65qBEB9tNax9PsCkwxS+1INyM8V6/SlBOQJYtdnECdwbUjjSQq7KQUSTgbH6BNk8zGAHQKS1CmYIaQqt/LtQHiSgA0GA9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766371126; c=relaxed/simple;
	bh=uMPNZsJHadv3lutJcGIimg27to5aUsI5T84SSkOevKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhzgRSREAm4Fi6/SI4WI+lgr868B59TFTvoMhdMIQs+jviEDsOr+FEoIVy0vdJ5F5giZ7mFOVFw6sa0najP2oas0bM+4smaRAoVgRqqHq9+zmGzbxRohduooMceUgyvWIVcH00tkvfqRWCMmFOq1N9sxx+ubSaCGqst+pN3o7P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zC4gcPQP; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37baf2d159bso7125541fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 18:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766371123; x=1766975923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXyuaQm8FsIVH0LsNXOv1C7IWypi3pqijz/keaukyvE=;
        b=zC4gcPQPvnaj4JQ0cxMnYtCgB2PRtryV8Ce9sjZ3UvfG8iXMM8GgeXtojQdImHVT5L
         Ofep8DNtcxo9Uy52SeT2vqf7ae5dKJy//Cju10m6HNXA3r0NUOwj+BrF38F4KRHyNwa6
         lCMiNRXsWEzdO4TRkNbHI6fXBYh6vRmDJrgR7z7XOgGIh6X6Klb1ncvjK9yfHfTnHU4y
         ZMEVx41onHBjd1kaOhid0TixihQFB3KYPbdh6SlqGDkABzNF/4vNyppujyOySD2Mgdyo
         cID4YmMILFyvlOnB/ayvo+rdHi0bCT8PJJB8RFXQ0MURRobHH7PhulevTSWVrVKymGVH
         g1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766371123; x=1766975923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXyuaQm8FsIVH0LsNXOv1C7IWypi3pqijz/keaukyvE=;
        b=sIhByZTyyLSEtcrWcxfaq7+kBQ8oFPOunDB5kYx/STaI6LhiiD8tJL0OZ4cEW5xek4
         lLNMxugohajNpgYDIidD1ZXRzIykWS4tRbcAedMWQ0R2HfmeDSCpIAVmtaS4I3bZ4MsN
         IO3P0N2+L0oGEVRt3sBQULMe3tQrZ5mNeABGiIB6txME16Wp1mK5UadWLrHiGUB3roCG
         Snj1fuiflPLJK+ZHbEn+UJY8kBwOCBg/PPEatyhhww39z4rSglCpy0UZDAcezSsTTk7R
         SHEru0Uy6vf5Fz8bAZ0vMB/GYE6AJC8HVLaOEv7JaBP9bPEmmJuF76IQ9zcCnR/RrkXy
         lKGA==
X-Forwarded-Encrypted: i=1; AJvYcCWfEUo4AepQiCged4cSpTDiXB1T98g/VKRgyqyfIGgwYWx21QVApqE/ut7g8BauPhudCWst+kWZral3JZ+F@vger.kernel.org
X-Gm-Message-State: AOJu0YwEwohn1aZArF6UsNP+48jhTcr+vRCd/XfbDzMT+5cak8CAoCiI
	nSYstHfrNqUAxbqD/+MmUovpGuyeiN7Ca5Re2XnlMxg64bPqVg9DBe/hb3buTeR+jWc=
X-Gm-Gg: AY/fxX4VTldmC/rPXTkAM/LAUh5mJVYSxlHAv/oBeKm+M0J05uMG6JjW0UnP0L8qXjZ
	j7MahBTgKK5rgFv925YxNd18Xv9yZBBgZX1ibqRsnkMQVOGiyeneWswxFYx5fwkcQz9RNPDksl8
	FZHOtVbMu6Z6S8Hx2r6RCD67En80Xp9AIMTs8WKz/2VZupRMg8GeAeziNA6o17Obwf1nDoyoI6Y
	wNkrlaf1OyMUuMXkvSBw+ieyhaEahzZgfZkj2xIuTfdZR7uxvxbi7a0B2PvWFiCUShmQD+LELqt
	kAQCm7QqwJsBKgUXDBv74w3jf2NZY1a5/lI5oPONHYvtGZqSKBF9RE7/njQpdyREAhqhtuU7iR/
	VFr5N3T3tnohxji99NfDlOkKf4yZEOFnzbOuM5brAO7h8/gKLo80AShkb8zHpf3xT05PKZ8V3P/
	3lg35Fq99WEheRjko8csXaPcXHiQT93dlX50V3werSU/C2ysMT8IIVqg==
X-Google-Smtp-Source: AGHT+IFa3pKGAqwuUt48PQHZuwfkE7INbS89WNMt9QJudXTDT+OykMfFYKaPj59PV01xqJ+0LiIY4w==
X-Received: by 2002:a05:6512:3192:b0:595:7cf5:f7e0 with SMTP id 2adb3069b0e04-59a17d9e1e0mr1884219e87.8.1766371123232;
        Sun, 21 Dec 2025 18:38:43 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186282e0sm2778259e87.95.2025.12.21.18.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 18:38:41 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/4] arm64: dts: qcom: sm8550-qrd: rename image sensor supply properties
Date: Mon, 22 Dec 2025 04:38:31 +0200
Message-ID: <20251222023834.3284370-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251222023834.3284370-1-vladimir.zapolskiy@linaro.org>
References: <20251222023834.3284370-1-vladimir.zapolskiy@linaro.org>
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 05c98fe2c25b..7abd862f3f4d 100644
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


