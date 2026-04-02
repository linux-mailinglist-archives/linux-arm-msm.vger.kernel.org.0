Return-Path: <linux-arm-msm+bounces-101575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECSwAhi5zmmTpgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 20:44:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF7B38D552
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 20:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C95AD3047BFB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 18:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F9F3E9595;
	Thu,  2 Apr 2026 18:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggQAGIHP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggcejm7I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80531374745
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154946; cv=none; b=C5MbghjevgO7KwsUbzYsF+hrh+rutKmQd8DzSeH9OZ19z2xr1ow6PcAxNLcabqpfKiYEfQ+/mZ1G79Q4XyuGNvQ1B4LLQSQtp5JJn3BXVmDC0iDrIkvyBXizpF0dH4k/MdxxOdBN5vG9nuhwXC/7fCSNY1IRSiNyz6Ub1Siap1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154946; c=relaxed/simple;
	bh=iLcy23eHNghMwYNBfzI52/vo3cRBzHqHxysNAGrl0DY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t0vfBryfqggRI8SKEwdaNW8GoxvduMxlWyre9p5zt+Qgr75H0QHcC54u71hdW66VCCeQv6khLFGvwqmiIB7DuiAwzVSTvI8melzNZhRhDc1i9his3Tk8mQFQp482QBsXbbpQ/+aO/q3H4rXVM93d0cNwKeaZTqFGt0oTFhF1awg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggQAGIHP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggcejm7I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632I2E703772507
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 18:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0QqT2QmWrzzKobTW3iRiFUwu6lcuslU23UpBZdmqACA=; b=ggQAGIHPY1zcbnhk
	s04hS8AHC9F0cRJbNP6lfxLZYL3/PquleW5RiP+vNcKFHExRRYnWwiTaLsSkghWP
	kMOMcZHq8lGDs7fLpb5S2k8vVQnppeszDlenPzbi4uBQMAjfinCx9gXfvFXnF/t5
	lLic+O9eg7M/JAH/K1Nz1Ridk9/ACcesMxmU7zItT+n3t90PGcXc4a8bBwDB2ZFL
	XMB8BBHx1FcUg6//grzAURO4/wWPOJGlK69GX7qzA1alJXbO2Xdpd6s/L20EaWZ7
	gBQ5QKwhzWq1KXJjxV/HFQWWsB77oEhLNH/3MAK3w693lBKd1AHmq/f9GniSb9wP
	e73JxQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs03sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 18:35:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354bc535546so1057756a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 11:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775154941; x=1775759741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0QqT2QmWrzzKobTW3iRiFUwu6lcuslU23UpBZdmqACA=;
        b=ggcejm7Ila1ayXfd8WqY5W4N3pYNi9UUj3Cpx6rMmawaGon7DKiYHG1ajzEYnUPfbd
         zldgnZeztS1GkgJyriyyo0BoJqRln8JO0k84eeX2J6v559jGMULXro7ob4q01odPcsWF
         Bm4GkEPf0KyDglN0DRea583qS0JwzgrYxu1NM3xiZFM6EeHoPcpx8EzzWz+DD+Wwde+C
         p2dPMTgLAFfejMJ4qZZKQkk/b+YVd7g9XG3vNSAwLs3CUerZAP1OkLdkdUH9xMYMXbxS
         7syt3bPIxHqIjW+1WhbaCRDb6N/U0fEvFhj3mvdLaosXWd6wEJCxIM9npD8jsjbPX94M
         /nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154941; x=1775759741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QqT2QmWrzzKobTW3iRiFUwu6lcuslU23UpBZdmqACA=;
        b=RwnId/Dbg+oio0OEFOa5bt5gc93y/KkbvId4qHl32aCcPyESkBvb3sWIPEsvD1Smlp
         3cix9ycXc7zRxRFMXGa4VUCrqhXP8yVC3wZB5gqRJ3O/aRMohwihVKZ8uIfq2A61btuT
         6K38BXBnlX6XL19MmXj5GhhkeuphdvhpCn3qfajGSCgAGeGoCu99646kylRJBtyaPXFe
         q0Fq0czD7Jz0CVB31+Izt026GH4T2NAyCE/crk0avbBaFQ2RqJtAwhuE4ZGQhx1J2i8/
         4nxIDDRV23LhJ34OhDK/LcIZ9WjXeICwAhllUxIU8FRzDU2aizV1x+MQlDgAfWC5eKJ0
         9cTg==
