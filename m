Return-Path: <linux-arm-msm+bounces-84214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E735EC9EDE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83CAB3A6460
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E782F549B;
	Wed,  3 Dec 2025 11:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2KeIDeq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEOMSRBt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203312F5335
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764762083; cv=none; b=DjuXWvorBlLfGcbTDrb7/cJu1lKcRU0pP/jCcLDRyc0Wt6Ty+uPqKh8ChMgXZQU5rgRKqttXGoi/ZCtloGm0lc8AqCm3ZGy7LZwa2uGHvCuRfevKLcUa34AExTYBQ7bNJ4xl+UmHsNmCVr37tekyHJT7ZqiG+lzRB/kDxrxg8Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764762083; c=relaxed/simple;
	bh=97sKLYfMe8lKibWoiG5gDgDrfscF5tOkw19RBFelV0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLensV20gK99cv5DyQ48G56aNNJLXzDtdRg1ykKKb6gJK8cIUTyNlnk6QaVw0Woo+iAE1WThdAFFVhyeWu2Oj+AVBrYAGuhazSLMJ2sLqrExOrG05kNNcZaEsOTKbWxrh5qAneNXAxU2p10b+WQHMdaE2ootH6fTkF0b9GA1Exc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2KeIDeq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEOMSRBt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B396Rlj805887
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 11:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4NktkCqcRRPv7JMCZKUbGBGz7d2xYUvpihI2l5EivN0=; b=O2KeIDeqLiWEHgto
	Z8feCqXWKmgFYw4ikaIzQBrV0BKvL5GlIslIr2SKZpfD80YUW6kbpwa1Tr2Tp79U
	+THoTi9xFCg8LewbRSokFY+KtTn9F9nD7CX2ApRslo7OakMqElVCqOJ5iA/2T41r
	RyllrG4j/IJt0uvUw5/fJ8jKyLFt7CEUVBMsFx7SoaPy6jyKt3sT/RI9dhim/vJQ
	TJaCV/iG3p24dyCR4CB7EvBfzTUF6FhEV04InBu93sUyzQkT+A3DnbKFLJwi4kYV
	WKnDlEgvpo55JeftyIMouUAp0MBKYJbWxE831Kup30Fv9gyvM70UOsaM6L8VSSwv
	9vggBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atbmmhtev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 11:41:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297e1cf9aedso114573225ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764762080; x=1765366880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NktkCqcRRPv7JMCZKUbGBGz7d2xYUvpihI2l5EivN0=;
        b=iEOMSRBtNEc6JR+yg3XzN6CTTzxs1SWklufwkS/hytJU/dxkyUjT6oXVQ1gngW+pTa
         MTxVSEPddz0rlZ/4LxJjkz2X2VmIZLG1BipM6HIfzgSrc9AhsSGRccYbFOWOJ6wWuUKi
         3kA4WMS4Gh/FXzKapDWymrHmGE6uztHlXAh4Wo/V6KJdVRof11XsNScrFBAuxoeVUTEr
         R1gXrBv1iRyESEVnqojldF6cQ+OmcaeXvoo9b++NefVGwEzEWTR7WNXE425s5xRJk+7U
         JcaplEVD2CshPgbPqN2dGsOAjdXWiuMCSLFRaRfIIawMvr5XGyoJgHj3EwmIDrkq5Z58
         uAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764762080; x=1765366880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NktkCqcRRPv7JMCZKUbGBGz7d2xYUvpihI2l5EivN0=;
        b=fqIlHKbRGdbsFdywlffHlEmzTvlAe7MX4PdmzaPMTiZD1/RTS8XMxer+ph35kwnCEx
         6KKFeHKQ6hL6kgcLyz378IEKCzCGXs9cLGLvR98nuSPuLu4ZY8kBa610oaiJAekG94t3
         X1JiLVmLhgS6kL0GUflO2Xxf/IjKSxNkaiQ4qpRneZbTYmpvBGjvELgX5T7P2YeEhq4p
         QKtTMlQD9J3U/Wd4YAEPAXriqIFGJiIpqnM3gw8BmhXiEu3HPGqV+7KHSdBZ1+ny1EQv
         OiKqW/W4+iF5zrHnUg+qPXEwRcW5TpWcxm7mYtw8rDcV2gTmcJpuSkFJPfqXOfDXyeTv
         qIMA==
X-Gm-Message-State: AOJu0YwnnDegfORGL6GZrx71FigAxeFLlo7T8hWQXCimEjgEOAEI/GRb
	MeBccDkLe++aBWiFLkFNR09OEEkySZgR5n4JeRWVagxDmAGQfZcF1QaPaKND/4u4rCVl3jKBsHB
	y1ovPjGF2b4Abp9rIqMjXppXAEx6CQPC6VTyiPISj4ZN21FhhGk9QfHPgGAye7nfBLwSH
X-Gm-Gg: ASbGncsRGVM30Y3UFTG5ctWb7S6HbYipzv8f+rdQ0yyQ4Tnuf65h6gVX2zQDCqAUdk7
	rbo1btDRgheVF+kwd9AsWZDfDHO2R2J10FI9ktHXAeporNI+K/yN3zNgTOrxj3vIQoFVikuyggZ
	ke+06ImX7s3D7beI3kdZxTioNJM0SMTcolWCU1kjg6CNBj4mIc6oLrWubZ7gpSWhEaZIQ/7lXgH
	6JFpxN1Qx/miny4qsUy3qneIySiytK68/Y0U9YDzD431VVlw8tP0RrNDswBUPfqBikCRgGyPhks
	DsedHQTsnDQsnQs4Q880iL6wbdOpFguVJ4xlBduASm8rh4wrVtnd+IW4YNBKv2bkEqq+L7WkT1b
	9n3zEeIyzDM312hFiafzN7lLE0c+2K5Nts6DE8M92gZucrQ==
