Return-Path: <linux-arm-msm+bounces-34830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A829A310E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 00:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4A3B28696D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 22:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999791D86C9;
	Thu, 17 Oct 2024 22:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZcUhq/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CAA1D798B
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 22:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729205559; cv=none; b=Qu87Q8tC8wGD5Bcn49pSh8f1qyiA4oVeO7/PbWLEUg6L1FOSqBAe1APjy3SZqJCgVU5IpCOpAHIiy8YhnG2hFRY7hVSs2PFXumBrhMckWsWDvvonlxrsarHmNwS/Jhq0Mq22UjkHDEQuZMV+mm1F6RZ05k+pWW/Yk4ODQoPJbNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729205559; c=relaxed/simple;
	bh=veoPP5dnbAv8MxONszvuvZHFUMkbHElyR/BNXSyEu8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2IJzmGZgPtCO5Pu3fYhDjJPWL5u2Z9fmtY9g3CLTO7G0H6nkXTI/4P5E0bGJQW34NKgbHmfcuTSbHonjvvYeY6Z+3iTcUzKqo2TBePhrmsrtnh0AXlpAzx/sxMCON3GEtyYnDwB20ne3P/fW80HrkKjorEHJIb4JE2hOKGqgtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZcUhq/2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HG4xr6002600
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 22:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IbT5DS26BtuSkJfII8scnwrgyRvqZSh5tNO3g4y6GQ=; b=OZcUhq/2zjmSV0Aq
	zFJdyJ+qQ/9OZvBcJkQ3RYUVunX0DRmOt64Isav4NshxlDJxCclUY1qVkMULr8sa
	vwSm7DgOaXLxBn6tY++hVoQjhajzXL60dKXM9rvr3gVvGkoR7zjO5U3zapWnQ22x
	pljHegLHXvIDnn/pwVG19MKXGGiJMRA8JT5QM93FjN7cLyNve7ntSSEgDqpah1Vl
	NEgY88slXfIDzVovLeiCwrpDGE3F4DHpXSW8HBlGQEAI2ypUMlKqEgBaJwkE5tVP
	49K/+wdmC/NH52NRLxCtVFFoJS/RE/xi1FGALftt0xXGjZtcbuAEriEGTu1IMgqo
	OF+McA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a5xypnrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 22:52:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4609b352aa9so2234291cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 15:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729205551; x=1729810351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4IbT5DS26BtuSkJfII8scnwrgyRvqZSh5tNO3g4y6GQ=;
        b=eLhq1upkk1FtzkkhW7wgCv46VWQ9fY7HiOPSmAkTBwE5aaHlqQyUmdyvgplbXDT2ov
         tNjGsfI3z8zaeKHcQhduFuElDl3ERNxtwSed8mCxLXZznquwqOx/A/+HksUemEn/R49h
         jd2PlDjb4FJQgt+U5QaFMABRF2QW4okRZPbDL4Hl0dG5NlOAsdUTJjXdLLASQevIbMTh
         1JO4iQ7H11xky2lQWMZwGYxtvAkfC4Goa+2QjEWyKddqmKjuYGPu8wE/3urkoFc8fYTh
         8Rv334467trf0ML15pgH5iWQckILMaa6AASFTJjveGb2t7hpHsoC8aXdYkkbX758lZLE
         HinA==
X-Gm-Message-State: AOJu0YwrWndjs8SzmWwUBez0fp38kGFL1oajP/n2v38rJTE6QDY52lb+
	0gBn7VU9eCICAnVFy5EqP+AlSSErEtalNF0r4AhTi4H8V5KgmTVwONxv0x/sbJMcPFgPNErFEvx
	OMObUNsVZFhZnjClKPJYwc/1jVEwDwveiXGgzwFCsisrx4WHSZj3mm9jXsdJnhHXW
X-Received: by 2002:a05:622a:1aa5:b0:460:3ff6:a0c7 with SMTP id d75a77b69052e-460aedef718mr2353161cf.14.1729205551196;
        Thu, 17 Oct 2024 15:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmMsSKLph0w6Z2CuxpVGUO5OV6eMEH2AOQuSkJYuGrScz4s8n3lw5vOvk48WKsAeN9J3f1ZQ==
X-Received: by 2002:a05:622a:1aa5:b0:460:3ff6:a0c7 with SMTP id d75a77b69052e-460aedef718mr2352981cf.14.1729205550697;
        Thu, 17 Oct 2024 15:52:30 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68ae9b5esm20276966b.88.2024.10.17.15.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 15:52:28 -0700 (PDT)
Message-ID: <f9191c4d-a41b-463b-959d-14152cce080e@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 00:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sa8775p: Add support to scale
 DDR/L3
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
References: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com>
 <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-1-074e0fb80b33@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-1-074e0fb80b33@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A_mGFcK-HSlI87Ro4HJHOh_ujJpPI-S6
X-Proofpoint-ORIG-GUID: A_mGFcK-HSlI87Ro4HJHOh_ujJpPI-S6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170153

On 17.10.2024 11:28 AM, Jagadeesh Kona wrote:
> Add support to scale DDR and L3 based on CPU frequencies
> on SA8775P platform.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 06bf2ba556b89b643da901857a9aa7cdc7ba90cc..d8b90bd4b1f05604185f015929a1f296799ad6a4 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
> @@ -47,6 +48,10 @@ CPU0: cpu@0 {
>  			next-level-cache = <&L2_0>;
>  			capacity-dmips-mhz = <1024>;
>  			dynamic-power-coefficient = <100>;
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,

Please align the '&'s and squash with patch 2. This one doesn't cause
much difference on its own, which makes the commit message misleading

Konrad

