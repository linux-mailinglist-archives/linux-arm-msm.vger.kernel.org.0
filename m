Return-Path: <linux-arm-msm+bounces-115692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w8G2I937RGoz4goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:37:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 399626ECE14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:37:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WtbHzlm9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OcCksVrD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115692-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115692-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB82130332DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646D947DD4B;
	Wed,  1 Jul 2026 11:36:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B4D48033D
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:36:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905767; cv=none; b=b6yKTHTs+KK7pnKJbzrtaIfBA6sWfuK+kUnIRu0ueh1mnU9waoM3LfOvlJF+vHGtVq37eX0rcSwzt7nYpMs4V/qRuOjaHE81WQutrx9ZiuWRhzt0fkjDqBtBVLiMkHe7slqh4qVqwpO6SszIu3DJvymTkGKpADxUfGsQZqHz3+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905767; c=relaxed/simple;
	bh=0bnCOKwnwDk+tMRIOsO1oGgEBVECcQ+CY1lwPvpyynQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoOST7Sqkgl6uUplvrukMINfmmq/xNmQ0fOZ99gBT1cuM5R1OvCNGnZ+nrYDKWwPRi7BZYf60KKjTzJvognpLhX9pB8GS7gfx3lCoq40t4fXeT9bikHRFYcSRrhoFnmQO/ym+5sJJhxHd4H6BbJNrxbabpdFN/KByeaQ1uSDJlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtbHzlm9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcCksVrD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8VJB744177
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kFcErPMbRrdovsdBegssaIpyzx8eIkEjsztaeNSdBpA=; b=WtbHzlm9h0TEMadR
	XL4kW5eWupJqyzZGgRUlmvnchgfmItEyza1BVeR00780GCyYdV4pYxT3YIiwMgTv
	/rxAnsn5VOSS7/EWw9DoiI5eM7TflmRk/yLHv6D3xaoMcGglcU/n8yxWWnrKUlCu
	K5Xmz+iijCjlSm7clqdM/9TCrT9iswZViBpJfDI61ORBpTAFOBnAmraCnLAckxf7
	sLAtiAdBzag8IFUHJAcs7OisWVDpYEfGQEzUdDJHVuIVmpBvNSAaPQYm3d40ewRw
	57FgUWPKZouvmS7m3GDDz54LxpYihqhS9VUt+XL/2/OOJ3rx2KGUe91ZsQAwKUVr
	0rI9vg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0th8ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:36:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf9df2eabso693701cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782905764; x=1783510564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFcErPMbRrdovsdBegssaIpyzx8eIkEjsztaeNSdBpA=;
        b=OcCksVrDYUtuLUuNaczg1meuxhBmdSV0bC3DCbbOFBBzUqvJaoGsgngpQPCDFAZCxg
         9CBNCOG2vfcT2znfforN5RpGWmlzmRH2nnNv3zsZIzhZZW0PDuSBT0u8UylRgf/IQV02
         UwGgwAvl0CF9x9IGtPst+WCgmmZtgm7j5UUJN3AbknrQ5tkxl4Q5nELCs618pwtcBj85
         F0WcKSfUH22fxBrlUJDvsa1f7ZDIhzdvb9pgJckgnTW9+52UB0Q7Mc4iUvztTVvRAlKP
         J5BAX4XoHoWoinj2qIehWRmSqJNxXE0YXWS1X72++9tSeoUmvWPmxQFodb1Cr0EDfwgh
         K42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905764; x=1783510564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFcErPMbRrdovsdBegssaIpyzx8eIkEjsztaeNSdBpA=;
        b=KjmKqvEwOS654kIRUCCuYSrRyI6ROznbeDeVKmrzYAOY9xUm0ERLr7+JF5ErtAjwaR
         vsiuswID8PmOQ8PrbOv8U3knaWwRAY6wC3F/MWNV59mG3IThXxsHmuNN1pjetk7o/Xct
         gjIMaKeUD5hcPx9aN2Ba4W3TmSV7uNLsx99FDfEbXdRiSzZ/sx70ATNBzn9PshYV0TMC
         BwZr04hszOUFQrXPqGAnxYK3nuXNK9QD6SPupVm1aB5uGeV9oJc/HO8m9uCClRyqDACu
         AhevYVYxanGbPYGwqb/4i6UDkO9gDILRlsKhTRo9InS857ddaGgp+p+Pf80RFCoqjq52
         OOOA==
X-Gm-Message-State: AOJu0Yw6pAz8/bfrmFeNVIQUF8E7Q61WBvut8ccj/2e0FHm0OV7FM6po
	rNeRo/vCT/gpzC0e+nBIELMZADBn3iQYzQFMtpY9fw9TdyDGl6y9IZz5OjXD9bQL4rCcvM5RapG
	EZWZKJ2lB28j+17WCPKt6bqBB5QfKsbcWatT/wBSWFiigvYx7DIJg/l+Cob1Ntc0F3zCocKIsIf
	48
