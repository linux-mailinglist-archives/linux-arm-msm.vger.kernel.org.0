Return-Path: <linux-arm-msm+bounces-91215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aR7ZEEDpe2mtJQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:12:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F9EB598F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF74C300D945
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 23:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8232736BCEF;
	Thu, 29 Jan 2026 23:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cV/4w4pi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+nWxaaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96BD37417C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 23:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769728317; cv=none; b=oncwoeNI8qOPpGHU2Rsg20vKzIqrtPwEMgmstCbJN7Xpm3TaefnaMkZB0TwvG5HB5oq6cFVx26Eno/i2JsbFLXkaUjAVypewyCdWBk3AQl+zbR27aKqFMsgJvCim7n0jjkoeInkXCl6J+E0smg19y3F3ahorULVF6GkxmrsmsHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769728317; c=relaxed/simple;
	bh=feKx2XgRppBAS+da4AKWUbGnKKJhvX81NOvLXTMK91Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLtREc/YOujqaD3R8ujIQ7brV6BvuUBcAY6BxVflX/d22NGqFQiO53k211pcRjonhLFAwKbSTKpD6DwrI80D0Z8cbb17W61MEelTgQKP3m5BSwRCLN3Tpz9Za+Pus/LHAdU0tBaArFZyb7T2WDbbGtjT8ELtUixZtYWMrkWl9ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cV/4w4pi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+nWxaaz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TMu3mD326121
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 23:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89kn9cIywTgIeyMqlINACk9/dbA4ThsTQsRHyMovJ0k=; b=cV/4w4piaNSrExHx
	ZyaYNAJydrK88D3n3jo6Fxy9bqdsFuZg7rHwfg7ySqMgShjuJcfxfIp8wbp1cCSa
	GktkC5QMSbJTqAONiq+XVEYgOCO2Cw+SUhmaB2MSanI357vDFNdrNABKKpwB1Zfg
	q85ciEOpXl8PQuionde3wEnGOD+6J7PwMWtdISXVTfvHVQP4NGdb2Gk8/cRxlNId
	/oLsUqVbmOAwtOhDt6ilhVypBiSl79BFVL28b4aY/ELUwmpLSzyiOS0Y3FpfRnEQ
	SSP0zjPvgCoEEfI/vCFJCmwVxk16AXXa5PItk32ipjJDgyslPn8zCXRQYll1GJ1I
	YlvTOQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7r13f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 23:11:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c56848e6f45so1001151a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769728307; x=1770333107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=89kn9cIywTgIeyMqlINACk9/dbA4ThsTQsRHyMovJ0k=;
        b=R+nWxaazfM1ZvkAjRt/Smk3gFbrH1+B5kCd7gpAC68gWu/MLHsXT+be+qPt7JuyUYl
         9pqLRtCDCLuzXUC2EsDtWBHiMl9jmBYNsd0fj3VUiAIjA87vwlxZAKy4jVwN9siGCAli
         Izrs7Yqm8yQlvquXRjizdfvxDsTEXXecenWuSuxdZ7vwDNihT3wSuqqqEndD5BbDtZgr
         VJR4Z9ImhEa3bu5m3AWy6nTv63i6vDJ+1BHMVk3Yg6RDjMD09dUivLsghcBqiEEhVUC9
         jGQqj9bBN62zPJHn/HUAH8Q8PPyoW1t2PvXJs0Ufd2C/1ANgrK1lVpTJ8hS4arFnPZxi
         B85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769728307; x=1770333107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89kn9cIywTgIeyMqlINACk9/dbA4ThsTQsRHyMovJ0k=;
        b=iT05K45BOKpnX43OqNS7+RtUH0Q+nB3w5iUvq5EUSJ8HPOgsFn/+qS7VhOgIUgo5fh
         fT6ER/ki2IN8QnF2iyFPdS4oOlUGcs8Rk8URuA5c3Yfluy9aSRvTIUBgrBe7WMR7ZaUQ
         cFZZpD6C6cSkIVL1L6Wzsjacoh666BA/rkn4uFqXK4UzgpV3srF2/7WPnX8uj1iksugK
         I5hvfrweXL0aF7w62rrG97Q+euOX/ZAQoK/vrcCVcSq/2mWU8v+c4ljNng604XyT4eN0
         WtsbyzUKEr1sXqxDRBCZ3IfTbauc6iJ3au099NlJIkxJ3a9A7zOnzLh3wZaWgpI0v6Kr
         xfQw==
