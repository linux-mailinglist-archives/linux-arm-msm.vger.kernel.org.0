Return-Path: <linux-arm-msm+bounces-63289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E4FAF050D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 22:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ACE01C2066D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 20:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9788C2EE991;
	Tue,  1 Jul 2025 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvjXCBfb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3DE277813;
	Tue,  1 Jul 2025 20:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751402621; cv=none; b=RFYGirXfZ2mgFfYWok8KoU8aYKu/neN9kGGSASIi19G221TeJjCdsqZo8WNcmbNT+DTFQ+VfFB8bOAB714NmgSEXZXQ9pkeiaSWWzeBdlxxjUqZs7btlY/leRWx5ImnrwNBrsH41mn5Uw7ljaw9HU7XMIDH59pr20V6sfTUH+p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751402621; c=relaxed/simple;
	bh=DLlHCGnMibJz2mc302N4LVBVKgIvyVAIIJF+S4dQZPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IS7WI2UOthIPUWNRHdYuLo++sVAa9bQjONG47T/29eAvvQt/cS2eRkA6+KBoibfi7tt4hO0VV3iX7xgEVFxFAWRk8UCTXdL/j5F7it/0ROyUl+KMfNLNmTjQDO/sEBHQ3s2ExjPz5R6cO6nliecC6aPaYNsRzIy2zGTQX8UW0G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvjXCBfb; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f379662cso3146389f8f.0;
        Tue, 01 Jul 2025 13:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751402618; x=1752007418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Njm303v+//5zYcR1gKXqMUD57x2FxaWtMa0B+6B9EqI=;
        b=cvjXCBfbpWGUeyqGvSd24eT/d8S2NJWIXU1zBI9gYr7Pti92UXaVOioejXnIjJzShp
         RqSiSnfpCJjRSF1PiX0olU6jYqRNLTsexyPAzDs9JDqspiIgE4exI4MVEs8/QxLL1g+f
         xfIbuRMzSanFXD0nFvo1B1tN/r7qnsP/rjhEiIkkiySabKa2SqaOrz2Ofk7LnmxGUBlG
         JgYbHVA2J8dNH8V20CGJTWuQlue8q2gqlcM+PfaKXr8kQoc1Z0vQ12aPrQCC6uPptlK9
         6IqT8IR2pKzgw6L8T4DUoEjkMhTzQ6J4qjbLUing9rdb5xBVdCnFS3jpLxppR51BFQIG
         zjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751402618; x=1752007418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Njm303v+//5zYcR1gKXqMUD57x2FxaWtMa0B+6B9EqI=;
        b=t0RiYhXMdzv3if08viRGlb1ikeAeDYP39KGlBDBkAXMUd9StTcmfFCYFGaoX22XyLD
         s8x/VMUfEghmQmlKOpVsq+GwbPVEKZes8PbF8HRuq4QQA/OvM8NuVSKYvGaIZmDhATxq
         S7CGrWzXwL+9qi3GZrbGjGQow8hdZYEfmDkv6+ldfo3EMxCaQhoYXXLxjzaKPyOS8Aff
         9728D6UcK7Lbftwlwx/gc6LHBBV+Uv7VeyyWVIUEQsqz2fuY9YW5RsOfXTqP5OzU68yN
         uhG45eV4styGEvlvXmG2K4kBGv0EWTyvnx1cD/yms/VNjj+Fn4yCJlK+CmXk/OGqh6iV
         IT8w==
X-Forwarded-Encrypted: i=1; AJvYcCWDf/UevTkZhEDliVZEJrpWj/UKpnVcdrKFLRrwt3lTrI8QyrinepDGxvm457vVp7t7PHPfOnD4meK8H/or@vger.kernel.org, AJvYcCWtnKgydbJJCOIpojH3eUKyODg9zYmhVLSu0Keq4ydzBN6TdmbTrFG7kin4NpJoVjztYsXLcfvoMtKU@vger.kernel.org
X-Gm-Message-State: AOJu0YwJeCX9lQr73+4GqOuFize7BP5w+efHbZIiHBz2TU8gLN3vb5hD
	14Lc9dXLnijwG1OpqlN2ORu4XRlDXuXZBJi7gZ/KTw019t1istDkkKBpQwczCZYIxw==
