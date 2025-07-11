Return-Path: <linux-arm-msm+bounces-64613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB363B01E93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 16:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B29291C80705
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BD02DCF6C;
	Fri, 11 Jul 2025 14:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAy65oV7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC2414884C
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752242710; cv=none; b=O5AvTrEoZYHhWmWroEzwymCFrr9hHTOD2AvoXYZ79h1CUKBrpJbQW7dnMukswJwutLKHXlLRkpIOwFbwGeI5A/uTcerq7U9Y3Pk7MYdSj6kUyii9++Ay1HgCw4HXCwyb06ZNVJbEZQjScYYtx4fC/K9YDHYlTYxtYfAHVSN+I5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752242710; c=relaxed/simple;
	bh=4dxKcU9QbXvfSTxSoaaJNGfgocccWdv5IS5lc1JXfVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjQ72jR+qaSpUxpt7Be63iDVaXLE+URPs96Jyz+77IbEY0xGD1smrapK6A0CXKqU0lAb/skrlxI90WhKSC26XaTTaRX5sqAn5SNZqE2G8vKPlkRCElov40563nYuqObOs10oy0C1mh3F2A9IunQZyZGXqsgucoVZXJDmY5qDfF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAy65oV7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAvZnN027000
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 14:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5Nc0v310TzKIAnAmF8x+4SO3r6UNoo8gbSPjOzoY9Q=; b=VAy65oV7XNcJLDJu
	knAnjIIQ3b3mb6oIf5yPnJSK8hCKFrr4hkRa1+Za1kdRWMp6hBZAOjBequWvhWmE
	KFreuKTkSC56juGiHK45QY2YhnPDBcejUYolqd6jWyNbMrNd1DIo3ILTYoUOpPdT
	4Z9Cs43Il3aVRQYqaV77y6xWNeq1/1YRjpuRpHJ0LAzUxxky+2wyUR+xcWfWXjV3
	KSNWc8dozyIHNrGkzcUo7/X0F2DSvphAhynzeYaG7upAPuPTGK8Vh4+yR7d0WXzU
	EU4ywXgXBLeJjJPZJm5ceXpkLZ+lJDIk2HkJaEqOGBF0uaMBc3jXtE52nAY38q8n
	BP6wZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47u1a2gftg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 14:05:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311ef4fb5eeso1908824a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 07:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242706; x=1752847506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5Nc0v310TzKIAnAmF8x+4SO3r6UNoo8gbSPjOzoY9Q=;
        b=KJGT/3Q3zQUkRliSLCPJ3tw6FSOXQvN/Bnz8WiadvBhXczzse5qv8a4WEc1WF3wJx5
         6WRSaywpUst0Nr+mNTI7RpVm6rC2yq8FL0X0hW+/aZRPaIrgA01lXr3XlGeOq+KPPaGf
         M6MShWQcRFMCRB50p90KEd5FTdvkEWq97/PkP3gpv6bD/qGFz5IjQfUI1/dYVcTiwfUj
         GYnAxQ1LAftvCUwZ4Os1WuD8GKvR1PS9Ydo1QFrT/cMSvLXezDjjvR7ffScoDSqZj3tu
         ZXw4aCv4hvTUwy7hCIoekz+KxAQ6h504OdUE7dD8gM4GFIi3VN6h9HnDSKfpkKcJRUn/
         5ujg==
X-Gm-Message-State: AOJu0YwBWp/bb4DqJXGlnQD172o9kFVY/WBc7rFDwe6AIHAIavgbse7p
	F4Zq7onHZ9zbXJqA2XJAnCB0KKjegOfLqynbbCvm0ZtJdXUxDH29H5QQi6CfpdK5uQ4RX6jORGx
	iVt2XC3O843GXdP2UPoiZ2xJJmHPhEySe2VHTnASalY+Qz64Ohwh5zy2PvlSbpYcuj4dE
X-Gm-Gg: ASbGnctxldMLknqW0BALXpul/8/gcCKOnd0ytrVdtNqQZSgvKYX7EQM71icQe+lTjC7
	XUq7zPSTO6X2IVgplxS3CClM6KgT55QZuP/lAHFEvbQYW/9VN1d/e3Lf3vQbwBe3is60ckv9Ccl
	lKD0KIiXldnyVTzRMo/LYQzZ47YR8O62cyWW36v/q4C8k4PHwc1QKjle8pVfO+2ekCpn5CQriEo
	rNM3YNmB24gcebrU9h7cOtGZuVULBH9XG5YDuuyzG3lnseay7sET/SvbA0c2oQFIC6yzCsQm27e
	tq0/18SvuwMnsHkQb3iUgrdCVmOO/CnT6+iEERiNZFdyOOYdOE6A90O34TDXFMv/0Nl3X3w9Rk6
	dxHYE