X-Gm-Gg: AfdE7clO+Avecva9CeBuIA4+p02esg3LVc4g0GCO+ekUt3eryjlMkexsdcZ6jIX4raa
	6VWUJn2NBVL4gK+NaHNmudWCilC6inlnlkdkX2eq1a3zNfsSiM9CGV6xvDFC8NcCOXg0+q5JwS0
	GEeJP5UTMGAP1K3vV4aAmJ+gEbiyBWSsonRuCiKmPpFpn0Vs5K7WxtjrRAs9yggPA9JsDO/2JGW
	HOh04Jii+ry5I69F9+TLqCKE8AcH6t4Z2GMdnf2dozSPJ02QKWCuIPiJ+ZUVBm7oo1iKEVKpMDa
	TGstWeZWj/kQs1hkf+6ODRVv6L03kPTngCXllF+1/7FEytvXXhMaU0dck2RLnmG1hD0gltzlwtR
	hZXiEIZVACClJ4uh0o6lfG8EADeqXtZZClHU=
X-Received: by 2002:ac8:5a86:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c26b392eemr8153611cf.9.1782905764392;
        Wed, 01 Jul 2026 04:36:04 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c26b392eemr8153401cf.9.1782905763876;
        Wed, 01 Jul 2026 04:36:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3a3d9bsm2567782a12.4.2026.07.01.04.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:36:03 -0700 (PDT)
Message-ID: <58dc9bd7-0025-4cd9-8318-960bd0136015@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:36:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: spm: Add MSM8960 SAW2 CPU support
To: Rudraksha Gupta <guptarud@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
 <20260514-expressatt_cpufreq-v1-2-487fd2d78859@gmail.com>
 <1bf1558f-19b8-4052-9609-52039f820bbb@oss.qualcomm.com>
 <6e3b1279-61c8-4bc5-9f66-e437140d3074@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6e3b1279-61c8-4bc5-9f66-e437140d3074@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: STsYMeE9BSZlBf6PZvXMdAXwnbTAdavQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyMiBTYWx0ZWRfX3BejFJ5cOFYO
 WSzHx25Ri99+Sdb6h4rvB1xKFa0e5OA197rlCqHKQ0fN2j21PY7IZ+X0jA656x9DXdl1gTBOD6e
 hnwI0UrZqWa37UQfKzNBXnDVNhssOac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyMiBTYWx0ZWRfX58mfAMEmDMzo
 xNmYL75YYuH6KT28ufu+B2OALbnEJMkxYcOiGelPFOOqKB87BT7XVY5ZgGvVwFjgsAXuS5hoGKA
 zfYbmYgFGMddE86HsmLNkNfwr6ZLH7XPogCODfsh6Hkr24qLsAh7wI1jN/VnMkHEM2PfYE90PH6
 6pkFkJ6gGb4iZgWjOG10hst+wB0TgYd3ePJ3lP45h+6fyjK59okj2sbNKefhxX2Jh1q27zpT7bU
 I9S4t8UADQuU/z3OGCIvvE8pVL+KgneWLIN+xp7nUjfa/Jz1qWAz4YlTClhw3MsVMXa0Xt4ug+D
 MdoamVJqb83HP9DYtZyXpto2eacyLX59VIJCncDMVoc8jj3AylXV1chhdpvRSjXCRIWzRyjivFR
 XTx1I5fmr5h0IMOItUfgoNRIlb0LSqRHl5Tt4nJeGS9GjHQpGAGjKBelyuAf3A9s8d574mdYdAA
 mdrv5eE4oU5R1XTE1WQ==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44fba5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=oA5LrNwOAAAA:20 a=9AdMxfjQAAAA:20 a=EUspDBNiAAAA:8 a=CQK_wUJZO3GTBjW-OcoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: STsYMeE9BSZlBf6PZvXMdAXwnbTAdavQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115692-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:guptarud@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 399626ECE14

On 5/28/26 5:05 AM, Rudraksha Gupta wrote:
>>> +    .seq = { 0x03, 0x0F, 0x00, 0x24, 0x54, 0x10, 0x09, 0x03, 0x01,
>>> +        0x10, 0x54, 0x30, 0x0C, 0x24, 0x30, 0x0F },
>> I can't see these values anywhere downstream
> 
> Hello Konrad,
> 
> 
> The .seq values concatenate spm_wfi_cmd_sequence + spm_power_collapse_without_rpm:
> https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3265-L3285
> 
> These are passed via msm_spm_boot_cpu_seq_list into msm_spm_data[].modes:
> https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3303-L3369
> 
> msm_spm_data is passed to msm_spm_init():
> https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L5510
> 
> Which calls msm_spm_dev_init() per CPU:
> https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/spm_devices.c#L221-L239
> 
> That writes each mode's .cmd sequentially into SAW2 memory, bumping offset:
> https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/spm_devices.c#L148-L162
> 
> The upstream .seq is the same thing pre-concatenated. spm_retention_cmd_sequence and spm_power_collapse_with_rpm are omitted because no upstream platform uses PM_SLEEP_MODE_RET or PM_SLEEP_MODE_PC:
> https://github.com/torvalds/linux/blob/v7.0/drivers/soc/qcom/spm.c#L134-L249

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

looks like the other modes (power collapse without/with RPM) are not
really supported - perhaps a good thing to add to the todolist!

Konrad