X-Gm-Gg: ASbGnctjS272Evj0O7+1RuwRu84iBltgahLUZ54C4WkycFlYfo/QJ/F4tjkx+th0dEN
	/1Vw/Di+nkGmkCubtz/WGwPn1v/DMdXufVqAEFNwxcDq2+36V2WZdCzosJzNbTxa+CVIEKuWLDT
	ItZen8wP2lJ4r/+2gldF0HvA5zod11oue9HF4AxUgiJb7CU3Ou2/4gK4j/+CDJuxy59RmB/1duz
	HOjWpiWpZHCs/AUWbTAmoiParIE/Nkh8CetJwLwLqKEXtviGSCV/CUkQWV/wKeIHPYvV+BdVDQD
	38ztjBxTatBfiATE17hVp+hHm/rizqvBfQR5afav+Fz8AhsuxhClZ3Q5ZDBkXIR9Y9pwHprNhKG
	44fkrhZ1i
X-Google-Smtp-Source: AGHT+IFMCAnnyfHVVBcvcHqwfNz2s1ARKpKIFu+4SJJXbDspaDdpeFewlkkaPbbS6j6O+DJeIQKUJA==
X-Received: by 2002:a05:6000:2112:b0:3a5:8a68:b823 with SMTP id ffacd0b85a97d-3a8f4deca81mr12978133f8f.23.1751402617645;
        Tue, 01 Jul 2025 13:43:37 -0700 (PDT)
Received: from [192.168.20.64] ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3aba76e40c0sm10037771f8f.59.2025.07.01.13.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 13:43:37 -0700 (PDT)
Message-ID: <86116ada-51e6-4eef-bff1-f8b10a5edacc@gmail.com>
Date: Tue, 1 Jul 2025 22:43:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add x1e Dell Inpsiron 14p
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
References: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
Content-Language: en-US
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/24/25 01:53, Bryan O'Donoghue wrote:
> Add in a dtsi for the Dell Inspiron 14p.
>
> I'm currently using this as a daily driver including sending this series
> from. Its reasonably stable on 6.15-rcX.
>
> The first two patches can be applied without dependency, the final patch
> relies on patches staged for -next in the media tree to be applied,
> presently.
>
> https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/2ab7f87a7f4bf392e3836a2600f115a1baa1415c
> https://lore.kernel.org/linux-media/20250407-b4-media-comitters-next-25-03-13-ov02e10-v4-0-211e3e6fae90@linaro.org/
>
> Working for me included in this series:
>
> - USB
>    Both Type-C USB ports
>    Type-A port
>    Fingerprint reader
> - WiFi
> - Bluetooth
> - RGB Camera
> - Toucpad, keyboard
> - Display
>
> Working for me but not included:
> - Audio jack
> - Iris
>
> Not working:
> - Speaker output
>    Still WiP haven't touched this in a while
>
> - Battery
>    Dell has its own Embedded Controller likely from the x86 platform reused
>    on Qcom which we need to reverse engineer or get some information on to
>    make faster progress on.
>
> - cDSP
>    Haven't tried to bring this up.
>
> - EVA
>    No driver haven't tried it.
>
> - Bugs
>    Occasionally when resuming I get a fencing error with hyperlock and
>    freedreno, TBH it looks like something in the GPU or SMMU according to
>    Rob Clark: https://pastebin.com/AWjCyaap
>
>    Ath12k has been splatting for me up to 6.14 when removing a SSID.
>    I switched on ath12k debug when going to 6.15 and predictably couldn't
>    reproduce the bug, either because the timings have changed as a result
>    of Heisenbugging or because a fix has been slipped into ath12k.
>
>    Other than those two I'm pretty happy with this system.
>
>    The DTS is based on Aleksandrs Vinarskis XPS, Lenovo T14s and Qcom CRD.
>   
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Hi,

Just noticed that the device name is misspelled in a few occasions, need 
to s/inspirion/inspiron/. DT filename is wrong, model name in DT is 
wrong, one of commit messages is wrong. Firmware paths and compatible in 
DT are correct.
Otherwise, is the plan to wait for CAMSS to land, and then land this 
one, or perhaps the rest of it can go in already? There is also Latitude 
that was recently submitted which is very similar, perhaps those should 
be unified (CC: Val), probably easier to do if Inspiron lands first.

Regards,
Alex

> ---
> Bryan O'Donoghue (3):
>        dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
>        arm64: dts: qcom: Add support for X1E80100 Dell Inspirion 14 Plus 7441
>        arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor
>
>   Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>   .../qcom/x1e80100-dell-inspirion-14-plus-7441.dts  | 1490 ++++++++++++++++++++
>   3 files changed, 1492 insertions(+)
> ---
> base-commit: f7570505263aff2b63142f0d68fa607cd60eb060
> change-id: 20250417-qcom-linux-arm64-for-6-16-dell-inspiron14p-ed68cd65ebad
>
> Best regards,

