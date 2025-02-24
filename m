Return-Path: <linux-arm-msm+bounces-49200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF62A42DFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 21:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEA697A2E32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 20:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E572566C5;
	Mon, 24 Feb 2025 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKBHwo0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EAC2441B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 20:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740429389; cv=none; b=USs0bYUDjv9k+DYagz8rxFCx1xc6wBYmj9RD2z5Mf6xTG9GsK74imrk3mwQnN0/fGDqKNBThk8Fy4OZS6lI1t0pZEiI2HxvvZGE1BZOLoHvVpuA2wS/biAkKtyKnqPoc/FqDeWACgP3GL0Abc/hc+X7Vz7wvaOW2+dgoTl55RWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740429389; c=relaxed/simple;
	bh=HPkSLGJBYmFJA9mJQQkNICigpu0LI4oAarzVYt68ync=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=X0WZ20epkOVJ6QfNrZXsnDUOqSE74iXAHead2/cI6yNjMVUN0WUlNiWUOta6iPpq1plUxuATFAESiB1ne3P7UzB0J/aRqQ6hZ/imDxOTC40VwlxqgUQZHFt9FqKZExD8J3USbgKhayZ5L0jqT+Q0l1+Pf2tpuJMs18OHQlCEO7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKBHwo0J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OKOJ2W013308
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 20:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tOgVvKsxWwEOF1c3ZSQHJJ3JdotIQtb1ZA1EsX7Z3s=; b=bKBHwo0JCv5k9xdU
	jpyA8hLiZ3FPNNG7U+04ow1LbPkBCz/tKkWGYC6sfxOUA0J2FN4BMfU3+9bIYM+W
	sjmkazAXGQFdQB9ZUqeU1qg9HJl5sV+RnIA/hAl9UF4IKDySYNInitzi8v4n+FSs
	nvDBZfoWs1IkKs/CDJ8C9xX2VMHft4LvboNmCYz8UjE5PPq9rUefde5+fngl4Dr1
	+vdAQbHtjWVnW02UdrX5Ks3rwxkiMDk+oL/phcRHOVZcZ7HzIiFxtfFNGazg5t2n
	LP/69W5mecGjuMp3rMCrxg6aUQwg3Tld/QnjB7DO8YJowEuats0/DoQ0hGP//lqS
	+g88Fw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wgphr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 20:36:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-471f4687399so10585811cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 12:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740429384; x=1741034184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4tOgVvKsxWwEOF1c3ZSQHJJ3JdotIQtb1ZA1EsX7Z3s=;
        b=jNaih9o8IX1C4Knp558jixjqtnAuDVfE07PRMkSsJu99860J78PZ/usCUP2nQ9m4CH
         CbbaoTxjrjnDbZlbWi2SCwtAWFkGL5CHWL6kKU4L8o2gr3jhvWGi2hsj3LtkQ5LIUYrE
         QS8Gsjkzx49OD7LwrWX4VTqXrqJOJotjTdGr06eDIZnc6ifpLQFI8XjaFsSVWP1kh3Lc
         E8gaji3DvhhIX9DfcSVcGR9Wai6QNdD/9ubK5qCPs83m2CBGn668QbEGa9yn0mUUbIG5
         K9oGm72a5aWXzswaeviJbmMQOOV3jesKexe2AEOsaY+QEW4b8ZOqQy3u7pDiEdxR0xIp
         W0KA==
X-Forwarded-Encrypted: i=1; AJvYcCXKjFiV+edEYtdvn7YER//T7o7vSZRe3LfnwrxKmJVNS3HpYoNIUPx9Y8dJAGEr+hq5TzG5N1TMUlwmzzaf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf+wUNeA3DE8kx2Mex+2cRDR5B2F8N/R2NqFvSWCtR/USMvg3c
	I1fjsP0SfWlZ0pAnkrCrmNFi4IeeyFRTjs0uw9pSvvZ/vU0CHvDmd1/m7gRYPBsLI9fzKdnKG+4
	GFH7nJ/jwdoMi4dJW6VXAVtzPC2W4aNWHhiXciHEGerX2Q7KvBTHrWfSdN1KCXFWB
