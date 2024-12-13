Return-Path: <linux-arm-msm+bounces-42039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB729F0F65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5DFE1880A67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC5D1E1023;
	Fri, 13 Dec 2024 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDNZg8tX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448F21AAC9
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734100962; cv=none; b=dZ0t3l2Blw9JYzxlexff1YIPevBHIOIOy1+NQrkdNCzCbRmMGMwXzrqJ1lS9i81ncvhVdX40tqrnwcSzVh8w1PvuTL9nGCcFxHA4h7mvuKppE2IgIZa5mRDk1NVoAjI+0BI7r5ATeOB2uRxPqENC8rpZnAihXNaLEqzsFSjlZOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734100962; c=relaxed/simple;
	bh=l2LH68amSqud0R4TfnNltZfaI1rQ31gIfO2DJAYjOs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cV+kp5zA2nmJzKX92ivfjc7aSz03gvQrVAuh1klXUkDsq3917PBihq8q6plP7iB6Uuy1mMdKShj+SL2n3CPSqbkpiRWPX6dQuQZaOPJvszdctXy3oyoMp3JnF/GBJtkmIj/NWR8WUHOt2b0XK9DCKfqwBhR5mwkNXsQ6QK+nLPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDNZg8tX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso2324425e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734100960; x=1734705760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YpbqO3rSBlScC82cYebFwMIMfCCA7aDkURfnbWD+6Wc=;
        b=oDNZg8tXRB/3gnR62I6SkPw49xpbehODeRn1J0KJN2csJvNZ091ZIUpRjd7AE+9t/c
         03KZ/0gC0EcMYjMS538yA9Yt6tiCYSxvjjSFangV8Ka96clw3UZw66YuKDedo239QHi6
         UjFm4WzN7EjYPj27cjcD0GCXpziBiRa6G8hnBDX/jgdS+cUzF+s8ckyD0E/5I/owb+ju
         6g4SiMyA0dpTylcJQZYUIG78Ppzed6w912d0hjWnfneLlBG0OuPd2XdLkcIKQt3QFb5f
         DIbSp7iEYlTQN3n+u1bcnkxZMbfsIUF8pIToIVcV5D/MHO0LhiGxApejZwvmyXabEKK1
         zTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734100960; x=1734705760;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpbqO3rSBlScC82cYebFwMIMfCCA7aDkURfnbWD+6Wc=;
        b=bsldsBkEuRErWZEUTHjmpkd+grt3HGQinTfHlX3k/WHIWUEby/1spfy9JD2xlBWIZl
         bGyBPma704vDY72OrTBhpi/b8pzLmBMHs1AfHMd0X/4x3zGtwcfrF1ASID+Ht5NZn2xs
         /44vP9wOr6PpRe7o/OTqoatNVKwz2HmxY1YztYwnuS+R5cZj5KxEHEQxNsNvfasGnVIZ
         2ko+3ZNvi0JsYjKAkvPqn7PNZ84Xm7cW+pUss/K613wghcGp+9AwqWfo41rFrHRcTy6P
         1gi7ahuD92dz5fzL00OeVwjaChcuSfMmhfd00YEeVZVg+dVArBQILAwnFlIY5BJsZq77
         fG+w==
X-Gm-Message-State: AOJu0Yy9q9MJBCgbCNjTkv6r/e+4wh5nUFhWkbeEGyNKdmFNxtXM6Abn
	o3kGfXH/7/eDssU0Njlph/+M6MnkWb04juzY/YwcZU8baW8KBzRb3KuqLRHUriPHyIjMzcmYlXD
	B
X-Gm-Gg: ASbGncunCVExj0m/8Xsk/z4GSgfaV0WbCnsyhmdg4TKKrIgegQfBR7tFxXGrxsaD0CP
	+0898M7wxLnMCKmL0TL1ZF7eJsg6Fa+BVgIvzIDCqgil7UOYiO0GGcnTw2Ud8pJVL1y1OTM9+6G
	xJ+IRbjDoq5p4TYka4oYbd0zPISeMSlrU2IiVcI/6ODsbH1wpa5nEwRP48UJg7fcOkQ0ofCT6gL
	M8bzSdVHRicrrCHPEFWFNH9KVgG5Jlcr2rxMzLfAjva5/nCqxYxBo6N7gsXNj1oFjslRiSvDRcV
X-Google-Smtp-Source: AGHT+IFUjnwP+SchL724miK3AzPnwhm0RG8Aqz0zb8joysy4v/Fpgvh0j5gphBji9ItyBNIIKtCaZQ==
X-Received: by 2002:a05:600c:510c:b0:42c:aeee:e604 with SMTP id 5b1f17b1804b1-4362aab9cbamr9164135e9.8.1734100959560;
        Fri, 13 Dec 2024 06:42:39 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436256b7d46sm50892885e9.35.2024.12.13.06.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 06:42:39 -0800 (PST)
Message-ID: <3b85aa73-bf01-4930-b2a3-3f91f8891cf8@linaro.org>
Date: Fri, 13 Dec 2024 15:42:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/19] arm64: dts: qcom: sm6350: Fix MPSS memory length
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa
 <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
 <20241209-dts-qcom-cdsp-mpss-base-address-v2-16-d85a3bd5cced@linaro.org>
 <5cbcb8a5-f39b-4416-8317-15d56f932915@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5cbcb8a5-f39b-4416-8317-15d56f932915@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/2024 19:55, Konrad Dybcio wrote:
> On 9.12.2024 12:02 PM, Krzysztof Kozlowski wrote:
>> The address space in MPSS/Modem PAS (Peripheral Authentication Service)
>> remoteproc node should point to the QDSP PUB address space
>> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
>> copied from older DTS, but it grew since then.
>>
>> This should have no functional impact on Linux users, because PAS loader
>> does not use this address space at all.
>>
>> Cc: stable@vger.kernel.org
>> Tested-by: Luca Weiss <luca.weiss@fairphone.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks. I got the access to sm6115 and sdx75, so I will send v3 with 4
new patches for them.

Best regards,
Krzysztof

