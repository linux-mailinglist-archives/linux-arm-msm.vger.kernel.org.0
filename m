Return-Path: <linux-arm-msm+bounces-88445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71569D10A6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 06:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDA1D30382BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 05:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFEE30F532;
	Mon, 12 Jan 2026 05:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jn7HWgH1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QC4llxj7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE5B30DEA2
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768197082; cv=none; b=ZWhCH8w3+IxSOA4MfIxRCQ4iE8bfpaGyV/Y0O/1LHnO9YrsUu5emBk/rTYhKKSKhZYyV/ch3XhZo4LHW5mfCEQnwQIlK6AycPBthQ5O5VSWn5fCNMbvFCFnCthEi/N2/UR0sK4+XqogdqpAXS316qlyDeUlrk+eP/YkP+fhpVoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768197082; c=relaxed/simple;
	bh=JuaMFP0t1+E5fdrKVBX640bCvL/oF2Kp4wmZ+i3Fid8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfH+2vsoBLMwCpwiCVNP39OehwCvPhHZxKSDCBOU5JNDLst6N6d9IKRokwsFI7wpWf4+KObMIl6X7UpqaB0Qlojk8nBb/oGpu1BSGS9BXOs+GiNIMCh/Pa7imWJ5pLyHInGm41Ofo3DGOdAkKr2qQSZqv/HRL0OSwHKC2p4pkwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jn7HWgH1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QC4llxj7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BKuN5H1041986
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EDLrSzbzStLNHCm1lNuX2Pjdkq0e/yvGcbbfdbwkQ1Y=; b=jn7HWgH1sr7N0FVr
	AryT89Q/wxmVLbICdPeb8golJDV1pbBlJbrmMo9WcBz15v0UuuHHLlDBL6h+dc49
	fRCMEfClpskEY9aUR31AocFGnpOrDij/gBGBVFoUBNk++ggkkl66Im6sKvI+4AKE
	JBO84BUedYjNMtP6cgxCq15fstQdj7RnYVSJCyb9oFWQy9V6DBjkCj86AZaDgnJP
	vpu7+7tatCQ+wbRmf55GOn+t4ITfDhAJ4ds7lqIuVVKhPrhmzgoR6HciiZLNwcn0
	Jo1qsWXouFpW0GVJbv3S1/ZljdQ51mWe0U+iu5nHH4wIvewD2Qs3phZydlEzOtuE
	xNq1vw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfuks3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:51:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f79d6afso75211405ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 21:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768197080; x=1768801880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EDLrSzbzStLNHCm1lNuX2Pjdkq0e/yvGcbbfdbwkQ1Y=;
        b=QC4llxj7/Uqo34lJvlvh/JSbKiLnIKp2t0Pj2jnbNBVhYw3OIvqGMk+XIaaw2k0O3A
         GVHjjjDvn5V6GiAH3z8WoDhIoFc3AnWO2t1WZzSMUpa1OhOH0vASXPQAJYxF/8CNuBix
         hi55U62vEllq92H6F/NPX/yeg+Bif663tsyjvQZDsWxG4/Dgqb582+jI6DIxj3gA31V5
         fqbjpw6e0RUcMIw0pirWCq+u+G/GcoR0oSpkkvwkvNSpAZCR9ABXXgViwmMl7iV2vTBK
         vD6V6qBxSTPp1KzZnVJnxDdd7rruguZiVnuF/WWpT6ZOO1zWY0OmB4Ltg6VLB7ehZ/ds
         yCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768197080; x=1768801880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDLrSzbzStLNHCm1lNuX2Pjdkq0e/yvGcbbfdbwkQ1Y=;
        b=buU8xT/568owYF+UdmEsCOwWruZ6n13wLEs4OB+0CQjhz+EdgvxNWXYHpXoEZlZw/F
         unxyrii/UclLy1aHHHXWb0PJdE4DXGyAKuRU/RRq1P3RsrLrxz5PAoYZjqhnBTY/vFLq
         EpNZX9Q8IflkVHwffhdO/AkLmBC7+fM34KJdErBHBEnUNl+GsqDfvgJPVtoBKusg/UN9
         pGIyIwvlCzWVDT5ec5/mjMEdkNpEmdLZADigPjTXWoG/beEZ8/Ov/AWDT6btwuIcoQJG
         xNlB+3w3NTe/kDwjs/784vAeCqNxspT+Pkgv7xl4xsUZWnoQGnyoHzGjHj13/5ukrCjR
         UErw==
