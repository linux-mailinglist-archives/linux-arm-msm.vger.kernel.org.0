Return-Path: <linux-arm-msm+bounces-48493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0682A3BD0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 12:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CEB7170D84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 11:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBECD1DF74E;
	Wed, 19 Feb 2025 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+J8iX7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F86A1DED5E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 11:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965015; cv=none; b=nUHX9j3QfjMcDnrYP1GC+5nc7e3uqAfcxaK3mFxIhj8STjZ4hCUzcWxE8R/lfuVT/R/mKt2TIJWN5wjE3DZp2QJMglrigFVF/PiVjSaZTpyStTO6JR/rEWHipEABIbDwD9XUnsanzhaid2sQpsIr51RBPRnHok+I/3ruya2Iwyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965015; c=relaxed/simple;
	bh=3H69X3Cqj2JbC59hSmaYbJvrvfm7od4X1ekR5TALqp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OCQZ2oXzByz2jNnjfNnpbaf9d4edUBSJFtZZ8ljzHpw6uNsOrsWIWBWNN71QBxafyn3sxg0IiBsD3vPZk6KQBA136qHwgHMNWM7r2OcT74APoB3CQ9Ozbp08p4qYjTN4L25kDPky75WKbHl94TkLHgaTAxk+KEslTzxv0lyn1JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V+J8iX7Q; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f488f3161so1485028f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 03:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739965011; x=1740569811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ueWur+NN/gkMnNOeqW0FEJmxaSPUKRn8QUh96pYaGz4=;
        b=V+J8iX7QZLwH0YkXfbzbrUUBQJ4e5VhNgw7gYbEn/VZIgTTP0Htff234eXbOtYg3Fn
         YW/B0DTFyAlOfd1F1dlk27rmiTrqQYaFuI1WRnkFrxDij7OBsF0oCvJVZTRCy6u4PyoN
         mr6VYXIvrujmqOVwV6U1YR9YJnTAIg0GfFY8orSlhg2nRuA1sgJvRDeAzuzG/bdTsnJv
         XiH8ZTRk1RSa6ONhH+Jwojq+MD76rj3uKR86uu5sbovvRDvTpaOEah35FqR3kgCTwEI7
         KYuPqxqAJETM98lPhwotBQiJY3lJdLNJnV5qLePJOhNwhtUe2LzYjUsU+Of0Px/B7ieo
         Jzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739965011; x=1740569811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueWur+NN/gkMnNOeqW0FEJmxaSPUKRn8QUh96pYaGz4=;
        b=Y4u/d7M8CRBeIN03vLDV2SPMMje8NB0iL0O+yrUxa6V6UP1sc2kN3lZdCwiLHNNO0E
         W8z51t7gWBWvuDs/LJTB4EPcUprXJDRBQpNBbInIdmq9Ut9NAmvjjh9/01VMkiBmwhni
         t03jR5uCwtnT4X4L0EJOFNc2o2yijhKRtOy1YpgOYS83uzd6/kOXWVOsL+ufDEPz9/nK
         F7rFXu6Zd+91UKLq9pN8oPb/EG1oVyBCIBO1TZIx4sapKxHhhpB854T4TiqZN6v3/9J8
         uTwp2TvcRT8qcA6pTJKYEDEqKl6Fq5AaHXCiXmpXXQuL8rdmCu5zVYrQ0dzBIMoPXpfc
         Yn7g==
X-Forwarded-Encrypted: i=1; AJvYcCULG95KZzZvHwU5nBN7z0uOjx+NMpyJy02dTCnGVezTc3hTmzFD5kmeLAWGQggnq9jUQtbiX8eEBYa1S5pj@vger.kernel.org
X-Gm-Message-State: AOJu0YzihrwgWVsg5RcBoaMziViWz6O7QTmWl+VYhFNTJlE57zdnsOkB
	lx14WmsxqnnH1r/z8vdosqUkJ0dadxWg1K/2K3VLXirLUTKsokVn8BTMXEZwrJk=
X-Gm-Gg: ASbGncss4Inl6kxWJd5lR8xvwexWnwgFj8tE+3lJXnUHGOngMYyWIIgiLh8GENbl3HE
	KMjFewF+axZxv31V9r2LW1LGWC93FB/CcPum9kvc1HLEvWJjbipriCeSdsSu7oiVdhmp10ioQuF
	Aag0u//y+KPgjQuIPBj1CgipM+WinU3IsUBvmyKX4/nUzzYduxpoPptf2NzicGiQCq/zaA2QjQP
	n85kuwDAe6y+b8zQ/0uCGrQUnel+/cdQCul4dSVStgTZkhHhypTnbNX5/ioQNvjcZELnlmQG3Fk
	7jZ5l3tB7CnZ+FBdW/lnGuHxj1/GmA==
X-Google-Smtp-Source: AGHT+IHj7r3NGsZDWby/4EjvSUDybeVrnPg+FYZgiGNi+BxmxRTlu3icH2awOt0iOOQQCiKEmobYIw==
X-Received: by 2002:a05:6000:188c:b0:38f:2ffc:1e99 with SMTP id ffacd0b85a97d-38f33f51346mr15874258f8f.49.1739965010576;
        Wed, 19 Feb 2025 03:36:50 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:8630:e1af:c2ac:8a22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399600257asm42437905e9.4.2025.02.19.03.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:36:50 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 19 Feb 2025 12:36:18 +0100
Subject: [PATCH 1/4] arm64: dts: qcom: x1e80100: Fix video thermal zone
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250219-x1e80100-thermal-fixes-v1-1-d110e44ac3f9@linaro.org>
References: <20250219-x1e80100-thermal-fixes-v1-0-d110e44ac3f9@linaro.org>
In-Reply-To: <20250219-x1e80100-thermal-fixes-v1-0-d110e44ac3f9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

A passive trip point at 125°C is pretty high, this is usually the
temperature for the critical shutdown trip point. Also, we don't have any
passive cooling devices attached to the video thermal zone.

Change this to be a critical trip point, and add a "hot" trip point at
90°C for consistency with the other thermal zones.

Cc: stable@vger.kernel.org
Fixes: 4e915987ff5b ("arm64: dts: qcom: x1e80100: Enable tsens and thermal zone nodes")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 9d38436763432892ceef95daf0335d4cf446357c..e349cbf6a2665695b5cc961cf9d53e7182e68e7f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -8727,15 +8727,19 @@ mem-critical {
 		};
 
 		video-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
 				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				video-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
-					type = "passive";
+					type = "critical";
 				};
 			};
 		};

-- 
2.47.2


