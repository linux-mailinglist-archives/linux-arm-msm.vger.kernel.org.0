Return-Path: <linux-arm-msm+bounces-42859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC46D9F86F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4677216F168
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81BF17B427;
	Thu, 19 Dec 2024 21:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmDxdn66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0691F111A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734643963; cv=none; b=s2FylT8eDyKeLDcnZIlXsmrWNEfBtGFCAma62G6UankUgZZdDN72X+vjJwtJ3zovNr/vaQK48+hYZlz8wS3QmtmuIsOLEnjkHYmftIOUhirY7B7cP72HTree1h6Lyk04rtHbWJH2ynL8L5wA0Hx66VyEi4UwTXcKVi56Wk01qxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734643963; c=relaxed/simple;
	bh=CvPQg2SehXPtMQ7odfp2Axb5Sv2UGsXSYvVUc0Xhgco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mOPo0d8/XXHCv2PLU3Y/0ZhOuH2Uq9fP4AqF/6HZ24SKpfQAMIK7hrRWxOAyhQVqyZrhVDscCifi4nncTilRzQi3+8lILUSRMKUw52rbTELzV3UoZxxXq9p/DANLlrL7grWVwegmc5NtST7+IU6dxuARhJxfgjGC/o7tf0N+5jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmDxdn66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJBk1N2016852
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ENDa67ziS+SSPznKUdTsfN1hFPAlsjZ38yLEsFtRxl8=; b=TmDxdn66JKwWwn2w
	tL7GSdgutvXv1AqHQLJyKJQG34w4nlSO3e0Oc7i828ZGBIyeqRGWAn+vPi/KT1fB
	snoQmka0PFqCH7vVbYEwfiv+eQVxEKOIoomG3DaNg2/acDDAIjoNU73w9WcYSS92
	3jmbeO39Z/ABCPKCwB3P18Ezci4zHSpPToMc9fgTMFVXyCGOGQIrXwk8wlhpeIUC
	PZUYO4MX3dIs26QNdCbUloF6cKF5g/FShlQqpu2ZAnxfE5WPm1kwKXorttb0K0RD
	1gMXlKQNk8gKqMAENJtUXhlvtxNZGVje10AnWkxv0d2F2lf8nQBqHa/jUwv3gInW
	UZuB+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mjw81gmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:32:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-469059f07e2so2875011cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 13:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734643959; x=1735248759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ENDa67ziS+SSPznKUdTsfN1hFPAlsjZ38yLEsFtRxl8=;
        b=Cja4GSVKdE2m1y0WXp237a2WpNxClmFGATUw2k+vNPwzc4TaKjJICFNAliUyM7ZN64
         fr+oTmY8YozRGBS72UM+lXneH2ZvPMQ1OVRGkGwaTGI92luXkx6Pkh2DjHj4WQwagF7t
         Xk/r4leVvFT+S8Sgo42jNYVDEP4YqJhMVFiNKSNIm5mv802EB3hRtQEl0uO/KCU5ty9x
         bS1MK1jxG2apES4ZGkvFO4fGnkUvt/OfBsj8hQe/GYSOiGaS6cHHLZkDb1u+QPVVQhNO
         +gNYyhg6fMRA/f0Tg40pwWYu84kEhF6aLZPmEgYmzdG/aCpyZiwq+srIbz/sHuF3DbCn
         0cXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyRYEXeHmGSUWmRaIO4wJkngP/VY9zEbzdS/w5pyCzEnV3DAhdp9a7Th8yZhFs9Wkw9QAWaalGdW1uQep2@vger.kernel.org
X-Gm-Message-State: AOJu0YwFyCwCGl8jeRg1lAGDJGLRK5IpMLx66W86MvndewtJ+7qDjYx0
	N9w1T2+gjXKkCFoZXWmfkoZS+445XXH7w5SQE+w5xBXTqqRp4kMJ5+1Bb7EWpd90bj39gNPUOHx
	vpeaVz8ahZJ8ez3tQlSCvI9k27kjQBfQkThPoEBr4pR/hdLWbk+5Kd0lgKjn/N82/
