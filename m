Return-Path: <linux-arm-msm+bounces-54209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1DCA87D08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E043016133B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221BD2690FF;
	Mon, 14 Apr 2025 10:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVe9d1iw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEFB25E471
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625257; cv=none; b=DjoDw/kYRDvJFX39N1/PYbzsDut8FSW1JtR3QW6GNsThCVf5qNU48QvPEk717atbKOt/mjhz7iKTTjMp+53MOKGhecMJSI/b+X/11L/D5FthsBfWnQOyYgke9mazBqJ9ZLS23Nw7UBL7zsWcQraFwM+PVojIhxZBTk/NwdkORDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625257; c=relaxed/simple;
	bh=oW4WrrQloYzqMgUY4QYvrcjwRb7Mw60Ix2d89Udrn+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bv3rwFsmkYOSOtk+9rCJlSb+3NgGvxAbNBy9YqtiLBZONyXoiVpVNbsj8JinOTdfRhCpFCZmVe5A4zQiGTgVGtOZVzgsFxmHWrBGTWd3Ao+Q5CUex+F/aEIuFQcY/CkjwV6hUv1RY9AnSK00Poo1Qn9Vlo9hfy0xf7j9ojl7KbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVe9d1iw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qaO011421
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ly7+Lf4BHJrMjAm9Lfb1Z2p3t9Jk/PAnGffPfBrIx/Y=; b=HVe9d1iw++Z4b9v7
	BpiBexfZ0qtbbE9eg5sJFsmaVq+oumcPRIJ2q68IDqwfI6wo8ML5j9CutI/lNTO3
	PUzjWbW8nSkeCtH8FE/+BJAIBzmmYwjuOsg34kYDrkYoj9t6yM5p5/KNmbnX+H22
	uh79OBlFb1oNUooaQvKivG+y0kNZpCfqj6ZxNvwgsMckzqiWSYI0eRLmVs6TEe3B
	NBb7x9CS+2XyUkMt4BFr+2sQ89/sApqDaxE2PsOejHxqzNR+WOWo/lnCkzMlflV6
	2EQ/KfPXXfcyXTF3bU5QAMpJ4DSspisoK8AJPyjmw0XwFMPncd3Eyy7hVq6Og3G7
	XoOgqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wc3xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:07:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2872e57so780361785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 03:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625252; x=1745230052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ly7+Lf4BHJrMjAm9Lfb1Z2p3t9Jk/PAnGffPfBrIx/Y=;
        b=folNCUeZUP0Qmu0lLFStT1EMnbJ64X0LvS6u5vEovAMQDt6YNetWI+dr98FCS6Gajb
         CLM/roXP1uLSoqNoS8nXdiRa2fksF2Vq/Mlh5+FtdLsajOjheDSUn2Srzzx+MxKlkEcu
         A0hUj8FdYn9u7dzyY5dNpvbAp5o2ObS6bexJc6d4P/yPWSrGfZv1hzEf6kjfOZ1IjtJW
         b9VrLdgvfwaGe3qk9KGpzgW0+vZV+8NMu2fcjojHku3nBSmLvroGBMx4+f8o6ywkQrHu
         yStFUloChLQ4VBtKys/O95bDiG7+XcvAqnbf0nC9SZGTOMbkFAy8432FUfc/jSiv+5vw
         Ir7w==
X-Forwarded-Encrypted: i=1; AJvYcCXf5LDTHZLFtVszUdmLbylVUUf6oLQVwwVFmPEo+q0Hx8E+KovQ8eBAbZaVHAOZVj0dq/J6GA5PySBglUH7@vger.kernel.org
X-Gm-Message-State: AOJu0YwwiW6sxX6uG8G8AKZ/KfvDwYm/5GCSIm08CepLe6Ev8FH2lwxK
	x6YZn0SCcpVosgQLbug1uXNMTKXpktePE18Y5ZJgQLeY8oxRzylpP15ExIQN+Rd71GCpTmGpMl5
	gR2pmvHu8N8ZXI3Xtpx3+3lCfg5iZFY3g85MuaC1JHwgFgeB3XJs/WziIuRrknLkp
