Return-Path: <linux-arm-msm+bounces-33366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F76F992CBB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 505701C2236A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A461D3581;
	Mon,  7 Oct 2024 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNXpNb8Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B9814AD17;
	Mon,  7 Oct 2024 13:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728306686; cv=none; b=AfMNiC74mO1OHoNhKCjKu17nsBJYVaTL/XQDH/Z+CAJK2ImqLC3w23gjNLbcgrjzPbACKsdxBtYSMU+BZvqgJawr719VXNaEl05a69WJJQNOuWL78UgUK2J1gnQTMLqrlJLvf29aLvTkYBWKWQPDkhY2GqCngB3zKo5cFCJegFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728306686; c=relaxed/simple;
	bh=MsnmCW7RLtxDwmosIEAf2uoM9ZaBmL27ptFT6g/OOy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iDEqdZ45NSVww9POklLwjjwfsamdEgBeoD/2fja/CVqGUUDRqC6rX0YQgGICmHcBpUnNfpWvY9R93tbmkw1xecOdHwQeejY6fP3GgiDGRgJRm7VS5xGW6mnsWTPXw1p+cn56KYIyrl8RVyLHdYtlKPoxWPw5a20I04C12XNUBfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNXpNb8Q; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a995f56ea2dso74066666b.1;
        Mon, 07 Oct 2024 06:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728306683; x=1728911483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RRp79CypPV/wkB7YJdgyXOxNt2TEZcBYTwDi+zMiscY=;
        b=fNXpNb8Q0aZLcVdpMQHTpTapdN0e3C6CEgTSPVAqGzwTD6XFR8NmLvkfMDheIY2QqV
         Knf+EGRkKz35giTtiVNOpEXLfu3Xaor5JN6dtnltKC4ISbFTLw9791jqm3993flFfAEq
         sKhzGskiBmxNTLUp+9Sa9flmlVbJcVtV2f/9EcvvFKNyI4RutztevNZ8EiXa6fTnZByy
         8FA2d76vyEOxFBQy/iN0R28LgNOHNTdLx8ipk4lIhKBieStpwYyONZH9ty39QwORe6CP
         ryMuVQyJhl1dPUjZG+4L3lh7CO8BdFKEFEe6gjYnNvYv+H89svA5CRMzapP2KVRnghfJ
         acqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728306683; x=1728911483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RRp79CypPV/wkB7YJdgyXOxNt2TEZcBYTwDi+zMiscY=;
        b=PbOurvJl5dhJs/TOgyCEp6BVIrMPh2ILUWKtYlElrrjAKtTpKkihlQKh0WqF3wUkjd
         AWNIcVc8R4Y9RN95T4GCCsHePFSA2jX4DQX90ThN9nIt7X988D40Od6QVZ9ucfaqJQBb
         2Ugm0xSr3E4HDTZRFGZu7pU9B5QJfzw8NWY8VFfIbq6efI1TjSdUIs5e4lbv35uTOIo9
         lFTqBzhCLGIQxrFVcVUFaozH7hVNxFBHZ6Z7/QmaRjO9XzlzuEM3VooaWviE4WMLClKQ
         +BqfaCp6nU58oxkHFiwUaHJ3AwtLPKJgLLYw+8Gu8yskvsNxVOuMPSwE23VjWCnTVfgi
         GdFg==
X-Forwarded-Encrypted: i=1; AJvYcCVZMOZUAhwprVKicyJBPtCHcfK9/BvtiPp6/KhW+fFCHkTBSjOWwHt0UKMV4ixFNlW+HWATdS+TQwXBlXIJ@vger.kernel.org, AJvYcCX2Daeke7w82UtwYFD9Wg9d/B3hw0BG2nA/Sk66ZcGah+ROe2xui3euHcQKU43IxxeLpZck+/9EPvp1@vger.kernel.org, AJvYcCXSdFwi4chVHLCPvV75HyOPp2tLLlunA13viGm6CCfBm/r9k4xeMVmW5WInueyDM8PWSfqZTHe7h3SYNAE=@vger.kernel.org, AJvYcCXoVRMGFISINNDgnp+so4PJOacrxpXIlBGZupL2zt2R4jcYLmc2vqtNgoTUJCS21nkju2kQFNA3MilYx5QH3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1kjGl37wo/7ih4VGuN9wznKBvQUVwZbgoGObsThomDyy6P4/R
	flKTg00bsyySsDXvRlBEvGIjalh8UFKjz8QVi1ADIAKtQ7lEUaKd7IYg4w==
X-Google-Smtp-Source: AGHT+IE6jHfyvqc8xxwiHQE0wpu2UkgeJk6Dz/YZ3+UdRxVfOV6yYwJcglQ7PPfi62B0EC0Oe1d4hA==
X-Received: by 2002:a17:907:36c4:b0:a8d:1303:2283 with SMTP id a640c23a62f3a-a991bd7a123mr1269990766b.30.1728306682866;
        Mon, 07 Oct 2024 06:11:22 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9937dbb84csm343666766b.99.2024.10.07.06.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 06:11:22 -0700 (PDT)
Message-ID: <650aa379-5e1a-4533-a314-246c8a1e2c9a@gmail.com>
Date: Mon, 7 Oct 2024 15:11:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add thermistor
 for UFS/RAM
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241002-fp5-ufs-therm-v1-1-1d2d8c1f08b5@fairphone.com>
 <fshhw6lknar4z36rc2sjjcgkiixpp7hak7gq3j373mjvbokax3@7s7kmzlmtjal>
 <D4PE64JTYDCL.3MC81CYK49TI0@fairphone.com>
 <CAA8EJpoYpiuVkD3ohoVhd9VXvCxpHPPfXfY0YqrQhABUc3WPdw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <CAA8EJpoYpiuVkD3ohoVhd9VXvCxpHPPfXfY0YqrQhABUc3WPdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7.10.2024 2:46 PM, Dmitry Baryshkov wrote:
> On Mon, 7 Oct 2024 at 09:22, Luca Weiss <luca.weiss@fairphone.com> wrote:
>>
>> On Sun Oct 6, 2024 at 10:26 PM CEST, Dmitry Baryshkov wrote:
>>> On Wed, Oct 02, 2024 at 03:01:08PM GMT, Luca Weiss wrote:
>>>> Configure the ADC and thermal zone for the thermistor next to the
>>>> UFS+RAM chip which is connected to GPIO_12 of PM7250B. It is used to
>>>> measure the temperature of that area of the PCB.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 40 ++++++++++++++++++++++
>>>>  1 file changed, 40 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>> index 8ab30c01712e0b7c0cc1b403e0fe01650315b9e2..fdc62f1b1c5a398abaa71818fdf2858fdc445d28 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>> @@ -207,6 +207,20 @@ active-config0 {
>>>>                     };
>>>>             };
>>>>
>>>> +           mem-thermal {
>>>> +                   polling-delay-passive = <0>;

This is now redundant - see Commit 488164006a28 ("thermal/of: Assume
polling-delay(-passive) 0 when absent")

with it removed

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad



