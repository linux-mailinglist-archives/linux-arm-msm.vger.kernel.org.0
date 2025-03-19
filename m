Return-Path: <linux-arm-msm+bounces-51957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E34A68EB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56F287AB942
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6401B422A;
	Wed, 19 Mar 2025 14:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPR/bXOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2EF1B3955
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742393688; cv=none; b=oSCktlzsyrOzVhaam3kehhQNTAc8vwGBTHucM/RmPynuY3qWA/hSc2jexV2tnrvv2YAAMN78EXlmyNdvUZNvzw+Jq1GIqyaN0OeXUTVe7Ec4/Ajj7RdsaOSB5xBRCkDe8h0n+0mXGKmk4w1FUVt1HRT3/oXEouKf+P9FW915UOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742393688; c=relaxed/simple;
	bh=2MCKn9csCxsdPtacIyBliI1wK0R5CgpFopj3E5+OV/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N87KWVjlKnFtg36mL+yt3AKxC6YmKRVPWauXfq8FJLco/1DxJdehBEUKP0Y0CZko3xYbb/CtvxruA/jC6e5/sUqpdFJW/zlnrAylyTB2/DqftQVWfk9BNjXvuKXa1UgF9Q81Z5k91IgZfpx5B2a7bDZoeQ1zVj+WvxfDXZ3RQ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPR/bXOA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JE8DOZ016577
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9lm9ioOTOSwgPJPMJw9RqcbC+GqKLGC7kuCAnVvxm4=; b=WPR/bXOATCo1vEnm
	svUjeRGpp0weEY9S3o7XktquGwjDsCrnkfPATD1OWioYzj0BilZw+/Geq5imvcM+
	6OvGOsO3wMP62WmuROfjwh4FvxO+i42PFFN0+PWXCv/moF890wRSMGCkhQZzj940
	CDC0H56h232yiFhEQtc+x/9u4jfhh6YTYnENiEPIUITb9IUe5AIpEjR7jgzvLh5u
	AWxgg2w6vYmzo6AFJyWqPeT2Cd4IbIe1uSlrQnocETU+q9hi7L9q7Lj+16fb5jF/
	HvfDaTBu72jXnrRm1lV99xYDCwevKVI6dqtBAqJ3HspERcPJuIgQVAgiUIDEmJM1
	5/1xaA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fd1djy0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:14:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e906c7cd2bso20652516d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 07:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742393685; x=1742998485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9lm9ioOTOSwgPJPMJw9RqcbC+GqKLGC7kuCAnVvxm4=;
        b=BWypN62033BxXlA2JCw9HJyUf13OgEJpBMdhoT/voGdCzyb5bNMqvNWdGxiqP4ENOO
         u0ucvVB4x8+pRIMAQjRKDKDHMPk2OEc/Oxs5/nKc3Zz9jzk2OPvAwc0ckUQdUYSJO845
         GWVOAX1vmtiyuXx/bapyY8wF9S2txGHpq++VaHJ8mSIVEZx7FWBGEqx9JxXE57+6HwV+
         tVyIPkue7SXG7MO79VRiI1znumSr6zMAzV+uUB/zURT5d3Q9b4qDxPxQuIZGX/x4uUCj
         tjmXYkltW8EnfysbC2I5LH6e9gv0B8VZfAJVeKxjxCyqFFSUZXSqhVbVf/Vms7rXehbC
         2ZDg==
X-Forwarded-Encrypted: i=1; AJvYcCVfYUpYLo5BSglaE5K/59+Tiw4l1baZ6v2qjkjAs+GrTFgKMSzkr9T/yImD94dYLfhAc4FYN9aoHCdD/Z9I@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxy00yBneJaAGYvaurOWL+hP7sTbmsSC/t98zpBMeHRG7WqnYJ
	ugvGExmsFx/+vgqmtM1d4xn9insdah1CHr9DS2qC6jtZHN2+amu3qwrsV6u8EBD4Cp0ozw6UNdk
	Vb5WrX7ZbhYQLZ2lww2ZYafXYYeaqvMmV9cGgbbHnUuChNWpVUm6jZkyWK3VHRreesdSrzHrO
X-Gm-Gg: ASbGnctiLj2FCOF5GogIXTIycsAeU/2sMJmPhzD0p9M7Zp/Vk8aOFq6gtHKAv/nSi2J
	OHA/VzDa48+8u7Q0G3da4Bid2GaOI/OH6u5X1aIrvrlm/vUI8MqfMFjJ3KLPEKKxwwufZJoyIrq
	EN1A9OmA+fJJy3QYFedk597+muqwk8u1mpp5PhRLMTm7D1+valYqPXV6l8WBvpc/uU6zzDqxFc0
	vXr+WT9frV/hF0BzsVQPxbee2M9/fHrHbPBZC+rnq+TbvSf+vP2Lv1LsQ1x7zz8sB2+j4phyiH4
	Ni/3WncpVtGqGp542Su+oFItUgL0YGwVrvQUKbj2yWEmLLbDn+OmzDn8BESchr5HUh13dw==
X-Received: by 2002:a05:620a:bc9:b0:7c3:d1b9:e667 with SMTP id af79cd13be357-7c5a83da7d6mr168226285a.5.1742393685110;
        Wed, 19 Mar 2025 07:14:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVwXMvt9Q5i8OuLf6HEko618Bxam7kur4WA83u4zm5HOoMhJsZeVA1tQ2ngU8rvFZ6xvwI9g==
X-Received: by 2002:a05:620a:bc9:b0:7c3:d1b9:e667 with SMTP id af79cd13be357-7c5a83da7d6mr168223785a.5.1742393684662;
        Wed, 19 Mar 2025 07:14:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b160dsm9310113a12.41.2025.03.19.07.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 07:14:44 -0700 (PDT)
Message-ID: <881655b5-30c0-42f3-863f-5b6606a3e2cd@oss.qualcomm.com>
Date: Wed, 19 Mar 2025 15:14:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sc7180: Add specific APPS RSC
 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
 <20250318-topic-more_dt_bindings_fixes-v1-2-cb36882ea9cc@oss.qualcomm.com>
 <l4vd2xmrowmmtefieb4cbirq6ntkvnwbhtpxcyzwdeok2vgtt7@zqgqndumgecv>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <l4vd2xmrowmmtefieb4cbirq6ntkvnwbhtpxcyzwdeok2vgtt7@zqgqndumgecv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ycdGwcx8XRrleoKtv3G6XqqRiX33KgX4
X-Proofpoint-GUID: ycdGwcx8XRrleoKtv3G6XqqRiX33KgX4
X-Authority-Analysis: v=2.4 cv=T52MT+KQ c=1 sm=1 tr=0 ts=67dad156 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=yNzLgEpsGgLzqTARhdQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_05,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=881 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190096

On 3/18/25 10:30 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 18, 2025 at 07:35:15PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> SC7180 comes in a couple firmware flavors, some of which don't support
>> PSCI in OSI mode. That prevents the power domain exepcted by the RSC
>> node from providing useful information on system power collapse.
> 
> Is this behaviour specific to SC7180 or only to ChromeBooks? For example
> TCL Book 14 Go or ECS Liva QC710, would they also use this compat?

The hardware and firmware representation of the RSC is identical, but
I wanted to alter the bindings required properties based on the specific
possibly-chrome platforms.

Konrad