X-Gm-Gg: ASbGncu/6jgzPbr/RXIgAsU1wQwyF+I2p/RkfUhsPX7VesN0kIMNPGV7B9qHWrTigja
	rRNjkRY1kc1YewAnNW0I0nonq6DAglS1ElMYZAAG0XmMlhqzRnKCwbxAynAZvmazaCFUC6fk0yV
	aqMH1sQEe151lF7pYrKPdqj4Fh/+5NyVifJK/hDLnfGN/soNlONjXFLXFDOaTmiMhF+176FfNAf
	NrYmrBKDhn4e5pxKv0rl0i2Sopt4uhLkN7EfpdLz5SZJst1CD8e3luwOEqHJWGsaVtPBc7WdFE6
	JmPvLl91zfrVLNxgQL+KOS8vDk5xO7evVZYXy3+XdVGRaN/xC0/5hKCuWIU01mGoFDuRPgzYYfv
	0bpg7Rg7NGKBAxtPx70F5+bH0kyMpAZegILPyxqxjUyrCueXXVz1QX//aQdyQ
X-Received: by 2002:a05:620a:2983:b0:7c7:a736:b698 with SMTP id af79cd13be357-7c7af113829mr2043021985a.40.1744625252387;
        Mon, 14 Apr 2025 03:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhW/DRW1SX+Ynk28CKsmigZX51jEHaeI2hluFbgc7JLNiukOLlnHIMVtoWmJiDxFw7PgmHqA==
