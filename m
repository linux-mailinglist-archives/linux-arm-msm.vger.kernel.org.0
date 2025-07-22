Return-Path: <linux-arm-msm+bounces-66137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EC2B0E118
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 17:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5A08AA2F91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D555427A108;
	Tue, 22 Jul 2025 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOdJ17GG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3762D279DCF
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753199961; cv=none; b=GkGAX2Idj6217Ip9s5gbthkuCyEiPnfU81LRgRVI0cyR7aj0e+qPr86oYO1wjBaU3J4x7y/vl/MuN+h4l+ULk5lNNmE26+SSnj7Ha6D1vUicQdFbVd19+MeKgq3zgZq9En6w5TAmdVaYhgsDCit7T9EUZBZWKa+ajlmSgin9VSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753199961; c=relaxed/simple;
	bh=etXG2QjYXt4ypIwgXdsA2+f49B2ACiCfy0PAh35eVr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kvo+gxWXrkrp5Ym23GQNQnKncpOwQNdUIMl04e6GE1imMXAptvsg7JTNg8jkbPAfxZTBQluKXYaaPo2yZFX9sStb51G7vSqHQPOlXzi3m24S5OwwMCKnDKMV2rDrlHuzuN2Ig1lNiMOXhVMBLAMbdBu0hFUb2Tcuq/+6uTkqyqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOdJ17GG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MFJILs005180
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 15:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTyy1CipuhbQRfNCBRSyXjJv1hgdiRR7+tJ5iNmsnAU=; b=KOdJ17GGDbo9lpqH
	H6ardiip86tP/UMdKxoaolWWtAtJOm+e0mt05Ds+Q08liBic8Oxm+i18NtFQg09v
	BOu4X3+70GhjLgJ4mNzodJH9HlG93wYqSxOa9GGsEDt49d/6FLkmtMb9ZrlIXUSb
	aISEYpAAebpL0ufdLcZOWCC1W1aJhpFIALVp9FqdeYJU5/QAY6wFaJHI7nFKbsjG
	CZF3LIR/OfT4xoF4uiTm6NG1QwMs9y1ZTyAelEUNRuMZSOAqNbdTpSCz8yM7Nyn/
	ASkaQRiuNIfjNBz9OfWpeO7MvhbAC3gjMC1867heZb5CFw3k+MPaZLUjp0/l5zB0
	mYIh/Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v8cyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 15:59:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b34fa832869so5081a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 08:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753199958; x=1753804758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTyy1CipuhbQRfNCBRSyXjJv1hgdiRR7+tJ5iNmsnAU=;
        b=Gvhg7zd+8tkstfFFiuhyahGHhsFyxgFkbQno8Q7IFvuMHYD1zCLyQBBXqqqtNUnfij
         QWrtLnPjDH2JJwjjxwkmF2nJk6v3PPQ9UvANfjjxq2ajI09Xd0k9pKWfud1M0f9SiRh7
         GSODPAOrs3iN+sg3B/6bPKdUGUara3caCUWKYru/HgZus6pZksHV7bKCTHKMkcDiB9m9
         ZY+tOvPVZ8gj77IW0/I70xfQajt7ppC44x7S9ZDIo7OLRCTve9fN0RnA4Iw1i7ukyWlW
         4+dmj2um5OfAg8Ft77ibCheRY6PZgkqtraSqBSFy4M4flbKM+qBTX/s4jVFO1zsmOtHZ
         1G0g==
X-Forwarded-Encrypted: i=1; AJvYcCWlj666DkFElv6KD/49mwOkN6g6v81N+Ci0DPTEHp3B1A1AS/ih4w6BRCJ37yQSWba+/Y46IQQNxjiJgrQ0@vger.kernel.org
X-Gm-Message-State: AOJu0YzzCGQFFqYnGfQBltbmi2oWfa2yWRLryXiOeUz1oqtG0jb5RSl9
	uraza02M55yq2pXWA3YG9PvStkZJGdvaSzAvL87TwocPJ7UkbxNzEM5mOGROuSH+t8Z6WID+tsb
	ZJYQ15dClKfjvKbBn5IUoy8jgRgoMHKgK6x5J9p3UYYxV/Ucna/ioNZyT5yy02DvGsfbF
X-Gm-Gg: ASbGncvc2Ziz4V0YSDup+X/85vkPI7DsRQgX4iBmRC1QrZ9e2/WFJXl8JdZ7xQQODFp
	LzAQjyz3wcSNzYf+4oDtD79GfPLiquww7Hcqi7XOS24HJC5r0+ZdxRdC1/xZwHaSX9km8Ko8Wnk
	WhTRB7OGavC8d/SLnu6+DBsW2AEFKxQaSIEYP5CFajfqrt5ZNFR7n1x9v8rUtbKTMMpFmor4dCe
	omDq5Ho+DX3WYHh7II2JFNKtQKc9h6JMYDM7fdWa4xzXOqqf6EfHkscgoMnVlPbpb+086cLQcWc
	01dot2rMDFIOLDGmao6VHTBgBEpi79zCjZ/3jzvcsPRCc6kIC6njjhpG5Or+Ky6FaGV+M6s5ep6
	bBZRnw+9tGTzJXBjQ
