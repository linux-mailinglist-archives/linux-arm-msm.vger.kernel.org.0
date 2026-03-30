Return-Path: <linux-arm-msm+bounces-100806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGjfA2x/ymnX9QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:49:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEAF35C4E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9002B301CCA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C333D5657;
	Mon, 30 Mar 2026 13:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a627rswt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T5hn/aJ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAEC3D5226
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878423; cv=none; b=BjYnCs15MjC7RccY8k/5pdfOSrXsrqDmUnNZ5T+ZMqei+LfdHHWLYg2dwsKxK/qlSYXTMuwIvypI1Atd+1za2nhzKTs4LBjdBxqjC1lkfXbCsM37HQEaAjzWO4Ugg1iFR4BMOfVCoAatMBXlpiXay568svfVyyFXiX4B4UQDh6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878423; c=relaxed/simple;
	bh=WnQYQrlhzXML49O16pt6UILGOgBjHdLJfIYsP0vH/Vg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UABGRBrSw5h+0x5pe25J4Xs6WjDTSTNcjxrUfFS+v5FSpWWxTsDkLxXb3hMcQwyoD5xpeK9VSwkT1yLfUBoF8MgkD6/PJFyPdSUM4oFjIHjTHLmTzw/Soi8mpw+JI/MdkdJQFaOM7I1pM3n2wmVbEhqIOfpL9+HPlrcR6OebHMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a627rswt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T5hn/aJ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9lNWs2197293
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EuNr1VGozU4C0a4yZ9+52NH01fTWN0EbJOaoUPkxfd0=; b=a627rswtpDNAewxd
	0aFwvNq4jpShi3biaJygMv918i28R+jFzVMF1dePO6EvyuuNYhvf7AlvYXuEHs2Z
	UBRV1CwIQGBW/hBchH8oepUieU1mGePDDcjSs2KF4FyCCpD7PRESV25wepNDNmHE
	/Ap4yQa/adkyAp+VMHaNvX6dGCsELAKz5mexReD9Qo9YEyTtWFyemT6+2UKbyBVJ
	NX3jfpQLQ65XAvjJkpMfH8wuFnAjBgoEE5zj1k2rhXcnFYMgGB6fw34f1C/s39Ot
	tMcs2Mvuqln6mJvz8aooK/MThLf13DQnA7F1HC1cZ6M8clBUYWxFnyDYoQivvM48
	4T4FLg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c4dcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:46:59 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60525f6c861so478971137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774878419; x=1775483219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EuNr1VGozU4C0a4yZ9+52NH01fTWN0EbJOaoUPkxfd0=;
        b=T5hn/aJ+TdLkQjxJleMMDgFwJBnCK5e3UEeBI0kTAOZXr4EtyE17hNHR4oauj2arrV
         9jbogjEBhuBKMSTKJlkaDkUvT7lRplICe9Ei0pN48Wy3+wKk9UI1CbIdge5Gr/GJN0Ls
         77KlIwagQjIPZQOhf6Ea+xOjLuczEbhrxIqoyW30jAKXTnsDOuDcMhJg7/ssLD260L7E
         4RlNbLZoYGah5VNZ2F7URwMBCHTdOMvLLG+wbCp3aPbyFhL5l9cvYMzaZMptEw1o/Jht
         di7jInBsvt1alx6N3BFyhqxRFuD0xtK8i1nDLdp2gEQ12gsS55TMnBfJFpILhPW4cAwU
         Gblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774878419; x=1775483219;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EuNr1VGozU4C0a4yZ9+52NH01fTWN0EbJOaoUPkxfd0=;
        b=C+IhTrNa1ful+8+DyG6y1ORN+iIHhxbUTnS0RR8XNwuWZFrB//B7XWSI6gH9CgLL3D
         B2APnVaDdNq0on4hAKWWasNPGFMzmKMRL/jf/rl6KZix98KTFfi3UR9iDq7fuVJFuaIw
         dCwv2AuUVYDXpRfpBtyHLD5+NWeIECqXkGa33/D4i65UYRwcN4DYkCpL3HqjOFuMbu1P
         8I2NZUClARk3p4gXkvJmEJtk1SFMig/RHFDDs06mi1oHQjlWv5RNQDHj2k3M/odXL9AO
         x+0DIz/RHq0FJRyAx348MfQ63D8IPAoGlDoGBmte9P9EFKlvmkmep2NPLKimcU/Lx5HN
         LsgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC+nFRXFvLeEKdYCB9Ycn/LJjwLXIbrCRaDpG/t1Y11bp6MfCLm+0lYqKDRwdCMfxqFOocWn475UsrDiUC@vger.kernel.org