X-Gm-Gg: ASbGncsL0Op4dPceW2tMX9KyJoepsgMD7MwsJUK6fUPVrbDuyySFksD7xH9GP8rqZmV
	LhRfypxLingMLqbJCZoodabEvYPKlMlG9hBzpwF/PPhDmnXCjbY0VGIlZ2t25Ya/xn789Ej7cqP
	CuScHAYaLjXc18NdWsExJhy/hK9DVmDY+oGUhPFm8Qu12JcGhXCXxm6jSJXXBO+C4yoV7jflL/g
	QYD8g+V9il7Cv7AMdQhB7F3yqP4w34bxS+VPZEZMi+WOLoddjKn6YLsagzqgL8p6O9LYS2jOEq8
	nXOjVfHTYy02n24A7TwYSwl+DqolfQh+hRE=
X-Received: by 2002:a05:622a:1794:b0:467:5715:25c8 with SMTP id d75a77b69052e-46a4a8b81a9mr4279641cf.1.1734643958952;
        Thu, 19 Dec 2024 13:32:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL7kIua1ME/KQ6yQ6AkFeUfGEOYYj5b7vNMMfXbL3E/2Y15gg3BULYhJ5K9xraAyOzcK8vUg==
X-Received: by 2002:a05:622a:1794:b0:467:5715:25c8 with SMTP id d75a77b69052e-46a4a8b81a9mr4279411cf.1.1734643958545;
        Thu, 19 Dec 2024 13:32:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm104401766b.183.2024.12.19.13.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 13:32:38 -0800 (PST)
Message-ID: <366e9b11-d253-4907-9cd2-3781a127b79d@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 22:32:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: ipq5332: Add PCIe related nodes
To: Varadarajan Narayanan <quic_varada@quicinc.com>, bhelgaas@google.com,
        lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, p.zabel@pengutronix.de,
        quic_nsekar@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_srichara@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: Praveenkumar I <quic_ipkumar@quicinc.com>
References: <20241217100359.4017214-1-quic_varada@quicinc.com>
 <20241217100359.4017214-5-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217100359.4017214-5-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yCD1kKZw8UhTyCzhXQAGrRGN_BfCDAM4
X-Proofpoint-ORIG-GUID: yCD1kKZw8UhTyCzhXQAGrRGN_BfCDAM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=955
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190171

On 17.12.2024 11:03 AM, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add phy and controller nodes for pcie0_x1 and pcie1_x2.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v3: Fix compatible string for phy nodes
>     Use ipq9574 as backup compatible instead of new compatible for ipq5332
>     Fix mixed case hex addresses
>     Add "mhi" space
>     Removed unnecessary comments and stray blank lines
> 
> v2: Fix nodes' location per address
> ---
> 
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 212 +++++++++++++++++++++++++-
>  1 file changed, 210 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index d3c3e215a15c..add5d50b5fb0 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -186,6 +186,46 @@ rng: rng@e3000 {
>  			clock-names = "core";
>  		};
>  
> +		pcie0_phy: phy@4b0000{

Please add a space before '{'

[...]

> +		pcie0: pcie@20000000 {
> +			compatible = "qcom,pcie-ipq9574";
> +			reg = <0x00080000 0x3000>,
> +			      <0x20000000 0xf1d>,
> +			      <0x20000f20 0xa8>,
> +			      <0x20001000 0x1000>,
> +			      <0x20100000 0x1000>,
> +			      <0x00083000 0x1000>;
> +			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";

Please turn this into a vertical list (both controllers)

> +			device_type = "pci";
> +			linux,pci-domain = <0>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <1>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			ranges = <0x01000000 0 0x20200000 0x20200000 0 0x00100000>,
> +				 <0x02000000 0 0x20300000 0x20300000 0 0x0fd00000>;
> +
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7";
> +

[...]

> +			msi-map = <0x0 &v2m0 0x0 0xffd>;

And move msi-map a line above interrupts (like in x1e80100.dtsi)
plus keep a new line between the last property and status

The rest looks good!

Konrad

