Return-Path: <linux-arm-msm+bounces-84585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED2CAA9B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 17:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19171300D5DE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 16:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB67A2FF178;
	Sat,  6 Dec 2025 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rqr6ZlVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VicvpebP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624F82F0C7F
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765037403; cv=none; b=Nvp0ei7+K0i6fgE++Lgx/q7o4eeVqC7PRmNce21uxwvLmeW2TAB01GPFyFK2mLMY8JZQAhjQ9m/HL+wU8HkUlpe49CdkqZFfLPuEhE4MFEs0btqzQ2x46RJY90fBWeT36U0DUeZeL29vnLtYEQzgEyo171ThMTVnM2xuxI9fqlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765037403; c=relaxed/simple;
	bh=rHQjhInHCyl7FOy4rpT4qpQWpTixfRIHvo0iQnhDsQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SS7/F+2BRwnEa1tHt4HwCQ0sVASTY4pjru4D9ckm8fZ45FEk9tks6vEVSsfQYUFsxWVtAfUiCCR/EjuZ1dGemIzIfeakhKWS3mp9xWlVn+/5rVBcqCb2iUEflbUecDSUgLI1r50rY2YBwdtaHjsEbri23A3rVRfvvULMIv4BYFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rqr6ZlVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VicvpebP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B6CRp3H3084098
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 16:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avwRmu4KuvXSE6vpAkhwZXpYnNQzNd1RxxJ1CBTuiEI=; b=Rqr6ZlVK5TU0+ait
	nWfvr0aMwW730Btb+m7ULELyIPqFRuPIG7rL6/Wavvp1G6imedqbG1HteOV6OtKc
	xamVvq+h/1Z5Irdgl+ERlpY56NvZ87QB8zOf3C9Rjq3vs1pV1CE1pppA7OU2bBwj
	DCqjBJoCuOFYCFXEz48opoTPtYi/2k+6Hm4FGpxk3oHb38OrBm5/hoJd+3uJ+C5C
	44N2CKu/Wm5mxKEhjKilt45SIgbHMXqJly2gAYbF0GzMyuAcIsSqk5fNY0ocN7aZ
	F1XO1AkXXYAekpvKYvUo1SPuoBFMMYHOegQgW1+dH+SwHu1M6Vcbk/64CPMPa5hE
	YlbMxQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcq30yh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 16:10:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bddf9ce4935so2778321a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 08:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765037400; x=1765642200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=avwRmu4KuvXSE6vpAkhwZXpYnNQzNd1RxxJ1CBTuiEI=;
        b=VicvpebPtFv/fx3rxSkqmWWsK1IVASBjqpzN8TIKzzLv9eEix77HZKqxRurESQvIoi
         f2X//2GZ3pEh4XRyKrGYAAH8aO2M4SSRuxQJKaieAv/XCHYmfK55oD3LEYkR6ZVOiMqz
         xCb6H3EWsRkJbS4l6afC1ul9pvJyq6xWSIP4tfGBJKWNRfGezChYoi6oiXN/ENIEfuFI
         eDyiwzWUi5cZA8svPp15txi+MMgD4zflkBQsq/Fi8kCAWy3t7T3PJ7epJpnC5jrtCxIL
         aRDsO08hN/SMVDxuWYj5BZ0+v8JnLfzgpX4hflCPRE74QKHB1qyLATTAgzW3GF//zZ9I
         C32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765037400; x=1765642200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avwRmu4KuvXSE6vpAkhwZXpYnNQzNd1RxxJ1CBTuiEI=;
        b=rZJykVsXtqPBe63y4Jg/84TSGNnfeNn9bvNsZUHKPD73b8qbh/OoxSmzSzmtI1KVAo
         Z9SFLmOae6/MAmgFe+DpzaJmZZAuXqM0IWbqbVXcKqjmh4sK1S0kAaEJiEdFCNbGx84s
         XmwJWso9GDWawjVUDQh6ATeEcxKyjbHaSeftdZwKgxJllZtIJimpVtAziR5A/T13HXT8
         s+kQaj+xamzfkbUaYUwuDgga0+ToceY32YK3q6f2e8uF/MoCd8M/1Q9CgCia3q1LwZSj
         ZqZGlxIN4GIDm4z6kp7BtZFa8bDyeBb3QGTh0RItV1FYuWf6OU0SdUCFRJM3CEgYVLde
         1gJw==
X-Gm-Message-State: AOJu0YxvNFgjtcfE/xo3DvxU0neVLw4FgC++nyhw19qTFAzG8Xh6z5Yy
	dOtuHyYKerHjhKvwPz1AwLrShRndCEVJJLSjERWWD5K8Q3HBa3jwSWG29T5Fu+3VZVS5K2gr3o1
	Y34zpGXfd0+hIRrab6b4fY7JoNR2dcq5Io2Xq4UKnUVMOsJtCqHGPwgt8PQ5bqad9hekk
