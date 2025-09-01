Return-Path: <linux-arm-msm+bounces-71368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65416B3DBA8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 10:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE2703B8EEB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 08:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01E025FA0E;
	Mon,  1 Sep 2025 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f71gxjXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC03255F22
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 08:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756713648; cv=none; b=qrKqAWDORaLmjZPh1QzaZHmZyyCsngAMqMZGcJp4ZZYSYOsme92YW5BcxYjcuEJUBAFa4vQeE4uU8XuOqsfWvAQNiUHoa9CDhCoTvdazOmpMHkzlLY1XlglvSz7YKEtFxRyMLcclCiAUFfc7dBSP7Czv/leyG9flD+4iF4jvf98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756713648; c=relaxed/simple;
	bh=WV0jKWlHfFl8DVLyZj//3pe4rq8eo4E4hj4SKoTm4i4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vGV5E9VzEdFcr8AaPImKTYN4/+adI2d1k606AYNQu9JbmhcFtBytMtn/7hwejszh3gHwg1E48W7NpQJQ0FraQzN4XPnP7dFo1dRBCqRUThlSUDyODfYGmc25VeH1OMKfoVe02Lx0i0d+JZiR2gz6KXqU2KDhzsf1Jbh4uFT5Iuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f71gxjXC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58180L8s001640
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 08:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYaRk7MoHtD3LVVRYkOuF+SpuJ/lbz4krp9ArV0SG+w=; b=f71gxjXCpYOC0MXa
	RisNz17lf4Qkivuu/0H8dSDowTewnbwkrrL0nbIZsAmtNBJmH8l3lKnFfWJGVL3s
	8tGdQN0d92DXiX1nDVJV12SEnRX38Dk8Idyu9mjOwj8TjJRs5ssKRwIJ1TTTOsr2
	5HhJibYB3in5faAyT76sVtpfTEyybRctMeEthSAaDb16MPuOBI0+ewA9HK+u4kug
	J6+e2tz0uYok8bRTk+Fb0CSba6k+UcL0hnKYXtU6aIfwsRGB7JnfOIVQMOSRc+i+
	WQeyhAitOdyuJk3fxKqcXTnBFFoXLL8wn3RDbeFlhdhgPgDFV3hJRIgHy7dpXHuf
	ubEWpQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ruy8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 08:00:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329c76f70cbso68904a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 01:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756713644; x=1757318444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYaRk7MoHtD3LVVRYkOuF+SpuJ/lbz4krp9ArV0SG+w=;
        b=Vl8Noxi+6t5GCMHYRMKBgS/7EjaVmEGS5F1xk0UudVJALMFWtRf5w2j8c995UROGLa
         /LHWSLZlS3fcBVa8Qa3+BHK6oWainmpfkAxaaIGbN5JZdfpRusjzBLkn1I0vK5sEjQsJ
         4rdR3m3UJcoenjslzva+fGqkhoRXnm20tEAq6ST3nwRNj52v32Hv28Uy0kLN4YDZhyGN
         fCv+LpbngKV2trfLoYhv5g2hcuq/7J/np0nxuN65oNuNmpcXNDWtx6AND81e3TjEejDG
         4zsMfJzDoU36Lp3Pr3bRIOD6b5yOdRbO3eRs3kBj3oY/P0yog4i4XJVVRY13f0yo9RfC
         yr4w==
X-Forwarded-Encrypted: i=1; AJvYcCWkFTYCuo5DxIXRDJHaoaGRqvXt7GxpayS2QfaqIWrJaFv/W/T8RLd5jE77b5Lr082c0GjA+W/EvjYO7r88@vger.kernel.org
X-Gm-Message-State: AOJu0YwG+BOekBg66l3IFdLTk+ZvwFCjY60hW6qZh0TbLo5WEQluthOt
	gNf6YiR5rldAuxSJIox2Wznp6Pa66KPnt7mNdrVTtM4ga2qd+aYtiuZIqCsPJ9nj2hLSVh+neMk
	40PAyLpXE7oHXZziozotBpROwOojMmq/h9mPZO9fPgjrS8DEnT0pUDkC0yhj0I9SIoUwh
X-Gm-Gg: ASbGncvTZDvrxg9GOiYqzCil4HnQxqCmtXfLA7ijtpeQafhgqMnWH81kRx5m5QCKLXp
	lH1CL2QgDoRUfkwi4SQvaF8B7BF+5xx/oU9lLKBk9slm1/3uAPpm57aX9SAKXlSyB7bhDlC7wYw
	gRiZuzzH1NtQplJ83wRDtMEuv77qpdTppxCLNmLLHbUpiNu6t5eTTnhhySFjkg2NlNrunGSRmKr
	1R1l70k5Nym4EVnPHXYd+MSt1BT7h6WCOx10ftImbX2NGHfinu5Vv3V4znTjshpUFn/Gz4hsWfZ
	p06pY+aR3k0FPC2oPFIds/flZZvr8EC9bTJ0b5exUArffRURDz2GqKNKdgm5X8AdZ3TP4CwCpzt
	h6vCahUvhHUvS8+TkUU1c+IKeqXsUSTep
X-Received: by 2002:a05:6a21:6daa:b0:243:95c4:e681 with SMTP id adf61e73a8af0-243d6dd5ab3mr10192540637.2.1756713644087;
        Mon, 01 Sep 2025 01:00:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5BErEL9P03p2C8xYTsnkLZIGbazwvxs3FLkuBdUYZU1o01hwahxzEjYjIG04iZH2UqHajoQ==