X-Forwarded-Encrypted: i=1; AJvYcCVtyrBTGV3UF/6gYO05kLMDvuCB3YU+f+1DdgS2akGogKir9hx7hj9Xd/F4OI36915XlrlC2A00xdpChWdM@vger.kernel.org
X-Gm-Message-State: AOJu0YzB480O/VXPGPERU/pkkX3KV6xEYztp3lWNEQClzg3p9VVh8ESD
	z5q4GLf0BP9/tnlRYFkkD1HIzbA2upWw60ruw/WjyRFmCUQX3jNGtFA1VKDjdVkEyQM1quac0uL
	WSQC1vlOSX1BmtQ5ePlejhiXScBZlmCk/0V9FnEf9LJG2GkT0vqDIkJwTQFHGKt4mDOoDECiGnr
	a7
X-Gm-Gg: AZuq6aIc3MTIyrcd6hKOK4/1h65yjuOLpTYjLVMWJ5/5ibyix0ZiCjhc/sKgKU+TvEB
	GN5LJrvcYRzGxaXEu72KRKkRISfcHIAXWUHOrb+Kco0B+s0ay4VnmOWxHb3vwwXoWDwA36Eo01o
	t5aFFnUFdPDAfRQPvFEAvfrTyObpV3IRKHa0jXqVa4fq5VIsciueM6C/gPUcStFmmNw1w+wgLw0
	aOBQ6gbJlCI1DYsRN8RWaPqB6SpEUViFmbIzgnExahFqAbexXeaOYBJUcWqy1c/vhQr4qdivr0a
	0e6kQO+9DyIRf1GSXh/KjO8HTDyhz+9zxrDotO2UhQEAxyGnhI1eMa7tAsNPN4rx63ykQEnuih3
	2ExnuzOe2XmpiXGedlVaPNvjPSFgd+6bCSw==
X-Received: by 2002:a05:6a21:2d44:b0:38d:b865:3a31 with SMTP id adf61e73a8af0-392e00fbe3cmr576789637.38.1769728307025;
        Thu, 29 Jan 2026 15:11:47 -0800 (PST)
X-Received: by 2002:a05:6a21:2d44:b0:38d:b865:3a31 with SMTP id adf61e73a8af0-392e00fbe3cmr576765637.38.1769728306488;
        Thu, 29 Jan 2026 15:11:46 -0800 (PST)
