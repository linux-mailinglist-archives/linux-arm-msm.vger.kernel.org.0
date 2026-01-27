Return-Path: <linux-arm-msm+bounces-90848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKCsCBnweGkCuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:04:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E1C9824C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B6D3307597E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49F03624A9;
	Tue, 27 Jan 2026 17:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4RaFaED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Abe55SQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EE327FD52
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533268; cv=none; b=DymcvlQpAFnd4VLc6t/I8bcsDb+pafsQ0YsTM0aQcYcoKu54vsTh6D+pJrSkXeJzzNB8J0FfG04x/qkdsBO+nimMPwO+BRX2e7YmRImoQW0o3uzwUwRquhmjJRohVtosql4trj6z13iyX3E7e6azgfwHFHwE9x1gbV5aER7YNbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533268; c=relaxed/simple;
	bh=J2yGHPSTfHwzt35AwU53m7NydZ4+39xVQbnvSnvukfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qil9i3pkSH+BokXTqxm9Jk1mn+Tm+N3KEcXbK2Mz+OnXAc0nq/Uu+eslteDb8zonsIIjBqwUGU10ih4X09fh/ToeLEU3grsUa3dflJBBUIJD1vDsvyVt10Bdl5naO1dy9l4aVXHTv7jyiyGgTG+e+lppIgWjKQnK0d30b2y89YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4RaFaED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Abe55SQs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAbvYB1268765
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MuevM4w2vSJq9WQIfedCt/7HqiIjpe7lqj436dV8Gg0=; b=D4RaFaEDUCI7EB93
	8Cjp6j4uVWEKKHYc2c6VbAY9t3320ATuSTmR4RNzeVUdgsTXuTIU9lHgOR6bHCQV
	MGukVNIx9KtwpQJjikhw31jVtihema/0p3Tk/oI2swv2ibCkd6IZWfBDI6iXCfky
	eJxLkEddu2wTcdn5drJkRwizEGTKe/YGDEg/jotSNehpVRSg5GwO3GeijyWGP0sB
	v2bu12s+UOFrrW+wwp2jR1lKnHPO690aOssOzC5SvGuR3cQhyh7RsRPB0YlLh51N
	prOGfexsgnjzpObVg1OmoGaOAJV30wrtUWuQGNHvxJYWs/rVDpTK4FIiXkl6O/J+
	5Wp1hw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyatjtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:01:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34cc8bf226cso5984775a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769533264; x=1770138064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MuevM4w2vSJq9WQIfedCt/7HqiIjpe7lqj436dV8Gg0=;
        b=Abe55SQsqSKWyrvgMDKyUToQMezNtOqtYHoxWKoQeW0fWBXnuofQcN3mXNB6/hZVJ1
         Z/uRpoBdrOpo+97GXNqZc1jLETYfuJPO6J+GcoDjloF6YDAgt2fGcmO02DS+OMp7wB76
         K2M3YtrYVupUxyHVbpUuoIDw4D1fqtMzdDwu0qW9EbIlyZE0DAOnIlAiv2qCTQW7Ic2Y
         lww0YpbNXmz/XqssPAuaIBmffCC0mVyljeW49HcRkEGgQrr0TVVJnvpL7/yeLI9GT8Hv
         MZ0sfNdsKMTVokJyXxxE0kFWHjkBV7gzaVnH2vUL6W9qOtVzSRPC+S6tr67ib7Hhs8Q5
         Tbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769533264; x=1770138064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuevM4w2vSJq9WQIfedCt/7HqiIjpe7lqj436dV8Gg0=;
        b=ZKZcoco7aH5Jhva+e0w2g9zWVbuuzjdMvJ7FID0D2Z7TLmzuoMgMI5Tr+/axyLzX+9
         M/4/R/KL2gbSAJ6oUnGS3i+PFspLaOjjTMk2sJB5eRYqd9jmT9oPJuZYqYThyw2REMrk
         8aocurVzqcyLyBFejQ0NeHnlooc9DuFCbgdYRAoB096+4AagSnzSn6cerD7UZKlqeno4
         EwadAPSlvhmIxwZNIlc/eU+eYLPtIJ0p14hHuCVdqtuRhFDN668f9KiAdx1WozQzw/8s
         tygx5GpbuBzO93wBeIp0gKFH0U2lZL+qyIVZTSwasYpPs9yIP0mhfku8p5FuqABtAgH/
         GB6g==
