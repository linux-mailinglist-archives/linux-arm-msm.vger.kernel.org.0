Return-Path: <linux-arm-msm+bounces-84837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE61CB18A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A41B43109EA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEE51DC985;
	Wed, 10 Dec 2025 00:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJcYUaNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUneziLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1381D5CFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327272; cv=none; b=H0bGzrui/ZIpBJufThZTV7YAgg1XgEFwSqzYFJEsulB7vXb7UORY9N3gzk87Kb/Wtu6Fmx/KySYAuAeng2ueIAHKbAAAmyG/EEcLVMdRmvqn1NpfXDKTDZ47BA6HGHKoFswSCjeIaRWvw5N5Nl+2JTf/m/2rG1jL4gYNE7fLJiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327272; c=relaxed/simple;
	bh=xeqmfOlgG0sEuAL8rXNZb1QB7cLX7cGRP7Z8oixjCd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3BF35kuQF0Kz0oxIoE4iTKqotB2hejO3iF1qxd0EPx/KdHqxXy6MNa0ZBFlyhWpKH9j84uKwKLIvSTTq9Dk6lGAwZljvEF18BpoL8MH7dqYy4hB6iha8kIAT1svge9oakk6X6HlS/AvkXz0hsVck6LS6T3hrPOLgP4lP2AJF7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJcYUaNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUneziLh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0O4fl1721550
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KpHq8e+rzOblWR1Otj2Bnub2ZRaMCmLn7qEYw0+NqfI=; b=lJcYUaNHMpXGV9uJ
	iqSnlbqMOxYZ+uUXpws0jbHRxVme7edc1HiqY71jDbb2fKsgRf3IDWb2Wco572FO
	iQFPc8NqU+dKSJCH3wp3gSAHKIEPHZdpx4+9Yy4q5qGkrpRGOs0VkBtUQ/rr4gcK
	aXjnxwCYvg6BWANbgk+SeTjsAe7ycKJxor/UH68SBRP90vqnZzl73Eif7/2IsjnR
	yB1eI470OW9FNAHhQYBZu0gzblmMQMnkhTHKbFk2Q3pGujNsu1RfTgSSRbCXZLdS
	C15Nc6fHQrpY9hbFbTYRS8Prv8X3yiL9fNEieeTq2hcISC7DqnFQa/JE3Zj0szvv
	/hexfw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqu596sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:41:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b82c1cbfc0so1892176b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 16:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327269; x=1765932069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KpHq8e+rzOblWR1Otj2Bnub2ZRaMCmLn7qEYw0+NqfI=;
        b=YUneziLh73lBYsKn4+KwuaPeOMzuwiZLT/1LBrK7scxGD1eUFR4T42O8sclJIiUSNb
         cj4uQ3zd5OZg1CBeVL4e3T5ioePbwbY0c/4/qzK2iyJrwoh6LgbRmMEyh4gqDWY9QA80
         /6JaPShy2S/dHOBx3kWQ03wAK2G8+5A0wgOXIEGbij5k+mdyiAPw069o4u0a0xOW+INx
         M9qqOSFMM1R2J9Ys1W3lLpyXmVwGiYKqVn/XKImgNbNNRd6bIupSnCTrV77kVAnBbI5o
         nUbUDgF8QBvxET4MvqRcHcjsUkBbRJiMhOnANrZ5Pbn8h8xC0xwMM3B9fEyO9g9z8HZ3
         oP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327269; x=1765932069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpHq8e+rzOblWR1Otj2Bnub2ZRaMCmLn7qEYw0+NqfI=;
        b=gTAyGRlZ/sEqfFfE5J7/2tFR94yeZiq+RU2CIj3DPRrUhyZRmi/ao9lNvzrxbHZdkF
         nB5F1B81LZSlga3bzL38ZUhiuFEF8vgqPSspPNGjstx9gyXk8Ok3Ynwa20F/WPrV+IHj
         8wMEBIVTrX8piJQORyA0H1waSEL9rjV3QyRM1aoAVQrdFEjIvGE0uVO/X0YTbdD2/+T/
         NnQTzgJDDeP1ZEvsX1gbP2e0tT+CV+q1Mf0ZycdSQyCmFl2kmoJUKRrHcHB85sECbxGL
         oCqCwTB7x6k0CR/NPERkqZiUhdUOfL0KfIQCfobVB+xUUMfXdGh3fys6OgmESIoIHxR1
         pZtw==
X-Forwarded-Encrypted: i=1; AJvYcCXwqTR0SX5AHgyE4HXyasRsJ+L0yDY++oQX5S17VIaVE8YVuNnXcuMUd14WnJI7IQ1yKz7t0Y3x2MS0z9ux@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaz9v26nK/jDFV/mng/hmHtCvjJg77nvOSOPtWmLPX3wjQ3c+7
	B9ORWpoe85VYK9gItlGXOE4P20papHw1B3Y+OCcVODjUdVQt2C4l/WyDnwsPQLp7Pj6/ahnXR5e
	28w7ljiGV+rR0qz+OoBEaQjejrBNIeF6wCly7iVrdy7CHqEC27Us4fs3sO0hTtYFt02F+
