Return-Path: <linux-arm-msm+bounces-41242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A464D9EAB62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 269A716965B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B190233D82;
	Tue, 10 Dec 2024 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LW2wX2sT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3101E232796
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821682; cv=none; b=KvicPny/OFkS4oZKRshESa1OeBZuZLvVw6D3xbwSJV21d3Rgn/Qw7tf2L1h0oj0k84Cp3OGMlgWne+32TRBWhWG0ZqBdHWmQLW3+3s0BtjAagU+hXs0xWtj3bG1xGrqsRnPompzIzUBgbTDrsM9sUR4z1Saw1KE0ApKmqM/aKVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821682; c=relaxed/simple;
	bh=f8a6YP7898A5nbgRH34nmqHwJxD6DzRItsrYDVftCMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZxCDuV0dGb/OPiDRC1YtogWMawMSl0tuIfJDCj7RcYyhChBeGY0WmgC8ep1z8zpaFDTfNj8cgH6XtA1Dpd3/rSW/miqHsjAJpDm6BpQV5PAfN/NNVewdJ0tS766U8tdk78LH94ZhTBCeD84Mv1vKCh1rgh5Y4/15U/ly7A76zEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LW2wX2sT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa629402b53so749066066b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 01:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733821678; x=1734426478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNG5DDWqWbeE9+V4u1rbd2TE5aGpO9MfSKfIBD447mg=;
        b=LW2wX2sTY4Ml9QUrKbt86NG4YytllDhzBBtvpfRiIQlgTSiv1HdEwDG1H9S3zTfhG0
         ZazNjx+4fGPF4toogT8xtSSEdQdUxev1dr5rn+amfbnx/xW4RREn2fQ9g1ZHdjpXGG9z
         JZ/4YlSytyct7XfpjuAu+EZpdPqeuiyp3BdDueL5bi0qjy0bTJe3nuuKCFowPDsedWFP
         YPe+hLnvws1oK8DziplBE8dOg8IetEdJ6bCjrC3aFpNADHY7gk+zCeKHIKZikEY3tGG7
         UPkf1GudYXhbPy3Y7G0jYi9vLgoOJtf9ue2bZmr9HSDryp9Rk3tdgpZXuqynd4S3nRFn
         XovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821678; x=1734426478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNG5DDWqWbeE9+V4u1rbd2TE5aGpO9MfSKfIBD447mg=;
        b=tlKVBax0IDWvuTLlspIAhVhH0lMNfPWurUlfw0KydHX3+YCOA6pxVWWdc6/pD5/5rE
         tdDaHdNIpEVjT/cYckSIMvKLV/TuSFTSBLrXhsFFKFTODYOZwsY6loviJcjw7kYOY2Oy
         l0FCSZqc85jTmbUZvWY6GHQJT7TzuyE0UA5E8liRfQgrsXH/jJGeh5cZkFvSsZ05zN5n
         UPiRQqT3ANzGHTzolsSfOLYPecZz1GzpJEOYo7yUVHY7SWLIYqN4QPxvW0vhDCyd5ufm
         +F/SGyVNAnoSM3/uZ1z5tiBX1VTzApMvRbXlu1CXCiFCg0iw0OTitsSDFKQRQfWOQ0pn
         BdTw==
X-Forwarded-Encrypted: i=1; AJvYcCXNEKN6w0ce5KhSG2puzXeGgPLl2yPfgLDr5UqvGeh/R3EzgFYL3G8dTgKcbOEQbYgXIwS40kNC3c1Euz3F@vger.kernel.org
X-Gm-Message-State: AOJu0YypOypEnTPy8QW8ChSarrRZ6JJQnpPgf2cVVew7t7P3rLxjRIxu
	0YP9Z5ro2Zd69MYlh5Y+HJxeMdmBeVn88mnGr5RaGd3WA4RfKXC/KNnZY33HBVk=
X-Gm-Gg: ASbGncvMnbAUb03SZVOHb0YkiRA6Mqegnz6W9p7EaRJ35LSlF+k0Gztb/tgZFWafv+C
	ExUyQj4JIgOXtpo9Whuz2eKrYtP/XJCAvkQwsa6kkcw8QqsPyKTEv+zr/Vac4msiTlAWSwGxr28
	OYESLECLPgzeHORgOaICYvNLuwF2QPlahbPeA260Ull3AA5ZlvdqzG+RZjmGErSQahxKAiJjLnn
	+9sgPGuCYuem/SPEpg9x+wL2HYqmMEPM8vPGNgKUEk5/7roxD6k8AOy+HaLHK8JJ/4=
X-Google-Smtp-Source: AGHT+IGbAoxeXyH/JN+w5ivWcB1+54UQ8q/Xm1kIJhAJoZYBd9IBRl3UElU3sm4HyFFX9AuwoT8RcA==
X-Received: by 2002:a17:907:9145:b0:aa6:8fa5:f3f5 with SMTP id a640c23a62f3a-aa68fa5f902mr550830566b.15.1733821678406;
        Tue, 10 Dec 2024 01:07:58 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:6709:8d26:5167:3c1d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa699618041sm173148066b.81.2024.12.10.01.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:07:58 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 10 Dec 2024 10:07:36 +0100
Subject: [PATCH 5/8] arm64: dts: qcom: x1e80100-dell-xps13-9345: Fix USB
 QMP PHY supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-x1e80100-usb-qmp-supply-fix-v1-5-0adda5d30bbd@linaro.org>
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

Since x1e80100-dell-xps13-9345 mostly just mirrors the power supplies from
the x1e80100-crd device tree, assume that the fix also applies here.

Cc: stable@vger.kernel.org
Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index b112092fbb9fd955adca1ae8a76294c776fa2d1e..1aec536218bc2c9197410a43adec291a31f9beed 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1093,7 +1093,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l1j_0p9>;
 
 	status = "okay";
@@ -1125,7 +1125,7 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
 	status = "okay";

-- 
2.47.0


