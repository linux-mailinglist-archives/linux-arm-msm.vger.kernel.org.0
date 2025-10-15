Return-Path: <linux-arm-msm+bounces-77366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B2BDE129
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C06B24E8D4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C25831A550;
	Wed, 15 Oct 2025 10:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBv+zLJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A32830DD16
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760525264; cv=none; b=UvyhfEF9ZnF2XiD7GHLCTVx0OucuoS3G/hDFwUxlpWqLmQatxjnK0La1HytF1LuqZdz4gz29gHiJnKPmhB29PIXB/Yx0oCBGIitAcylHrWGKFHpj+7I4oKwPQ5NvfnmIvFA7zUy6CEAzhwZt674Z5BcaekGBxQnEiyj/JKU/B2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760525264; c=relaxed/simple;
	bh=c3IZtW87v3ljTjIpruFmkRtvbZWmdkUO//r+kCqbBFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIPBbhNJjfG5ikBYt6YuOCV7Y+IAkg6KFzG4tm0yGqaDtglYMeuksG2/uYubb1j1hQE29lMq92eZbUZ/LqTMioJaOSn5E9l0OqI6AhybzAJbTmbOW0F479uWEj8G49jSQflrgMk/zqy7tPxWvn0IUhVF0Gzxm42amqRRYiYBUtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBv+zLJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAcebB015153
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwSKkIT+1Bc65l4iTbwnkxxWrUC4kGa69c8ubnneGy4=; b=iBv+zLJ8gnAfMNEN
	F+bjt8xwtZ6NKDtt3eQxAYOdLnGbQgo18s0xpuZXxEtPEiyT1Gc8QpwZnZSrf6go
	oOEPmyWrZ2UVdEOeyOXbQj5XxLlZWuiFzeQ3mIhJgHgqJm2Be2+71H/fuomIa/8K
	9pIkc8LgeTyzFoSJ1/lxvh4umaQqjW31pG+AA7iQFpNvjfV4EWt05d7anFXEBmlK
	Tn9YieDWH1dB6Ar8P2DiuPK94bB0S7ahz70FO5I6BcvojSdb46jm3e4I/sIQ9xr1
	tU/IFombG+/Cy46Uvq2q+J6p5tMzHC1Sub+ehbfAkzhLdLWKqVXgJhWPTnurM4qF
	b9tx8A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5m7bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:47:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-339b704e2e3so11898897a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760525260; x=1761130060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwSKkIT+1Bc65l4iTbwnkxxWrUC4kGa69c8ubnneGy4=;
        b=kFio2KMxg/7aprJ5IZBM0vpDyAnnpu9yrxIxsJKNf5IQoJQq5Nhj2CNcfCZIP3KQon
         JcRx+byN5IYsl4SU5RAlFTwiYD7YeROcWN8MSJIoAg56+wvv5ZyJyAiy8uajbUw9Btvl
         e0UYAsGgPExPMvVRd+r1Q1ovF2i/BFDKMd8J47oSLDmEV5eIgHQMYGKs5CtN8A6fsw4S
         HxHVGPZ7m1Vp+APrnS+glVQakcDQMtA54RyNHOTjNL8gbugx8g/CmN9VO9H6PHsqq6vg
         FUb/kSH67kZQAlYCuOS6Mg98JbISpNNFV9loz1bAa+ek4tyuEVyTwb3wL7zJnc5Xkh6g
         Uzzw==
X-Forwarded-Encrypted: i=1; AJvYcCUDsz8vV41+44YyQl2AwqePcgvBEEcVuxLhD1ps79nTwBZEpjak7x29p6VleaKa0RJiv7kax1B30R5snPJn@vger.kernel.org
X-Gm-Message-State: AOJu0YyaO+teF9z6eVEb27rlA9QwgI/6078gMaQP8k/XJAgLfzxP1ko6
	8PYnKgnRkqgSmadu7OdtAg/qBgFIHROF7hqv4p6bakkHhSPP21betrqvEAcSGs6f0f1P/cS9JW9
	F4XXDG6WEJ7qODNXY8vA+xrL2fZKbkPE/nHcnEFB5ipf6txgiXo0uIVYFS/veKwbVEYULJDibgG
	7U
X-Gm-Gg: ASbGncuy2rqnEFy9h94T2Y0Swz4CZiHRR/BR9TZW1ASYZXzgSRUkstnt/ZcL6L5hRc9
	GCYuh8ToybZ1HyZ+AooQusmJkFZZc5wvLev5yI2vi/Ya7z+rs5Ypx4KGAXfff0ZhtwGSf85X8I2
	jCNrVDp3qYJjuPUwBbW8Ok6H+KVfGvEwgA2fh3Ujx5A5DSv+BdQ19onq/smIz11GPwJ+dxAdE96
	mrwiOgI+JjxBZw5I0bYf5tgl1J/HohWGlrmi795l2/yJ43tLhOHYBVxAQs7NAUxHtFldRGWvuzC
	IN1oCa+i98QtsQBmB0OvheFx0XmV4wantOjNaGX2qIWhQqtj7oTWfy9afO+/bCMXlbqDk8o=
