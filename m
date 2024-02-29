Return-Path: <linux-arm-msm+bounces-12988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C8286CDC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 16:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02155B25E4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 15:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB01C70AFD;
	Thu, 29 Feb 2024 15:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="euMtdEpU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E36E70ADC
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709221782; cv=none; b=jRVIdzVJeUmQqeMVz59vlyvqq1QVlcecouJ+dX3yPyMZYs7J9FIjsFPtf9GfVgQgMiwEzZgOCz8OHs1RwmntGN1mw6Pkg+TiiPRyw1DtX6QMVeqasNmQoXD+fAU9tn+DKwA1HtT3fUsKEHzYnTYe76awUQUdKYiHrLsGTvY4mo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709221782; c=relaxed/simple;
	bh=CHcI2S0JEPj8mELbXV5Hi3VYv5okgHeAmgENHLm1Efk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9JJrmrsULswaUXPhwVFGNbovRA1AqWeqN3kDyLTpm41L+8EdykncPVyQhwvaMcpP4CKtLQ2jodd9zh0WRGLL2yyw4xEOvU7OiF62rUT5JhvyMLA15RcunmaH0CKA9JQ9/Bdio2x5GuKhByakEqkCRIn596RFSnz4scja1h19aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=euMtdEpU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33e1207bba1so484648f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 07:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709221778; x=1709826578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJWLEHwKCTq5M6yaIuOIWFF3XC8JrWtOfeFaJKHLycI=;
        b=euMtdEpUASCWHkgHI9o62h903+/f5eQ+yMeCJ7dB0LaTHtIXYiteBT1Jxc+tWiRw8a
         0PI0j+yS8g6fcfmUJ+0JOQOxUYjt7Zd6BZtlfQ4vDF1fjKzNDqg2mIeKOE4Iu+riR2NX
         zh85Bcp0h8ufFpaVFnuSpXT6UCw8E1MMpiwBFpgdoMHIVgDZm5m3BsaQHzUfm6xdHVJK
         ZhknKW46++XwHkbHdwXzyJWb07NRon2Rl8e1Xi668nI7qOkMkv84RenW1vwHZ2bDth4w
         xxAbH9CFVRsPbXZyKYs9JjmLNvn2wmZ80XkPU3jqj1n8SgjiAWdiDVWmd51lZRw9YQ2O
         kzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709221778; x=1709826578;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJWLEHwKCTq5M6yaIuOIWFF3XC8JrWtOfeFaJKHLycI=;
        b=NBPzhsiPcfqJhVOHw+IR0z0sS70xskuZr+orghmtttYw46jtEv93OKg6IGRXAjyCtW
         vZbmXlTlunEBlypnGwqzqYU9K45lMh5Xk6t9T0moX4cgjLmbsFVHlpcLKvZUVsCv9BSm
         qLNCFueJvLBIYyLHNo1e2FA1qzN18CBArJrS4iVAAlde000Q6T2z62ALv9InuUq9FO5w
         2YWbtf/eNcIYToFMGhixLcrKYAe51/oqtkonrn9v5W7nvEalHarqRVbrbMb+e4q4TFIL
         Ool5dQ/oj8yclr5AqeqWBUwa/PLlotiCk1Q4CDEG9PmQyt9TzcXLcozEiZg5l3Ch5pmI
         J41w==
X-Gm-Message-State: AOJu0YwXtCDqKy9bjE1pFf2Cw0o6gSIrJ9m1y1fkJdJu01W2BqJ0kjPB
	vyCIwcukCuIk/FpoQZFmov8Zy+61ky673bdbE/ed1ilrzCxfmnA/3zHiFd8tS3Q=
X-Google-Smtp-Source: AGHT+IE9abPTuZJImsBPPVwExiBHv3+UHoPZOEA+bzFtWuIKypEfuzgNNp3VESK6x/US7chA1lqTew==
X-Received: by 2002:a5d:58f2:0:b0:33d:29c1:c28c with SMTP id f18-20020a5d58f2000000b0033d29c1c28cmr1851510wrd.66.1709221778325;
        Thu, 29 Feb 2024 07:49:38 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id n13-20020a5d4c4d000000b0033cfa00e497sm2074044wrt.64.2024.02.29.07.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 07:49:38 -0800 (PST)
Message-ID: <49bcc88d-2562-40c9-81f6-64a48deb2066@freebox.fr>
Date: Thu, 29 Feb 2024 16:49:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
 ath10k <ath10k@lists.infradead.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
 <d8c90f33-d0ab-4d73-9580-2547446671a0@quicinc.com>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <d8c90f33-d0ab-4d73-9580-2547446671a0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/02/2024 15:59, Jeff Johnson wrote:

> On 2/28/2024 5:24 AM, Marc Gonzalez wrote:
>
>> The driver waits for this indicator before proceeding,
>> yet some WCNSS firmwares apparently do not send it.
>> On those devices, it seems safe to ignore the indicator,
>> and continue loading the firmware.
> 
> Can you list the product/hardware/firmware where this is observed?
> Would prefer to fix the firmware if the issue is there

Hello Jeff,

Do you think it is possible that the ath10k IP block in the msm8998/sdm835
has never actually sent the MSA_READY indication?

Perhaps the vendor driver does not wait for MSA_READY, and therefore this
issue has never caused a problem downstream?

In that case, we could enable the work-around for all msm8998 boards?

Regards


