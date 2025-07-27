Return-Path: <linux-arm-msm+bounces-66783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5ACB12F29
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 12:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 767B73B8C8F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 10:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4613204095;
	Sun, 27 Jul 2025 10:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uw+RTg8Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF1A1A76DA
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753611268; cv=none; b=AoMEQYwTRX5Ph/Tc4037XX1PphEprzmrb0qB+EN+T6AvqicZNTYuF4pIvcXwm8jBXDNlai5tBhXuJSpW2aGuHMJek70/s92F+b+x9Us369hR8k5ie8n0ImulbsmbHeo7cc1D74FIlEkTbLdKsgYdfkRcOF0AtQE0ISJMYu5PPPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753611268; c=relaxed/simple;
	bh=8qsXtxH+kgZ5916SUbXCu8QlLNqivyV04aJIMMPtIWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=salxpKbeIsivehJbCubXWTUMdMEjhInl2zYegEiCWdP8OblHQnU27GpEVCquwZq/7vEeUUBKJXMxiqcnUAc9+Zm28fS1dRH4Nnlu2DNSZNBVqTW7iGxVXJYr+KqRR3OhefSeKXsZg+oyIz25FyuI0bYsgNrIwPP3kQjc2/L1cAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uw+RTg8Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R50nMd022736
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 10:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwjb0BHg6EfDOouDDm1cybRLuxEXfs9odZ3SmDOgc1U=; b=Uw+RTg8ZDBuO/gTY
	SBrRo3cR6k2ilnI+qWly3feuj+Ore1psvzEOgWm4phJSQAbG9imZKcLgF3Muso93
	0YaRq00TRzpYu1w3xDGCJCkay5SOi+sW6YRgf1NE19k1Mhq4ge1vB3zuO6te/ghw
	weJeCIQTeVI/uhk/EBNsnyERKW8NwUWG00FCrUZnMsje2bfPkcdi5vVg64nVzLzt
	AkiwDXT7CfNx8ZMjI6HsHc4nes2M+81p+Xy575y2WmoAxefINxudt20ktgmhF6Ly
	FCZOJCT03tGU00oF6zxtqx2frQECNkrl0cOb2jmakXktConyIDH/KULlJY8jydJU
	zGmJ/w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mqk274g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 10:14:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7494999de28so5499076b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 03:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753611264; x=1754216064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwjb0BHg6EfDOouDDm1cybRLuxEXfs9odZ3SmDOgc1U=;
        b=GkGdzpOeBLFTs6p8zNuzlo+dQqgbEeB7PmkhWlJ4H79hnhStKbSJb1cy8SMy+pTnAY
         yMXvrNn7ZNmaGc4oLGpiP4v6vjE0uNB07TSHJU+Zs0vALHkcZq6kptsbrP5Ps0gqF8LT
         9ofd3A8wNR8+EjXMDxMb9aZKL1lAwLVMSI0MgvepIl+2mP0wJtuELxaJUCZHG88dcSYd
         0ZvuOrpWVBQeSVzUNJsfMKJe0kVtKDIh4rGqEUo5i1kg7oaW/oLOLRTcl7q9iHhFLQzt
         MCB//IoWO3Lw+Ld4LsU4Ap/2hD3Dt26QUNorEG3R+KQPooXXjbX0ieG0etnBTUcIyTwZ
         Vfvg==
X-Forwarded-Encrypted: i=1; AJvYcCUn4Mu5w25zg9v2ocTTtsCbwn5cFs3UCsJT07ndBbtGRujhfIZSKX8aea1LHhG5tcqx/cLrIgqpoSYKWH7B@vger.kernel.org
X-Gm-Message-State: AOJu0YwoqiOStGBYYQFz1y0r189YlhwpFX4LP8RbVQ4NdsgKm84/3GHp
	Q7kAzrcdeway4rtVyhiI8gtuVaIel+9w3D6P3vNUEE6VakKa2lj4imrvE6+EE/37jtfCRBYs4mE
	b0C5qGSg7LrJXsMsXRIpmVLmMRoDdCGM4oUV6n2dFaiV/DZcm5xKkZGjIggvMY48hiA5d
