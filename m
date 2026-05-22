Return-Path: <linux-arm-msm+bounces-109209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGjDKYYjEGqsUAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:36:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 115135B149E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC3B83022542
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7993A6EFE;
	Fri, 22 May 2026 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWRlE47f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hl8IrstL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACDF1A6806
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442009; cv=none; b=biaqKvxZKvdkVfNydP9biKH9zI0jROVqMGeC4dEjofP0J/1C5agaGooBTdxvdibXNcA3ERgBhahZjJSpR7AJ6ZPsCRYaBmEIRXmhV5Xyex/gGoi1IC+0oxi4EKOrQDllaWGw/Re7uJflc1YKXSPmtmNbBg26s96jonAtGLtz63o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442009; c=relaxed/simple;
	bh=WPs1CELaB8cKKo/eZJDS1l+4Vrtrd7a0U+MH2Wyx1kg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=icY3Jo634p0oVzfQ1nHRMpGzqnuzBPnq/ACvyysKC/J6DUFEs6whTASrU36H98IANBv1ZPwfJa3AGSqt9N9TMVALKzH07PKhm53guzUFlEqa/66lXwX5A2NY/lnRKXcD/WC1s+upVn89Pw5s7hsUgsKEZ1CdWxDoWjKF2y3t1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWRlE47f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hl8IrstL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9AmCr1816091
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkohdRv0hYpwmivlUhyctq3yN1gqK2kdhsTeAB33BNA=; b=GWRlE47f/yFOx3Cc
	JqhrPiKmAWZcmKD6MriMpRW8YJdUhtLMRhPN1zFHiy5eMzG4xkuPbrsLIKyVb+8H
	tmFx25Efp+l2zBgqKfx2SSXfWW/Osvo5ZM+tInBxLG9ivOkXoCGeh/M88PCeEiQJ
	HEJ4o7uaflGekxSvSstffuo1if3R4c15Y4AQ3389+8UJu+CqVIbOR2DppC1txZb8
	YAhDHDdhJntf4SUs1VL4KBIW81hkW7wMG8YhSD3twacmtmQ7JXzCsBKVU8QU9llr
	1djhELjVsACmXgzdZyF/F17d5FLCEqnkPIbGj6YJkmuO2Q7A6XSkBpasXdJbnIOW
	NtQ+vw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm1a6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:26:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3662668b825so14081427a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442006; x=1780046806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkohdRv0hYpwmivlUhyctq3yN1gqK2kdhsTeAB33BNA=;
        b=Hl8IrstLmB1RfU9L36sGr/KdFx2svc8UXLvsMRhQvgHz8JeAf6j+WKG3nrIMc73Loi
         olejv2cCoG1t7CgLVK2s2ojhmwk8nRxACsVnNa6GogSiw/MXiP6tokcOykG3jxTOmodV
         ZDjU6KxOqX97UnJpYxvD6aZyzVKHLMlPx+W3vjbpydtnPYnDv76BgMzmeBl1U4CCQpl5
         Ml7iQJbFy7Vk5Je3ElmNCniEMnlLfNOb3BBM1Rdvve2wA7MIelKuPWXKmwmk6tRzUo/y
         P66AxxqN6q8wRDIdCfJUgmOJie93rdieXOmv1Zz1cBULJUpflKMISCGJJCq04YGUcJfg
         NQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442006; x=1780046806;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkohdRv0hYpwmivlUhyctq3yN1gqK2kdhsTeAB33BNA=;
        b=Wdd2hz6Q0fNslDV5C868eiPdz2DFGUmARYJJZsKu6eH+561OBiJWmvFYpBkwE+6//K
         uKsyYU1u5xQerCNiwo9wUUxtcJDgWiENq7kNkKMFQRNpltK6bhNvBPLNsKMek0gUndnH
         k2R/lXCcCpf9Rp+G4FKmJDo491ohGi74t8DjdAfA/F0xwuwxDsQFAfEMZONiOQj1NhYV
         UV6KveNugHBQkzpeVo9gFqTh2RNvYbk5cO3zLGbvqcZB8LBw2k6A2jVPY2o3xsBNp4gp
         24ytYoNCm+pOhXaMi4DMkfdDBmaDuJ9/nFR2hcLo8Lb+0ub5ef4BFRitIGiM0LJx9o/K
         BtWg==
