Return-Path: <linux-arm-msm+bounces-63476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F03AF679A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 03:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE8CB1C28380
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 01:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586B319E971;
	Thu,  3 Jul 2025 01:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdFRRABi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA113194A67
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 01:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751507953; cv=none; b=SIuqH/s2R/faJmagztyq0TpgxQ0UDvL6rXb0c/nPaL4FkcnYfLJebS+26G8M3imR8Bq1NTLOIxCcDQEp5aj+suPThTxpkYhhOp0Tccn23FdNwCL78tBJrJJFW8piFoeQyLvBuxZgo1L4qGsHF4upAf0dnc2gcaDdhHB2zi2vhvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751507953; c=relaxed/simple;
	bh=HWvWupoVOUpxIVdmgPcGZapk7ubPy7BmqzGl82+G7oM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SX0VmKbAoN7kJsVWw1mw5aeezwmWQcmVgdY+/EBhzLr8eCKeJalbzeDk/Idl6ty9CgkFNPsnQaAUpTc5ETQS4Gzx7kJMwp/TYx1rNzfTMeq8afXRRAmL548V3QRjDuxz7QTnXzPIrApXcYcPdJvOMX+99Hev45lcSx4m7Hd0vpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdFRRABi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5630qhZf005469
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 01:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BLk20dvf/JzTQp3p5RGp6IdlyZiyxeKpevcy7m6Fu5c=; b=KdFRRABiqaelYO9h
	VB7lhgFrWTYQfNViFRaotOMOHThR4Sh6lZzaXDhIpXzGJSgBlOKkgfJuRvF+RsQ8
	Fpj7kgEbXjs2B/zrRtgvoEAYYeCW+JxbBRcVKTrSX6722rYERAvQOdWuYVBnL/45
	2wBqQUaFwwRf8TSZgGDwbfYahF2qutfudGG4tLkUqnzFCYkt5IhdJ+L/S5vxn1up
	ud9VN9jGVEqnXZvFcbg9RvF6p7QOEUusJA12gICiUZrz+eQHgfXaWk3VfvLhHOI6
	cERCQV7MADw//NL9OEXJwW+hbNzlBeGwWO6Y1WhjnOnVdh5mOYxsAbbvKW2wm46q
	J36L/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmej30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 01:59:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e1d70d67so37874935ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 18:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751507948; x=1752112748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLk20dvf/JzTQp3p5RGp6IdlyZiyxeKpevcy7m6Fu5c=;
        b=PlUNaHPNeyVzalTrNIK9nAonpVDoPF7h9WBazvkpW5j86B+Qe7+Cb/4o+fbzsoRbGM
         reMadr1RZzhlBj7TvkmRI4lbJucEu2CU6IlnI9MRIV4ONgki0Mi7PtPPrTYXBjbkTAQM
         YwwBvJOPdZ/Eb8NpBjDi9JUVVvdrCc1UAN4Iawn37OAAE44gLx7OIWNTSIgP0vG44m5V
         i0vyW+M+3Rd9GZ5fOMroFRS0JDhFEheZxzcw4VksNRE/nHG2VW2ey7FWUD+OBKd3FVsX
         QzVsuhxeUN6sIJbMcyOPrXWF3OQ71OO6TaZ4vN+7ud8wY7paDQ6blcK4ZOF7FA5fPEc7
         QFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5fbHTv9QyY6OXissrOQnSxSudLesckAwyxs8pzn7IFwYb0HLuz1ZQoQ59XPQjUd2mDYAaWnEVemMDe38S@vger.kernel.org
X-Gm-Message-State: AOJu0YwCfEHGasdZTGuLjCM+T9nFWL5DIeOpR54Bd6BUHYtDvf63V8rz
	nh8LV/MnD1rdU/6K9V3ShOanexuRpi7Olj+32TqI0xnl3hciruv6vjroa6m24U4+cSPmWgqN0oT
	rvvBgVY6r7V5PooiU6RqbYrlyfFu9q/QWjLDvpaU9HT50DP6nwwDbwNr82MZSTdijwudt
X-Gm-Gg: ASbGncv23GwhAwVQhfvV+NJrhC9eu3xfnRSUsmkSgdRkUiOBtuum78RzBTbyOtWzF/Z
	XpJwC15JlWBRUtroU9BNiZRvQ2byeknvduVpvBB7o3IfpET5cB95FMs7yt5WAw/DXVxyT9enAdV
	6aeE/nbERxLq9rPm9MxL4GoNuow4CoVZ36fE8TG9xSQpPZz9YYGm6OndH9wc2GwUEm4xI34XF4m
	sHD3tfXCKQuZUuXbJGxqW6lmxQlOH5RFHLbpCxoDw71Wi4CmCaJM+Z/2iWuh+GMf8LPAYvYANDV
	Xv9f7vpLcZjpIZ+clwMyYeigCSFeIFV+RuwReIAm1NUm+7r0Np/BQcEkl/lFGt9FDLzF9ewHOr7
	pwThWuPr/ol6sf/c=