X-Gm-Gg: ASbGncsw64vllxmtQvwxtELeNXZBPWzy7ihxjPnZ1hWEEoQHFlJRwY504CTC6xe0WU+
	QG8OXs5i/gZ8JrkVdj8GMFjSD3MTdsWJGTujmTsyI/9geB8gviaVLnCwZrSXeGbLuoiUxn/Ij/g
	WFyZwKbBXW7rmMq6cFcXfBWz0qkXPxfKbTZZu62BHz7HmwZQM7+sQPHE17RrX4db8EoKU4niYN+
	zkqQ92idXGpBeL+fa8QC0JB93RUXvrXB4vKHWijGdxpEaU70L7kP7dmB3JOaiFmlwrOLmprEXm4
	RIZp9wUDZFuLD7e/ElqHFb0a1ZADPwsdywCA66VA16+sz95tm3bWaD0uXkss+XmqLyOQfMt5ytt
	O3ZYmycNd1fG5K46D/mTHLre/R6xBRGDWdtzNMnI4F27jhA==
X-Received: by 2002:a05:7301:da8b:b0:2a4:3593:4689 with SMTP id 5a478bee46e88-2abc725a729mr1272152eec.37.1765037400397;
        Sat, 06 Dec 2025 08:10:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfnpbDyZywLTyXpLkvaQI9EkqnI43X0W5ZPWM0Tb90WiOsK5DKcaix9agvXs1aS/baiRI2ig==
X-Received: by 2002:a05:7301:da8b:b0:2a4:3593:4689 with SMTP id 5a478bee46e88-2abc725a729mr1272119eec.37.1765037399794;
        Sat, 06 Dec 2025 08:09:59 -0800 (PST)
Received: from [192.168.1.3] ([122.177.243.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm35314978eec.1.2025.12.06.08.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 08:09:59 -0800 (PST)
Message-ID: <6cd71896-9dc2-490e-acf0-4acffe571612@oss.qualcomm.com>
Date: Sat, 6 Dec 2025 21:39:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater
 tuning parameters
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
 <20251204044644.3072086-4-krishna.kurapati@oss.qualcomm.com>
 <2190ecf7-5dc3-4264-b2b9-e8a20d099b40@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <2190ecf7-5dc3-4264-b2b9-e8a20d099b40@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDEzMiBTYWx0ZWRfX6rQduFWnGMBx
 kkoEKbwql/wfihmGCMLp2wj6VGxod2GDXVB1gSE30KUfjA6eQBSpZboMFHGoKpL6YL2SI5o4kuN
 2hlQ9N2Snhbwe3xRWO21V0/0POt8vAd+izvF+PE9mdhqYEX3kHI8SPfT0fipgM0mr36RN1Z4Vul
 UV8kjDr5z6DPCXCYf23QJLbfcpZO42pTcNeIBktyjTJGhECVDI9RCPrNN9KDACBEeXlyBkV7zwQ
 1QwVmkBfk+Ldede02ob4PrCWm+yhne4yGJ32yPpm7yo+dTJM48KgBlHlGC8vAkrGK2Uamj15qgB
 w3SvZrD1RCDwGOTFUMnE1UBC4rgXDqpReEnRuGOB9viHa5RoAJopgCXa7lEZL33T2WjlCWmkLS0
 Ru0aC67GbXmuQNYx1+w5/KfoJHwrgg==
X-Authority-Analysis: v=2.4 cv=as+/yCZV c=1 sm=1 tr=0 ts=69345559 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=mGeNq4HQZpM0LKVKY7z1pw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ijoVjymD8k9AGKG7GLEA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: e9ZdLdENVadre9Y0JtRUEuysfv6SQwzP
X-Proofpoint-GUID: e9ZdLdENVadre9Y0JtRUEuysfv6SQwzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060132



On 12/5/2025 7:03 PM, Konrad Dybcio wrote:
> On 12/4/25 5:46 AM, Krishna Kurapati wrote:
>> Add eusb2 repeater tuning parameters for MTP platform.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> index c8cb521b4c26..b9a4d1c99816 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> @@ -1041,6 +1041,10 @@ wifi@0 {
>>   &pmih0108_eusb2_repeater {
>>   	status = "okay";
>>   
>> +	qcom,tune-usb2-preem = /bits/ 8 <0x3>;
>> +	qcom,tune-usb2-amplitude = /bits/ 8 <0xa>;
>> +	qcom,squelch-detector-bp = <(-2000)>;
> 
> This happens to be the only(?) node in this file that has status first
> instead of last. May I ask you to fix that up, since it's even visible
> in the diff?
> 
> Also, does the QRD also need a similar update?
> 

Will fix it up in next revision.

And for QRD, I don't see any updated override params in qrd downstream.

Regards,
Krishna,

> Konrad
> 
>> +
>>   	vdd18-supply = <&vreg_l15b_1p8>;
>>   	vdd3-supply = <&vreg_l5b_3p1>;
>>   };


