Return-Path: <linux-arm-msm+bounces-44123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4CAA03DA2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 12:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4E731659C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D7F1EC01B;
	Tue,  7 Jan 2025 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QF0olLCY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DF81EC006
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249123; cv=none; b=B2kic6BVXp17+kZ/7/rMMN9O4XIMSGANlEmpNevoNaESht8/xmfPJRaNo9NVxBQejTjw60iBfX9zGPTjJymg1OLZxlnpYMyorJOGUXZJiCDCdfs8Z0aqu1oAlfEXtzNOP2AqEd2dRo5gTUZ33GSZLUyn+vsQMjnlKRbY99Ki7/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249123; c=relaxed/simple;
	bh=OfOEkScPJn2s6J2v3K85ULAVMG3MWr1RZT8sX5h4CTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FADD3OgSE77XPx0XLEIFzh9On6tqWZ1qwfKgjjO3Fq3rPiSDO0c8wxcpxdQIPukKceP2rK6le9elwrltbbCkkDOzQc+SG1q7IeiUplVLvD3jQTEzHHibYSP2I1V4250Pl9bWY7fx+/g/AeQrARRBGU7+Y3xdAMyVqyNVfOBWHcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QF0olLCY; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso27005499a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 03:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736249119; x=1736853919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7sn2BG5sdvDbcSzNStcu70GGFUnOPYuQtJHvkvNK9yg=;
        b=QF0olLCYJJt+m6wTpwxV4PhaqOhVWSEn21fKNorrOjE+hY2f5z2+2EdVi3IfvuS9kI
         LhvBq1fOaO+I1DuDdwBe/52d0twX9+2Sfn474wtfi15z5FHRT57HSALEJsKSP6VL8rP5
         fkqdLimbA9yNHle0sJ35aLWWxoN5VVXsYyOooCnOQ2OErq8Q6xPPI9KEyjwgJ2Q9Z0jv
         28oYf4vmcG6BqCuRDEnVE2ItlJ/Osul6bgyKPQvevSPgipd1+nEvNPWLtShE+sLQ34s2
         iHchcQzp/GC/PP2+gBSy3iM9FU1sPiFST5OfcGnc3pQ/TEu/1KBE0SDWCc6B5UsV1fM/
         0T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249119; x=1736853919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7sn2BG5sdvDbcSzNStcu70GGFUnOPYuQtJHvkvNK9yg=;
        b=UDvXxhcakbSW5J/vQEClKmyFn5tM4T4bZd4xZd7Docx//fDobRGAQkoWvfdTDwWP4S
         3lwYWHDBN68jsVPa2G6W50tX4FgjxKhoX2+kIbPilKzUwZR+qhqTnbaBr27lKgpqCmz8
         M61giWlXQCuF5YwjWeB2S+UcI9AKQvq2SUy5V7N013p1IK7AzluJ0XM8tMwx1dSCgG6v
         hon/OPQrvNcN1Y8R0WcasOoJRmPrrFu8UQkqbetny3AQncHHxRHM/Xh7K2L6Tbu5bvDJ
         xVo7oKnKQ3cd4wmyIyzWfP9LxWkZUSyp3f+zQZ1OwaHN7q5zhF0e+jVvkKvMln5U7WCN
         j+2A==
X-Forwarded-Encrypted: i=1; AJvYcCUdZG1XiM/o/ifBn00OzyJxKtPAC9rvo8Pa1ERenE6Z49HNQly4qTjEnPHqCwbl9W+NE15F1HTpWalmhNbY@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGzxxQVXF1wZ6MhjtPC/v5Si7v+tqjTzVpfMqT7f3SPZ7QNDy
	RVcZyfyBfhZD5/gfBwrYcHYZGsIF+YS4gF2v0ZVa2rl1bnHmNRvCuBvO+81cKHU=
X-Gm-Gg: ASbGnctZul1PhXM8xetRa6VshDwfSb47LAy9nkWszY83Wk4PRouupYTHsqwWrUOZ/fU
	Gh2VI6OBJ3wUFctuX7sGK8OfurelYpKb3hMTgRGz13CoVUGhZdcdN6wVaVxQL6Z02ih5mCnkRtO
	c/qDSFS72QrEXLSHBMp6E31P2ioyQQ52VgG/hMG1weaCDPNswLKvLwiO0GA7GH2OMvjCkJiFpzw
	bT5Dyfeow64Lei12lVSb5otUP1XV+/tygJ6zxygYswCLaDygSdFT8Sx9y8jMw5Y7UkrjRgQJZtF
	d24kR3rZMZQWzV6kxKyQf9ZVDFiuoGR5ziH6zL8=
