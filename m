Return-Path: <linux-arm-msm+bounces-95755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO//Dtuiqml6UwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:48:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F5B21E331
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A26D30B3102
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB813161A1;
	Fri,  6 Mar 2026 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ci4e57cD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpkSIobB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190D633A9F3
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772790142; cv=none; b=XipqOJIfi1Ocjjq53XFQPzyMRUGHejB2dGzt0Bgks8E1uNaRmnX0M6Wghh0ZM1h/w2VWMq+yzBayX+0OkLW/g03l5lIj6AUNIjxnaY71INg12i+K2JMnAiJpGz1ay/3r3zisHjVSkXNqqDbUK15FnT4K1+dqne1uuk+sceW+lcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772790142; c=relaxed/simple;
	bh=Ba68yWy5dr1kzrzzbJuqaw37mZYPkH/B1bIv+NNdfxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dc5WGKmqIJyTa+2UVqVYf0RWYdl/7ddBmZ/x+XAS8FSuO6c7zKGoUj3LANPUfEanExIJOaHN/6wXAsoZZwGPJKZEJ/xOfZ0v7l4p7S1MoZL4MdFI0q7VzMfyWLc4nENA9PlCrjz8sGprFyQ/G5KN0GFSt5N/hopxdEJtO9Hwn10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ci4e57cD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LpkSIobB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264a49V3296744
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 09:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pzwPQTHuxnVdoT18Uo0xga7o35yqXSFkdotlJjxSh6w=; b=ci4e57cDrxDto26I
	RlZq3vb/GGOCTC09T/ZVOovWBzIZzCcWGLu+yYNIMOlDmXrqa7Zc+Uio4TAEHyGu
	7bgQDCNk+rPf/HmVuh7GYN6DqKFSoT0N9FjU7CecQh6TCpC3X7uU/+134TYNgCsN
	GyU9+MKf8TYQrRjAMvuO5OEFS1yRxE+Ic17RYWQTMLYcV7+rQhKDyUjj+/dHbM/L
	Z2bUzGPF7wFx7lwHgbYOtt3Q4UoaurlWS/oprf4wsXfZee6uPno9VBd/LUG3kZWD
	CMSbNd6rF1S8DjKgybBLV+k5CstCVqEvusiravCNXUy1CK33fbO4o8IkHgFVpX7b
	kRrIkQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxds79k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:42:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8298150caddso1574828b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772790138; x=1773394938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzwPQTHuxnVdoT18Uo0xga7o35yqXSFkdotlJjxSh6w=;
        b=LpkSIobBJQ3T0ZdwHmvNxqoV/GjHIdj/uLYHOoIHkZ5B4dFmrlewrpMGH0xSE0TdMe
         NjiS19BBTuStNjSkxBHHMll5Izm4bMePewq29no2Gs4J4TCvXEggfolg93iSYWlsZ3sw
         HbCwntXS4cFDbRMTRIW1a1E/4TyIU0WfNoFK/yQHlHQL0PHjS2TKLRQStWE2sY7iVs35
         IJ7GuuGQkpAvOIkD7hLSTvoB6dR0Pt1SFvfnLq0W6naMPbjR47+5YSmHHoLuqvtgx/7S
         fbM9boRIC4sQuznG3Pg0s/KD1W6EF1jC6fuh4vfAawkxyOQG6tLj559uzfGh+IjC3NY8
         /7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772790138; x=1773394938;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzwPQTHuxnVdoT18Uo0xga7o35yqXSFkdotlJjxSh6w=;
        b=kcTAPkeslWyN26mqNqcHj2ZnjK0f0fMvvJUWpjFty4hff7+/8UUf1GjL0DD3u0j9tk
         MQnrc9wJmpb2BOpA+Xd9dH0kuEMVC4ri4e0WTpCfLnlZ2EMWQ8qI5BKc1pXKs44dWVvF
         iEsi0d6Mpgn4ZamD6xo22FWObaki5QYhpCIcC6pJdUtzLQGJKnRg3V3qqL6uf1VF1Mwj
         rGrqjimPNe77zPJ4QelrglM5+UScF482aWDy9uqtgcFf3D1EtnegQMlRTuUMXrWmHIok
         5ggvgLLBWtWohavyKMIG6g0G+DAtrrtlW3AfAw7WFurCfY6s+rZQlMSEMxSHiBzorOem
         jSZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWudNvQ63aBuwsHDKj2dyWHeKc8mmN0QNMhhZmbPct2tROqlEatRWdeuDlarU1MPRddhwQ0FBgHGhpKO4WL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/myzs3kVI1fX5iPjH6vHIN3gxjn362O+cqrTkK+n5OyBrsui0
	jfc/y/1cc6DrBEKg/lAo3zvfKgAUh4V+vMZ0JKoUvzP00M1heZRO0V8+20sJQM7W7fHbW4sU2yK
	FkPHQarESAmkCxdEbhDEZaaHkPmUEW16ZTnOO4M1zxKU8l0m2Xg6LcFC4bCh4U8B6JYaV