X-Forwarded-Encrypted: i=1; AFNElJ+nArihULdWK0vr+7Srau7B+ucoPv2swSW+XIhlaOi8LvTDGt5q65XveqHc/OFGJQVShJ3YQXrskpnqO1k1@vger.kernel.org
X-Gm-Message-State: AOJu0Yze2DhYKuZC/i/cvSSI76a6Pjov0y1gRtGpC0rs5G4s+mbgknvC
	k1sM8gtidij8WjjQF8GOuqfokQVpNblgxE53SV52QylGvk9DEfCTv1YYF9Cw3/1tRA+i544aSAo
	gjGzPXPwjV+yX334RgJxDzm5ib5yT1HfmMOd8+XOUfRiDGM837YZ9zMDnWMPe8i0JFlarFeLhnm
	jW
X-Gm-Gg: Acq92OH0JE1gIGVgB1ZLEIGUjTSmnsO9kNyMj4M1OHo+KPmTRce8ioM1JNjeyMtkqhe
	6bhWqWrzxGpaHb8eqIsvrW7CkcFlTPDiUZu/myLK13SyhfNtrUb3KXxU95qql8zQa3Zv07GNwyh
	mSPOl5lUfuLfHy3GEPLTlJwyqR7cGK9UhPlKgc4ymFQBlcI5o7BdlM60HlFMey3ZIJNEFM7gI2+
	pKVz/Ab5eHR0XdYrqMf7MQTpVGjvLM7HG/nW1bxUIziyZjOw24xrvJCx9s4SI4AaUrntpJRzDjt
	Ke1GZZPRzAUPAA191PeJfWpp7vdakRNPLnpaT3Z40S7MnQ1UQQgUaWxIps9QmJRpR1iNTdnEdM0
	rUQ6eeSiNDimdZS7reSfbt3wHdwSb1ySPNpj8FYerMVget8fYHX8=
X-Received: by 2002:a17:90b:3cd0:b0:369:a962:8cca with SMTP id 98e67ed59e1d1-36a6771bd1cmr2945519a91.11.1779442005635;
        Fri, 22 May 2026 02:26:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3cd0:b0:369:a962:8cca with SMTP id 98e67ed59e1d1-36a6771bd1cmr2945492a91.11.1779442005072;
        Fri, 22 May 2026 02:26:45 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4cd92sm1305044a91.10.2026.05.22.02.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:26:44 -0700 (PDT)
Message-ID: <4f436ec5-28c8-4044-9427-90a893e0e9c8@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:56:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] irqchip/qcom-pdc: Configure PDC to pass through mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Johan Hovold <johan@kernel.org>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
 <eizcoxjnjgbobjwndnq7gewqnynnm2o2aqhh4muposgnhhagaf@tnomg2p4uj27>
 <771a8f63-90d1-45b5-960e-342d9041fc4d@oss.qualcomm.com>
 <0df69fd0-92f0-4daa-af15-56163b812741@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0df69fd0-92f0-4daa-af15-56163b812741@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TJMoHvx5znEioJdC5r1nCVXeUjYWeSMG
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a102156 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=lMnvkBTLgxR_eHXLjrYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfX2HyeevpR4Ssm
 6OMKdZxP7GnDD6hyjnR3l0GSl/pZFBASEnnbkFzhh8ZR1j3pmaDSlO+4dZUSTSrOiWRqyxiO295
 7Av6NDsf4MDVirqsEioC44dT6xNzqSWQvdEG8VcYdVaCf+hZpkYHdUyTWFJhxcnidI6JwOiO0vg
 nS2Z1H5mjKst/bXMD05KPd4t9qbA5IIek8Hpe79cwPhXCuestLQZIEBNPna1j3jq8byQ0T07RGw
 WBZQezTwElQnGixRKEGRhQcantOmHIaTmHRRu0WBSmIl/UQCBvCDVnw5wRp3h2Hs5wXiO2X9jP9
 UCZpegX8gqeO0g8XG3/5Q1f1fIuoDiPFcOaBZW9Ri0WdqXslckYKvy2SUrTyUTMAj3MZ5/ZahC4
 LhHIYSVtHrd0UppyjHLtC0rlg4hUg9pcvLPjxDORRDDWFeuv3c85u5JS0gr9F/zzVIhdciEhQCu
 JF/dEWdJGJh9FCrqtHw==
