Return-Path: <linux-arm-msm+bounces-36614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E709B8461
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7398FB212EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5445E1494D9;
	Thu, 31 Oct 2024 20:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2+KpKfi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6682C146A66
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730406641; cv=none; b=DHXjOouW4sSQmh6qjnm5vBwc2DDxjhukp/FpJfawEESjsGYMo2C4Yp7BXWfhfjOTasarI8bcce5V93rk7HZS+oweNH9phs7qef6hnCd5c+y4xQhPKXemKrkY5mYr6jKGviNJTV2hka56Ha5IOrwrqqdY1/GgJiN7Q1JEvmr+2e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730406641; c=relaxed/simple;
	bh=4wF+WR+58lXehmAx16bPIl0Hmrv+5u5wGZRUtY4WhAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjgGosLyRIsdwEJYOuImQqkmBPkR5MOhMM6IrZQyDPnFgvc9abtfzXeWVzrqgppZvGcC8/u5C4gyKlT3UD2M4WozGrVlV0mOvjYDMdoeF2WANGO2SazdFWy3kGUgeOpq1QIABbNB4RK/akbcW3bB+DWrvDEo0tAWb0joYFFitE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2+KpKfi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V9Y5NC009845
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vn3QTWUjCAic1i2jtFrxyg3FZC1WBX+pK1/bjh3GN7Q=; b=A2+KpKfilPVw8X7j
	gf7IT53+mwotSyyijMjSdmuCOU8klTIoEdkZGLR6K5QrIzkM6cb0HSuaK5qtydYA
	vbXd6z5HkGeTu3M9XsJUqB/pNZaKxz0MPgj9N3TfQ+EMCscMbr/XWiUy8TMdzZ3m
	V8V7L1k8W/ls1mLcUY19iniL18U7N6YIVqYR+8JGcQebi2ew8VIXoLwG9WAbeeYo
	QOU6+SyzxlU4YeZzX69siE9sldbcX94n4GAUPj07Ko6kXWFHmgfEQEQzen8lvwVa
	TvugyhOEdBoyD6DfJQ/4iGpuSqJeGnRnM0L1jvsLzesemwgmnsMihFZrku5l6OKO
	ThkGug==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kjm1d6mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:30:38 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4a47e84e2b3so69567137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 13:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730406637; x=1731011437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vn3QTWUjCAic1i2jtFrxyg3FZC1WBX+pK1/bjh3GN7Q=;
        b=wrmZhVJcKP9FyYFV2aR7lvr4JiwQm7bUJVWc/InC8A3i2BsaEwejERvblGQa6XDf56
         TbgZR8h9c8xokNlRUrqWwzfW3iBoUGCOoA+MucgzStSPfxWE8NvoRNDBu/ArzYYCc1mh
         P6qG/SvXFnGelvN3GXEY/0pza/J4vRbOBclZXRbDsdtlcP/A0Gxmkq1nO6N5E4P+EpkA
         PO6azbQXvRqpdcb4Uy5rikWw2OenEtNHuFT0bRcScsXqLXzoTXvTzaKZ4m0MYv6jRNxi
         qRyRN3jC3S7J0Sg3/vNUitUmACo4MujPDz1tiXrkbbveHMiUvTHFhC9e0k+37A/I5GW2
         18qA==
X-Gm-Message-State: AOJu0Yx8YmJJQ/72NIrBdyK11b9u0Zk+RasgSf88TuiYQJMpcY4FjSfB
	TOYqoQax8l4kOBqQnCsjkOivG43oa2qcRJ0eTbfxZc1ye61iepALEr0FlcrgTfJBV+RHDMDjrsg
	p9FgGZT7CfBczdh9+YQKX6450ku8kdHBbLthZV9wy+5orhQxmd2agtkHD+lmAdRhf
X-Received: by 2002:a05:6122:308:b0:50d:a94f:6b5d with SMTP id 71dfb90a1353d-510150e3c77mr5462590e0c.2.1730406637213;
        Thu, 31 Oct 2024 13:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdl28X3YUr9VOac9QD1ZHycOAxkaqooK6TaCu9jFulPQMeNW7RR5+G5iY1kNTYpQQ8cejOdQ==
X-Received: by 2002:a05:6122:308:b0:50d:a94f:6b5d with SMTP id 71dfb90a1353d-510150e3c77mr5462563e0c.2.1730406636788;
        Thu, 31 Oct 2024 13:30:36 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56641232sm101237166b.152.2024.10.31.13.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:30:35 -0700 (PDT)
Message-ID: <14a7bfdb-7106-4317-a54a-e0101c41cba1@oss.qualcomm.com>
Date: Thu, 31 Oct 2024 21:30:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-1-bdf1d9ce6021@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241030-a663-gpu-support-v3-1-bdf1d9ce6021@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mgaj-XSIoJ-fLSamaqujChCNtGdD9wSD
X-Proofpoint-ORIG-GUID: mgaj-XSIoJ-fLSamaqujChCNtGdD9wSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310155

On 30.10.2024 8:02 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. As of now all
> SKUs have the same GPU fmax, so there is no requirement of
> speed bin support.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 94 +++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index e8dbc8d820a6..c6cb18193787 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3072,6 +3072,100 @@ tcsr_mutex: hwlock@1f40000 {
>  			#hwlock-cells = <1>;
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-663.0", "qcom,adreno";

Is the patchlevel zero for this SKU?


> +			reg = <0x0 0x03d00000 0x0 0x40000>,
> +			      <0x0 0x03d9e000 0x0 0x1000>,
> +			      <0x0 0x03d61000 0x0 0x800>;
> +			reg-names = "kgsl_3d0_reg_memory",
> +				    "cx_mem",
> +				    "cx_dbgc";
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus = <&adreno_smmu 0 0xc00>,
> +				 <&adreno_smmu 1 0xc00>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +			qcom,gmu = <&gmu>;
> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "gfx-mem";
> +			#cooling-cells = <2>;

You might want to hook this up to a thermal-zone right away

Konrad

