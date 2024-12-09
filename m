Return-Path: <linux-arm-msm+bounces-41014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B289E917C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 620C81885ABF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5B122069D;
	Mon,  9 Dec 2024 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T8uJ3BLb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8D621D592
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742173; cv=none; b=DlyiborASFuo+Ac66Omd0NF/SSexXfkcPDjDlL4+MVaRSTEsEniyeZuUhF9Aq0DMaGa5POo+fEay9K5WsWUm4/gDiAK6XBR8BwzwPssTmmK0qrsZwbk7ZBU8j1cMSZjmMWOJsIqU9DzohW/3dIw1ndAnomT9B2JHE3gbE22zg0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742173; c=relaxed/simple;
	bh=O8Bus3+NCYOHILrSko1m3UkK0HY69hffCJIEwPcQ3bY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkdDO86bD4vVnRfAVgFpORW2pz433pY9Air3/Q5ygfrz1+AD+SffMFlC4F/Q8C4wnm46chMoE8SfTgqGdlbU6d0dMASSaUP+p1sPHQbscTZBVvKYjrTlCnBBZeA+lAZVgjD6WghMk3jSmynMDjwveb4LDbHQH8AmS8+5iew7k/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T8uJ3BLb; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3c1f68ef1so492952a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733742168; x=1734346968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCJyk0h0MDbYAkMubWpFcgnTzjf7M1fMS/Py9APCKq0=;
        b=T8uJ3BLb/GHW9pul52vAFW8hy6HPKzDk/bDSPfbKa6T3QnhWYpyan8gk/IRBiBzrsS
         opBM4PyQ84aaXEBHe2PpGTq4c0drDWlwusjyfsF8Kij5AlAN+PLlE8+Udtz9/bZKV24K
         YVNfl7k2fTPirh7qSZdm+pwMfoSVamjzO3n94GM5Ot22/rxVlpRi/g+czrcNwdWndhje
         9LUGrLi/OrWtMif/ytaap4cufYYXcm3ejhT5gCiiD6BH9Y2FqjdhoP19+siIxCxt1xm3
         qzz+CDQLZG0CfghX58Fd0i15fsmJiOP6ZyDpOz6QCPlnZ/yUt4vnKhqA8BLxBRngoaQe
         KTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742168; x=1734346968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCJyk0h0MDbYAkMubWpFcgnTzjf7M1fMS/Py9APCKq0=;
        b=lUq03fA6qY9HYOfPtLpACxhwj7NlNEsDGPUOhzHSpx+S2LA0C+H7TQmroItoPZiO6z
         YrIm5vUCF5Gaj3Gs3B1D/HdSr3ToFKcoUrwSR2biuT0IzlyqXIEmjfpXTzzxX9bQvA0D
         4E3m7VwrTZg0lZTQH01orA/YsoA6lgWI1MJGWos9J38qU/lVOinUb5fOaxMjxYBSDMBf
         nJJ0Y65k5SnkNQbUGIRiLeX0Ul6iZxKqInuULf98PVQVBo/Cl48D3Zc6qOPABrns/ASZ
         40gA17K4lsJJTd3RvpmYodzVHjmAQtyRZbVmnEL2gXAchWNmBJXK2pvkpI36XR0/sME4
         8Z5Q==
X-Gm-Message-State: AOJu0Yw32lugh9nvayq6tjF5V9gDuGAYZki5t0BF94pSsM9H1feLEoHI
	nBnoOfWzvamEm24hdKPRlBaC1jFulDqygXS+NIdAIXon3eZ0ZWo6JfrZN/DqDXU=
X-Gm-Gg: ASbGnctajUY3LXgLvgN0LKCXnzSjbTgpSjc82uJGHs3HNsUzrcJpDF12HQv0ZTyWodM
	60nrtNCoLphnCR89DPuywzNxB/cPjHPfXvkN5PX6vu0pUcjKqEFDg7KBRXtHilXfwltUlj3UNHZ
	uhxTHqHE7/Uvw26cwaBMyhmfFD9Ld3xy5ZJbh1rVdvzrANrKI2UOjtlZgAO0PedOsf5nhSFiCqy
	01uAB7KZb+3Ne2U1GdSmuIifk8Kl8UTCc14aEoo0bAYdVdQFKvuPsbefjHgdy0ZPg==
X-Google-Smtp-Source: AGHT+IE/h/dH0VJJNrRmshoWtaW3YAuQloCeHpjAh6+fslbQuMlX40ZdGSk8Fx+szevyPHhVriJQxw==
X-Received: by 2002:a05:6402:1ed2:b0:5d0:bb73:4947 with SMTP id 4fb4d7f45d1cf-5d3be4617d1mr4584045a12.0.1733742168099;
        Mon, 09 Dec 2024 03:02:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3dd4f641bsm3348818a12.51.2024.12.09.03.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:02:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 12:02:16 +0100
Subject: [PATCH RFT v2 11/19] arm64: dts: qcom: sm8650: Fix CDSP memory
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-dts-qcom-cdsp-mpss-base-address-v2-11-d85a3bd5cced@linaro.org>
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=O8Bus3+NCYOHILrSko1m3UkK0HY69hffCJIEwPcQ3bY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVs46Q4bCb5RzI9UlhztHjrSA1JTgHQS7Fizb+
 w53eBB0nuyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1bOOgAKCRDBN2bmhouD
 10J+D/47nqYHV8oPvKIaJUAaXIwm5RlaMQApfYv8ZmsGI2HX4bsuBSvNPEryAbk+1w6Sb+ZSEPG
 y9/33RleiiiR0Af2i8RguVUUYvNS6Ytc6OneU3tjCzxJykYPcKXk9FsloUBy65lidkfswH/TtnA
 HKBzlxVxfG664/cM7N37bU6fSPlVIwENrUURjFXgCHUpeQOAuHp9zpTBgHA9ODHlsXZY2B39gQb
 0HZjKLDRFZQpGAo4W/c5UjTbhfyKiVuDbekJ21bQju/qIuqShEaojtihRuk/ffL/9oBBFB0NZeP
 VEr0+KE7l92Wbjs0SZjtYxmOQ9sOm9yErqjZruI600ybKOpD8nNFkBNMvdDCDZeFEqeV+IC4nFV
 Fsrl9FFgMZux67DCdv943Bxm7yrXrcC57vL6S4FEqe/2NRhUR9Wyzww26T8+JsEHKoRmk6K1i/B
 D7fIh8gaOEnurXg3e3oA0bM8ZhHQb8VgBDfqWH28tTOLGxyAosle5+6rFIi1VWEG29eb6Zyi7GX
 QuQaw6Iei6p2INm7Wopo2RPiiYSh6q6oIRTBWOEafYv7iUXFR5L1JcEJ8Q/jcFQrGpVeiViI6rO
 c9df/Ie5iknG2Ffpof53TkbY/hJGNSJnobZ86BsmIp24GTssim7QMVIYByrHTCKRU33vmuYzDbz
 qu3UilrQeT2UoPQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in CDSP PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x1400000 was
copied from older DTS, but it does not look accurate at all.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Cc: stable@vger.kernel.org
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 95ec82bce3162bce4a3da6122a41fee37118740e..1d935bcdcb2eee7b56e0a1f71c303a54d870e672 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5481,7 +5481,7 @@ nsp_noc: interconnect@320c0000 {
 
 		remoteproc_cdsp: remoteproc@32300000 {
 			compatible = "qcom,sm8650-cdsp-pas";
-			reg = <0 0x32300000 0 0x1400000>;
+			reg = <0x0 0x32300000 0x0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


