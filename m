Return-Path: <linux-arm-msm+bounces-36005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8360A9B1802
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 14:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F9B1F21F1B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 12:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69031D618C;
	Sat, 26 Oct 2024 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2Ds7RkG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62491D5CFE
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729945464; cv=none; b=C0qgk2KjEjzI7h+jkUpTZfPhF680OhGRlkY9q927pAP+8jqyDOwbT3Uk17BvVujfrYfmyElUJtYP0PZl3iYER/NblAeENPTEbj7iOqimZ5gJLkUIMJh57kZz5q4+Nnfd9pJa4/wjvtBdikp/MmIENA0l5ogik9mu4YTtgwoeA6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729945464; c=relaxed/simple;
	bh=JVzpLNQkSjvzTPDG6r/d1PNcnmVsc3m+jEMN7pe31GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8Sm4Di68xANyy+B/7FqgfMpnCWzXMjr5hBSA16whN7wuYZePkmiFAlXx1hj0M4/T3A4Rlc8NRGh70tEAgDo2Ipb+wG67d41BLoBfigGPcTaoLDsvI0kgfiN+ilNqD5pkxq17MBSe41SQXVsE5v0NV8KHr01d3y33BocHeim008=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2Ds7RkG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q5bfWH024696
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 12:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NEHTf5okAsV4fNv8EHBAUJXqgWu2Iw3fUGanifidahM=; b=b2Ds7RkGeYAygVBX
	YPMhNRPlftogPkSVKZHntAb/qBnoCCkkc/3KKwTiYp0xEhnYbflulTPfb1bb5GEa
	xarGKEqG9YAt4q4GFxqMPPzsNXpgsuH767ddvR9R/t0dBXh6JMO5ZfZuSli7sUuQ
	SsqIWcQAZe2TLQyPDhpl2InTF4JuF0wWLJVGbMP5ieER1OmwDOhITyMgJX+cE3AU
	f9tASGkiZGW5lNV0k870BdMJJN/5utOlQ0pV3hIUcYfiTHwps3vj9blSsXzm4+Ki
	PJQd3EnsVOnmDTm/4CtcP4I8luTavgyvpvj34UhylztGfQAigW/3RIe+LKnygsdD
	pvgKig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gp4ds3by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 12:24:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbf5a3192aso6457076d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 05:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729945459; x=1730550259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NEHTf5okAsV4fNv8EHBAUJXqgWu2Iw3fUGanifidahM=;
        b=EXwoog1E0ahMoiTyNlmVf8+U4By8LZAOquMuPAKVgJ86BI24nIUP75mQz4BxpsGLjw
         AZMwNSb8cTumx9B3Jc/BgZkrdfXTTKqbLc68AHxjQYlH0WeWMr3evA4WORMv9qHxHvgt
         hKtaEvQ2Qnx6mn2aqubINfwOcbvBZZJcBLc6WcY2wF34sFOTIsW9HhKkTAx5Tt44ZgG5
         WjhGciyrIUQ3yYTNZE2cqfKRqQuT9nZZBM9kBm+/FYoHhz1X80hvT6JkRxQbainx8/m/
         tjBG47ya4AnVtySo7KLsm2hMDSWuQFKstpNsr7P20wL4ONfEP+TyrI0CNuQe18jgBs8V
         zKCw==
X-Forwarded-Encrypted: i=1; AJvYcCXXII5PcDWAJnS8x21ajNGQipVc8zSifTht5g4NsYo6VAeL6xWr9s3mCscjz7GCHW7lNaBb5sexqNhbCVhD@vger.kernel.org
X-Gm-Message-State: AOJu0YzPkuoZTC27O18DYhmrnpXMYEtVCwSTr5stTfY8gGySwLzPGf72
	Jzs62RWh+ceoedmT/95x3c19MiTjSaKihzKLlsNSnNUZczc3oDZYWfKqMdgq2HpJq1RB/X8pOiM
	D9okBzHK4+DNS+i982HRyofKSNq6gSQ8ijXdCzo+rUO3WN+ul00nlHzswPlpjw8HY