X-Gm-Gg: ASbGnctpPvzZAEoA/VB+e6n15UJGkEN7oF1gqQcX4G9SDylkUah4JzrkLv2nbIox3O3
	FNrMfU4AIUu6h1AV+YQqKTM1GYCLHs7xh9d5HIlWKgufjH+ConshbAQpbVIYhkFStwFQ8LcOfUr
	JZ14CWv53wGgdQlTwa3zl0B8LhuA+Y/TqAPCv532V13yt7k50OtBQf4A7Q9/Z839rjM4DiWhRxQ
	yZ86ex/Srpdn2diM8F9MIGiGFrzCmnUKW+PXKCL+SPEOaUa3AFFyDsRNCvxrVlIboO+pjGMWEgo
	GLbkA0gRHTS84V806ujcTN5chcDyEEXgFyyCk9xI7m2U0RVW2YhoIfdRGMvOC9jCvlBUufRKb96
	LOBIw/Xa1OXIIXmEaCtegaKvUCUUNFfFAu3713Cfq5dDHyGnlxGpLfnNw0CNmw+FGRGLdLhi+
X-Received: by 2002:a05:7022:4412:b0:119:e56a:4ffb with SMTP id a92af1059eb24-11f295e928emr284362c88.0.1765327268568;
        Tue, 09 Dec 2025 16:41:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHN4NydTdOkt6aEZALk1kr37wzVOrYv3cSNMyVW304DCl4uPSSkxNcUAUgk1KT3J7WVzfR6g==
X-Received: by 2002:a05:7022:4412:b0:119:e56a:4ffb with SMTP id a92af1059eb24-11f295e928emr284334c88.0.1765327267967;
        Tue, 09 Dec 2025 16:41:07 -0800 (PST)
Received: from [10.110.63.171] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm3886402c88.17.2025.12.09.16.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 16:41:07 -0800 (PST)
Message-ID: <410718de-560e-447e-9fb7-4fec522965ed@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 16:41:06 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
 <20251202-av1d_stateful_v3-v8-4-2f74a81773b4@oss.qualcomm.com>
 <161da76e-b05f-4267-a4b8-bf290b74f85e@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <161da76e-b05f-4267-a4b8-bf290b74f85e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ah7-MB8nXza9Rzgl8pnjki2zDXVJukks
X-Authority-Analysis: v=2.4 cv=Y7/1cxeN c=1 sm=1 tr=0 ts=6938c1a5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gZTZSuL91KSOT9wTGzIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ah7-MB8nXza9Rzgl8pnjki2zDXVJukks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwNCBTYWx0ZWRfX0YWYvp0pSzlU
 HcnrJXzy4nRE5LimG4ki64sywY+wisyRi6u51b2P2Lq7IVGeRjltJFliQ96g1evwprqzuAbMA7q
 TchG88m7v9FBVap3mC8VFR14j2FiTDNxmbrak5OQLX2dPHuCJUduk6yLdRxoB0jbfOujyX5KkNo
 7IAOPAgJQVb6NdBCLp8joPsgta9f4QboJj63+ZyXsxwBM4J0xrr+GGw/Jb476mtF8pO1vCHyR3O
 BtbgaLI+ZeJH0I7jET/9ChSLaV62j5H8STixQjWuTCNF6cluG6Qge++cOy3Vo49a/q4ICi6Kb60
 FH3ra9VHefrrIYJJD8WRqXTdQoXr6rPJRY3et7wpa3SYF4veHoWAcDCitzA6hGyOL94lGP+xXxE
 Nen2kmGoRCp5gaaOdkqghuzPWDYtUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100004


On 12/8/2025 2:54 AM, Wangao Wang wrote:
>
>
> On 2025/12/3 7:03, Deepa Guthyappa Madivalara wrote:
>> @@ -805,11 +909,14 @@ const struct iris_platform_data sm8550_data = {
>>           sm8550_vdec_input_config_param_vp9,
>>       .dec_input_config_params_vp9_size =
>>           ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>> +    .dec_input_config_params_av1 =
>> +        sm8550_vdec_input_config_param_av1,
>> +    .dec_input_config_params_av1_size =
>> +        ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>>       .dec_output_config_params =
>>           sm8550_vdec_output_config_params,
>>       .dec_output_config_params_size =
>>           ARRAY_SIZE(sm8550_vdec_output_config_params),
>> -
>>       .enc_input_config_params =
>>           sm8550_venc_input_config_params,
>>       .enc_input_config_params_size =
>> @@ -830,6 +937,9 @@ const struct iris_platform_data sm8550_data = {
>>       .dec_output_prop_vp9 = 
>> sm8550_vdec_subscribe_output_properties_vp9,
>>       .dec_output_prop_vp9_size =
>> ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>> +    .dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
>> +    .dec_output_prop_av1_size =
>> + ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>>         .dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>       .dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> @@ -899,6 +1009,10 @@ const struct iris_platform_data sm8650_data = {
>>           sm8550_vdec_input_config_param_vp9,
>>       .dec_input_config_params_vp9_size =
>>           ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>> +    .dec_input_config_params_av1 =
>> +        sm8550_vdec_input_config_param_av1,
>> +    .dec_input_config_params_av1_size =
>> +        ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>>       .dec_output_config_params =
>>           sm8550_vdec_output_config_params,
>>       .dec_output_config_params_size =
>> @@ -924,6 +1038,9 @@ const struct iris_platform_data sm8650_data = {
>>       .dec_output_prop_vp9 = 
>> sm8550_vdec_subscribe_output_properties_vp9,
>>       .dec_output_prop_vp9_size =
>> ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>> +    .dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
>> +    .dec_output_prop_av1_size =
>> + ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>>         .dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>       .dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>
> dec_input_config_params_av1 also needs to be added for other platforms 
> if they support AV1.
Done.

