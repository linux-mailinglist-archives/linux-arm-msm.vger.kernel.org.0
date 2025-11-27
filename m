Return-Path: <linux-arm-msm+bounces-83669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 857F4C90318
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 22:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 32CEC34AF63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 21:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE15231DDA4;
	Thu, 27 Nov 2025 21:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="eiHqGIBg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1644F30215A
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764279086; cv=none; b=ZL9nOhlQG39OhSNHWRT1TAG+33nWvYz6AMavD1xOd5jpiFQgIVNqMwkY05bWjRg9L6/XCz8fCWOYf9lO8wVBZCbyy7OD2RKxDhrmA/nKSHwFyETIgu6Bh6SmYNEjgPGLJgQOkqnCxgKdFQ5z+xl0YH0Y6eCXS6QNedi0IxjOGNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764279086; c=relaxed/simple;
	bh=tPW1bpPIWJ0CADx+eKJZJl6RdfM1Bd5PXpVP1HAYXR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L5Bmvji1FXE9tR8FY50tQLIq+Mrgwk0+MOVz9cSR/k8VuPWSFLjMmS5YsG9s+nm2Qmko6he9hOKXblEZJdCooOf3KvWp91F82N4XiCZnvlwbqWHBQFNBRXhDEf9/VSQs+/UieNu3RKkPk/fBVFGWExUa7O4cg5zN2jlIxSz39+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=eiHqGIBg; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ee257e56aaso12105311cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1764279084; x=1764883884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b4g6GOhzvAVpoxPftm+uHcKV+iFO3W6xh3Ht/X1kJXA=;
        b=eiHqGIBgXhG0IIinQOGzolCicP78YRV7trYhhxgAZQFUVZpIlorv8eox2wmOryCH2w
         Kbin230/AkFczJiHSxRWr60FHH7hxPybOVfHf9Bxl2UCq+YqYR89KhlpvW4Yr36P4hp2
         jB3XYYdqtQqeHDzVKexa/IhkOAqJ04Yi7xG8RFWAj5zzQk7MIelZDWV9tM9eNnOL4Z0x
         YpakrnR94SHmMOcfI0AaXBfuoIyGRAOg1w4RtUNo9+Hp4p2AxGzzdNzy+grxDKbZxhQ4
         eIhS/ZmRcI/tfKYijVsIsLT/yLO7edIfNiUbsbMZsibrrM158tfTMQaCS0O5+jZDyOJE
         IYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764279084; x=1764883884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4g6GOhzvAVpoxPftm+uHcKV+iFO3W6xh3Ht/X1kJXA=;
        b=rIlpXWtfI+OyAoIz6f/jlnK5vkxHoAaSg0WgCboE/14dVnFwChBdX6T8qQrJuRHSP8
         gvd9SjG+bfAM1P7eWJsvY2rhjlILS6rgPA9PNmSRJSeUix6vRkqjtY78m0K930ZF/u5Q
         FnXfg+Gq3J99U/pdOmlCm1Oe2jP8V0+WzekUFgxmN9LIV6rgjBmd5lhmfj3YHEidUL0t
         jWK0Jf5EnKvbLLMkkSmHbkGnhWYnRnP+4vfX3n6IBRKwkJqC8ic7/UjH0c3hHANJW2pl
         GTclN1IrQZwdlLGEaiO7XP1S5uPSc8hg0qUVbx3X0bOEQInHGk6rULIBRQCmT6mSdScS
         DiZA==
X-Gm-Message-State: AOJu0YzYDar6Ppd0VKR44aFrQeyOjT2JpnDiLs/GmwIabWKyK0gFaSyK
	+HI/vCiReRRcl/n8oiHmz9fItwcGXWva9AL/SgGiZmIeEcIVP4YXRuA2wY/4Ym8tTZk4MkA0MhS
	q6oLO
X-Gm-Gg: ASbGncu6Ik1W3KtgdEEN9SE5ts06evVoS1zS6eQi4RcDLdmk43bB1/OSExmBYjF2kgM
	2jHIBNmfJ7UeG9kT7z9p0iIzX3PNXOQfzXlU6ZbxKYnNetXHyr1umY/GrOkgHfqL9hYyl8h4EVq
	tt/KaPVVYHb6dhLSjjnaPtIM6fazE0DSEd50b/371wPkwHzOupPyy/NxFGsHUD/Q674nr3gcMLD
	mdu0sqyeIvOJmr9husPCh1403lrpT4FJU95NC5wzqmrj2TPWrEn3uvk0b4/lTczGwJ0yV/AfG/Y
	obsrkBrS3BDAVmw0dLXXnove1pFYLbIHhgzF/uw2g7kJsS2ayvj/kB2fjy2TBUoRUnwz63dVWfk
	80ZNicBtpysp6mWFO1bA8oSWoZ3KFTneFMTMUgZEo6viAjMYosixOUeVe9FdcUlrAAZ+Q/FPuUJ
	Lr3dATwgr9gU3dNaNVWp8Dtbx6NkGmLZMdXIbeDOUV+W3aiQ/+9rSrcIoM91qYfNGDfA==
X-Google-Smtp-Source: AGHT+IGUEdxHiyCWperhHsuDIhEO8V9sJUM1A2kjTrgtL+dCAbFKdPYVCFKjJJ08pF2S64in52/XSg==
X-Received: by 2002:a05:622a:14ce:b0:4ee:58b:72f2 with SMTP id d75a77b69052e-4ee4b444ae0mr440157101cf.12.1764279083539;
        Thu, 27 Nov 2025 13:31:23 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd3449703sm14437431cf.32.2025.11.27.13.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 13:31:23 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
Date: Thu, 27 Nov 2025 16:29:42 -0500
Message-ID: <20251127212943.24480-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike the phone SoCs this was copied from, x1e has a 40-bit physical bus.
The upper address space is used to support more than 32GB of memory.

This fixes issues when DMA buffers are allocated outside the 36-bit range.

Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index cff34d1c74b60..cd34ce5dfd63a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -792,8 +792,8 @@ soc: soc@0 {
 
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dma-ranges = <0 0 0 0 0x10 0>;
-		ranges = <0 0 0 0 0x10 0>;
+		dma-ranges = <0 0 0 0 0x100 0>;
+		ranges = <0 0 0 0 0x100 0>;
 
 		gcc: clock-controller@100000 {
 			compatible = "qcom,x1e80100-gcc";
-- 
2.51.0