X-Forwarded-Encrypted: i=1; AJvYcCUSpQfXizo+nmctXItugDoAuVPi3+uKyredfkWbQn2g3glWFiB/GdSzJVtxJUMcOFcs8gaKKUEp64l2DusF@vger.kernel.org
X-Gm-Message-State: AOJu0YwzZdGKirj68NbAnls4AWWYgUEm2sg9DPgD5DoDuJN/3GuHFB8+
	IkjwbCdqeHyjIqox1IgUI7xCLiJRKgSmE/nLyiqxqJI9HOBgeZbbReBENA9OnSORjliYfC5h/5L
	UbpL1vjwMO8QCQn9Ogb4Xmm9QyAEVTMhF1SSZlVTYGlfMM8zia0uGVRk1td6925aLLVFg
X-Gm-Gg: AY/fxX6fYZTYDhFHJG+k35LX/5e3hiefJEMJPFle/Jd12Cz2Q/5UPzgfyox3chMhL5e
	wOpdIwN6uE8oEAInKQHvuAhO1SnaSWKNfMHVYtQvKsaS+zq7nZ1PX5AGgwqXKHfRwHzctxZyIk6
	Hwq+kbi5dmc8YJUCHAS3zjx5yapuWEVT8bGgBtuHoA6r9eO4jaEJ1mKDcMD+8n/ayN72vKQk5Hw
	4jO9qHXlSz6trwOaV9XxbbwL3DkJ/OuDUuvRS5IoXn7cR651+yYqQUJk31SIGtdTTBhdeTEssSh
	BgCXy/5tu/LUoRmohVTvoIGcEU3Nlj5QS+l9VALWYOAQExNGBfmpZkBMdya7OQ0kRql6JYO1b2S
	ie3ctIQ5D/wRjBoaLWtCTNQnCPS11EF7UQ+syNZ05es9vX6Z0KsXZ3DhrTsCmi4xEJhk=
X-Received: by 2002:a17:903:2b05:b0:29f:1738:348e with SMTP id d9443c01a7336-2a3ee433c46mr166419865ad.15.1768197079712;
        Sun, 11 Jan 2026 21:51:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVY/LvYrx+Ysi29SmgJpMwP0/Ujm07h5/DI+nYgBROfpmnnvAdJhyXkbp77WuBfId91vPgcQ==
X-Received: by 2002:a17:903:2b05:b0:29f:1738:348e with SMTP id d9443c01a7336-2a3ee433c46mr166419695ad.15.1768197079224;
        Sun, 11 Jan 2026 21:51:19 -0800 (PST)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c47221sm161667605ad.23.2026.01.11.21.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 21:51:18 -0800 (PST)
Message-ID: <d5d1d6c0-87ab-42a8-9816-359a64b9112e@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 13:51:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <20260109080000.606603-4-yijie.yang@oss.qualcomm.com>
 <6e8e6583-033f-439e-bd92-b24fe432fb96@oss.qualcomm.com>
 <3959a318-aca3-43e2-a431-4a9ae40f911f@oss.qualcomm.com>
 <ak6xsow3cobhe64y2koa4v7w5dkdc4v3zlmpokws4nxmu5c6rt@kdgm2oqxxvcl>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <ak6xsow3cobhe64y2koa4v7w5dkdc4v3zlmpokws4nxmu5c6rt@kdgm2oqxxvcl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JoERTBQh1h1UKX0OIrdkxYX6cE2gNh-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0NCBTYWx0ZWRfX6i8I/1j0jmIQ
 AeSdorMhAWk+vS7FFSShcUeDApKxAi0f1U91kyP8lh09VnpS9qibG/WQQ4jaqBdFglm6qC7gg9Y
 dZWX7q89TSov/6/M5lAeXgWWXDeGrN8PuCvpUbQ3ymOHQdhWHBxsBib2qmFIQ3ST0oYCiw75CW+
 16nNqTFN8wqPkMrkyvmuED3M4tIeqRhqDrOUPiYZ6POTlH4EEbBBw/heyX1s1UF/e7c8VMS3308
 md633skEG7/b0aJWavCGD+pMBfUJnXB0ZshQ7SPTcYOATqc96205Gs9o1kdHrT7mJz2w0SqNsxH
 WhKyzKcqVLjPJ7Y88MNQDue4TN6j3h0Fs06OxlF5bbODDEN9pIAXWDamnDVQO7ykMeXnIeWVBW5
 w6HNlvKguMwWJx3Gb6VlYP4RUUaGYDfcoWfYt+CBdJbBylGKYuFh8qJh6wEgquk1+MKb757ZVt+
 BZNGygA+7NpV0tp/ziQ==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=69648bd8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OS0qKxNM1ntZJlTngmAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JoERTBQh1h1UKX0OIrdkxYX6cE2gNh-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120044