X-Gm-Gg: ASbGncsigF6niRRMUGnkjJJgDNWsjRosu1a3DFV+K3FD2evPBtGNhSiHoGHIWcoo4ku
	UgzcE0INhJeOYKoQhp9w+yOXoFSD5KzS1cORF3LR1qVTK+opbfxznfrqE833PA1S7zAyMbIUUse
	9kPfcUruEh50H799344s14VON3nBGBPHSGynctS94MJsqQ7W+d+xJssOHV21df7S+64nN64P4gT
	jUojsTmke88OV6bWawiUW2QzBVd5qfde2tUerTDKqF+2uCGq+EbdwkZbbVkP1c1recb0M3X503A
	NpqEYgMfNwc/wwT2UM3AeTkz5QS2xBdCdcjW94mNGM6wF9QVrf+FdWjgIb+Kd9rxDlSVv+TW2EM
	6Ucm+G8BUSSWzlwJj5A==
X-Received: by 2002:a05:6a20:4309:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-23d7005288amr13839125637.13.1753611264426;
        Sun, 27 Jul 2025 03:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8LNyK4aRWVrXyDFBP0wxYJ0pw+PA18v3/Xqj1UNu4XPeuS2DNvEXb+2BJjw1zfbwOcwCGEg==
X-Received: by 2002:a05:6a20:4309:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-23d7005288amr13839095637.13.1753611263986;
        Sun, 27 Jul 2025 03:14:23 -0700 (PDT)
Received: from [10.110.115.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f6b54e8sm2802688a12.57.2025.07.27.03.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 03:14:23 -0700 (PDT)
Message-ID: <0cbecd24-fb1c-441a-8921-ff1651503577@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 18:14:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: qcs615-ride: Enable WiFi/BT
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250726-615-v6-0-42b8150bcdd6@oss.qualcomm.com>
 <20250726-615-v6-2-42b8150bcdd6@oss.qualcomm.com>
 <ad5d7zx3ztuouvqediihpj6ukmy7dvl4eampuirp5r6ftr4lh2@6fkebmfj25yj>
Content-Language: en-US
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
In-Reply-To: <ad5d7zx3ztuouvqediihpj6ukmy7dvl4eampuirp5r6ftr4lh2@6fkebmfj25yj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDA5MCBTYWx0ZWRfXzLK7TfN2XYU6
 SYFySraUIxdSSpEUk6Ms55jVcWJQoCL+m0mDPaZ8ZQlOmLDRVMdwySSBKMdJ/43sfFXe+RyGxOy
 umpQ0q6jkRUZvTv0z2eV+Kzy5SVJgx7qISTCTox9ykI5jZsf4wxUGYvvIcNKj1sOHoJH9/x9P8v
 M61eCxkZkMIwNSObozEr/VBK1CYLPxP+sDsJyB5xHkviKYE7Z7xDdcMHU/1S+c1wzlaC6Xm8efM
 Iu40q7OSse2ZY3GvtHC/7JmG21UeDlXxsuz65m+8b3Bbj0Esu1LOyfCjfBCbAEwMfUiKf77A2qV
 KQW3REiJX3I8jxaFvZJor9+ny41cNLaDwh9lEfwWfADowfXeTlFSk6uDXiNzYr4YlqVOqfGouKY
 1HNDWdb5i8C8h2e5CriMct9r3uG4r+FINreU3Gy6JzYY087GuE5MfiuakuOOUUrBQJBj8uzT
X-Authority-Analysis: v=2.4 cv=fqPcZE4f c=1 sm=1 tr=0 ts=6885fc01 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=rhgo8q8DuPZwM0GwmL0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Iw6Ws-hfSGxgohF8DKDuR0oVEYAAZ6RW
X-Proofpoint-ORIG-GUID: Iw6Ws-hfSGxgohF8DKDuR0oVEYAAZ6RW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270090



On 7/26/2025 9:19 PM, Dmitry Baryshkov wrote:
> On Sat, Jul 26, 2025 at 11:31:31AM +0800, Yu Zhang(Yuriy) wrote:
>> Enable WiFi/BT on qcs615-ride by adding a node for the PMU module of the
>> WCN6855 and assigning its LDO power outputs to the existing WiFi/BT
>> module.
>>
>> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
>>   1 file changed, 135 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 011f8ae077c256f079ce1b07720374a9bf721488..f6df6a88adc8cdc416a57d38b8eaabd53fbe3fcd 100644
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
>> +	vreg_conn_1p8: regulator-conn-1p8 {
> 
> regulator-conn-1p8 < regulator-usb2-vbus
> 
> Please keep DT sorted
> 
I'll fix the formatting issue accordingly. I really appreciate your 
continued patience and guidance.

>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_1p8";
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
> 


