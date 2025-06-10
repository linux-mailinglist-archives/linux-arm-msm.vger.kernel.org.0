Return-Path: <linux-arm-msm+bounces-60789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6CDAD3873
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 15:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 333B17AF2A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FE02D3221;
	Tue, 10 Jun 2025 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCkZ/GeY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC2B246BA0
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560941; cv=none; b=ME49sDWvhyGDLP+Lolu/0hGfTQ1fMdtr5pwKfc4YYwvQt40qPMv4ojkYPqjPo0ZyovVdwyE8fFCaAmnCifb4+Wuz7UfnaMG9/RIWCoI1r7Qj81ARCfAJXxLNK0us4EWB1y2MHCV8prB1rLTbb08XipKu78oM2f3P0zvL8aIUGZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560941; c=relaxed/simple;
	bh=evfZ6g1FYwwlpCeQBDLuX2LOv/1nyUFtLivVJP8bURc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sE8O1H2gPCSXqsO4oKFu1fnXEUpkAzJMbXyZGzYP47dpyY6Iv7kXGJho7gOTc8EO83R5i+VCrV9/S+ARIXsNyCmJWrkZQmf9yqL14yrMoGq+nZjKcoT9i5h0C9PORlvthfZ46xAQeVrSjYh8i+PYCh/PuW5JnlRb9rWUvDWbCiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCkZ/GeY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A96M2i019609
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1erattER2EyDtlcsiT8to8amhSAT62hbSa4lAh3IJM=; b=BCkZ/GeY5eGSI8p6
	K8aH8PRZnsnzqX+zl5WUM4d9MxgjBgI/aA2PoYMfx3zcuDS2BPzVkwbhMLlc7Hbs
	tZhGOAcGhecoujv0poqQo5VYwuxeuaGTFWYrMZGnRTn+eA7ImT3ybu8fqyMzfoVV
	db7nyOfQ+GZqkYNv2M+c+ieRLdyYfqSn5HehXtpAtSedO3VjGw3zjc7Mhe3UI30C
	KhHVo2mW2mxxZ3N6ceBVIHH6qJSGvuvRgh+D+pSTSckONEethNOiyfzMmA+KORvz
	2/Lw+2CdLBnEngpH/BSqd75pkuxg6RLUUEpBGLz917x+Y1C5zR1p4mjmEIExOuhu
	PSgjJg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9sjkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:08:58 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-60efca95d07so1120401eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 06:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560924; x=1750165724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1erattER2EyDtlcsiT8to8amhSAT62hbSa4lAh3IJM=;
        b=FkIcJdV5d6SIY7WqiMnuf9JdBd9u1XwW8K6pmVJU1ZsSKG0YjTfwkCzCOxu/Z9NfT1
         KYvbn66Q0QP/6eJ8Sb9aT2aAvv5y+34qtUhWLt56nT/VvWJCcDGMrCRSff5Mf57Mmah1
         V2BobIVCCuyTzllfoAcvSBWlEU0N2hR8VIUDbnbdTC7S8o5ARdjUwp1CvvBJZZy+59m7
         /ybs4MENpFz+VngrSLKgNqIFvppI3JKs4Nw1p/WeqGLT9q6cOobNuTBQ1eekNboK2PTr
         m9+ZJXM9noxpLQsI/3f7/r+RuDZtHTpysBgtjFazT+yw51+RuzMJvGSj9gg2aH0s3BzE
         w+Tg==
X-Gm-Message-State: AOJu0Yz9H973/iPIGs0xH//oLDU0rSNekx4Wxxo4LgtClqULKyUJWvUk
	+KEk7/cy+d1ahfFFlsZ+JSUOebtbFAy3sFlNr4/FoNLa2VmpG+AsjypEZYNn77Nw4sVuneoVcdf
	mRV19YNaZvHGfCQJxtS69xnZ501Pybew5Y163WEDcWhAEugPeJ1op+tKjuW8N8B7xCI85T5rV36
	UB
