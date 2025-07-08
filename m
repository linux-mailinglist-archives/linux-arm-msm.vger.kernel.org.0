Return-Path: <linux-arm-msm+bounces-64017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A97AFC887
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D4331747BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFE8269808;
	Tue,  8 Jul 2025 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gbgvtn8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685642D877F
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971150; cv=none; b=hoUbh4Gd9oeKVpON9K/RSHL3raft/koTMiPZIF7R97byBGdVYtzdVJBVswyxs2fKv5DUGpOW/y6s6fpd5SV1xR9ix+9HolRCISAiuv6ALGg9eLPBIVacpgb/wdljH3jFKF68j553pHprlq0eeNFIMQEyf3PNWDNaY5t9k/wSSI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971150; c=relaxed/simple;
	bh=1+K2vStuMbWEvbxNn4v5jMkIEs47um7WuK/tPjoaTZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WD43cY6rmDmYyVNgV1t3klw+PzcLmt32WucAWpfnYGTyYKv4o8y636hrj0jDlwmxDgRaFm391PtuOb4qPsf8ceSNv69SWXyPTZNtQ3X9MOBWkYszSBktGWjNVUxpfSg/A6zfxZPb9KylOT9gdPTKNChKoNIB5+fayEbs7CUq8Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gbgvtn8U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAOFk012091
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 10:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MBWTgG1nt7QgnG2L1PdtfNApAGuuPN/fOFc0QPePaMA=; b=Gbgvtn8UMww41wns
	B5/R2pshzbfIbdd3D4bOEe4XGEu0os7l3mMaoJjdWOzdBFsGtF/CMQZAqlv5OqSW
	m6gyEdjx3Z5t8UblYJImazagnYYGrZY9hWnwpyvHQ6aNDXZa4gmcn1cPIZa2faxX
	wDckYvzBUiFW0iEBI8L7+EWtY36HgsRe8LF10RAG38CqqwmlpTCCqPwUZcivdaYI
	NQ7a2LgV4d1uFbITP+rWDruwf/jFM8fEbiMFcLWApIOmX2stZNz5B5vWIZwxf9wY
	NnovWdEcBGEAzkLi2yKZNWwXzj/wdoTusg5QRyeTqY7jI5uH3N9Om7FLUmOVlQj9
	KfuVVw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97m57h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 10:39:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23494a515e3so32323595ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 03:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751971147; x=1752575947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBWTgG1nt7QgnG2L1PdtfNApAGuuPN/fOFc0QPePaMA=;
        b=Ns9tsMrGjiduiZsME88X8krXyGEEk9TxnnJQcDL0aSA8Lc292i4t73sXP7PA5NEDjs
         JucHS4wFMXUpuC0DpdcLnU96SuftUgdK16VQJKgwcLX02C0Rc0lPhsuXAB23QeiaCXGs
         SD1HT0YiMNoPL8NEkOQW61om2BuxaYNVXKP/+ioh8UnfBWlPDjUwNnXP9ngLee2jOtZU
         qA952Uwyc1qWuF8K/FpyUKmuzSS4MPYf/Vz/y+NXxSPCiyKbd7C9+LIF7lKBzLuiQSaR
         pgVFjzCIRvcPcsVfO0k+WYy932iupGzaMYAx6RSceXZqyBreiGwo9vvMZMRllVfPrj/v
         u1EA==
X-Forwarded-Encrypted: i=1; AJvYcCWUnaGKfRK92aqV/r2ZLqGTSm2dOaIC3Abqgl5J77K3ay3hCiBaqX07gpgm/brzradlpui53LRrUmhv+pud@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/Nh88sDFamePA8wn3LaMUW9J2hZuBHuoy38eOD2i7Zn1GbhS
	xyIqCOmv97jcOXn15bbbHGAqKUuaaOzSdId3iPxqYROK7kE6eiZVCNEaFh99PsA67RLyhW6E4NT
	UGCoVjUwgW21QmX2FIeN/olAXqCy8l1RabTpZCpORtQvHb4QcxdI/KQSefoNL/aAEcssbt3lK62
	lbw5m0Hg==