X-Forwarded-Encrypted: i=1; AJvYcCVz/XtBEA55h8Q/opfzE7dVTPkrxHtUs2HktzyKLkYkxdPENxr9ZxCaasEkQ0n0Rooc0PhgbREeHpiIM2QZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrs/gGnzgIIl6kYlDbM01tG7oVW/Pohf1ESxcR2zlmItJceiqD
	9QYCOr8pbQ+hYsiJ2GFX+zTA2ObGZ1+S48HKA5YHsZKaG28IRunwy+cxZSiiFnEUqtr5NhZEp8N
	o/ln0MybjzUNZ1f1tya9RQtbloclt912qYhPJkWpDvfNUTElxXeoR0nvEHEniZloIp2on
X-Gm-Gg: AeBDieuewoixHFU2wbEk+BLT5/pJX2obnf10W9ncVCNEt10RTS3DxbDkCXmaA/WpkXc
	eHqq3Ru+HkZlLgZXhLXCmW4D0+ILJIH3wt0hdKD/RLyIRE5tvIvLi6hvhMpTkU0DknNdIHEQWvs
	SSvLBVKnkh6UimUBajyl02jGr37bU+8taXpmpOUUiGy5375KFQ4VUNQJhFCorbRPpTuIMeCGvTB
	4mvjBV/wH+kLhANGkh4J5RO68ZJfgxZ7jGGggIOv3WrCXbCypvyNSCCzmmE+7jyTvjYkB/+eja1
	HVk5x5CtBgWZKxhHdMCF0+N+NaIpxQ95oIeDah/CLpXbbQewkpT2rgOeYbHGZLzHMwH9buJQulX
	ry7rayLaKUnvfnLLj0cIKiNEhKoy86WD2tBrgJQ+I3v7N2/O2GGIiZ7W8SQ==
X-Received: by 2002:a17:90b:1b4b:b0:35b:e51b:1935 with SMTP id 98e67ed59e1d1-35dc6f7ad00mr7904007a91.17.1775154941194;
        Thu, 02 Apr 2026 11:35:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1b4b:b0:35b:e51b:1935 with SMTP id 98e67ed59e1d1-35dc6f7ad00mr7903972a91.17.1775154940621;
        Thu, 02 Apr 2026 11:35:40 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.227.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd367c142sm3549034a91.11.2026.04.02.11.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 11:35:40 -0700 (PDT)
Message-ID: <da6f4566-a719-409b-80a9-40ca89e3e721@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 00:05:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
 <93a78bc2-4fd1-41bd-bf4a-b433b06fc218@oss.qualcomm.com>
 <ac0trUGsRBLPS+ux@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <ac0trUGsRBLPS+ux@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BYbaGeqM4bgAX35CH_a2-unSqXSKZkSF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2NyBTYWx0ZWRfX1oJQBVEix924
 hmwCF+6DVELPiH2AZsjCcUeStRQB7cBT5FEBKlvbg+PPyCBx0K/4o+62E/Ch7oIyvtjGj2hmdtz
 i/QHZblB83jzDigDk2FPmPXgQSvT72RuCp8JlB5f/MKdzykdl9dnALZfiGxxituIGj3sk5rEmx+
 mMrw7WNPhFC859ddF1vlKTpyeVEOLUR4O9aZdzCX2zPXQ1rVUhY/uul1kYSxxxP92AQ/11GDQD/
 VDeoZqekQmcF76Ket7ZJD6jluxOSjVNl04oarWC218rzmKz9nhbZoS8RB8okh+AbjEycuXOC3Gd
 +NyBIvikp9Ii3EPUSwzWI0BVs1/8b2be1VkPWoAGyworOm4rkk/o2NWdFlNyDzBoVjOfs4ah20d
 MDXUH/eiDtGuVh9ouIwAGu+wNcXvYX+cVfqveGbmroR8xfSw1bZ/dyfz+/gdIPtlagLQK3XFlvd
 /wNHGDSWWDGP6NpWmaw==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69ceb6fe cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xCZvIt4Xq4xTzMb426/Gcg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=5_yrRdH-cSa_xDgWEkIA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: BYbaGeqM4bgAX35CH_a2-unSqXSKZkSF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020167
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com,broadcom.com,oss.qualcomm.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101575-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CF7B38D552
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 01-04-2026 20:07, Lorenzo Pieralisi wrote:
> On Tue, Mar 31, 2026 at 11:30:09PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 27-03-2026 19:25, Lorenzo Pieralisi wrote:
>>> On Wed, Mar 04, 2026 at 11:33:06PM +0530, Shivendra Pratap wrote:
>>>> PSCI supports different types of resets like COLD reset, ARCH WARM

