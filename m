Return-Path: <linux-arm-msm+bounces-90639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Pc5AOQreGl7oQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 04:07:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF48F630
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 04:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2826A305E30C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F280F2D7DDE;
	Tue, 27 Jan 2026 03:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlIVMZJx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbG2GIlW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771442EA468
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769483006; cv=none; b=tdkmPoRXMyp3laYZXkSbUruJr4i3klRhZmVGXj0lIDpgpwMNCaGKCUKAGaYiZIZP0rE7DaiaQhrupZ1O/NIySaMMAPaeU51hcQ09FRRtHWFOEyzA4tmCplsTZZsKvDQCG4Ijw4808uSSR2OK+V//aMOUgB15a+u2V+VETbOJi4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769483006; c=relaxed/simple;
	bh=n2ZWmJhmn4pq+pukiRwTlESq3XRBczt4wmNCwm231GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3++/FRPk42b0JKD0RmwwZJ3GTms/KKJSfHt6VTq+cKmiql/UINzSgPAgGxNUgJLsThmTybbeYTEEoZiybx19rXdAzDny7bvBTIY4kadTrVjCDl+v0pQeYbFIdSQzffmR19XXVYzbZEZuD5EOwNcgG9L5QBm0bvXGHN7KH65UuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlIVMZJx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbG2GIlW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgG4Q3350514
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EhIyxCwm/BJ04o7hWF6DK1VS1fUMNrNwJkBwJoBorf8=; b=QlIVMZJxT321ZLMs
	cHpBLRGbQZPDc2GeP4NTxwSiPbaUEAVWJnXvrqGMLOpMlIoDpVzx8H3XhKJE/JNd
	ygWdLRmGiLC4C28q5a7yOl9zN8Qhw3Pm2qJ1pGSwtIeRdUEwMDq3ng9aT2rngigX
	UJ6d8RW5rvcuwOtDGClMHjluNRIOW2PvhruAAiln/cmlxdVbsXkdimT7hsGWjhe7
	D8vM4bKEVtbSkzy7C9bcAws4ZvVzpcGucHnYUkEykcZyek1evOmzK6T7L0RlHSvu
	xzA88nN2K0RBhAuexXG9I0IAsIwBJV2kogwnqZeAbsh2uCT24ORdR/ZN6itkV2qe
	Go/27A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxcb0hhbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:03:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c61dee98720so2612531a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 19:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769483003; x=1770087803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EhIyxCwm/BJ04o7hWF6DK1VS1fUMNrNwJkBwJoBorf8=;
        b=PbG2GIlWT9csuV38wKtxZQdsLnoCuW2O9xQxm0vGr5KSICe093sInsngP7gXE78p9M
         oFbkUYXxZ/xOavBDGok8y8UjhsBibHBwMJabzTn6d1nxutsb3mo0tApgumbD5q0mh+UO
         Kp6ajtWHJOyw31Q8NJDtRL1LN+D8HQdzo4HxHkAD2uK90mOsYcsR18PCbiqO0Qlhw4rv
         W6gpYwmDit296kn56Q99+/JhE6lPBafj4nIEUmg6bFYvfE81wKOb7su2U3w0xMXU1LfP
         mLU1QNCPTPRmBJuQFt3w4tGCFVBPSlHlwM9jpuFF4DeeX+rx3/sV9cOQi7moLSTfvx3s
         D2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769483003; x=1770087803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhIyxCwm/BJ04o7hWF6DK1VS1fUMNrNwJkBwJoBorf8=;
        b=O3Pf9Vm5hgAFyKa5Z9LxjhEwBrbn2zvp42Ow5WGQ0sHEg+MnRUx64b3n55FuIX5HHB
         ruQRg0/6c7j7MA48h6JPEB5LRcIocsB9mupm8SkwwxvrWwJ+9dDWT88sKkGhKcMJBh5S
         nPhw+NzCG4Jz5jUd525O39bmBKCLwpSWjIQdJmzAoDJAD88TKBLmadU1RrvrkHPkqbae
         mZrcq+lKBgizIoOPA90IX1GbGta9i8JiMgQaMMQwAKFWjUDr0IlFgTrGA8h5MbGBUDqP
         V8xRc00MbljslkUVksj1sEu20L8vpVvIrHewFhCvyBruny1mdKeF8vKh5ElF0hESgeJ+
         TCBg==
