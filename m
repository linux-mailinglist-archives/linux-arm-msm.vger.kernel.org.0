Return-Path: <linux-arm-msm+bounces-78612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074D3C01D99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 16:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D0853B3AE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010C732C33E;
	Thu, 23 Oct 2025 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjibQu7S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472912D0611
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761230025; cv=none; b=cLktDl+QWGPEgnGhG5kd4aT+g2Wxh3qzc76EhtO2YJznFVBIIt6btaS1WkycOM/94vxhBx5g6oAXL+Z9God6wRrIOIDL+jqCoaVlN4WBQy+qrd+eEacDArANgQQnkyKL+6/FOJSa4LrM812XN+DXz0fA3P2V0sSeJ4s1akiZ/Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761230025; c=relaxed/simple;
	bh=a9zQnr1U/qDAlP9ZQNBclzAJC9hezB8uCMOARh7yL1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+g68fCXG6QrhxiBLs9OqwZ1Gt8TUwGqKbCg4c7thG2xHOzwrqLDO1faCCHA1pVlSNQBnuLn0nIY9BghfcTvjlmm+IxfsOEopaNZ/VWt49/yJwt7MzHL/amEk6sakXnWLwYjt0ZCrdpxNRivVKQ+zojnZ4lLYwvd5U5Pv/eXtTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjibQu7S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7GpS1018571
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAZU2ni0iRL+hjBDIOqvgHG1OUScWl3zzw0/P027wq8=; b=MjibQu7SnOSqIJhw
	b2KRd7Y/1MVog5z09DjhnaEUP8Zj+3a9EBrBBfI1WLetNT+RTz/5fwuKOnoHbM9a
	mlagnuAjHVmaQBCEcD73IfjUzRYgvdPzdgwRhHbjMu9mq47ywGlU6ra3+ATPKY51
	RUZWEgcakb3B6K5Tw7A7kPt/P8t69jRN8BoKAk21U2VMK3e5n0rmPhFcAhCIyEM/
	tolbQXq+ACPidfvCylBKLD2E2MnQM4cxtoaGd09BgFFNf3Tzph4BnXnyX171ejyx
	49r+mHn1HldIhpMki8tXJM/JP0JIToEeUIOy2vG/1OKB3dpQZWlTcTP6GWnH0HMp
	n18Onw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08prykg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:33:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e892b1c102so3358281cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230022; x=1761834822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAZU2ni0iRL+hjBDIOqvgHG1OUScWl3zzw0/P027wq8=;
        b=V3bc5XgmLU8XYA5DX2YN7CN4GeTOtL5ZCI0oeCpyKmwD5Nc5ZgKb20V8JDXbbpC3fA
         k2bxosH+FOYNss8pW/xPELtatxlnoUWOI9VjiD1uqaCqwFhrn8O6HsRwafBMalTsvFr6
         MkxElygD+jVx8wr/7lY4RX2O2cLCBCBHL44V0a6QqcE9e7G4Vm6a99W73R4c8zn/6NjP
         0kWO0xKjrticqnZ6WQyabYfa+4eTlFYHykobZyFOMlpKzrZXsqX+NRZcQl1q4eLQkbeC
         QVaihqLNyORHzx2ZtWoE0rvxIqBFW9uXnQiSLUbKbbvtGbSU+i6WMiJck67AWWeRnkaA
         wkUg==
X-Forwarded-Encrypted: i=1; AJvYcCWJirAL1ed0Rn9QEhahp4T8d130e08BJvM1xWdJgmvhkomPRAHI7UfbYdoK8kKY1EOOWsu4qeaR/9R4M4eM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiq44i1K0ZMNcw3sD95uCKd1gSX8Z9B7ehQD/G5fKt3/duSpuJ
	oUkWQH6wXeFeIEXF1+Yf3K464aPjy/nDYYV1rd72Vbnsd22jrk3OKPmZ3XjvftD3vYTdCkj1zSe
	dWQu84C6PWrypOH8xzlvb+eQ9aYoxyU3yDfX+KgehOEF1fy90lc2HCpGMS5lc3fV67qRT
