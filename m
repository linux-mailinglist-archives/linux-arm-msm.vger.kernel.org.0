Return-Path: <linux-arm-msm+bounces-103020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDH5KVSz3Wn5hwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:24:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB7E3F53C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8780D30269FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 03:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231752DAFAF;
	Tue, 14 Apr 2026 03:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTl2+scl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqKxplu9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609B1329C71
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776137039; cv=none; b=QXQC12SdjHbcN7ZPgwSk4M/E6Dp4ebsnp7IBUT3EdDktr4ugPbBbph3CBdf7weuYwGIkij5SQFeEYNsr5xZeaYW0vr0gUnTPyjCTGXcmL2MytZNnDurje5qVNRbExZA+J7GiULBzCSmsQMurvWdZjQYlsT6fQFZRecYcoBgqJEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776137039; c=relaxed/simple;
	bh=e+fdpsXXxqmh5T4lJEbG0vYDdBdc8dvNKOqB0Z6MDVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5vDeu0r6m77IaPkztbE5VKTwXDTjr1imzY05fgoN1Htyc5mcATEnBXPD09ZLKYrZ7LPHPwQyev467gbJNA2PFEOKbigYoaKq6YUzp8L889YyUK8JDRKzXiPHIBt2r3iN1ePop6gmf9mqQj5hiNPUV7E3GgJxguDWBlUwu9rV1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTl2+scl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqKxplu9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCWpa2386374
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o3R1wD2JeVV+ofiHbbAjdqUCiIXfouDrd59/7E1MjlA=; b=JTl2+sclBBXlfuol
	B5wp6P+mXivyeOPE4L5lUwfXGDFzfiByOy97Fb49mWjfcJXGQB0Hxlco5yDsPzvE
	CavE8jEHU04bR9UVfVK/dZiKfjQshn1E5BDIJF2dTuDTFZTy7gg2l/BvWomcyCJz
	IkIZPKPx2KzfFbPmeeVNE5OtxKGrN85xp8FaBfHftwpbTYokfvnqonypRDCGAK5a
	QIg57sFyonk4+7xN6D8npuEQBppy4+oixdF+cIP/lzfOAmGKquCd11rq//YyBs/L
	APHEuFMgwKgDJYDzHygkTJAo9OduvSH0TxeyFSsdAGnFNZlk7/6ezGDfW7LuHvpF
	wDjXhQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w0tpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:23:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9f68d00fso10056346a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 20:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776137036; x=1776741836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3R1wD2JeVV+ofiHbbAjdqUCiIXfouDrd59/7E1MjlA=;
        b=JqKxplu9FTOcbI4uhjzCL3C4z0SEY+QdPzj1yNNsVGgojytrCRyUDFIirxHtin6FU7
         awN6xHYvglxt7NbuhbIKo4Hiu4RCfNZdaO7A9+oLRU+COtvjW4coTZHQfsjy4bG2GaZh
         jiQp0S28AmJG44HquCkSAi4YvJJpcKBONrUBdsUxrXwxA9Q+16FQtUIHyBA6Vph8o4rc
         Xukgmw/6JT6gj+JvpWPx29tZDy9S+DsYm64I+NuhQsigpijBgWi4pTZufvYDiJZUwGFG
         Z/wmf9YEPMUef+33bGai44xx5K6o7lQZWzJjC2y4vWTLS1JJXkM7MFfsMdjJOHhENJD8
         Aouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776137036; x=1776741836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3R1wD2JeVV+ofiHbbAjdqUCiIXfouDrd59/7E1MjlA=;
        b=DzFuzRcLqUQIseJXhhErsQQIsFVPXQQl/NCbd4ngx9mwnAvjEOiv7dE3RwlwAM6kTe
         QzwAc+0+w8v5xnYYSwZR2e6/0Ffy5kx5GmUQY3DZ5NYVOp8wKXTHCAr9XKwccizIVChN
         nB57ZEI78bdbQ5OEiNJyt7rY4wtvQCcFGx2nzrm6wpqtvDFwhRQhNZ5UxiOkvmbKBrik
         bQf2XeR2Qsd7ExY1PhHEuRIviFPvTj85qFqFUgxqZW1LPCto9wUdVqogzZ0u58VP21Cc
         QmTiuEF2uocN9cpZpBd8sZMmx1vrzdGSY0euGztOt7nntq8fzz9zWn8/zWDByGai7qUG
         Y0fg==