X-Received: by 2002:a05:7022:160a:b0:119:e569:fb91 with SMTP id a92af1059eb24-11df0b3c9a5mr2004997c88.0.1764762079848;
        Wed, 03 Dec 2025 03:41:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH47F4KJfp1vXUtRduvhyguImuwmkHyoIiKyTxuhIMCwaVYNgGHMoRzbglYlByTX02QW4PCFQ==
X-Received: by 2002:a05:7022:160a:b0:119:e569:fb91 with SMTP id a92af1059eb24-11df0b3c9a5mr2004957c88.0.1764762079223;
        Wed, 03 Dec 2025 03:41:19 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb03cc7dsm87668073c88.5.2025.12.03.03.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:41:18 -0800 (PST)
Message-ID: <49ecd190-1aee-42d9-9e6b-c155170aa38b@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 17:11:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Add host mode support for
 USB1 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com>
 <ffd6dc9a-372d-4db9-9c2e-92f126cb5ebe@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <ffd6dc9a-372d-4db9-9c2e-92f126cb5ebe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: I_lcV2CzxnDXPkrRQSS534riLqG5NAaP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5MyBTYWx0ZWRfX8yO1zIlE9Okw
 21ahv/wKegMx3Gl5ycI8vJv5ACuG0I749M3sAkEqstnS/8fYnF8Tb5RKb8SdmM4mCzVTidKrqpQ
 CUzUN09wOwFWe4tQ00xPqYxjIegzAUO5Y720CjCdd4oI2vfVg1HHEFAKkabcV7IeAgApappZLjV
 DOMkkXU2fB+5SAcKLjR8n2LStbTWR+oFE/zdtZUqPzveisFP4W6QoGZlxW5ynmI1nJiixxAqB71
 1r557ObNUPG/cZcCfSbAEAhpE18H7hnoFuLH/7PdeDIZfFGewyAbpjhCmuOpAst1NNh91TaijQ9
 bocLjU92/JCSTVxOp3PMubSnNpB6fivriiFA3vdNTxE0pF45iwloRdyejdtz9K4j8a4LjeoXHi8
 IplNYu7nTkReTR5VdFBXvxZFJiVnCg==
X-Proofpoint-ORIG-GUID: I_lcV2CzxnDXPkrRQSS534riLqG5NAaP
X-Authority-Analysis: v=2.4 cv=ApjjHe9P c=1 sm=1 tr=0 ts=693021e1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GmPTNHGbM9OTneqwVsAA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030093



On 12/3/2025 4:59 PM, Konrad Dybcio wrote:
> On 12/3/25 3:42 AM, Swati Agarwal wrote:
>> Enable Host mode support for USB1 controller on EVK Platform.
>>
>> For secondary USB Typec port, there is a genesys USB HUB sitting in between
>> SOC and HD3SS3220 Type-C port controller and SS lines run from the SoC
>> through the hub to the Port controller. Mark the second USB controller as
>> host only capable.
>>
>> Added HD3SS3220 Type-C port controller along with Type-c connector for
>> controlling vbus supply.
>>
>> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
>> ---
>> This patch depends on:
>> https://lore.kernel.org/all/20251128102507.3206169-1-krishna.kurapati@oss.qualcomm.com/
> 
> Please work on enabling both ports at the same time on the next
> occasion.
> 
>> ---
>>   arch/arm64/boot/dts/qcom/lemans-evk.dts | 102 ++++++++++++++++++++++++++++++++
>>   1 file changed, 102 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> index 2536ebe36edbfd146e07d5698779767acff87ab4..07389593b3cd4728357255d47156c6861cbabb5e 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> @@ -67,6 +67,34 @@ usb0_con_ss_ep: endpoint {
>>   		};
>>   	};
>>   
>> +	connector-1 {
>> +		compatible = "usb-c-connector";
>> +		label = "USB1-Type-C";
>> +		data-role = "dual";
>> +		power-role = "dual";
>> +
>> +		vbus-supply = <&vbus_supply_regulator_1>;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				usb1_con_hs_ep: endpoint {
>> +				};
> 
> You should really connect these endpoints somewhere.
> 
>> +			};
>> +			port@1 {
> 
> Please add a \n above this line to separate the subnodes
> 
> [...]
> 
>> +	usb-typec@47 {
>> +		compatible = "ti,hd3ss3220";
>> +		reg = <0x47>;
>> +		interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
>> +		id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-0 = <&usb1_id>, <&usb1_intr_state>;
>> +		pinctrl-names = "default";
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				hd3ss3220_47_in_ep: endpoint {
> 
> How about rename the other one to hd3ss3220_0 and name this one hd3ss322_1?
> _47 doesn't really tell us anything and may re-appear if there's another
> instance of this IC on another I2C bus
> 

ACK. Can we rename them as "usb-typec_1" and "usb_typec_2" ?
Krzysztof suggested to use generic names and hence we used "usb-typec" 
instead of hd3ss3220.

> [...]
> 
>> +&usb_1 {
>> +	dr_mode = "host";
> 
> The connector states it's a dual-role data and power device. Is there any
> reason to keep this in host-only mode?
> 

As mentioned in commit text, there is a onboard hub sitting between SoC 
and the HD3SS3220 port controller. Hence device mode can't be used. This 
was the reason we left the above port nodes empty since we can't connect 
them to port nodes of controller.

Can we mark the connector as host only and remove the empty endpoints ? 
Would that we sufficient ?

Regards,
Krishna,

