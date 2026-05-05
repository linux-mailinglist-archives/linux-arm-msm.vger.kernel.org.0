Return-Path: <linux-arm-msm+bounces-105869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKFEKzWv+Wky+wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 10:49:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9E4C8E47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 10:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B1E330621E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 08:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375783C4547;
	Tue,  5 May 2026 08:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hg+68iqp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3FB1a6S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A378437BE7E
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777970925; cv=none; b=Itkrfu1pw52LQbdBjsd950W1TLJs9CPPVy3KvtKACUNB4u3bAwjNDc75y7Db/crRRg5d0PA6upeotJjYK6Btd4IawbA/7Y37A0v3QPcl+SdkPoctopNi/ynR7/2ui1ITY+DZJEplk2/81z1hl/EnS0BpmEiPF5kRHxn17vZWrMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777970925; c=relaxed/simple;
	bh=rcm/a/MRtt696rd2hkCBk989dMVF2oY1LYS7HTWHUKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9wO+bZowAGS0dxezuC8yy/xtwOOFib99jJbt5xhYk4MPL1iqPE9Biv8SwC+r8dSmJAyCFII7m6wPrDVXgQT0irHN9hXSx6rjc1YSj03fjAsofCTm3G1s5Sa3J2mtUPD/ZN6FJ7uhV6Lfci0Kes+1tmj5plZXJEucFTrnPng+1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hg+68iqp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3FB1a6S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456libf3187553
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 08:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bgHh7EY/77BObta7BrqRKnbHiZ/J9XmUTAVLTrHyjt4=; b=Hg+68iqpOytGicwi
	KbD9LdqH7sfMYjlqP9pbOoWGTU6VFK34AL9EzmDQ5nvUEEF9A05N9XEw6Ye/YmoZ
	O4cjflfDfXFbM0/T66aFec1MaMeieKzGYmMsJBhbPOnPvk9GGKRCxUR08gtN3Gbj
	5S02hjLCZ9wsJOOiXYnP1YESBTIxh6Gl8SCYcu4JWmej+3d1wseykmANZMWyEXeN
	Pz67w3aXdj8erw0MkE2bEVkBMICuAduov5WDvgrHtBgOANj6MfEPrturWRkyEdP7
	DHU/0bKKksAprH3Hnk902+1HB951b8LoFgc6iZPQ28pGqVkzeJT9bLYC+fNjTeDO
	DLWe2g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dybkk8cw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 08:48:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3651991d0bcso5189086a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 01:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777970921; x=1778575721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bgHh7EY/77BObta7BrqRKnbHiZ/J9XmUTAVLTrHyjt4=;
        b=A3FB1a6SQEsteJBw1nrNmYFyTTjF9/dAGa4NgjAci+ZOyJWn1UIc+hJ0my86boKLox
         jpdmgAtRa+H6RUamzAAQeroTrQ7kQ+ExcIeBY3ow6IyzRhJXDet0iyL1/2r5+TqZmz+z
         dWK1vhVhoTOh4E6WWzfSU0o7T8k2uFWD+bdADZ1tH/k993Mn83Ic3m3zA5NUYHoCnx3s
         DcdwQbuZ1yL8NEzpeNV/s1auOm0IJl9aEi4xSwklz9yDGWBlFirKMLsrt5lUdHzXhyk6
         uy7rHCjFmIuTBWK+js0W19oU/9ysU52qAZ3cq+xXXBGE/V42F8kwnVvGVOc04rhT2sw4
         7+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777970921; x=1778575721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgHh7EY/77BObta7BrqRKnbHiZ/J9XmUTAVLTrHyjt4=;
        b=pBS8YcSwzPUmS186XYGx9nINr47vIBwZ86yCkC+ZtwvL0lvnuL8/8CsIih8ZSwRnSE
         zmdottwD283Ak4mAEEXFmezT/bqwCTGj6HS+WUAxe5FSukzqCP6/XsQMBhf3WdnDkWBj
         y4xWHIKYCnY/XvW96c7dm5B3aLKDGEHJSORLPCUwI5LuwkBL5u8PaLfg2im7DPMW6aDW
         EU+3SKD+IzlOK967GwElahrwTD8hyq4ZTu+lXgaHhF9E5XTbXFB7kH2MqJPOo+izPMps
         Hf5BLWQJM1J0UJtFFUVg5qfwy9cjFGYepYUWROnmNn8Uoqls6OfuIeZohSH4VyzJQ7i6
         1N3w==
