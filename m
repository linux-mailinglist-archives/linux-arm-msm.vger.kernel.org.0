Return-Path: <linux-arm-msm+bounces-66419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC22EB1014C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84F9E3AEB63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 07:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FA2222562;
	Thu, 24 Jul 2025 07:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdlKtXYw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646FF1F582F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753340811; cv=none; b=Tr+5WiM2S8+OwN6AhkqU5fBI5jZ9k0IYN7Dv2JJ5L8eF1fzyA+tAowIEsULrXP0ec8/+IrsTLH7bO71zWPq8z0ZjWD6UfCDG+psfliyoJ4eg/kwz1m4ujIGlHJaFdGWLx2gJ/YTERp/+z2Ng4Uq+d9Oam5IF3yBFpFCyfY+7kFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753340811; c=relaxed/simple;
	bh=MOg9l889BalL1NxkmWg+3mRYNIkpecKw26ZBBFEefgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2g2CGcMNJx8BDUIS3UwIRadLipxjpPOuieWRvQ0PIqRaLGpk1se8F9mqHEBR7VBM+Mw7Zk+uwYHJap7qpHajd2kTMp/wIVXMMwxvX/IiWahO7Qf1uI5xvBpltZuWzaTNY6E0K1X4apJRK40YZp2f8v8ljTAqqbvnpjcc6b9Mh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdlKtXYw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXGJ2028516
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8QZLrnCjykC/+h/YYhXm9p3/5D3IDBg6T9aCMPtCFs=; b=bdlKtXYw8EGkJrfb
	shGhZspzTTcJayrsOIYu/VyeOSF8XE0pSvEIdGZIZvOuxRMIIoHTE12hHwQgm5pm
	n+u6gX5m7cDskQwIWPOx4arnWLrZ1icg/kmbVWHI/EamccgHXYs8msRgaBJSnDTy
	/E7qpp4Z1bZFG8H+HSPeLc9Yqpnh26LSJM7lZ7dvI3C2RqStuI6YokQ7DG9T6uTv
	GB1K8NGbnqDVwa7U2Kb1KhSw0Ndj55ebbbj1JZnBc5z4MS5ZmGitpXpPgAR+OynO
	J7gd4/vIEN6DcQLhAhZ1w/sSgQvfIPtweK+l+ddOVDwHT/KhcDeTg3hCZsSBdWcO
	hULS2Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1f2yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:06:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-313ff01d2a6so753492a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 00:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753340808; x=1753945608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8QZLrnCjykC/+h/YYhXm9p3/5D3IDBg6T9aCMPtCFs=;
        b=nbUEgcpBFjSl9aTnrdWjSXWFoTGw8uh58C6Iwmj4vEkb5r9s/i6ekgVLQbcFUihZ/7
         uiAifOcQaDnuStHbPvK4kO1nJ/qqVPusJfNGA5KMmdIS02FJbNfqjfPkRSmtNcqYDAA0
         FElyUyLHR0d59XtxfqhSz6+X1+lDPYAufZR97q+wGfWN2CWdymsCekSz5jg+D22Hpkcy
         YK1kWJYw/6BMYHwCCe3G4NFJxT29I7l3ZHKc0N2sR8c27K3zTS+BaNc/Eazx5AisYsHp
         smNVQnPBj/twYQktNxdxeTq5joIYGA/POdUmWkWkNsTli3GAt1j+/nw8x0xcanym1u3A
         U5Vw==
X-Gm-Message-State: AOJu0YzkbOVjzmnd2TgXLT4D/mybO6wFgvf7a37sjZWUB2Bss9HVGk4c
	FrvwbxSJGtGstYa/VsJR1eFZWIyvkoroDBc+FlRHu0FoBUAsxVNU8gCvWIvv7v/cEYMkSUo8AMJ
	s6Wlf2o0zcJ6sGUJsUAWKwmGOaklb1WPksV+ojgvdKrcRdbhV+ovosG/qciuAb82gGbTi
