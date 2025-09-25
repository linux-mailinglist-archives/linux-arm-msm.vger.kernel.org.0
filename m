Return-Path: <linux-arm-msm+bounces-75064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B60B9ED07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D56C716E387
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D712F3611;
	Thu, 25 Sep 2025 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLmYY9IS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B8C2F3612
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797395; cv=none; b=VNnIrIj8sv0ISr61BqwAv590etgEzU7J4tErBTOG0AsN2J5jX8XyMMY7+z8yYzqWM/mNdI0GAJ+pR0zEKjMSqOJafje4BAFCsekkHdzUf314kwcuBDD5gJsCHZuxZ+VQ9kXfmokCs7Cech3skjzm2SA703cCdk5hf/l+3AYtJy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797395; c=relaxed/simple;
	bh=hNOysRWoNTQ//zrniCV0ThMsJiD6FL10/IYdbR2ZHb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIYz0OALiM1NsdXUSESQlS3SNfutco3vdKXRAkef6/0ePU3GjyryRWJuVEzZvdvr/DqUnqcEissvyap9/JkrUxVwwRiOnHBltVbZjJUV3Xhn6H9hQ2t7RqAS4jRnBbtv2jGE6y7dQR3vf5Sasme1cBrlntUGES+6CSXhrA2K90I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLmYY9IS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P93hX9027919
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h26SUCBcpJnkfQuXjheoV3nT2HRPiqNFhqUpTLbAokA=; b=cLmYY9ISKIY0jefs
	bWDzxN7oRjvnv/qUQ3+25KIJW1Tf2vTt0YcUxr4SX/w1Z1Qk7JuEg06jlh36pxHs
	TW77UDc6SzZP0wqNdaWUCp+yyYOfmDYqsjunwDWFCfQc2amZvqPJNrJ7+ZODpy+P
	VZl01yyb4VaT5t0Q7ZhkBx8/I1rqF/4h6zTMcUZltQTN9RaBHYY9dHn/ceowyypv
	HiysHS+W0MTw/zgbN5tFB2zFxY24atkwxeEsI7/2m0EoIjzvGwDOufbWKcrA5VLw
	3CRbVmBzf8/pYOr1NgUuCT+9agSIKVAp6JuV/9CUcrSmlMsHQgOTqDwJR/LGSpdV
	S755cg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmp05x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:49:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-850dfe24644so35118285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797391; x=1759402191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h26SUCBcpJnkfQuXjheoV3nT2HRPiqNFhqUpTLbAokA=;
        b=XInsFzIXP8kEqYPKeiwmR18My83mZblAx5jN67bYMC96t0IghO2jrwWsgu9GUvaC0N
         t0qniBsGt+2yTdwrtUksc1eTTj8oYMu1jYvk78sjNFVWLsSMwhhPWBrfFjfh3nRUzBZM
         csDYdiyglPp4Z/uT34noPBY3HksO8buVtfLn8YClbZa2RR6T5bdnwvNvg1mq57P8Ssir
         WljTYH6rMuyfme/BmV7Rpfc7rUTRo+/oQCjWu4Kf3gJhW+Twphpb0rymPl9Jlzp+13lI
         ArMcxSXKj7BkhUMBQajAzkxlryw3wponD4RvmsOSchV4N79itYd5CSr7yyoUmPHzVblz
         r/Nw==
X-Gm-Message-State: AOJu0Ywurq1yuW5D6QDZ2OXMsaQKke4mFutW+jn4bjlepBsGhtonqrug
	bVw8rF8nAAok4eHBs7X+r8qYFdaLfud4nxeB/iC2iXCJGtahuBUxCNyBA7GFfM9k0fTRPWGXSmJ
	B+2oux3Po6jn62jCoyaqbzg1s2TFPE1LxupXXm1dchm6r8o5ApssFbI3DCUtBvGmi2W4e
