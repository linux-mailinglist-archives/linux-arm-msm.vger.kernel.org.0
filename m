Return-Path: <linux-arm-msm+bounces-78003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAA8BF12D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5FE504F4841
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0DC2ED16B;
	Mon, 20 Oct 2025 12:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cThWQ2Yr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D677311950
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963372; cv=none; b=FHqVDIPLNLCFDr198kXAIZ4Jg0IBfs1RiHMcsaHFgOH3AnZsj+KW8I6hsxdxjdWQR2bhjPkzepoegwtcnUmHdEm64p5YDRNzo+6xvBDp7Rkjbg0Bw4HwkNQdrJJvKB06bf4D88aLv6Tfs5gA/2hjH3WMOuNQvMsK22b8ayoB9gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963372; c=relaxed/simple;
	bh=By4gOhzgftPHwGUyIhrk5JkXD50v475jHppkhs0x1Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyvSMae+4QWDyz5xP+8XAHJamZtM/7G0Ibs/cs+Gp+ru9UalrOsghdKbdl//tZSP3nfpZmEJvyZ+I6gZnFw1Gra6KLgkeyJQHjD9beizKsiyvdAfl88WIMcvJhpOx5Jba6dRo/OLnqHbu2FRLVJ++5bQFS2FsAxHBV67tzX3gPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cThWQ2Yr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBePJK001287
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SlkF8eWD1We9s4Yi5xxwuMqmhkIuqXs6z1JCL27wQxA=; b=cThWQ2YrRAGKTAQc
	P7yrF//YZn8xELhD9SLaTUFuAHAbU49ttgjIw8mxZ6ReSIJHHhJge9Cjemq1b3Zo
	Whw8eYpu8FDsHtW9TP7wIblzR3tFGQ6f6G1ldWBaPpK+g58XbilaHzAek7iiy97y
	n5B961GKcnulbN3jlxGi9wVBLsZklvSIedPTUSsjeDVEA47TxlvPxTpd1B0KizmF
	qKiGn6/Cdi5AI/EkinhPsIAbx5J6q5jdx1ktZGO3i+cQ3fSg5w0D6Vs0U9VWUoLe
	Sjn756A/g9Mnu3oEq6i9d/Y2LwxqIn/U91zJb19Ta5JHWRiiH4ftSYSQT9IEd2b2
	0ZLruA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w2bkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:29:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-890c743a001so120487585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 05:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760963369; x=1761568169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SlkF8eWD1We9s4Yi5xxwuMqmhkIuqXs6z1JCL27wQxA=;
        b=CJTKtif4emP2dJ1STneWCO0IJary6oLQHmPYQz9B2++vPqp/pdpJSf+Vv60hW3a2jX
         5UGtfnGrkxf1Ih0bwbpLskE+bhi+WnzJD7F/6UylBH6jFq9CBcWlgZ1mmrLqQei2eJiV
         b6Dag8whGzCBgeqNv9pqg5eJ7PAdxqL7+BDcx0AdACymcfsB2zXAuy4cUyv27iKG1fAE
         GPSxjxD3Ne60TvjRyPf2b/MvUS6AAOs+rK4820nHOJlkNtZDjfjhXTD8SdR1jN1d2CB7
         7rGgGNfdaOfINH0rDWTH3n84XFJvWqdJzCUu2bHlRZHgAFUz9T4ks9uhH1KSPEHAWcH+
         PkLw==
X-Gm-Message-State: AOJu0YxRZEbcENXEcUvfUQYdzcPMqHALM7o0G/0EDXHSumV/XJL7cUvh
	bWIsYOUfEQEMFeYWjQcGfrzWrX7OTgJ6dALOMghlqNOtFho9lY7nNZ3zg9s9H2d07hZKjLyflZk
	/IBDujRNgw6H4pCnoP1hfvNpCRIfxCXit3ly+BVMkpef3cf6T6nuZiIPl4rOom7bXcy5P
