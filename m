Return-Path: <linux-arm-msm+bounces-53106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD8A7A44E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 15:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 627751898A20
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 13:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5C324E4D4;
	Thu,  3 Apr 2025 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="THOWBo1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0839E248878
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688175; cv=none; b=u2St3aULT/dlpaImi4AzFYbX4QyuQwMDMJBfywLfQ9QqB2JsMlR/VKnb+j0SYOL/pSKZkVcvd9m2T+05vRlP9CKh/QjKYRuZ7zwVEYIPAsv3+l/B/cZ3zscPSqSbW0xX0yjRDPAQRy6GW1UbljkXBoQkIgSsE2k1ofca6MZ0gCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688175; c=relaxed/simple;
	bh=dmBi8Z4Puvc/iWOE8+hwaz+c4m0DMk7B1xt1gvWi3uY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MGTRh5WeShx+mxAIUIyJOlfJs8FlZ7ZHWNY5mp/aUA2XEwSUncr04N9i5rDQHwZBwA6MGspwv9wjp3bhkB1DZS/WetYxxWCuuk8+mRFDLRxrGcg9K4LKVd1ZHHmD6zT43HJCvnRTxbkBBCKDv5KwJ4uITy8J/s+wyNXPtInYdiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=THOWBo1P; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so5033925e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 06:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743688172; x=1744292972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Lbun0GNki6Idmi3A3g8x7YFlOE4BIKGs03UY95gVCA=;
        b=THOWBo1PhH/DolX4Sut/QzyvEmLXXvoj+SKwyUwHJ3CQyVus9J8UgUBAK05jUUPUvX
         hrPDREEWbVCJa1R4E66S6h89dd87+QWaJ1aUzoeZIkxGQDt8t6eH3PT7QeEpjOydFNDz
         qIizmvuw0PvIm2g25Xyu90CdJVx2aNA9fwuwRGYVEtXjyU2cjrMtPLJY/Pb71OusI/LL
         zWswUO0jQCw/ur/gTKm/hFwLS5OQK5IBYF+nSSXjByb4npZceXtKfA716T27DU3bP+aF
         6KIm2tkTQ8L9bdjf04OppkFyrHNbkUxX3TSZghTClsMF4UZH3QL2gxoiPOAG5ilkefJe
         ZYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743688172; x=1744292972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lbun0GNki6Idmi3A3g8x7YFlOE4BIKGs03UY95gVCA=;
        b=QCi5UTZv2+hGIK0p8O9cYgfXs9Ftl/LQCzzmajuzIr1MuFZujtSmRa8yBItwG7EB6m
         dCAO6STLmLSaTwAJPWaMOT7BaDsrd+bjfyLtqXJVxXThQEUcwfdevVxNs+6zkVGu2Zjp
         ArgtNpJl9PdIoxzoOdIfYWySnnphFSi0S8cGVkACvPPvjWN0fXvJgDvt7fHr9yJjqlw/
         SAVEV0VjAyaABv4Va7WeJiAq4UE4FsxyveLEMYGVGnthNw5NPXX74+Hwbt91UCQAv3m8
         lIdM+OrdnJ0/z8xAiEcXddnwYhrZOx3WEjOiChRoHF99bF5Xu4X0baqbcKln/nALuUPz
         2jnA==
X-Forwarded-Encrypted: i=1; AJvYcCVtVgEyeNIhQ28LL6xKkjWm6Lw9TBkkNvxNn2T5yeAGKihiKrISizotjwPf8Gad5ClO0ieviwc/82QeeNWt@vger.kernel.org
X-Gm-Message-State: AOJu0YzbH5E+zvWeoIzsIgU+FWAU3/2j6pIeNUTRvfxzbS9vnE5f8A/5
	Qq1JBgGzye51+mYrBQlTeXzF8UJhZ2NKvmW+I6eBX1CO6CrHGsT5qh5rqsoJtgo=
X-Gm-Gg: ASbGncs/4MIj6q0bsMgs4yYwZbq6eGa9rxHBtBoukHb3hAlJjsjnl2ixUca52de3x8o
	dgGzo6cNFaCjlSpyF0X3FuNQ9DsPOxjqX+IxceCNCJOfOZuH1Avq9GJXX9nmeUHuigjhsEIzzi2
	M2p0r3UdM8eZ/SbYKhjnF/zkOcps85Z+fdfCIKe/rb4PbRS2pDvf0mfU+uqA6gDGWKfNX6x0z7L
	72nhQqvoGYDjzMpQ2fMgTn6pNvJCr/kKOGG+/Yrc4RfsN/qokNTpMUH6ySCGsTICknWlEf541kl
	mzAO6nshib1+lJblRGRYf53WHWjc4mpxXZQOWS1m2a3r3X7nrxL6vb9+MpNieG4hxNRKG1Xnzw=
	=
X-Google-Smtp-Source: AGHT+IE9rPmpD+lql1OOhXGIwaIr3nFGx77QjAL7GITh3M6FkiFPLNOqADUYHdezax8BrNQwiF0+bA==
X-Received: by 2002:a05:600c:4589:b0:43d:300f:fa51 with SMTP id 5b1f17b1804b1-43eb5c187e8mr59872065e9.9.1743688172289;
        Thu, 03 Apr 2025 06:49:32 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec1692ba4sm22202575e9.16.2025.04.03.06.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 06:49:31 -0700 (PDT)
