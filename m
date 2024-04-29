Return-Path: <linux-arm-msm+bounces-18852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF33B8B6634
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 01:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12195B209F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 23:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A75177983;
	Mon, 29 Apr 2024 23:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="By+awNSK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA9C13AD18
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 23:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714433085; cv=none; b=OC0t64nlAhgKkzY9lnVjR0Vr2ZqL7Tfj2WolJg8KTLwOlwy5aHBI0YPx1OBD9yIPYTQj5r3v627IqGcVl1FpX6lhwD58VcM2kFMa6F3RFSLU4f/RNmOU512bQJlSyuSpiLBh03axCEUDgH+IGviFzVF/CoAj/f1strXffliB7uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714433085; c=relaxed/simple;
	bh=jpJg343tUvEgPaQ82/BOHJpfijqZQCt7NOG/nMRYgUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BMB4bCnJduwvXFFWUQZXa4moZnkqdDIIrD2oiqBXVoMxyp5X2m8Ho60UeHLRPOfB4IwZsKBC64O4ZTYZSE0K3AD4TbuUCG0uTblTOg1EKgFbqszOEvINJCI6PveMz4RSKRozRnKbiGbqca4J18XfRTmZa2HIYb/Y5iflBevuM6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=By+awNSK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41c7ac6f635so7545395e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 16:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714433082; x=1715037882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fd2LTJN7mExidgR4wG0glRVq7EWgwgs0gJNGj4m+AT4=;
        b=By+awNSKrtGmMSRj8m4dgRnK/FToHqG2QVUeukifKGPGIuaahBz+q2qT1k3tUmmwQF
         w3V8qCZeHqfEsJ0Z0iCJ6kZMsrYfWXMZ2vCUI8OadcSHl4AJbTGpZMhwAADFpmt2B6YC
         5l6YUZzFEzwcJLa3smm3s1LnFrAxoCjiQ7X+6vA666OVklgO7/Dnqm55WvM5fM7Y17Rw
         TszylIvC71DSCvn42Hkq5X5BG/pCxrYVaaekBzVaq4xcSe9DC9SdoKvB4jeQL+EpCb7q
         69KE5V4ypvIo15L9S6wPRNBdwJHe1Cvne0HhvTOyKpmCzAcrqdTU5cSUbRODpkGlLYvQ
         JeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714433082; x=1715037882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fd2LTJN7mExidgR4wG0glRVq7EWgwgs0gJNGj4m+AT4=;
        b=gfmK4NXpGUL3w36TST3E81WUDEglINPQ8ZF9TEQC9xg6JrH9yeNQLLe/OGOz5951Y0
         S33dgJleS1GjLNCr2W198xXgV+3y346NcUgnnJjgaQ8EfO+6/bXIQBy3LmifKK2i/d0L
         fJzyLF54TgLn5znKWnYOK48NCe3ljlmvtP0FtvTcm5W4BmAYUrcoKGcpLEfE04oVNHHL
         CQS2kSoaj7nVRnoObxdCYazWfJdUPanFpzVEre8fpjC4IU4qrB69c0y0ZwV1rER6p7YC
         EANv67c0Bs/gbLkL1bSQr5uOzircnRuGHMLUazAGRW7X9ZP7DFM9yAqv6goxFGTEHKrg
         1MxA==
X-Forwarded-Encrypted: i=1; AJvYcCXxHqfLFiEIY7mgiKpbpDvBdFBH4bCVbQd4s7gv2TeWlrmEI+0iNVXddH3s7padQrI7x8OALWV27TUM8UNIBzVwLUKyuOg7kUNmYT/scQ==
X-Gm-Message-State: AOJu0YzB8REbcPAZCKead+QGbwMuHxOpxyUyJhVgShGN3xkOifXpwDv7
	QMerdVp+WFy6WJKbaO7UA6fwNCw3kcEtmeFBsnSukGbt0hpOanpPXeS4z3BGCQ0=
X-Google-Smtp-Source: AGHT+IHE7q9J0s4PVV5qxrR1nnvsJd1w+fjAvErLazpWYnvpEwqc/iF7E4hKZWuHUnbgRl27LnK9TQ==
X-Received: by 2002:adf:f5c7:0:b0:34a:d1d4:cb3c with SMTP id k7-20020adff5c7000000b0034ad1d4cb3cmr9833037wrp.39.1714433082505;
        Mon, 29 Apr 2024 16:24:42 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id y18-20020adff152000000b0034d7a555047sm315284wro.96.2024.04.29.16.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 16:24:42 -0700 (PDT)
Message-ID: <463bcd2f-c741-4120-b7ae-2bb55d5211e3@linaro.org>
Date: Tue, 30 Apr 2024 00:24:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Work around missing MSA_READY indicator for
 msm8998 devices
To: Marc Gonzalez <mgonzalez@freebox.fr>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2024 15:01, Marc Gonzalez wrote:
> Work around missing MSA_READY indicator in ath10k driver
> (apply work-around for all msm8998 devices)
> 
> CHANGELOG v3
> - Add a paragraph in binding commit to explain why we use
>    a DT property instead of a firmware feature bit.
> - Warn if the "no_msa_ready_indicator" property is true,
>    but we actually receive the indicator.
> 
> Marc Gonzalez (3):
>    dt-bindings: net: wireless: ath10k: add qcom,no-msa-ready-indicator prop
>    wifi: ath10k: do not always wait for MSA_READY indicator
>    arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator for wifi
> 
>   Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml |  5 +++++
>   arch/arm64/boot/dts/qcom/msm8998.dtsi                           |  1 +
>   drivers/net/wireless/ath/ath10k/qmi.c                           | 11 +++++++++++
>   drivers/net/wireless/ath/ath10k/qmi.h                           |  1 +
>   4 files changed, 18 insertions(+)
> 

I wonder if you could infer the workaround based on firmware version, 
instead of kernel passed flag ?

---
bod