X-Received: by 2002:a17:90b:17cc:b0:311:b5ac:6f7d with SMTP id 98e67ed59e1d1-31c4d33afb9mr4837914a91.6.1752242705764;
        Fri, 11 Jul 2025 07:05:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK4OdSQYYYilSR6UhytLzDAwYXm1kM9qOhyxjelukYnu63ROBiibMyxnLbzEyNZ6f4jBGUyQ==
X-Received: by 2002:a17:90b:17cc:b0:311:b5ac:6f7d with SMTP id 98e67ed59e1d1-31c4d33afb9mr4837843a91.6.1752242705009;
        Fri, 11 Jul 2025 07:05:05 -0700 (PDT)
Received: from [192.168.1.7] ([122.164.82.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3eb6136bsm5603555a91.36.2025.07.11.07.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 07:05:04 -0700 (PDT)
Message-ID: <536ba2ff-35cf-4543-b780-0cfdfc753e61@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 19:35:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: socinfo: Add support to retrieve APPSBL build
 details
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711-appsbl_crm_version-v1-1-48b49b1dfdcf@oss.qualcomm.com>
 <3cd5864e-e6cf-404f-94b5-b85866086d76@oss.qualcomm.com>
 <e5bb0197-70e4-4b4e-922f-baaaa2e514c7@oss.qualcomm.com>
 <493987e4-2b1a-42b1-af5e-85cd9f2a5d7c@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <493987e4-2b1a-42b1-af5e-85cd9f2a5d7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MKJgmNZl c=1 sm=1 tr=0 ts=68711a13 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=DYBUwgo+T13nltTf24vfMA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=fqPq5aWTcRkxbabmidcA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5OSBTYWx0ZWRfX5Aq1RRusDCni
 +fnYk7OmU7B0t81vIdt8rIp1HCvolflE0XSasGwoLf2QfPWDX3qHhu48LObg34nVVh+ghDs7Wi6
 d0c1YSUdae7JWHUpt1TMqz3+ZgpUcckeGferfE3XUAAf2AjtkCjKMrenH6Yw+DtPtEatUbbWpK5
 To1rL+CNHBepeCC62YKGYRWIYbUu20CaD96wzy1Q3aSbaKTI8a70U2fmJ5ugqIP7DIa6Cc1Sw0J
 530ghRcorG2w2oolCihhw5R1GFKopfq465f053v5AUn8ZyHB4h3e04HNPs/+0zENHwpWKejzA69
 RQJ/VmgFAH7/qAl5NFHRFHFuo/uHgo6tpe8QwROEfD00bUeFhVNZTPAb0ZRuCxKFKtyGR82chBm
 ierZO2DtJAYXuxwwc6GzXwr2ksBy/MlrW47fd1Pmam8b1DwiUdxiro8SLihFIqw7r9u1aqQj
X-Proofpoint-ORIG-GUID: _8Hgwe3wTOb8iVwTV1XbkuPb11TpmkAo
X-Proofpoint-GUID: _8Hgwe3wTOb8iVwTV1XbkuPb11TpmkAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=613
 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110099


On 7/11/2025 7:00 PM, Konrad Dybcio wrote:
> On 7/11/25 3:24 PM, Kathiravan Thirumoorthy wrote:
>> On 7/11/2025 5:41 PM, Konrad Dybcio wrote:
>>> On 7/11/25 1:03 PM, Kathiravan Thirumoorthy wrote:
>>>> Add support to retrieve APPS (Application Processor Subsystem) Bootloader
>>>> image details from SMEM.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>> Can we expand the driver with all the known IDs at once instead?
>> With respect to the IPQ SoCs only APPSBL image detail is missing, which this change address it
> Next week someone else will come around and say the same thing
> for e.g. automotive platforms
>
>> I can expand the list, but unfortunately don't have ways to validate them. I can check internally with folks to test it or even send an RTF. Till then, can this patch go independently?
> There is nothing to validate here really, the bootloader either
> populates the data or not
>
> For now, this one alone is good to go, but please look into the
> broader scope
Got it! I can send the patch with the remaining bits for the 
completeness in a week or two.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

Thanks!


