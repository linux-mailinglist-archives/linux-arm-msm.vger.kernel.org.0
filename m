Return-Path: <linux-arm-msm+bounces-41238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 600B09EAB55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F113168A54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEAA231C82;
	Tue, 10 Dec 2024 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k3wzcoUg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ADA230D1A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821677; cv=none; b=MOT6xExSzA+njMuTowtYtgYGnvzFLLvvgQX0UisOj8WDtlPeGh2ihcmLAq5F8mYuqTYUtgv6RNwvaXUEPf82s7WQFqUTasFxP6Njh/aHAdcjitrLHn10lLNKdAnWYso4wCC6lTWg8ipdkxLngPoKXQuxqvyGuDYh8BCDbdvFItI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821677; c=relaxed/simple;
	bh=Q9J6ApvGJ3m2pNcYcuR9E8HDVhiYaZFxTYOCAn6nn6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GXeTp1hulCrEHuX2jwnh+I6VtDmxXGos1iXx/A8+Q7W6W+RXskPKLyhFuwIHE6TiuI3+d1lBJ4CoyiwTLujnP5dMdfKj+9ADVM22fj9j4546ctGGRxKsgTCK/c8ZCGQo5ditU/i6OKAxLilh5dQKnb9GqP++ngaY1RpCrg7h+rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k3wzcoUg; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa5ec8d6f64so637202766b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 01:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733821674; x=1734426474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqyY/novBaYmiIZ/gk/w5WoFp3bfM2ml4pcz/sRVAQg=;
        b=k3wzcoUgV8Ph1iq8vBpoSFbqlBD1vDvcBArPuKKe0hvrQOsDVEdhhBh4yYyeC9USf2
         c/PoyDLb40b6RKu7eUIOPTcQ478klSICeG6So+sB7YmKyqL8Em0rI9D5TxOPmzSa/OeL
         ZWEheL83f6qvKLcX6mC+u5Onnw5Tjw4izM2vYAUAjmfGTQTyMn1cKGcVgebS/BAmgqn0
         1IFh5De9FFsyMLpGFUrO6sw/FfhNnx4QeDTnLCLQcX8sKCKj2/hPxB5GFPHStsu5oiXX
         FKC1a+Ki5UoyyNe9jfOC0JdP1o686FYbiBYaBKml2Zb/bpQUx54jMQvW47EguRtXlMrQ
         uHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821674; x=1734426474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqyY/novBaYmiIZ/gk/w5WoFp3bfM2ml4pcz/sRVAQg=;
        b=rZIwRdnrLeioh3EPaGdmd3tTcRLKGp3DQrpwCr/yW/cR0VUdPC4n/iqseFpEAL6R3w
         MnR7O1t7YAfMSCepZSZiIqz5bc+4ZW9h824a0bk+ZF+nhSGPm6qy8sTFLxYgUPHK5HfM
         YPOVl9wzjatu8qe24W7lNRCSWwJ6BxzENjyyg/aj925fijnt/Jiw+0xFPVLiycWhGHUK
         hJGlhvgGqN8m8kLmM4IPnvxHN3Eau5rJ1vKduYge7AMUOHWUKAM/4eMsWSAUWiVzzoqq
         zZn0UKSzHz0eBUWGnBoBnfQF8JJHgA9hpiR6uW1OgQUIUJS4p9E9dO8lvurMiZhWPbK+
         rCTA==
X-Forwarded-Encrypted: i=1; AJvYcCVEH7E0Q4WfsVecUzKM5RmO6a8da0oFrXBsG0ddEM2xOO9FKEOaECbzcME5gFlAPP7lPzABBAFlLEQQJOnG@vger.kernel.org
X-Gm-Message-State: AOJu0YwUKMep89Ib+qMzQEDmlIyvYg494fm/9YEpNJ0owL+qgWFvviX0
	DSRazQuS9ksCqnQ4XbeQL4tKYwi1Zotf8ozgqtRFspigbj3wPVVPK9wOwk8EaY0=
X-Gm-Gg: ASbGncsN0Bs5qZxyvNyDxgDtWQWIldBy197QEME/KoKpe6QNHVqWcCENzTz2AVg8BJJ
	T280L9Dqc7PurEw8rjyFdn2PNRc1y82JB9HwoJPErRnxbEDZXBTI9aA7tbWoz6PQmWBo5TCSDIV
	rVhQA99DD4BgV+bqcYsK2PbDjCxd+c9ZKwaZr8uRuoroFRiRLo68v4mFyJYYG6CPQkWd0CLupzH
	7CnSbkIZf60QUTgTF++5OWEZAyAEN94qCICWpWuay+1Z+5nWkphxFygY9nXDuWQzqw=
X-Google-Smtp-Source: AGHT+IEO+SnGr053M7x/sOumkjJv+KCyijsrHs22rOmS2ZdHD1mD4epFF06VN2VxwQHFi43e8/A2Ow==
X-Received: by 2002:a05:6402:2551:b0:5d2:7270:6128 with SMTP id 4fb4d7f45d1cf-5d4185d6098mr9372216a12.25.1733821674326;
        Tue, 10 Dec 2024 01:07:54 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:6709:8d26:5167:3c1d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa699618041sm173148066b.81.2024.12.10.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:07:53 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 10 Dec 2024 10:07:32 +0100
Subject: [PATCH 1/8] arm64: dts: qcom: x1e001de-devkit: Fix USB QMP PHY
 supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-x1e80100-usb-qmp-supply-fix-v1-1-0adda5d30bbd@linaro.org>
References: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
In-Reply-To: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Marc Zyngier <maz@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

On the X1E80100 CRD, &vreg_l3e_1p2 only powers &usb_mp_qmpphy0/1
(i.e. USBSS_3 and USBSS_4). The QMP PHYs for USB_0, USB_1 and USB_2
are actually powered by &vreg_l2j_1p2.

Since x1e001de-devkit mostly just mirrors the power supplies from the
x1e80100-crd device tree, assume that the fix also applies here.

Cc: stable@vger.kernel.org
Fixes: 7b8a31e82b87 ("arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index c9db6298d528ed505bae08e91bf4da02faef7d76..8eb80ecd36990ee39005bfd583e0b3e331de5374 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1255,7 +1255,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l1j_0p8>;
 
 	status = "okay";
@@ -1288,7 +1288,7 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
 	status = "okay";
@@ -1320,7 +1320,7 @@ &usb_1_ss2_hsphy {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
 	status = "okay";

-- 
2.47.0


