Return-Path: <linux-arm-msm+bounces-89764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53008D3C065
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 08:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 223745066B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 07:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4054C288C20;
	Tue, 20 Jan 2026 07:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6uwgG+f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kWqWs97U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2913B7A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768892480; cv=none; b=ManKAdVZKs92cySlgVZFUWdeCw8t4V5NDSWlBY9UurlPtjeQoL84TW7c5OpoPnzdw5Vw3WQXrcyw5k24E5cRGs3ajSZ7ujTKdlfcj6COU/bBAMqdhBfII/iiCT8hGBMYWHFEGTOX0QzWkQUATp8wLtvh8HDA4TYswcP7rIEziNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768892480; c=relaxed/simple;
	bh=bGMa/6ddVLfYRJF0rIqLwvjeOCVxfj48Ldcrselv3pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmkYZEKMZwdMPRBnE1P+waEN1M0okMlJffBviMSM5sjoTSYB1KVwuI3VsM4No4OyARh3bFViUsBKtDA7UhQP15S7ZDwgaF8Yf8Yn4EOTWtEt6Q/POv+2JDio+QyXBbVghQxtzFdBgz0IHdG5Hhl26OyX7dLWm/pGej+p7HXKhSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6uwgG+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kWqWs97U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K29HAZ3176306
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2xAUtipZJ+Ss+/MmKgaRxYbW2Pe9wR3jif0xBgZ89s=; b=d6uwgG+fglBm7AlB
	Nzv+pGHgVgJC/xRS0N/12kCBQ+w+eG8qpBdYd1u6xtql7dTjEmxQpkZvFEYWwVii
	5FQVrfrbMbj2P5M3J7rVYBCdcszEMdlvssBmILbvv/RyRRaG5/fbEGravXafw/ZR
	iUdQo+HKIYXSeJX/VzxN1VnfTJ/ntqQUnSUznkrArAM2FjHPpy6uQiXcZeBmaQXE
	BDGm2/Gmx+pZEWQl7bVyDNFhPpdfsbawOg6qzw6SqlwPYyUYGKeWpSN6YT+jvxf/
	qywuJN1w0OBjBZ6hfgpz7xQC/UjnAhBCAbSFMDHNW96zc/l9lJ9N1qi+e5gNQZQe
	43iAQQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt0p2grcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:01:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c5eed9a994dso1293098a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 23:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768892469; x=1769497269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p2xAUtipZJ+Ss+/MmKgaRxYbW2Pe9wR3jif0xBgZ89s=;
        b=kWqWs97UZcdX5KsC6qm51R4uuEdUjSmooPzmPRY+mQ5CLAQTNbCnkst+zi/QrHs/Rc
         vG4vjiB74aEo5X/Le1sAoYhkZeTWllFsboKt73Sns71MsyETdzENb7flnzbtF73rektf
         6O24CSurs175yowvfOVpy7e2WbcJ5TyiZ3F3ZZr5fkA/NVfG0ZFzX3a8BOp51m4vZMU6
         +7cgPcbPsYnOUqvj6+aX00t6LhLLk0N/MXNr02FF/0Qfy5GyJhaVk1O/WZQGSQLlg+Eb
         rVp7iUhmAsmuopKLzNadCUWC+Wixr9zQHa0car+LJQPKUdzRdlaG+tR6pQc4UYawTY2e
         KhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768892469; x=1769497269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2xAUtipZJ+Ss+/MmKgaRxYbW2Pe9wR3jif0xBgZ89s=;
        b=w2Ckiuqw1Jy/JpiBhv9hhTaZWLnKUcF4uhhmN7UMy1FRv1ZssPQH0kJxd9Gu1E9wzG
         cgFsaY4G/ZKANYQgqM9LWzIucd2R+oz6Op/4G8I+ogKcZFXXJ5hvDiOmMAgmPW7Kkrj1
         R2uHxQjcvVFEHoKHQ0Jw7E/jATDsEOk3D+D+HIJ1EERG3FXo61Ub2pAnIEJ5ngjc8mOg
         3I98q8ecV6t0FA+wSdHD7A+Pr988APGu4QB1IXZklAtQKSHX+1kWqt7T1v8sp8K6a4hw
         7JqQ+XE/ZC2o5piu0Ub/RnA3WGjteZ3j8Ut5yHvkD765SAAmz9lEKRs8KCW5REBIwx5y
         IXug==
X-Gm-Message-State: AOJu0Yy5GGV+4nAAiwVh2aYyfjLeyPcznbNpUuvPtYVh2oC2SnOpI6mH
	H7ZbFtY3lPxY+bHXkwNzdYcnCfkBWUA4s86i/dUnzh8hoWR8lidhCfgv4O1VvCsCI0D+nX929R0
	UGJrteVfxU6APVSlt/EICTFgfE+q+shF81626VZN5wcYnVh1f94orNonqiF8H/AXEP790