X-Forwarded-Encrypted: i=1; AFNElJ8TNhUOSVkSj/riGiietXiN7tpxNFMK3Uf7DTgic2b/J9rkOGdryMHM6pl97uZ6tkRXHnhCuiPhxDIK35Fy@vger.kernel.org
X-Gm-Message-State: AOJu0YzLgctecs6M5vPjEf0METjhGobpoOvfDeuO5PWbNzBFXdCYmj1p
	L4QxQpu86mDIs1pjfUUeVgdlLq9q/gqOn1zzrC3fGUJ6KVR+J85UU4E01VoVWqBrQQCdh6mj4SO
	Y28OfJKZunSG/XWswmdzcIjnv9yd1TI95CMpBdDZ+pdOOQLv1/x4cxX/C1OVGEoN5k4Kv
X-Gm-Gg: AeBDievkySE1XF5yI0FVJJEOnhKwtIMvowMw8Y2kfSRUoChmmDCjppG4L6UepVKj0Zh
	wpnrRBKEOdnVhpoOnrqrZkQmxQA1NtfkxUUON3/2GkoRvVjRDoux+cRs7YaWojbGx/I/LpleF60
	wRnCuqwjLUb4obrXba9VKTrXAmHmXZ2SIgNDRTsLCY3hD5x4xsso45pELiCFhui8TjcNKutjU2h
	g0+edLhhwpiQoWw9a8Wdu2ncdC2CH4ITWWJVSx6DpX3U2f4devbm/RemgiLyG3kO1khHZlz8Ev2
	b70kaRmEvpyjtc/yUnueHcemcBfaXmrb3wTlQTJego3azBXAkFWxjAFCvW1yiXBFf0qS7D3zgD0
	aUqaimkfM0SmZZpCLTuZQULRGUMf3bXojkgJNwbcRDUl+isY3VVFPgsqd2hFURZUmUgxcMlgk0g
	Bp9h1j7165Lpsms6c=
X-Received: by 2002:a05:6a20:9155:b0:39f:5671:921 with SMTP id adf61e73a8af0-39fe3c9126bmr17960665637.3.1776137035671;
        Mon, 13 Apr 2026 20:23:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:9155:b0:39f:5671:921 with SMTP id adf61e73a8af0-39fe3c9126bmr17960628637.3.1776137035223;
        Mon, 13 Apr 2026 20:23:55 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79218fc462sm12018562a12.8.2026.04.13.20.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 20:23:54 -0700 (PDT)
Message-ID: <c6a9936b-9f44-4bea-93a1-17d145e64eec@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:23:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: Check glink->edge in
 glink_subdev_stop()
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-2-088a1c348e7a@oss.qualcomm.com>
 <adkF7EY1KVRNO01o@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adkF7EY1KVRNO01o@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -9lIdre9le7JuouD4vmc_nLBMJaNW_i9
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69ddb34c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6NDAGjaxIoc3lUqdot4A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzMCBTYWx0ZWRfX0S8alSe4XESl
 YTssOCCY4LrsDChNs4pxLFfG1SHrFET11Tdki5gVjOa5LXbxKrwM3/9XAl4786SfbKbHA6Pj7pw
 klR1LOI1BuldjCBsG6Sj3NebJJQUt0XZYxDdoJbiAgSP20I2rMEd3FHNXL9ElfBcoaXLkr/QaaN
 Miq8jXoj+1CKRhg2y3Ie1i1hvOYu8B/z91dYk7Vn1AimvLfld1lbJJqV3juYkRQVsT5n5dr5uDF
 OL1dijiueuwDNf2XsGku3EV+Z5j99pPIlsrozSoSUUH1UMZt1UxSFKc8PeG0dvOfMgn32K6YkWQ
 W3/a+uW4R6oIOo7ImP5789UHlHa5VYbvAESQ6jyyoBthvuuyI426/hWWlBRG+408FndLLnBnAQe
 wyRNTNezeiRe1kjkaETePHEa5WnLfkQcl8eufxuPsy5HP/8erOeO61GcLQEP3bcKnz0CPQTqyn8
 ecgILAsUf3xEgu1IjZQ==
