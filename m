Return-Path: <linux-arm-msm+bounces-53331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34FCA7D339
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 07:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C43C3AD017
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 05:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BE214F123;
	Mon,  7 Apr 2025 05:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzT4Nn9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE354184E
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 05:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744002046; cv=none; b=ALZHLqNDGmHjUedGyIgR7uLGRfBODMryAdK0yApumWxBbXAg9X1lC13Dz6rjSuX+6H1RstQJlF5ubKMYjQWrg4aVce9IbcDQ/kC/6LrslaOrMZ/CQtO+obqkaa34FBSPk1jBzO+0HC5Xg8/MlBp6yfaMUq4mT+DF37CJPQu1iAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744002046; c=relaxed/simple;
	bh=f9FLUr9JHh4KPmF0pAf5Tib5RtqWE3Aqplq2M7SyWs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqEtgPjjsrSnodMDOcsnmLdkXJFYCIpoOaOF5IYnAhWU8bmgS5Kt81Mur8M+u/U6ZMC0sBIFw1HqXOIQusxtH4Nync6KCpqvdRiMgSAKjEgSNUX21UyZy/Dhyxt8jXHyh/JII0pop3q+QBoNHWv5+69HUt8mSBncKIYGhn6qbDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzT4Nn9e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536NeJdo003435
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Apr 2025 05:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPG+KNjvl2uOoYVxg7pkjx2MUlutCIk4Vr5rHK6eEBM=; b=RzT4Nn9eAzD9HHMa
	HSrT9GJ0IcJcX2aOpC4kuRb/Jd6fS61GH9pY69Ldb00MRUU1TEvD0aoEa4+wy0V2
	XiFv+0zL3WiTlyihFY5mbXOIuGzMi3aEslN9NhReBzkDHUre1VGzlkeq/40n8CFm
	ubeN/s5oFjq/Jii2UfTpzNDiny3CeZ/u8+pmhqVyL7Yhg1H7UWeesJWRfO25jk5O
	7a1NWQxWLOHCcKUsvUaRkmJLP7K6VsMGvV0ldZ/jNS5KALSftxZL26tkPxRHz/mT
	puqu5jqEoIfZgkclLIC+G+/kQcvhOELJmJfkxn/y7BnMvEap1JzO9qK3YuH1E86F
	5i7W2w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkaxx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 05:00:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2255ae39f8fso53326955ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 22:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744002041; x=1744606841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPG+KNjvl2uOoYVxg7pkjx2MUlutCIk4Vr5rHK6eEBM=;
        b=tNNqa+UhYmDoix0dXpza5umRFXJ4mpahtPr0SALWkN6DmCQAKO6N60ELiLHgKdmn7K
         wVdaw+rnuLUEnzy1s7pP371J+jrj6t6Y1r9SJCcM+ppvwu5Vp4IKDM7UrR4OdLJZ9zWY
         QOi4PnPb5EAnLOg+scNJr/d21Srd8skTzZX9QqUovJv81GKBphvf02MmGmT2Kn3dhG6G
         NMsWDjcr8dJq2VgcD9AQiOFq5emo0QMyfifg2w3eGMDWSxQUuA7qfCOZjlEskAX6SBXr
         ZpkeYQnYODwmRS5doTWCKw0RDK7Z327XSb6NCpHI/7riW1Fb0RNnS720OrsPO0qEz4cE
         ahQw==
X-Forwarded-Encrypted: i=1; AJvYcCWeGfi55bdxK9yEFnG1J5EE3F5jt/9Nk0/VdEhmeW4UqZuY8xeagHnb11X8YDBFvhMxvojnZ2DmAznGMTTq@vger.kernel.org
X-Gm-Message-State: AOJu0YwOObs/CdOVwntMfoXGt3ZG2VvfB3FDyp1bBRnc5BWvfgDbhtVk
	jwCH5E0te09uqZBDJPeniwV4rDulwDEK+8f53TOxe9lzTUEkofsDLVDSsnz7QAwKqL91KRwcdVy
	9BILtWlbyQMK0V8pTSLksgu1M4ONWll9QmEhjXdg8dr62r82w4ZerfvkGVK6stxSJ