X-Gm-Gg: ASbGnctKzrKU4VjfQvb7kYBHJqKtL2BkdIXLpTqrykRuMr4hYPb2Sk721cvOOhUXlUy
	yhXz9+Lb2IsSiulVzdoRnIycySfggmpqCpUxM50nFtAXABYDBhlaU+MZT4AMVDcYAez9MWRfm7f
	N3CZ9w5ePEuCUXK+aVdAQEvUZ/Y8673xgeOroaE7WF7//5vEgH1fbEcHYIWB0Q+KNiLFEUxnyez
	D4MdV97XtIJdnad4YY+lsf9A0akmhPy/u0TiFuZ8L00EA7C26nQm3F58EstvLTJNnoIbWOz6OLJ
	jKUB9iX4BqZJeK/h8R1EsT86S5DxUl7731J3TgEUaqzPL1Oop1EqjpMNURMcVmlE0+6DuxcbC8N
	wOLqD0LnI/BV7ANqjDA3ZtLMJKCJofUvK9MR2PtZk8LCPYE0lAwvbP5Qd
X-Received: by 2002:a05:620a:4621:b0:88f:561:d952 with SMTP id af79cd13be357-89070dd72f2mr1010368885a.12.1760963369030;
        Mon, 20 Oct 2025 05:29:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtKce77jyrjI+Q3dWbyvJ8XAStKr+D5wxNDmpYHRE6h3Vda1qthUxSCuU16i/bVy/FmBEyVw==
X-Received: by 2002:a05:620a:4621:b0:88f:561:d952 with SMTP id af79cd13be357-89070dd72f2mr1010366285a.12.1760963368465;
        Mon, 20 Oct 2025 05:29:28 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da3412sm778937566b.3.2025.10.20.05.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:29:27 -0700 (PDT)
Message-ID: <9e4afde2-1171-4cdb-adac-3a496b8c53c3@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:29:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org>
 <20251019-qcom-sdm660-cdsp-adsp-dts-v1-2-9ab5f2865a6e@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-2-9ab5f2865a6e@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DQvHIUf9xK7_z0k41AXstLmyLvc6WM-o
X-Proofpoint-GUID: DQvHIUf9xK7_z0k41AXstLmyLvc6WM-o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX67VcFKMT509I
 tdVfJxputa4PcSzD4VK/fHcXOMvyWErqg8rvdTdBjhGQSxkuJ+7BPsiA/WWxE7hUTQ4rfdb1cXe
 4YTU2RyZ9YiUPKQc6FFZis96S9iQwqhMIKLCQjxl51tU1xxv5yhDi+Q5vcYI1b7ZBVCkUtjT4Bf
 OTqCK0uFHwQHfb6zYS33x5IsjDRaC9+0iv44Xmm9MbBLSCK6LF3X/roo3IBcqa/BezedGJS2tQw
 jW+Y/1XlUtcNjLNOMzdBqYpNDNEvnTJx6cyfcUe1FFYIKXjAi00tWz/XAvratxt/ZDDOAl872zF
 89bH11s0uKT6FcwdGowgZd3FD3i756TroyQ8gj29xJRhe8gqd4SwQnnMSfyn7nxRUUIbIigxRLj
 18TfMsWJR/kgoNKqs4rocaOuOfgNbg==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f62b2a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OuZLqq7tAAAA:8 a=6XgSZUbUjBfQJWIQPfwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/19/25 6:27 PM, Nickolay Goppen wrote:
> This includes:
>  * Add missing vote clock and GDSC to lpass_smmu

This is a separate fix
>  * Add FastRPC subnode with compute-cb subnodes to ADSP node

And this is a feature addon

please separate this into two commits

> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 38 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index a6a1933229b9..2764666714e6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -1217,6 +1217,11 @@ lpass_smmu: iommu@5100000 {
>  			reg = <0x05100000 0x40000>;
>  			#iommu-cells = <1>;
>  
> +			clocks = <&gcc GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
> +			clock-names = "bus";
> +
> +			power-domains = <&gcc HLOS1_VOTE_LPASS_ADSP_GDSC>;
> +
>  			#global-interrupts = <2>;
>  			interrupts =
>  				<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
> @@ -2337,6 +2342,39 @@ q6routing: routing {
>  						};
>  					};
>  				};
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					qcom,non-secure-domain;

I don't think this is valid for ADSP, +Srini please confirm

Konrad

