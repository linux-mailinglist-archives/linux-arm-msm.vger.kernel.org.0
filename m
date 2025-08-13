Return-Path: <linux-arm-msm+bounces-68917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED46B24468
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 10:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7022C7B6522
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 08:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1A32BE039;
	Wed, 13 Aug 2025 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5Y7GJw9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6D92EBBAC
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755074098; cv=none; b=aVA4A5l67vt6xT3P8AZVFKO+2HBICoTuemaFIATFXGfpjqLxDJPMh70A0zM0Inl3GRwTj7aQdOVnqCoEfxT9U5kI6nbf9+nBx4RDhlrieVzSAMMhRToFqqWbm2PCZcA9UnWnbQcGrnGQ8zz6nDi/jWACtfT2jrQN9BBukpKriPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755074098; c=relaxed/simple;
	bh=BJsNPLCsMWCuoh56cczBIajDM67zaMKaTgolfgD8pys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbL7xIIi1vz+vz1t3OA7C40FYekdPqahJijfBN6kb5Cs88yGwcPnmvbnD8QS2XXNqZGywkd8lfxbStNg4O7d3jJlD8thwdPnF/KaDEwbB1NW0A+IW0StYpEFA3ksvpoZMiG1YtIEjl9ENKRWWZ+FtA78FmhaT5zx4ylvI/UxMsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5Y7GJw9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mNEK028928
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vD8uV2t75HZFSBKmavWfIArKi9bpVPP6he9Z/LG/mE=; b=b5Y7GJw9bBvoxizg
	4OLMKKLNwyX0N09rL4bO1YeSgL4Jhodi6Mn9Ewoqq+a6HcoNYS61BX0Py6L3CBKV
	CRI+SbhQRkrIh6EJTJUpbEssUdxUieiGjLnhNF7KKK163KXggMtqM12pomJ7YRfK
	2dZnvqdRAVbAoiiIxq2COln0WlUoNma4CxxkEqERtY9uEVaK3PqVo+HPQc78XrSK
	jduWJfHWPt1+6vOEHYPvMazpANRjtCh9vrfOWrM1VQ1P6BDgFSPUP7Qjuz3GFGwl
	4EMZ2UqhBGDuKBvhGw/HOb7mZOcTY8Wy/wfPOmwbFxKO4h8sO8XzdhIuB5niaIA8
	k1FWnw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj4b3k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:34:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24011c9da24so6355565ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 01:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074095; x=1755678895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vD8uV2t75HZFSBKmavWfIArKi9bpVPP6he9Z/LG/mE=;
        b=T/zwzITgfVVq0Yj9AZrRKtpEQyhAha9psPUGyuju0eeYYBFfKaQhR5RO2fcREsK/2Y
         EzGBk5KujF9OXOIlvvxX/n/F1D1FHIP5zd9NVBWw8yUcmQUPr2SYtY6OKELCuwu2pMpu
         VGInE5tVVbN2eKc8kgl0p/gECj5o6MBMmu5pQ6gRTvqKko8RdfnjMXHvCuEHAVXwvSo4
         zcG8mPpwKR2xZv1lbnOxvDf5AYW3+VxahBpDx6LyImIDqsIy/pYYHm618t4NnautXyx9
         B6eG2DVt49ctES4EBeQg+4qwMR1CYPqM37E5c9OwliCMq/JgSYx/M5o154hL6OZF6Km+
         FLsg==
X-Forwarded-Encrypted: i=1; AJvYcCWTrNC2IzNPFhhB0CNSiVPutgP6eug8OyuSB5Zxjf1qp9DhXhYtuVtNI2vcR3v6DgGBl/+QiDwnX+k1869z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx16o2c+YBjZVq6reBNwPlrgBpq7QBYKeR0dJ5Dvtqmq+crApe0
	9sMKJekq9XDQmjJol5sd8MaWWTwSUy8N6TlSg2/W6ZMKLJmPSfCSDaqZ8CfLbSRnSntS9QaoOV7
	wbuxzliXwbU3wenPBEwKVbzDq6UsXJX0GAzO5sAKEhYZT7ni/noiKcCmyAwc+ItD8DdVu
X-Gm-Gg: ASbGncsPZ7hfvDlru0hKBKvDRyp+w/wRxJvzqk/j0wHVqRIrqJ4A0sH6nom92+AYLR0
	l1BAC0VU4Mrb/xLZ5NdE4yvEq3lm28zjGY77wWkClyYJygyP3ZXjNNyr9fMdVGZo/RLxKm1s7vX
	KTvTmonNCUWJHEwG3srKQK1Dqmw2u68gK79Q3R4yWHBBqUflQQRYMHE+a8hsrJBGhvMd1/BfVn/
	OvOAHokWDd0wnpfOiA9JSBhvJeBlM4jI1oWXBs2MCy4Th6MJkpUv9+4OI/nAjWCrre20NpAfXHX
	Ta8QSLqdSE/n6HuO8yGjJgDoHmh04e2Cpvue9bY6UNID/r2NzhTDrqpGZfCOXCgyJgb4joI=
