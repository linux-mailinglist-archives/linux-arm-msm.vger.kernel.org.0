Return-Path: <linux-arm-msm+bounces-10153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E1984DC8D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 10:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0E631F258CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 09:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8086BB58;
	Thu,  8 Feb 2024 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xqTQOE83"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6D96BB45
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707383614; cv=none; b=iof5u069KYpQR6NxQFJlm/2qJuqahFNyP15rX8t7QeSAQbWPclxyrHMtlk5vdUh7HCUqOfxGZvM+EkLJxumDm6e+jbTm9TYiERhw7KnumR2VuaUVMcaUg2cUypMe6Q2BLlNSgDN9fLTd70GCje2rytbE58T6EHTAT+DigqLIkgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707383614; c=relaxed/simple;
	bh=1I1yKQ80oZdg/1cOG6tN/GRuKHREtAW08DYzVMOBkCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OOz+sGPlHzOnEWu6JHxnW+TMFEZjaS9tDNmkLuQB0/2FxE/ojcPCcrnwm0OvcsdgeMuDMFpW3CFQOArnuw7/aB3DXhxjO7katSKXmlwRSRmnpxzWj0oapuH4dj7FJpx8f/Hls0emM8CbXHvEmmK4e16ui+sM8JilO6j9pkENXh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xqTQOE83; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3392b12dd21so1004954f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 01:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707383611; x=1707988411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CnUe9V7duXEuvCT+1bn2cFd0u4tuG7u2zc21WRUzJJk=;
        b=xqTQOE83xfIM3zhifXQ2bBQXuZM5v2N6519czFoLsYGE/UvEJ0PlkAPbggKCmAo7EC
         3CxDURBRfaNPx5UW/UT7CIqzn9Kg1J+fXzjQc3lEbBpfHWtK5ddof5T+j7FxfrBOyg5D
         G+gQmlodWemtCNQ+4g4H5a2vmQw78S4ET14pnPHw2xAtUAGZ1rEpv2vbpodoiUokVDfD
         7+gJ/OJMYJ8wvUlPOcFpLrkF5dGdp7RGQFqAgEyfmdCFzXgfcIGwIW2vXsQJVz5zdpyM
         y5a2flzELws1l0wiKcFNqmX7sEo/EcKnUbtDVGxq6a7HGQjGJ9KOLd/VDXq7MGDeWh4u
         iXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707383611; x=1707988411;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CnUe9V7duXEuvCT+1bn2cFd0u4tuG7u2zc21WRUzJJk=;
        b=ShQhFfD5YRGY4c3PUgod7QjeYNGdhATnhG8+1WVnUZI45ahzVNEzPVWod9kAr/FWpa
         FSWUaamojsyJ+RxaCmvEONFFZ3aRolNSKKtQJgvK+tFdFDEVsJzuqZBvoUy3eAHBk7aJ
         Yh6qxW5EJlSm2rUp6QiVLUjvOuRkCtzNOigvi13g9BeiCufrFj8GKspKQRdC+xCyxwtH
         U3UDtts5b/y4AKj+tidnE3efXrl+1gXARVoLNasIgan7lNg10/dnMr7CXqAI347Yz7/T
         MWzlGiiqCfSJeX/eVqTd8f2g10qGHN79A08I510QoWXg3wsSWK2olSSmWeHuWsp5+GOo
         1bgA==
X-Forwarded-Encrypted: i=1; AJvYcCUH3CcuoQaO68F+tvRsfXkNpBUyg2FpyY7/AAXKuG+/EVf71o5ntcrzWuOFB+iY0RUw1/5Y8Q2KhTTR1BHQupmwpDn2YR43I5j1HcIBiQ==
X-Gm-Message-State: AOJu0Yw9J5bcX+IYEPG5w5tIAXBIZZEBLYkWXOjiOjBmk808+w5mlN4T
	wBxODiAf6rd8jBy+qQWm1Y7E6ITRcJDaSO1s8nnxN1Y7baWq5yfUcB6GR1pWZ0A=
