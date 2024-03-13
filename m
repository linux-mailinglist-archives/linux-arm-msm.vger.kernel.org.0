Return-Path: <linux-arm-msm+bounces-14033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39287B127
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 20:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 678E0282DA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 19:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C371874412;
	Wed, 13 Mar 2024 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p1L3DvCV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E5473516
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710354470; cv=none; b=kFmBW6rhYvksQ2nUdQMfNNaErW37H/X0R7XZovnwY9YRU3MN6wlnd/8IEyKDn89KMQS682DUHXlTlu6NC7PiUOXbcM5tPXVrzCT60LDFOPgmiFZR9OGeYVzIZNWj6JNxVjmcEExdU7WNXsMVpBgThfyys3DzKPsaMnhPy22mk3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710354470; c=relaxed/simple;
	bh=qopp5qh3RZHNjIu2FlP1yXeq96LeZUWZ5bgrIeXx0GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CV0EBF5hiteT89B5/XzpIh6Bu/aQX6FMaxlqpaInCQzbxOv27zFR0madZrMrQpyR0p+skBtKVDmuOTz2qWvZKAirNTlnLsrXrO36W85XYD61JJ5+cu7YF3b7tqejvJ5B+rGqrcsM9WoRyoOjTKmRLGUOwA0xIemTHmeleRa45s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p1L3DvCV; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513cc23b93aso208719e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 11:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710354466; x=1710959266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apbSKOocO0NP+sa6Wr9E2eUjCO233hf7PGNso7mAiCw=;
        b=p1L3DvCVh9ZppS69F9kem1h3ZhJ18sKOz6JYWXxt1rTPN0ZFKbMoJghYBklSYF4kpM
         yx46Kj5ZnjfuTPGTU3x8wR0HbdBJzvUZcuNMfs1hDgkJ42UpnyHLFkodQTdgCBrmoTU1
         9+LFL9k05J1o1XDbIW85ee6ap6jDh7nB3AFCalkHeBsIaBKQCY9miTX2n+PUX7nQ2Mt9
         TLvREyuCwy+1F2y3OWQf5y5Zoakf3ZURtH2nhNYxdvRzzHbQIFmupoQPUi7fU+eUYiR2
         BZD2Igjba03Wi5Lmn7V4NGGO7M32EEzYls6g8RT81/gM6PHiFnFq+kcvFQkXUp054Wu7
         ZX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710354466; x=1710959266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apbSKOocO0NP+sa6Wr9E2eUjCO233hf7PGNso7mAiCw=;
        b=vbPabkP9ICdwrQZhfLKecG4SNwE8fF/wVbjT/9bawVrKPIPvitqUHqXs8H8YM8vwbl
         D0jqLcSg/Xi9dAlIfQf9JWVi8eFLAzdn1kzf0h5soDogx+/O9mirj7MynW+3NjCFk7bk
         PsGlAUofeqTIkWUmWvenoaBLgeaHDP95BWVOhlh6worCXF8HNcxoHG7bDpvsQBXVQAih
         qYyTvbeTpFJU0Hv/94z1KJAD4/NDNhdOyQrgmgkyvN6u2+FALGW5OnZiAtWiIh4VaEQX
         yR2lhZu6Rsvfq5qE+cIZLbZPrOANUvWjFVhDjO8aRltR34/OoqFhJVeNcaJ5m8xCQt/7
         qoNg==
X-Gm-Message-State: AOJu0YwZMWI86jzzGAL+NyxArMvywLUsQH3WMQZdF2gUe5MQSH1pMNUt
	GogCrBEycFIuIaNFRIPcQJP0+MccrUaXBO53LlFWKRnZEKr25h9g5a5Q/5wUJFA=
X-Google-Smtp-Source: AGHT+IErs4ojVm6JqNAmE1N9FllNoLENjESLRyBEOnyG7ovdPpxqbngvbB8P38A0ixdPVz4b74rjAA==
X-Received: by 2002:ac2:454a:0:b0:513:c625:a6f4 with SMTP id j10-20020ac2454a000000b00513c625a6f4mr2718100lfm.4.1710354466140;
        Wed, 13 Mar 2024 11:27:46 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id fc15-20020a056512138f00b005139e4fbc04sm2005613lfb.137.2024.03.13.11.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 11:27:45 -0700 (PDT)
Message-ID: <b8d9117e-5e99-4f69-844d-997a3fbf04d6@linaro.org>
Date: Wed, 13 Mar 2024 19:27:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: add TP-Link Archer AX55 v1
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240313-archer-ax55-v1-v3-0-cd9402efab59@gmail.com>
 <20240313-archer-ax55-v1-v3-2-cd9402efab59@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240313-archer-ax55-v1-v3-2-cd9402efab59@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 19:25, Gabor Juhos wrote:
> Add device tree source for the TP-Link Archer AX55 v1 [1]
> which is a dual-band WiFi router based on the IPQ5018 SoC.
> 
> At the moment, only the UART, the GPIO LEDs and buttons
> are usable, but it makes it possible to boot an initramfs
> image on the device.
> 
> The device tree can be extended in the future, once support
> for other periherals will be available for the platform.
> 
> 1. https://www.tp-link.com/en/home-networking/wifi-router/archer-ax55/v1/
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v3:
>    - change pin configuration to use "gpio20" and "gpio21" for UART pins
>    - rebase on top of v6.8.

Did you actually check this? And how so?

Konrad

