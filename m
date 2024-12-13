Return-Path: <linux-arm-msm+bounces-42071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF039F106E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83C071698DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE5A1E5018;
	Fri, 13 Dec 2024 15:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWWpQsi3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C42B1E47B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734102462; cv=none; b=NKBYAM4qnErxOM8pTPKONo+zWQQk583SsWSQfsfDHoFap9XyGVh3mYe02hFHjthjvfW5kIzs+DrTWJImsZSZLs8o+rKKo8k0iWsyQB6SXWbwkYMMgSE9F7LkPPqtqaZm0iQtXblNMN79mDatXvdQ/cUaAFyEJkaeOz4VGa5N6pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734102462; c=relaxed/simple;
	bh=EvnLuX3Bx2FDPW/YcM5AL70sefFb9B+4tGXFjH/nUlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jw2b3zz+psxenu5R+TAsFaFg38OCuOBMUepD3N5fN7oI+QwzLvlw8mcqCA+jEZNqPzG9TBv+O89xgms4nMSkclloRWEsc+h+8uMeIpSdPrTrAZsglFMIvar8EvHKx8e4pqhEuGpw+tjjb+sp6iofbBkWs52/gZfIReHutnDefSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWWpQsi3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDBKMra023411
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r2Z8bCSwIkqdnaknQhubkt9rni68kdTquLqBAwLVKs=; b=KWWpQsi3Ipfc0xaY
	9U3GoeVmEa7JXSY0slrLUJlnMQ7diyUWZqPr3vJSOpgylnpiLQKpfYeMOyJ6+cv+
	H43E5TBEPXKiVI3W5AG6+Jtb2c+WhFTnzW70W+Y7nNTXhmKE7f817NIZsRNu9ilk
	Bacjt8jMip7r25D+DzK8hOBSj4Z4hqg37Mby48573pS9n4KI2O3pP63k1kHfJmgz
	WsBfWGQDwHF1cV2mfvJFI0pGDujTk8iw0k7E5Ru6+MsNXudZ2jopFjC5J73FWJxM
	nkyEL5yBbUEn5EV2f3Po5b2j+HeHRIOQ8TTzzuTQDESziA4gdHnU29yZ/SG5Degf
	Bt404A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g6xuthk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:07:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8f77bf546so4728586d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 07:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734102458; x=1734707258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8r2Z8bCSwIkqdnaknQhubkt9rni68kdTquLqBAwLVKs=;
        b=X73m3+1Pti+yOeR+ymnjuQ9WWJOChxYgHve0CDY7OyRAV+VvusAFc+bk9OkJMiwt4N
         AytHPpxzInMA5bpvsBK9VDLUV5rjMIqcqIx9KGX9N5tTtzAPD0taL5cm6OjePedXFdgQ
         uIU4Bh5PZQMpgGYmPCN8MaXuYYSPEjrj4ouX2t2JN3T4ISZEAb71/dOEafAf6zLuwOj9
         gCjeIbc6HeMiVDpri5SNHI2SOAjmN9HQY0WAiXX7gIAGraaf1K7+1gYuYObZwoZzzRIR
         ExgI0wkRclXYYynGP1+wc8zPWsk7GIbtQwSUmDio60WZoCH1yl4eONPhUOePkS0Vtyr+
         O1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWM22EFSaOeMMQFuKPdARsB0rUNZxRtsbP7zHWliZLGgyK8yUbpurwHTq9tONPFUWH81tGQMad5ROcx4YZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwSa/DhznDVMo8CNmRp/hArPXmONAioVpJncjhsFo0dHV549adc
	CrK/8ZZy3e/3vUOZ1QMgWfLnlA/yZ9QjKniVftdI9AVAzoqNXjbEilKOyCHmGyrCTNmXmfIAJmc
	4d1+riokWIHWEzLpoug5NJ/SxC5LQOMeyUkolCvVWLmLijm3wqJNgtj5NvDf33bQU
X-Gm-Gg: ASbGnct0eP7WPnT/5EKZQd3V+AS/aiBZdDWeG05V7kn2GNLXsuaSrYAJdMC2akV8DC/
	HR5uoZVnxrDzI62ABpWcgeHJ10Zag2vVP+XY+1rEsgaj5XQ5jkrl+L6U3iL6ERQuEL4O6l5imxb
	Co4sBCnSTYHVZVcWSib0A8ln66odwWnTe4KQJ8TCVts9X0lnlt250cBPmnObvKtK+q0ZlDIqjSr
	woIjULwoXKNsbScwbBi73+ZpLW59duhKsZYjsHj5slkVkq4Il20Yvgr4zSpz04zU5DsRTPPa4B6
	pOqPJi8sQFPC67ok2fhRgAWV5tv203uMQoDS
X-Received: by 2002:a05:620a:31a1:b0:7b6:d2ca:15b6 with SMTP id af79cd13be357-7b6fbcef0d5mr137555285a.0.1734102458332;
        Fri, 13 Dec 2024 07:07:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvxEOdiM6Kc3kANPOO51vjQHbv5LbxQEL0AKmrLpKK+6Rv6vcqM8Ix+BZy6+K/I6LvS6psrA==
X-Received: by 2002:a05:620a:31a1:b0:7b6:d2ca:15b6 with SMTP id af79cd13be357-7b6fbcef0d5mr137553585a.0.1734102457956;
        Fri, 13 Dec 2024 07:07:37 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260a3832sm1237814966b.166.2024.12.13.07.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 07:07:37 -0800 (PST)
Message-ID: <e28773ef-12a4-4089-9c7b-1be5e5cc7aa5@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 16:07:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, bhelgaas@google.com,
        lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241213134950.234946-1-quic_mmanikan@quicinc.com>
 <20241213134950.234946-5-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213134950.234946-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MRuywbVk0O1rzoe0lRtZQqSymZjST2kM
X-Proofpoint-GUID: MRuywbVk0O1rzoe0lRtZQqSymZjST2kM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=922
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130107

On 13.12.2024 2:49 PM, Manikanta Mylavarapu wrote:
> Enable the PCIe controller and PHY nodes corresponding to RDP466.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---


>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 43 +++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index d4d31026a026..8857b64df1be 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -45,6 +45,26 @@ data-pins {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	pcie2_default_state: pcie2-default-state {
> +		perst-n-pins {
> +			pins = "gpio31";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +			output-low;
> +		};
> +	};

Drop the inner wrapper, in both definitions /\ \/

Konrad

> +
> +	pcie3_default_state: pcie3-default-state {
> +		perst-n-pins {
> +			pins = "gpio34";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +			output-low;
> +		};
> +	};
>  };
>  
>  &uart1 {
> @@ -57,3 +77,26 @@ &xo_board {
>  	clock-frequency = <24000000>;
>  };
>  
> +&pcie2_phy {
> +	status = "okay";
> +};
> +
> +&pcie2 {
> +	pinctrl-0 = <&pcie2_default_state>;
> +	pinctrl-names = "default";
> +
> +	perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&pcie3_phy {
> +	status = "okay";
> +};
> +
> +&pcie3 {
> +	pinctrl-0 = <&pcie3_default_state>;
> +	pinctrl-names = "default";
> +
> +	perst-gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};