X-Google-Smtp-Source: AGHT+IGhcZporjbNJC0FuJkYYJQqSPzXnwrl/iTsWobOD7HDOJjGtaH0syrvc4IdK87GHHpq+0ANvQ==
X-Received: by 2002:a05:6000:1a51:b0:33b:401f:bd59 with SMTP id t17-20020a0560001a5100b0033b401fbd59mr5148784wry.14.1707383611408;
        Thu, 08 Feb 2024 01:13:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxgEfq9R0qrJX7wQwCORRmrGYQ+NmOEmI2OeomoR6snSIxST88mpuC1mEfjkHkIR9KwNdD07JmzbqQLINtjYeIlsLY5yMZ0GjMFP0HOJkiwVs23B/pSqqY6NoDuMsUMe5Gm/zlFJ80TF+qTTM7vfce85jiBa7auPyeWfQTGj5q9jp2pkilt6qEPOXx0y+uGOCGW4moKea/Vvlw+9O+DQwA3l0Liu+CtBSNfYGxROWoIXl6/yYwgEe5Ke36mrF1C1cF23bn9YF2UR55Lkke9t/WBtm5HdcwpeScwd4+3414w7IFvy8DgnPsR1PNoPyvdlUJONSTA/9kek9J4GDCqJvUeZuzKy5N6pdP2qo4dMHgdhH/qKSCntGg/u7rt2GCsIEmi8B4fIcptEzEgHaiiIQ0Pm8f5r6qMP73hmhEQoM=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b0033b3c03053esm3174687wrx.78.2024.02.08.01.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 01:13:30 -0800 (PST)
Message-ID: <acf9dce0-10c3-4ad8-b96a-5f44b6428497@linaro.org>
Date: Thu, 8 Feb 2024 10:13:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8295p: Enable tertiary controller
 and its 4 USB ports
Content-Language: en-US
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 quic_ppratap@quicinc.com, quic_jackp@quicinc.com
References: <20240206114745.1388491-1-quic_kriskura@quicinc.com>
 <20240206114745.1388491-3-quic_kriskura@quicinc.com>
 <CAA8EJpoed-hu4hPXAcwQxmJAaNRwJ2y5q9qybWaPP8bdMnz_oA@mail.gmail.com>
 <0470a930-d629-4467-b619-58d3e76f59a7@quicinc.com>
 <CAA8EJppJAdHXoVs_2VqQf=_Wk_LoEcNMY2H-Xzqu8KzeaN8i0g@mail.gmail.com>
 <fd4f4cc8-3366-485b-b540-b05ef59dd5d4@quicinc.com>
 <CAA8EJppi+3cJqzkhcaDR_3w_Qhy_AzLBJsW7-dtugzE1egM3Kg@mail.gmail.com>
 <7500f1f8-1d97-4fa9-a7cd-7dea0ad52e00@quicinc.com>
 <CAA8EJpoe-gaSgD_HruYSUAPgfBNCw9-G9wnEnvpkiCtmrqFQ7A@mail.gmail.com>
 <62bba89d-97b0-4129-8abe-6025790d9d13@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <62bba89d-97b0-4129-8abe-6025790d9d13@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/02/2024 10:07, Krishna Kurapati PSSNV wrote:
>>>>
>>>>> One query. If we model it as a regulator, do we need to add it as a
>>>>> supply and call regulator_enable in dwc3_qcom probe again ?
>>>>
>>>> Not in probe(), but yes. It needs to be enabled when the VBUS has to
>>>> be powered up, when the device is initialised or switched to the host
>>>> mode, and disabled when the VBUS has to be powered down, if the device
>>>> is being switched to the device mode.
>>>>
>>>
>>> Actually since we never go to device mode, can't we just stick to this
>>> pinctrl approach and skip turning on regulator in driver ?
>>
>> Scroll several emails back. DT should describe the hardware. Hardware
>> has VBUS regulators.
>>
> 
> Hi Dmitry,
> 
> I dug up the schematic and I see that the gpio's we are using in this 
> patch are actually "Enable Pins" to an external chip that provides vbus 
> to the peripherals connected. So from the perspective of SoC, it is a 
> GPIO and not to be represented as a regulator I believe.

According to such logic nothing is a regulator... sorry, you just
described regulator.

Best regards,
Krzysztof


