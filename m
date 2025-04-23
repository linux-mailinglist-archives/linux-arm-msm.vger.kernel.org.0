Return-Path: <linux-arm-msm+bounces-55103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C697A9859F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA37444100E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FB42566DF;
	Wed, 23 Apr 2025 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFg5t/47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F573339A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400853; cv=none; b=HXP6VRxW28DwnZVMkmnhsNQeCUMYCmjIdd3QsftcEflSwkt4PrU2tKnRjc/Ae+eFUt5LWg7s4nn0oNgzQUmVqCTMY6U+1PQ2q5F4sfmmQce9Eeb6yGdVXBrcqnzSoCGK/AshuthR+EivVO1d/1RJZuzgVSoxThEqPY7avUlAGRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400853; c=relaxed/simple;
	bh=uSE8OjcgrUbmkCp6jk1pPtxB/R+pN88XPnq8rYd1RvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0oj/50kdS+OohGRYU4y9N/EU+/8jTXu81UDR2aPMn0cip3OW3RXlZnhDBw5nCSlZhtkfQvCIWYAXtJ1B1c+wvyiY0lZauaiRAGAqzRB6QPLa70/21cvjWR0AGGnbll0qafADCVECHNvR8XfSXyG+YSWHtd8DEtwwBt3tCg6Xzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFg5t/47; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iMi0008515
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BNT20WPVvgFQc97GVJErvJnQMOitqkwB+xfhFmU4Op8=; b=OFg5t/470DQTBio3
	YGTRahQhhmjletMwuHVh7WSTVah5WBufy/hKlCp51C3U2sVns6rMYrMTxLIcjgU0
	obexMUoUZQjbFI8TlzdJcDwgq2uWRPKApRwwV/Q54ru4aM7FUzughwi1i6QAOdYX
	IJYLu5j1QTKbBqHS3/uqCGQOsBao/ScF32/OLwyOlzOb0tMo2Nn2lionaiDAtcqe
	NX5RbkjZ2ooRmlMS/v5FuLFIOVZspW+J/JILB0FLrQc6bOXiy3dhQfql+TdYjpkK
	XfqkR3KaxqgKrifkPOlo2wZW/xrYws9w9bULbmFDHGSPZnR52/+L69fEQGbInlsA
	JnRQYQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh59mvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:34:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2c8929757so14935956d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 02:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745400850; x=1746005650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNT20WPVvgFQc97GVJErvJnQMOitqkwB+xfhFmU4Op8=;
        b=HbEjuyD6JbEFerv9RpQ0ppiZmYwdOLumn5/QPLxIF5taIemmmA8NPBoupsvqnyZBzm
         K8a/Z10I7hYlI6ZXdNX8yAgyvdLqeFpF1leWlxMNJ+gRwIYGnu4xvFRoWP7+Q92TV56o
         Gz68O3wg8DeFkuV+gHmSSC5/KHIWR8PW9OFi7luy7oiEvQc4fiw4BSdfgkuuD4TENKVn
         K7mKrs1V40h7gIADRYuwbxSKrgqVHJZ1D7nT2quBb/tafXnvEz9b7ylpAlW49+SwxQzh
         QudoeB+4DPFCr9zsW/reYhvBXiTJrnjt65cnrTfSumRmarwl5qpURs+29/+dZuHwtOXx
         5ohA==
X-Forwarded-Encrypted: i=1; AJvYcCUGX/M09UEmisEsfWYHf62yRVx+Mwa777WCEwVzCWclcfrOibITbFgEnn41eusB8wbSZ+dqA6fSj452OLgr@vger.kernel.org
X-Gm-Message-State: AOJu0YxfjpEK7+XP9pKWXl93GBRxs11PeswFsucfGsupZU3aeU+IRHiH
	RBcY0zXgd77e7ytn0frIYLU5MfuppFJ18J5+lvCpZis1WAMOukffp7HVrUU2h0NalIDEAWwZEv9
	OjCQgdtwyJw33/1Wq4bzvZqqaRC/p9gLlHSPDYfFlvn2kkuBVa7rvRHKns/ydgfbr