On 1/12/2026 1:00 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 11:12:09AM +0800, Yijie Yang wrote:
>>
>>
>> On 1/9/2026 7:29 PM, Konrad Dybcio wrote:
>>> On 1/9/26 8:59 AM, YijieYang wrote:
>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
>>>> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>> the Purwa IoT SoM and a carrier board. Together, they form a complete
>>>> embedded system capable of booting to UART.
>>>
>>> [...]
>>>
>>>> -	backlight: backlight {
>>>> -		compatible = "pwm-backlight";
>>>> -		pwms = <&pmk8550_pwm 0 5000000>;
>>>> -		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>>>> -		power-supply = <&vreg_edp_bl>;
>>>> -
>>>> -		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
>>>> -		pinctrl-names = "default";
>>>> -	};
>>>
>>> Is the backlight infra different on the Purwa IoT EVK?
>>
>> As you can see, this Purwa file was copied from the latest
>> hamoa-iot-evk.dts. However, not all nodes have been verified on Purwa.
>> Therefore, I need to retain only the functions that work correctly and keep
>> them aligned with the nodes from my initial version. The deleted nodes will
>> be updated later by the respective authors from different technical areas.
> 
> Please, only delete nodes which are not present on the Purwa IoT EVK.

This isn’t a deletion—it’s just not ready yet. Why do we need to include 
all the nodes like a mature Hamoa platform in the initial push?

> 
>>
>>>
>>>> -
>>>>    	wcd938x: audio-codec {
>>>>    		compatible = "qcom,wcd9385-codec";
>>>> @@ -60,32 +50,6 @@ chosen {
>>>>    		stdout-path = "serial0:115200n8";
>>>>    	};
>>>> -	connector3 {
>>>> -		compatible = "usb-a-connector";
>>>> -		label = "USB-3-Type-A";
>>>> -		power-role = "source";
>>>> -
>>>> -		vbus-supply = <&regulator_usb3_vbus>;
>>>> -
>>>> -		port {
>>>> -			connector_3_in: endpoint {
>>>> -			};
>>>> -		};
>>>> -	};
>>>> -
>>>> -	connector6 {
>>>> -		compatible = "usb-a-connector";
>>>> -		label = "USB-6-Type-A";
>>>> -		power-role = "source";
>>>> -
>>>> -		vbus-supply = <&regulator_usb6_vbus>;
>>>> -
>>>> -		port {
>>>> -			connector_4_in: endpoint {
>>>> -			};
>>>> -		};
>>>> -	};
>>>
>>> Are there no Type-A ports?
>>
>> ditto
> 
> ?
> 
>>
>>>> @@ -920,23 +886,6 @@ &mdss_dp3_phy {
>>>>    	status = "okay";
>>>>    };
>>>> -&pcie4_port0 {
>>>> -	wifi@0 {
>>>> -		compatible = "pci17cb,1107";
>>>> -		reg = <0x10000 0x0 0x0 0x0 0x0>;
>>>> -
>>>> -		vddaon-supply = <&vreg_pmu_aon_0p59>;
>>>> -		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>>>> -		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>>>> -		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>>>> -		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>>>> -		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>>>> -		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>>>> -		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>>>> -		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>>>> -	};
>>>> -};
>>>
>>> Is the Wi-Fi solution different?
>>
>> ditto
> 
> NAK
> 

-- 
Best Regards,
Yijie