[snip..]

>>>> + * Predefined reboot-modes are defined as per the values
>>>> + * of enum reboot_mode defined in the kernel: reboot.c.
>>>> + */
>>>> +static struct mode_info psci_resets[] = {
>>>> +	{ .mode = "warm", .magic = REBOOT_WARM},
>>>> +	{ .mode = "soft", .magic = REBOOT_SOFT},
>>>> +	{ .mode = "cold", .magic = REBOOT_COLD},
> 
> These strings match the command userspace issue right ? I think that we
> should make them match the corresponding PSCI reset types, the list above
> maps command to reboot_mode values and those can belong to any reboot
> mode driver to be honest they don't make much sense in a PSCI reboot
> mode driver only.
> 
> It is a question for everyone here: would it make sense to make these
> predefined resets a set of strings, eg:
> 
> psci-system-reset
> psci-system-reset2-arch-warm-reset
> 
> and then vendor resets:
> 
> psci-system-reset2-vendor-reset

Can you share bit more details on this? We are already defining the 
string from userspace in the struct - eg: ".mode = "warm".

yes we can move away from enum reboot_mode and use custom psci defines 
one - Ack.

> 

[snip ..]

>>>> +
>>>> +/*
>>>> + * arg1 is reset_type(Low 32 bit of magic).
>>>> + * arg2 is cookie(High 32 bit of magic).
>>>> + * If reset_type is 0, cookie will be used to decide the reset command.
>>>> + */
>>>> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>>> +{
>>>> +	u32 reset_type = REBOOT_MODE_ARG1(magic);
>>>> +	u32 cookie = REBOOT_MODE_ARG2(magic);
>>>> +
>>>> +	if (reset_type == 0) {
>>>> +		if (cookie == REBOOT_WARM || cookie == REBOOT_SOFT)
>>>> +			psci_set_reset_cmd(true, 0, 0);
>>>> +		else
>>>> +			psci_set_reset_cmd(false, 0, 0);
>>>> +	} else {
>>>> +		psci_set_reset_cmd(true, reset_type, cookie);
>>>> +	}
>>>
>>> I don't think that psci_set_reset_cmd() has the right interface (and this
>>> nested if is too complicated for my taste). All we need to pass is reset-type
>>> and cookie (and if the reset is one of the predefined ones, reset-type is 0
>>> and cookie is the REBOOT_* cookie).
>>>
>>> Then the PSCI firmware driver will take the action according to what
>>> resets are available.
>>>
>>> How does it sound ?
>>
>> So we mean these checks will move to the psci driver? Sorry for re-iterating
>> the question.
> 
> Given what I say above, I believe that something we can do is mapping the magic
> to an enum like:
> 
> PSCI_SYSTEM_RESET
> PSCI_SYSTEM_RESET2_ARCH_SYSTEM_WARM_RESET
> PSCI_SYSTEM_RESET2_VENDOR_RESET
> 
> and can add a probe function into PSCI driver similar to psci_has_osi_support() but
> to probe for SYSTEM_RESET2 and initialize the predefined strings accordingly,
> depending on its presence.

Not able to get it cleanly.

1. Will move away from reboot_mode enum for pre-defined modes and define 
new enum defining these modes- fine.
2. get SYSTEM_RESET2 is supported from psci exported function -- fine, 
but how we use it here now, as we do not want to send the reset_cmd from 
  psci_set_reset_cmd now?
3. For pre-defined modes, warm/soft or cold - reset_type and cookie, 
both are zero, sys_reset2 or sys_reset2 decides the ARCH reset vs cold 
reset.
4. For vendor-rest , we use sys_reset2 with reset_type and cookie.

All above is done in reboot_notifier call at psci-reboot-mode.
--

Now in the final restart_notifier->psci_sys_reset --

If panic is in progress, we do not use any of the cmd based reset params 
and go with the legacy reset. So we need to preserve the values that 
were set from psci-reboot-mode.

Did not understand the proposed suggestion in above usecase. Need more 
input on this.
--

One other option is to have a restart_notifier in psci-reboot-mode, with 
lesser priority than psci_sys_rest and then handle all the case 
including panic and sys_reset2.

thanks,
Shivendra

