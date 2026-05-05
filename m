Return-Path: <linux-arm-msm+bounces-105862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGbDNLGf+WmQ+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:43:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 386814C8265
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BF8F300BCA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34B13DE425;
	Tue,  5 May 2026 07:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CdIfM8o+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZE+Mzp5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8C73DBD7E
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 07:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967019; cv=none; b=b4aS3FT7Bw5tTdb/YNiIIRMSaAIaYY1q3mfSQ9rP3pKqutcxmq8RYmEGz7Jokpi/U7ThMGfMs0BTZH7RTwlr0LSrLFkIy5uYIogJRShFd2zp4gOlDWYx8IuvcUKd6nkgXqRcFZz2Y+DyLT1deQIu4GRg91zSjwZBhdVYGj42xnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967019; c=relaxed/simple;
	bh=YIXdhkSI4IBQ2M1gYRb3l31cOI9LtoXRCFRBCa2ycTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUVW2r/qvTUdiIMphwFKdQFPaD9LhMXKCwIiFC9z+cefMDsetcyDzll6c0ZGT3P1cA4rpUlSCs2APWdvQ5lVJqXtiztS/icme0/AqOomQh8r5omqDZwRm5JES3fuAiKWLSC23VuHW/ex4hdmXX6kKipeYWYT7KBJHm2HhquWeCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CdIfM8o+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZE+Mzp5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644LJL5e1960741
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 07:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqVV0Dm3mE9t6xBMdrebrvfWi6udNU8mtnEESR0JZNE=; b=CdIfM8o+KRzrQ6Mt
	Wd178V7/1hW8IFZrTrn/ckaQxJX66Dgp+CC8hIk6f7WNoK3Y7+uwXOl1SPzMvLhl
	x9HwsvpXs5co0X2OTmXSxIIJnWPjJYI2/08M3f8dKCFHkPGCzkWS26Pkc98ZaFkm
	59xNvQt0tcFy5KNdco/+7rcw5SDAJ1/1v/18AEM3qfbsjSUIMt9VtzL5IgPAToNv
	HyqDwml6sU8SkdMDFH/O0S0IG+6U3W0cNZn3ARj24GGUK+PIHOUAFgLz5ygc2dUP
	EmRHILM43BHn7dEccGNG69+C5+ggE4vQw4zbX0lb0akKiatDRYTZiFVbAFolkegG
	uBtXiw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5du88g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 07:43:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca154e2b5so149102696d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777967014; x=1778571814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NqVV0Dm3mE9t6xBMdrebrvfWi6udNU8mtnEESR0JZNE=;
        b=OZE+Mzp5Djj3WNWuym3GDsgla4TvTldDreC3S1n9ly5yZ7YzMwdw89DfWUqG5AzhIi
         QdZOrpEPAhiELMyZgyjKFbPkyzc1ng/6XqTGiZ/NQ6WLB4nTxTSuEpClY04hTrlxmAzf
         7cgMF8B+XJ6YUOdeQMNgNGmmEV1yso9N0ggFHx7Cd8mykTNMowdl+uRVpGSa4G9y1T38
         RYzK6MqJUOji9IHDQPCbj2p6wAVm/7ypNLrONrKil0tASC/SaGJRNROThdBKyrTbT8yN
         47TmLSzj6BhdDtjli9UJUYcCZU1T5z4WlutlkJOaxr4RoIMIpcrpxTUId9ytRjR2TPeB
         A2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777967014; x=1778571814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqVV0Dm3mE9t6xBMdrebrvfWi6udNU8mtnEESR0JZNE=;
        b=RDn9rsOW2JENjlkTYC3zYptQYyRG+sefF61MmwmzGanCgboztJQaw7tw8uOSv7UPat
         KgABuKDwkKLVyUqdJG9mHpD4DuIHIqN8w85RBFKvYlCeAsqmDCAotATmWyr4J2UOUyJv
         cTWcDXEu3Df8jAqZtPdIGBUl1pJCV9F2je22i1LJ9ZQVUsjHwoQMoilAV/uFiM5MWLR/
         hph70bphrSg+LS8Zyuh7tC8YOV/5QpRPvOR6QwPzAAJFvFrbela5IN0TCtxQLDy3ONPj
         J9eH1x3DVYJq+fuCrd/S98loERomgpAAEC8f5YyjpWfZsyNFNNzvBESzu5beaXNXkrL9
         n8kA==
