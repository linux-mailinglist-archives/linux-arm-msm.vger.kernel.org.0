Return-Path: <linux-arm-msm+bounces-75178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39352BA12BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4412E188B6E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073AD31BCB5;
	Thu, 25 Sep 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oamREFjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEA131BC8F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828429; cv=none; b=Wf7uKnpn5w3wg42oclrr4LfvwP026lTKV6B8e23L+0Cw56V26q4Pmcd45X9evlTBCxCzzb+O6ogBC5EFdwWo2pGxZx1fKlp/vJ9+M1aZGJ0TqVFD+bpc/QHnTkYu2BDb7gYMfgiuvuPYOVj9/Qf5ErBvWq0rup/eIbSuSIIeVQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828429; c=relaxed/simple;
	bh=Mqlcs0XkCOfvSQoESxCxYhyIHsmY6fFwTw3IEUOGwhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ntAIM3qxLC/Q2sg49zftq2cCr5ei4XLg37xae+Q1PTjBN5DaKkxH7NGI3YNPu4QhMoO6vSqQOwQ04QciszjbjnWptzFsFMINGpf4fysMkHhZo71bkbOQn0IWjYcx00n7I9UYKi+U/1JRMNkmv9myNJwPkrgd1FPHaKC6P+/0N4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oamREFjB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPbDN011346
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gSKcPFjG9aPsKgb4wf4U5eNuAXJv6M7J93dBweMw8L0=; b=oamREFjBK3cJ5tVV
	FPktCA1M5mED3N/nioTAeQ39/G+G7zLiD6XBw5iPkRrF8lBZQTFeDjBsXNUEcbvi
	Z9Yr1U9NNx/GGH4+xyh0zPdbGLrfs3j0AYts8TkJta+BjWgCelUY4zCRANgFkb/S
	efTRcYXlgZ2ykmdowUWjgIjXoRiww/ePyTzgkH5j9a6CIQLxUO2K3Y2ZVzNdWYBq
	fJsaV006a+oLvzDl6Tc9sRFnyajxQv0lkMzMYMQTz0B9t7qnLuRy0sDoUDtY1/9U
	rBTYcJ8dFpX2DewfC080B69GI1pB6h/JH4nTcQg4JzVbjH7S40XyHuvXRZ1+UCMG
	0K3L1A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q04uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:27:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f3aa0f770so2340858b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758828427; x=1759433227;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSKcPFjG9aPsKgb4wf4U5eNuAXJv6M7J93dBweMw8L0=;
        b=GxU1Y90MT5wqb5NbAXPp1QvImRNR0HUTf/aj8Fd4RHc/G/kzcBYrzc00lo/u2A4sqT
         fymeR2GGUFSCJnALqpkDA9q4tCC9dzGkzruVUnNNUuMptxWnX1gNNhKsFfZrKGO8Hiaj
         cMcHDTE2wR6GRhHEHc3yH+IC8XaFXDMTb56Mm+7/cy24fc14S4AiJmpaG1P9c3UGvSDr
         k0JKqd5+WmQuOjLWbGc8JwmFyjpAdYKYcnmSnt74kMNTj5L1wbdwukSVh48lTj2reaAr
         3mbefneRCtUOefz6aT42/S2r35qo37y3QS9FKQZq/794ANuseJYMjf8b4/lsRWHV7KR4
         xgTA==
X-Gm-Message-State: AOJu0YyOu8IdtxwXVpczUUqL6KnmX0OIUsykGBujeC9f6McIs9gWEEDe
	8RGiL5OCVd8AmoI2CbSVliJeweboUAIhw7M3l1ibhC/SO5fnGz72M5nuQEJELuihKGEdpi105d7
	3ihEiZBzYDHrAxP+fDp1MooV0S9rDMFXQLSQDG08CSCchlI6x/zxox+qLtsQTN0FTvO9E
