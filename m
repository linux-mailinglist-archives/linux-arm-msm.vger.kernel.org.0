Return-Path: <linux-arm-msm+bounces-93695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLdLFqpZnGmzEgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:44:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A5A1772AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2B6530104A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1238C1CEAC2;
	Mon, 23 Feb 2026 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZM9McCwB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qismu5fj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAD31EBA14
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854248; cv=none; b=ihWaS0mw0KiPtFQ1+3EgZ86Kws5i4n70q1EaTGva9IlF3KnlEe4XZPDQEorykDeBbcrQUTy+ULgq4N8PE2lCZLj/yYr3O0Kn9w/8l1gmgdYN1LMW4Zkp6IKhNgBbuo/mml0Rpgt9IaMhAuKrxnu0Wgt7ThxFkELR3GyZl6wSA2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854248; c=relaxed/simple;
	bh=Yi8H7qHQNRmG34CKf218WHpWBCdzeaC159ChC4fgB00=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Yl7HM4Z6o5VMM7KqbKDvZMDbJ1b6woBj8QqjTuR8yiiVnCqsi/7fSoIIYnSenH+NXoZ/AJ/6edEsjTEaV3HpvFgbSxI2nJkyzz0JcDM5qwViOixqzgB/kM2jK7DjdWUenNRkuRV+0DtGW/xdVC9mRbW2Z74W+YFOo7ZcqGfOQOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZM9McCwB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qismu5fj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYcSM322187
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alcrGdbe/zlHTbtyFz+7Tq3iXLt4BSGaKdGcafamIUc=; b=ZM9McCwB6whZNjAM
	N4NxqvVw18UeLKZqTjbGTTZgC1ZCf9Lg6H5ai839iUNPpCCnR/lYbMFmiJoYP1Vm
	nrDMu9FZFYoJngHVc5Ar5GXko4lHPhwAJDqMQDm8q5oPv+RtI2jNGIxzLBfZF6/2
	4muUdQtAX5CALNGyefMiii7BtjBnAETcijOSgoIIvgFZiZQn5oHAP2XbYa7Wfye7
	uOvd5YmoqkyXqvbN5P9b9rawVDYi7HpjsktYYGcP8Y53LhgU1BpN8Lzb+x8qhWPb
	p7iaXfVWNOjJUtlF1jndBPUIS6T5DUHbIjesqoZmlQOS2HxC94uXD3QLfCXiZ1P5
	hJq4xw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0g34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:44:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a75ed2f89dso40381355ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771854244; x=1772459044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=alcrGdbe/zlHTbtyFz+7Tq3iXLt4BSGaKdGcafamIUc=;
        b=Qismu5fj7ZDhc5ruZpYx2RQoouAmIZ+bNPQR6X+OSV4O+O562Uj8rjYQaeCmmAKljc
         YylWAYMs93FcwrxrOCtHlzYCjdUutrjXsubVu0w85iPN6YmBtA2HROT0lJrBAbTFoSik
         5A3GiGhdNp2gsasCc9b7onZR6T1fVoMgccGG5hgWWuITl+3isOgkDNd/YKO5mMwbw6za
         eHigyPpXM9JSxUrwXMXvPWWeiNaOv4qGOhmXITtM9Gj9CSGsPHFv/3OfKVSq9i8Y+lVS
         GaNt58557Orw3K7Nc6VW1U9d1KXuoMcHnW9hSt3YJpVjAEQKT+xgAL1Qd4R+BG52RJSk
         OO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771854244; x=1772459044;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alcrGdbe/zlHTbtyFz+7Tq3iXLt4BSGaKdGcafamIUc=;
        b=J19jQeOJYvVUjvFcR5SFDI+reOLSV2HY2lNuhCZsC1BdtcjyFsr7H3MyASccR8c6dN
         KSsRWxfvUaafYsHoJbjjoQIvgn6QGeMhw8aFxfI1+w+Vrio9qJC6FDG1tOsMkIYnUrGl
         cVW3jGgh12G5U2ltnVmdXRg/37zCKCi0cW0ggnzcaBcR1npTAZFDvYsU6exg0I7pvKkB
         Jvn+XQgA69uqnoYJtI/eerkQCaD/jSdVpK+1GrqVqYVWk80lGeE9gmPpu5mwxD9vmToI
         KMmZvLE/RTKwP/Ae3yLOqHdIA+nJb/uQUL4Lh81IS75o4+/IRRKUoOqP3g5erbVcLU/A
         Yieg==
