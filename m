Return-Path: <linux-arm-msm+bounces-88433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C54D106F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 04:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 793A63024D4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3015330594E;
	Mon, 12 Jan 2026 03:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSFkRsOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhK0Puwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F561FC101
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768187537; cv=none; b=eNYyQEuKVzRyU6AisMbb/Mshq6X44+YTbeBOBLKL9j9y2oXjmzK0ZuWJdL7k7P3q2Io5j0AGJdEed3XuukI+b+AziZ4xaJr/Q/J/3SclK7HY8+l5yBuamTjoPxfcO5fs9dEo9RqiproEYmkR7KwwSfsUgibdql8X0msWieeJIsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768187537; c=relaxed/simple;
	bh=rWe9S3x0rU0RDUaVEZG3aOPygvRzAEgWp3rQ+4f1xKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7tVq0froz3AedzEj/RuWHGVf17syhc4/RyT2t7dBwOVY5FboNUK1/EATUJrkYoJQ6AgfDaZdEiubbnqChkXg4VZ4CthubxGQd+P0uLjhrHPslJrqdDOIJOShy2gnQpizHRgvwh3gT4rNFIanAxHli46Dz4HIq4KmshhB+pTFH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSFkRsOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhK0Puwq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C2O1rs113540
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wMKgdp5ytqfr16xByfFd28oPdawQrk2ok58JLrYqc5g=; b=JSFkRsObfyf6TM+L
	2Wa9CwU8cn+/iajAMDTgimece8BnZ+QX0e0wnwOpSoR5XBQzz3+m/z2MVagmb59b
	DPhNk17QyYeWQUzCsVW6cY08t23tggUAyT6vNpcnzUvN5zJU1BH+Z51epf1BRvFv
	q2UGM4fjjrcV9kM3Drsce2CI3Q5zLpR8PQS2c3DJQRrbNbJwqCTl3b1+oLMJame6
	z7I+SBPKXp22YWr5FnPeRZhwNdmtAUAEMUxaZUqDcbv4iZA6wFMS9k7AlZIpFhVf
	lt8WBux/7CT+bG6RWFLTZ3ocnr+P+gUntpLe5rj+l8sI4BolarA4+b3V++wYBVpD
	tzKiVQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4ug3q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:12:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25e494c2so51465175ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768187534; x=1768792334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wMKgdp5ytqfr16xByfFd28oPdawQrk2ok58JLrYqc5g=;
        b=fhK0PuwqyEI875mbk0M3h3uAdAj/oIxFr0Q3jYQqvWFF3XV4Ku4fFhZrCx5D/JMGYx
         9B5FAZKtgpHSO/LKZ5VJiMjQWrbWFF2kN53FoTFxmVqLO3j+dc20YSCN65PyOFGWWvGj
         XCVfBrVEfWKIc7vLoAr2odyrQ9s3dtT+/lH5Sae/wluOEfWcz2TrHkNjpIQKmRH22N5g
         aZmQVgkzZ7C5N/ms3BaazDrCdztRoDTi8L+cvPWjD7v8v8Z3FtS1de+x4rlkPgpHlfr8
         sYSgkEG0ebDIui8t3dXXq4aXZoXvvsFAXgOO3VWSKPrAxJwtsUAtPbH+620udvXFrFf7
         eLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768187534; x=1768792334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMKgdp5ytqfr16xByfFd28oPdawQrk2ok58JLrYqc5g=;
        b=gL0l/eJphbjBzsAmBGP2titIJ0ks+pQdp+hbvMBXVxfOZJ5M3d+7oig4JnFbbPb0Tu
         atDVgdEFVm4q/+4M9M3/FYCc5X1LG6V+7jVsanbqfUTTAt/ublG2iN6N/QgiuhQKdy8j
         hLCSAa8pl+FOpTsv5vqv3hhpn1p3iKZZLLSYBpJTcb9iRzUpTfIA7iUGBTfL805AujZh
         DWtfB6z9O3jKKCNXlmelP/HIRzrewjslXiLOgesLswZoZ+h8HXHhgz0UDQU8dkOzOfVF
         kSvxhrDFNjjsnE3VOS9PK5FDF4RNooYOJm0IcUQFAc+uZycBf9Pc5DpdwI47fiE25QbQ
         z/ng==
X-Gm-Message-State: AOJu0YxFgj/H3/jMGSVPBY71tsmkmu6Z4WrVrE4Z/D+LZuL7QuhkVIps
	qZF5M+GqurWS9VyLtE046S0EtwRAxXo/TcBOKkRhlE/mVO4n6GmT2p64hjqOJVYX3OYJgfzAPQw
	w8yXTByCFVQEma7dEt+Zi+btnTmuMOGq1nEAGImX2CCSz+csOsM/1Ui93HlHktw2c9hq/
X-Gm-Gg: AY/fxX7NuV+WaQ9RveasG5IQjPmpISC7xYyqMmBbhzyh7SMfk8e/W00MLT/n6mKjOym
	iLzuXGvvUTwbsj5bqBYNJl4KNAzowl28XIDI0MnZFrS18qKuie6b7oYDzZtiV61VgQEIzSNh2j/
	W8cPCOyyKnYAhXlojlW365PmX5HQcYk2vh0Q0dzRCwifpb2w+CtOt0jav4UVezwAm5wRf5eYFex
	soZbS9OsSKiG1a5o3WkGJygBFOTomB1JBmOMTR7bBrEsHSl5P+pCu+begrmHtQmueGiJ4CO/+Rw
	jLp76DD2NP9oIvIDiiQ/b1e+ADJNfaIPrUNW0kYIwWBxnMc7eN6i7/iCQZdcu063HGlKGJC8O2C
	LfMR7sfY92RUlIHqTXF7Azhsyuor6TabX3TrUQpHEnRpYkZdq00G9YLI6XMN82YEaij+c4OaqyX
	0fmQY=
