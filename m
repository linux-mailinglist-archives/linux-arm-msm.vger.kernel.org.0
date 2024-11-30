Return-Path: <linux-arm-msm+bounces-39720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7351C9DF134
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 15:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC7DCB213B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 14:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8CF19E971;
	Sat, 30 Nov 2024 14:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3oAIMsC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1F419ADA6
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732977442; cv=none; b=fLO/egnCSYc4q0qkfQxOsc7qPcg0qA4ZwaRlkUVNbmQWi8U3Dc4z5Xjb2fk1hGXA5uIjGw/ia1EZhmvEIrO/YCG8A/dj30VQpwUv/tQz10WvttSfKZh6B/KmeXZWVdnXbcnaKkzpIIb54aw1aqWpnnLRdJAjbrDt/xGlaSsSGYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732977442; c=relaxed/simple;
	bh=vYgbK47cGYuGhnWZ5whBp24xd3Q9QtzL5uAwUMIS0hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZsDFqeNsJ2S8e7N11Gtcqkn6pgNsMA+mS91cyDrfKhJ3SX/HFTCAZ/4knZAyJcvi11F4gSQ7gfqbVOvfPCydMEasA3KVbNDJODmV7NW15aboJEjfEQzZwpjzsDNSMdiJ7p4M9pSAtu4GI0O2VonB//XKM0laXjJAv/PMp9uOes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3oAIMsC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AUEK3tF030139
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8t6znDnOlIUbigVJLe8EZYD/UdUfdDDmCcUZywdHGbE=; b=a3oAIMsC5Pzhi8Rd
	p2PW1wIoWW/MoijO95sUeSVDOgPqJXgt30Bv1/UPPI8w4SGhTYGns8iNS8jVPlg8
	rS5P5GtPqsNhY6uYdzjIfvlDdZ5cdasbAHFcrY9wYrhRZYuihnVpCi63Ki9ImDBP
	iEu2Dt2JqLui7bjdcK/wQsrwxb1y2fS0HKSg6QBrCackt/6ToYhFYJ2u4LJmjVJi
	36KuHEZTV0WlIOGHYJ/HCJk/KjBkhXZg21L2BQ7JebRLRF/mRoJPeK7aSy6+Yzh0
	Rdy4myQkRDVVVPnR0WzihXsE426qmsbKKttkcnG0Wpdy1oFrXCQx5PIbjseqbVT/
	l+s8iA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437uvjrrh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:37:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d87f10a5c7so4679196d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 06:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732977437; x=1733582237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8t6znDnOlIUbigVJLe8EZYD/UdUfdDDmCcUZywdHGbE=;
        b=ke7oi9M2VSilM3e3g1Is8RVt9VHDu3Uty0dVh4lAh5lSpiTX353y0S3Qitr6PaBg8P
         ubrRebi6wzWbJrqRZk7ZOZKcsAb3XI0WXBOv4n3+tWAoFExiICa6WVAC7nreqZA6B6W/
         vCprIqjqPKVS2FPFsvYvZ45Z2PcPN7Yzc1BVYNKnyxt8D8qpWPgH4NCsLMXnuiVKz/yv
         h3TXj7cDXa6qUbMDTQdKNQ6IQUwa2JSfiiWMn+S5+bnZdejlZxhrufII6Pqp3M3STN1F
         3n+Gw7yVpSe1zgKNIu4nFJ8VLBJ1VQ8iWapfkkOk8OwcLLI+n+ozph3eCVRQKm2TqqKs
         Ko1A==
X-Forwarded-Encrypted: i=1; AJvYcCUSx9VSC/I9iAmvkYB/j4B1I6p4GoouC25oOvsWcUSzMT/IP4lvFrTx8gaQ9cG4IMi8fPX+nMKPKgrBIWST@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7+h08S9OPCioXrHqbQFyuCGbr6OHsW76TxUNGS9S3pcfYNZGa
	RS3q9wRJ9e0YhiF/gLtPH89F0Yq1+6LaAIX0BIE/eHcfjaZ9aa+Vqe9ZCcDQAi0sCCeMQK1PJXr
	NPMrnHwGYexIquyXY3im4Jfun8t2MQ2GHuiPkyelU4SXLesm7upNSOjKYj0p3cVAJ
X-Gm-Gg: ASbGncugL2R9iv3j3xlkmEznwOefrL8TUSgO96/ppJxm5a1cPRZccee1fp3OOxb+LLW
	EF3J2ixfhwnq61DkiVhuHU1rmU5aNi/WZ/eXYdqWz2Bs9akuBOXtCoLvc0WMI6N+PHsl+bPsMFr
	2obohUxeNZ68IRWfVuWxV4Lk/kSvLG4l7oe0pbVPKs+5nUGp8yECw5S8i6whNNlJ1u2V+llIvO+
	LQIgEDRGXdvON+AttBXXoHUsSgggZqR3WX2B04Di3IuNWqJSWwzp3crzUnMqOYonqb1gdi8r4vZ
	nQXa64AxKu5E9E7lyaSeos8yVl0X7r8=
X-Received: by 2002:a05:620a:19a5:b0:7a9:a632:48ad with SMTP id af79cd13be357-7b67c46620bmr717768985a.11.1732977437565;
        Sat, 30 Nov 2024 06:37:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEn//unTUzzYipJpoMdxPSmh0OLZKfaf7GZY+Uf28bBCJrS+BMCCNcF8rc3VLe30uLLK7eFMQ==
X-Received: by 2002:a05:620a:19a5:b0:7a9:a632:48ad with SMTP id af79cd13be357-7b67c46620bmr717767185a.11.1732977437101;
        Sat, 30 Nov 2024 06:37:17 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c19efsm284143166b.33.2024.11.30.06.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 06:37:16 -0800 (PST)
Message-ID: <802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com>
Date: Sat, 30 Nov 2024 15:37:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add support for clock
 controllers
To: Imran Shaik <quic_imrashai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das
 <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gF0DtsnwYtfAFuOuhTEP3AGyM_w2aFwl
X-Proofpoint-ORIG-GUID: gF0DtsnwYtfAFuOuhTEP3AGyM_w2aFwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411300121

On 14.11.2024 12:05 PM, Imran Shaik wrote:
> Add support for GPU, Video, Camera and Display clock controllers on
> Qualcomm QCS8300 platform.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
> Please note that this series is dependent on [1] and [2], which adds support
> for QCS8300 initial device tree and QCS8300 multi media clock controllers respectively.
> 
> [1] https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
> [2] https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/ 
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 59 +++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 2c35f96c3f28..e43fada4acb5 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -5,6 +5,10 @@
>  
>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
> +#include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -772,6 +776,20 @@ lpass_ag_noc: interconnect@3c40000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		gpucc: clock-controller@3d90000 {
> +			compatible = "qcom,qcs8300-gpucc";
> +			reg = <0x0 0x03d90000 0x0 0xa000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,

Missing AHB clock

> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +			clock-names = "bi_tcxo",
> +				      "gcc_gpu_gpll0_clk_src",
> +				      "gcc_gpu_gpll0_div_clk_src";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		pmu@9091000 {
>  			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>  			reg = <0x0 0x9091000 0x0 0x1000>;
> @@ -882,6 +900,47 @@ gem_noc: interconnect@9100000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		videocc: clock-controller@abf0000 {
> +			compatible = "qcom,qcs8300-videocc";
> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,

And the ones you reference here and below are not registered with
the clock framework.. 

So please pick one

Konrad

Konrad

