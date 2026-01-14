Return-Path: <linux-arm-msm+bounces-88894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA9ED1C20F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 03:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3AAE3300CF2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 02:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371102FE056;
	Wed, 14 Jan 2026 02:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RFnrYt0C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkymwJdx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA212F49EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 02:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768357645; cv=none; b=t98rxxIZ1JwZ1+v4KJt4movntFHiHgUzXsJ2EW8OHmwq9TiK3D3RTCxgvdqZnY7zoRTgkPTrbuHnpHyo/XuPsEq8/SB+nEDpB/tVDzSY9/lMskArNoCjfWuySdm4eSnJ6/UN1agqaqMzIncScUQNyMtjeBSLyJFSqo88MZwuSCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768357645; c=relaxed/simple;
	bh=IqlI6OS/lcK0dRsPQa5RrUkPWstqb3VM96Oa5URN0Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OaROaA3z89bWSXtGaMTtm5W79AlwqHONV9/cjzb9dGBp1LmXfUdm+Phy5QN9hg2Tr3yidiarhGv5XH6V+gdxeG03YYhS2Amkr3pWQ8PdoUAJlsi34/TLbTL04Xtx9bDQcFHY1PK3GYC7HrodLdxAiNnmEsRRAh7u7iiTFB8h0rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RFnrYt0C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkymwJdx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DNHX6D1717282
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 02:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o4ZVfVEYSEr+JHs+UR1ckv011KTtyQOrx1adpUvgxQc=; b=RFnrYt0CKYCGcIoj
	A9UkmWdYm3Oq9U2hDg6guTFP2w9MKiFvSTG+7zBoKOtv995oUwxb3JT/Ug2fTA9y
	vnBJ9Vq5Xr4Qxyv6B0khJEQ/ZJQvN27d2/1gK7jsHSnCF7ZCQ5KjnPoiFXV2SqP8
	qjT1vID6v/Svh+0GV0QHZiNAaXvRFgglfatHwhWlNUWVkJhC/8bKnDaxecO6febd
	7YwZtRAf3ZnVqgQwZPNIsQPCIXV0mKv44Jh93zOII72tATiCPBipeYTE3psRwZPM
	/clLarNH5FqysPYY77hhhxYGQU1N6eB/jq2gc/r4F9IYFFmP2PphSynrmePdsDtz
	mureYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7v8uf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 02:27:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34e70e2e363so9423011a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 18:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768357642; x=1768962442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o4ZVfVEYSEr+JHs+UR1ckv011KTtyQOrx1adpUvgxQc=;
        b=YkymwJdxyRuFYiOrWMV+lrJ2MJ8Abn7N9aGCOqrhKRkfztnwMlwKbBR9/pidaymXDd
         JGFH1Tn8eTNuOdEBUlf7nCMc0RoKlFBZaIZYDOZs5Tb9pX3/vdkHSHrk9hcc0Au0l6bi
         laHWYOpbvFOh0Z7p0yfCC8dAK61F0gFDIalm7ietQ5uCQ8tzXvvCnQM24lrvyb3WWMPz
         gwM5T8+pZlct9WxP50103ytegyeZl21vktSAEVOJjzXnwNNOjq0TTH0qaAfJG7rza2OZ
         IetIeJZ/Ww20x5/U41YeDdWt6w1ZFtEdlzELJlDcTHC52RUerVj4S/hbKG+hk1yfmv+a
         nQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768357642; x=1768962442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4ZVfVEYSEr+JHs+UR1ckv011KTtyQOrx1adpUvgxQc=;
        b=hoosq7NwAIvKVpFyTh4+YxSleZ1ZXji5YmCW32NVCYIACJgaTJ5KWyfnwUdZTy7X+E
         6o0twzQSayLeaf2utBfG4Tn7KsoT8yBHuMJXc0vt24t7wy4Hmu0lmg8plBq13VOst+UW
         GnhAwBQmoqKQzZfIeCBw06rWQyOO2uxFD631lwvxwejzo8I0ArpcDtFqE3WrvcnRBYSC
         YqlN4n6QnJkH8pNRcfEEjo3jB16SFSgvJz3YNBcJlW3TDyrhfXlJpolAZC6dkxZpcvem
         yhOKc1AeT69xvCNsGED9QDZ4ZYOEtln8KpUozs+x6yKFURXt09tFqjI/vXXOx95UjVVy
         x/lg==
X-Forwarded-Encrypted: i=1; AJvYcCUYmRPEygXT9gh3LopA89x5TvMeU/dgmCVTYnlcN8n7qmjT+7LYusdhVRdh8Tx5AHKX95CqjxqK4NNX44RG@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHuezUqzVYLe0Fdx1G+aEXTWJmJ5cI66ww1SsLo5gBaZRaIGP
	ZzyHkmOnYktX7dvVFkk6dkcPTuLftvV0bECyVB81oiu0arci4noS6eYl5E1gDvR5uHHpZMfr79h
	x7DauaFXqChZ863aQXPtdR/FfxIFqSBoXmNd2oYPh0GkL59UJ82dpPvBDe2bVz3sclkuQ