X-Gm-Gg: ASbGncuBJbFJ4VIOGEoBw9QL56ff9UU0ngOUYocOGfBk6kEg4NFyMMmq7FgxXd3M4Gu
	wd/u4JvnWm4+S2nrhSnvyiUUaGvUxVpkdJ4oJNARYEeXsG9a/Qx9ZpyosEZUlnVT9GXSjs0nu2F
	fmOxdDEZRcLPQFhhKVQTql88RiVNKtfCNcy28jL+w6+ZC30Y3gAWDVNkr4MlmP5c3VAx0fWuCzR
	IH12Z3xH2OxFnb1IYAA3hxD3Y5fXmeycSKcPvXcNgfMGfE7tLIs9BSWIz40arkoIWgZzbhfNxxm
	sf2RlipSMUwxnvmiZi4YU1nE6UsKUdUbjWz0oCRwY/xrfjIagSGy2STxtUXQqJppt1tXww==
X-Received: by 2002:a05:6214:300e:b0:6e1:8300:54dd with SMTP id 6a1803df08f44-6e6ae7f3e05mr73462536d6.3.1740429383205;
        Mon, 24 Feb 2025 12:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsC1gRy/skFV1LRBlwOrK8U0hR8g3pgyqbqXMuy5mkyw16Vqh1ciJdH7RJP6yUYcsCpJE3fg==
X-Received: by 2002:a05:6214:300e:b0:6e1:8300:54dd with SMTP id 6a1803df08f44-6e6ae7f3e05mr73462386d6.3.1740429382861;
        Mon, 24 Feb 2025 12:36:22 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e462d92521sm113894a12.81.2025.02.24.12.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 12:36:21 -0800 (PST)
Message-ID: <6980c805-92b8-4011-af94-a701a8218548@oss.qualcomm.com>
Date: Mon, 24 Feb 2025 21:36:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: dts: qcom: ipq9574: Add SPI nand support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250224113742.2829545-1-quic_mdalam@quicinc.com>
 <20250224113742.2829545-2-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250224113742.2829545-2-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hUyzA8kYpxpCS_jCnrZDthNzCCEHVdv_
X-Proofpoint-ORIG-GUID: hUyzA8kYpxpCS_jCnrZDthNzCCEHVdv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_10,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=894 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240132

On 24.02.2025 12:37 PM, Md Sadre Alam wrote:
> Add SPI NAND support for ipq9574 SoC.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
> * Moved changes in ipq9574-rdp-common.dtsi to separate patch
> 
> * Prefixed zero for reg address in qpic_bam and qpic_nand
> 
> * For full change history, please refer to https://lore.kernel.org/linux-arm-msm/20241120091507.1404368-8-quic_mdalam@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 942290028972..acbcf507adef 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -447,6 +447,34 @@ tcsr: syscon@1937000 {
>  			reg = <0x01937000 0x21000>;
>  		};
>  
> +		qpic_bam: dma-controller@7984000 {
> +			compatible = "qcom,bam-v1.7.0";

v1.7.4

> +			reg = <0x07984000 0x1c000>;
> +			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_QPIC_AHB_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			status = "disabled";
> +		};
> +
> +		qpic_nand: spi@79b0000 {
> +			compatible = "qcom,ipq9574-snand";
> +			reg = <0x079b0000 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&gcc GCC_QPIC_CLK>,
> +				 <&gcc GCC_QPIC_AHB_CLK>,
> +				 <&gcc GCC_QPIC_IO_MACRO_CLK>;
> +			clock-names = "core", "aon", "iom";
> +			dmas = <&qpic_bam 0>,
> +			       <&qpic_bam 1>,
> +			       <&qpic_bam 2>;
> +			dma-names = "tx", "rx", "cmd";

Please make clock-names & dma-names a vertical list, like clocks and dmas
and shift the nodes so that they're sorted by address

Konrad