X-Received: by 2002:a17:90b:3e8c:b0:310:c8ec:4192 with SMTP id 98e67ed59e1d1-31e3e1cf38fmr5373543a91.10.1753199958369;
        Tue, 22 Jul 2025 08:59:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWKoL6qC1AwoV9Qr0uAwS3sJQ0/j8VqGu6gL6rJOQZI8dGchC2xPfMsL5859SptMBKiJYuUQ==
X-Received: by 2002:a17:90b:3e8c:b0:310:c8ec:4192 with SMTP id 98e67ed59e1d1-31e3e1cf38fmr5373514a91.10.1753199957812;
        Tue, 22 Jul 2025 08:59:17 -0700 (PDT)
Received: from [10.110.89.141] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cb7742596sm9835265a91.27.2025.07.22.08.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 08:59:17 -0700 (PDT)
Message-ID: <a63cab56-2d32-4d38-83f9-911561807e9d@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 23:58:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250707-615-v4-0-1a2f74d167d7@oss.qualcomm.com>
 <20250707-615-v4-2-1a2f74d167d7@oss.qualcomm.com>
 <smnw6whsw5todddsoveeanohcaesfip27udzkbw5wk5dwlztzz@ic3xemwrbjwg>
Content-Language: en-US
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
In-Reply-To: <smnw6whsw5todddsoveeanohcaesfip27udzkbw5wk5dwlztzz@ic3xemwrbjwg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xls2AWwMimxnOEKZ79ErBAURtvVcmq-i
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687fb557 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=63fHwRzrVC1gocosa9EA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEzNCBTYWx0ZWRfX40fhaiZBcQqn
 DsZLJRDcTG9/ajT6g+uYpEtevQAkxOIp3iiqxnNy7oPgd9FGDhXxo+oO+pQnlW+pB3IZ/6+RW91
 1O/+ak0hUnEgWrnZz3xRItKQYtg+g/5KZznmjm/MKjgtt/ZZN3/0Psq8vhucIUQTHJnNECaufWU
 x5IM+Fy8x+zFPtRmqCM0+RqNd2dSvVwIVt6lkPkRWHmqOTJKcNxXhBIKsZalUXItr8Q82u1SEVs
 vdYvFoWKzUrTEeTulP2YqyI1W8MR2VQlMrQ2iz4HoXIrdT5YujYpPSFZnpFh10Z6YDVAyBXqc4J
 kVbuVQk5Vps4TvHSRpuhnj1lG3Nf/AkkqjBfzBBFQCgO8d90Z0RQUIZj+eKwoUcXSrrRHsTwrNp
 4oz0lCMjZcuRzVoJaFMuHSziwg9kWghheSFaONLx3UAThi4flYaEF/+sbL8jebzdmxsWGDBh
X-Proofpoint-ORIG-GUID: xls2AWwMimxnOEKZ79ErBAURtvVcmq-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220134



On 7/19/2025 6:13 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 07, 2025 at 10:51:06AM +0800, Yu Zhang(Yuriy) wrote:
>> Add a node for the PMU module of the WCN6855 present on the qcs615 ride
>> board. Assign its LDO power outputs to the existing WiFi/BT module.
> 
> 
> What is "existing WiFI/BT module"? There is no module in the DT. Not to
> mention that PMU is a part of the WCN6855.
> 
>>
>> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
>>   1 file changed, 135 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 011f8ae077c256f079ce1b07720374a9bf721488..2df8e7e3c1d3b6d6353a6753b8387c7411edd927 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -18,6 +18,7 @@ aliases {
>>   		mmc0 = &sdhc_1;
>>   		mmc1 = &sdhc_2;
>>   		serial0 = &uart0;
>> +		serial1 = &uart7;
>>   	};
>>   
>>   	chosen {
>> @@ -47,6 +48,85 @@ regulator-usb2-vbus {
>>   		enable-active-high;
>>   		regulator-always-on;
>>   	};
>> +
>> +	vreg_conn_1p8: vreg_conn_1p8 {
> 
> No improvement. Please try again.
> 
you mean should be "vreg_conn_1p8: vreg-conn-1p8",right? I'll update it, 
thanks.>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_1p8";
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	vreg_conn_pa: vreg_conn_pa {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_pa";
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
> 


