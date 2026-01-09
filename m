Return-Path: <linux-arm-msm+bounces-88268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DED5D08F15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 12:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F6A0311477A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 11:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14A2359FBA;
	Fri,  9 Jan 2026 11:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTiJ/Dg5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCKJ2mYu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42017359F98
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 11:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958180; cv=none; b=MPvDVQW6MUfNDT2qzlD7KgGiYrbbgZ6yTscXMgeiYyz6lpAVNbjp4Dfb9rbyfM9lLBrJIfjTgPbznBL6jKwFkcMlFdguCoe25KzH4ubgQMtC0v1v5VW+YZXusE1KhXpk896NmL+MdNtw/bqPFH9rJBm8QgIRZ3yS9HAxPwPs3bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958180; c=relaxed/simple;
	bh=c9YDJM3pT39vaijHmZFFbsKUb3f8dgWlFld6jxOYbqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2v0yBSY0CLt8UTdrUoAwbEBf0hHg0aT5PYPQ4Nh8ZDJq4hjez2bgokspwHh9yQ3jtovShvTw2ruKTiw1u1miLNzF6JVWWNYIulkUyXloeJoE/IzV3ak+JpTq8MQsAfrb9TIIufxB9O6lDtW1/cprYo2iW5GEExY9aOYUQzIvLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTiJ/Dg5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCKJ2mYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60982YQY2184011
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 11:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2lGiKnYxFHdcjMNRzQ4V56/23nl7ZnAleRxOsMTf7Qk=; b=kTiJ/Dg5CDmidQdo
	a1VzsDT1pCtmXR3xs1SYqrv4+1euyNghMpPhMOTZu7t4la24uALBLTWpz1cnGCJy
	ZfKuuNM8K0SFwbyBIuKqW7NKuNZhg591iZopau7Jo0sD5Nz3ulnJv247pIyCFiCm
	tyYX03cOPUyYeb1v8T6P0o0WRZ2tORUBZGcARAQhEbJ0PXCl6g11AoENT2DErHqz
	VoIm6gdMkfxkn+3nh/8P5JAQNtqtXD4CjTnKxJJZ9ZGVjDUTl9kxOY/6rCpWMYKh
	V0S+MmyLw8Dzzf8q1nuakS02LSHSUv2pnQUz4mU1sX8s1WtybqFffCHkb7OKSWXA
	uNtj/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn8n6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 11:29:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b222111167so70374385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 03:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767958177; x=1768562977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2lGiKnYxFHdcjMNRzQ4V56/23nl7ZnAleRxOsMTf7Qk=;
        b=NCKJ2mYu+SOZm6BDvimyxVvH2ShF0DdVxwm0iDqzaq6zixFP2oE8KSS8/ICK9lhIVH
         Cv7yuOanwX7jaA2yCEJ3Ee3/U+xK72tIPX9Up/mjXOwHtYaecGC7nSK38Pgw50c3ucwS
         fURsz50vgkvfHZodSK1VaZ/SFteYyvlyVHm6zwion9voSeH5wG+eQw5RWaZjD66DAqD6
         1e4RRiT3vhHZKocm8xlyUCaI3Pq2GQi6iVS2aCb8b/QjTXw649pnb9/utUcoCc6EieYt
         1f7vFHIonex0yqmLU4kkqRZ+qUrmBn0QUv5QxN1B02rhoeyUQJ1YM6MTJgJlsL40KDrz
         DtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958177; x=1768562977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lGiKnYxFHdcjMNRzQ4V56/23nl7ZnAleRxOsMTf7Qk=;
        b=IC4GMPXTekZHiB8nU62DkNT6gJlt8Rvg0BhUyUEG7AlSd6xJn/ciD4HKiBfly7JOVt
         +L+683fQKFriCClrwEs47u9i3uTBlL27i0x0JVFxjm4umk9KpRlhZhrag4JXducdZ5h0
         K0YPEZIHvVkyUXBTvUg6ffeeevvmJxLJ3/KRo3QKFI4ysGPFzmHX9lo0LIaUByCaHBx2
         S8zB+th8GqltyZM/exfZ6lNWx8GkjNj7Jm3F7xwa1piZdIEX+QIayj0V22hV+4xzRw/p
         PJkSeDwmR5L4pffNYac5ri8E8SE0/7rGJDXmWsWU7M8OWEapAyGKItdJS4K0H11fDZWW
         L+Sg==
X-Gm-Message-State: AOJu0YwiSadLRJkKM4ynqCBrDNQm3HGxQbk8W3vApQngKp2TGBxxlUNr
	QAZfTc1FxrlKU/+f1KHV5bw7AYS9aMMp1w5JlA8tze+FJgTBd3NFllwnFTSjS7mWMsUQPuyBmq9
	pNV/TFEoXI/iQJFJPFj3qnLTQEM6dWZLNta8JhPHvocB/oO8cRrQiA1YlHFM3d47ib562
