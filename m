Return-Path: <linux-arm-msm+bounces-76214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB57BC18B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 15:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 127F84F5BC5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 13:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576322E11C6;
	Tue,  7 Oct 2025 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCdjMsf4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30702D46BB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759844512; cv=none; b=BK/gHG2LSjJYdKdcsuOQL1VmVwKm9RzM05e9ebiN+hkuRDmlnBqO92xDJllums9nFVPGgr1UrO4aZKz6nkrtBWnln6CK7zmtoNovB0roxrx6Gvi5L37snHkd4YKpJmi2IMyVADHdL+e80lPkXUh/I4jMRn98ibvOp4TAWNLlyNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759844512; c=relaxed/simple;
	bh=nkeOwih2wxnDJdpLI6Dz/78w4EhHeT1xmOgbx9n/oo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwbbf/nM1Rg2n4hKpFOsRjPYKa47PY3//b66xJlnXzVZY8xHWdWhV+8yv7MCvmGYos7QS0fr1zV4yA5iDgVu6olzHsKibBRcEry9bCr0lh7BtOdyWS6E+9QuohWGYqGXTzHkqA58vNNddZ49XWbnnbXFARluf7HrCzJEdwrC/TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCdjMsf4; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-791c287c10dso1693710b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 06:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759844509; x=1760449309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rnHeuaAxXkLy83WQ0FvFcsx02OTH0C9r7FOqh/BgxF0=;
        b=bCdjMsf42+G+Iq+ji/1GArMqIcWj6oKTYVK5orzQHtLUCGvOtSAqA0dWkLF7sUP8sw
         eX0k534hyD/mknL1wCoSQY3fh4bnndYZAM70huiMM1u1ZuwTEPzsO8AwOOhByerVfwLz
         dlJyJ1pGXnFUBytFoyPKhqjp/oo/uHDN9YRmMqoETyy5iTXJWmadXhS5fvupeixoG85U
         3/Jld1ZzIZkZ1GxAJrVRH4QK/jJ4QUVEnV01dgQfKxpyZKOFt2Vxgf/UxqS2gYydZJk7
         /d2HK7FfobHLCQQDDDYpA+5J6aOYqaocVz38qWolaC7tV0yUpSTBNl7brMas23/uwshM
         K0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759844509; x=1760449309;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnHeuaAxXkLy83WQ0FvFcsx02OTH0C9r7FOqh/BgxF0=;
        b=XozEdKlZmJzkKhx2NMidA9LgCSNSCSOkCGdWN36bdlRjU5lGt9iPhGOaIMNMoqkcdk
         nAsN99vddd1Rc1eT5TLDDt27W5Ex+gtl9wcZh0XpzF7+6+HmZTkl40nVzDE5NzciUDbm
         HBe0rCFQEOEwLmG2ShXeLoaagHegWw8WlTm4zNxN4bNICkXbj3iXaxpc68HpE63kl8w7
         DLQTYPWHxekjkkgaMxl8WZMFAwaOD3pwH4ctOJKgjRipsbJwo7gGJRKutJIcuQt4Nt/g
         L5a61mE1U40rLyCx2aAhUE7amicHMHbVMldByvtdA01LwM/GMcAARbiG2audXWvHIbbV
         omiA==
X-Gm-Message-State: AOJu0Yx2NG/hfX3WkRi2huo09omvoUnanfW62LOgmVWD7DV1qWoMxDS/
	lFxEh0ziFxfczlSYRnc0+ZDqxKVCPlA4ZER1N8doLUozL9oP8cQI7MPC