X-Gm-Gg: AY/fxX77873TPCR7/ukQ9pxl2uzmFKCczc05lewZpRWO+3rgrRXOmmanvYCJ5LdTv26
	f0PbzEHyMLVuP8KVvtUCx6DGbAq3QJerNVH8p0eB2NtwQ01tk3tzNcorBxzDuQl0dTC9vKZvirZ
	O2WDAn88rKA4zZV/S5bXOsMUg//6qqZ2bMSeJwdaUZJqB7YZied0CDZaawhk7vP/EMNftUNYOAz
	PpBM8cySkBLl85BQFnChnMHISEEWTaugZailTFVF4bX5goThzUVB8or6QDTG5L8Ip1gFRaNQiuR
	k53WN8GJ8rHnoQp2T0ag6yotknZ42fERlDuP+N7z+gJk5yb5CC7Zl3+j1lhuMpYr20nsVO3WViC
	1bPdRK3cpGVCM1DOmtpJrKmkRf+B5K5R/9YaxdQU0JR4iN6X98a+L5TYWbGpr8tG1Qjsw4Munsg
	99Ug==
X-Received: by 2002:a05:6a20:3ca8:b0:366:14ac:e210 with SMTP id adf61e73a8af0-38bed23cfefmr1147664637.78.1768357642268;
        Tue, 13 Jan 2026 18:27:22 -0800 (PST)
X-Received: by 2002:a05:6a20:3ca8:b0:366:14ac:e210 with SMTP id adf61e73a8af0-38bed23cfefmr1147628637.78.1768357641728;
        Tue, 13 Jan 2026 18:27:21 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faf8sm21942789a12.7.2026.01.13.18.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 18:27:21 -0800 (PST)
Message-ID: <3906614d-d9df-485c-963b-603e2311bc2c@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:27:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
 <20260113102822.590677-4-yijie.yang@oss.qualcomm.com>
 <2qa3kn6gw4f5qlncq6iwgxattfbbztu42gpcbekqfghcrdg3l5@z7zsx44xch7a>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <2qa3kn6gw4f5qlncq6iwgxattfbbztu42gpcbekqfghcrdg3l5@z7zsx44xch7a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAxNiBTYWx0ZWRfX2dMR55jsyxnj
 lAoSe37rRNDbNZcHqEfu//3wXeeU9/25sRrl4c3jWe+wXCUGqNdW175MPWUMpsB9MTw9LoCoA3u
 aBt3UvZb5V15uKFDPrqigUVvKzwgeoXTa8AYurO7Loa30FXqT3yMVhxa5+bg21l6Wel9RYW2hX3
 YPRaFpmqy4w7QqVcmPbnf3iThujv7u6IEabIjqentHaxfzpVrqBJsHehC0QMIh5ZspArAKISZsO
 aiUWZunM5zZ0M/iGzNqjK1ogHucYS3ExSV4um8YkeZCoRD6JH8mrMDMYpT+NW3X4BwLWwV4lAWN
 sCIaxPKgkmU5wPJOAGAk/aIewByXsJv2Ve/EV+V4+XkLBblxI6iQvOYFF3B71lJnYCDZ83kHM9k
 B9iiFw+WaYnmGA1OhJ3SFJvlw19/Hn9nTz6QlY7J5ZsXkRWPFBGCtOUFxyYS8cYYpevARrH5vg1
 bJWhNZ89qBjUccWyyFg==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=6966ff0b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XouMtsvGk61V0B9W5bUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 8lyjoSA5lS3RNeTXFrp7RsdA6LRdHdro
X-Proofpoint-ORIG-GUID: 8lyjoSA5lS3RNeTXFrp7RsdA6LRdHdro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140016



On 1/13/2026 6:52 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 13, 2026 at 06:28:16PM +0800, YijieYang wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Purwa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
>> Meanwhile, USB0 bypasses the SBU selector FSUSB42. As a result, the glink
>> topology differs from that of HAMOA-IOT-EVK.
> 
> What is "glink topology"?

What I’m referring to here is that the graph composed of glink nodes and 
their peers.

> 
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
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   .../{hamoa-iot-evk.dts => purwa-iot-evk.dts}  | 102 +++++++++++-------
>>   2 files changed, 65 insertions(+), 38 deletions(-)
>>   copy arch/arm64/boot/dts/qcom/{hamoa-iot-evk.dts => purwa-iot-evk.dts} (95%)
>>
>> @@ -1102,9 +1140,7 @@ edp_bl_reg_en: edp-bl-reg-en-state {
>>   		pins = "gpio10";
>>   		function = "normal";
>>   	};
>> -};
>>   
>> -&pmc8380_3_gpios {
> 
> This needs to be fixed in hamoa-iot-evk.dtsi.

Will do.

> 
>>   	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
>>   		pins = "gpio8";
>>   		function = "normal";
>> @@ -1171,16 +1207,6 @@ &smb2360_2_eusb2_repeater {
>>   	vdd3-supply = <&vreg_l8b_3p0>;
>>   };
>>   
>> -&spi11 {
>> -	status = "okay";
>> -
>> -	tpm@0 {
>> -		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
> 
> No TPM on the board?

It has not been verified yet since this patch set was sent out; I will 
add it.

> 
>> -		reg = <0>;
>> -		spi-max-frequency = <20000000>;
>> -	};
>> -};
>> -
>>   &swr0 {
>>   	status = "okay";
>>   
>> @@ -1470,7 +1496,7 @@ &usb_1_ss0_hsphy {
>>   };
>>   
>>   &usb_1_ss0_qmpphy_out {
>> -	remote-endpoint = <&pmic_glink_ss0_ss_in>;
>> +	remote-endpoint = <&retimer_ss0_ss_in>;
>>   };
>>   
>>   &usb_1_ss1_dwc3_hs {
>> -- 
>> 2.34.1
>>
> 

-- 
Best Regards,
Yijie


