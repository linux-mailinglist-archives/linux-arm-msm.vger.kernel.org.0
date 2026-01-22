Return-Path: <linux-arm-msm+bounces-90208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKwWHKE5cmlMfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:52:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 994B26828B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B028360B5C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E74329C70;
	Thu, 22 Jan 2026 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dw47YnyJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKK1otCL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D737326957
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769089502; cv=none; b=cbudC5Sdli92K07fHsKdf1/8mpCtkATmaItXxtJJFDfWEigMILigkIwcLz7oaTYiggxdpFGtyB3gLAcD31tr389Daukiys3wID4Wra3rZz+/C/cOtXeXM3VyQHdrjOXOLlqY0WYJQoU8eTMBAd3ifrmx0eQOU3gsV/PVlnGs+iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769089502; c=relaxed/simple;
	bh=zvCB63LFnEjdtIx6luOoekU8E/I0ECmc0pzAnnziwXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EhHVtAsC6si9YjU/AjN1/Mbq+Czt2+aODWdX/sSJuHd9V+31i4KpqrfpF2COm4kdGthLVVwlARTtvWsm4JZG8PjWMOxdq6dqmIbLFKNypykQ/+3k40kr4p8fm1GQaLE3vVlkPYTaUwbESL4WBNMWM1MiO5cTLITX+wNzfh/M9X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dw47YnyJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKK1otCL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6oprM484050
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 13:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=; b=dw47YnyJtrDeJCM5
	wJYJ54TRymRwHwwKJneOJjUCyGQF9JLqOGdsQpImL93qHBZyvkqlUPDhPelYJ38s
	tbxGXr5uRXFVurgQRv2doRWiIMpZIqGI/xpILS9N7kBMyoFnHcANuS/ZuN/GMJBA
	1b1kyc/CycwTZ8q2rKyat7HXK2ebm7xYkIutV7/7UtTZs2OPGz61XZj48PbITt1W
	wEc2uFvBSVorZW9d/RROIUZ/3cVyB4VncWVCqsxm0MiqfThK4nVzdn3c8LDhmXez
	s7AXqXTcGET4VdKqSe9Z2l91enRGMQ7EDr3HpTzEponiD9dyNg7xfYx1NW7XDVWm
	V71cUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj2mwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 13:44:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b137e066so31578385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 05:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769089498; x=1769694298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=;
        b=GKK1otCLaaLaz4OCFytQ7tM+vIisq4x7MexhXzkdrsENx3Z2+XDxqM0K0v+ClJ+gRR
         2XKgOIV+B9QnE0RBglD08z/gjdO6d3dJNxeh++cuOmSYvpyPvj2Wgfb+AExSzD8pYYOn
         nR/QZLYfrduUO9OMSN6B7db6ZQR5jxkOvizYVj04yWOE6uCLBA6U7UYRXQTv8s+uvpgf
         fH7AiFJEqGaP4k81arVO4pcOrxqQ0umUTqZlle/Lg8fmZIX0tzAL1S0oCgIyfI1kTpR8
         dd/YrcX3VBE+GKpuQrOz868SLIo5rcOAaxhZPB0n0cs4Y0P+CwR2JdsqFwK0wfq4DhzZ
         woQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769089498; x=1769694298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=;
        b=rcgGmOyO31hG7UUgeRS64lvX9u/nqaoWENFzXpcRZoQrLYZnTMRopHM0m3V5WVCNF9
         3ulQpBo3ztEFs/7oYLrcg5yccMjOXUzCPbsaIwIyzat3QgVhVpzWMSNhSs134DFuf/mx
         6gU5uokvKg6fLiFIc7xomW7oe6gVwEZqgAkp4yQdysKe48jpPhVOAY/8aib4CPSy5mHB
         aEw8Cgnm3928XoeWxEkJaWxHldb4ADWW1bBhzOt9DfVZaCwWpb71pgHRI4QTId1x7X+q
         lxkiIRzcw7n8m98+xpRvbdoDqpnLF702R1/M2rLV40yohc4sT5b24lMd8sJHGiepMbHB
         VcyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPRYmdAwStzGrb0EpD/D3M4KLunQE5MkSmiGDawD50eDesE/wh6KD1gO4MNH5WP3Dfre7A9L35Fj+UMUkh@vger.kernel.org