X-Proofpoint-GUID: TJMoHvx5znEioJdC5r1nCVXeUjYWeSMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109209-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 115135B149E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 5:19 PM, Konrad Dybcio wrote:
> On 3/13/26 7:40 AM, Maulik Shah (mkshah) wrote:
>>
>>
>> On 3/13/2026 7:52 AM, Dmitry Baryshkov wrote:
>>> On Thu, Mar 12, 2026 at 09:26:37PM +0530, Maulik Shah wrote:
> 
> [...]
> 
>>>> All the SoCs so far default uses pass through mode with the exception of
>>>
>>> Is it something that must be configured by the bootloaders?
>>
>> yes, currently changing the the mode can be done from secure world either at boot
>> or after boot via scm write.
> 
> ..which won't work on almost any X1E devices, except CRD and IOT..

The series "works" for all x1e devices with added SS3 low power mode and GPIO
interrupts also continue to work for all.

> 
>>>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
>>>> boards whereas it may be set to pass through mode for IoT-EVK.
>>>>
>>>> There is no way to read which current mode it is set to and make PDC work
>>>> in respective mode as the read access is not opened up for non secure
>>>> world. There is though write access opened up via SCM write API to set the
>>>> mode.
>>>
>>> What are going to loose? The ability to latch the wakeup sources on the
>>> CRD?
>>
>> CXPC (SoC level low power mode) would be lost if the device can not wake up from GPIO wakeup sources.
> 
> To the best of my understanding, that's only because your approach chooses
> to ignore supporting the secondary controller mode and force-reconfigure,
> since GPIO wakeup functionality is otherwise available regardless of the
> mode.
> 

Yes, secondary controller mode was of no practical use in Linux and
hence the v1 series chosen to ignore it. This part is captured in the HDD
(hardware design document) too, 

"Some of SW platforms can’t detect all type of interrupts [..]
the ask is for the PDC to act as secondary interrupt controller [..]
Please note that not all SW platforms might enable and use this feature"

Linux did not have any problem working with all types of interrupts and
hence did not want to enable and carry this feature in Linux PDC irqchip.
This was added for specific windows SW platform requirement and was never
intended for Linux SW use.

Saying this, In v2 series adding the secondary mode support and with that
PDC irqchip driver will have capability to work in the secondary mode.

>>>> Configure PDC mode to pass through mode for all x1e based boards via SCM
>>>> write.
>>>
>>> Would it make sense to always use the secondary mode instead?
>>
>> No, it would not make sense to support the secondary mode in Linux.
> 
> Why?

Above reply covers same.

> 
> [...]
> 
>>>> +		 *	- Inform TLMM to monitor GPIO IRQs (same as MPM)
>>>> +		 *	- Prevent SoC low power mode (CxPC) as PDC is not
>>>> +		 *	  monitoring GPIO IRQs which may be needed to wake
>>>> +		 *	  the SoC from low power mode.
>>>
>>> This doesn't quite match the description of "latches the GPIO IRQs".
>>
>> It does, PDC would continue to still latch the GPIO IRQs (as the mode change failed)
>> but PDC won't forward them to parent GIC as they are masked at PDC with __pdc_mask_intr().
> 
> Can you not refrain from masking them then, and clear them upon reception,
> with a write to IRQ_i_CFG[IRQ_STATUS]?

This needs other changes too apart from clearing them upon reception.
They are part of v2 (to be sent).

> 
> The HPG states that this mechanism is only engaged for GPIO IRQs and that
> the forwarded interrupt will be of LEVEL_HIGH type (which is what TLMM
> accepts anyway)

TLMM isn't much used for IRQs which are routed via PDC.

Thanks,
Maulik