X-Received: by 2002:ad4:5cc1:0:b0:6cb:4e9f:7370 with SMTP id 6a1803df08f44-6d185862964mr17076246d6.12.1729945459547;
        Sat, 26 Oct 2024 05:24:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFKXcdxHJxmTLVgkVghCibNvSdv93HBNl6fpHMmv941oQH8SB8a8JYdjCscLT5BDlX5M4jhw==
X-Received: by 2002:ad4:5cc1:0:b0:6cb:4e9f:7370 with SMTP id 6a1803df08f44-6d185862964mr17076086d6.12.1729945459175;
        Sat, 26 Oct 2024 05:24:19 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3099df78sm169074566b.158.2024.10.26.05.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 05:24:18 -0700 (PDT)
Message-ID: <8a8df92d-a8f1-456c-92cb-d0d485f03345@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 14:24:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] interconnect: qcom: Add EPSS L3 support on SA8775P
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_okukatla@quicinc.com,
        quic_mdtipton@quicinc.com
References: <20240904171209.29120-1-quic_rlaggysh@quicinc.com>
 <20240904171209.29120-4-quic_rlaggysh@quicinc.com>
 <c3efb01d-2138-4b79-97a1-653b7bd531d0@kernel.org>
 <bfcc65b2-97a4-4353-a2fd-dce927c53428@quicinc.com>
 <49aa8205-6324-412d-b03d-c2b3f738cc98@kernel.org>
 <6b89de85-58c0-4808-9a33-6ee7dc26611d@quicinc.com>
 <e7ce51a1-97a1-4d54-a1d4-0f6d279a9055@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e7ce51a1-97a1-4d54-a1d4-0f6d279a9055@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OUxGvVcGqUWh2JLCgq-S71lUE8RvohEk
X-Proofpoint-GUID: OUxGvVcGqUWh2JLCgq-S71lUE8RvohEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260104

On 26.10.2024 1:28 PM, Krzysztof Kozlowski wrote:
> On 25/10/2024 17:38, Raviteja Laggyshetty wrote:
>>
>>
>> On 9/6/2024 10:00 PM, Krzysztof Kozlowski wrote:
>>> On 06/09/2024 17:32, Raviteja Laggyshetty wrote:
>>>>
>>>> On 9/4/2024 11:52 PM, Krzysztof Kozlowski wrote:
>>>>> On 04/09/2024 19:12, Raviteja Laggyshetty wrote:
>>>>>> +
>>>>>>  static const struct qcom_osm_l3_desc epss_l3_l3_vote = {
>>>>>>  	.nodes = epss_l3_nodes,
>>>>>>  	.num_nodes = ARRAY_SIZE(epss_l3_nodes),
>>>>>> @@ -284,6 +307,10 @@ static const struct of_device_id osm_l3_of_match[] = {
>>>>>>  	{ .compatible = "qcom,sm8150-osm-l3", .data = &osm_l3 },
>>>>>>  	{ .compatible = "qcom,sc8180x-osm-l3", .data = &osm_l3 },
>>>>>>  	{ .compatible = "qcom,sm8250-epss-l3", .data = &epss_l3_perf_state },
>>>>>> +	{ .compatible = "qcom,sa8775p-epss-l3-cl0",
>>>>>> +	  .data = &epss_l3_perf_state },
>>>>> Don't grow it but express compatibility.
>>>> ok. Will rename compatible from "qcom,sa8775p-epss-l3-cl0" to "qcom,sa8775p-epss-l3".
>>>
>>> This won't solve the problem. You still grow the table, right?
>>
>> Falling back to "qcom,epss-l3" won't work because we need to vote into perf state register.
>> I am introducing a new fallback compatible "qcom,epss-l3-perf" for perf voting, which can be used for upcoming qcs8300.
> 
> Maybe, no clue, this was 1.5 months ago. I don't have original patches
> in the inbox anymore.
> 
> Just choose something sensible following writing bindings guideline.

You can see that qcom,sm8250-epss-l3 uses the same match data, so that
sounds like a good fit

Konrad