X-Gm-Gg: ASbGnctoh7ndO3u5idyd08OtQ1/42Sx+N2xtacX/7PRgaplb8IbrD5q1tEbq+N1tKuy
	q5rsOosatzh7ePinBI4QNrcZPaVQGQUgqHzgvcu/1xVn8bqsH1v4hH/ewXaYWTaLlibDlYWZfOb
	6QzeWTzVzwcnCF0i2jzKhMoOuO0athIhvtyfgh4UE24zNgvU289kiwKBrk84HljKyI/x1e0uPK9
	1U+GRPHzFqg5Eaxk2gcoDqKd78BUb/50Q4Klrio7t2xmMW1A4JOIxZuupOM9xCt3XBBLbWweFm4
	vp44501UjEkuyqwb0U2ruASxUVhjoUnZbfFrGPGJ8cxCNnOD0XsrBivSfP6TsKQWAJdSblodz9z
	rfUQevqsEyZGgLwg=
X-Received: by 2002:a17:902:e788:b0:234:1163:ff99 with SMTP id d9443c01a7336-23dd1d7ef95mr32972215ad.43.1751971142438;
        Tue, 08 Jul 2025 03:39:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC/n1Wv16I6oi8TfKFbGm9RVJSuG7cMjQtpyIJkVs3+lkD6ynLF8cQTccR4h0hqlT00wE5zA==
X-Received: by 2002:a17:902:e788:b0:234:1163:ff99 with SMTP id d9443c01a7336-23dd1d7ef95mr32971795ad.43.1751971141853;
        Tue, 08 Jul 2025 03:39:01 -0700 (PDT)
Received: from [10.133.33.177] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8435022dsm114182915ad.86.2025.07.08.03.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:39:01 -0700 (PDT)
Message-ID: <7aa0ac35-068f-4738-abbd-f1073294365b@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 18:38:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
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
 <8b9eb6f4-6f0c-458d-b1e6-a1893c35b81d@oss.qualcomm.com>
 <a92b3d96-0c19-49c2-ad8b-ad31dec973c3@collabora.com>
 <7b8ea9ba-02ef-4676-a4d3-d088920283c3@oss.qualcomm.com>
 <9eba0149-290d-4010-8791-d4d8d8be3786@collabora.com>
 <fdb9f1e7-bf8f-4018-b0ac-ac8a70d9b8ec@oss.qualcomm.com>
 <5c9843b5-d756-4a99-b93f-d32ed8f16e32@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <5c9843b5-d756-4a99-b93f-d32ed8f16e32@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686cf54c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=n4c7CGo1Dgpf3paWKKAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA4NyBTYWx0ZWRfX24fVGtwBwigd
 9fMxTi1ZMA6cwmZvVeqSONu/A+CXZllxZq/dUqcz4CHfCUx/tfmiUclcapirridvy3Zxh8hI7PZ
 YYDdMBfvABBczIZkz63uRlbYkcrNC3vTtTc8MSnZjNGUqLkbcNC9XD3Id9XrTffobuXTmHNiU6u
 As7jTnkj/ywMxGgAGgTU7q1O62c/8nOKxVgc2D40KJ0SMm/9Y+bqwU7R94DYVe/Ar6CBXRgbJC3
 h7HGZ0paXW4MFcCFDgLIP/JGl3eXJidxs0OmzE5Jln/h+ZkJoipfWGph4KUFWExRfe9GcWxx/Mv
 CbVCvOpan0BnUSE3nOwNyMcvr7+n86Xz1/53hh6qkS6nYcJMV3PnyfstCIqpaTm8X9SfkEyhepR
 S01qZ/XD8cVfGDjcL2ngvVBz19dAVpX7aHrhKpCfab2TaszDoOWQkNTPZ5pLaSgv2xhbJJRC
X-Proofpoint-GUID: v64i7h8FxvWpO9QLQ-bFL4t2HUzbbqbJ
X-Proofpoint-ORIG-GUID: v64i7h8FxvWpO9QLQ-bFL4t2HUzbbqbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080087



