Return-Path: <linux-arm-msm+bounces-76351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BECBC424C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 11:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AFC344E29EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 09:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001AE2EA731;
	Wed,  8 Oct 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCXeKTrg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B922EBBB3
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759915179; cv=none; b=RJkFllB6MYYRwtLJRGezGOszDS4cEo3BxuKbb5EFDvh/Z5gBL/mwnGS6hVlbygFBC5qDk4G7t+SDKRPTULB2NwztBFvz8ZLNz9zlOnb9eMXgJEGXF+JvvkozZO03ssldxw/azLgfj+npPWRrBMOkMm2fZVW1ygHwB2hg52QAUkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759915179; c=relaxed/simple;
	bh=7QRpahmcmOdw5PQH5i1we5xeffs7vinNRUO2Yk6g8rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUHnb3et3vG1Um88wpvcafbW/t114gi6bCTmaxrNsV3ynuZfKEUygzF5sp1FynIe0QrMD6PNO+IhPxRmOGpP22IEd5EIamLDrZOIBTI2lYGLBNZzLayC5VMf1hK+BhOIBZxIAVPPTwzBWFhQ/oXUiII/qmXaNt9WxOh4ozwz+Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCXeKTrg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Om3014204
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 09:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDebG30uzC8d/gzatvcnaoRcwyzXptUm9ibGKb8H8Lw=; b=WCXeKTrgFRUsUMWM
	vKLcmY3fLjkDW8xAjUmfLuR67jar8W60WZJBTMzWqK7rKvz6srdwR0qTsnaDwbrQ
	Tjg4RRzSMnHlp03SoV1ZkLUwbK6SE89t056abEGJ43s19o7S3Kw25oSPjjdlKLRf
	p7L/E0oj3X4vF4w2PQLm1DvpX75ltYIIwF+rwGlb1PAl30FsBkgd4dtR1rEYsLKa
	BbayXb9YO3/vznh7hM0k2fdbBBRWxwuSYNseDKFw+sDMwDaTC5BPlzfODLsAPXtu
	mUMfOlRs+YIqoU+O6hafIu/V81eZtZSQWA0AJfKlt7rfYfUkXc4H4eGDG7Z6zrxE
	HbfoOQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0nnhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 09:19:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-853f011da26so238440885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 02:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759915176; x=1760519976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDebG30uzC8d/gzatvcnaoRcwyzXptUm9ibGKb8H8Lw=;
        b=eIjx/mUiOxawMt9eH4nTwlJHcamba7KcFbLsrP7/GNXxe6Q3JSqC+1YXgqsSYghWxo
         fwkoVNyDV8yw1gjuTljpl3Km1dS2W+xf8jp6WP58kuQJt0Gh9/I2Nlk2nl181zV+W1JB
         NrLiLAnKaxjq+Arl6molHpoLtcVWSK1KAXxB0q+H/8t2gaj/vugcQPaZlnhOYABwz28e
         RTHS9WZfWDf+tTpl2fYU6CdISDwpNtR6Z78NrZaU3m1NWdX+Ur/S1/BXmKEV3N1ta6Ib
         ogZwMOANY2a4df5kKZXCcefznA6jTUNezjrfg4J6Qc6WKSWKH1t1YzUbg1AdPMVqAYho
         Lp3w==
X-Gm-Message-State: AOJu0YwX6HAVj1+t43eI5whitsST2LgEoaUyQfrtnM5rlGdpzSJFb7Lc
	i+bkeQSPM3QoQX9MngRQJfTI8a26a4/dI2xKvtoNPRYyS32gHVPq7I+BSmrDnKQDfIZTOOTX5BI
	pQCAmMvVzcP6bitlTP7/9py2LopvHB4q4WK5ZNDy9oz6g5ZauPUJLUmRC6xBPVkht9TnDXtrmdb
	qg
X-Gm-Gg: ASbGncs7SrAkbuitAfnLMx40NqvGAweBUPf5uKhAcIchzAhOs9YkWaucZ3+akn6caRk
	z+VPY1fpWrkazSwtUVKY7AxX6DAqP+rRopiGzz4TbyRDEA03aE7wdT9/qPnWAP4rXZTkCJ8xHJt
	Q2seZGE/mLCdNlQoxk83jWlie4XYE41cb2m4vaR7B4LitrsBMrOjFVH6MY7jLWhuPnN5BoGx2b4
	OHVK2SxLUmi3RjT8LB0mTyxmGYP/qaCVCzX0HxRhGAq9KdrzH3YxTerlhVhqql9xiO4GBFKwUwX
	/2MMusxZR5g78b0H5ZX4hkk71jWu3GyXgFGJNzZXeGfRna1hXaWJ4x+t4M39X3kddc8WmgjA/RN
	3Wlsm7UCmFPgh/nGeAhN/z3UdsJ4=