X-Forwarded-Encrypted: i=1; AJvYcCWP8uD2AHTOtlRxw9Nr2iMQzkd48tU99B1oic0f8BS2Y3aQx28T1gUkCHUZCibEYh+Vig6V2NYlC13u+ULv@vger.kernel.org
X-Gm-Message-State: AOJu0YyHTmelcc3xW3vK/2Q2mnftBP6h9edPlnD66jEaSbdVgQkRRHrK
	HkPI7VzashcwygStB7K64090DxGuLlN9VOB62DhGlvTZEt3BPxLO1m5mK+s4XQ9p79TiNLSEFX8
	WFR1he4rW8ACfmpqWXpnTjHtjnghkyjw7Yt62PLDAE13EM3lhJgiKgkFKuPKUO2dkvzEGGOUdpm
	dz
X-Gm-Gg: AZuq6aIACnthNrhm5AsH9ntPkPcreXvfP+9x7a04fkgisr/NXfEprc10kWMHWGxTaPg
	7or3pzmg/GNWivWP+60t4tLij6VUQyDHoJGEaaWFblzSX8c+PJVhJtW172V+k9BAPdjwei8xy/T
	nSx37VhDWB5tcofCarBiW136To17Vqx6OSWBhMmoaeJr+QO6NtPpeuT1CL+lQN55cbu/HaI/T+0
	Tbm8PbRARdmLRrpoWS98CaDGJgeKegb6STNZB1PtWgxwmk5csdhj2p0bwMV7PNLdkuH+QSMlu5T
	G1QYLNYV3igZhipmUl8ObjZ5JuEHrk7GwKm2GKg10zt70ANLdFErLVuOHW1FKTn4xNvDPo9ukxh
	2D34EnLrEKOsSQdabuGTiBFkGi2XF05I42FA0HTA=
X-Received: by 2002:a05:6a20:7290:b0:38b:ecae:670c with SMTP id adf61e73a8af0-38ec62c7248mr146925637.25.1769483002934;
        Mon, 26 Jan 2026 19:03:22 -0800 (PST)
X-Received: by 2002:a05:6a20:7290:b0:38b:ecae:670c with SMTP id adf61e73a8af0-38ec62c7248mr146895637.25.1769483002422;
        Mon, 26 Jan 2026 19:03:22 -0800 (PST)
Received: from [10.239.133.242] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a425254sm9558200a12.29.2026.01.26.19.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 19:03:21 -0800 (PST)
Message-ID: <c1efbad6-4ea6-4261-b7b0-7cb8081ecfb1@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:43:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/7] qcom-tgu: Add support to configure next action
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-6-songwei.chai@oss.qualcomm.com>
 <f211054c-ecb7-4f90-b9ce-9fdd7710c8c4@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <f211054c-ecb7-4f90-b9ce-9fdd7710c8c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wC1cXE1_wOX9PFffueoICnV7_7aXdNTw
X-Proofpoint-GUID: wC1cXE1_wOX9PFffueoICnV7_7aXdNTw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyNCBTYWx0ZWRfXyF+GBoS30Aab
 odamTDA3smloi2lPH35gM0/rIKwS5uml8IudjvRDmOqZ/NgPZSNoJU3UHWScry/WKiqUxZwDRRN
 zISWVuO/ykdMjX37+PZctDzDkIlL1E2IGeOf7ixj94lsLfyQPh2jsmYsUDh10KD0G/ZZf3f2GkQ
 S6rHWEdNEL2ZH0f98uxzCPXsNhy2rHv7+8twGO1uuvu45QEMPlhoxAUSWbg2p9h1XDpGzc2bcvh
 G1Ez4so3vq2mecWXotIev+/2sMNaUQmVXUHSvmDxTMHtzqCKTZLKA6ZGaBqz0cXZaaIo1g5op/l
 ejdIRgmRWqRPGb+iNErEyAE96dCkDC15IIpxWMVODF/lOd7HeL7dqrd9pdshEww1rtkPXd4wg02
 xVLYoZFGFKGrVViewv9qmPbxiA5PjYZbdfq3eW49BMjoFt+npbQ6ip6RyuBp8WqOb0N1pjyW9gh
 9d0sOY40SNQRrgP23nw==