On 7/8/2025 5:12 PM, Muhammad Usama Anjum wrote:
> On 7/8/25 6:43 AM, Baochen Qiang wrote:
>>
>>
>> On 7/7/2025 9:11 PM, Muhammad Usama Anjum wrote:
>>>>>>>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>>>>>>>> index 4488e4cdc5e9e..bc4930fe6a367 100644
>>>>>>>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>>>>>>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>>>>>>>> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>>>>>>>>>  	mutex_unlock(&ab->core_lock);
>>>>>>>>>  
>>>>>>>>>  	ath11k_dp_free(ab);
>>>>>>>>> -	ath11k_hal_srng_deinit(ab);
>>>>>>>>>  
>>>>>>>>>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>>>>>>>>>  
>>>>>>>>> -	ret = ath11k_hal_srng_init(ab);
>>>>>>>>> -	if (ret)
>>>>>>>>> -		return ret;
>>>>>>>>> -
>>>>>>>> while I agree there is no need of a dealloc/realloc, we can not simply remove calling the
>>>>>>>> _deinit()/_init() pair. At least the memset() cleanup to hal parameters (e.g.
>>>>>>> Why do is it being done in the resume handler? Shouldn't those parameters be cleaned up
>>>>>>> in resume handler? So when device wakes up, its state is already correct.
>>>>>>>
>>>>>> Hmm... not quite understand your question. Can you elaborate?
>>>>> I'm trying to understand the possibility of cleanup of hal in suspend handler. For example:
>>>>> * The driver has been loaded and has been working fine.
>>>>> * The user called suspend. So all devices would be suspended.
>>>>> * In suspend handler of the ath11k, we should do the necessary cleanups of the states
>>>>>   like hal.
>>>>> * When the device would resume after long time, the hal would have the correct state
>>>>>   already. So we'll not need to deinit and init again.
>>>> The hal cleanup is not only needed by suspend/resume, but also a step of reset/recover
>>>> process. So If we are moving the cleanup to suspend handler, similar stuff needs to be
>>>> done for reset/recover as well.
>>> It makes sense.
>>>
>>> So clearing the hal structure completely other than ab->hal.srn_config doesn't seem
>>> right. I've also tested it and it crashes the whole system.
>>>
>>> On contrary, with only the current patch applied, there is no abnormality.
>>>
>>> num_shadow_reg_configured and avail_blk_resource are non-zero. If I make them 0,
>>> driver still keeps on working.
>>>
>>> 	ab->hal.num_shadow_reg_configured = 0;
>>> 	ab->hal.avail_blk_resource = 0;
>>> 	ab->hal.current_blk_index = 0;
>>>
>>> As you have suggested setting these 3 to zero, is there any other variable in hal
>>> structure which should be set to zero?
>>
>> IMO srng_config, rdp, wrp and srng_key may keep unchanged through suspend/reset, all other
>> fields should be cleared/reinitialized.
> 
> memseting srng_list and shadow_reg_addr causes crashes. Please can you confirm why do you
> think those should be memset. Here is WIP patch:

We need to make sure they have a clean state while resume/recover.

> 
> 
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -2213,14 +2213,10 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>  	mutex_unlock(&ab->core_lock);
>  
>  	ath11k_dp_free(ab);
> -	ath11k_hal_srng_deinit(ab);
> +	ath11k_hal_srng_clear(ab);
>  
>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>  
> -	ret = ath11k_hal_srng_init(ab);
> -	if (ret)
> -		return ret;
> -
>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>  
>  	ret = ath11k_core_qmi_firmware_ready(ab);
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index b32de563d453a..d4be040acf2c8 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1359,6 +1359,19 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>  }
>  EXPORT_SYMBOL(ath11k_hal_srng_deinit);
>  
> +void ath11k_hal_srng_clear(struct ath11k_base *ab)
> +{
> +// --> both of these memset causes crashes
> +//	memset(ab->hal.srng_list, 0,
> +//	       sizeof(ab->hal.srng_list) * HAL_SRNG_RING_ID_MAX);

You are memset too much, just sizeof(ab->hal.srng_list) is OK.

> +//	memset(ab->hal.shadow_reg_addr, 0,
> +//	       sizeof(ab->hal.shadow_reg_addr) * HAL_SHADOW_NUM_REGS);

same here

> +	ab->hal.avail_blk_resource = 0;
> +	ab->hal.current_blk_index = 0;
> +	ab->hal.num_shadow_reg_configured = 0;
> +}
> +EXPORT_SYMBOL(ath11k_hal_srng_clear);
> +
>  void ath11k_hal_dump_srng_stats(struct ath11k_base *ab)
>  {
>  	struct hal_srng *srng;
> diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
> index 601542410c752..839095af9267e 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.h
> +++ b/drivers/net/wireless/ath/ath11k/hal.h
> @@ -965,6 +965,7 @@ int ath11k_hal_srng_setup(struct ath11k_base *ab, enum hal_ring_type type,
>  			  struct hal_srng_params *params);
>  int ath11k_hal_srng_init(struct ath11k_base *ath11k);
>  void ath11k_hal_srng_deinit(struct ath11k_base *ath11k);
> +void ath11k_hal_srng_clear(struct ath11k_base *ab);
>  void ath11k_hal_dump_srng_stats(struct ath11k_base *ab);
>  void ath11k_hal_srng_get_shadow_config(struct ath11k_base *ab,
>  				       u32 **cfg, u32 *len);
> 
> 