X-Received: by 2002:a17:90b:3843:b0:334:18f9:8008 with SMTP id 98e67ed59e1d1-33b511174e6mr39869574a91.8.1760525259866;
        Wed, 15 Oct 2025 03:47:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKDVtK4+j8XSL0ehHOvb/Mrov6iyLzDKcqsN4t9m+LQpWe/azkn+M9OD0xo7TCIUXYtC8boQ==
X-Received: by 2002:a17:90b:3843:b0:334:18f9:8008 with SMTP id 98e67ed59e1d1-33b511174e6mr39869550a91.8.1760525259396;
        Wed, 15 Oct 2025 03:47:39 -0700 (PDT)
Received: from [10.218.44.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a3cbf2sm19328967a91.8.2025.10.15.03.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 03:47:39 -0700 (PDT)
Message-ID: <e4d1cee0-6156-488e-abfd-957eb494a97b@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:17:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/24] arm64: dts: qcom: glymur: Add QUPv3
 configuration for serial engines
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-4-8e1533a58d2d@oss.qualcomm.com>
 <dmuhltvj5shmysyjmzjhf6q6nvng45odpwbxsi7frmziunxtgq@xppf6cpyqt2r>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <dmuhltvj5shmysyjmzjhf6q6nvng45odpwbxsi7frmziunxtgq@xppf6cpyqt2r>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _UmJWkMAD0RSS_LcaZvTFS_3XTyUi7jT
X-Proofpoint-ORIG-GUID: _UmJWkMAD0RSS_LcaZvTFS_3XTyUi7jT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX3BTcNnRQfJpv
 26+UcqziqjYpL7NIL8Hy8jYNSmRJvjNZazTLTYwXvlAb3JUiIreryWNfdQ/gI8uHOD4jsqWVC3Q
 a37J/Ec4KZyCoiQzvLZ0QbSVyBprE3UXbzV+4iNRqDfthcqKP9h594UdcqUUZ5LHibCQ9cy0oBw
 hIgIaiVEsMUqwJJ2r24Rbt2BElmjzJ0WhYlZIlvEbMivDZlzynAoAoLSOPgkXOwNmwWSEf217NU
 2X4Gya5o9Bj+XbeUW6101g3fQ4WLmrHJ8pFJhrCXTuPo4GbjE1pq69JzZNSslqUgkvOmDouKO/t
 0EFLvxlYiuIeG4T7aFU/uynUn2vIDARhCz5rG3QlS2vPRa7p5PgwWakF6ZoRQRcvpuMrOi5B9gR
 UR/NlZ7FQik1esTE91IntHB/Wsx0+g==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ef7bcd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kNkCFnuda-ERNw0Xt_AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020



On 9/26/2025 2:46 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 11:58:10AM +0530, Pankaj Patil wrote:
>> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>
>> Add device tree support for QUPv3 serial engine protocols on Glymur.
>> Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
>> support of GPI DMA engines.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/glymur-crd.dts |   43 +
>>   arch/arm64/boot/dts/qcom/glymur.dtsi    | 3041 +++++++++++++++++++++++++++++--
>>   2 files changed, 2936 insertions(+), 148 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> index a1714ec8492961b211ec761f16b39245007533b8..4561c0b87b017cba0a1db8814123a070b37fd434 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> @@ -13,6 +13,49 @@ / {
>>   
>>   	aliases {
>>   		serial0 = &uart21;
>> +		serial1 = &uart14;
>> +		i2c0 = &i2c16;
>> +		i2c1 = &i2c17;
>> +		i2c2 = &i2c18;
>> +		i2c3 = &i2c19;
>> +		i2c4 = &i2c20;
>> +		i2c5 = &i2c22;
>> +		i2c6 = &i2c23;
>> +		i2c7 = &i2c8;
>> +		i2c8 = &i2c9;
>> +		i2c9 = &i2c10;
>> +		i2c10 = &i2c11;
>> +		i2c11 = &i2c12;
>> +		i2c12 = &i2c13;
>> +		i2c13 = &i2c15;
>> +		i2c14 = &i2c0;
>> +		i2c15 = &i2c1;
>> +		i2c16 = &i2c2;
>> +		i2c17 = &i2c3;
>> +		i2c18 = &i2c4;
>> +		i2c19 = &i2c5;
>> +		i2c20 = &i2c6;
>> +		spi0 = &spi16;
>> +		spi1 = &spi17;
>> +		spi2 = &spi18;
>> +		spi3 = &spi19;
>> +		spi4 = &spi20;
>> +		spi5 = &spi22;
>> +		spi6 = &spi23;
>> +		spi7 = &spi8;
>> +		spi8 = &spi9;
>> +		spi9 = &spi10;
>> +		spi10 = &spi11;
>> +		spi11 = &spi12;
>> +		spi12 = &spi13;
>> +		spi13 = &spi15;
>> +		spi14 = &spi0;
>> +		spi15 = &spi1;
>> +		spi16 = &spi2;
>> +		spi17 = &spi3;
>> +		spi18 = &spi4;
>> +		spi19 = &spi5;
>> +		spi20 = &spi6;
> 
> This is a very weird numbering. Could you please add a comment,
> explaining it?
Hi Dmitry, will add aliases for the necessary ones and remove the rest.>
>>   	};
>>   
>>   	chosen {