X-Forwarded-Encrypted: i=1; AJvYcCUyEps9LiAFNTrtna1RufYlMyCsPJn1Uie3LJ1L0g0esU3sLrie0q1R4zbd4sI2xFZmmteycU2cutEN3R2y@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7l0FjzJzJnDCvpZbL6z9wOz1HPc5a3USlPHohZk35qlbhu89
	IC6OK8t4wO7pJvXR7czLRhcu9w35mu3YHY8nDy7JZiLzFUgRlZKsTX81eqAnUaoU5kUbcXfHkUI
	J7dQpliRvBF7IwBvyiXLWNqsfyU8mWETHizqas4Wx/yzJB2e+A3EoHgIgn7XEkgwHINsA
X-Gm-Gg: AZuq6aIYAf+Co/m0SIa4mAF62DOJS1pNe3L0CbNr7uF7odBr+YPR54T1NumF2KNnq4k
	nLepyJWQ1oS/Emw/j0SHOKaOngnooj439CBfan/wOat3JpIyrBRHk8w1I+ZhpmMjscZQxr9182Y
	G8HuzDSAMvsdOA0wOPbgel/XgZAQxbHc7mqXub8H35zPJbmH/OQ4pzpctRCIOsysUxdGhLaB0ck
	QKS4e3zd17go97Ubuaz1X0tT0hZKtoJ1I8WiEIgpM2vvPtX3+QWfRci1Uo5fWnwhiFEOtZfXS2P
	kwXei2qH4JRo2zsIhLoR5/JLnz6foLd2lOv2Zy+SjzzOwAVvBmrGlgP5V7psWV4YjBApUTc4lEW
	s4p5Oh2MjTjOjkgGWthlr/5Qk/fnIW+S5URScmCfb6ldj63Cc
X-Received: by 2002:a17:90b:2d83:b0:34a:a1c1:90a0 with SMTP id 98e67ed59e1d1-353fed87a85mr1951097a91.28.1769533263559;
        Tue, 27 Jan 2026 09:01:03 -0800 (PST)
X-Received: by 2002:a17:90b:2d83:b0:34a:a1c1:90a0 with SMTP id 98e67ed59e1d1-353fed87a85mr1951065a91.28.1769533263019;
        Tue, 27 Jan 2026 09:01:03 -0800 (PST)
