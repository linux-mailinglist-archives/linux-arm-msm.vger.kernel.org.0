Return-Path: <linux-arm-msm+bounces-18079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A19038ABF7A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Apr 2024 16:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6821280F8F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Apr 2024 14:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B522E175B7;
	Sun, 21 Apr 2024 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cq7ZSLcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1127E1757A
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Apr 2024 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713708212; cv=none; b=qFRGRHzddAwqI8q1FSRcNnnaw+JFPgv/dUhPU0YDsU9+9MsY7DUGB/UJx49omBIIO1MY9mzKQfIXPAmuDYo4S0Kbki0vwtEzIdyJoLQkJNdlhMHn40RoUo8yK/LcLOJiFKeqL+W0zzVzA8OYEU6AvKuoNuiEpM5J+cJzml6IWi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713708212; c=relaxed/simple;
	bh=t4LTkonD4i06Ex7cZRKGZh5MSInx3YygrGIzRDI+Mh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhTgngHzli4uxT3otnnsZlWSTRISa56CZfyyh5iPPKH7Wwr/OcPDLGsA0LmbPqvPypX2aC2/crtwwNqkXwJRAhUrxRIKfl0GiC3Y99fuqyxZYGUn8e7XCLp5vptHDAVokRa/zsP0uwdSO9I453vvNWhPhQQ1Ht5t/1mi1ZV6sNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cq7ZSLcG; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-571d8daff86so1909004a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Apr 2024 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713708209; x=1714313009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DTW/CJQ4s88DVa55ELjYpLvZW6dhOyn4d4BvCYkVK9Y=;
        b=cq7ZSLcG23SrXZmSripEbgotIXnb14vMeFk8J3ogudpYrpX8sMImB3/3kXSdNeh9v4
         yCyIlP3wwf/1qVUFN3DttFtL2e2x/l40sWhO43nItAPyOgZIkWJxxupwBn6pffJ0wLbG
         7OIJozie1JS6DSu0gg9L12UNivMsf/0QC6Hi2jGA5bRLjzXo3jiKjjr3iu6IKxYAk8cp
         PfnK30jYpRtd9FEsjRHkepDvu0bYVQHvv6hnglM/fyaYU914ijcgpKOl8ZqrVtoOCoPc
         i0QkXVIfSRhZNN9Tv7tmyFLSTk4rxVXVNtcmsdF1qYqN24kwsdVJfKYig3HweRRfsmGJ
         U/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713708209; x=1714313009;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTW/CJQ4s88DVa55ELjYpLvZW6dhOyn4d4BvCYkVK9Y=;
        b=Oz/qh9FV4fFRAd/KB1YRfEIGuE1uzj9+57TtFn1zOup7pdWQiXlrnO8TRYTButDXwz
         7sytol3/XV2eEGTWg00eLpe9LDlBhQpxWAtov2JVjwg9OxnJba4bcqRvpMc88Wr4Z+n0
         gi2sIirVClfK/vGXK4U6HClbfbCSNCx/3wYRozpIAyhinXQMmqOo5bzKlr1+hMxX8GwE
         KdpSqkMkjC3gGBE1ZMGAFlRPud9LUWEvTwhrH25dX3XKmv3igTwRSy+ajevnmH/9JskK
         jsFVDTQSQxmqmvOde2x4qmw4sEzVZOSludgHapAggHIvY+80yv0fyxhFTvXPtnMjLVgA
         VCOA==
X-Forwarded-Encrypted: i=1; AJvYcCUfNrq4UoH/M59mqdx33ELfCWFEFRTuZFP4O3J4cvBVQxapaMHfB+Yt3od4DiWsXMQ4bewVWQ0tAcL/1h2gTEr3e1uadQroK3hFhJYd6g==
X-Gm-Message-State: AOJu0YwIep/jdZ/vlYQy19xbT7vSOY/ex8cewIoAwpkSdl1q8424fU0F
	bojI2VZO13mgpM5HksSFx/ejnE0sAY6opPOVw2GprPNbfL4BqNJGzrY6vfkXIhY=
X-Google-Smtp-Source: AGHT+IEbBYYmKJn5bzeTvWfcW2l/wHJTBjpKqiCdGf182vrNU/MwXM6wS5bCcbDD74qJFnFVN5U2dw==
X-Received: by 2002:aa7:c702:0:b0:571:fc5d:dbab with SMTP id i2-20020aa7c702000000b00571fc5ddbabmr1780010edq.7.1713708209411;
        Sun, 21 Apr 2024 07:03:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id fi5-20020a056402550500b0056e598155fasm4360037edb.64.2024.04.21.07.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 07:03:28 -0700 (PDT)
Message-ID: <4e03d84e-490f-4054-a175-94e769770b37@linaro.org>
Date: Sun, 21 Apr 2024 16:03:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 5/9] dt-bindings: usb: qcom,dwc3: Add bindings for
 SC8280 Multiport
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 quic_ppratap@quicinc.com, quic_jackp@quicinc.com,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, Johan Hovold <johan@kernel.org>,
 Felipe Balbi <balbi@kernel.org>
References: <20240420044901.884098-1-quic_kriskura@quicinc.com>
 <20240420044901.884098-6-quic_kriskura@quicinc.com>
 <3ca24a3d-e7e0-4f68-9a6f-ebaf83079ebe@linaro.org>
 <7034e026-5c50-4c65-ba78-e9c73f4a276a@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <7034e026-5c50-4c65-ba78-e9c73f4a276a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/04/2024 15:53, Krishna Kurapati PSSNV wrote:
> 
> 
> On 4/20/2024 5:01 PM, Krzysztof Kozlowski wrote:
>> On 20/04/2024 06:48, Krishna Kurapati wrote:
>>> Add the compatible string for SC8280 Multiport USB controller from
>>> Qualcomm.
>>>
>>> There are 4 power event interrupts supported by this controller
>>> (one for each port of multiport controller). Add all the 4 as
>>> non-optional interrupts for SC8280XP-MP
>>>
>>> Also each port of multiport has one DP and one DM IRQ. Add all DP/DM
>>> IRQs related to 4 ports of SC8280XP Teritiary controller.
>>>
>>> Also added SuperSpeed PHY interrupt for both Superspeed ports.
>>>
>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>
>> v21 and suddenly you drop tags requiring everyone to re-review this. I
>> do not think this process is working. I will not re-review this.
>>
>> This is a friendly reminder during the review process.
>>
>> It looks like you received a tag and forgot to add it.
>>
>> If you do not know the process, here is a short explanation:
>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>> versions, under or above your Signed-off-by tag. Tag is "received", when
>> provided in a message replied to you on the mailing list. Tools like b4
>> can help here. However, there's no need to repost patches *only* to add
>> the tags. The upstream maintainer will do that for tags received on the
>> version they apply.
>>
>> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
>>
>> If a tag was not added on purpose, please state why and what changed.
>>
>>
> 
> Hi Krzysztof,
> 
>   There was a commit text change to fix minor nits:
>   -> One minor spell check: /s/oen/one
>   -> minor nits like: /s/ss/SuperSpeed
> 
>   So removed the tags and requested for a review.
>   "Updated commit text in patches 2/5/6."


Did you read the doc I linked? I am pretty sure I linked it many times
before as well...



Best regards,
Krzysztof


