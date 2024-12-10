Return-Path: <linux-arm-msm+bounces-41239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7056C9EAB59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BC5228381C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC21232782;
	Tue, 10 Dec 2024 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P+qGMOjT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1B5230D2C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821679; cv=none; b=ZBRzpbI7W4XmMSwJjPCA7pTXyBL8gDL//FeGRYKGdFlIQ0EqODSl8x90N3Jxzpqw0/0soGBVM64wCJWKzOtkqYor8jyNzgL5OoQODWOzTtL/FW5NzQQy78fgUNfhG2NHEMi/8MgHEyheCZZXkpK0nvxbTG0r9AD+i95NEkNnxWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821679; c=relaxed/simple;
	bh=LeOeLTMTGIisFTd8s5GYZZv3DswIAXVm7zRdCpehk2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jxmxg3NxnAxDtkQ9K/tQpC1MavNp6Suix4TObRxE3A6yPXbaq9Tqq40uf9dWavKOqOf7PsuntcOvCGdQpwALAQHEvodnYnRpYKCH5RTvBpnj+HJS/MDkHmchcKJtSGQNGjUmN1pygUIqdniduALoLB3UMwSl5KT0OmWODt3Tusw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P+qGMOjT; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so642180866b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 01:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733821675; x=1734426475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6qOsPJJdAlZWS+86xEE7U+jJkJPEqu+4/SLHbofnyo=;
        b=P+qGMOjT81XSMxqSkNHiS5ZbBOKUgkl4zAtXeN5m+bcgXF9nrpVgRxmCCh2O84gt7c
         LMiLFL7T43UKtQXTaONb9x1pSPrN9+mKc7tOj6KgM24hIPxNStCASLzSPhRPJRkkwuFC
         qkh38b2uZ4/9onf2CMwZroxveJSyQ7jZZCVzpJxoBVpK9XFQAqcKLeBNx1wM8/BYn6vm
         9fMGXLvGlim0sNEGBd/7XXVm7el2RXvfQX7m+0raSL883i8AfpJbzTQ0bp390JR3QdMI
         C82uaklx3yu+l6PZG61qqIRw6A9p3PMMrDNxwcv+yoCWZuVYl8jSFh0U8glxr5YsgdKn
         tmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821675; x=1734426475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6qOsPJJdAlZWS+86xEE7U+jJkJPEqu+4/SLHbofnyo=;
        b=IfB0KkqWPeGN2r1a98kbBUiLqYImU1H0qRYn1G/C0PFmZSCVGhVLp1my4EaSnaN+4V
         I0JWkwZYGX124O7z6bsQ+dRRoAE70x6vDyDTGmGQ6jyTE863+okWH/HRLz26xrZ72kR+
         FJQp4KG/L34WA3rjI6S1btxhoeM9mI8k+SO4HhoLzyR4GMsgq8LTe8m978NJzpF/WOiI
         rzprXIj83JvbvWjt9NQIgAME7kLxC5Nrr/cgKKON7a8J6kQlgiB18MKwXUpdPLPMTdlM
         5WgYzM7VILacEhtfHq5UJGzWWN/8hwKYWcWdhhKuPr2NaqrPtDzG+ojjixn5ks+KvSKB
         l4vw==
X-Forwarded-Encrypted: i=1; AJvYcCVCsSR3j005zSczPIiVAqLuY1ZM4D5UVJzOIeGnUF1LFiajSTjVZJ8NwvtDPwc0ganF7MxL9fPH+lLS7CqK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Dmuf7Ko6z4yoAAnQoDjnZ71FN5q0bhe0UaCfoqiHZpjxYioU
	b1801dYrpWjIEqVQwErWANYCPFcLAe+SS5ey+tVhIrVu4iIzyVT1+hdA69HEflE=
X-Gm-Gg: ASbGnctfgpIpx0dW8SfB9pUpZp+9ahN8zeOdEQtKfqbjGNepp8G20ZsA9UT8G6bmFs3
	H4Y2ADP2NWCG77tebHLbB37yN+xgEfdgcXPG9J4EPtBaovpe28wXIZ48gBFkg4GN9ICs3inUeOL
	uR5Z8NaWCUop5XfEBN/Cq0wDdT+FpeY32vOsszQ7y5Con4qBoAD2Egrz8ewPjsQ7aA3Sab9RNRe
	RKlks3fbnAQZzWZjZeN62s8myo5qP7Fee86vCWnSoD9ZfOiifGsDnLOG+xOkrxHI8E=
X-Google-Smtp-Source: AGHT+IGcPp2U40SOKQpcMuuXend2SGVLo2UdoLzm0IbDMKVEaEz1s+qCYkB0BamdH6ZHApYsd7Xg+Q==
X-Received: by 2002:a17:907:7844:b0:aa6:707a:af59 with SMTP id a640c23a62f3a-aa6707ad8bcmr884383566b.50.1733821675327;
        Tue, 10 Dec 2024 01:07:55 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:6709:8d26:5167:3c1d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa699618041sm173148066b.81.2024.12.10.01.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:07:54 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 10 Dec 2024 10:07:33 +0100
Subject: [PATCH 2/8] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix
 USB QMP PHY supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-x1e80100-usb-qmp-supply-fix-v1-2-0adda5d30bbd@linaro.org>
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

Since x1e78100-lenovo-thinkpad-t14s mostly just mirrors the power supplies
from the x1e80100-crd device tree, assume that the fix also applies here.

Cc: stable@vger.kernel.org
Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 975550139e1024420ed335a2a46e4d54df7ee423..86762f555979d96fbaaf325b210c196e711b3635 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -763,7 +763,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l1j_0p8>;
 
 	status = "okay";
@@ -791,7 +791,7 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
 	status = "okay";

-- 
2.47.0