X-Gm-Gg: ASbGncugYmvm2len90CL91q9sSmQXk6Dc4yQ/dI+uh1OxQ08WdckIISMu/8ilRJKVCl
	1MIdMZxw+CY5r9uB+jWPjRosCSdP6uT/q/CpyyD8hbviZ/5qngcH9StTYQti+b8wCzX1CRaSu92
	1n4hpm1L3TOmAA33STP0sjPrfblVlk8GsPgAfKCtsRRv2Krvzsi7yPdj9hmDbc0c9Y+WlVQTwiE
	LiV7NbGIBDSrU8baAqIN2TV48zKhKAFvH3Hn8pt6PJlYA5+b8UABLJ2sJWOJFDGHGG2W5fHLvcL
	uOWomwfRKxML+WpE/VxQCuX+PilMdCdQT4PpGZAvKGLKABRFBx3xvP3+BDcxTb6QplWfYCdHQxt
	J4ZGa12ohnsLUJhVyR3EbMlIKQp2JHt16ZlVRst0vkF1yL7b/KmvZLDlubYhl++s0dArBydkTpv
	5quZYrZ7EkEEmpshSCIfA=
X-Google-Smtp-Source: AGHT+IFVJf+JxdKIUBEal2NKbaOSA5Jm7ewMijN3A3/MHNXXdwLzwZQSOta0mANRwv7CKcqgs4HloQ==
X-Received: by 2002:a05:6a00:2ea9:b0:77f:6971:c590 with SMTP id d2e1a72fcca58-78c98dd92bcmr19639116b3a.22.1759844509033;
        Tue, 07 Oct 2025 06:41:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9a364sm15776636b3a.6.2025.10.07.06.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:41:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <57d0775a-0450-4384-b4ab-b6f2d976499f@roeck-us.net>
Date: Tue, 7 Oct 2025 06:41:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: Add driver for Gunyah Watchdog
To: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com>
 <6e7eaac2-0859-4bfd-b76b-2f81e384a91c@roeck-us.net>
 <166a0b99-879c-43cd-b3c0-37eb04afca5a@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <166a0b99-879c-43cd-b3c0-37eb04afca5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/6/25 23:52, Hrishabh Rajput wrote:
> 
> On 10/6/2025 7:48 PM, Guenter Roeck wrote:
>> On 10/6/25 00:37, Hrishabh Rajput via B4 Relay wrote:
>>> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>>
>>> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
>>> through MMIO is not available on all platforms. Depending on the
>>> hypervisor configuration, the watchdog is either fully emulated or
>>> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
>>> Specific Hypervisor Service Calls space.
>>>
>>> When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
>>> expect MMIO watchdog device to be present in the devicetree. If we
>>> detect this device node, we don't proceed ahead. Otherwise, we go ahead
>>> and invoke GUNYAH_WDT_STATUS SMC to initiate the discovery of the
>>> SMC-based watchdog.
>>>
>>> Add driver to support the SMC-based watchdog provided by the Gunyah
>>> Hypervisor. module_exit() is intentionally not implemented as this
>>> driver is intended to be a persistent module.
>>>
>>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>> ---
>>> Gunyah is a Type-I hypervisor which was introduced in the patch series
>>> [1]. It is an open source hypervisor. The source repo is available at
>>> [2].
>>>
>>> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
>>> access the MMIO watchdog. It either provides the fully emulated MMIO
>>> based watchdog interface or the SMC-based watchdog interface depending
>>> on the hypervisor configuration.
>>> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
>>> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
>>>
>>> This patch series adds support for the SMC-based watchdog interface
>>> provided by the Gunyah Hypervisor.
>>>
>>> This series is tested on SM8750 platform.
>>>
>>> [1]
>>> https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/
>>>
>>> [2]
>>> https://github.com/quic/gunyah-hypervisor
>>> ---
>>> Changes in v2:
>>> - Move away from platform driver model since the devicetree overlay does
>>>    not happen by default.
>>
>> This is just wrong. Platform drivers do not depend on devicetree. I am not even
>> going to review the rest of the driver. 
> 
> Thanks for pointing out the mistake here. Platform drivers are independent of devicetree. Therefore the line you've pointed to is wrong as it erroneously portrays that the platform drivers are dependent on devicetrees. It is a mistake and I would rephrase it to following to make the intent clearer:
> 
> "Do not depend on devicetree to discover (and probe) watchdog as devicetree overlay does not happen by default. Instead invoke GUNYAH_WDT_STATUS SMC Call to discover (and initialize) the watchdog."
> 

Let _me_ rephrase: A platform driver does not depend on devicetree.
This can and should be a platform driver.

Guenter