X-Received: by 2002:a17:903:360c:b0:295:55fc:67a0 with SMTP id d9443c01a7336-2a3e398283amr199078505ad.2.1768187534387;
        Sun, 11 Jan 2026 19:12:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY4+xcjpILsvDD5VC5BESKzskx9BJ0UY1mzj9YkeG1ANVX+/k4w0iV8ipRUmh2Fc4tCCKQbQ==
X-Received: by 2002:a17:903:360c:b0:295:55fc:67a0 with SMTP id d9443c01a7336-2a3e398283amr199078305ad.2.1768187533896;
        Sun, 11 Jan 2026 19:12:13 -0800 (PST)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c49299sm156592405ad.42.2026.01.11.19.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 19:12:13 -0800 (PST)
Message-ID: <3959a318-aca3-43e2-a431-4a9ae40f911f@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:12:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <20260109080000.606603-4-yijie.yang@oss.qualcomm.com>
 <6e8e6583-033f-439e-bd92-b24fe432fb96@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <6e8e6583-033f-439e-bd92-b24fe432fb96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNCBTYWx0ZWRfX1ztzEcZVC/CJ
 3y2342f0pnkc6UNuhWopWgQYyXW5PRr61aAchPbSWJsY6ZzBrsZvAUKBwUvoN9aPoKjSKykJ8Am
 eeQFYUC5s63HjIKVaj5jWr0HxnaBUo4M52UiwRkwmuCLL/n3++NDB04uoKb+bEu6KVbeKOVfdvU
 5qpHYrZay09drsHJT7I0t0wvqC/krTpND2E4juzjse8bSZNEYCP5kSm9IiZ1SuTDdLIiXKtgYRL
 L8l/RKx7dcx2Kgkh1IUeekTZtsoSjaGQaxnyfQtz47+mH2eMmBlE1jo+WQijc2gFuTxZMm77j1W
 N5he+yMo9ENeNqWeO28BGh3Jggt7I0gso+FSHImF6/j484+b1GoQZ3CcAzEJx815EW8a4fiGJgq
 prYfoDwMfWLPVewY3z87wUFbdhHVhPP8KMx067OXOZ0S3nIf36pZKbJhil2Rdlwd+pYfnsZww7E
 b/r0wIuIHwUI5y+8hGg==
X-Proofpoint-ORIG-GUID: H5XKo1yl_nn4ZAoPTrKbli1UI6C9q48q
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964668f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AJi8pdhihi-j9CtbXIUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: H5XKo1yl_nn4ZAoPTrKbli1UI6C9q48q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120024



On 1/9/2026 7:29 PM, Konrad Dybcio wrote:
> On 1/9/26 8:59 AM, YijieYang wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Purwa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
> 
> [...]
> 
>> -	backlight: backlight {
>> -		compatible = "pwm-backlight";
>> -		pwms = <&pmk8550_pwm 0 5000000>;
>> -		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>> -		power-supply = <&vreg_edp_bl>;
>> -
>> -		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
>> -		pinctrl-names = "default";
>> -	};
> 
> Is the backlight infra different on the Purwa IoT EVK?

As you can see, this Purwa file was copied from the latest 
hamoa-iot-evk.dts. However, not all nodes have been verified on Purwa. 
Therefore, I need to retain only the functions that work correctly and 
keep them aligned with the nodes from my initial version. The deleted 
nodes will be updated later by the respective authors from different 
technical areas.

> 
>> -
>>   	wcd938x: audio-codec {
>>   		compatible = "qcom,wcd9385-codec";
>>   
>> @@ -60,32 +50,6 @@ chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>>   
>> -	connector3 {
>> -		compatible = "usb-a-connector";
>> -		label = "USB-3-Type-A";
>> -		power-role = "source";
>> -
>> -		vbus-supply = <&regulator_usb3_vbus>;
>> -
>> -		port {
>> -			connector_3_in: endpoint {
>> -			};
>> -		};
>> -	};
>> -
>> -	connector6 {
>> -		compatible = "usb-a-connector";
>> -		label = "USB-6-Type-A";
>> -		power-role = "source";
>> -
>> -		vbus-supply = <&regulator_usb6_vbus>;
>> -
>> -		port {
>> -			connector_4_in: endpoint {
>> -			};
>> -		};
>> -	};
> 
> Are there no Type-A ports?

ditto

> 
> [...]
> 
>>   		panel {
>>   			compatible = "edp-panel";
>>   
>> -			backlight = <&backlight>;
>> +			//backlight = <&backlight>;
> 
> FWIW we can't merge dead code

I will update.

> 
>>   			power-supply = <&vreg_edp_3p3>;
>>   
>>   			port {
>> @@ -920,23 +886,6 @@ &mdss_dp3_phy {
>>   	status = "okay";
>>   };
>>   
>> -&pcie4_port0 {
>> -	wifi@0 {
>> -		compatible = "pci17cb,1107";
>> -		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> -
>> -		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> -		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> -		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> -		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> -		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> -		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> -		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>> -		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> -		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> -	};
>> -};
> 
> Is the Wi-Fi solution different?

ditto

> 
> Konrad

-- 
Best Regards,
Yijie


