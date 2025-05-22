Return-Path: <linux-arm-msm+bounces-59002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37813AC042E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 07:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2D9B16288B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 05:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096871A8404;
	Thu, 22 May 2025 05:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYfT3XNT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A12C176AA1
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892927; cv=none; b=UUwAKuQi7UArwrbiGKDgAVULbC9FFeb2mtyMyxH5E8kJmqQOaEw5yvcB7wzL6iQPLea46fb2onnm8WJZVXyQUvA6ojDPKhUDJrebURTOAhxlR5/c0bKhCGkK5/SMJiwWD+6kD+OJ314HeddHcdPmFIztXuy9WKnYBpjmsPwHZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892927; c=relaxed/simple;
	bh=4WjS3MBLsVQ0xHkhISeBISXe04qOs+58KuXq4fyilcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfJ4fnhoaNErUV0Ac4Wl15jO1WNq0kfHrpuwGrhKKGE2IEgdxeQOJ007ocnUr29PI/JcAAIvxFf5UOHJdtEtkh7sTVjKu0rKHG/wb/Ohnn74/Feez7pTny8N1uFuyEAFUu0Asa8PfOJdzojXf6RmWHHe3GSGq02qylkqCNt/WQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYfT3XNT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LI81pH006647
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bou+gNCEaXL0XeXMvvAeOc95W8btQwmQ3Z480u1x1to=; b=eYfT3XNTyLlcHAdF
	P3z8pQKvHfb3KrA1ZBUuSVS8ZysKl5h2EL4qndGpsDzaYKIDhBqx8VjWuDVvk+B+
	Y6cQ0JXlj6HIg7fCBn8Qz4osev4Apmp0+FvB6OW2dpQArya5vb0sTkQTA+56T3Ud
	Pp2xzS79sx5/Ttxq/7AycEEZYc4yvLAncIWRhGhG3iyS3xYa5G0jKlcQUr+YdoE/
	xcIXwrM6wESr5Jk6sUCEh90KSTIO9Kl1ybFi5PV3c/oOczXrHL7ezhlAhgpVUQGW
	qRRfuWAs2eQUAifnLKJoYnwI24vlSbk/9ojpFaVL80oWFK0Oix50OWfOAqW0fbQi
	p7ILRQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0n79k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:48:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30ed6bd1b4cso6225245a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 22:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747892914; x=1748497714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bou+gNCEaXL0XeXMvvAeOc95W8btQwmQ3Z480u1x1to=;
        b=DQJZnGgnCjwaqtmgMa3BU5J93fGsCOCs3k5BB24y1wgEuQO1hdrpvvxq/rsbHLqCU7
         KnM4wOWlwM/miUsQX1VgADGJNzpUrIeBYGzu+4vB0ztQ3JET19fOCeEIrimWgg5c5IA+
         AYgk1hhZNgn90ebLK10TSbEtt0MDOsNDh19LBQos7ghkwLr0KRE4VIKgMfXvtmROwjBj
         xPAYbHHe5u0jgSc6R8qHoo8P7Wp22NTRk6V7VrYfyN4J+HbY3B5Svo3UI/ZhQV2n5R2Q
         W99iANdynpkRu2LAe8pVeFweAOkGf49LCJQC2S0Y84fUGDUGF2eyRmvfOH4hSfAdvyWI
         OXiQ==
X-Gm-Message-State: AOJu0Yzwx94p+ZaH3+phanwmMnX2cXW5R7b127LNiSuqqthvHr6T9tnw
	tQn2tK243LYqlzgBhVZARyxzyg26TAAnDy/2XevSD39LjfcCekgRm006Pi8NcZQlExtqboFmMkO
	dDjATySAIEd8/A+U9VKXBK5gMa9HPueUS1TJxay9kPX2cQMB6LaMGrHxr9j+nnrBMW93R
X-Gm-Gg: ASbGncv35+RPO5K+0eaEOH1cBqC3A1PINagpHwxqCr6FqTR1x2I3p5h0lZ6CfIg5ZrZ
	xwYA+/4poxl82GFW2Zsc/8UKGNS206SaRB40aXHfx/PXLmBwFH5zDdxEwFMpUzM6dZJlNHGTA/Y
	sLxfyK1shilEgmM1/lqNe1UmXMggCbzgDiLPr0Su7DcpGjRL+jek0as9kgfF2bixQ1UmZuFJA7Y
	IeV+tnR9v4ewp5Sc3iopOL/pf3bWmcYheG95ILbP9Mcnw8UVeGNGqJdJelTRLSDzqpDlihLk+Xi
	wXjoCd2EkqMHgOjMLR/qBe4BWgjAtqoB0o6g
X-Received: by 2002:a17:90a:e70f:b0:30c:5604:f646 with SMTP id 98e67ed59e1d1-30e8322584amr37955907a91.25.1747892914340;
        Wed, 21 May 2025 22:48:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgNOxqToB1KHYabYJy9WhRgD+VYXNQftjQxJK1XEgME8dppZ7conz1MOF71gKpeb5L3SI3hQ==