X-Gm-Message-State: AOJu0YxT2xk3VhhJmyYXjASF+YgpGs7BYg9Xb7uJXcRbjricjl7l4Dml
	TbHynBWIIAHjpRmGB31MHBUa0MmQX0YqjoJOubgtDn6wEA2rRR5NKXErtnMUTqTa7AyF3V6vn2A
	7y2AIynEF7lmjQEE3OP+6xp9hf87fIb7SadXMBJJYEwvVf2bduwozhzafI1gta94mv5fw
X-Gm-Gg: AZuq6aJfjE2Y6ZQeTHnrYnu0JTZg41grd4eCkfFAOX//ZQ7ichQ4orLgTLsAw/5sgmJ
	03NxuJmVCtYYcjCwxr9Kc8Wpvm1gU/h2cgUZTiSxOw/X9lnQYNtbbhr2qvsecSAqmwFbUL3sFDR
	uxBPwJnVtAkklzIbDOWDjR6jr7ZnMPX/r9MwLhLgYK5zKWNI4wkRCaawpCHfyYbI9Chua53UE5R
	wXJP5lKN4xiw0wOLqzyAUlBCn/iQlnaOdKckGCkBjPn20KTppTSCoWZRyLqkk07KzQzYc/xo7jP
	P7Zh016Xf/JxWIazDaUU25+P8C32e6awjiL8VCVY6/dGGFLG9XjYmB/vIBwC6lfPaFl5igS8vDt
	O3Ghzo7xVCSCwD9HT5+lg7b2zKmPw2xOvTdxmGNdkHhR69BHm5YU3VZzkMh5c50QDs0w=
X-Received: by 2002:a05:620a:4710:b0:8b9:fa81:527b with SMTP id af79cd13be357-8c6a672694bmr2200109085a.5.1769089497732;
        Thu, 22 Jan 2026 05:44:57 -0800 (PST)
X-Received: by 2002:a05:620a:4710:b0:8b9:fa81:527b with SMTP id af79cd13be357-8c6a672694bmr2200106085a.5.1769089497144;
        Thu, 22 Jan 2026 05:44:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65831de21e0sm1129568a12.28.2026.01.22.05.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 05:44:56 -0800 (PST)
Message-ID: <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 14:44:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=697229da cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=fwfv46HyQb7ozjPenEcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEwMyBTYWx0ZWRfX4LfTm3v1DUr1
 KPo0Rae/xzL3TRPcIMV1VFqfuxY2tsSxbWCA517l6/HTVp3Z1mZHzq7g2p1j/2rmPaKrGYz5P0w
 Uz42kmuFXq6aBxUGvl3+lOkZSZJxOrWLca2zu7lF4CwdXVOpa21rka6/CaxmmksSYmlRdPnHtaP
 n5DeZ8AdtHdaN+JWK2yWTRu3sK4b/yrxgvKahIPvgmXFW/5nusDGhc/R9LMGz/DRen/vJ7tv/Lx
 1pldXIq5nyzwpHwi9PMq3TB6MRSFdrZdkPnpIr0kukmXuTfrQy4eHWSn5XFdgkBkGeCKpKbe+fA
 hzQWWWivvfEqBdWxX2LBlFnlD+TMs6cGlOv9aiIdxN49WanUZkga+HPc6cQJAEP4W9Dh0kbap43
 oTwgl0zSCt8qxcPmacwXVx76y6rSMlUbAl6NEx7C3oQ0an4NhhILN9x5vPvb1L+urlWIdhrG/K+
 sF0MCPa84mhc6gto23g==
X-Proofpoint-ORIG-GUID: jor2KZ3O8nxPoDxBa9lzdROFV4KVdwVF
X-Proofpoint-GUID: jor2KZ3O8nxPoDxBa9lzdROFV4KVdwVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-90208-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 994B26828B
X-Rspamd-Action: no action

On 1/22/26 11:48 AM, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

[...]

> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;

Let's define the pin settings for the reset pin too, otherwise lgtm

Konrad

> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_s4a>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 