Received: from [192.168.1.3] ([106.222.231.147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642afc045dsm5956321a12.35.2026.01.29.15.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 15:11:46 -0800 (PST)
Message-ID: <4c2faa1d-504d-4642-90d7-8db21b99d7c1@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 04:41:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions About SM8550 Support
To: Aaron Kling <webgeek1234@gmail.com>, rob.clark@oss.qualcomm.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org>
 <CACSVV02HKpEGQ6cAhNQ8a0YiT0nXHVD8=yXOfONz=1Amac+z2A@mail.gmail.com>
 <CALHNRZ-4oM9Kpx-umvdYaMXDwBtny5HHpe1PWzFcJ9=3m0s49A@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CALHNRZ-4oM9Kpx-umvdYaMXDwBtny5HHpe1PWzFcJ9=3m0s49A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDE3MCBTYWx0ZWRfX8Kl1POdyVpza
 HCH5sEY/g0777cp6w8/pqaW9Cl4KViusQeYLgcX77IV83mdS5h2TrXs5g5UM/KTZPqQZUdDEZjt
 Q/HYsoSOYO18afR90f/7N0I6990Am8R0TS03h2KMHLkjleXOOa4v51uH1I/A+RUUhvKeymY1DKz
 KJPqFQ8TCYISNplpORDPmFNBnIsPMmKK/KdsgtlUQkG0Ht8kChzz1adCpvKsNu14jBTegLbQLQ0
 9V65jXeBGGWSH4PthFTWPxZMnuZR/wU3ckkYp+gsPPhcAQ63oHrvpKLSoVsTA4ZEBkVasVvG2mg
 IL6dX3hux/j6zFlP7HrrOgf+jqMAkvYKyTiF2U2E5Nu/vdmSLOta8cMqV0nmifUX7B9Kh4r2aRb
 wVwP303S22o+VMUzNeWMXoaVzry70TGMI56ta6gpFv/mSkmqnsDFGem48aw3aEACaL+1svCF+9h
 rgktyRoIOIjZTTfKKPQ==
X-Proofpoint-ORIG-GUID: NOzeVP8ENhNFGrlHSpyMTwWjxWeL3I_3
X-Proofpoint-GUID: NOzeVP8ENhNFGrlHSpyMTwWjxWeL3I_3
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697be93a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZveB2507E6DkPBHLdDca7g==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=cbgVeahrV_TtUdM11xUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290170
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91215-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88F9EB598F
X-Rspamd-Action: no action

On 1/28/2026 11:24 PM, Aaron Kling wrote:
> On Wed, Jan 28, 2026 at 8:46 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>>
>> On Wed, Jan 28, 2026 at 12:54 AM Neil Armstrong
>> <neil.armstrong@linaro.org> wrote:
>>>
>>> Hi,
>>>
>>> On 1/27/26 23:48, Aaron Kling wrote:
>>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
>>>> for Android, using mainline kernel drivers. I have come across some
>>>> missing functionality and failures that I would like to inquire about.
>>>>
>>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
>>>> mainline. Using changes described in the gunyah watchdog thread [0], a
>>>> dtbo loads and the devices boot as expected. If any of the changes in
>>>> that post don't exist in the base dtb, abl will fail to load the dtbo
>>>> and go to the bootloader menu. This appears to be an issue in the
>>>> baseline abl code, affecting all devices of that generation. Would it
>>>> be allowable to merge a change adding those changes to the sm8550
>>>> dtsi, allowing an unmodified mainline dtb to work with overlays?
>>>
>>> Any addition to the DT must be documented in dt-bindings, so if it's needed
>>> for boot they should be documented and added for sure.
>>>
>>>>
>>>> * SM8550 does not have cpu opp tables, thus cpufreq does not work. I
>>>> have locally copied the commits from sm8650 and adapted for sm8550,
>>>> and that seems to work okay. But no measuring of bandwidth was done,
>>>> so the numbers are likely not entirely correct. Is there any plan to
>>>> generate correct tables for sm8550?
>>>
>>> Cpufreq works but not the interconnect scaling, so doing the same as sm8650
>>> is fine but since the values were calculated from downstream DT tables,
>>> the same should be done for sm8550.
>>>
>>>>
>>>> * As part of a series to support the original Odin 2, a patch to
>>>> update sm8550 EAS values was submitted [1]. But that series stalled
>>>> and this was never merged. If this change is valid, which per that
>>>> discussion it appears to be, can it be resubmitted by itself and
>>>> merged?
>>>
>>> I missed this patch, please re-submit, I also need to update the ones
>>> for SM8650.
>>>
>>>>
>>>> * Per the mainline kernel device trees and audio topology provide by
>>>> the oem, these devices use primary i2s for the speakers path. There
>>>> was a commit adding clock support for that as part of an hdmi series
>>>> [2], but that seems to have stalled. Is this going to be picked back
>>>> up?
>>>
>>> No, I do not plan to do this work, it required adding callbacks in the
>>> code to handle the clocks like done for the pre-audioreach firmwares.
>>>
>>>>
>>>> * Inline crypto fails to detect hwkm support. And I see other logs
>>>> online, such as for the sm8550 qrd, that logs the same way my device
>>>> does. I traced the issue to the check for wrapped key support [3]. On
>>>> my devices, the derive call is supported, but the other three calls
>>>> are not. I was pointed at the downstream headers for sm8550 support
>>>> and only derive is listed there, the other three don't appear to be
>>>> used in the downstream driver. Is this expected? And if so, will this
>>>> case be added to the mainline drivers?
>>>
>>> Does hwkm work with you remove the last 3 calls ?
>>>
>>>>
>>>> * Some gpu related clocks complain about being stuck off during boot,
>>>> causing stack traces, but the gpu does work. I tried to do some
>>>> research into this, but quickly got lost in the weeds and I have no
>>>> idea where to even look.
>>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
>>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
>>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
>>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
>>>
>>> This may be related with the display handoff from ABL, did you add the
>>> plat region to the reserved memories ?
>>>
>>>>
>>>> * Sometimes when starting rendering, a bandwidth submission times out,
>>>> then the driver immediately complains that said id was left on the
>>>> queue. I have tried increasing the timeout, but the same sequence
>>>> still happens. Timeout happens, immediately followed by a matching
>>>> unexpected response. Implying that this isn't actually a delay /
>>>> timeout issue.
>>>> [ 1848.517020] platform 3d6a000.gmu:
>>>> [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
>>>> HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for response
>>>> [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]]
>>>> *ERROR* Unexpected message id 1015 on the response queue
>>>
>>> Weird the timeout was extended for this very purpose
>>>
>>>>
>>>> * Some 3dmark benchmarks such as solar bay cause a gpu crash. I am
>>>> unsure if this is a kernel problem or userspace, so I'm submitting
>>>> here first. If the consensus is that it's a userspace issue, I'll
>>>> submit it to mesa.
>>>> [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu
>>>> fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
>>>> 00000001512E9000/003d ib2 00000001512E7000/0000
>>>> [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_worker
>>>> [msm]] *ERROR* 67.5.10.1: hangcheck recover!
>>>> [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_worker
>>>> [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
>>>> (com.futuremark.dmandroid.application)
>>>> [ 1860.258126] revision: 0 (67.5.10.1)
>>>> [ 1860.258132] rb 0: fence:    2884/2884
>>>> [ 1860.258133] rptr:     36
>>>> [ 1860.258134] rb wptr:  36
>>>> [ 1860.258135] rb 1: fence:    -256/-256
>>>> [ 1860.258138] rptr:     0
>>>> [ 1860.258138] rb wptr:  0
>>>> [ 1860.258139] rb 2: fence:    41563/41569
>>>> [ 1860.258140] rptr:     1752
>>>> [ 1860.258140] rb wptr:  2319
>>>> [ 1860.258141] rb 3: fence:    -256/-256
>>>> [ 1860.258141] rptr:     0
>>>> [ 1860.258142] rb wptr:  0
>>>> [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG0: 0
>>>> [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG1: 0
>>>> [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>> CP_SCRATCH_REG2: 41562
>>>> [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG3: 0
>>>> [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>> CP_SCRATCH_REG4: 3736059565
>>>> [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>> CP_SCRATCH_REG5: 3736059565
>>>> [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>> CP_SCRATCH_REG6: 3736059565
>>>> [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>> CP_SCRATCH_REG7: 3736059565
>>>
>>> @rob do you have any idea how to solve this crash on a740 ?
>>
>> The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate that
>> something is unhappy about gpu pm.  I'd focus on that first, since
>> that is almost certainly the cause of the later issues.  If things
>> _sorta_ work (rendering UI, etc) you could try removing all but the
>> lowest gpu OPP as an experiment.  Could be that power related problems
>> surface when the GPU ramps up to higher OPPs.
> 
> Things work amazingly well compared to what I was expecting. Using
> mesa staging 26.0 as of yesterday, I'm getting roughly 80% performance
> in the benchmarks that do run, compared to the stock Android. And
> rendering is correct everywhere that I've seen so far. Mesa 25.3.3
> gives about 89% compared to stock, but there are graphical glitches in
> some of the benchmarks.
> 
> I set gpu max_freq via devfreq to the minimum available frequency and
> ran the failing benchmark again. It completed once, but failed with a
> similar stack trace on the second run. And per sysfs, the gpu did stay
> at that minimum. Of note, that causes the benchmark to fail, but
> rendering does recover and the unit is still usable afterwards.

In sm8550.dtsi, I see that ACD values are not specified in the GPU OPP
table. Can we add those (from downstream dt) and try again?

Also, are you using the latest stable release from Linus?

-Akhil.
> 
> Aaron