Received: from [192.168.1.5] ([106.212.237.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f17955asm42951a91.0.2026.01.27.09.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 09:01:02 -0800 (PST)
Message-ID: <e5ad14ca-1a4e-4a2d-9c03-392ea6c3c5c7@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 22:30:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: pd-mapper: Add support for SA8775P and
 QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260127144315.4125110-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <e6broy5txvtit5m4otegrmyip5f2iotr3usnpsi2pzvkpeyakl@t5n4smiovw64>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <e6broy5txvtit5m4otegrmyip5f2iotr3usnpsi2pzvkpeyakl@t5n4smiovw64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TPwzJmBEhP7Zo6zirzL5RbyskCQ5EvfL
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=6978ef52 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=buDgOHdOW+2HB7N8kE10CA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kuHux4ygrKcAdbMORpQA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: TPwzJmBEhP7Zo6zirzL5RbyskCQ5EvfL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzOCBTYWx0ZWRfX0yc97zlyGH2i
 VpuJsTzoREpCiAy8OdeXpe/cIYa8PnSw5KkpwcTxMg2TCjZab974W3VPvv6QbTh/tkcmy6DVi5g
 5q2sufDEovU3l9wH6jpXY+UXMdFMxGa8/srM7IPzZ+JLX7qmXh3qpBrsiMpciRDDChXdVzOwKN/
 gatP8UMzF3drGOb78U1mmS1dORf8aQhbbMwyBN+pbZJje0Wj0P9e7MIs6BDsEfP5nG2sCzwqmbK
 uJl2Slfy2LKqx8EG48COGJyNSi2D0SY6kFg7hdIAZwdUI2TMXiKwOsB5P0NJOWiNybJ97B2b3U/
 nTmVP0T080uc6UYOgSsMkiMRUUKkOZgm7CEghEvL13xPKhl50jXRNmT+8JmjR+Ngrbd6RWD3a9k
 fZwN08qELJxK1eMKzakZ4RbV5Hgi6oykdogj3IpMYPP79UIG7BhA/ItcY/F7zf3I/bHYGGg+wth
 8fza1KVJm5DJxn/+LCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270138
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
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-90848-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32E1C9824C
X-Rspamd-Action: no action



On 1/27/2026 8:46 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 08:13:15PM +0530, Mohammad Rafi Shaik wrote:
>> Add support for the Qualcomm SA8775P and QCS8300 SoCs to the
>> protection domain mapper. SA8775P and QCS8300 share the same
>> protection domain configuration as SM8550 with an additional
>> gpdsp domain, except for charger_pd and mpss_pd.
>>
>> Add an entry to the kernel, to avoid the need for userspace to
>> provide this service.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>> changes in [v2]:
>>   - Added missing GPDSP power domain configuration as suggested by Dmitry.
>>   - Link to V1: https://lore.kernel.org/all/20251230102508.1491296-1-mohammad.rafi.shaik@oss.qualcomm.com/
>> ---
>>   drivers/soc/qcom/qcom_pd_mapper.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
>> index 1bcbe6968..aec7ff054 100644
>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
>> @@ -305,6 +305,18 @@ static const struct qcom_pdm_domain_data cdsp_root_pd = {
>>   	.services = { NULL },
>>   };
>>   
>> +static const struct qcom_pdm_domain_data gpdsp_root_pd = {
>> +	.domain = "msm/gpdsp/root_pd",
>> +	.instance_id = 192,
>> +	.services = { NULL },
>> +};
>> +
>> +static const struct qcom_pdm_domain_data gpdsp1_root_pd = {
>> +	.domain = "msm/gpdsp1/root_pd",
>> +	.instance_id = 241,
>> +	.services = { NULL },
>> +};
>> +
>>   static const struct qcom_pdm_domain_data slpi_root_pd = {
>>   	.domain = "msm/slpi/root_pd",
>>   	.instance_id = 90,
>> @@ -401,6 +413,16 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
>>   	NULL,
>>   };
>>   
>> +static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
>> +	&adsp_audio_pd,
>> +	&adsp_root_pd,
>> +	&adsp_sensor_pd,
> 
> I don't see sensors PD in linux-firmware.
> 
>> +	&cdsp_root_pd,
>> +	&gpdsp_root_pd,
>> +	&gpdsp1_root_pd,
>> +	NULL,
>> +};
>> +
>>   static const struct qcom_pdm_domain_data *sc7180_domains[] = {
>>   	&adsp_audio_pd,
>>   	&adsp_root_pd_pdr,
>> @@ -572,6 +594,8 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>>   	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
>>   	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
>>   	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
>> +	{ .compatible = "qcom,qcs8300", .data = sa8775p_domains, },
>> +	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
> 
> THis is definitely not correct, QCS8300 and SA8755P have different sets
> of protection domains.
> 
ACK,

Sorry for the incorrect mapping,

will make sure never happen again, will cross check with linux-firmware 
and update the change

Thank you for highlighting this.

Best Regards,
Rafi.

>>   	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
>>   	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
>>   	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
>> -- 
>> 2.34.1
>>
> 