X-Gm-Gg: AY/fxX4IDQGRHS3LWSkA/PjvrHSyBdmGbhirRzGvQShUKND6EnQ8eET5x4kYuNCa4O2
	OQyYpRipdYM9zwxNBlj8f7J8zLUhDdzyZ8+x3uj8eHeTWxW4mX/OFre33jzXYBMBu/qgx0Hc9AB
	jhCvmNcp976enj21xP6CuDYz/HR/5vf4VwEHdR/zCY0O1O6KalrM7X/vW4Sk0clqbJdZxKCqiLc
	2uGHsr+VEbbbF0PsnVhoHdkCm07BrcrbNi/fG9AUgfF7ZH8q8viD4JJtqoeEss24bnRXr72rT73
	06P3Eye2V6ZTRlgHEqiVjZeaH07Xv1FSz8AGdEAsl68NkDnuHN4fjJmyadmesStnn1+p/EbNcOs
	hZh7RdTjzVN5DC4qXYJAvCLHhtnEeLXq6hvjK/+nBVNTD3xvw/MivRukLzau2zpVuSEg=
X-Received: by 2002:a05:620a:4150:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c3893dc319mr885340685a.7.1767958177646;
        Fri, 09 Jan 2026 03:29:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTwyQ5k3Rb1AXE6oPBFNOU5tzMYrwudie2oteRiewHYjCh2NpvtvA/6vTYGjkjeraV8pTwSQ==
X-Received: by 2002:a05:620a:4150:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c3893dc319mr885337685a.7.1767958177096;
        Fri, 09 Jan 2026 03:29:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d4acsm10128635a12.30.2026.01.09.03.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:29:36 -0800 (PST)
Message-ID: <6e8e6583-033f-439e-bd92-b24fe432fb96@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 12:29:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: YijieYang <yijie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <20260109080000.606603-4-yijie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109080000.606603-4-yijie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KN92va0Q51h5j9B5rOYaEcJhB60eHxZZ
X-Proofpoint-ORIG-GUID: KN92va0Q51h5j9B5rOYaEcJhB60eHxZZ
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=6960e6a2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CyKOSZu2003Xl6tYHn0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4NCBTYWx0ZWRfX6ORcNID5Tk7+
 +j493hnLlPiGEXkpAywU7I/Z7fi8ps7b3vkngXSUgv2GpQZfpShz1FMhAhCC8wEPSQBmwTB4Mu6
 3rPixE0knmqNHPTbNwIAAkidw+/vgM8hLuqkdmiLBCmSZMc9jcJw6A2lertGO5CmxYNdJc2+ejR
 LvqLLsl8O9qLG3Hhfoo74CwqT36YTPBQwRg3eA539Ft66oqecZK/XrrZkVNtTiIxAtif/xxUfZU
 0q6IfiiyuG0XNWa2QXiYEE+InIyHcDZ5tJiJnKRAlAQhnbN8/XyV30aHrz/NMzGmgO1bxLXNzxZ
 2BHYtgdr35oOgM5Pc1W7v4u+t4kgY+y6Ru15DlaeenjiIFAxQmzWVk3iDLMv/EGjA5WZztFLkW0
 Kkm3usC4H1eWHPwQmmLZZy/RaPxsh1jbcBZ9eUCbFGsWec5a0xFqDNTqfpgRlLAf9A92z4sue08
 DlMfPu2lAM8BcVIloWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090084

On 1/9/26 8:59 AM, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Purwa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.

[...]

> -	backlight: backlight {
> -		compatible = "pwm-backlight";
> -		pwms = <&pmk8550_pwm 0 5000000>;
> -		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> -		power-supply = <&vreg_edp_bl>;
> -
> -		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> -		pinctrl-names = "default";
> -	};

Is the backlight infra different on the Purwa IoT EVK?

> -
>  	wcd938x: audio-codec {
>  		compatible = "qcom,wcd9385-codec";
>  
> @@ -60,32 +50,6 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> -	connector3 {
> -		compatible = "usb-a-connector";
> -		label = "USB-3-Type-A";
> -		power-role = "source";
> -
> -		vbus-supply = <&regulator_usb3_vbus>;
> -
> -		port {
> -			connector_3_in: endpoint {
> -			};
> -		};
> -	};
> -
> -	connector6 {
> -		compatible = "usb-a-connector";
> -		label = "USB-6-Type-A";
> -		power-role = "source";
> -
> -		vbus-supply = <&regulator_usb6_vbus>;
> -
> -		port {
> -			connector_4_in: endpoint {
> -			};
> -		};
> -	};

Are there no Type-A ports?

[...]

>  		panel {
>  			compatible = "edp-panel";
>  
> -			backlight = <&backlight>;
> +			//backlight = <&backlight>;

FWIW we can't merge dead code

>  			power-supply = <&vreg_edp_3p3>;
>  
>  			port {
> @@ -920,23 +886,6 @@ &mdss_dp3_phy {
>  	status = "okay";
>  };
>  
> -&pcie4_port0 {
> -	wifi@0 {
> -		compatible = "pci17cb,1107";
> -		reg = <0x10000 0x0 0x0 0x0 0x0>;
> -
> -		vddaon-supply = <&vreg_pmu_aon_0p59>;
> -		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> -		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> -		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> -		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> -		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> -		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> -		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> -		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> -	};
> -};

Is the Wi-Fi solution different?

Konrad