X-Received: by 2002:a17:902:db02:b0:240:9d6:4554 with SMTP id d9443c01a7336-2430eae02b8mr23183995ad.21.1755074095412;
        Wed, 13 Aug 2025 01:34:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtwP6EhgGczqdw69+FCzTPeDqzNTzM6qfuthNnA+SimcTyI9+YyBr8qv6iPBl/3QLmyphKiA==
X-Received: by 2002:a17:902:db02:b0:240:9d6:4554 with SMTP id d9443c01a7336-2430eae02b8mr23183465ad.21.1755074094530;
        Wed, 13 Aug 2025 01:34:54 -0700 (PDT)
Received: from [10.92.180.108] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0f7ccsm318630375ad.57.2025.08.13.01.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 01:34:54 -0700 (PDT)
Message-ID: <fa3c54d3-aa8b-4991-8709-89a8bf9eead1@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 14:04:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sm8450: Flatten usb controller
 node
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250715052739.3831549-1-krishna.kurapati@oss.qualcomm.com>
 <20250715052739.3831549-3-krishna.kurapati@oss.qualcomm.com>
 <f9219b68-35a6-456d-911e-c4e8590d69ea@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <f9219b68-35a6-456d-911e-c4e8590d69ea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfXyQaSbt7JXxCY
 5mPaiNgBhGOBbaInbzVbaSCPeAwewN4pb6zB7Q/Jq21DSP5WtsYeauFhP5nKUSyCAsGo/XX68XQ
 eeckz0HX+r0NZNTim997I0RSv5SKbNr7gsccNqBkb7pVZitjwZc+IUsQyR7IfhD126gYncQnlrp
 s1ItwhYaO80G2emYEGgJe+PEBO4ymSPmMji7BgnFNm8VsUAwY2X4io1xsi8IVm/ekg+berG+GgU
 DqYyIZnuLjU7UunXhkDZrw6DW375PGIxD9OBY5NAkKtvzjjZfr2t/8BgBHF4+h+ACIasFBDW/uJ
 RJFAxE6np3c1c9U4I+0Srn0Ak9Uyh5C9SBRsGWNtgPapvazUMKd16FSizBME/uT1JpLRz9ME6pa
 tHCnbizY
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689c4e30 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vr-wfZUyanrvw1r9NhMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: pZq-_oucMh-aof3T_vF9pg37Aiog3GmF
X-Proofpoint-GUID: pZq-_oucMh-aof3T_vF9pg37Aiog3GmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027



On 8/13/2025 12:57 PM, Krzysztof Kozlowski wrote:
> On 15/07/2025 07:27, Krishna Kurapati wrote:
>> Flatten usb controller node and update to using latest bindings
>> and flattened driver approach.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |  5 --
>>   .../dts/qcom/sm8450-sony-xperia-nagara.dtsi   |  5 +-
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi          | 57 +++++++++----------
>>   3 files changed, 27 insertions(+), 40 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> index 2ff40a120aad..0c6aa7ddf432 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> @@ -1199,11 +1199,6 @@ &usb_1 {
>>   	status = "okay";
>>   };
>>   
>> -&usb_1_dwc3 {
>> -	dr_mode = "otg";
>> -	usb-role-switch;
>> -};
>> -
>>   &usb_1_dwc3_hs {
>>   	remote-endpoint = <&pmic_glink_hs_in>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
>> index cc1335a07a35..6bd315e10992 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
>> @@ -781,11 +781,8 @@ &uart7 {
>>   };
>>   
>>   &usb_1 {
>> -	status = "okay";
>> -};
>> -
>> -&usb_1_dwc3 {
>>   	dr_mode = "peripheral";
>> +	status = "okay";
>>   };
>>   
>>   &usb_1_hsphy {
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index 54c6d0fdb2af..89dbac3bdd2b 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -5417,12 +5417,9 @@ opp-202000000 {
>>   		};
>>   
>>   		usb_1: usb@a6f8800 {
>> -			compatible = "qcom,sm8450-dwc3", "qcom,dwc3";
>> -			reg = <0 0x0a6f8800 0 0x400>;
>> +			compatible = "qcom,sm8450-dwc3", "qcom,snps-dwc3";
>> +			reg = <0 0x0a600000 0 0xfc100>;
> 
> 
> So this was never checked. Can you start using tools before you send
> code upstream?
> 
> 

Hi Krzysztof,

  Apologies. I didn't compile it with W=1 previously. When I did after 
the kernel test robot complained, I saw the issue.

  Also I rebased it on top of latest linux next where I see the 
flattened patch is present.

Regards,
Krishna,