X-Forwarded-Encrypted: i=1; AFNElJ9XVliSnOgDBdKY4nJd6pkqKsonLgB2FteTv04IZYyEF0EDNk9xI0aDtfGmEpKZw7uegYoLn+n2ozy13RcS@vger.kernel.org
X-Gm-Message-State: AOJu0YyFg17dzg9TreZzAD4epHWq7U/Hj0b15GI3LagdAxuhsZlcldSB
	nBnvCRptq98psaMUrX123n8Sn0bkqVNB+PFhg7EZZl5Zi6CecNMQDRSnzhnzos/syR7Ozv8WApP
	Cv+mDAQx/WcaceF+vdvwuSqoCk/Cwr4LqRsc2r958qu3O0RMY7Q2V0n9fJ0uGmmHxQpzg
X-Gm-Gg: AeBDiesvJwImbWFqCOCmKTXuIejUDggxhN7qgVigfMIy3KNLfECwHbmy9fHrMbPgQEh
	VWY/Rk+NrdyaZC418Lih5QzRE/s1sQo1bOUXrM6p2ERadK5VCPXE0IGBJa17QRRUm840xa1EM3S
	DhFXKjiz5ldHk4h20hjDiyzkNldx+t6rsEvenEQD+DTBjWlYNrlG+OW/IU+sQBa8W8HORlQiGX9
	67Q9a/IS+RGRJfG0XmkTielWuu6zK0KzUbVLUQWLTK6WaKjNCud4xA2MfWYlO1tBXG3dUnBC8TL
	8DMnvaLy2uoLImQNpySXZElgWxDCOlF/d2v3DBmgV3z7LJ/uzvVnVzVwid+Sf4TI1ZrmkYXrana
	u2CMunT9ivKZq2wAFzTKZp4DuEH9ADUHwX7N9e5VvbxvHvfWtySdnPnlGRmxn5DA=
X-Received: by 2002:a17:90b:4ec5:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-3650ce8ef90mr13223349a91.14.1777970921342;
        Tue, 05 May 2026 01:48:41 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec5:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-3650ce8ef90mr13223322a91.14.1777970920866;
        Tue, 05 May 2026 01:48:40 -0700 (PDT)
Received: from [10.92.176.206] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364d1c70d8csm25681785a91.13.2026.05.05.01.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:48:40 -0700 (PDT)
Message-ID: <1dd4746c-e93b-479f-8aed-ea9a21a03316@oss.qualcomm.com>
Date: Tue, 5 May 2026 14:18:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
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
 <0d95cd5b-01a8-44b6-bd4c-a7e5fa81e181@oss.qualcomm.com>
Content-Language: en-US
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
In-Reply-To: <0d95cd5b-01a8-44b6-bd4c-a7e5fa81e181@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4MSBTYWx0ZWRfX0Gnrq50leZ1Y
 wlfaD/gwpa4PNlCj4tn399AxSjFztc6JfqDH6KwiTeFHpOeaDH/ITlSvbnvpadP4OUYSXY873mg
 gapHknQY8EkEtUyt9HYaM1zYhUMHCN+HKhvL2zzxcFSyIYLv9k04Kk66+mt5/OFApQVJf+DOn/S
 Yrpv9Nkxblm37Q8uUyU53N48ELC3Oykl+MpJ7bzr/WL8T8+/k6Z03AshBjOFrfcJuxRRw1Tft/2
 s191+5IGN+w4v08PIcv5Nz7FLAIH11mbVmRNkUj+OPOdnsdYm983TSHdyA1DsI3QnrbnEsYvsZu
 /hOXQJQZR890Ew/QhTVrDPGtdVS7Do5HSJiYxbXg0wQ5L3c6U4qzK+YWGSgaja0Z16cC5W+i2lR
 rNWh04sJlrSFIkqJgZFq00jiZUk7Fmv7vmcPqh6NiQdVemFJyIblf3fAqfWy3Ccg1k8ib9AKm/z
 Vo1VbQawGlOtJ9KiS9A==
X-Authority-Analysis: v=2.4 cv=SPBykuvH c=1 sm=1 tr=0 ts=69f9aeea cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Z3jtgVVlpKzii3TN01EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 2kOJ1zIoMIYJVGJ9yQqBdBD4ot_jI4jO
X-Proofpoint-ORIG-GUID: 2kOJ1zIoMIYJVGJ9yQqBdBD4ot_jI4jO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050081
X-Rspamd-Queue-Id: 25F9E4C8E47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-105869-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]



