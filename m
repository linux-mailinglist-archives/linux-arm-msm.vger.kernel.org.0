Return-Path: <linux-arm-msm+bounces-91652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DgOIKTKgWl1JwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:15:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0565DD769B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B0063025140
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 10:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D7E39C65C;
	Tue,  3 Feb 2026 10:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lkLpJe9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F65HbZjZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E039C645
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113650; cv=none; b=W6dLHl450mOfF66FFiqI962I1RFNJ/ulg3NjT6I3QMUnDHe25xkmLjL3AOiMziT59J5mNkjxSjyiKfD66YPy78u4E5h3hZDMxWa+bb5EISW6pFQ7E2QZkMz/D9WTg6KozOlyVzC7VW0xgr5gC+81VDisQJx0QpCwp0Ogw62xaMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113650; c=relaxed/simple;
	bh=nO4yxC8mGJ7RX1Uvi9dzJ3eun2vtYWKZH59w/kxrhU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDuGZFWMyiV8KDhTYkNd+LG91OB83nfha8leNWGcPdSoC6QppXPG6j3KvReJaOzA3jA192lD7WDYj9yWAgLv2j76Apiz8jnl5kdRSsPJGPXhpSNLUGDolsax+JVAx0n13qRiPyxhuiGSnEcGwKPCX5W3CmB4VXCA+DrwjNeDJgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkLpJe9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F65HbZjZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613A49MP915698
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 10:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GuKTV8pSI5c3CW/T+TdlJ5YvcmLO2ZOzAgr0oyQI9Gs=; b=lkLpJe9auGtWfIzq
	6CDk2jHnb0vrjvuauLnki5W/s7dkxvI7mJJNY7PNY6bVYYb8uZFL/Q5kzE/kZXvO
	YO9ilV8jFgdpr6BAHtRW+6nKp18GqnDPQhsN1GdOccLJTcSgQuBGba+fKyhCBLpE
	EyZ6kz7jMXhYz0V/7QewkWv5i5iOtGhByH2/gN6aa1nuCoD5quG8ouL7rq3ImaWe
	iMy/uI/DD37xdcwI6OqqtqBzLv8xFNcjwTI6RU/2KrRB+XpEmEIi2ZdP/CydV81p
	cER0wuDFQcnZdbiMcJj+3tG72yEHIHM1Jv9/kV6UxSjrBSJqfnUTs/BsLgCr/a7w
	7OtZpg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exk818n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 10:14:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a76f2d7744so53792105ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 02:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770113648; x=1770718448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuKTV8pSI5c3CW/T+TdlJ5YvcmLO2ZOzAgr0oyQI9Gs=;
        b=F65HbZjZFePNXbGSDwnAyIrsxku6qLtEGQ8nAMsIGIrzDfganGC/BSrQ1vNbzWQeLK
         KOFfVd4epLUDX1iEiu5Fc3/HPJTKuSxdFl6b+jVLbt+zCDtxLyP6UlkoHv3jhtMtWMQs
         H+C2LVpXBKt0GQ5/r08kUREKyH7uYuZlo82J9zyg+fClx4wvg+IhsxLYNIhwviRXD6wA
         evQBJBwhUC8qpKKtpRsE1FDNxl6kD23A6EqvUcxnZVFHubBX1ij//dLugIzX9NRXEp5a
         l7dUgDcYs3a5XQdjoVSh2qyHbZFY0rEwDCiUhCOlx07T+zyWOltEenLvR7FYuour7pWG
         u2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113648; x=1770718448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuKTV8pSI5c3CW/T+TdlJ5YvcmLO2ZOzAgr0oyQI9Gs=;
        b=rBXzqYcECnNVRndOEqwDTbUTrWKSHkTePhj3iBISb/x0kGU397JhfCIELUvkbYdTM+
         BiV9Y1xNvj7pzkZlY7ricwKJWruPgWzbDPmSGMaZ+axpCejEJRM7JNb7q65/4diOpLxf
         f2dxctCP0ou10MYt5oKl806gdEa0T/OklQt2k5lxEAwDHZOO7JoY2pWaPuVl3Zrh3bSC
         XZEecqaAeZoO79GPHZIKBrQjC194VkIhECEMwFpWauq5dd8DpozkbevU3Zg/Lq6hA7Zv
         UlT5i/4Hg1jCSZWGl1SUugT5FAHtJmgGmYP8i/76zXc6WiZUggK/nwMYce2Hv9UB1T21
         Gl4w==
