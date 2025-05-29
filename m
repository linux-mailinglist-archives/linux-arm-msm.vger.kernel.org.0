Return-Path: <linux-arm-msm+bounces-59815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF18FAC7C6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 13:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 932C01BC1896
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBF128DF49;
	Thu, 29 May 2025 11:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axDttq9T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3699D207A0B;
	Thu, 29 May 2025 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517229; cv=none; b=MWuKBexXpjd+3PrmYb2ljcoRBOXtbgx5zk76VV0bvjBosRa5ES6tyG6opRX08ncFaMGpupnJD/CcanYa2xJMJEA+RCSuyyrZ/rhmrdqJwdyTWC6M1bdP3APGPYdz7YmNe/hs5/625OXepwMsE6NuZQ7shXW0s4ANHdgEcsYNQhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517229; c=relaxed/simple;
	bh=zVRog1dgEdzJSKrjtDJMVJkHH7+/67hn+GXt1AhFJjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TklVU2ahuxbmmovQ2a3VsnrlhtmSuRjAxqMPys60qOVGLdGMj5NnasmenfHU+dbBMDc5zKXgzDFmsbDVM3esl6Lpyv7V32AszL5E6yg8X0nrux6EEGoLt9PaG6y/m7T+OwJ0snbr/T2xeAJEDRUvZWReY42QTO1TjZMIWXC10/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axDttq9T; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a375d758a0so685796f8f.0;
        Thu, 29 May 2025 04:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748517225; x=1749122025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yK9qxpphezwGnQuF+KskqWcGIK9SoXYFqqQnXtln7Y0=;
        b=axDttq9TIKJbEp0JH5btXFjWTTP2gNCr4WCQIdFSkWSQ6qeyr6gEAlcDH1kLs5LNk0
         3ToU0iVu2YDjma44CuXFxeoI4Rr4YwMhEAWy19lAMyLbD6T1tahIc3Xgnerzlp69zCwW
         qhdxYjaKQ18Gt6+7eonDOQVre/yI5BsfbED4K+yrYcnUEpoulC45m5WIRA/SpJ/xHuX6
         0tL1wBW3sHr1qttHZFLvaEqNGUE3sOvMyitvsEwdXB4oQDOmQBmc5rwzvGpiuk4Ho32L
         JvB1WuJPNMwjX8IuwyUJ9ZtAkgRpBL4sgN1UitTJ8X7vwqfCxg/H7KA1Xh3gJ6Rz6GDh
         OqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517225; x=1749122025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yK9qxpphezwGnQuF+KskqWcGIK9SoXYFqqQnXtln7Y0=;
        b=p6ByZdzksjPNVXaWA//b5aNq9sASTl8odVXKphzK1XbdCvYdZIlvojD+/IWoZSiNvP
         VeY9164RW+7JqmlhoIfomf+qcbu01XGrioX6hVKV8IsBmuDs3mgDeNDe+8/HsPECHZ7F
         WhnvEUTahS6Vt8pkIdzD+U2CttfwVPYyWNPZBJPQ0pTwllH+BdSlK0d+8UhbLutjhQu/
         OHoI96nD5G4X6hPVQV75MXi3J+iwiRx24jhn6awUmWARKqqlND9VgwbGt2Cgp+NBe5jC
         +hmbzMMcZCJdQi02gexO0YASpteGPHZbyq/NQArKD8Lk9lDyNWmtgRPm7r1TQfPe+QVy
         RN1A==
X-Forwarded-Encrypted: i=1; AJvYcCVHW/wwfrsp1XJeWg+xBN/ogVbO7gJruNdgbZsPaKodYWr3a4mLk+vWKTwEj9iDgXUkDZp+/NCpQrhk@vger.kernel.org, AJvYcCW4EmdntBMNCz/5ukqucF7gQEKjKFiLoGCgKvoKIweBrkRMkc18qZjChqdyytrHhQkQ9hRyDjvAZ8frRv7A@vger.kernel.org, AJvYcCXUMdB6RN3Xb9ZBJwk4mW19otalvSv1rIS1FBXBY0yKvWGuJU5E6DbgjUzGAupthzKSjnEgLYiZ0lA7u8jBNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+KZysIifoUYxOAqy66LYm5xlGIP1Jt3QagyaZu/8rg3IQOL+i
	M7tYkxezKWRR42HH6uL5in39pDFrelL1wksyRmjCiNIBr8LJBgt2sxY=
