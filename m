Return-Path: <linux-arm-msm+bounces-86086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A0CD491F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 03:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4D75301462A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 02:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C2B3242AC;
	Mon, 22 Dec 2025 02:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A1WhJ7CR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FA72D23B9
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766371131; cv=none; b=hj6OLkEnk6hmlE1MiXCWgfmGP+aiTWGf1hpqddEvy/PFRCEYduox0GESmZ3iaNatO/nkqb/gig8WygN6tdGz5dOu1LkzvKFAAhoonBrba5Fumi5kfOsiGHN3SPsgpnhv2XNSPwpV0gcny+wtUVrVSuS4xPcxgGjcFaX2Pg7wc48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766371131; c=relaxed/simple;
	bh=/w6TihWTMo0D6Vt/LZluRAdH2Yh6/WCpynIZAlZaZLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d422+uBKGWhFot8urFBL60M7GKe3WgOALvAZzU8RhlGWuMhvaktqJlc3WUqYBtUSpH89r2rJ0n4UJg24tTHCau44oITrufGu/hZAYsohS3Z0BWgNW2cuos7lOxp2e6GMOptnb2cet7LCQxo9qFdCBGR+/YSarJ81evzu49VhDDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A1WhJ7CR; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-598ed017e4cso257615e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 18:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766371128; x=1766975928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgT+LUd8eSW2KVvVOpn17swJdpN0E1VlzzmLz9Eq77c=;
        b=A1WhJ7CRfW4PUlB4vvVR/kGUvWCY7DC8sH190yOQhghzbBty3pdnTsvx+6ZXqf31y9
         /CQiQIn26XtU/u2NR/ht8+ei3NFGFDYPNvr331AmJxM6mYBi0nxcbpkio1zoHUcTocIN
         e2DMXHKaB/c/bjsQ5YUYPYIcSvLOJOzZABaBDc5p2xg4v94xZdDk/m9l74JpxGLnbIKo
         UDZiD25/2PGaF1U/5VBPeq2h9yLbYKcmHfczGMOZXp90bZC+s5YG8X3qFN2SwYRhHWNx
         iDU/NMWG+lnzvacmdtMoVxa2OJlvb0ZIL9hnaxttZMW/n0mmMfouNJkSMK5PHKlwIgPz
         CyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766371128; x=1766975928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sgT+LUd8eSW2KVvVOpn17swJdpN0E1VlzzmLz9Eq77c=;
        b=l0qTjBIER4CVkCrmvybX0VpIZ6hnom9+97+m1nKBHfcimCk3bX9DaQryZc+erv1DE3
         EUPK/f8E7t1fgzEJBmEtS2Rlcps8wdp8kki8PaRqX0CKyyxAk6m6QyiBFunA+C+HsfaS
         wd6iWTg5tEPEiTtBqnprezUfl/pkgS5KQvnsbiyjIUXVIbz7JxAai780ncgSgrD7vgm/
         UOS38eQbdxHrlxL6K3tExD5op9TLVKbKhdaiBTKCgUxNvwjc9QUsk+1Esji/cGW98hHf
         puJCGUjJ3yIwmZrIslklSSURcKBJ/QPvm5/NR9KnxmgLNNKMO+QEOX2tyJo6343XYmRP
         pjxA==
X-Forwarded-Encrypted: i=1; AJvYcCXWT3y3TZi+tcuD8cGEk33H1J6bK49srywoEavmXxZolwOWBU6ILQppqAbmfaKqqpX03N8DhJcdptJQIBR3@vger.kernel.org
X-Gm-Message-State: AOJu0YxDukLjlBQZjWuixdmkBIA8vFDDpjA9AhIrwX2A91ExE3SrZ+wG
	ScK6yjzLmKKX1gZjxDZNc0ambjNluotfaPjy+VJFK7bAoJ4w+o4rMZr3gFugPs00FWI=
X-Gm-Gg: AY/fxX6b4HO8UXwycl+xj14j7oaWAykVw/jfpmJ5v2o6tMoQ0Hhyqfv882U0fRU0aXp
	lI/Idd2/VztNwGQsXHZsE/dkLHTLby8vaCIEjhL79YDqsS+Xebm3VVgMW7rdxaTqL8vVTIsD9It
	a8yPFfMz2LyqHaeOf+fPuuohmHUTOvk0nChQMX3RgyCFqRkRQx4XThv2TCHVHkwGzi1HtEuJq1v
	D0727Cu1nmilF8jfXjM+nfToyZU1X2ffkT7XR3EIgF0eJe+j9luGGMEhQPgr9LlnVd1qp2APHPS
	f2ZjBiQyLY88W2cismUVa1uVvxLhjhn2KH1SmcUw4edBj36qeJHGN5NxVSS4Kka0oEWLtRcJ13q
	OodevEim7z0CSd/Au/FjsMurbkiVlLGLS5OtPT/JoMeUm699alCPTBqwDvxxbsjDd7e5FqL0oEI
	UeeO/IazM8thORuFu2FTBTYWjjEQS5on3XchKl6kHEpf6+Wsf+ZH9xGw==
X-Google-Smtp-Source: AGHT+IF1hX5D5akURs9w7M76/Vi3sk1BGoohV/HzXMslfZiuCNuHiDAc/ge6/INfJ0g/HCBZ5cLluw==
X-Received: by 2002:a05:6512:3d26:b0:57a:6d7d:dd74 with SMTP id 2adb3069b0e04-59a17d1d8d4mr1785933e87.0.1766371127595;
        Sun, 21 Dec 2025 18:38:47 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186282e0sm2778259e87.95.2025.12.21.18.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 18:38:46 -0800 (PST)
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
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm8550-hdk-rear-camera-card: rename supply properties
Date: Mon, 22 Dec 2025 04:38:33 +0200
Message-ID: <20251222023834.3284370-4-vladimir.zapolskiy@linaro.org>
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
and it should be updated in the SM8550-HDK with the Rear Camera Card
board dts file.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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