X-Gm-Gg: ASbGnctC1rUXvwRUu0GLVjGLZRhGAIDJIvhEOeBOvzezjZyUAcla0SAwYA3p7H/IiUo
	LdPSCvZmove2oXP2xlnGdBFIa833Gb+shM4Iyz34Bx7OUOLnK60W+4lC8xEmoRLtoJyUQRGupIz
	7h3cJb4yd5ooe6cYPKBKaWBoqAXBapPvLI4ACjnwjh32TdeQDHt1VMD1jcEvyBdRtJso6aj6hrx
	lCOEzyhy125uNhKNS9176RkojfBBccBhkrG8NkLT9p6dMWAtRBGFCvZgQ99DEO07JVByA2jQV/2
	79Q9z8QZG73kbZYJuYpj1KdllZfFRnzhwgmv/2MmKCqKG3yBgdF7mrPYvHjKSpW8Fbsh2sz0jC1
	iUtklFGcbwcuyLafeHcNimg==
X-Received: by 2002:a05:622a:47:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4da41e11429mr24691461cf.0.1758797391510;
        Thu, 25 Sep 2025 03:49:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsRZrwKZiqNNQLYcT8cpG6XBOxHcJOuTA0wdEBBX9lKxQLY+5v2aYZ7WqVEiIAOJD4mjh45A==
X-Received: by 2002:a05:622a:47:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4da41e11429mr24691231cf.0.1758797391042;
        Thu, 25 Sep 2025 03:49:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32b4d71csm16900185e9.0.2025.09.25.03.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:49:50 -0700 (PDT)
Message-ID: <b1c12696-9e08-47f4-8fd0-11e415af187b@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:49:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans: add DT changes to enable MDSS1
 and DPU
To: Mahadevan <mahadevan.p@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d51e50 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VcSkLwEzsjgrpZKnPmsA:9
 a=Hb6oODzzW8XWRlyM:21 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 5Dwhu4hoY9kxwgx60OKHUTzcDOi-TLQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX3fD7Dn2umhFg
 ssZgh3O/JwQ5bEXsOPWaLKqiMACjupzIJLMi6+xGrg57m/+odsKam8lZ50r8/+x5ODNlyYvwnZm
 MrCrs84a6LFLJaGKuB77i0GnACQR3UFrANb2szeA9LPhihKIa2JrC89RpzCGv/s/X25zkC/bVE3
 whQ45t54T+vNFzzEKoIxLYB6pIidTq6LFdDj+ZumEnB8GpSmq9vsvewvyNvmzcvovggNc8WXGG4
 Y7uvln/9aryLFZ7gfbEx+Z/kmfBOBj7SzS9WP1WE6sZsIwLy3HlT7QwZtLwmMgGITo2KX9LGKHu
 NRiYXPUWbt5PX+PjAluvjR09wfcRnX50f0EprJnLFJCebth8zM7r4Pkyz71IYe5AkrKHIQVtbHp
 h+YJH2rg
X-Proofpoint-GUID: 5Dwhu4hoY9kxwgx60OKHUTzcDOi-TLQe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On 9/25/25 10:58 AM, Mahadevan wrote:
> Add devicetree changes to enable second Mobile Display
> Subsystem (MDSS1) and its Display Processing Unit(DPU) for
> Qualcomm LEMANS platform.

No need to scream.. "lemans" or "LeMans"> 
> Signed-off-by: Mahadevan <mahadevan.p@oss.qualcomm.com>

Please include your full name in git config

> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 88 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 48f753002fc459a3e9fac0c0e98cbec6013fea0f..45c11c050d3f8853701fd20cf647aef5c6a9a8c9 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -6751,6 +6751,94 @@ compute-cb@3 {
>  			};
>  		};
>  
> +		mdss1: display-subsystem@22000000 {
> +			compatible = "qcom,sa8775p-mdss";
> +			reg = <0x0 0x22000000 0x0 0x1000>;
> +			reg-names = "mdss";
> +
> +			/* same path used twice */

this comment is misleading

> +			interconnects = <&mmss_noc MASTER_MDP_CORE1_0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_MDP_CORE1_1 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "mdp0-mem",
> +					     "mdp1-mem",
> +					     "cpu-cfg";
> +
> +			resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
> +
> +			power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
> +
> +			clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_DISP1_HF_AXI_CLK>,
> +				 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
> +
> +			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			iommus = <&apps_smmu 0x1800 0x402>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			status = "disabled";
> +
> +			mdss1_mdp: display-controller@22001000 {
> +				compatible = "qcom,sa8775p-dpu";

Adding nothing more but the DPU isn't very useful at all
and doesn't really let you test the hardware (since you don't
provide a sink)

Konrad