X-Forwarded-Encrypted: i=1; AJvYcCVz+SZjGu5cVFmfhdKvhIhDhZyF7YySp8QnJio26toFFVnqEVOukxU+1wbaUDIGjH+GOvGdIAD5hCMi5CYa@vger.kernel.org
X-Gm-Message-State: AOJu0YyyO2cSSa7pAxk1/LzHshxIKOydyFucdB9V/qUTd0qtrI4X4cXC
	ptu6XE7WV7FB/O+RSDUa7cCfaKuylTBxB4J85Ff2+uWbmETOs28ixzr/IsfcEW5yRZnYhDTLOo8
	ApFF4w0c132oU9YcJAvDRSy+Fpqa9MVtv8W8i87cid/v9cMDCLDoVz1lyScM6axjntjYs
X-Gm-Gg: ATEYQzzAYW4e15p3OBT1m3QQA34QHw/uafucyOksQNkKnnEGpj4mYOb3Xd/naiDH5Xi
	pMbLhFP1mtq+0z0Tj3kwWxXPXwqsSx5QHnDtOCQeJVhFNhaY83sAAZXa46DZmpB8xI8nMLg4jox
	9FmxDNJiKehQSD8ouHxu4cSLSpelzz+hUW5P1oq7APO/L1yUeqbOjCzKaeEw8PqJ0oIcYVm97g8
	t6qcmLzH7AfyFYpbhGhNuM6uVC6wViBlWpLiWL96Q1xopdOisVDGvkS3syu5EDHDfDix7KsLx36
	0qZ4HynQPxE2Kq+OFQBPpTGCzFrwGpXLk/bj9FY4kA7Zwr8v+DUo57Kb1iAEwmtce1APu35+6TC
	JsPwGjOTe6ArMs5a7+a9dn5yLmWjCUZ+CPr66XUh2qVu8DPocQF3UlA==
X-Received: by 2002:a17:903:38cc:b0:2a7:6aa5:68f3 with SMTP id d9443c01a7336-2ad7453cd67mr90390985ad.34.1771854244207;
        Mon, 23 Feb 2026 05:44:04 -0800 (PST)
X-Received: by 2002:a17:903:38cc:b0:2a7:6aa5:68f3 with SMTP id d9443c01a7336-2ad7453cd67mr90390495ad.34.1771854243536;
        Mon, 23 Feb 2026 05:44:03 -0800 (PST)