X-Received: by 2002:a17:902:e747:b0:236:7165:6ecf with SMTP id d9443c01a7336-23c6e570620mr92655685ad.38.1751507948056;
        Wed, 02 Jul 2025 18:59:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjV6F4zIrWa0LJM5H7lesl+BJIP2s5KAmtJeAQvLyKOvf6L5XBeXUE/9AgT3s1eusgbYs4MA==
X-Received: by 2002:a17:902:e747:b0:236:7165:6ecf with SMTP id d9443c01a7336-23c6e570620mr92655235ad.38.1751507947568;
        Wed, 02 Jul 2025 18:59:07 -0700 (PDT)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7ab2sm138723935ad.177.2025.07.02.18.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 18:59:07 -0700 (PDT)
Message-ID: <8b9eb6f4-6f0c-458d-b1e6-a1893c35b81d@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 09:59:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
 <5f2a900a-3c8e-4b16-bd91-500af7d0315e@oss.qualcomm.com>
 <29ba0afa-9a1b-40f9-a174-d03902ea5d3f@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <29ba0afa-9a1b-40f9-a174-d03902ea5d3f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6865e3ed cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=unw2bX-B-0ReeQHatd8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: s5MP-kVPoCFFx24MYwJTqKBQmGH4k1NX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDAxNCBTYWx0ZWRfX0Y+dFnTnPGZ7
 a4dH92LWWUS5/9SHBW1Wf3RgPB64aa0xEukSU9u4thCENHYKvRdIiFRGPH9UXvEnXK3Ok0622Nu
 h76Gyd7PKbtw10Dqa+q1Py9ZvYmJHxkZ4xZeZrUaXZUhPCXSya6F5cl6k+0BhRa5C5KdtYUjYHb
 f2DwoTuYNXi7Tm0fJAQruU1HqpBVUespnwdwC9MuQsWqJEX/LtLIxujnABrKnekn6YrgclWcZ16
 7x045P+r+z8idWipInx2+BbYEyVbYEW3MfPvenBqZJEWD+XTTQDJ63oRtZhMHxZYtvjiaFFpixQ
 eV8kGgMxW/ZXa/5G+7GVhHtVH5w+HDvjv22x9Vm7Hm7ehimb7cJe8q0GFUUg+wWpehg1Y+V94vX
 yYeNQMXWmO1RlsF3pkc2WV+V6bw0P0pOJR4aOpSBdFQZvo0ogNWkP5Tx8AYiFXwbilozqBZR
X-Proofpoint-GUID: s5MP-kVPoCFFx24MYwJTqKBQmGH4k1NX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030014



On 7/3/2025 12:12 AM, Muhammad Usama Anjum wrote:
> Thank you for reviewing.
> 
> On 7/2/25 8:50 AM, Baochen Qiang wrote:
>>
>>
>> On 6/30/2025 3:43 PM, Muhammad Usama Anjum wrote:
>>> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
>>> deallocated and there is high possibility that we'll not be able to get
>>> the same memory allocated from dma when there is high memory pressure.
>>>
>>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>>
>>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>> ---
>>>  drivers/net/wireless/ath/ath11k/core.c | 5 -----
>>>  1 file changed, 5 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>> index 4488e4cdc5e9e..bc4930fe6a367 100644
>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>>>  	mutex_unlock(&ab->core_lock);
>>>  
>>>  	ath11k_dp_free(ab);
>>> -	ath11k_hal_srng_deinit(ab);
>>>  
>>>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>>>  
>>> -	ret = ath11k_hal_srng_init(ab);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>
>> while I agree there is no need of a dealloc/realloc, we can not simply remove calling the
>> _deinit()/_init() pair. At least the memset() cleanup to hal parameters (e.g.
> Why do is it being done in the resume handler? Shouldn't those parameters be cleaned up
> in resume handler? So when device wakes up, its state is already correct.
> 

Hmm... not quite understand your question. Can you elaborate?

> I'm not sure why it worked every time when I tested it on my device.
> 
>> avail_blk_resource, current_blk_index and num_shadow_reg_configured etc.) inside the
>> _init() needs to be kept as the later operation needs a clean state of them.
> So should we just memset these 3?

more than them I think. We need to take care of all entries in hal since current code is
memset them all.

> 
> 
>>
>>>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>>>  
>>>  	ret = ath11k_core_qmi_firmware_ready(ab);
>>
>> the _deinit() is still getting called in case ath11k_core_qmi_firmware_ready() fails,
>> making it a little odd since there is no _init() anymore with this change, though this is
>> the way of current logic (I mean the hal is currently deinit in the error path).
>>
>> Thinking it more, if we hit the error path, seems the only way is to remove ath11k module.
>> In that case the _deinit() would be called again in ath11k_pci_remove(), leading to issues
>> (at least I see a double free of hal->srng_config). But this is another topic which can be
>> fixed in a separate patch.
> 
> I don't think this is the problem as HAL is already initialized when before the system has
> suspended. So by removing deinit() and init() pairs, the HAL still remains initialized. Or
> maybe I've missed something?

Yeah, it is OK in normal path. However in error path we face issues.

> 
>  
> 
> 


