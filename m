Return-Path: <linux-arm-msm+bounces-58025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA7AB7B9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 04:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BD1A4A466A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 02:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20B5242D61;
	Thu, 15 May 2025 02:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHiIDxTG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D724B1E44;
	Thu, 15 May 2025 02:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747276341; cv=none; b=jq59akMDkJdgNPrGMYqBnwScCzRxO8XiZabhkAAy1AtiaYtmbMVG+XAn7gJsW9He9X+Uw5sDBg/XgmLua7E+KaInD5Fnds9uCM9ugMhR/+UJlTrUzWtvVesu1iIFgDAwWEGZjhTTW67URXjSLw1BtwugNllDk0D3o/sZR07MWBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747276341; c=relaxed/simple;
	bh=7ceVayl/7ltGiynOCrfdi3wF28FmTW389XU3hoI4mG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thIRIxr0WqJcc7zheJZhSoW7tnfyXbstmVvXH8yzAqRNGpeC5SI8UIWEaipfeLhv4JOKbRev1GxCKPxcDqerYbaPZ08xuTsyrFiI1N1IBXReu7F2qTGV3AxSYAywdkH0SokqURqDhThmyYnNZ6OaABJAea3+QM06bN3eQE089XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHiIDxTG; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6060200710bso325924eaf.3;
        Wed, 14 May 2025 19:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747276339; x=1747881139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a1WEc2CAkZrTUrnqUm71lSCgh9IfHNNmUGEOhV4UQH8=;
        b=cHiIDxTGIPkHYDLg2CJru+aU6lAXNBKYbukEwsEyxwn1sx35Acxz/yrOqHTpU73Ora
         GId6WNdqg5kZ1GHcKvt0wxWDHyRd4UlOp7XaCBt/dpJ9+BePhsehlcH/ptiD1kvgooO7
         bJZ40U/TzeSW5E8MYKZAMKS6p97dJBf9o2hCefRm2CawtZemTqblIsQTLsqqrB72IZMq
         lep0asI8ly8c+Jj3bwkRqw/bsZ9mn7lH+bkLoB5rOCEiVlvywT6fJByJK9LyWNkWfdAC
         OzqBUVBehUK69dThY+/xq6uws6lWvuog4PxI1ZoUVCMO11kXa+C7dMfZyKjBiPRZ3Aep
         oqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747276339; x=1747881139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1WEc2CAkZrTUrnqUm71lSCgh9IfHNNmUGEOhV4UQH8=;
        b=SsROhCaine85mfQ1Vg8hzAKX9GIdo7brz2seHSdaIrr4ygc9mQ6IhozYoomBFgZWXY
         A1JWCFEuV9HjrXvzIbR0xrZqyLe/Wxf/XuZKEe5Y7YDNpv91UqGA3lb/GhhMCyjeb0Ws
         mkHtKrmrDmzd6lXIEwdAkVoBcsd0280quhmMe/kmuXuE7o9Zmf9xcW4/mvS+2AmPMBXu
         niUc7thK2pAqMnuYXU65N1dga9bRSeQs32eeZr5Pbh72r8RGSLg08GowN5dKh6ewbORX
         Sfsgyu1QPTqqrcOitqVGgkxj2mk3bBRZdpv4RPTSvKiPTD6MxsM59E3mLGunsbyShJ1+
         JJIA==
X-Forwarded-Encrypted: i=1; AJvYcCV8WY1PUgQa7KIy2ZGzQ/vlNe9R/ftS4Y10zpTyNccCiY49ne3rWlftkvkv91DkURWHomHFwNM+y4gFU6l+aQ==@vger.kernel.org, AJvYcCW6FIUO4afaal1y1NE8kX3d7N3KeP3UjIyPnipPJc/ENJ/WrxdYK40HAj74EJVd8uVk4XU1W//+N0FC@vger.kernel.org, AJvYcCWtQ+tw6p3PvyzB+oUsQfYLq7Uvs3yoLdKhRzz7vROv2+0q5JsydZeQ6qGMhMeZC+WqtEVFy42i@vger.kernel.org, AJvYcCWxrpgqRJjTE24CQKQRWuLUy7booz0wJJfFOUISc/x2IFnFOqGydN/wZk/+Ilw48m5jxAOtZ2xVC6ootpE9@vger.kernel.org
X-Gm-Message-State: AOJu0YxsnmNIW3uA/hQIDOxN/h/ijRBR26SJ0dQpr8MiGQu/TEIl1ZRr
	0uRWRml6Vg4No2lIeTgQlA1LBLMCld7PGryujgBw2TXspJxbyWX4
