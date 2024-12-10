Return-Path: <linux-arm-msm+bounces-41241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCCB9EAB60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2564168BCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1614F233D7A;
	Tue, 10 Dec 2024 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rkMVD7IU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054ED231CAF
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821681; cv=none; b=rZJO05h50VQfHT1yhk7ySTbQJxQmJDPRwUIR5mv++6GtEH1ZsDoJ3WeDHphV6kQCKGrLCcOGQTWhF+Cl+/FumfC9dQWUEFazygceiAU7Ax2jr7+ZxwtvmkCfc8puaSbxxoi1OXVr19IwGLgYg6THJ2TiomrexJ/viO/iGXoqhBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821681; c=relaxed/simple;
	bh=+FZI7p90x8pKuXu4wG+Lh/pKwT4cM9Ld+dZ7EPC/XaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gWinBIhCfkSv4vh4fe4c355L9fC1psZMTlvvHxfQIr5eLghZ7DjlpgP9qyNapxTx1DZSMtYJt1n7GOKsdQ1H7o1N/0AOt6eVYJ68nhD2uSXI0RD8r3LRTk6X+rJlsV4Z/kNMWdYyyaeq1dCWkgF2LbUt0KiCJ8B1OhM1jqo0zBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rkMVD7IU; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa6413fc7c5so521652966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 01:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733821677; x=1734426477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efJ++Y02aMYEZf39htR14MgkTrlByWoeM1Gi0XFn3zk=;
        b=rkMVD7IUX3julo9hyuCB0d6T0Ixb6nwXDmiZJ3Ar3j4msLKcYfFs3PyPvZGhHjQ1mA
         zHFgsPkaII0dr2sKqKGcOf3cPkV55DQ5VgByhB+hJXD3a7iCUotfzuhihEfFeoArpkEc
         sPDuiaQ82bI3cyRYPXdCHIUCtVNuWMM8GVIbqcQG1EF2Eio4QDKFvjBonpalTKOMCo4o
         VJDKuqwCUuc2PmB11Ny5SEykCKW9CA98gGgjgsqAUoaH3sd0HKCRRWkJWS6fekNK8jRV
         C5Pch4BcANdTL8Z1gQz17GpcFlDYrWSjtYvEHtKHjjvyZ1y0qeyJwXLwVtw6iHZ0//ky
         CEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821677; x=1734426477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efJ++Y02aMYEZf39htR14MgkTrlByWoeM1Gi0XFn3zk=;
        b=QApg9VgSXKV5qgh13now5rVoUN46bF8ZOPQ71eUBBNHjiGXLBF0QMeC4i2TLu1yyql
         PDLIK4jt6jcfjfmhcpCaO/ZgROdS9W3ehEWnotQ1D0kgsQOqciBoN0ZMS73M05nYP7PM
         5Riled7/KZ3q7XvuZxiD4viJwIYHKUHzHqcClJeuxybGcqEAUXOcvs1eOPWOguyHh2p8
         jz/c6YYzvvOCtBi99DnxfWU5/G31no2lEv2CkjzDX/cAFidL+3pl+0vsFpKpGRasU13+
         93jO2wjj1k3S4629qxfr7C//gs2cWpG2osEslElMjK9mUr78evoq+dJEkgVZo6w2rbWT
         1pCw==
X-Forwarded-Encrypted: i=1; AJvYcCVL+xmjeCmSJNYNIRqulC6Az5YS4frzwjS7fyCsNsgVom9wUSbWtDUwnrpKRt9o1jpKrDL26AGp6ruKMeZ5@vger.kernel.org
X-Gm-Message-State: AOJu0YxqAwrNdd9S2bbhRX9Tf5DEPUjP+ZiOQHV+mlw4GURPMj+pp6Jo
	rv/ArhkRVaGNo3J9rjS4O5B8b1XP9d/176AneBC4Rj6cBY18vCvWXBB3q6r/fqs=
X-Gm-Gg: ASbGncvzdZgAFyfO0esoW2tXiQ7ytKUUTpkUN9fN1IlSDt6ZZ/pKgBNgyRTAXY9ECID
	v93MivWYTrW10e4cjmF7xupojgXXbg1xmvL0xmcdtHpjzpewfGUtA686O0DkeAatlXFt5LCCm1r
	qRCfRFWyOPFrRFwvo1dTyReKCCXT7R+tteBojTs2VjEVxsAUmn9yYRVQIN2d+vx/7ZE7Spv87i/
	rLvKRViuEKDplvbN6rmF0ajBbUkLWQeS8Eu20rqRHHFKN9SdhveAc7oSk3lJAFTBDs=
X-Google-Smtp-Source: AGHT+IHOSLN91GRMFwbfXF4p+jpX74rYIBidttA0YEKYP9pNN983icoBOo6bymBwpvzHTUdD2SCK/A==
X-Received: by 2002:a05:6402:274d:b0:5d0:9054:b119 with SMTP id 4fb4d7f45d1cf-5d4185d5fb5mr8775267a12.21.1733821677437;
        Tue, 10 Dec 2024 01:07:57 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:6709:8d26:5167:3c1d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa699618041sm173148066b.81.2024.12.10.01.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:07:57 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 10 Dec 2024 10:07:35 +0100
Subject: [PATCH 4/8] arm64: dts: qcom: x1e80100-crd: Fix USB QMP PHY
 supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-x1e80100-usb-qmp-supply-fix-v1-4-0adda5d30bbd@linaro.org>
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

Cc: stable@vger.kernel.org
Fixes: ae5cee8e7349 ("arm64: dts: qcom: x1e80100-crd: Fix USB PHYs regulators")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 39f9d9cdc10d8e79824b72288e2529536144fa9e..401326123db6619552b9ff2b90aa16dbb6649b92 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -1187,7 +1187,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l1j_0p8>;
 
 	status = "okay";
@@ -1215,7 +1215,7 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
 	status = "okay";
@@ -1243,7 +1243,7 @@ &usb_1_ss2_hsphy {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
 	status = "okay";

-- 
2.47.0