X-Received: by 2002:a17:90a:e70f:b0:30c:5604:f646 with SMTP id 98e67ed59e1d1-30e8322584amr37955873a91.25.1747892913927;
        Wed, 21 May 2025 22:48:33 -0700 (PDT)
Received: from [10.217.199.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b22a9sm4694178a91.6.2025.05.21.22.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:48:33 -0700 (PDT)
Message-ID: <d70da81f-29a6-487c-9781-c2fda6327a75@oss.qualcomm.com>
Date: Thu, 22 May 2025 11:18:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
 <20250521-ddr_stats_-v2-1-2c54ea4fc071@oss.qualcomm.com>
 <c4442c3b-4f05-4031-8b1c-243e3028fc78@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <c4442c3b-4f05-4031-8b1c-243e3028fc78@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AmsmgGXv_rF-MXWT62n_sWsZCT2ZGMeV
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682ebabd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=9XHWcsYYPHk3R0Zu4VsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: AmsmgGXv_rF-MXWT62n_sWsZCT2ZGMeV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1NiBTYWx0ZWRfXxvGqqsLPyJw8
 HzSzWi1NuSVMx9ciTiMx3Y4foYK5m0XR3Nj48bs0Ef0tteyhiDN5Bc8rxXhxCt0fkxKkPvTLoBT
 4QxP7Ox9UC3ZgebkIhSLOcAckJPGElLTxgenzFpioIFXUpq8KlRcoSTykGHMpe76Z+m480oK4YJ
 abXV1x6PjJnTxg7wFhZ96p0tHCKKTWcsZzFbZ2xWApBQtAtl57+V9MzXDHj1+DnwJmOf3f8mrWy
 uw6UtXuVA9M5r2JlYe/oDonnQk1I4I6E1pAkmXB5ogh0cQmgSC/yQyo78ezA71qd2ZFwSVkSdGZ
 7cdQ0RtKbhAtvr+6lu6FYUqSEhSYko2Yav2Ru2qOUYiPYZSdv+9I5mue1U0ci2+wMCGiWdnO//h
 4e/YALbIbKjgZnqaov0nYZAf+KOykYonUTT+gkr+4N8wyBNdYA0dVC5q5HKo4DIe2Ymq5NQV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=822 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220056



On 5/21/2025 10:31 PM, Konrad Dybcio wrote:
> On 5/21/25 10:32 AM, Maulik Shah wrote:
>> DDR statistic provide different DDR LPM and DDR frequency statistic.
>> Add support to read from MSGRAM and display via debugfs.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	case 0:
>> +		seq_printf(s, "DDR LPM Stat Name:0x%x\tcount:%u\tDuration (ticks):%llu\n",
>> +			   DDR_STATS_LPM_NAME(data->name), data->count, data->duration);
>> +		break;
>> +	case 1:
>> +		if (!data->count || !DDR_STATS_FREQ(data->name))
>> +			return;
>> +
>> +		cp_idx = DDR_STATS_CP_IDX(data->name);
>> +		seq_printf(s, "DDR Freq %uMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
>> +			   DDR_STATS_FREQ(data->name), cp_idx, data->count, data->duration);
> 
> clang complains about both prints:
> 
> drivers/soc/qcom/qcom_stats.c:173:7: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
>   172 |                 seq_printf(s, "DDR LPM Stat Name:0x%x\tcount:%u\tDuration (ticks):%llu\n",
>       |                                                    ~~
>       |                                                    %lx
>   173 |                            DDR_STATS_LPM_NAME(data->name), data->count, data->duration);
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> drivers/soc/qcom/qcom_stats.c:181:7: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
>   180 |                 seq_printf(s, "DDR Freq %uMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
>       |                                         ~~
>       |                                         %lu
>   181 |                            DDR_STATS_FREQ(data->name), cp_idx, data->count, data->duration);
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> 

I will update correct format specifiers in v3.

> 
>> +
>> +	key = readl_relaxed(reg + config->ddr_stats_offset + DDR_STATS_MAGIC_KEY_ADDR);
>> +	if (key == DDR_STATS_MAGIC_KEY)
>> +		debugfs_create_file("ddr_stats", 0400, root,
>> +				    (__force void *)reg + config->ddr_stats_offset,
>> +				    &qcom_ddr_stats_fops);
> 
> else
> 	pr_err("Found invalid DDR stats magic\n");
> 
> (because through the compatible, we much expect it to be present)

The qcom,rpmh-stats compatible does not guarantee the DDR stats presence. DDR stats is only present if
magic value matches. The ddr stats was incrementally added over time so older SoCs like SM8150, QCS615
will not have the ddr stats and would end up printing this error during boot up but yes all almost all
rpmh targets do have the DDR stats present. If we are ok to print this error for older SoCs i can add it
or how about using pr_warn instead of pr_err?

Thanks,
Maulik

> 
> Konrad