X-Gm-Gg: ASbGnct/Nn9TxqK1ikaSQ9fT0Jk7f2qVDvLcEpUf92ccADc5BvlKHsbSBnfNlOgPcBw
	APvSImYEGd5nQw4rUuIo6AdfLkdF8H1b06gZcKOa82XoKfqNplBkTWgmiKqZQAx7JdeCrImDX/s
	QcCUdHAjKO94oRQIUy9/cZic+l/8rTBLAAuUg0ZPMjkncawMBUxbAjgQh3aav0HDV28kYBHsvXs
	OG5+qDdg49a8K5sEWooxv5vAZFrFPdB6MwZ2BNpp4iFPmuLCk0FCdQZzknMcVNV3lNUMCFO2L7p
	FgyJyvVdooVSFUtLoV55T3Wup3FpU3w1aaEmD3sS8LCyauD53AsVgjxDvRjymLIox5qd0JxCpqG
	q5jd3lrI5qm/+8XRhc7thBcyDw0CHJD0fZzK4CO1LNuVDMKkZc7TiOxKd
X-Received: by 2002:a05:622a:8c03:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4e8a54dcd9fmr169633791cf.4.1761230022394;
        Thu, 23 Oct 2025 07:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJNFwNiX8mrBllU30A59G91vBsOifSuLRksl6K7fNrpM1xj2wDRVEAhFx96cud4Ytjso9xZQ==
X-Received: by 2002:a05:622a:8c03:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4e8a54dcd9fmr169633411cf.4.1761230021946;
        Thu, 23 Oct 2025 07:33:41 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb3743sm1848497a12.7.2025.10.23.07.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 07:33:41 -0700 (PDT)
Message-ID: <cb166706-af7d-40e7-84d5-57c028755cdf@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 16:33:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add gpio regulator for cpu
 power supply
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
        kathiravan.thirumoorthy@oss.qualcomm.com
References: <20251023040224.1485946-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023040224.1485946-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfXye5zSBvoXuwB
 XmM5fE7MdWYEESc8WabVsHAL/73nB/yWhneEGAas1+Sf5W1qAvS20bBJqoMgl0gKlAsy0lfhiQv
 bdFCbfyAipzSKB7McZcPeiSmQ43bW+UOT2ibZZvtZHwMZt8E4g7luIJaLbjBOVr2TL+9qW+kTPV
 HEkl/GcyDWxYad3ynv4QbZGbqxgXeU//c79n2lkFjOpE0Vs1vXr0U2HbhUgO5okXdIUbJGn02DO
 nmZ+sUVTyCX0m6ljqiZQQ9UnbgPRcmNpypd5m841IhyHxmZUxiYighhJA0t+lWQ8DWC6SvTVj4B
 cMaedtupQ8vCKM8j2TOwpM3xiJ/p5WXMXoiromoA8ucrxswrJ61zbYdzcgzJoIAK6APz9sXVv5i
 SLX6T/6LTP2xrgdddxPlMX/8BTMk1Q==
X-Proofpoint-GUID: sxF8FFJU5NBKL9mvqOBIozfv-BNFxyGa
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fa3cc7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=J-FVny67hWSXZtLCYe8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sxF8FFJU5NBKL9mvqOBIozfv-BNFxyGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On 10/23/25 6:02 AM, Manikanta Mylavarapu wrote:
> Add a GPIO-controlled regulator node for the CPU rail on the
> IPQ5424 RDP466 platform. This regulator supports two voltage
> levels 850mV and 1000mV.
> 
> Update CPU nodes to reference the regulator via the `cpu-supply`
> property, and add the required pinctrl configuration for GPIO17.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 24 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  4 ++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index 738618551203..6d14eb2fe821 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -46,6 +46,23 @@ led-0 {
>  		};
>  	};
>  
> +	vreg_apc: regulator-vreg-apc {
> +		compatible = "regulator-gpio";
> +		regulator-name = "vreg_apc";
> +		regulator-min-microvolt = <850000>;
> +		regulator-max-microvolt = <1000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-ramp-delay = <250>;
> +
> +		gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
> +		gpios-states = <1>;
> +		states = <850000 0>, <1000000 1>;

Atop Dmitry's comment, please make the states entries 1 a line

Konrad