X-Proofpoint-GUID: -9lIdre9le7JuouD4vmc_nLBMJaNW_i9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140030
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103020-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DB7E3F53C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/10/2026 10:15 PM, Stephan Gerhold wrote:
> On Thu, Apr 09, 2026 at 01:46:22AM -0700, Jingyi Wang wrote:
>> For rproc that doing attach, glink_subdev_start() is called only when
>> attach successfully. If rproc_report_crash() is called in the attach
>> function, rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() could
>> be called and cause NULL pointer dereference:
>>
>>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
>>   Mem abort info:
>>   ...
>>   pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
>>   lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
>>   ...
>>   Call trace:
>>    qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
>>    glink_subdev_stop+0x1c/0x30 [qcom_common]
>>    rproc_stop+0x58/0x17c
>>    rproc_trigger_recovery+0xb0/0x150
>>    rproc_crash_handler_work+0xa4/0xc4
>>    process_scheduled_works+0x18c/0x2d8
>>    worker_thread+0x144/0x280
>>    kthread+0x124/0x138
>>    ret_from_fork+0x10/0x20
>>   Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
>>   ---[ end trace 0000000000000000 ]---
>>
>> Add NULL pointer check in the glink_subdev_stop() to make sure
>> qcom_glink_smem_unregister() will not be called if glink_subdev_start()
>> is not called.
>>
> 
> You mention the actual root problem here: Why is glink_subdev_stop()
> called if glink_subdev_start() wasn't called?
> 
> The call to rproc_start_subdevices() in __rproc_attach() makes sure that
> all subdevices are in consistent state when exiting the function (either
> prepared+started or stopped+unprepared). Only if all subdevices were
> started successfully, the rproc->state is changed to RPROC_ATTACHED.
> 
> In your case, attaching the rproc failed so the rproc->state should be
> still RPROC_DETACHED. All subdevices should be stopped+unprepared. We
> shouldn't stop/unprepare any subdevices again in this state, they all
> might crash like glink does here.
> 
> We know that subdevices are already stopped+unprepared in RPROC_DETACHED
> state, so I think you just need to skip rproc_stop_subdevices() and
> rproc_unprepare_subdevices() inside rproc_stop() in this case, see diff
> below.
> 
> Thanks,
> Stephan
> 
> @@ -1708,8 +1709,9 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>   	if (!rproc->ops->stop)
>   		return -EINVAL;
>   
> -	/* Stop any subdevices for the remote processor */
> -	rproc_stop_subdevices(rproc, crashed);
> +	/* Stop any subdevices for the remote processor if it was attached */
> +	if (rproc->state != RPROC_DETACHED)
> +		rproc_stop_subdevices(rproc, crashed);
>   
>   	/* the installed resource table is no longer accessible */
>   	ret = rproc_reset_rsc_table_on_stop(rproc);
> @@ -1726,7 +1728,8 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>   		return ret;
>   	}
>   
> -	rproc_unprepare_subdevices(rproc);
> +	if (rproc->state != RPROC_DETACHED)
> +		rproc_unprepare_subdevices(rproc);
>   
>   	rproc->state = RPROC_OFFLINE;
>   

Hi Stephen,

In this case, rproc_crash_handler_work()->rproc_trigger_recovery()->
rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() is called,
"rproc->state = RPROC_CRASHED" is set in the rproc_crash_handler_work
before rproc_boot_recovery is called, so checking RPROC_DETACHED can
not work for this case.

Thanks,
Jingyi