X-Gm-Gg: ASbGncuKpvnW/eNfTi8A+QJmGmmQMyNbV3Tmt1lKOMwVpSO0nX3n4s5jlDq0KFz00JZ
	YXaVy8Yw37j6frnu1yilZSMv2zFUl/nNDASgvXI3IqVn4RR0McrTqV/ojs/cAR41l8gcLWYneO5
	7C/QzyOZ902ObPY+08mtyRfjP/8w/8pa1n9Y0pwRUPCmZWsGgV59HXjesY/lnOQi9OkQll9NmKB
	nXJtCrEyRf0LIcgeo1aVyiuDP9lxXJHLsx9LfvQNwv3xyYzQGEbOjiFn0XdZzq2QxLS5910xmGE
	wDTAF05j28F6y6X15Sxy+366opQxDRPbpKka4YRd8Q8L8dZkNCmCEtkjewflwcM6CaRdpkAlqq2
	3
X-Received: by 2002:a05:6808:2013:b0:403:4490:e8dd with SMTP id 5614622812f47-409089b6f92mr4117947b6e.2.1749560924146;
        Tue, 10 Jun 2025 06:08:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHumeK8s6YcLMXzmdaaLzgYlUSa+GoLCZFmNnBzQDlQdOXmx6iMWgCspTl9NFPTRxuzi3p5yw==
X-Received: by 2002:a05:620a:408c:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d331c39c85mr858426185a.2.1749560911969;
        Tue, 10 Jun 2025 06:08:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm718680666b.20.2025.06.10.06.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:08:31 -0700 (PDT)
Message-ID: <f123294b-b944-4723-bd74-713970468d51@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 15:08:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] arm64: dts: qcom: ipq5018: Add tsens node
To: george.moussalem@outlook.com, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250610-ipq5018-tsens-v10-1-3a10a5a2642c@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250610-ipq5018-tsens-v10-1-3a10a5a2642c@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l_SGZjMoph3i2gnFgWi7VVRQB_9-4ByK
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=68482e6a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=UqCG9HQmAAAA:8 a=gCHPDHSnq_wzHoAtv_MA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: l_SGZjMoph3i2gnFgWi7VVRQB_9-4ByK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwMyBTYWx0ZWRfX2sCP+AcPaofr
 Jr/4emZSXdprBvLFJ4jm8O3zLULwgCf2TPSyn2i1Jt2eSP2mznZZ3DnY+z+HSDMxeN2bATAo/xq
 Z74stKmkcsJtPfszyWoiAxyEHMjl56AFnTmybZpWWOdFqiLfqADGcYzBd1qYb+Rgr0deOgJW4pT
 Kqby0Pj4GvSV+iOJc34uT1R7g+MogpfN/lxIQ/Z9xjq5zCAVChrJpd4NCvaJY4iCXfPDWWE2EA0
 EftGSluydtPacdizC4/Eg3K2FH2zTWi7T+mfn9/HDROhYInj9ZqHANpb2cvtNuNRYMYzIxttj+F
 wC2qjn+ytkHKbe6krcUqz+83XJIL/FE8Tk6gkinykC+5pfRu2xu1b97Dw/gxtYvcjl98PKXXRSC
 3TjpG4LZTGX2wQVj2tUULoqjhwxcyWitPIEnFuYckdbGQtg2LMAZX0nPb90skVtw6g5RubYp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100103

On 6/10/25 3:03 PM, George Moussalem via B4 Relay wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> IPQ5018 has tsens V1.0 IP with 5 sensors, though 4 are in use.
> There is no RPM, so tsens has to be manually enabled. Adding the tsens
> and nvmem nodes and adding 4 thermal sensors (zones). With the
> critical temperature being 120'C and action is to reboot.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> +		tsens: thermal-sensor@4a9000 {
> +			compatible = "qcom,ipq5018-tsens";
> +			reg = <0x004a9000 0x1000>, /* TM */
> +			      <0x004a8000 0x1000>; /* SROT */

Please drop these comments

[...]

> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&tsens 2>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature = <120000>;
> +					hysteresis = <2>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		gephy-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&tsens 4>;
> +
> +			trips {
> +				gephy-critical {
> +					temperature = <120000>;

I'm not sure whether there's any firmware/hardware measure to shut
down these beforehand. It's better to have a software trip at 120C
than to not have any at all, but you may want to try and find a
case_therm or so thermistor for your devices..

> +					hysteresis = <2>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		top-glue-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;

0 is default here, you can drop all such entries

> +			thermal-sensors = <&tsens 3>;
> +
> +			trips {
> +				top_glue-critical {

underscores are not allowed in DTs (see:
Documentation/devicetree/bindings/dts-coding-style.rst)

use a hyphen instead

Konrad