X-Gm-Gg: ASbGncufCQsxQyTPsinZuyRExeB7/y/ntbYuP+ehYo5NdrwP1VbV3Q03ceUBaMnKKus
	7B/B6v7g5k+X4KXjlQbakhVFyzF7iVRyEuDfQLETTvd8kStKk8KElW0q1mwTyQng+pVfnrQs9oa
	xSatV3208RIbFOiKVrkAl+NuMEPosfsDwVggCsYQix3EXvb89aoMCsg3e/HWPPDh96abWNTB7vY
	IpRvdI1bwO5Mp0Y8zbeqglkwbXeS5hQv5ykvOQapspUTe3R9csUNfdtKyZpFNGpIhmIu7UDgvxK
	K5vS8HbK/iR8KoJ+p6wUTU51Yw6zVC08bMck4yLjE+na79pyduIU5SMLuyyeZY5O6q0=
X-Received: by 2002:a05:620a:430b:b0:7c5:6fee:246f with SMTP id af79cd13be357-7c94d231186mr153899085a.1.1745400850196;
        Wed, 23 Apr 2025 02:34:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLnxCv9VXYwZKLmPcXEO0/NEnT5DrG/YWmnJcvkBu85Ijyalv+exK+5Oq+0VSxEPPYLQtjQQ==
X-Received: by 2002:a05:620a:430b:b0:7c5:6fee:246f with SMTP id af79cd13be357-7c94d231186mr153896885a.1.1745400849852;
        Wed, 23 Apr 2025 02:34:09 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefcf4fsm785708366b.109.2025.04.23.02.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:34:09 -0700 (PDT)
Message-ID: <654e4b69-dac2-4e05-bbe7-61a3396da52d@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 11:34:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-5-a94fe8799f14@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-5-a94fe8799f14@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2NSBTYWx0ZWRfXw65oc/gpE9PO fqETX8CbVjUtaAHs2cRadXRaoFoNr9WVzvXTlistcX067UabBX36tn+MuCCtNJnCgPketvo6t0+ Rpu8iQiGG73FmU5njX9uBrG4IuHMudzM3zzwnRUwTeZBILMiFwhR23fdrghzz12+rrxJjCa95ZE
 7Y5XRsUOUM88eNLok7dBXcOZo5bOohxA8ZTdinCBrqtgrxfxlw5hfhIQTd5kIisKSvoH4kPq+W1 c5xaq8/Q12aQcTC8Hor5EwCWxSgg9UvhfYsQ7DRY0PhcbVZiiLbw4XtqQVeBJhcQ+gPmb5Bbacv dvCbPYqnUuToduhtlLMQwand/ysBy5DEbuKDhMhibC3A3IVAaOvvFhOid7Wyt62AxzJ1hP22T43
 sP5r0GpDOvQa29+hIb1KJbbGpCw2haHHN5+VsZU9PzEsrng+V7y/Ssadri6l3XDoJm38bY0G
X-Proofpoint-GUID: 5eIq4OyFinNGlTVij7Phh4k0vY2KZLok
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6808b412 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=j59CM_6C_jZRu4RL990A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5eIq4OyFinNGlTVij7Phh4k0vY2KZLok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=888
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230065

On 4/23/25 11:17 AM, Lijuan Gao wrote:
> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
> remoteproc functionality.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index fe9fda6b71c4..c0e2d8699d05 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -503,6 +503,16 @@ smem_region: smem@86000000 {
>  			no-map;
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		rproc_cdsp_mem: rproc-cdsp@93b00000 {
> +			reg = <0x0 0x93b00000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		rproc_adsp_mem: rproc-adsp@95900000 {
> +			reg = <0x0 0x95900000 0x0 0x1e00000>;
> +			no-map;
> +		};

Please double check these addresses, I'm not saying they're necessarily
wrong, but I can't find a confirmation for them either


>  	};
>  
>  	soc: soc@0 {
> @@ -3124,6 +3134,44 @@ cti@7900000 {
>  			clock-names = "apb_pclk";
>  		};
>  
> +		remoteproc_cdsp: remoteproc-cdsp@8300000 {

remoteproc@

[...]

> +		remoteproc_adsp: remoteproc-adsp@62400000 {
> +			compatible = "qcom,qcs615-adsp-pas", "qcom,sm8150-adsp-pas";
> +			reg = <0x0 0x62400000 0x0 0x100>;

The size is 0x100000 (1 MiB)

Konrad

