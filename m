Return-Path: <linux-arm-msm+bounces-13413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80753872F32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 08:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E650EB21105
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 07:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46BB5C05F;
	Wed,  6 Mar 2024 07:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cMxHA9Wa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138BE5BAF7
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 07:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709708695; cv=none; b=l6XoJSqCPsCaBb1wvr+/yViSRw8A1IoeG3vTex09jdpAjjtQA05hQlQrSVarzTWytzStuNXx7Ghs4T024HFYJiBWWkX5iXyYusS5X2+G79P21L+do1phSmdnXD3GnUL2ygzXzzfiGppXSxIeRw4ULRldjgYWWLyFRJrzz6K/6Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709708695; c=relaxed/simple;
	bh=+7vyTXvIGHcBBycepenmXA251aSAcuWIGuF9vzLmAtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=umdDw3SJi7EFN3VkZ8CccgnT/ou6knf/I+5aw/eUhmRS8SuANU7uDcLZDHAw7Hij3gr1jfi03n0kgg2b/FEd/oeViSuk205gTpj03FSQ61+5gfusz1YoSCmo2YBh1Q2Y8L54gxYmUOnH0r/WMUiOw6VoxcdM2MMDddWR7T5jBbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cMxHA9Wa; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a44cdb2d3a6so557926566b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Mar 2024 23:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709708692; x=1710313492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f6rPzTQb/zYSyfTD4qmFp61CQrHKbdmvC0n6DjYmcOQ=;
        b=cMxHA9WaFv4Ab/KM8XWZVE2DGDys9FnungTDV3VQkAFg03gHtbttv3VY2fmq585NMP
         FOHO44yaz1C7Qag0VgJxdPjnKwjrPgFAxyFbWR8rNYr3JuCfzTP+eXgo3089SY2WmP9q
         fZG7Ezjw2FjKSnEEltPta8SQROxxj59nBE/Ugz5aikZX6zJrq4fAdSiTzWvlUxZZ1RpY
         oA5MIPUiqvI0q92NeqSxb5fYt6jglKcVmGpUspMQSdfkAr2/+OFPaOC2zrCr5VM8mpWt
         PNOptcQLiAeKBNb7Nr8MWVEJtkq1TAXWtURfdGBjuA3LpZc/c6OeLokRkAeluaKOQBSM
         DVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709708692; x=1710313492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6rPzTQb/zYSyfTD4qmFp61CQrHKbdmvC0n6DjYmcOQ=;
        b=SWI8b3Xb24/RNY/p+BEIOj9JFfn2RLFjUyd0xLp2WhGum0GWpthdjVR1Zkvve5Ylij
         KdRasnd8MVhBG++g4KZnehNCTPx21+ULtUoL+JJlneNLXjXwhFS2h0GhL+NtZVIDxp7e
         r3RzDnBDQQ5XbBmw70xUBLN7AkrSs2Hto+Fubai+lttfah+Gl1VrVApYuSHcHt/WBg3j
         J1na7iAM92AUknHjIAPgWNi4Co/L9fjtTQ5LjgjTohIWdCO2gO6Zj5SrIlStwOyPB4HI
         kh8kOgXc4dvX/eNeDugcwUUdUi/sLtXLh/bzfJE7dbaK5t2ze6OOUJzz2QajZ0ADi1Md
         2g0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwQWRuKgL/TGpKG5mZZx9BObUWpu/saYBtkqG3ecUZlc5KRWF1MxarSMeOiy/iO4tdhfVBwawvWsi6rLvYEUcuARKt7Qb8e+Hu/wMeqw==
X-Gm-Message-State: AOJu0YzBFOSv1iubofnHdflNJwst0/i3Jc1SFgm1/CDLAcwiRnUcJYyi
	ZDn7owz059YzFXSTrhReilr9Q+2oajiTYXKND6nsXwb0icgcGntSkAW6uKlD7es=
X-Google-Smtp-Source: AGHT+IGCXqeCFGSn+udBEqZtQ2TfpnhXI+hFzNCKDlhN/HxgXKglHMZD0L8XY7qi1m5JeAP9qB/1Vw==
X-Received: by 2002:a17:906:394c:b0:a44:e3d:68a8 with SMTP id g12-20020a170906394c00b00a440e3d68a8mr10243754eje.45.1709708692418;
        Tue, 05 Mar 2024 23:04:52 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id g7-20020a17090670c700b00a45ad52d510sm1128717ejk.139.2024.03.05.23.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 23:04:51 -0800 (PST)
Message-ID: <f2b9a9f1-0ede-4c01-9bef-ee497b3191a6@linaro.org>
Date: Wed, 6 Mar 2024 08:04:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/3] Enable firmware-managed USB resources on Qcom targets
Content-Language: en-US
To: Sriram Dash <quic_sriramd@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, vkoul@kernel.org, kishon@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 gregkh@linuxfoundation.org, quic_wcheng@quicinc.com,
 Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_psodagud@quicinc.com,
 quic_nkela@quicinc.com, manivannan.sadhasivam@linaro.org,
 ulf.hansson@linaro.org, sudeep.holla@arm.com, quic_shazhuss@quicinc.com
References: <1709657858-8563-1-git-send-email-quic_sriramd@quicinc.com>
 <4d2501a7-d56d-4736-95d7-41556166859b@linaro.org>
 <1a47c20a-abda-4493-a8f0-ff7b4e144d9c@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1a47c20a-abda-4493-a8f0-ff7b4e144d9c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2024 19:04, Sriram Dash wrote:
> On 3/5/2024 10:42 PM, Krzysztof Kozlowski wrote:
>> On 05/03/2024 17:57, Sriram Dash wrote:
>>> Some target systems allow multiple resources to be managed by firmware.
>>
>> Which? Why this is so vague...
>>
> 
> SA8775 will be using it as pilot. Will include the target name.
> 
>>> On these targets, tasks related to clocks, regulators, resets, and
>>> interconnects can be delegated to the firmware, while the remaining
>>> responsibilities are handled by Linux.
>>>
>>> To support the management of partial resources in Linux and leave the rest
>>> to firmware, multiple power domains are introduced. Each power domain can
>>> manage one or more resources, depending on the specific use case.
>>>
>>> These power domains handle SCMI calls to the firmware, enabling the
>>> activation and deactivation of firmware-managed resources.
>>>
>>> The driver is responsible for managing multiple power domains and
>>> linking them to consumers as needed. Incase there is only single
>>> power domain, it is considered to be a standard GDSC hooked on to
>>> the qcom dt node which is read and assigned to device structure
>>> (by genpd framework) before the driver probe even begins.
>>
>> This will break the ABI. Sorry, come with an ABI stable solution.
>>
> 
> The plan is to include multiple power-domains and fw-managed
> property or similar in the device tree and fw-managed property
> will be deciding if we need some resource management offloaded
> to firmware. So, OS is always in control here. The decision
> making will be done in the drivers. Also, there will be no
> separate vendor hooks.

This does not answer ABI breakage. Also, I don't have a clue what are
"vendor hooks".

Best regards,
Krzysztof