X-Gm-Gg: ATEYQzxXzJPhIyI7xXqWz9CWSqbpGr+V+WylzkTYEEa0caYq8/aSbi3Xmk7WabmtFGm
	q0zwaq/kLDsbHR8r+OUds4GR7F4jQICttz1+fCVq39ej9FB64qsAZusTCW0DWvgi1MG8RG+yQHh
	EOuV9OrttLXHxSckv3oGNmuIoSpi5mJiicVlUFnVfak79mnT3VCP7CNhWvZouXMfWML5eNVGjop
	gtJoJnjVcpl14FroD1x2HC/3CQXFa04EIoPBtSA272PY9TEa296Q8ikuqFyLaTnqFvh3IXf4ntY
	y7US+ArKddEfnxIpQt3S9R98xfwaecMpdVbt9EU86HXKC9yeS3Nf7AP92X+22CWVuYXhjc9kzUC
	7+C0MYZPXPZXMOpz14lKM5oK/awxRrNXJP5EzZCdbmTA0kw==
X-Received: by 2002:a05:6a00:b908:b0:827:32de:d197 with SMTP id d2e1a72fcca58-829a2f4a13amr1306313b3a.40.1772790138516;
        Fri, 06 Mar 2026 01:42:18 -0800 (PST)
X-Received: by 2002:a05:6a00:b908:b0:827:32de:d197 with SMTP id d2e1a72fcca58-829a2f4a13amr1306300b3a.40.1772790138033;
        Fri, 06 Mar 2026 01:42:18 -0800 (PST)
Received: from [192.168.1.11] ([106.222.228.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4657a10sm1096879b3a.21.2026.03.06.01.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 01:42:17 -0800 (PST)
Message-ID: <d313f7de-4531-42b8-b8df-ce8ffdeffb4f@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 15:12:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add support for MM clock
 controllers for Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com>
 <20260303-glymur_mmcc_dt_config_v2-v2-1-da9ded08c26f@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260303-glymur_mmcc_dt_config_v2-v2-1-da9ded08c26f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vZ4eE1q0OnFTFiI-5LOf1zKeHV0qOaeo
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aaa17b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=uL+hpB4jSAN/g3a/thif0w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=P36qcxhMMR4eMPYwPxAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA5MSBTYWx0ZWRfX8jr4HD9/JoQ+
 enDXZZ8CaStbJYHUDR6eZ9H/CANr0LG3sF1n+HBR3kwGwZsYR4Ffyf4WlKotjoVOd6s9ITk7Vv3
 7wB4EhiYyeGbmeihT/RSs/vPAqGrlsSYX3Mslbf659rOjdXX/nAwhBJTKqgWa5xm8UQ84x2Kf+W
 g+e5TuO9vV8quXaJZqKiq6Kxtl+/E8EyJQPN1HmQDZ8Y2DZ1u8bwo69Fpo+chNaB1S20Rntv6xe
 vhXIgJcHUQdh3KYXuaIppNHNAZSb9neQqmH7j3wgvOfvEQkKYG51xMqm6Xd6Doi8kkdTT3g6x3y
 z43NqLpJZY94Guyi2DajbPNdoZfGE/iNTTKuAeuKZmgKJzZjGxDQUDaLJft9cPFHwYkxwJUaG1P
 cIMkCTUd7tlek0m7CpuRGyUCeHqr+PETLV+VuMvlMcy3R/UhWhQxoy3IrvJvwAFIEp3vL4MvE6N
 G2VM+Uar1kepFaMC1rQ==
X-Proofpoint-GUID: vZ4eE1q0OnFTFiI-5LOf1zKeHV0qOaeo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060091
X-Rspamd-Queue-Id: 86F5B21E331
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95755-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/2026 11:22 PM, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers videocc, gpucc
> and gxclkctl.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 42 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e269cec7942c85447892c0661f83171eded94f3b..d9c37f43397f11a527279ee778769a2f09745bd5 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -5,7 +5,10 @@
>  
>  #include <dt-bindings/clock/qcom,glymur-dispcc.h>
>  #include <dt-bindings/clock/qcom,glymur-gcc.h>
> +#include <dt-bindings/clock/qcom,glymur-gpucc.h>
>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
> +#include <dt-bindings/clock/qcom,glymur-videocc.h>
> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
> @@ -3335,6 +3338,29 @@ hsc_noc: interconnect@2000000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		gxclkctl: clock-controller@3d64000 {
> +			compatible = "qcom,glymur-gxclkctl";
> +			reg = <0x0 0x03d64000 0x0 0x6000>;
> +
> +			power-domains = <&rpmhpd RPMHPD_GFX>,
> +					<&rpmhpd RPMHPD_GMXC>,
> +					<&gpucc GPU_CC_CX_GDSC>;
> +
> +			#power-domain-cells = <1>;
> +		};
> +
> +		gpucc: clock-controller@3d90000 {
> +			compatible = "qcom,glymur-gpucc";
> +			reg = <0x0 0x03d90000 0x0 0x9800>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				<&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +				<&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +

Missing power-domains and required-opp properties here.

-Akhil

> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		ipcc: mailbox@3e04000 {
>  			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
>  			reg = <0x0 0x03e04000 0x0 0x1000>;
> @@ -3367,6 +3393,22 @@ lpass_ag_noc: interconnect@7e40000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		videocc: clock-controller@aaf0000 {
> +			compatible = "qcom,glymur-videocc";
> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>;
> +
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		dispcc: clock-controller@af00000 {
>  			compatible = "qcom,glymur-dispcc";
>  			reg = <0x0 0x0af00000 0x0 0x20000>;
> 


