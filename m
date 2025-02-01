Return-Path: <linux-arm-msm+bounces-46639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3255A249B4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 16:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 968D63A5285
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 15:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C849F1BEF85;
	Sat,  1 Feb 2025 15:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOBxPVV2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13C01EF01
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738423156; cv=none; b=SVIZaRFAPgnutbYUyJ7AVm68kUqVUyBfjc3AfE9+kRRas3tafaPYoNwPCIpSybEfADPrEvM0e91boLl/6bcseQCpI50EYHVINfV3djIsMdlGyDX1tEAdqC/F0hZnRIOa8hgDqV1S65EbzrSg/IsekadxVln5wCHhAjg1TZHkF4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738423156; c=relaxed/simple;
	bh=uDCm6Gpac1lAAIu3wdroHBl+yKA/YJHrZA4CQfVHavE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxFb0Q4NQHFuDjrjWEZR8ohE+J8Oysm7+qXPAOI3WSV8hr8dw65tNa9IaS7Rok2HdJX2HAWsczEM5eqiBTLVapKUfEF7QeXbNeygxdVX/6Nydp646fJKAUiB6sHsE8YjyoRrJizFC6CGRhImGkSiXgDgAGUitNBtfDJeMuSlxzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOBxPVV2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5115CZ22003351
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Feb 2025 15:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PEQTSww2aXNU2AjLtELdUKXpPVwSbLpAhvxWBmCLBBg=; b=kOBxPVV28v2DSbdh
	qPqUCBqa86UMCgYg+cjH8QlRBazubfgfOFVHJZvta8shOaecwWcU3g9g2OpAQ9FZ
	BcBOb6vnoLRq0HRfmcxrXKM63AP/aZuAZTn/j/I3r9RTnxvUk8Vq8Zi8fo1K13M9
	Dt9kceO/PD1omGfIhvaB0gTAp5+yPGsLTzWq5rkmvMu09lvFPx83mMBxDO7z5gF3
	kITAJZG/CArRaF9D4507Dz8QrJw1V/TUSrRj4m5eiCTkiNJdMm/8/gSlovOHTLx+
	tIQSFmaebAOI2+3Pibn3ZXdqgW3EsSoUghvHqFCS7UIPRa2boTY9jhSTBf+Q9gZL
	uxT0pQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd8r92cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 15:19:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6e5c3a933so51970885a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 07:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738423146; x=1739027946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEQTSww2aXNU2AjLtELdUKXpPVwSbLpAhvxWBmCLBBg=;
        b=LPySreyUXHpcb5aqVwLsKCqaUBeaIzoKk/T80JkAtD50jqunnuABEHfLTb/mmOjJx5
         1B2iJpCEWakNDwrAGkYAjuP+i768H/Kkxhyqss7DdMAL3U9wfF+Dmby20U7HFv+9xWwA
         Fwz8tnt24KvYM/sFO3ZRhQHxQNoXALaHZkNi7HjhbQnJGSP5/EazODSCKvlBMEYaX3Al
         cpWdqttTHONYlNfQh2lVGezjm3a/BNoVlL3EtES2gj6rLkzjIMKLWlwrInxbwS/G7zSv
         9IxmqkLfVbeEFYvSD3/YAAQJJaTXIT+JymUNiCiaSZUv7bXmJlR8cm6N7cXVg+LldCR1
         Eisg==
X-Forwarded-Encrypted: i=1; AJvYcCWvfSQPKb41AzTaEIQcp131PoCQiNFTaoJQROOQfLHypCIKkjUXQlNDBIg9vtICMzoARr9AVtVjEdOdx56L@vger.kernel.org
X-Gm-Message-State: AOJu0YzdUNnOpl6f6iBGW+YAj3kkAu414GnIAzEE1L/mgBQdz7EjtNVK
	QQn6X58tcOFSEH3kgsC3+JcDdlQl+BUq7DZdS+N+NvpkvbFIPzwZqwQ49IId2n8elo5xbZM3tOv
	iHasLCgXZiU+H2bA025e4q6VmnzfGXPGFmMxy0Tjnf0VaqOwaWjjX2N5yJv1u8bBd
X-Gm-Gg: ASbGncsehO7yXmvyG+FbE73PFRQ5CQm5ZUEDPvEp1hypbc4K0GdCkpatJhnHQRSAmBR
	34/fnUq0DF0B2BBqXky5ksf4+GwFkGISoav3I72TXnkQy6Kl//tDIPk0G1aHWRztCl7ThCQi+3e
	Y2RGqJ677ZLv9bD1cgDxhBZrHlbtfyw46vW1/HW5fn+bvvDgTzDrgmf5C4c12aFIjQuG9neFvds
	gztwrUWdxliPErtEljMLgh9b5BeOk2/nIxi8baiEt5IDOVpsMUg7Thq0FwABhuAKdkGBIsq0ZsU
	JexG0hmpO+nr58R7cjjKIr9iNLR/OS/HML3B4vEzYu7bxRizCN71OfR6fv0=
X-Received: by 2002:a05:620a:2adf:b0:7bf:ff64:3370 with SMTP id af79cd13be357-7bfff64352dmr575821085a.15.1738423145701;
        Sat, 01 Feb 2025 07:19:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOXhYLp+IidxtotJdXrWGpPFoUNa342Y0Jz9qWiUBMSPcNnWKDVyH/4q2qfJ/OsTgC5Q+7ug==
X-Received: by 2002:a05:620a:2adf:b0:7bf:ff64:3370 with SMTP id af79cd13be357-7bfff64352dmr575819085a.15.1738423145317;
        Sat, 01 Feb 2025 07:19:05 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a59855sm452028766b.180.2025.02.01.07.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:19:04 -0800 (PST)
Message-ID: <55195890-b7d2-4df8-b8c5-fa2768e90094@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 16:19:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm2290: add UART3 device
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
 <20250201-rb1-bt-v1-3-ae896c4923d8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250201-rb1-bt-v1-3-ae896c4923d8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EdOhYO-L3R3sjonTOXQ7c0lzQwXffZ1e
X-Proofpoint-ORIG-GUID: EdOhYO-L3R3sjonTOXQ7c0lzQwXffZ1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502010133

On 1.02.2025 10:18 AM, Dmitry Baryshkov wrote:
> On QCM2290-based devices the SE3 is used for the Bluetooth chips. Add
> corresponding device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index f0746123e594d5ce5cc314c956eaca11556a9211..5f92eb16482a0ea5f8436cfa7e55849f171ebd24 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -1239,6 +1239,21 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  				status = "disabled";
>  			};
>  
> +			uart3: serial@4a8c000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0x0 0x04a8c000 0x0 0x4000>;
> +				interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
> +				clock-names = "se";
> +				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
> +						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
> +						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
> +						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;

This path doesn't look quite right.. there'MASTER_APPSS_PROC is only
on one of these.

+ RPM_ACTIVE_TAG

Konrad