X-Gm-Gg: ASbGnctSyNYQOhu1S097mZHaoUdnMdAVHbmPs3HErG5lsMvqPx3WISLTUSkVbFhmeW3
	5RWBZLHiEWpTpWld9SJZLNIAhEvNNksTGqn2M/msiU0UWaKRKS+lXjedsTw/BlareUOXV6w20B4
	4NHOC0HdeGdqsVog7T/XpiLHtRWBU5V4Jq68O+cttV8EtLWJcHeNUZOd/5Z2kTh1vRXPU1TQ3wf
	6pafatYItR3HmPf7Nz3lFyw62w8Qd0dVsGdttnyK0N6LO77sUPgNjy9C3TyPEgoOhJbocBevBMs
	cU7EqGwS4knltGwsO6COp5I35EmJukbhuHtv951LZmU4Zoni/KH5ZB3JJ02Phq7OssSUnBT3Fz3
	APpd5JsRMRCnkDw==
X-Google-Smtp-Source: AGHT+IH6aNrU4NcrN1bSn3vTgH/AqwvT/wu0+1k4X8SprlPBIpx6ZMiFq+Phdp7vqz4SyU4Bac7ZwQ==
X-Received: by 2002:a05:6870:a50a:b0:2bc:883f:3dc8 with SMTP id 586e51a60fabf-2e348872352mr3294113fac.34.1747276338570;
        Wed, 14 May 2025 19:32:18 -0700 (PDT)
Received: from [192.168.7.110] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e01e474cdbsm780532fac.49.2025.05.14.19.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 19:32:17 -0700 (PDT)
Message-ID: <62c98d4f-8f02-43cc-8af6-99edfa5f6c88@gmail.com>
Date: Wed, 14 May 2025 21:32:12 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 0/5] Add PCS support for Qualcomm IPQ9574 SoC
To: Lei Wei <quic_leiwei@quicinc.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_kkumarcs@quicinc.com,
 quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com,
 quic_luoj@quicinc.com, srinivas.kandagatla@linaro.org,
 bartosz.golaszewski@linaro.org, vsmuthu@qti.qualcomm.com, john@phrozen.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
 <20250211195934.47943371@kernel.org> <Z6x1xD0krK0_eycB@shell.armlinux.org.uk>
 <71a69eb6-9e24-48ab-8301-93ec3ff43cc7@quicinc.com>
 <0c1a0dbd-fd24-40d7-bec9-c81583be1081@gmail.com>
 <c6a78dd6-763c-41a0-8a6e-2e81723412be@quicinc.com>