On 05-05-2026 01:13 pm, Daniel Lezcano wrote:
> On 5/5/26 08:11, Priyansh Jain wrote:
> 
> [ ... ]
> 
>>>> +    .valid_bit = BIT(14),
>>>> +    .last_temp_mask = 0x3FF,
>>>
>>> This is GENMASK(9, 0)
>>>
>>>> +    .last_temp_resolution = 9,
>>>
>>> Please comply with the SSOT, in the init function compute the mask with:
>>>
>>>      ->last_temp_mask = GENMASK(9, 0);
>>>
>>> and remove the initialization here
>> Thanks for pointing this out — yes, this approach looks better.
>> If I understand correctly, you’re suggesting that the mask should 
>> simply be defined in the init function as follows:
>> priv->feat->last_temp_mask = GENMASK(priv->feat->last_temp_resolution, 
>> 0);
>> ?
> 
> Yes, that's correct
> 
ACK
> 
>>>>   };
>>>>   static struct tsens_features ipq8074_feat = {
>>>> @@ -125,8 +128,7 @@ static const struct reg_field 
>>>> tsens_v2_regfields[MAX_REGFIELDS] = {
>>>>       [WDOG_BARK_COUNT]  = REG_FIELD(TM_WDOG_LOG_OFF,             0, 
>>>> 7),
>>>>       /* Sn_STATUS */
>>>> -    REG_FIELD_FOR_EACH_SENSOR16(LAST_TEMP,       TM_Sn_STATUS_OFF, 
>>>> 0,  11),
>>>> -    REG_FIELD_FOR_EACH_SENSOR16(VALID,           TM_Sn_STATUS_OFF, 
>>>> 21,  21),
>>>> +    REG_FIELD_FOR_EACH_SENSOR16(LAST_TEMP,       TM_Sn_STATUS_OFF, 
>>>> 0,  21),
>>>>       /* xxx_STATUS bits: 1 == threshold violated */
>>>>       REG_FIELD_FOR_EACH_SENSOR16(MIN_STATUS,      TM_Sn_STATUS_OFF, 
>>>> 16,  16),
>>>>       REG_FIELD_FOR_EACH_SENSOR16(LOWER_STATUS,    TM_Sn_STATUS_OFF, 
>>>> 17,  17),
>>>> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/ 
>>>> tsens.c
>>>> index a2422ebee816..15392a17ef41 100644
>>>> --- a/drivers/thermal/qcom/tsens.c
>>>> +++ b/drivers/thermal/qcom/tsens.c
>>>> @@ -315,10 +315,66 @@ static inline int code_to_degc(u32 adc_code, 
>>>> const struct tsens_sensor *s)
>>>>       return degc;
>>>>   }
>>>> +static inline enum tsens_ver tsens_version(struct tsens_priv *priv)
>>>> +{
>>>> +    return priv->feat->ver_major;
>>>> +}
>>>
>>> I agree putting accessor functions is a good practice but here as it 
>>> results in duplicating the function, the benefit is discutable.
>>>
>> I did not introduce this new function; it was already present and I 
>> only moved it from the bottom of the file to the top since it was 
>> being used in tsens_read_temp().
>> However, this change is no longer required as I am removing the use of 
>> tsens_version() in tsens_read_temp(). As discussed earlier with 
>> Konrad, it makes more sense to check for valid‑bit support rather than 
>> relying on the TSENS version check in tsens_read_temp().
> 
> Ah yes, makes sense
> 
> [ ... ]
> 
>>>> +    }
>>>> +
>>>> +    if (temp_val[0] == temp_val[1])
>>>> +        *temp = temp_val[1];
>>>> +    else if (temp_val[1] == temp_val[2])
>>>> +        *temp = temp_val[2];
>>>> +    else
>>>> +        return -EAGAIN;
>>>
>>> We have a, b and c.
>>>
>>> if a == b, then return b
>>> else b == c, then return c
>>> else return -EAGAIN
>>>
>>> It is like we have two consecutives successful read. IMO that could 
>>> be simplified to:
>>>
>>> int prev = INTMAX;
>>>
>>> /*
>>>   * An explanation ...
>>>   */
>>>
>>> for (i = 0; i < max_retry; i++) {
>>>
>>>      int value, valid;
>>>
>>>      ret = regmap_field_read(priv->rf[field], &status);
>>>      if (ret)
>>>          return ret;
>>>
>>>      value = FIELD_GET(priv->feat->last_temp_mask, status);
>>>
>>>      valid = FIELD_GET(priv->feat->valid_bit, status)
>>>      if (valid)
>>>          return value;
>>>
>>>      if (value == prev)
>>>          return value;
>>>
>>>      prev = value;
>>> }
>>>
>>> return -EAGAIN;
>>>
>>> (Not tested)
>> This approach has some misalignment with the HW recommendations.
>> As per the HW guidelines, 3 back‑to‑back reads must be performed until 
>> a valid read is observed.
>> b or c should be returned only if none of the three reads(a,b,c) 
>> report the valid bit not set.
> 
> Right I missed the point the HW recommendations is to read 3 times in 
> any case. Maybe replace if (value == prev) continue; ?
> 
We need to store all three readings because, if all of them are invalid, 
we must compare the first, second, and third reads using the following 
logic:

if a == b, return b
else if b == c, return c
else return -EAGAIN

Given this requirement, comparing (value == prev) inside the read loop 
would not be correct, as it does not preserve all three samples for the 
final comparison.

Thanks,
Priyansh

> 