X-Gm-Message-State: AOJu0Yx6Yefb4pmWRQUBBUFXDryvpb5Tf717UdKzg5Rf73ftgjNwFi72
	fYmgojQRD6gTzqmjPipkLrKyuKOYMhMC77b9zzWNF4sJwZcXFlB8aBC2QqZpD7677NKDKXsYtFo
	T6eui40YBmahXuFf6swWs44yxOB437fwmIT0gDZaurTBAidH4VpWXn3NXYPA+NaHW7Lal3HPXXq
	z8
X-Gm-Gg: AZuq6aJzK63yhTDcCT7/tPT+2Ov5lDLBd684zgacmGLEx4PAE3iXURwj6UyBIA5W1fF
	mMBBrzjrYV9YHJ/fWXwufKyAFdhlhTiF1AikTVKYWtky4MODfou24PO2M3HGu+GifKE0W44FsDR
	6nREPhYGVvG1ODjwIhIXqh8vBldU4x8nlsX3pXea4qI1VbbfvTLgW2lO25+h5EuxPlgUhqI5fke
	JWvW/df0lDva2swX8Z8oXTd3ReWc/e/vkpIQxDg1nqiCT3xXnrT/cuk695xngJXgCt3fORtmEHa
	pjOexm0gNyaBTCOHDsSlHSePfqutz4S7LQXl1tFxpqLbGLKvT8j0otVshlqfBULIt2irZP0tpDQ
	aLxJa1YLHInzGwD60FDJAiC6TLpIXIAkAjehkchqThOp8
X-Received: by 2002:a17:903:2f8a:b0:2a0:c84f:412c with SMTP id d9443c01a7336-2a8d81bd988mr149333105ad.57.1770113647895;
        Tue, 03 Feb 2026 02:14:07 -0800 (PST)
X-Received: by 2002:a17:903:2f8a:b0:2a0:c84f:412c with SMTP id d9443c01a7336-2a8d81bd988mr149332625ad.57.1770113647328;
        Tue, 03 Feb 2026 02:14:07 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8bd74e815sm151387755ad.52.2026.02.03.02.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:14:06 -0800 (PST)
Message-ID: <7d1b5897-8f17-4213-b893-d99d96afef94@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 15:43:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] of: factor out of_map_id() code
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com>
 <47fbba15-6375-40fc-bd2c-8ebf2788837e@linaro.org>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <47fbba15-6375-40fc-bd2c-8ebf2788837e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4MSBTYWx0ZWRfX/WBjeWrUGFRH
 Bi2ScytdPaDTLBijGFTp3O9hclc1tR7lcRK6nUEG4YvRASPR8CZUFcAYuuJQxE8S+TNWldpy1Ux
 kAN1g+4bU214JAx3iTQ3d92rjXHeyqXpHbsdmqa1QmaDTcBSiOzrroH29zZqZtrRDLehbiPGIP3
 Wmdpg6PbWGC9Vj6MM7BVky+8Py9Wbovtg6d1FSMi6iDRGaWDxYBWVDG3Pg+LsXclokFtC3E6607
 r/XWPnFd0CyO46YgLCo+Mz/ozYtJhnL8NXPLni32h3VihVwqXB0aHg15mICzezIDipE6OcOBC+g
 dz11Do4G1R6+kvu2UcXoVWRSm5WtyzEoVJJ6mS5netshoxIr39UEgZZRRSvSj8RPiN6Kq7Jcere
 hAWN8kz5bYwjia7nrbhLmjLEZwFdZ08nXIJl8OJ5tZkmQH881uE0mbt9W/QfwHyf7ZXCf4zR6fE
 bYf13Dbpuamvp9YsSnw==
X-Authority-Analysis: v=2.4 cv=XfOEDY55 c=1 sm=1 tr=0 ts=6981ca70 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DOsnbD6T1ld7ZXaxHO0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: kzYGEdXuHj9H2wEBT3ncyx46emC6hfEh
X-Proofpoint-GUID: kzYGEdXuHj9H2wEBT3ncyx46emC6hfEh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030081
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91652-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0565DD769B
X-Rspamd-Action: no action