Content-Language: en-US
From: "Alex G." <mr.nuke.me@gmail.com>
In-Reply-To: <c6a78dd6-763c-41a0-8a6e-2e81723412be@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/14/25 11:03, Lei Wei wrote:> On 5/13/2025 6:56 AM, 
mr.nuke.me@gmail.com wrote:
>> On 2/19/25 4:46 AM, Lei Wei wrote:
>>
>> I tried this PCS driver, and I am seeing a circular dependency in the 
>> clock init. If the clock tree is:
>>      GCC -> NSSCC -> PCS(uniphy) -> NSSCC -> PCS(mii)
>>
>> The way I understand it, the UNIPHY probe depends on the MII probe. If 
>> MII .probe() returns -EPROBE_DEFER, then so will the UNIPHY .probe(). 
>> But the MII cannot probe until the UNIPHY is done, due to the clock 
>> dependency. How is it supposed to work?
>>
>> The way I found to resolve this is to move the probing of the MII 
>> clocks to ipq_pcs_get().
>>
>> This is the kernel log that I see:
>>
>> [   12.008754] platform 39b00000.clock-controller: deferred probe 
>> pending: platform: supplier 7a00000.ethernet-pcs not ready
>> [   12.008788] mdio_bus 90000.mdio-1:18: deferred probe pending: 
>> mdio_bus: supplier 7a20000.ethernet-pcs not ready
>> [   12.018704] mdio_bus 90000.mdio-1:00: deferred probe pending: 
>> mdio_bus: supplier 90000.mdio-1:18 not ready
>> [   12.028588] mdio_bus 90000.mdio-1:01: deferred probe pending: 
>> mdio_bus: supplier 90000.mdio-1:18 not ready
>> [   12.038310] mdio_bus 90000.mdio-1:02: deferred probe pending: 
>> mdio_bus: supplier 90000.mdio-1:18 not ready
>> [   12.047943] mdio_bus 90000.mdio-1:03: deferred probe pending: 
>> mdio_bus: supplier 90000.mdio-1:18 not ready
>> [   12.057579] platform 7a00000.ethernet-pcs: deferred probe pending: 
>> ipq9574_pcs: Failed to get MII 0 RX clock
>> [   12.067209] platform 7a20000.ethernet-pcs: deferred probe pending: 
>> ipq9574_pcs: Failed to get MII 0 RX clock
>> [   12.077200] platform 3a000000.qcom-ppe: deferred probe pending: 
>> platform: supplier 39b00000.clock-controller not ready
>>
>>
> 
> Hello, thanks for bringing this to our notice. Let me try to understand 
> the reason for the probe failure:
> 
> The merged NSSCC DTS does not reference the PCS node directly in the 
> "clocks" property. It uses a placeholder phandle '<0>' for the 
> reference. Please see below patch which is merged.
> https://lore.kernel.org/all/20250313110359.242491-6-quic_mmanikan@quicinc.com/
> 
> Ideally there should be no direct dependency from NSSCC to PCS driver if
> we use this version of the NSSCC DTS.
> 
> Hence it seems that you may have a modified patch here, and DTS changes 
> have been applied to enable all the Ethernet components including PCS 
> and NSSCC, and NSSCC modified to have a direct reference to PCS? However 
> even in this case, I think the driver probe should work if the drivers 
> are built as modules. Can you please confirm if the NSSCC and PCS 
> drivers are built-in to the kernel and not built as modules

The NSSCC and PCS built-in. I also added the uniphy PCS clocks to the 
NSSCC in order to expose the issue.

I have a heavily patched tree with PPE driver and EDMA support. That's 
the final use case in order to support ethernet, right?


> For the case where the drivers are built-in to kernel, and the NSSCC DTS
> node has a direct reference to PCS node, we can use the below solution:
> [Note that the 'UNIPHY' PCS clocks are not needed for NSSCC clocks
> initialization/registration.]
> 
>      Enable 'post-init-providers' property in the NSSCC DTS node to mark
>     'UNIPHY' PCS as post-initialization providers to NSSCC. This will
>      ensure following probe order by the kernel:
> 
>      1.) NSSCC driver
>      2.) PCS driver.
> 
> Please let me know if the above suggestion can help.

I see. Adding the 'post-init-providers' property does fix the circular 
dependency. Thank you!

I have another question. Do you have a public repository with the 
unmerged IPQ9574 patches, including, PCS, PPE, EDMA, QCA8084 ?


> Later once the IPQ PCS driver is merged, we are planning to push the PCS 
> DTS changes, along with an update of the NSSCC DTS to point to the PCS 
> node and mark the "post-init-providers" property. This should work for 
> all cases.
> 
> Also, in my view, it is not suitable to move PCS MII clocks get to
> "ipq_pcs_get()" because the natural loading order for the drivers
> is as below:
> 
> 1) NSSCC driver
> 2) PCS driver
> 3) Ethernet driver.
> 
> Additionally, the community is currently working on an infrastructure to
> provide a common pcs get method. (Christian and Sean Anderson has been 
> working on this). Therefore, I expect "ipq_pcs_get" to be dropped in the 
> future and replaced with the common pcs get method once this common 
> infra is merged.

That makes sense. Thank you for clarifying.

