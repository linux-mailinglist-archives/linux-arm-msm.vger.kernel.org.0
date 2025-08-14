Return-Path: <linux-arm-msm+bounces-69203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F1DB26421
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4593C1C2017B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609B62EB5CD;
	Thu, 14 Aug 2025 11:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euaRl9WN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C4A318137
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755170506; cv=none; b=qWDSXxEHOBxAnDnJIXWuNPXEnAV8KYO2AgoVFGmiSE861xu/ru4cbd2UzxX9PQEX+42iBVbPMMKCjwFYy+bo+FSMPmsaY++cWCgPnypFml6K1LHRv5jjbTZL/dhs2UbRSzkQjKOnx72dyF5nFOE+CzuXijRbAmRqxww2usgjwuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755170506; c=relaxed/simple;
	bh=AnVdNMo/fM/KCQMMQLsEvfIMWPZn2xenZ+yFprNLl4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UsijSDaZRwBcMiKHcG6uRICAxYI+JgXcib8wgwM3bpBhZahgDVT9xhzn8WoAQUPgNXhVaLtrTGsaouTPM+ulYOmFR1y1N34VOi6vUC/gS5/4UgLtSQD+r7R8/es6ZgQbKrgTF4KmXeyX9JsmEXAdR0P9oXtoNjF1LWUDRuf2zgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euaRl9WN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E99Q5G012828
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BLzSrsvlz1k7U0IApR8xjk7JKOJ6PPWdleXZ1uW1ptM=; b=euaRl9WNX9NsW8OO
	/OnDGUTHnSJqOcIpM+ERPAffH9ircd+a1aV16KBhMT4nLYU3IUTZYcFK2Ba5wX3X
	JiGFsECAxEv2/+2SMItlzqgRzBVwLMjhLmjSTkal6gbFNc4CQADVf6ROuggcLd8H
	C95uH1jq3v48osVuu4V/eFVQ7KRqdQS3IRkJOSiu8sZkSKEPQ3b4IyWbAWYYYaHc
	3p8+495wNoO9fTXi3CLZX0xvipyJunroaaSz5rtcqhL2p+WCYNhHV1eMTHJdxMGn
	oR35uXiO0w/6UjeYURysgxKlSVUY70W6bUJMChqPC93F+cdmTYBpOjzewNWysabv
	bSnDWQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxdmk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:21:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109b11c4eso2603811cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 04:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755170503; x=1755775303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLzSrsvlz1k7U0IApR8xjk7JKOJ6PPWdleXZ1uW1ptM=;
        b=u2Hb++A101GxTZtrKOorOYJ3VrxQk63wN9N3wXzPix/AQF+CC9VVMSiuaSE/TiVTdM
         12pIb0zFK2B/s6AfVZ++yUaw8nKfIppVhxooQgDFpGpLgbEYHZYVXP/DxE8Nw7fE9lfJ
         oJmzsZSumTQVOdA1b1K0wDJnM9sbyXKzXy8cNps9fG848H7iUVCsfNztYsnaKyshDIdZ
         GXtRoyqcKH13eYuRrlI4soTLLlVzu1pgflWu6+xQCQkDc+JTvaMukYrIhruuT9OiN+WV
         iN1363Fj8jz+TCJTLF7089SRY62JE4S03k4XbSXbAICdf/htI5OKoOwp6yhmt1abc6E+
         gEUQ==
X-Gm-Message-State: AOJu0YyIADoLduQ0yNdsLtTlygILPpvKM05mBqzFyYywUtT2k0A2eBJq
	QEGf+SlZVWyr9F3VGz+mgCUWHUI9lflTAeXKOBBHFWhmmNmIgIXj7V2GaouJ9Cda+KnX45WXaT2
	D+cqQRNLSCHhDTmq244y7SlvqRkF5QpRePSWjr6Y+MnmwBMHRdYTcheQF8YOko3qp9mt/
X-Gm-Gg: ASbGnctXCl7BVXbLysyEHSpHSxIBztQZT1wjsL5lLZ8T0ybKkuHfDKOYZpLWiJQadT7
	+QSWYADb4X95XylcXAUi0zlnblGbXxrYwQ0kp/e67oImHJystEhQepot/ooqpjH14w2NWZkoGgW
	LV7sG7RZQ/JFG0EwRezxOjGabQ3B4Y+lBKs9vvfcM33RqaWk8D0SIBe57AuuDwJCgxAqIwy+oCT
	dQxFlUzYbgZPXgyVutmz9ReRyiv6TTmh1F4bvlDbjpouK7yH/+vxe6TF3v7MSRgJBikcIbPzIRC
	xrpZNkruPgkQJEG0mkux6v81siIiYATE7db+xv2ymeI2TLDuv/d0K5OYrno/t/UYqMyieyKJRzS
	t+CLskd9gKOoTjo8dqA==
X-Received: by 2002:ac8:5a0d:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4b10aa82b70mr16850451cf.7.1755170502752;
        Thu, 14 Aug 2025 04:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGvtOWlrpuz/iNQTwiGREwfxnYm+3vQJfqpP9BRWhj2V2vfmiGGO6FJVbo4wdvgDfBPNzUHQ==
X-Received: by 2002:ac8:5a0d:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4b10aa82b70mr16850081cf.7.1755170502199;
        Thu, 14 Aug 2025 04:21:42 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e6cecsm2578916266b.70.2025.08.14.04.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 04:21:41 -0700 (PDT)
Message-ID: <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 13:21:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX1xhCpTc22l54
 GEudVRSHSQHgeSNgeS6S+8tGGCxxtXQDNOGQxB6udIAjvF8Zje2ISWI6CPNyrq8noO1RGWGaJRs
 5WPp/t9ft6Zk/HIv9otPBfzMLVNV6lAs2OYxXMdNVtNkiuQGA4tp2jEOLZrjvDj41KKuUo1c8P3
 +7xRClJkqRwMLpUDR7t3/H2+RjgHWRYeS9u2gBQGnx4MMymNc8ks795uiQcRB2MUwHQV23Ps2XN
 2V0Kub4cKGs/fXBKuVEeY64SQBIKXqd7MCJvIW67ZEUZXO5QYliJ72jDCUp+jF9brnBWELElyTH
 b+ej4s30xF+maFDlz0gC9UYmwtpkNmRwcDWeZ+Ef5mlX5D2XKK5hUHMw9JQcxtMY0XUigkLw+4y
 FpBF8D8t
X-Proofpoint-GUID: RRs-DR0QXGTgAE7xONLDkPgMneqyZWEN
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689dc6c7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=vBWWQJBIfp5UPC7yhvoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RRs-DR0QXGTgAE7xONLDkPgMneqyZWEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 7/31/25 12:19 PM, Konrad Dybcio wrote:
> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>> the Frequency and Power Domain level, but by default we leave the
>> OPP core scale the interconnect ddr path.
>>
>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Changes in v2:
>> - Used proper ACV perfmode bit/freq
>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>>  			.gmu_chipid = 0x7050001,
>>  			.gmu_cgc_mode = 0x00020202,
>> +			.bcms = (const struct a6xx_bcm[]) {
>> +				{ .name = "SH0", .buswidth = 16 },
>> +				{ .name = "MC0", .buswidth = 4 },
>> +				{
>> +					.name = "ACV",
>> +					.fixed = true,
>> +					.perfmode = BIT(3),
>> +					.perfmode_bw = 16500000,
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)

Konrad