X-Gm-Gg: AY/fxX4WVrh/B23UMfK+1X6gkCsuMWdafwPaDN2EX5Ze4AGWiD/t0BGTSdoIiD3dh40
	Qfqahm6jjfv+27UYvVc2i01FDosFxLrGY/GYITMHCuVtmjUe/i4U+u0281lyVSbt+r9U5VEGZXz
	h25Cunw69G20ZICebKbwzM1ntXYCDyXJ2E1UGmQxlwwhtG5o2388oE8ntJxdqQ+HpsfZHzifZDC
	hTJbkGi3UuV4JxSmMH+QWki5fkXD9XPf15/naCNcnfFnCFG9++R10Pi9PmW38wAECzRrbqhmvJL
	PrjcF4RvP2sACZvq4L3dvyhgGN/uR26JG52JAgiC2dd84xQ4JA199fFMgWB4ol9AGtTe2rBfck1
	1v3Y7UJR6GEf0PUk3OwEaXNyA6cxZYDjd+DovzxTgeWmoXectyQjXGbmW062qnY1yI098FG2wcL
	eo8jQ=
X-Received: by 2002:a05:6a21:328c:b0:384:d0fc:f517 with SMTP id adf61e73a8af0-38e00d1574emr12171082637.51.1768892468931;
        Mon, 19 Jan 2026 23:01:08 -0800 (PST)
X-Received: by 2002:a05:6a21:328c:b0:384:d0fc:f517 with SMTP id adf61e73a8af0-38e00d1574emr12171038637.51.1768892468396;
        Mon, 19 Jan 2026 23:01:08 -0800 (PST)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dbebasm115232895ad.55.2026.01.19.23.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 23:01:08 -0800 (PST)
Message-ID: <32e19d85-3683-4be5-9bbf-6f99ffac9563@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:01:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <20260116104136.2922032-4-yijie.yang@oss.qualcomm.com>
 <060a29a8-6fe0-4981-9f1f-398eac8adbd0@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <060a29a8-6fe0-4981-9f1f-398eac8adbd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zrovpq71u4WiGiflG3Va1SM9YxYpjqek
X-Authority-Analysis: v=2.4 cv=drTWylg4 c=1 sm=1 tr=0 ts=696f2835 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QzM_0Rd7tq1qCQHlR2cA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: zrovpq71u4WiGiflG3Va1SM9YxYpjqek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1NyBTYWx0ZWRfXzs+J8f3lOszQ
 vWuE0vKoWwXWstoc5fuHO8TipCJrYSdR3iJfmWCUGoPlYxlRrfAAIKro1/5ucl2qgZVYntp6/74
 fPCj9pdWnLpkoNQV8ksWov9sHxLnDX07ETonEeutxOoKLFIlc+I69UPPYPWw2V6EbqX6ubbnATZ
 4nDgJ/+eYoNsBpOEgUioTBDor3PlfxPIlPUUlcn4qZuu4TpYRwIavSafUFG7Oeye5XcMrt0P2oM
 EznzOTyaXnx/kDOt9n43yENv8EZWLvAYfLbpCRv3U/VXmXkzablQGwIi7R9aZv2VWkaqCz4tHmG
 wSV8wNt7fDH9/VgQjpp0V6pJpOVY2OrnZL9GfaAgmrud9s/aLj1gnqeIK2A4xDTH2V41dIEPyaW
 BqEAT2PZ//eNZ67EedPy6G4sOX3g4al1ozl6nT+U41c4pJJEMfeiArhIWIkkk5JS1nQ+4E57qtb
 cJggYxkKZQA8pSdZJaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200057



On 1/19/2026 9:53 PM, Konrad Dybcio wrote:
> On 1/16/26 11:41 AM, YijieYang wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Purwa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
>> Meanwhile, USB0 bypasses the SBU selector FSUSB42.
>>
>> Make the following peripherals on the carrier board enabled:
>> - UART
>> - On-board regulators
>> - USB Type-C mux
>> - Pinctrl
>> - Embedded USB (EUSB) repeaters
>> - NVMe
>> - pmic-glink
>> - USB DisplayPorts
>> - Bluetooth
>> - WLAN
>> - Audio
>> - PCIe ports for PCIe3 through PCIe6a
>> - TPM
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> 
>> +&spi11 {
>> +	status = "okay";
>> +
>> +	tpm@0 {
>> +		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
>> +		reg = <0>;
>> +		spi-max-frequency = <20000000>;
>> +	};
>> +};
>> +
>>   &smb2360_0 {
>>   	status = "okay";
>>   };
>> @@ -1171,16 +1217,6 @@ &smb2360_2_eusb2_repeater {
>>   	vdd3-supply = <&vreg_l8b_3p0>;
>>   };
>>   
>> -&spi11 {
>> -	status = "okay";
>> -
>> -	tpm@0 {
>> -		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
>> -		reg = <0>;
>> -		spi-max-frequency = <20000000>;
>> -	};
>> -};
> 
> Not sure if anyone commented on this already, please keep it where
> it was (it was properly sorted in the original file), then we're just
> left with the USB changes
> 

Will update.


> Konrad

-- 
Best Regards,
Yijie