X-Gm-Gg: ASbGncv0ZkG64+UzU8uUQ3jmV+2IVOTBc8hAlz5xRj7UuNXQOYSdMX2xFWEORSSb7a0
	cShf51gTjnI7g0QY4t+Gt/nanhxxjH8awct62WVqXKGTGEr9qa9MBjeIactlV8S4xX3xX8kY2eS
	U6Bc8EOCgh+2hAuTDSjMq23dlIUxsiqlygPg3hbZqL4jVBbiCe6bYXh+DFn5YTmBbWEvmvss1KZ
	C8z3zzFxeFN+vgoglC4mXM7WYFEqWwlVl5FxRV1Zw5ZqGhvHVmNk5GRxBV6CJUmuPjhfuiXAcNs
	FTT0WzPVOKZ/e+A57maBfF6AdDSqjaI/ltcrNGv1UuOEY/XjPdPFqsbDqf1ONA6hkVdgvDdLR7b
	cs4lm/1OefQ8YieI=
X-Received: by 2002:a17:90a:da8f:b0:313:283e:e87c with SMTP id 98e67ed59e1d1-31e506eea04mr7799978a91.3.1753340807835;
        Thu, 24 Jul 2025 00:06:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhoV7Y/qXx9naOCUMQRNHNOXb6Xr53WH5YOfO1E3P29Maf46gRTRCMU2dKiugt9qy2W439cA==
X-Received: by 2002:a17:90a:da8f:b0:313:283e:e87c with SMTP id 98e67ed59e1d1-31e506eea04mr7799942a91.3.1753340807381;
        Thu, 24 Jul 2025 00:06:47 -0700 (PDT)
Received: from [10.110.12.211] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e6637a33asm614159a91.31.2025.07.24.00.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 00:06:46 -0700 (PDT)
Message-ID: <8f10fc34-20ab-4edb-b4d1-d2e361f47751@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 15:06:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250707-615-v4-0-1a2f74d167d7@oss.qualcomm.com>
 <20250707-615-v4-2-1a2f74d167d7@oss.qualcomm.com>
 <446cd45a-0284-4782-949e-2e5321545b96@kernel.org>
Content-Language: en-US
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
In-Reply-To: <446cd45a-0284-4782-949e-2e5321545b96@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -drGKrVX8yFzOOYcfAUFlAPGlIpCmgf7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA0OCBTYWx0ZWRfX7OG/Dpj8S/V1
 EpfrRwaFaomt3mI0nRZechDBynQ9IJGClcXmW9bAEeHapbKuKpoBIRT9IInBb89rqqo1qVwGtyd
 FpH/Rz7sjEXOJD/JtU1khzMlXf9qxg4vQuHal9PIHFKoMMg8CJ3eygHhQv08J98ZXa7JkaQvAWl
 v6Kdx8uv+zEsDgxfqtQ39YmMrZyo6Ay6VfLSEk13fbWhn3loGRGyIwh0DNl93yfjmpwUPX2wl5O
 93rEhMV/8+1jtzOcnpMCPytBJQX2+pLPOgFBXHK0TW2yAIzu+j/7iaP13qtFCB4Hik9hRdv5bij
 E9Dq8VZyUlZi7kpSbiIvBLlHVak2HHRvvZzWMTdKok7ZF6H+FbvKQiRU47MlGQTgmZEWtgwkESX
 chJj9MOrBc1DFZCMEN8rDOHp9Rer0uIDD0YhIRMM1YY/1bV9TwqhL+rz+YFWLu/dTyjXMu/T
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6881db89 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=oRJlAaeS_37yXmdwZpAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: -drGKrVX8yFzOOYcfAUFlAPGlIpCmgf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240048



On 7/23/2025 8:12 PM, Krzysztof Kozlowski wrote:
> On 07/07/2025 04:51, Yu Zhang(Yuriy) wrote:
>> Add a node for the PMU module of the WCN6855 present on the qcs615 ride
>> board. Assign its LDO power outputs to the existing WiFi/BT module.
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
> 
> Are you going to keep sending the same? Third or fourth time, even
> though there were comments? Please take comments seriously and implement
> them or at least RESPOND.
> 
I appreciate your comments and apologize for the repeated submissions. 
Due to a possible issue with my Thunderbird client, I did not receive 
earlier replies and was unaware of additional feedback.

The v3 and v4 revisions were based solely on Rob Herring’s suggestions 
and included some dependency adjustments and rebasing.

I will ensure to properly address and respond to all comments in future 
revisions.

Thanks a lot.

> NAK
> 
> Best regards,
> Krzysztof