X-Google-Smtp-Source: AGHT+IGh9M3EnIPRVcMQNI989EcvZxMCNMXogDiQ3BV0jMzT1VyZYyESdCgc7jwCzo0D83CZJZ/lXg==
X-Received: by 2002:a17:907:9722:b0:aa6:6fa5:65b3 with SMTP id a640c23a62f3a-aac3352c204mr5521668866b.47.1736249119218;
        Tue, 07 Jan 2025 03:25:19 -0800 (PST)
Received: from ?IPV6:2a02:8109:888d:ff00:ca7f:54ff:fe52:4519? ([2a02:8109:888d:ff00:ca7f:54ff:fe52:4519])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895502sm2397516066b.63.2025.01.07.03.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 03:25:18 -0800 (PST)
Message-ID: <66fb0c6d-472c-4131-bd25-83266cf497e4@linaro.org>
Date: Tue, 7 Jan 2025 12:25:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Add support to load QUP SE firmware from
Content-Language: en-US
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
 andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
 dianders@chromium.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org
Cc: =quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Viken,

On 04/12/2024 16:03, Viken Dadhaniya wrote:
> In Qualcomm SoCs, firmware loading for Serial Engines (SE) in the QUP
> hardware has traditionally been managed by TrustZone (TZ). This setup
> handled Serial Engines(SE) assignments and access control permissions,
> ensuring a high level of security but limiting flexibility and
> accessibility.
>  
> This limitation poses a significant challenge for developers who need more
> flexibility to enable any protocol on any of the SEs within the QUP
> hardware.
>  
> To address this, we are introducing a change that opens the firmware
> loading mechanism to the Linux environment. This enhancement increases
> flexibility and allows for more streamlined and efficient management. We
> can now handle SE assignments and access control permissions directly
> within Linux, eliminating the dependency on TZ.
>  
> We propose an alternative method for firmware loading and SE
> ownership/transfer mode configuration based on device tree configuration.
> This method does not rely on other execution environments, making it
> accessible to all developers.
>  
> For SEs used prior to the kernel, their firmware will be loaded by the
> respective image drivers (e.g., Debug UART, Secure or trusted SE).
> Additionally, the GSI firmware, which is common to all SEs per QUPV3 core,
> will not be loaded by Linux driver but TZ only. At the kernel level, only
> the SE protocol driver should load the respective protocol firmware.

I gave this series a spin on the RB3 Gen 2 with U-Boot.

After fixing the compilation errors, it seems like there is a consistent
hard crash (the board freezes and resets) at some point during i2c
controller init with this series.

I noticed a similar issue with this same logic implemented in U-Boot.

Could you clarify which xfer mode is appropriate for the i2c controllers
on the RB3 Gen 2 and maybe give this a try yourself, or let me know what
other info you'd need to debug this.

Thanks and kind regards,
> 
> Viken Dadhaniya (7):
>   dt-bindings: i2c: qcom,i2c-geni: Document DT properties for QUP
>     firmware loading
>   spi: dt-bindings: Document DT properties for QUP firmware loading
>   dt-bindings: serial: Document DT properties for QUP firmware loading
>   soc: qcom: geni-se:: Add support to load QUP SE Firmware via Linux
>     subsystem
>   i2c: qcom-geni: Load i2c qup Firmware from linux side
>   spi: geni-qcom: Load spi qup Firmware from linux side
>   serial: qcom-geni: Load UART qup Firmware from linux side
> 
>  .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  11 +
>  .../serial/qcom,serial-geni-qcom.yaml         |  12 +
>  .../bindings/spi/qcom,spi-geni-qcom.yaml      |  11 +
>  drivers/i2c/busses/i2c-qcom-geni.c            |  11 +-
>  drivers/soc/qcom/qcom-geni-se.c               | 445 ++++++++++++++++++
>  drivers/spi/spi-geni-qcom.c                   |   7 +-
>  drivers/tty/serial/qcom_geni_serial.c         |   7 +-
>  include/linux/soc/qcom/geni-se.h              |  17 +
>  include/linux/soc/qcom/qup-fw-load.h          | 179 +++++++
>  9 files changed, 692 insertions(+), 8 deletions(-)
>  create mode 100644 include/linux/soc/qcom/qup-fw-load.h
> 

-- 
// Caleb (they/them)