X-Gm-Message-State: AOJu0YyXaGBqt4Z0tUEc0x7yxYCR9Y52NOIZxAwyRRSQ1Y4E8oAR4m1O
	CfvDyud0uQIsJ2IKGwMPiFu9DIaDXU01RMo4chDg+fwydkcH+f9ZCW/xrPIs/yKGuw3J5tAjpSV
	erDfzzk5Vm2HWl60f8kWqzdwoLCZsTwWB8U/chLALX9umusXQ7xGThGro/gP+7rAUCFCm
X-Gm-Gg: ATEYQzw+ILSKiUSGTxf8EnryaOHYImOHE1BJX5w/JOv/Be1b9Qm7wRsLY8vo7SsJuVi
	IpNyjyuJxD6tsoG9YjnAYcgqDN4IRQrRGOeuE0Nzjh2OutPlupTwH042CYmH714PccNm6NFU1Po
	eAOAwD07xatA4742P7koFjr99txsE9EuQ9jgrYRVqFIfqxhjf6KHr1QIQ+zl95q4N+PJ0dhi9Q0
	qiGOFCMilxvWsYPgu6OnXyKgIpkG7pK2O2NxaUuak0xJwW0yTAhLeyy7VFDE6CgFL9+K1kdc979
	zghKLB0PzCkGbZ5DL68upgrnnDsxDCpcu3kT1tmwH8C78d4B85e6rp4jZ/QU63+3hcyMHJJcYoF
	KMSPTz4/nb9bbzsIUqC5O2PSWCGsMOrIZQsFB0Q0hyac2dLUuiOxPOxu9F5WosPZV96TdXTizYb
	EFc7/WjDLg/eIZlNZTPXlf/5V3eLmyj7yyniik21Xhh7LohgJ1yUKors9SnwbUIogpnaS5Wohl0
	wrnpu+CqGktk1fx
X-Received: by 2002:a05:6102:3fa8:b0:5fe:f4b9:fe2a with SMTP id ada2fe7eead31-604f90f7668mr4356748137.16.1774878419275;
        Mon, 30 Mar 2026 06:46:59 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa8:b0:5fe:f4b9:fe2a with SMTP id ada2fe7eead31-604f90f7668mr4356727137.16.1774878418805;
        Mon, 30 Mar 2026 06:46:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e4dc8sm294822766b.52.2026.03.30.06.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:46:57 -0700 (PDT)
Message-ID: <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:46:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
Content-Language: en-US, nl
In-Reply-To: <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNyBTYWx0ZWRfX7rMRHIr65S6p
 oK4XMzDpJK1Dkux62GpLH4OerxpeKG0diV+hF9vCjGszWF+f6ISKV3vluMpBFXWi64NCTxLopeU
 zOHwCpaUvsLNhwuX2heKUDehro90se044UU5tOZZktriIel4baDY0/Odqu/XHQHxBkpVv2nvSqG
 /cyawMS98rqV0ssp4L6zNmPx91MUexHP8+4NmYeRs1/7u/y0vTZFjMyp67BlHsK1NftzKvqnV3M
 ktWRWVGkGdhBcjTh/kEXiiXfXiEJ+XgWfMOIHXWpIBLdFmVD6e1djpYTsxrNGDZSESSJYT1fp3N
 JF0CFySWKDrfxx3z/p3Zp6teVA0iDWXWq/nThZYUz9inyLfYLdBw8oPG8e3EsgiHwdcgFFfbM0B
 An9jnkubLMWoC9XoGcrxXBKqeFRJ8W7UtUqcWwJ+cRzeEUDQC32ZNRgcUBjORLgUaLS0MJGVenj
 RR6CLuM5Y038edVHCBQ==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca7ed3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=T0-0iHhQiz8Ou2cd6XoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: ZmQ5ZqqVD2avJ2pleHuK7QjSDbDaJLOX
