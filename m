Return-Path: <linux-arm-msm+bounces-56103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95887AA08E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03EC018910B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2EF25291F;
	Tue, 29 Apr 2025 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6FXueAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7C51F8725
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923743; cv=none; b=YlkTU0o9j0DFAZaVQWIO4E6MbogtAg3G2CE/hanmedjjlqceQDd2Du6PFcl5eWNBTFB7eKlkb/uCnCfwYHQdvkhqjSC3Tndu/ngD22//DsgTa5tF+qbfV69bCIswBRsuAZV8Cb6NU23FzWKJuKMDnSxrCoEgdxCI7I55JLk2OY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923743; c=relaxed/simple;
	bh=h5yZe9ek0bTkblVkQ7baZzJhtoZvqFqwzWnMpSFK+2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3d1GgciDBij6DvF1/fV3zrlgcdzwps71H9OnXkF3Zw/fM1DTFd9JhtT/8+fQXmC2mfU3lA5gZqbNwx45tnseL/3IyNRTuRLbni0zfvGKf/nqkHZGq/jd6ev5LDDNjTgmoAQHYru57reoRgG21n8oGUMn76IZ9NYsmBZ4WcQG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6FXueAx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9l1n2001785
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBvpr7r5O1gBvBiULTbtUNMDGW2y6sgXuugVNVBKfi0=; b=h6FXueAxWi5gvkik
	7/54US2GkdmrzI9PeQ72q5+R8w5dGFRXbHSuk1mO5k+MNnFiag4iZJ1YYzCZY99i
	PSrUl9FhC16qzI3/PZF3NaA2Q/KKX1870thX6xk8Es6fEcnhNVHx4fMeBVgAYuzx
	8f4qbpO9HTv9KPfCIBCxcrZGX6V8H9weQsq7jmz7lFf6Z1wnYFaNhsTNvDfORg4v
	z+sp00eL6Q0/tSkXEktBqY9WuIc08FdvYqQgYVH+MLXTVS18bWKBHtSM8KinG1IW
	L9/JcACeqGosYFGxEcTt9F4nHz5HTH1vZe1Ryo+CPunIAYTOnY7Tli+G49/60XOw
	8zaFvg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9m7nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:49:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8fd4ef023so15081546d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745923740; x=1746528540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBvpr7r5O1gBvBiULTbtUNMDGW2y6sgXuugVNVBKfi0=;
        b=sEnhPKB6qjMRgQTjN7AjaqNUV7LozVjk7zdVcP4ufQlJWxIF9qgByG+idDMgcDKyji
         S4Dgpgw1WO7im/B5FF+x78H/7fYp3S87dd0kwQ4dTWGnlLVdjF1NoUFxtdIejx4vCsYL
         GxIM8LlvSWqXAkXApR8QrxyBUk/vy2I1yWwhxBL8O0yBiCo/8H1vEEVmpwo7KCpyhZAf
         a2Oc1odM8yNneNyWtTQpnGjMQ2NyJkN7SqcbK1iCDIfXDW1M0VEE2xxa874kiSBh224+
         3Rjb0bsqIMOowiNl58JUgkESloX6GbEK+OH4NvKGL5WNw46nB7XnCOFY5UMzlAo/qzki
         LcBw==
X-Forwarded-Encrypted: i=1; AJvYcCV7hXgW+jrp1tSXG7+ejn2lWBd2nQIQ5jGKk8EV4hj9AVFxPqessoNTzCaQolvtRCrFmmBMq0JrKUhT4WDx@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ2k14BWrSABScSTrPGM/FnqjOC81drPAk+cUcsnOQOQ8Wz3Um
	SZjYkXF9Y1pPMSRnVQkBSMxQBluzbWU30zzno2gMSJdWtdk3srw9y8KLiA9OCnrveZpAzEX4QGi
	kVn4YQoZWFqd0DtxW0FmcxlaHtZOhoTySiS+cQDE6E9jqB4PvmHj21YJVxs2k0ERY
X-Gm-Gg: ASbGnctPph7+otL5g1QgybX40ZDG2FmAZS6xUs8CNzyiU/9F5Xi0yfQ0TLxJNgqZze+
	/IAWgsWsEEI+dexT/hq/e7F8L+Qekw1Lu8PKbruqYSvZlUkuKc3aWgMPWlPL/IPZuQMiHvCPx01
	mU+ySC9oAemNt4/byDHLNqUgRrO+0YFXGP+I9CmXkEP+qsAkeZmRjZjj+u1XKcrGV9FTliVrV2b
	lYs6X3QKvBSA8dxlyw16nCEDlWtDcL/wNUkUUudcyR0FBca4CcbMbS97SzNqa3DauAD4UBJtLHS
	bhWcLURe0URVLwEFHrnTRpAB9Zq0/gJYsUvEcYdpRtgTzFrru9qB5JPcdqB5aOraBA==
X-Received: by 2002:ad4:5943:0:b0:6e8:f4f9:40e1 with SMTP id 6a1803df08f44-6f4f1ab0d4fmr15842426d6.0.1745923740234;
        Tue, 29 Apr 2025 03:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELFfrw4BLWnm8qQ43tdPLNTqSNsmPlRGAJf590ok3QkJlSZByXE/OZIdliFR/98sZgfwkbJQ==
X-Received: by 2002:ad4:5943:0:b0:6e8:f4f9:40e1 with SMTP id 6a1803df08f44-6f4f1ab0d4fmr15842286d6.0.1745923739964;
        Tue, 29 Apr 2025 03:48:59 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff812sm7596718a12.25.2025.04.29.03.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:48:59 -0700 (PDT)
Message-ID: <758047f5-e31a-4933-8560-56d988492d95@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 12:48:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-2-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429092430.21477-2-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810ae9d cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=0757IJQN7x3-QKvqGJMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BN6Dr00eYg5is9LK9e7vhXtZykHSY0rO
X-Proofpoint-ORIG-GUID: BN6Dr00eYg5is9LK9e7vhXtZykHSY0rO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MCBTYWx0ZWRfX9LGCzXMKgX5L HcladjiaNlQTTvHYgdbCfTjL8QYDz460pRrm075mkQ7zSvHZW3K/ML1pkW/OTvjW2fDMRPXIpXw T7lw8SioNHPdxHFyLef8ZegejtiggnaRixtyzN48F7DYOVpOqA5gB5Em6139NkfyNuBXCnIM5me
 2a36sYvXeuGFnTU8uB0o2rjfb8EoC2uxD8KzhuUbNtQeGQWdCBQjJveCLiNtfN0yiDR+Ot25PtP GGED0jCcWf2iy1GrQYoyf/obvJMoY2AVMoNt9oaN30K3dK1LJB4XhgAuauK2Q0Wc6zrj60LNecu RrLxai1Q4JBz8osvf/+qW468FRIQzQcABMDGcmkZz00/xwBL1Jqh5GzAkwW3gtd6jzH3Nb2/piE
 cj0W3KhJd2Xl6RJl66+4Ki9t3AGMNO54ZRvzTad/B+jsVThuzPzs0ddNHVHhP+NcrQUERUHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=776 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290080

On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

[...]

> +&remoteproc_adsp_glink {
> +	/delete-node/ apr;
> +
> +	gpr {
> +		compatible = "qcom,gpr";
> +		qcom,glink-channels = "adsp_apps";
> +		qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +		qcom,intents = <512 20>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		q6apm: service@1 {
> +			compatible = "qcom,q6apm";
> +			reg = <GPR_APM_MODULE_IID>;
> +			#sound-dai-cells = <0>;

No `qcom,protection-domain` under either of the services?

Konrad

