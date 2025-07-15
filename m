Return-Path: <linux-arm-msm+bounces-64926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 375C6B051DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 619363B084F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 06:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276B2265623;
	Tue, 15 Jul 2025 06:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hiUAmNQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7CD24886A
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 06:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752561321; cv=none; b=qGoHok7P6YvSh6oLtjrt+mno/5/hpKT22cSG4Y/C49b2rpU9rdixXXanuEnGyvlWq9FvrWZBp0RP9q1zD01I0bgRznKPRFZsGtjw18fWUHMEt5i7VgPJf/q/WILt4Y4o6uoXCPPyj20Yc3yMt4EGPyVs3D8pm1CV14KaKKpRzW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752561321; c=relaxed/simple;
	bh=p3LPkjq+uZRwh2andFI5/6qsRT2nuhoh6ljdJGtYBr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiJFK64JmlXJ8XVOlUx2ZVYAlNfCKLWHAwnJnmbI8n7Hri34avc189ofp2VfesKi0e4BEyEm4+TsqVtjVMjaiNONHeiECd15sAiyHusyhZAWp0qItfDw/i6UaBh/NPwv+DoB19jtgo2NJka7ZkHHkwpGr8k23rzvY3MiFtZ2owU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hiUAmNQJ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32f474ded39so4664791fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752561317; x=1753166117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWk+3HwoE658WoVjEcyuNKZKmpUhfuUyOmAf2RcohLk=;
        b=hiUAmNQJCN0jsnmgo54T2V+NhPaaXi8OmgkDeQ7a4XDPVeOz3Ub6H7Y5yFk5R9on1n
         bMjrGigb9PBQFesc26UZZkh3tYWIAW1Zi9/NfKNr2icpwFRnCP1E6voKVwCzW4HeLzfD
         +abHHoTyZbXz81G1WIRxktNTArxCJJQLmI3SVRS5zHMICk8rJT4xxjRvo//fTaD3A2QO
         IbDaH2/w9J13owz6pKWGg7Zreg6OZlkFwk2itPfNxkGh7F6+E0rbJINDU+wc7edY5Tj5
         lS8YI5gaDoE7QEJPcpKt4fguwwtrI3m2jIogC0IQmE5+Ph//4wdlftQLsRmdNBZoyn1x
         kpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752561317; x=1753166117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWk+3HwoE658WoVjEcyuNKZKmpUhfuUyOmAf2RcohLk=;
        b=FGr6Pd1u+MyBjAiWPAAy3qjDqhLglusneGb2TK+RWVE6aR/FnBFbworsFSLjF0uB74
         4c1wJTiMqOhcgkFyQMO1f4AnuAqpC1gSGCeq0VsnLpwyk7zVN1gb3ftZhb7smPhfiGA4
         Y7Jqth8M8kq80wNnlRakC6I/tWglv9kNA8I6U6mbyoMhmrrWfD7/V5h2a6kh1cnDO2fz
         E9DHJUNhxP/f3BwiQbe9hIB4cMqnEHPWTSijNrggUsO3j3s3+xKK+nq97HAQzvA3mRP0
         7clDIu/X5xJ9SM8e/RhFIBR6lTWwXAoe62nTn4/d40IsXYB8Uck4nkYcFcH/fumWLqdy
         +Akw==
X-Forwarded-Encrypted: i=1; AJvYcCXW9mqU/uVJqoIdql4ReyskJ/AllL1xiH1w/h/Lnmtg6FA3U3Mmmyzo608n+lFdmgt5Xe+5pH+MLHlxuxM8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi+CQgN7MEgzopZJy3iX1dTi+o1/mxCerUa6dNcdnuP5JpX0Vp
	YG1kySin6z/lNw8FZd8RD1RToHSQGhxQ9P/W6Zwh+Ki5WoCqSVQP5W4StFius7/+TRI=
X-Gm-Gg: ASbGncs5Mu8iVbeok7ngieASVRMGJ8gpsZDZBZleLiqaYtSccRtYI9YMCyP7jIaoYTi
	wOR7+zKuZ5Y0Ohq7VKxjtcBHTdjFhe/Lohq8x31SKumejT+iNP7N2c/N25IayENVL5jgLB3qeyo
	zd7As7k/dJb79cIeUwQ4KND2/ctTy4qZhGwhQCaj5Rw/237fAENQxOhFZNtwj5ulO/+FOEOD7je
	wnVmval9AeLDJoPpKQ6x3aAu4NoeUnmEy1TRbFoKVj0lHyr/u01flhsJOEi3EZN+DOqBe+YK2Hf
	Hm/GXmegzE+9I8YB7RV6Q0Q7I9EVzPhYaOWmqRJicDojyhnyL6rMUwpl6unfLPP8v1gbms8Kmg3
	WcVrDLJftPGySpK9qbWJJWTyyCbCuVZen/2yYDoOkqSyRtOfJU3AN5jf44TZdkDhe7M1TriCroe
	id
X-Google-Smtp-Source: AGHT+IG21/AaIAze5CnrFzbotIk5+WCyNnr4M3ziM12QE2WUONELVSCj8ppEhywifIeaLqF5Jft+XA==
X-Received: by 2002:a05:6512:3b24:b0:558:f60d:d4a1 with SMTP id 2adb3069b0e04-55a1fd758c0mr46377e87.5.1752561316877;
        Mon, 14 Jul 2025 23:35:16 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b736d5sm2167082e87.213.2025.07.14.23.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 23:35:16 -0700 (PDT)
Message-ID: <53a19b1d-5665-4937-a07c-5dd1fcde06c5@linaro.org>
Date: Tue, 15 Jul 2025 09:35:14 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
 <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
 <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/25 03:13, Bryan O'Donoghue wrote:
> On 14/07/2025 16:30, Vladimir Zapolskiy wrote:
>>>
>>> I think that is genuinely something we should handle in camss-csid.c
>>> maybe with some meta-data inside of the ports/endpoints..
>>>
>>
>> This is a CSIPHY property, a CSIPHY hardware configuration and a wiring
>> of sensors to a CSIPHY. Where is the relation to CSID here? There is no.
> 
> All the PHY really needs to know is the # of lanes in aggregate, which
> physical lanes to map to which logical lanes and the pixel clock.
> 
> We should add additional support to the Kernel's D-PHY API parameters
> mechanism to support that physical-to-logical mapping but, that's not
> required for this series or for any currently know upstream user of CAMSS.
> 
>> Please share at least a device tree node description, which supports
>> a connection of two sensors to a single CSIPHY, like it shall be done
>> expectedly.
> &camss {
>       port@0 {
>           csiphy0_lanes01_ep: endpoint0 {
>               data-lanes = <0 1>;
>               remote-endpoint = <&sensor0_ep>;
>           };
> 
>           csiphy0_lanes23_ep: endpoint0 {
>               data-lanes = <2 3>;
>               remote-endpoint = <&sensor1_ep>;
>           };
>        };
> };

Don't you understand that this is broken?.. That's no good.

Please listen and reread the messages given to you above, your proposed
"solution" does not support by design a valid hardware setup of two
sensors connected to the same CSIPHY.

I would propose to stop force pushing an uncorrectable dt scheme, it
makes no sense.

-- 
Best wishes,
Vladimir