X-Gm-Gg: ASbGncumBdR/dLKfV4fHlOQ3OWRd8n8lOoUAPoaUA1nKeeitlUvi0VXKZuS447rHOrJ
	Mq5XdLXQikl75261ccP+rUA0wCTeRkokcXH2G+92XLKZ836Q223gDfPTdRCEOu8K+wKd2Vwe5r9
	hy3JrhSh1Kq9nDzerfDR8NtrRgEy6ZdQzHGENtCN2ZF6gCi6M5RHFN9VHaCXLa+a3C9x170OvbK
	C6gxMIMpklIEfEwj5h78W3w2AJ22QW+1KKpTkDR2k7WRm3AB3ieZV7uMkXnjRPkUWlmrSBTjFbW
	8OELK1TGyqiv3gVooeCLLNNb4eTr3gP488+IENl2krzqZjO2+gNEnzJ9mTZLa2ZsxLBfY0xqpz0
	=
X-Received: by 2002:a05:6a00:1acf:b0:77e:81fb:709d with SMTP id d2e1a72fcca58-780fce9ed1emr4640132b3a.16.1758828426870;
        Thu, 25 Sep 2025 12:27:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMy6eOxzY8ypIS9vHQ/FKu9NN99OQ7DEYuKzsYPJuPA6rk37cVeqMdF6/e7OryjKzhbyy9Zg==
X-Received: by 2002:a05:6a00:1acf:b0:77e:81fb:709d with SMTP id d2e1a72fcca58-780fce9ed1emr4640112b3a.16.1758828426419;
        Thu, 25 Sep 2025 12:27:06 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06ff4sm2500386b3a.86.2025.09.25.12.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:27:05 -0700 (PDT)
Message-ID: <94f6754f-cc56-09c5-3730-3f36c22e4786@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 00:57:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/8] media: iris: Add support for multiple TZ CP configs
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-3-e323c0b3c0cd@oss.qualcomm.com>
 <050b2cc8-ddbd-4a79-879e-4a2c9e7d95f0@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <050b2cc8-ddbd-4a79-879e-4a2c9e7d95f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DxLikmdAll1p9MdG6ELA5L3ZNag9_hIN
X-Proofpoint-GUID: DxLikmdAll1p9MdG6ELA5L3ZNag9_hIN
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d5978b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=AkZwv1uTgJSVxlfcUQlFCg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=i9OEk1DdV-OKGsAmNacA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXxRcIbl9ysCBw
 7xSIKce/TK3uTnlKnBP9fnATWTdcw7e7jsLux9rS4RCyQXDnzXQFz4SdrcBybmlQTuWH3olE4QM
 Y1QMm3FRXG4g+s+Q3BmL3JolTvF3pu7wTf4dGq1I/Q6+zj+iXTcueW4RG1h5RFHBTlBAxk5s3VC
 cDYtPFPAG/LdK94KJ3qnDvHF6CJ7o3Ws92gqG85NO+QrXPeRCcVmgTHMuH1RTa7F6ddz9GcyPbf
 LvQ1WDHEi9b8RrFqIjt1ksJUTOQ3U4SxnOwxo1XyNp6DOqLdqfhBBg6CZDvko3NyQOspk4QIqRQ
 OLUpbBOYM6wjTTKCdSNyuB31ULF8hyxOrPr8NXwDjz+sh8pFVlJ3rv5qHuTRwXg/Wt9tfftCpqp
 nte74lVjoh0hJJVQBYG/t2MzMr/vxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171


On 9/25/2025 2:31 PM, Konrad Dybcio wrote:
> On 9/25/25 1:14 AM, Vikash Garodia wrote:
>> vpu4 needs an additional configuration w.r.t CP regions. Make the CP
>> configuration as array such that the multiple configuration can be
>> managed per platform.
>>
>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
>> -					     cp_config->cp_size,
>> -					     cp_config->cp_nonpixel_start,
>> -					     cp_config->cp_nonpixel_size);
>> -	if (ret) {
>> -		dev_err(core->dev, "protect memory failed\n");
>> -		qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>> -		return ret;
>> +	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
>> +		cp_config = &core->iris_platform_data->tz_cp_config_data[i];
>> +		ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
>> +						     cp_config->cp_size,
>> +						     cp_config->cp_nonpixel_start,
>> +						     cp_config->cp_nonpixel_size);
>> +		if (ret) {
>> +			dev_err(core->dev, "protect memory failed\n");
>> +			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>> +			return ret;
>> +		}
>>  	}
> 
> Do we need to do any "un-protecting" when unrolling from an error?

Not needed for unwinding part.

Regards,
Vikash