X-Forwarded-Encrypted: i=1; AFNElJ+5Vm8aOxucajM/vpvU444OyIXtr6WbELrWfojS4nPbmYXLQCMSLgQl0VLHzIfeZxDVQJbtrqFjZvk4u+V4@vger.kernel.org
X-Gm-Message-State: AOJu0YwV9fTLOFhfNjO7i5s42ylcaXQ+o34q/nqlUL48DdWECeYaAwi6
	J7Wde7Mzq6DwYOTvbMBCG3XW7/RoX2iMHeF2nVFkwy2q5iBypXl2r8nAjriY8eJcFnziE91DruV
	5jjle03jphyHFHHr2Mr8nlsuuKvtyIaFfOWcawshqSPZndTHZ8v8ZggMVI7xhxfeWpvJI
X-Gm-Gg: AeBDies3G+SJ4kqm9vG/TyIAGQAhd29Vlt8pW5f+D1mqVJBc0onL8geDPoALcZVuqAv
	iohvaGhRaf//wtpOAyroLdK5Z1/ER9m58ygxs717APq5hh/XPwuU5RbJz7SQzSQOmUSc1qMNO8k
	z6trqw8bYeZ06KglmVQFdwMMNnev3DJ1+VpgyRtIxI6CYpU9QB4bfBkdjo74fPXR+v2O+2T08Wh
	IqiEHjZaYS4cuShs/06sRciah71rkMi6kUq4uOq1dODPRVfHqqM0gK9GVGJEMzBvFcsm1a0wWRw
	j+DJeiajHFp//+RmasVssVOtwqkWp0Dhi4ZMZextGCEXxjlxGvEzXECj+ij3jRUk8KW4hNsHIZb
	4QxoyqpzYmj+BsSeLUZBID8c64tR6KyQ0dj09hXSugE9jE5Db+ykZK7l4m5YhZYBeINXfuhG+k1
	wXkv/9SR7/rriroYdB