X-Gm-Gg: ASbGnctJVFa6c9klbknDi6TcyF/d9O4yWGaEkJx0nuOoG6h8khEejUgmGTMk6z5ZWC6
	eCICrrHa0G3aEdErvs+v36ep0Muy4Hb82FWyz/Ezg58g/47KyQueg3j8x6a7oSKQK9NvBO8nQuD
	9rMkDKDhXYRJZSB+YrOfhUXTh6Si9HVRwYoRY85igTXISvmJKIg1LEY+aL/TlbHtPWgNUvi5nLT
	Gn/R0AfwLQSMDERUiBSvpldH2wAuDWSqETg5q1Im+6yPImDlQles9ITBlBKOsdeIOzYYUdMliay
	LfEsTaV2mGFgiSQlPOFLeDfzOC8sx2wjdmON8r6ZlioB
X-Received: by 2002:a17:903:1b0e:b0:224:3d:2ffd with SMTP id d9443c01a7336-2297660f59bmr209706255ad.17.1744002041059;
        Sun, 06 Apr 2025 22:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG3Z9u/HwCpfZAjz4oPU4NfpleqOHBQXXQAU5P8eH/nEpn2HytVe4I1iGQdqVu2jL4z81qtw==
X-Received: by 2002:a17:903:1b0e:b0:224:3d:2ffd with SMTP id d9443c01a7336-2297660f59bmr209705925ad.17.1744002040666;
        Sun, 06 Apr 2025 22:00:40 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b45b4sm7517729b3a.151.2025.04.06.22.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 22:00:40 -0700 (PDT)
Message-ID: <1869a579-40aa-4b73-a503-a1e781a0537a@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 10:30:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/8] soc: qcom: smem: introduce qcom_smem_get_machid()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
 <20250403120304.2345677-5-gokul.sriram.p@oss.qualcomm.com>
 <63831566-2975-4ef8-9057-239e0603adee@oss.qualcomm.com>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <63831566-2975-4ef8-9057-239e0603adee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zJU6qG4O8uVHVgK3M6meBzQX0Vv4HpAD
X-Proofpoint-ORIG-GUID: zJU6qG4O8uVHVgK3M6meBzQX0Vv4HpAD
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f35bfa cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=GGSKKsJ9ZFKbGOncAKIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=945 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070033


On 4/5/2025 4:15 AM, Konrad Dybcio wrote:
> On 4/3/25 2:03 PM, Gokul Sriram Palanisamy wrote:
>> Introduce a helper to return the machid which is used to identify the
>> specific board variant derived from the same SoC.
>>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/smem.c       | 26 ++++++++++++++++++++++++++
>>  include/linux/soc/qcom/smem.h |  1 +
>>  2 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
>> index 592819701809..327f7358191d 100644
>> --- a/drivers/soc/qcom/smem.c
>> +++ b/drivers/soc/qcom/smem.c
>> @@ -827,6 +827,32 @@ int qcom_smem_get_soc_id(u32 *id)
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_smem_get_soc_id);
>>  
>> +/**
>> + * qcom_smem_get_machid() - return the machid
>> + * @id:	On success, we return the machid here.
>> + *
>> + * generate machid from HW/SW build ID and return it.
>> + *
>> + * Return: 0 on success, negative errno on failure.
>> + */
>> +
>> +int qcom_smem_get_machid(u32 *id)
>> +{
>> +	struct socinfo *info;
>> +
>> +	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
>> +	if (IS_ERR(info))
>> +		return PTR_ERR(info);
>> +
>> +	*id = ((info->hw_plat << 24) |
>> +	      (((info->plat_ver & 0xffff0000) >> 16) << 16) |
>> +	      ((info->plat_ver & 0x0000ffff) << 8) |
>> +	      (info->hw_plat_subtype));
> FIELD_PREP + GENMASK, not raw bit ops, please
>
> Is this format specific to this usecase, or is it used more widely?
> If the former, it may be better to export these variables separately
> and combine them into this specific combination of fields in the
> consumer
>
This is specific to this usecase. Will use FIELD_PREP and GENMASK.

Regards,
Gokul