X-Proofpoint-ORIG-GUID: ZmQ5ZqqVD2avJ2pleHuK7QjSDbDaJLOX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100806-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DEEAF35C4E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 30-Mar-26 13:37, Dmitry Baryshkov wrote:
> On Thu, Mar 26, 2026 at 01:06:59PM +0100, johannes.goede@oss.qualcomm.com wrote:
>> Hi Dmitry,
>>
>> On 24-Mar-26 22:27, Dmitry Baryshkov wrote:
>>> On Tue, Mar 24, 2026 at 11:00:21AM +0000, Bryan O'Donoghue wrote:
>>>> On 23/03/2026 15:31, Loic Poulain wrote:
>>
>> <snip>
>>
>>>>> As far as I understand, CDM could also be implemented in a generic way
>>>>> within CAMSS, since other CAMSS blocks make use of CDM as well.
>>>>> This is something we should discuss further.
>>>> My concern is even conservatively if each module adds another 10 ? writes by
>>>> the time we get to denoising, sharpening, lens shade correction, those
>>>> writes could easily look more like 100.
>>>>
>>>> What user-space should submit is well documented data-structures which then
>>>> get translated into CDM buffers by the OPE and IFE for the various bits of
>>>> the pipeline.
>>>
>>> I hope here you have accent on the well-documented (ideally some kind of
>>> the vendor-independent ABI).
>>
>> The plan is to use the new extensible generic v4l2 ISP parameters
>> API for this:
>>
>> https://docs.kernel.org/6.19/driver-api/media/v4l2-isp.html
>>
>> What this does is basically divide the parameter buffer (which
>> is just a mmap-able bunch of bytes) into variable sized packets/
>> blocks with each block having a small header, with a type field.
>>
>> And then we can have say CCMv1 type for the CCM on the OPE and
>> if with some future hardware the format of the CCM (say different
>> fixpoint format) ever changes we can simply define a new CCMv2
>> and then the parameter buffer can be filled with different
>> versions of different parameter blocks depending on the hw.
>>
>> And on the kernel side there are helpers to parse this, you
>> simply pass a list of the types the current hw supports
>> + per type data-callback functions.
>>
>> And then your CCMv1 or CCMv2 helper will get called with
>> the matching parameter-data.
> 
> This leads to userspace having to know exact format for each hardware
> version, which is not nice. At the very least it should be possible to
> accept CCMv1 buffers and covert them to CCMv2 when required.

Yes, but a new ISP may also have a different pipeline altogether
with e.g. more then one preview/viewfinder output vs one viewfinder
output for current hw, etc.

Or the raw-bayer hw-statistics format may change, which would also
require libcamera updates.

Generally speaking the development model for MIPI cameras with
hardware ISP with libcamera is that enabling new hardware will
require both kernel updates as well as libcamera updates.

ISPs are simply so complex that it has been decided that having
a unified API where old userspace will "just work" with newer
hw as long as the kernel has support for the new hw is simply
not realistically doable. There are too many possible topologies
tweakable parameters, etc.

And even if such a thing were possible (1) it would lead to an API
mostly limited to supporting some sort of shared lowest common
denominator feature set which is not what we want.

The purpose of the extensible generic v4l2 ISP parameters API is
to allow having a single kernel driver + API for multiple generations
of hardware-ISP, without breaking the userspace API for the older
generations. As well as having a single set of support code
for that supporting multiple generations on the libcamera side.

But once the kernel driver grows support for a new ISP generation
then it is expected for the libcamera counter part to also need
at least some updates to support the new generation.

Regards,

Hans

1) It might be possible if you throw a whole lot of manpower at
it ...




