Return-Path: <linux-arm-msm+bounces-41018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CCC9E918C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6B9718875D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56852236EA;
	Mon,  9 Dec 2024 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vi8BMF6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F89221DB1
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742179; cv=none; b=uQBvknD88haZJ+QBzcQWB29owYkdCaSAo2tnDLMawWZSV0ElXxPATMY3EywCoZ8JMpNJhX2uwuFds5wlIOtHzmq2UriSHfF1mpk+PSVAeCw+y69FUprhZ6L+E4Ts1Vb2FIceF0D/pXQpKO/OaCx679nHB4VlY+rXqcdxkmNaBg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742179; c=relaxed/simple;
	bh=r5/ThlmtFN/moKPu+XvaE/Ex2NY1JITsfnyJtM0ddII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V/pjQZX88PmSjdhgW/KH3Kbrxyuesnxt0ptHDL6QUwPAW6d8hdiRr6Xi2LIyqG4nA3+siPXwa6Y93X04FjUM5FNhtzpwW2hCMDyQgb3SA7VLp/zue7o4hoy/w5OXHl6lKSs1nrMG+qaH5tyNrg3q81s1oh9C8MGKSBM+CpnDIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vi8BMF6R; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3be7f663cso345742a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733742176; x=1734346976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IP8yQKR1WhUpxKJPnM87mHITvQbbTzc6JOmzP4W8lII=;
        b=Vi8BMF6ReTSxh1IdBtlqJUYtaA1ps4tHURazPHhydueID5UTM4UNQgcSufuizga4gE
         dAtWXi7Wds+lC2rjdcH4VoeG8ImdVrnEgf7hBELauq+P8mBLAK7j7rogWtPqHy7w+kHx
         VFA79WYtBVfnRWg+luDkAFzR4FCUke+v0nTt3sF4anj1+gF7xB2jP5S+y3vYOBCmfOmj
         LuHedHskHjKBYN6yjJYhgV4L4Wd9F/CTUzbly4zAv/dRIfRW9TsPHHyHohE+/uDatESC
         sSGld098BKdFpDl2ukIcVAwmiynNQM+0PHx6efb09qUzYJKQfQa3SL/ZGbNmOlI/eGDU
         WDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742176; x=1734346976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IP8yQKR1WhUpxKJPnM87mHITvQbbTzc6JOmzP4W8lII=;
        b=Hjpw7AejiF9kRWt9fGOzZRw+rrx07EdCYqi8CQ/6XPTLe4vvWiEIrELllTW3m5CbF0
         QYNpLu8BTuUPagJ80e4GhmVh1hy14q2tUyVviVbnYioMrvdOIs4F/X8RLefWKmNhZuXY
         CylquczLq3m7SyjJgo3/ylMWmfSfBbiqv27pAA+u6O7fGX4JjFhQm5t6Dciue/kuKJ0S
         mxGrkz9L7XXCSD2SPXH7pVZrB+YOCgxkzmquwQ/0DEWEu+oz+XFDJNrFFkvwhwFSxL2d
         bauc+1nsqaDTv5ygTRQSKAFX/hggolG6ByN3A/jNTjKRNq3bPEIIyhBis9AqbpcFijQ9
         go6w==
X-Gm-Message-State: AOJu0YxITInxMJe5RRYlOB8UUYKu6/byIoMqUAsLNkfQ/cPTbu8UEWsM
	22UbmZm9EiDp5plF3qO2/r0ae2s97Dv5V0hOx9cL0/MxpAncJMMIE28Fe1rtHws=
X-Gm-Gg: ASbGnctDtmJ8eezGBLXPuzFpMEo5ZbARVvpSwIPlcTHBDz9rrDRbPocgKbX+q+KvS5X
	FoxXUCuXOTSHuI+7vaHe9VIB2StK2fzoBVnOsQ4R1vsB5XzQtlguqCdCCS3hd1Hua7KgqMgxdeZ
	JXr5WfTa/YWhSyBIqmOuEPWuf2qyco7pOrxB1o95vy6LcYWU8BiXuabauKlwetoB6YoyrnC2Uth
	KYj7TRqswbrUckeh5ObPGYdPws6v7IartZXdBxVVzDFgioBeU77eM8R0AZ/sJ1Rxw==
X-Google-Smtp-Source: AGHT+IGP8iom8b2OxTi+0VyD5ACVJhObC8JwCvkhyDuCR3gfyLVoHdCsGicvgS9K0YXCAjjegLztQQ==
X-Received: by 2002:a05:6402:2812:b0:5d0:bcdd:ff9b with SMTP id 4fb4d7f45d1cf-5d3be76acb5mr3414088a12.9.1733742176022;
        Mon, 09 Dec 2024 03:02:56 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3dd4f641bsm3348818a12.51.2024.12.09.03.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:02:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 12:02:20 +0100
Subject: [PATCH v2 15/19] arm64: dts: qcom: sm6350: Fix ADSP memory length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-dts-qcom-cdsp-mpss-base-address-v2-15-d85a3bd5cced@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=r5/ThlmtFN/moKPu+XvaE/Ex2NY1JITsfnyJtM0ddII=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVs49lFX9xfy08AOs5f8lY73l9YA/j9k2TRBf9
 7hb2CsBDB+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1bOPQAKCRDBN2bmhouD
 10L/D/oCQfeFgnQS7eTuQBhmCGRjKVEjSIfV6xxOiz2XN/gK6fmtrhPyhOA8JyyTD2h9475iwgJ
 025RBneq4dBZfbZQQsFaD9G4PMkW7NhWLF/TAObwQ+czWMoFgszZzEvJgEwaVfDaTYZ9jBYiHBX
 mbLNFGoTY8CBOTtJLtwO0uHbGSK7erDv2wqNyDaxSuHj2bD/iyT8PqQOIV+McF1Xmgd73/1VKYE
 wV8a2VcB5T8TcXC+WyonhPb3l3cVREcJhzS/znkffZ3w4LV6zLr0RABvnmOeNmIuw0x1CopXc5H
 nbHE1M/V04mqgobr+8ImKXRQrDbbGPJA128hMsriK7x5Pfr43j0APBco0/y4Q8tkUpcXPnk99Cr
 4sIHGh/T2kVFGzHUekpOxQJF3OrL1XNORY8bDXR/1dy3h05/bZbHS2DUXuwY5U4ZzoLqN9ZZpD3
 p1uCafetuEffmdxNVdHan0DtmEyl9ASwy3Q/x6GXpQPLrGkRxIP/xc8pbOZ63a5PuTlIvXzlRn4
 tvNyFAGU2y+l0eX9Kl1Pii6kzoYrFFGwgFfJyjzwgeXbwzEGQRJUPSad4e/W5Er7IKNVxnf5luM
 4OtHY1HwnhaAz03CM7usFlB4ZTY4zx0m1GTprRxlGMeXEPuxI4U/0/Jb0dTbG4N61KDSS2zAYtD
 F4g1+CXEh7ToKZg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in ADSP (Peripheral Authentication Service) remoteproc
node should point to the QDSP PUB address space (QDSP6...SS_PUB) which
has a length of 0x10000.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
Cc: stable@vger.kernel.org
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8d697280249fefcc62ab0848e949b5509deb32a6..3df506c2745ea27f956ef7d7a4b5fbaf6285c428 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1283,7 +1283,7 @@ tcsr_mutex: hwlock@1f40000 {
 
 		adsp: remoteproc@3000000 {
 			compatible = "qcom,sm6350-adsp-pas";
-			reg = <0 0x03000000 0 0x100>;
+			reg = <0x0 0x03000000 0x0 0x10000>;
 
 			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