X-Authority-Analysis: v=2.4 cv=IdyKmGqa c=1 sm=1 tr=0 ts=69782afc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wydLmLRrjYZFsxpKGVkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90639-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99BF48F630
X-Rspamd-Action: no action



On 1/13/2026 7:15 PM, Konrad Dybcio wrote:
> On 1/9/26 3:11 AM, Songwei Chai wrote:
>> Add "select" node for each step to determine if another step is taken,
>> trigger(s) are generated, counters/timers incremented/decremented, etc.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		case TGU_CONDITION_SELECT:
>> +		/* 'default' register is at the end of 'select' region */
>> +			if (tgu_attr->reg_num ==
>> +			    drvdata->max_condition_select - 1)
>> +				attr->name = "default";
>> +			ret = (tgu_attr->reg_num <
>> +				drvdata->max_condition_select) ?
>> +				attr->mode : 0;
> 
> similarly to my previous comments
> 
> [...]
> 
>> +	for (i = 0; i < drvdata->max_step; i++) {
>> +		for (j = 0; j < drvdata->max_condition_select; j++) {
>> +			index = check_array_location(drvdata, i,
>> +						TGU_CONDITION_SELECT, j);
>> +
>> +			if (index == -EINVAL)
> 
> stray \n
>> +				goto exit;
>> +
>> +			writel(drvdata->value_table->condition_select[index],
>> +				drvdata->base + CONDITION_SELECT_STEP(i, j));
>> +		}
>> +	}
>>   	/* Enable TGU to program the triggers */
>>   	writel(1, drvdata->base + TGU_CONTROL);
>>   exit:
>> @@ -225,6 +258,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
>>   
>>   	devid = readl(drvdata->base + TGU_DEVID);
>>   	drvdata->max_condition_decode = TGU_DEVID_CONDITIONS(devid);
>> +	/* select region has an additional 'default' register */
>> +	drvdata->max_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
>>   }
>>   
>>   static int tgu_enable(struct device *dev)
>> @@ -356,6 +391,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
>>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
>>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
>>   	NULL,
>>   };
>>   
>> @@ -363,8 +406,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>>   {
>>   	struct device *dev = &adev->dev;
>>   	struct tgu_drvdata *drvdata;
>> -	size_t priority_size, condition_size;
>> -	unsigned int *priority, *condition;
>> +	size_t priority_size, condition_size, select_size;
>> +	unsigned int *priority, *condition, *select;
>>   	int ret;
>>   
>>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> @@ -417,6 +460,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>>   
>>   	drvdata->value_table->condition_decode = condition;
>>   
>> +	select_size = drvdata->max_condition_select * drvdata->max_step *
>> +		      sizeof(*(drvdata->value_table->condition_select));
>> +
>> +	select = devm_kzalloc(dev, select_size, GFP_KERNEL);
>> +
>> +	if (!select)
> 
> stray \n
Will improve this based on the comments above.
> 
>> +		return -ENOMEM;
>> +
>> +	drvdata->value_table->condition_select = select;
> 
> I don't see a need for an intemediate variable here

This was done intentionally, following the earlier suggestion in v9 to
introduce named intermediate variables for better readability when 
dealing with allocations.

I’m happy to inline the allocation if you prefer the simpler form here.

> 
> [...]
> 
>>    * @max_condition_decode: Maximum number of condition_decode
>> + * @max_condition_select: Maximum number of condition_select
> 
> Maximum value, perhaps? You haven't explained the feature very well
> so I'm not sure what this is supposed to reflect
Will add "Maximum value" description in cover letter.
> 
> Konrad