X-Gm-Gg: ASbGnct9kW2iTTBmMwFtPyYYkp1sI9RJLDO1jHCQXnQlQ8PA4F1doevnuc74CtVPgH0
	VHTJhZbA0OwRUBtU54GpKjA3uwNoXIOHEUtWuzWNdtDxEnXdePgsmcdnEuUK+qLcfHRzb+/Rl8o
	8+fykGMBRVaVZ+mDinrOYMW0Q+1c646TtBB6J47VwVfN7T0jSWfk/+Pxz5CTzPkATTXA1J7j3dC
	LRb7Y/qem9p7FlCG1XacSF1I+7r3vvWadhzMmPRxU1JvLBUdnCuKgs1NAuw3DjXPHF/M3GNoKGE
	ydVY7Z84r0WufvRncPvfGD+0ZnZBg/TFxm0+5NqSpQ6BTIvEH5mRYVhe57NrQA==
X-Google-Smtp-Source: AGHT+IFtVOAYLaqimD0CxC6hc1kQSyzh4mu6P4w2Hy3B/G1NI/FXQGzDsNSqYq4Rk9kil0/t65js7A==
X-Received: by 2002:a05:6000:4027:b0:39c:1f02:5409 with SMTP id ffacd0b85a97d-3a4cb4619camr15584768f8f.9.1748517225032;
        Thu, 29 May 2025 04:13:45 -0700 (PDT)
Received: from [192.168.2.104] ([66.205.92.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc02cf0sm17219285e9.11.2025.05.29.04.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 04:13:44 -0700 (PDT)
Message-ID: <2df66542-90b7-487e-88bb-5433b500c518@gmail.com>
Date: Thu, 29 May 2025 13:13:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
To: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
Content-Language: en-US
From: Alex <alex.vinarskis@gmail.com>
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/27/25 22:40, Konrad Dybcio wrote:
> Register a typec mux in order to change the PHY mode on the Type-C
> mux events depending on the mode and the svid when in Altmode setup.
>
> The DisplayPort phy should be left enabled if is still powered on
> by the DRM DisplayPort controller, so bail out until the DisplayPort
> PHY is not powered off.
>
> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
> will be set in between of USB-Only, Combo and DisplayPort Only so
> this will leave enough time to the DRM DisplayPort controller to
> turn of the DisplayPort PHY.
>
> The patchset also includes bindings changes and DT changes.
>
> This has been successfully tested on an SM8550 board, but the
> Thinkpad X13s deserved testing between non-PD USB, non-PD DisplayPort,
> PD USB Hubs and PD Altmode Dongles to make sure the switch works
> as expected.
>
> The DisplayPort 4 lanes setup can be check with:
> $ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_debug
> 	name = msm_dp
> 	drm_dp_link
> 		rate = 540000
> 		num_lanes = 4
> ...


Hi,


Thanks for the respin. Together with `mode-switch;` for x1e80100.dtsi 
and 4 lane DP change in respective .dts, successfully tested on Asus 
Zenbook A14 (Parade PS8833 on both Type-C ports).

Tested with:

- Type-C USB3.0 pendrive

- Type-C to DP cable (x4 DP lanes)

- Type-C to HDMI/USB/... dongle (x2 USB3, x2 DP)

All three variants work, in both orientations, on both ports. When 
switching from x4 DP lanes cable to USB3 pendrive no re-plug was needed, 
it works right away. Suspend and resume (to my surprise) also works.


Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com> # x1e80100, 
ps8833


Regards,

Alex


>
> This patchset depends on [1] to allow broadcasting the type-c mode
> to the PHY, otherwise the PHY will keep the combo state while the
> retimer would setup the 4 lanes in DP mode.
>
> [1] https://lore.kernel.org/all/20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-0-79ec91381aba@linaro.org/
> Changes in v3:
> - Take the series from Neil
> - Rebase
> - Rename many variables
> - Test on X1E & X13s
> - Apply a number of small cosmetic/codestyle changes
> - Remove some unused variables
> - Some smaller bugfixes
> - Link to v2: https://lore.kernel.org/lkml/20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org/
> Changes in v2:
> - Reference usb-switch.yaml in bindings patch
> - Fix switch/case indenting
> - Check svid for USB_TYPEC_DP_SID
> - Fix X13s patch subject
> - Update SM8650 patch to enable 4 lanes on HDK aswell
> - Link to v1: https://lore.kernel.org/r/20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (1):
>        phy: qcom: qmp-combo: Rename 'mode' to 'phy_mode'
>
> Neil Armstrong (5):
>        dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch
>        phy: qcom: qmp-combo: store DP phy power state
>        phy: qcom: qmp-combo: introduce QMPPHY_MODE
>        phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE
>        arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13: Set up 4-lane DP
>
>   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   7 +-
>   .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 +-
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 182 +++++++++++++++++++--
>   3 files changed, 173 insertions(+), 22 deletions(-)
> ---
> base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
> change-id: 20250527-topic-4ln_dp_respin-c6924a8825ce
>
> Best regards,