X-Received: by 2002:a05:620a:2983:b0:7c7:a736:b698 with SMTP id af79cd13be357-7c7af113829mr2043015385a.40.1744625251811;
        Mon, 14 Apr 2025 03:07:31 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c3:3f5:b80a:2e22:2f23:20a1? (2001-14bb-c3-3f5-b80a-2e22-2f23-20a1.rev.dnainternet.fi. [2001:14bb:c3:3f5:b80a:2e22:2f23:20a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cc0c3sm16322941fa.37.2025.04.14.03.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:07:30 -0700 (PDT)
Message-ID: <7b876428-6f54-4c40-a234-57443eb97ecb@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 13:07:29 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
 <nxnqwh2mzvnxv5ytwjsyulxr6ct6mhv3z3v6q4ojrjhhclwv2i@55nb56hnwi3y>
 <0f4eca6c-67df-4730-88b3-a277903deabc@quicinc.com>
 <wzqct2y67h6bkazxv3se77slsheaw5rspgcrcfjm7ngr5t4alw@nktpqrt5woky>
 <bb277124-a225-450b-acfe-0acd0f94b263@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <bb277124-a225-450b-acfe-0acd0f94b263@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fcde65 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=VaffO4KUCATw7Byn6EkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RTb7UfheCtW9BfSf3BNjZEwx8it82WVX
X-Proofpoint-GUID: RTb7UfheCtW9BfSf3BNjZEwx8it82WVX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140073

On 14/04/2025 12:56, Ayushi Makhija wrote:
> Hi Dmitry,
> 
> On 4/11/2025 1:31 AM, Dmitry Baryshkov wrote:
>> On Thu, Apr 10, 2025 at 06:37:54PM +0530, Ayushi Makhija wrote:
>>> Hi Dmirity/Konard
>>>
>>> On 4/7/2025 1:42 AM, Dmitry Baryshkov wrote:
>>>> On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
>>>>> Add anx7625 DSI to DP bridge device nodes.
>>>>>
>>>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
>>>>>   1 file changed, 207 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>> index 175f8b1e3b2d..8e784ccf4138 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>> @@ -28,6 +28,13 @@ chosen {
>>>>>   		stdout-path = "serial0:115200n8";
>>>>>   	};
>>>>>   
>>>>> +	vph_pwr: vph-pwr-regulator {
>>>>> +		compatible = "regulator-fixed";
>>>>> +		regulator-name = "vph_pwr";
>>>>> +		regulator-always-on;
>>>>> +		regulator-boot-on;
>>>>> +	};
>>>>> +
>>>>>   	vreg_conn_1p8: vreg_conn_1p8 {
>>>>>   		compatible = "regulator-fixed";
>>>>>   		regulator-name = "vreg_conn_1p8";
>>>>> @@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
>>>>>   			};
>>>>>   		};
>>>>>   	};
>>>>> +
>>>>> +	dp-dsi0-connector {
>>>>> +		compatible = "dp-connector";
>>>>> +		label = "DSI0";
>>>>> +		type = "full-size";
>>>>> +
>>>>> +		port {
>>>>> +			dp_dsi0_connector_in: endpoint {
>>>>> +				remote-endpoint = <&dsi2dp_bridge0_out>;
>>>>> +			};
>>>>> +		};
>>>>> +	};
>>>>> +
>>>>> +	dp-dsi1-connector {
>>>>> +		compatible = "dp-connector";
>>>>> +		label = "DSI1";
>>>>> +		type = "full-size";
>>>>> +
>>>>> +		port {
>>>>> +			dp_dsi1_connector_in: endpoint {
>>>>> +				remote-endpoint = <&dsi2dp_bridge1_out>;
>>>>> +			};
>>>>> +		};
>>>>> +	};
>>>>>   };
>>>>>   
>>>>>   &apps_rsc {
>>>>> @@ -517,9 +548,135 @@ &i2c11 {
>>>>>   
>>>>>   &i2c18 {
>>>>>   	clock-frequency = <400000>;
>>>>> -	pinctrl-0 = <&qup_i2c18_default>;
>>>>> +	pinctrl-0 = <&qup_i2c18_default>,
>>>>> +		    <&io_expander_intr_active>,
>>>>> +		    <&io_expander_reset_active>;
>>>>
>>>> These pinctrl entries should go to the IO expander itself.
>>>>
>>>>>   	pinctrl-names = "default";
>>>>> +
>>>>>   	status = "okay";
>>>>> +
>>>>> +	io_expander: gpio@74 {
>>>>> +		compatible = "ti,tca9539";
>>>>> +		reg = <0x74>;
>>>>> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>>>>> +		gpio-controller;
>>>>> +		#gpio-cells = <2>;
>>>>> +		interrupt-controller;
>>>>> +		#interrupt-cells = <2>;
>>>>> +
>>>>> +		gpio2-hog {
>>>>
>>>> This needs a huuge explanation in the commit message. Otherwise I'd say
>>>> these pins should likely be used by the corresponding anx bridges.
>>>
>>> Thanks, for the review.
>>>
>>> Previously, I was referring to the downstream DT and misunderstood the use of gpio-hog.
>>> After reading the schematic, I realized that gpio2, gpio3, gpio10, and gpio11 are all input pins
>>> to the IO expander TC9539. We have already configured gpio2 and gpio10 as interrupts in the
>>> ANX7625 bridges, so the gpio-hog is not required. It is working without the gpio-hog configuration.
>>
>> Please make sure that there are pinctrl entries for all pins.
>>
> 
> Thanks, for the review.
> 
> While declaring the pinctrl entries inside the io_expander node, I am getting below error while checking the DTBS check against DT-binding.
> 
> Error : /local/mnt/workspace/amakhija/linux_next_11042025/linux/arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: gpio@74: 'dsi0-int-pin-state', 'dsi1-int-pin-state' do not match any of the regexes:
>          '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+' from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#

TCA9539 is a GPIO controller rather than a pinctrl device, so it doesn't 
use pinctrl functions. You don't need to describe properties of the pins 
that it provides. However, it can use some pins on its own (like 
reset-gpios). In such a case corresponding pin should have a pinctrl 
configuration under its pinctrl device.

> 
>          io_expander: gpio@74 {
>                  compatible = "ti,tca9539";
>                  reg = <0x74>;
>                  interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>                  gpio-controller;
>                  #gpio-cells = <2>;
>                  interrupt-controller;
>                  #interrupt-cells = <2>;
> 
>                  pinctrl-0 = <&io_expander_intr_active>,
>                              <&io_expander_reset_active>;
>                  pinctrl-names = "default";
> 
>                  dsi0_int_pin: dsi0-int-pin-state {
>                          pins = "gpio2";
>                          input-enable;
>                          bias-disable;
>                  };
> 
>                  dsi1_int_pin: dsi1-int-pin-state {
>                          pins = "gpio10";
>                          input-enable;
>                          bias-disable;
>                  };
> 
>          };
> 
> I couldn't find any devicetree example of tca9539 which is using pinctrl. The gpio-pca95xx.yaml DT binding does not match with any regex of the patterns properties.
> 
> Thanks,
> Ayushi


-- 
With best wishes
Dmitry

