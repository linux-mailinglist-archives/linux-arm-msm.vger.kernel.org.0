Return-Path: <linux-arm-msm+bounces-41245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A289EAB6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6770188BDAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A57238727;
	Tue, 10 Dec 2024 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3mlVdcP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB093233D9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821684; cv=none; b=Y+FVAH9s5c0NyIMiWELmWXpuLNwAsDxb2DWwxGNVmdzYgaSoGM4X+SxPD56Sz+PFwxju/tEPAIZ6uPJ9/9ZBa3sf29NW/CG5L66r61SPDcKdLZaN9+WhYIrWnb2ojTUO9/1fuqGgH5t+cHow6KhMfeaPbbon9ilpSbYnNtm98Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821684; c=relaxed/simple;
	bh=IYAwvQwwCQKo8c+lDnI8prpThnDxOHryRsPosT+rDpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jr9s88KctCBzTsd4tdjeS714rMKWgEjImWaSIHq893GSZOhTj18lG1Bb7vdCJ9d4OCfZHicFTMYadPC9PaGEQLcfCZFvkWM+xmRnEECwe+InqQWBNK0gKRGJhMGvroMZC8ZoiCmAGBR6kX+sh8gH2CSugdi1RioQ0w0n0zEtPAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3mlVdcP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa68b513abcso321932366b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 01:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733821681; x=1734426481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnE2wEToNkpRucIH8XuqT9lW36KsXiQTzCV3FjDwSro=;
        b=F3mlVdcPMwVKg1P+FG4GhUjraiHFobBSUzJo/kAR7c7t8A9+Ld//Csu/iQv5rQ9j4H
         EB/ecvsVsfUmX5XaJE8obEDWJkiuEJiygxqzTvbPQwsQ94vA0q9oYd3H8P67pO64j0Wd
         Qs2jrHhfEvsDLv4iPhOHEd9RmI17qm0BESggVZzR4ywu0TJxH8lhl7oOnYnSeN5RLqFH
         DgjRTAIPfK28rb258d0VaYAPqYHuJ/VF2C1WGgB9gYZysKDnsAQvzkve76/2e0PI+0fR
         k09kc1x1aP2zCs2+pObk10tfXxqGbqybFN75dOdZtTFSL4XniL+h/L2dY3yBEeL/5rVI
         1ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821681; x=1734426481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnE2wEToNkpRucIH8XuqT9lW36KsXiQTzCV3FjDwSro=;
        b=wydHPrCZBZwnnHdUuC1n6KlpkDv43Db1lvshWuwZMjGUvT4287m1EUE8KrKC+NEMI8
         nqdCBlMXNc44bnVD7U5THEHtQzp9apRhL7f9hhGMk6dYr4uC/39ABaTZE3UdFQw/0qkE
         HXO3OGtmd/1v90WwjBMvRfIvT7D5szOYlDcLbjk+MLH83/meDIowKo2FipKlq7Vs1psg
         sGO5Ysw9XMxX/oJj0BSsKjNKBQDwZs0QCXMDw0Rq2oqO85xZTiXlBy8fWevwHSaZjYwp
         Wst51V33rdRlRVIVDBBESaQybERUfmm6Jd1hmWkiQM5o9xqdI1aI7hy+wv5zMtYKmvRW
         77Cg==
X-Forwarded-Encrypted: i=1; AJvYcCU8jigyGFGN6tDNFHbgDbp/MMS3wtEc13CHvzINGlLxhVL7ce2zjaO7Xo+I8m00enfAfg4G1Kjrm2Opbdjf@vger.kernel.org
X-Gm-Message-State: AOJu0Yywlsk925CEk4j4RxHKkYela4am74XlKBplsmzadpGaCEresKzR
	0rFgWCLtWxci5lovLdO596cMmE/suA5QMnFkDnWtVbU4Ze6/HvaPX6qh5m7kFqg=
X-Gm-Gg: ASbGncvQYH1X5GmuUwzLV7pns3GBvDiCsCxQfKbiedh3lshgxnWyutmyx1Vvh9CJL5T
	uJj2T8zyahyBbqQJ82ZZphvdmy1wnAh07GhspdpQZ4MvAQs47hMs6xiUBx/mBXW/F8x4U5VQE40
	rU77RcE5K7W6+WtnmumQ7N3+/2dUdma7ue+2g8tZOfJNwJBZYDw2yYGsTc3kFqpjphz99GFdIMX
	dl+xteUCWCabDo8Gx89Ty7wgxcme4h83CAPzzKCf5Uq8lEXXfh3jnrDTDyG+gooywQ=
X-Google-Smtp-Source: AGHT+IGzH9ziveqkwam6CFxe8nFblJ7owxb05HcZ0YOcd7fMuZM0FNozTJykEazrYFwfBg7gaxbWYw==
X-Received: by 2002:a17:906:3297:b0:aa6:94c0:f753 with SMTP id a640c23a62f3a-aa694c0fbb1mr464377666b.33.1733821681376;
        Tue, 10 Dec 2024 01:08:01 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:6709:8d26:5167:3c1d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa699618041sm173148066b.81.2024.12.10.01.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:08:01 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 10 Dec 2024 10:07:39 +0100
Subject: [PATCH 8/8] arm64: dts: qcom: x1e80100-qcp: Fix USB QMP PHY
 supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-x1e80100-usb-qmp-supply-fix-v1-8-0adda5d30bbd@linaro.org>
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

On the X1E80100 QCP, &vreg_l3e_1p2 only powers &usb_mp_qmpphy0/1
(i.e. USBSS_3 and USBSS_4). The QMP PHYs for USB_0, USB_1 and USB_2
are actually powered by &vreg_l2j_1p2.

Cc: stable@vger.kernel.org
Fixes: 20676f7819d7 ("arm64: dts: qcom: x1e80100-qcp: Fix USB PHYs regulators")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 5ef030c60abe2998d093ee60a6754a90cd5aaf72..af76aa034d0e17622ab738bfcb25536764416eff 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -896,7 +896,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l1j_0p8>;
 
 	status = "okay";
@@ -928,7 +928,7 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
 	status = "okay";
@@ -960,7 +960,7 @@ &usb_1_ss2_hsphy {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
 	status = "okay";

-- 
2.47.0