X-Received: by 2002:a05:6a21:6daa:b0:243:95c4:e681 with SMTP id adf61e73a8af0-243d6dd5ab3mr10192490637.2.1756713643609;
        Mon, 01 Sep 2025 01:00:43 -0700 (PDT)
Received: from [10.133.33.23] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006ef70sm8770327a12.7.2025.09.01.01.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:00:42 -0700 (PDT)
Message-ID: <2de9fa44-0d77-4631-9d09-32c48a93a7f6@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 16:00:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250828-hamoa_initial-v8-0-c9d173072a5c@oss.qualcomm.com>
 <20250828-hamoa_initial-v8-3-c9d173072a5c@oss.qualcomm.com>
 <qgirqibqvsld7n2ac4cvuvtqknhqkq535jkxnxjjqvss5wpm36@i3mbp7qgqxju>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <qgirqibqvsld7n2ac4cvuvtqknhqkq535jkxnxjjqvss5wpm36@i3mbp7qgqxju>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX+HgTNG2Zj3QU
 hwz1ZOC3ttVe5qNQNlbFIgxeX/KsD64Irzw6sMywB268re1xhIPlBFvYDsLfw123MYaDdcLEy8Q
 kjE7dacG4v0Yg4Mqa/Sx8u7HIVuhEJ0GtBea9O/1F90qvz0GSHn3RcvdfkGl/QNQptr28o3+1A4
 RzZE2MSOd4d5xkP0qqB1/kIQIou26qQXEZmr0eg7qn6y6+bVARV1Z+MT9m4zr1DlgxhKQEip/lA
 7Ytgtzz/yBp4TwLi2umTr+IMBB5Mq+8BsQenxwI6MMY9x/PADvNAUa/uBfH2Z0rT7bNEsl21E8V
 Z/b3L7lIgzxsZ7eb7MqzPcCcG/ATH/TTJnoLZBo/yHbFj5iZGGhJvJFU0Vvz4Hnym/L78iSpdjs
 GDS72THz
X-Proofpoint-GUID: Me6l5seNzUCmzi4NsHgyf0Vd12-euB1i
X-Proofpoint-ORIG-GUID: Me6l5seNzUCmzi4NsHgyf0Vd12-euB1i
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b552ad cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=sn0vIxX-2wHjl4zpZ4MA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019



On 2025-08-28 19:18, Dmitry Baryshkov wrote:
> On Thu, Aug 28, 2025 at 12:48:47PM +0800, Yijie Yang wrote:
>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> This change enables the following peripherals on the carrier board:
>> - UART
>> - On-board regulators
>> - USB Type-C mux
>> - Pinctrl
>> - Embedded USB (EUSB) repeaters
>> - NVMe
>> - pmic-glink
>> - USB DisplayPorts
>> - Bluetooth
>> - Graphic
>> - Audio
>>
>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
>> <quic_shuaz@quicinc.com>, and Yongxing Mou (USB DisplayPorts)
>> <quic_yongmou@quicinc.com>.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1247 ++++++++++++++++++++++++++++
>>   2 files changed, 1248 insertions(+)
>>
>> +
>> +	wcd938x: audio-codec {
>> +		compatible = "qcom,wcd9385-codec";
>> +
>> +		pinctrl-0 = <&wcd_default>;
>> +		pinctrl-names = "default";
>> +
>> +		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
>> +
>> +		qcom,micbias1-microvolt = <1800000>;
>> +		qcom,micbias2-microvolt = <1800000>;
>> +		qcom,micbias3-microvolt = <1800000>;
>> +		qcom,micbias4-microvolt = <1800000>;
>> +		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000
>> +		500000 500000 500000 500000>;
> 
> Other platforms use a single line here. If you don't want to do it,
> align data to start from the same column rather than restarting from the
> column 1.

I will update it to a single line.

> 
>> +		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
>> +		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
>> +		qcom,rx-device = <&wcd_rx>;
>> +		qcom,tx-device = <&wcd_tx>;
>> +
>> +		vdd-buck-supply = <&vreg_l15b_1p8>;
>> +		vdd-rxtx-supply = <&vreg_l15b_1p8>;
>> +		vdd-io-supply = <&vreg_l15b_1p8>;
>> +		vdd-mic-bias-supply = <&vreg_bob1>;
>> +
>> +		#sound-dai-cells = <1>;
>> +	};
>> +
>> +	wcn7850-pmu {
>> +		compatible = "qcom,wcn7850-pmu";
>> +
>> +		vdd-supply = <&vreg_wcn_0p95>;
>> +		vddio-supply = <&vreg_l15b_1p8>;
>> +		vddaon-supply = <&vreg_wcn_0p95>;
>> +		vdddig-supply = <&vreg_wcn_0p95>;
>> +		vddrfa1p2-supply = <&vreg_wcn_1p9>;
>> +		vddrfa1p8-supply = <&vreg_wcn_1p9>;
>> +
>> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> 
> Okay, so how is WiFi controlled? Is there a GPIO? The DT should be
> describing the hardware, not the UEFI behaviour.
> 
>> +
>> +		pinctrl-0 = <&wcn_bt_en>;
>> +		pinctrl-names = "default";
>> +
> 

-- 
Best Regards,
Yijie