X-Received: by 2002:a05:6214:20e1:b0:798:f061:66bb with SMTP id 6a1803df08f44-87b20ff97f9mr21368886d6.1.1759915176053;
        Wed, 08 Oct 2025 02:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9AtoSWRycJFNeyXgDRo0UkanPNUKvhGlX9n3GDw60mCueMa0GPqxCfk2qdRytGJj+xJFElg==
X-Received: by 2002:a05:6214:20e1:b0:798:f061:66bb with SMTP id 6a1803df08f44-87b20ff97f9mr21368696d6.1.1759915175560;
        Wed, 08 Oct 2025 02:19:35 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639773d4d8esm8542528a12.30.2025.10.08.02.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:19:35 -0700 (PDT)
Message-ID: <65e6d61a-7648-4125-8550-8a8c6d476b0a@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 11:19:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] remoteproc: qcom: pas: Enable Secure PAS support
 with IOMMU managed by Linux
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-11-de841623af3c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-11-de841623af3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NrSXL1lstm6_PedKn-_tI0Tv6-MbKYFA
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e62ca9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=XzL6S5KsqyWbBsQ6UhUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: NrSXL1lstm6_PedKn-_tI0Tv6-MbKYFA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX2qP7gPhe4QVT
 kw8WJeIeV/JhLYRKLxLJUd3n8t1Tuq9/n4S6u3qYv1q5rjuzZnFEa36q3ubRYr982ibertmmbrU
 OsrEO0N95BjkZhVS0EgcJBkwXzuIbdanEO4b58mfJ584D/0Iasof2cnyuoqzOyZMkdbaJTYfhzK
 K1uu2+HWmwxRVeRVzTt9djOtOztcFdaxNMvwkqswTa2tDkht2bm1Xr1z1SdrKHOQ/QbN1Hf2lby
 2erpHov3zXuqR/C4n8Af5liQqru2dHf4ZQgxH+3JbI3Qx/kvckfEJjVNYMQYvu5ntLw++rN5MnZ
 dS5pcNl/I2i7FcWmRwH7CSsCMWwVBpqUgWrKIDaslx7W+qO2s5r9JXiDQ2HX782FrIlwYOxDr3z
 hUIEizF7YnFoH/senbMTne8rCUMOhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 10/7/25 6:48 PM, Mukesh Ojha wrote:
> Most Qualcomm platforms feature Gunyah hypervisor, which typically
> handles IOMMU configuration. This includes mapping memory regions and
> device memory resources for remote processors by intercepting
> qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
> during teardown. Additionally, SHM bridge setup is required to enable
> memory protection for both remoteproc metadata and its memory regions.
> When the aforementioned hypervisor is absent, the operating system must
> perform these configurations instead.
> 
> When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
> own device tree overlay file that specifies the firmware stream ID now
> managed by Linux for a particular remote processor. If the iommus
> property is specified in the remoteproc device tree node, it indicates
> that IOMMU configuration must be handled by Linux. In this case, the
> has_iommu flag is set for the remote processor, which ensures that the
> resource table, carveouts, and SHM bridge are properly configured before
> memory is passed to TrustZone for authentication. Otherwise, the
> has_iommu flag remains unset, which indicates default behavior.
> 
> Enables Secure PAS support for remote processors when IOMMU configuration
> is managed by Linux.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> +	if (of_property_present(pdev->dev.of_node, "iommus")) {
> +		struct of_phandle_args args;
> +
> +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
> +						 "#iommu-cells", 0, &args);
> +		if (ret < 0)
> +			return ret;
> +
> +		rproc->has_iommu = true;
> +		of_node_put(args.np);
> +	} else {
> +		rproc->has_iommu = false;
> +	}

I think the above is a little heavy-handed..

rproc->has_iommu = of_property_present(...)

should suffice.. if the developer puts something that isn't a #xxx-cells
-marked provider in xxx = <>, that's on them

Konrad