Received: from [192.168.1.5] ([49.204.105.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5db00sm108246175ad.23.2026.02.23.05.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 05:44:03 -0800 (PST)
Message-ID: <2e5b3197-65fb-471d-9ee1-0f7794f88cce@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:13:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] soc: qcom: geni-se: Introduce helper APIs for
 performance control
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-7-praveen.talari@oss.qualcomm.com>
 <af0eba46-329f-4979-8b8a-fb5dbe2ad992@oss.qualcomm.com>
 <b918cfa9-1f40-4aee-ad91-d6425798bd07@oss.qualcomm.com>
 <24f967b5-0f15-4aed-a81f-ad54f8e541fa@oss.qualcomm.com>
 <92dc98b7-8047-420b-9743-4bcbc7e30fed@oss.qualcomm.com>
 <ac490ba8-18d0-47fc-a662-5a202c5ba95d@oss.qualcomm.com>
 <85bb3a9f-d54a-4b4c-8dbb-6d5461ebb037@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <85bb3a9f-d54a-4b4c-8dbb-6d5461ebb037@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX4Q5kw7iWKgUA
 PugIlGpLTf00QJJC1BB9FbyNg2D53DxjDZOLo6sUCBSUW3uDTcJXOh1bH4FCsD/7cjM4GuKKU3D
 MYos8+yWTmOl5Pmp8DBEhSCL8eRyqxwy+ebyIFi+HhXlolplPe8UbDW85LZIyXatFHWuQI7oIzp
 ao0eD7E4YXGbUftKaDESHKP87Rt4NEwOIXNPu+7pPqYkbBXdWOw+/hZvEnJhRbDu96HCiJzNdY4
 V7WQ2S17Yd+xjXJgIvOpn20ShXxA5w3rm9/WnH7ZEiExE6liPYkRMk2QSY9TFAnXf53/yEdslKF
 FE1leb0p9Lnql4x2twef3+cxESdLJHmXtZ4vRqomFYXxZIxGHVtNaYcWaV+G2261Fbrxwg6Yyu4
 NnDYnHoJzYqRGiundXn/927V/FwJtThPnK0/HYrrdknUWu3QX18DI4t5M1yWCU7XIVr15jo5229
 JhJtLC3KfinXM3LVGCg==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c59a5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nVOepZjDv8C4mF6t9zHebw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iXwbeVWKFuinhdJD7ekA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 2l5962l0_Y6m6nj5a-5q5Qi-9IMZoOtB
X-Proofpoint-ORIG-GUID: 2l5962l0_Y6m6nj5a-5q5Qi-9IMZoOtB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93695-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2A5A1772AD
X-Rspamd-Action: no action

Hi Konrad,

On 2/20/2026 10:53 AM, Praveen Talari wrote:
> Hi Konrad,
> 
> On 2/17/2026 5:55 PM, Konrad Dybcio wrote:
>> On 2/4/26 6:42 AM, Praveen Talari wrote:
>>> Hi Konrad,
>>>
>>> On 2/3/2026 4:44 PM, Konrad Dybcio wrote:
>>>> On 1/30/26 5:54 PM, Praveen Talari wrote:
>>>>> Hi Konrad
>>>>>
>>>>> On 1/30/2026 5:53 PM, Konrad Dybcio wrote:
>>>>>> On 1/12/26 11:47 AM, Praveen Talari wrote:
>>>>>>> The GENI Serial Engine (SE) drivers (I2C, SPI, and SERIAL) currently
>>>>>>> manage performance levels and operating points directly. This 
>>>>>>> resulting
>>>>>>> in code duplication across drivers. such as configuring a 
>>>>>>> specific level
>>>>>>> or find and apply an OPP based on a clock frequency.
>>>>>>>
>>>>>>> Introduce two new helper APIs, geni_se_set_perf_level() and
>>>>>>> geni_se_set_perf_opp(), addresses this issue by providing a 
>>>>>>> streamlined
>>>>>>> method for the GENI Serial Engine (SE) drivers to find and set 
>>>>>>> the OPP
>>>>>>> based on the desired performance level, thereby eliminating 
>>>>>>> redundancy.
>>>>>>>
>>>>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +/**
>>>>>>> + * geni_se_set_perf_level() - Set performance level for GENI SE.
>>>>>>> + * @se: Pointer to the struct geni_se instance.
>>>>>>> + * @level: The desired performance level.
>>>>>>> + *
>>>>>>> + * Sets the performance level by directly calling 
>>>>>>> dev_pm_opp_set_level
>>>>>>> + * on the performance device associated with the SE.
>>>>>>> + *
>>>>>>> + * Return: 0 on success, or a negative error code on failure.
>>>>>>> + */
>>>>>>> +int geni_se_set_perf_level(struct geni_se *se, unsigned long level)
>>>>>>> +{
>>>>>>> +    return dev_pm_opp_set_level(se->pd_list- 
>>>>>>> >pd_devs[DOMAIN_IDX_PERF], level);
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL_GPL(geni_se_set_perf_level);
>>>>>>
>>>>>> This function is never used
>>>>>
>>>>> it will be used by UART driver, not for I2C/SPI.
>>>>
>>>> Adding unused exported symbols is "eeeh"..
>>>
>>> I keep in mind for UART, i have added this API.
>>>>
>>>>>>
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * geni_se_set_perf_opp() - Set performance OPP for GENI SE by 
>>>>>>> frequency.
>>>>>>> + * @se: Pointer to the struct geni_se instance.
>>>>>>> + * @clk_freq: The requested clock frequency.
>>>>>>> + *
>>>>>>> + * Finds the nearest operating performance point (OPP) for the 
>>>>>>> given
>>>>>>> + * clock frequency and applies it to the SE's performance device.
>>>>>>> + *
>>>>>>> + * Return: 0 on success, or a negative error code on failure.
>>>>>>> + */
>>>>>>> +int geni_se_set_perf_opp(struct geni_se *se, unsigned long 
>>>>>>> clk_freq)
>>>>>>
>>>>>> I think with the SPI driver in mind (which seems to do a simple 
>>>>>> rateset
>>>>>
>>>>> APIs were added as generic interfaces shared across I²C/SPI which 
>>>>> is specific to firmware control, not Linux control.
>>>>>
>>>>>> for both backends) we could do:
>>>>>>
>>>>>>> +{
>>>>>>> +    struct device *perf_dev = se->pd_list- 
>>>>>>> >pd_devs[DOMAIN_IDX_PERF];
>>>>>>
>>>>>> Then, we can do struct device * perf_dev = se->dev;
>>>>> I don't think, it is needed since this is specific to firmware 
>>>>> control, not Linux control.
>>>>
>>>> My point is that it doesn't have to be specific to the auto usecase,
>>>> further commonizing the code.
>>>
>>> This API will not useful for non-auto cases as well.
>>
>> This is only because you make it so, with the above suggestion we could
>> do without the .set_rate abstraction in the SPI driver which only does
>> an opp_set_rate in the generic case
> 
> For the generic .set_rate path (which is managed by Linux), we do more 
> than just call dev_pm_opp_set_rate(). The .set_rate callback also 
> performs additional hardware‑specific configuration as part of the rate 
> change.
> 
> SPI enablement on SA8255P follows this generic (non‑SCMI) path:
> https://lore.kernel.org/all/20260112190134.1526646-5- 
> praveen.talari@oss.qualcomm.com/
> 
> Below is the reference implementation of .set_rate used for the generic 
> (non‑SCMI) case:
> 
> +static const struct geni_spi_desc geni_spi = {
> +    .resources_init = geni_se_resources_init,
> +    .set_rate = geni_spi_set_clock_and_bw,
> +    .power_on = geni_se_resources_activate,
> +    .power_off = geni_se_resources_deactivate,
> +};
> 
> 
> static int geni_spi_set_clock_and_bw(struct spi_geni_master *mas,
>                      unsigned long clk_hz)
> {
>      u32 clk_sel, m_clk_cfg, idx, div;
>      struct geni_se *se = &mas->se;
>      int ret;
> 
>      if (clk_hz == mas->cur_speed_hz)
>          return 0;
> 
>      ret = get_spi_clk_cfg(clk_hz, mas, &idx, &div);
>      if (ret) {
>          dev_err(mas->dev, "Err setting clk to %lu: %d\n", clk_hz, ret);
>          return ret;
>      }
> 
>      /*
>       * SPI core clock gets configured with the requested frequency
>       * or the frequency closer to the requested frequency.
>       * For that reason requested frequency is stored in the
>       * cur_speed_hz and referred in the consecutive transfer instead
>       * of calling clk_get_rate() API.
>       */
>      mas->cur_speed_hz = clk_hz;
> 
>      clk_sel = idx & CLK_SEL_MSK;
>      m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
>      writel(clk_sel, se->base + SE_GENI_CLK_SEL);
>      writel(m_clk_cfg, se->base + GENI_SER_M_CLK_CFG);
> 
>      /* Set BW quota for CPU as driver supports FIFO mode only. */
>      se->icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(mas->cur_speed_hz);
>      ret = geni_icc_set_bw(se);
>      if (ret)
>          return ret;
> 
>      return 0;
> }
> 
> In geni_spi_set_clock_and_bw(), the driver not only programs the SPI 
> clock, but also updates internal state and configures ICC bandwidth.
> 
> In particular, dev_pm_opp_set_rate() and dev_pm_opp_set_opp() serve 
> different purposes and are not interchangeable.
> dev_pm_opp_set_rate() selects an OPP based on the requested frequency, 
> performs clock rounding, and programs both clocks and power supplies 
> accordingly.
> 
> On the other hand, dev_pm_opp_set_opp() assumes that the target OPP is 
> already known and applies it directly, without any frequency‑based 
> selection or rounding.
> 
> Given these differences, replacing dev_pm_opp_set_rate() with 
> geni_se_set_perf_opp() would not be equivalent in the generic .set_rate 
> flow.
> 
> 
> 
> /**
>   * dev_pm_opp_set_rate() - Configure new OPP based on frequency
>   * @dev:     device for which we do this operation
>   * @target_freq: frequency to achieve
>   *
>   * This configures the power-supplies to the levels specified by the OPP
>   * corresponding to the target_freq, and programs the clock to a value <=
>   * target_freq, as rounded by clk_round_rate(). Device wanting to run 
> at fmax
>   * provided by the opp, should have already rounded to the target OPP's
>   * frequency.
>   */
> int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq)
> {
>      struct opp_table *opp_table __free(put_opp_table);
>      struct dev_pm_opp *opp __free(put_opp) = NULL;
>      unsigned long freq = 0, temp_freq;
>      bool forced = false;
> 
>      opp_table = _find_opp_table(dev);
>      if (IS_ERR(opp_table)) {
>          dev_err(dev, "%s: device's opp table doesn't exist\n", __func__);
>          return PTR_ERR(opp_table);
>      }
> 
>      if (target_freq) {
>          /*
>           * For IO devices which require an OPP on some platforms/SoCs
>           * while just needing to scale the clock on some others
>           * we look for empty OPP tables with just a clock handle and
>           * scale only the clk. This makes dev_pm_opp_set_rate()
>           * equivalent to a clk_set_rate()
>           */
>          if (!_get_opp_count(opp_table)) {
>              return opp_table->config_clks(dev, opp_table, NULL,
>                                &target_freq, false);
>          }
> 
>          freq = clk_round_rate(opp_table->clk, target_freq);
>          if ((long)freq <= 0)
>              freq = target_freq;
> 
>          /*
>           * The clock driver may support finer resolution of the
>           * frequencies than the OPP table, don't update the frequency we
>           * pass to clk_set_rate() here.
>           */
>          temp_freq = freq;
>          opp = _find_freq_ceil(opp_table, &temp_freq);
>          if (IS_ERR(opp)) {
>              dev_err(dev, "%s: failed to find OPP for freq %lu (%ld)\n",
>                  __func__, freq, PTR_ERR(opp));
>              return PTR_ERR(opp);
>          }
> 
>          /*
>           * An OPP entry specifies the highest frequency at which other
>           * properties of the OPP entry apply. Even if the new OPP is
>           * same as the old one, we may still reach here for a different
>           * value of the frequency. In such a case, do not abort but
>           * configure the hardware to the desired frequency forcefully.
>           */
>          forced = opp_table->current_rate_single_clk != freq;
>      }
> 
>      return _set_opp(dev, opp_table, opp, &freq, forced);
> }
> EXPORT_SYMBOL_GPL(dev_pm_opp_set_rate);
> 
> /**
>   * dev_pm_opp_set_opp() - Configure device for OPP
>   * @dev: device for which we do this operation
>   * @opp: OPP to set to
>   *
>   * This configures the device based on the properties of the OPP passed 
> to this
>   * routine.
>   *
>   * Return: 0 on success, a negative error number otherwise.
>   */
> int dev_pm_opp_set_opp(struct device *dev, struct dev_pm_opp *opp)
> {
>      struct opp_table *opp_table __free(put_opp_table);
> 
>      opp_table = _find_opp_table(dev);
>      if (IS_ERR(opp_table)) {
>          dev_err(dev, "%s: device opp doesn't exist\n", __func__);
>          return PTR_ERR(opp_table);
>      }
> 
>      return _set_opp(dev, opp_table, opp, NULL, false);
> }
> 
> Please correct me if my understanding is incorrect.

I hope the above has addressed your concern.

Thanks,
Praveen
> 
> 
> Thanks,
> Praveen Talari
>>
>> Konrad
> 


