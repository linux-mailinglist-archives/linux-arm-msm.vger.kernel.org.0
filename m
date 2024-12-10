Return-Path: <linux-arm-msm+bounces-41243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE19A9EAB64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95157283F65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B82D234969;
	Tue, 10 Dec 2024 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZduQ2svO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFC22327B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821683; cv=none; b=oqqBZ8uBy5Yp1inIfqF7bYshRngoI7bhlEVCc30B3f10D34erwWzKrXkye2HlNyL5GyUtm7b/U8L0kTJ1xRvI1/so6ysYvcl9h2/CGOV9WDmmUmbAEnPDDLQmr1Iba+k550TyMVh/AdLL/LnWDuQ9jz698WLkh1RjpRUyRsK7Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821683; c=relaxed/simple;
	bh=9Mg9Rrhg2LSgODdoE1tzq9KxEGyDoyShcD0j+29WE00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sCWj9gdZ/JvXg/mT2dShwsfld5ohT5DXOg25Di3sByb5MeAH7gY/Hh+Kq7PGmzFPvLcjiIN4qn9XR5JPI3Ksu1MTa+bJ5cNlx/h4+8rW4gLgYW4Cjj3+sj8d7g5LV7F97fjOzVW5iQ1wsUXRSvGIWSi/d/Qh2zMOr1bS9MH6YHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZduQ2svO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa6332dde13so676675866b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 01:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733821679; x=1734426479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGvX2QcuP5DqxIvnEOgzcaFNQkncwNJahENclIwi56o=;
        b=ZduQ2svOS3RkVXC0I+abxYSuR9T+T7Nrp/GMwUQuMIeJzE4Wi/CQs20T/IJGSMxh9l
         WY3oCYMlT4PfzTrOep/dHYsxQyZnmzeBe/sdejERn4XjoNesEW3206/mXYByGvJ3vboj
         Cu+pq7K8JDqokbIfaGbs2Lxg8EYJdDwqcvHCZyAZk+ygzBaPPJcVb2eYM+H+nxAfNg7A
         VJtaFGptIT31jBNv55xOtgDqJ0mnRzVjSKAILg7zmsF7dDiuOpGMIfaGDZjOtDOUc2ft
         hxJX/CtYsGKySh2s7AZYojrxEqHE+6QX0/4zdoetQY85CjpS9H0sY1nJRTipsGCiWHWP
         ioYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821679; x=1734426479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGvX2QcuP5DqxIvnEOgzcaFNQkncwNJahENclIwi56o=;
        b=bcUmCYBEBh98ai9wyBFjJngpWTvLiG/wSULULwkEEEBj9vb6ibCFunIRMdMxfS+wRq
         ITz5fICmWX3PpZTymVQDluqPbCZQ9RHGvO5LCpSteLrlDfw+0pz4SatejklLGfNIK8sV
         5QxHSL5ifCqRz4SaTf9dlx0+CJ/MMslPk9EA54bHRYx1RFvO3LlqL9x19krLPr++d3by
         +kAMHjzVkJYucU6lcW8D0Ooy+T0/GL0DJf96nFwT8WocSkiVQlTxdxc4U0iSYrN5xTMF
         kkjXVvfHBnvKuf252mtmThVmzFgc0gNrCQlc8tAPvJw3YF4KKrouIMz+D8mzni4BwlIy
         jYvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgivq/5sOUdXTD1UpeUw5PDJfXuTW/KCPePZ5lFL2AhO0G8Ea6eQeoUhu7TThkIJvH55xr/BsNJXmimYat@vger.kernel.org
X-Gm-Message-State: AOJu0YxktvDlUi+6lVkaZT81YUEUNjSqVTAT6iKyUFzjSIOf9sTI0/+W
	880xrXCjMg47i+zLEuHTPVZpIAHaYxFbOcOSthLz/Cicr4mrHn338PFFEXwz/4k=
X-Gm-Gg: ASbGncu4ovPEVYrOexI3Sj4U7TVGDyo9rsNWiIXqbPhC2fcjt0Bv+ZvwM2sCKISzgwR
	L6x+uL8TT2NPiIFCZ1THcpMMHBsFYCSugtTasyenM8FKIc8AHme7buT35RFlqwCrt/DUEOfDbhC
	O3UFlSnsC5+51um1xQ5acNddIuHJInG21I0dy6kk22pt2hlBrCvuMifH8r6UnuLyfVzv24tFZk1
	aYZifkoE9j4pNLeTDu7sgtixrvn73fQfrkKt67bAMeN74O6dBl882eB603pnP7bEAM=
X-Google-Smtp-Source: AGHT+IFFxJvsB6263TiO8MdGloxcpkH37mJHnB20Jq9KyPdczeyIZAI5e+UYVadqqdV+CIYbcO58gg==
X-Received: by 2002:a17:907:75fb:b0:aa6:98c9:aadc with SMTP id a640c23a62f3a-aa698c9ac13mr485527966b.31.1733821679421;
        Tue, 10 Dec 2024 01:07:59 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:6709:8d26:5167:3c1d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa699618041sm173148066b.81.2024.12.10.01.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:07:59 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 10 Dec 2024 10:07:37 +0100
Subject: [PATCH 6/8] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix USB
 QMP PHY supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-x1e80100-usb-qmp-supply-fix-v1-6-0adda5d30bbd@linaro.org>
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

Since x1e80100-lenovo-yoga-slim7x mostly just mirrors the power supplies
from the x1e80100-crd device tree, assume that the fix also applies here.

Cc: stable@vger.kernel.org
Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index ca5a808f2c7df66a861a933df407fd4bdaea3fe1..77908462aef6607439b8e950439a4c4ef9833b57 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -908,7 +908,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l1j_0p8>;
 
 	status = "okay";
@@ -940,7 +940,7 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
 	status = "okay";
@@ -972,7 +972,7 @@ &usb_1_ss2_hsphy {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
 	status = "okay";

-- 
2.47.0