On 2/2/2026 8:22 PM, Bryan O'Donoghue wrote:
> On 26/01/2026 12:25, Vikash Garodia wrote:
>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> This commit message is confusing and inaccurate.
> 
> First up, you're not factoring _out_ of_map_id() - factor out of_map_id() means to remove of_map_id() - you are refactoring of_map_id().
> 
> Your patch title should be something like "refactor of_map_id() to prepare for mapping of multiple IDs to a single device"
> 

Sure, will update the commit.

>> Linux interprets multiple mappings for the same input ID as a set of
>> equivalent choices to pick one. There exists usecases where these set
>> must be maintained in parallel, ex: on ARM, a dynamically created child
>> device(s) is referencing multiple input id's in parent iommu-map.
>>
>> Factor out the code where multiple mappings needs to be maintained in
>> parallel can be achieved through callback from this factored out code.
> 
> Which callback ? There is no ->function(pointer, here...); ?!
> 
> Just make some plain and straightforward statements about what you are doing and why. There's no need to resort to dissertation-speak.
> 

The callback in introduced in patch 2 of this series. will update the commit descripition as suggested.

Thanks,
Vijay
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/of/base.c | 47 ++++++++++++++++++++++++++++++++---------------
>>   1 file changed, 32 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 0825f3dc93f2472e9947af09acdde72031ab85bc..606bef4f90e7d13bae4f7b0c45acd1755ad89826 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -2122,6 +2122,32 @@ static bool of_check_bad_map(const __be32 *map, int len)
>>       return true;
>>   }
>>   +static int of_map_id_fill_output(struct of_map_id_arg *arg,
>> +                 struct device_node *phandle_node, u32 id_or_offset,
>> +                 const __be32 *out_base, u32 cells,
>> +                 bool bypass)
>> +{
>> +    if (bypass) {
>> +        arg->map_args.args[0] = id_or_offset;
>> +        return 0;
>> +    }
>> +
>> +    if (arg->map_args.np)
>> +        of_node_put(phandle_node);
>> +    else
>> +        arg->map_args.np = phandle_node;
>> +
>> +    if (arg->map_args.np != phandle_node)
>> +        return -EAGAIN;
>> +
>> +    for (int i = 0; i < cells; i++)
>> +        arg->map_args.args[i] = (id_or_offset + be32_to_cpu(out_base[i]));
>> +
>> +    arg->map_args.args_count = cells;
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * of_map_id - Translate an ID through a downstream mapping.
>>    * @np: root complex device node.
>> @@ -2162,8 +2188,7 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>>           if (arg->map_args.np)
>>               return -ENODEV;
>>           /* Otherwise, no map implies no translation */
>> -        arg->map_args.args[0] = id;
>> -        return 0;
>> +        goto bypass_translation;
>>       }
>>         if (map_bytes % sizeof(*map))
>> @@ -2185,6 +2210,7 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>>           struct device_node *phandle_node;
>>           u32 id_base, phandle, id_len, id_off, cells = 0;
>>           const __be32 *out_base;
>> +        int ret;
>>             if (map_len - offset < 2)
>>               goto err_map_len;
>> @@ -2238,19 +2264,10 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>>           if (masked_id < id_base || id_off >= id_len)
>>               continue;
>>   -        if (arg->map_args.np)
>> -            of_node_put(phandle_node);
>> -        else
>> -            arg->map_args.np = phandle_node;
>> -
>> -        if (arg->map_args.np != phandle_node)
>> +        ret = of_map_id_fill_output(arg, phandle_node, id_off, out_base, cells, false);
>> +        if (ret == -EAGAIN)
>>               continue;
>>   -        for (int i = 0; i < cells; i++)
>> -            arg->map_args.args[i] = (id_off + be32_to_cpu(out_base[i]));
>> -
>> -        arg->map_args.args_count = cells;
>> -
>>           pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>>               np, map_name, map_mask, id_base, be32_to_cpup(out_base),
>>               id_len, id, id_off + be32_to_cpup(out_base));
>> @@ -2260,9 +2277,9 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>>       pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
>>           id, arg->map_args.np  ? arg->map_args.np : NULL);
>>   +bypass_translation:
>>       /* Bypasses translation */
>> -    arg->map_args.args[0] = id;
>> -    return 0;
>> +    return of_map_id_fill_output(arg, NULL, id, 0, 0, true);
>>     err_map_len:
>>       pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
>>
> 