Message-ID: <fe188552-3f1c-49f3-96ef-6e5aca6896ca@linaro.org>
Date: Thu, 3 Apr 2025 14:49:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <qhriqbm6fcy5vcclfounaaepxcvnck2lb7k2gcpbtrojqzehua@khv5lwdgbysc>
 <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
 <412fe24e-ce70-4733-ace5-d3fbe43476c4@oss.qualcomm.com>
 <c27a97ed-c765-421a-a48c-3abbae3bac93@oss.qualcomm.com>
 <bfa29a76-f89a-4398-b6b3-1be7ae6cf8b3@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <bfa29a76-f89a-4398-b6b3-1be7ae6cf8b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/04/2025 05:44, Ekansh Gupta wrote:
> 
> On 4/2/2025 2:12 PM, Dmitry Baryshkov wrote:
>> On 02/04/2025 11:38, Ekansh Gupta wrote:
>>>
>>> On 3/21/2025 5:53 PM, Srinivas Kandagatla wrote:
>>>>
>>>> On 20/03/2025 18:43, Dmitry Baryshkov wrote:
>>>>> On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
>>>>>>
>>>>>> On 20/03/2025 09:14, Ling Xu wrote:
>>>>>>> The fastrpc driver has support for 5 types of remoteprocs. There are
>>>>>>> some products which support GPDSP remoteprocs. Add changes to support
>>>>>>> GPDSP remoteprocs.
>>>>>>>
>>>>>>> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
>>>>>>> Signed-off-by: Ling Xu<quic_lxu5@quicinc.com>
>>>>>>> ---
>>>>>>>      drivers/misc/fastrpc.c | 10 ++++++++--
>>>>>>>      1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>>>>> index 7b7a22c91fe4..80aa554b3042 100644
>>>>>>> --- a/drivers/misc/fastrpc.c
>>>>>>> +++ b/drivers/misc/fastrpc.c
>>>>>>> @@ -28,7 +28,9 @@
>>>>>>>      #define SDSP_DOMAIN_ID (2)
>>>>>>>      #define CDSP_DOMAIN_ID (3)
>>>>>>>      #define CDSP1_DOMAIN_ID (4)
>>>>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>>>>> +#define GDSP0_DOMAIN_ID (5)
>>>>>>> +#define GDSP1_DOMAIN_ID (6)
>>>>>> We have already made the driver look silly here, Lets not add domain ids for
>>>>>> each instance, which is not a scalable.
>>>>>>
>>>>>> Domain ids are strictly for a domain not each instance.
>>>>> Then CDSP1 should also be gone, correct?
>>>> Its already gone as part of the patch that I shared in this discussion.
>>>>
>>>> I will send a proper patch to list once Ling/Ekansh has agree with it.
>>>>
>>> Thanks, Srini, for sharing this clean-up patch. It looks proper to
>>> me, but I was thinking if we could remove the domain_id dependency
>>> from the fastrpc driver. The addition of any new DSP will frequently
>>> require changes in the driver. Currently, its usage is for creating
>>> different types of device nodes and transferring memory ownership to
>>> SLPI when a memory region is added.
>>>
>>> The actual intention behind different types of device nodes can be
>>> defined as follows:
>>>
>>> fastrpc-xdsp-secure: Used for signed (privileged) PD offload and for daemons.
>>> fastrpc-xdsp: Should be used only for unsigned (less privileged) PD offload.
>>>
>>> The reason for this constraint is to prevent any untrusted process
>>> from communicating with any privileged PD on DSP, which poses a security risk.
>>> The access to different device nodes can be provided/restricted based on UID/GID
>>> (still need to check more on this; on Android-like systems, this is controlled by
>>> SELinux).
>>>
>>> There is already a qcom,non-secure-domain device tree property[1] which doesn't
>>> have a proper definition as of today. The actual way to differentiate between
>>> secure and non-secure DSP should be based on its ability to support unsigned PD.
>>>
>>> One way to remove the domain_id dependency that I can think of is to use this
>>> property to create different types of device nodes. Essentially, if unsigned PD
>>> is supported (e.g., CDSP, GPDSP), we add this property to the DT node and create
>>> both types of device nodes based on this. Otherwise, only the secure device node
>>> is created.
>> This sounds like breaking backwards compatibility on the userspace side. You can not do that.
> Okay, I thought if the property is added for all older platforms, that will ensure backward
> compatibility is maintained for old built applications.
> 
>  From userspace, the expected device open sequence is to try with the secure device node and
> fallback to the default/non-secure node if the secure node is not available/accessible.
> I understand the ABI cannot be broken, and this expectation should be added for new
> applications/platforms.
> 
> This is still a security issue that needs to be fixed in some way. I'll try to find out if any other
> approach can address this.
In the past I have suggested you to update the dt-bindings so that any 
new platforms that get added will not use the qcom,non-secure-domain 
flag. The usage of this flag is still confusing for any new users, as 
per the dt bindings its open to be used.

As we can not break the backwards compatibility, why not just restrict 
that to those platforms for now, and enforce new platforms to use not 
use it for for domains like adsp.

--srini