X-Received: by 2002:ac8:588a:0:b0:50e:60b7:bb40 with SMTP id d75a77b69052e-5104bcba50emr188220421cf.0.1777967013511;
        Tue, 05 May 2026 00:43:33 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:50e:60b7:bb40 with SMTP id d75a77b69052e-5104bcba50emr188220161cf.0.1777967012954;
        Tue, 05 May 2026 00:43:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d? ([2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d17ff3659sm10970165e9.18.2026.05.05.00.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 00:43:32 -0700 (PDT)
Message-ID: <0d95cd5b-01a8-44b6-bd4c-a7e5fa81e181@oss.qualcomm.com>
Date: Tue, 5 May 2026 09:43:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
 <20260430054422.2461150-2-priyansh.jain@oss.qualcomm.com>
 <bfecf67e-faf2-4889-b29a-2d4d5cd0d1a6@oss.qualcomm.com>
 <e473e26b-f4bc-4044-a893-c0f255de6cb8@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <e473e26b-f4bc-4044-a893-c0f255de6cb8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3MCBTYWx0ZWRfX5wCn3G8SBs5x
 Gqu92uf9ZjDh4fXR+1BNqIIPHKyQH2++T0StasUFrcS1uoPIkpTLgkXN0NyPv1w416ctb7lQN4R
 aGNP3JMFkj11VfZ4p3X4TUcnvMFGrk0kAXiw9JUsShdmSeJwzHcNNpZvs6inbC/QgBwchAYu+UZ
 JhZ6SJj8Q6T8ATiPpJKnS9Mw7INihLqTa3u1inzOAo2V30GwfZJDGTqdfKxnse9qY6vGgrof7gW
 w+ooBG0bcrnK9Dw661+hVMhy02VtdCtHwLLC4m7g2UR2g0MJ7uocr0JbEkSZMRTCrh0pzxchG1Z
 yUoqW760X27LxANPa3Vb6uGRbCDVAHJQ86nbt8kwzsbdKMv8XfUL3eZ+3rGKeJ40iccT9EDfYpv
 3vHN1iH9vWnqT6UcR8pWIXfz4RK6B4SPigamFTkdFEUza5mTZgrOu+FpzMCjK4wkh7NiYBiegVn
 RCpYNANkxc9QA73VAEA==
X-Proofpoint-GUID: N6pBu0HcTwk23_-ExCs4ZTYcq-HaaI3c
X-Proofpoint-ORIG-GUID: N6pBu0HcTwk23_-ExCs4ZTYcq-HaaI3c
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f99fa6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QoiBiMnBE-sNsCsPl0cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050070
X-Rspamd-Queue-Id: 386814C8265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105862-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/5/26 08:11, Priyansh Jain wrote:

[ ... ]

>>> +    .valid_bit = BIT(14),
>>> +    .last_temp_mask = 0x3FF,
>>
>> This is GENMASK(9, 0)
>>
>>> +    .last_temp_resolution = 9,
>>
>> Please comply with the SSOT, in the init function compute the mask with:
>>
>>      ->last_temp_mask = GENMASK(9, 0);
>>
>> and remove the initialization here
> Thanks for pointing this out — yes, this approach looks better.
> If I understand correctly, you’re suggesting that the mask should simply 
> be defined in the init function as follows:
> priv->feat->last_temp_mask = GENMASK(priv->feat->last_temp_resolution, 0);
> ?

Yes, that's correct


>>>   };
>>>   static struct tsens_features ipq8074_feat = {
>>> @@ -125,8 +128,7 @@ static const struct reg_field 
>>> tsens_v2_regfields[MAX_REGFIELDS] = {
>>>       [WDOG_BARK_COUNT]  = REG_FIELD(TM_WDOG_LOG_OFF,             0,  
>>> 7),
>>>       /* Sn_STATUS */
>>> -    REG_FIELD_FOR_EACH_SENSOR16(LAST_TEMP,       TM_Sn_STATUS_OFF, 
>>> 0,  11),
>>> -    REG_FIELD_FOR_EACH_SENSOR16(VALID,           TM_Sn_STATUS_OFF, 
>>> 21,  21),
>>> +    REG_FIELD_FOR_EACH_SENSOR16(LAST_TEMP,       TM_Sn_STATUS_OFF, 
>>> 0,  21),
>>>       /* xxx_STATUS bits: 1 == threshold violated */
>>>       REG_FIELD_FOR_EACH_SENSOR16(MIN_STATUS,      TM_Sn_STATUS_OFF, 
>>> 16,  16),
>>>       REG_FIELD_FOR_EACH_SENSOR16(LOWER_STATUS,    TM_Sn_STATUS_OFF, 
>>> 17,  17),
>>> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
>>> index a2422ebee816..15392a17ef41 100644
>>> --- a/drivers/thermal/qcom/tsens.c
>>> +++ b/drivers/thermal/qcom/tsens.c
>>> @@ -315,10 +315,66 @@ static inline int code_to_degc(u32 adc_code, 
>>> const struct tsens_sensor *s)
>>>       return degc;
>>>   }
>>> +static inline enum tsens_ver tsens_version(struct tsens_priv *priv)
>>> +{
>>> +    return priv->feat->ver_major;
>>> +}
>>
>> I agree putting accessor functions is a good practice but here as it 
>> results in duplicating the function, the benefit is discutable.
>>
> I did not introduce this new function; it was already present and I only 
> moved it from the bottom of the file to the top since it was being used 
> in tsens_read_temp().
> However, this change is no longer required as I am removing the use of 
> tsens_version() in tsens_read_temp(). As discussed earlier with Konrad, 
> it makes more sense to check for valid‑bit support rather than relying 
> on the TSENS version check in tsens_read_temp().

Ah yes, makes sense

[ ... ]

>>> +    }
>>> +
>>> +    if (temp_val[0] == temp_val[1])
>>> +        *temp = temp_val[1];
>>> +    else if (temp_val[1] == temp_val[2])
>>> +        *temp = temp_val[2];
>>> +    else
>>> +        return -EAGAIN;
>>
>> We have a, b and c.
>>
>> if a == b, then return b
>> else b == c, then return c
>> else return -EAGAIN
>>
>> It is like we have two consecutives successful read. IMO that could be 
>> simplified to:
>>
>> int prev = INTMAX;
>>
>> /*
>>   * An explanation ...
>>   */
>>
>> for (i = 0; i < max_retry; i++) {
>>
>>      int value, valid;
>>
>>      ret = regmap_field_read(priv->rf[field], &status);
>>      if (ret)
>>          return ret;
>>
>>      value = FIELD_GET(priv->feat->last_temp_mask, status);
>>
>>      valid = FIELD_GET(priv->feat->valid_bit, status)
>>      if (valid)
>>          return value;
>>
>>      if (value == prev)
>>          return value;
>>
>>      prev = value;
>> }
>>
>> return -EAGAIN;
>>
>> (Not tested)
> This approach has some misalignment with the HW recommendations.
> As per the HW guidelines, 3 back‑to‑back reads must be performed until a 
> valid read is observed.
> b or c should be returned only if none of the three reads(a,b,c) report 
> the valid bit not set.

Right I missed the point the HW recommendations is to read 3 times in 
any case. Maybe replace if (value == prev) continue; ?



