Return-Path: <linux-arm-msm+bounces-101509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL/xBBQ6zmmAmAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:42:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 689E73871B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6D713031AEE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70113DD50D;
	Thu,  2 Apr 2026 09:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHcxWrVy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ML7hzHY0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880FC3DB64F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122959; cv=none; b=CHpmDHxgI6XW231cdkKSWUXO4RF3hgxFLVDa2fJG6RQAbv5kTJ2AD/P0YWaRANlJsMoeP1fuSH18ZHW7uQQkuUxc2tng12IiVYyA9DwMBIUabr5oiOGJq6XJ1ZNTVgmv0/fPnQpLQY55zcogqLEQSYd+0k5kPa2kBK+YzRZ+OMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122959; c=relaxed/simple;
	bh=1AIHSQDdpxGUKF/1KjyALqNJi+6iU5/PYRAkOquwhpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3DA84cAwFxVsn872Jmmfq/Zy8k8bQeBP8SAyuuqkaFKobT5i5XauCfCgXUfj8Mb8uDEZR/Xsk6/PfxS+AM45CVM5M8fGpDRZqVR673OmnpPWeJ4/e58hc/4bukjoxoLXd/Bwr/5mg+kx56y6TXWqVLAmuntm51NtVcxJoBpAp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHcxWrVy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ML7hzHY0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63276ChT3955887
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 09:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWHpdeWbui5Rg3xQQVmOU/c9Mip7VYP/vmE+LLZxhfY=; b=LHcxWrVyEUq00ReX
	MFqLAJz8RRjB9wLl1lQmxzpCpDECONV99OKhRh6JAwIdubx/5MszcUn8Hdia+EIT
	41mdnhiwmYeqbPFGg/oj4h4NltHea9KQKadyc/pk4/zQ5nU+n59B2z06kp0iN2I3
	X/EfgkyhG/04RsDZxYeFUwNTp3aRfLjlASXhshklQ+Dov3gazKaeloeISpmnDtC3
	4CoNZjwh9UX2d2rEAOzh0gNtA41VoQEa/I5sjf68KA1LDQ/G13vnyCP9bmG0k+zr
	idQU72x5OaRUjhFFXwdBiSJxyE0iw9ZE6sfuDdXxj+gAVL/p/SbJJW3R9Gx1QKwB
	NmVfzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5jgrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 09:42:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb485c686cso25496885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122950; x=1775727750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWHpdeWbui5Rg3xQQVmOU/c9Mip7VYP/vmE+LLZxhfY=;
        b=ML7hzHY0LPKdqhVZMUVG35A3Gopn7yO5zO1+CRW+qnithVh9AI1PgDvQ7LAx8R5LoW
         9dsLGjwiXeQZhJtaD7TLvukcSfHnIGez581UYP6NQrNvWL4//XMkW5P/HWOmg1nnqzjL
         29XfaOGpSpbP8Izabaqh11sW8u6eRkgG5Uns5ciW034Fhk+qsam8O3IW8AKTtMGFcC8t
         dzSRy2bGiY/zDqP5/l4vwNIxMjMrKSelgPsrZRe+lRe3spAWtJ2TlBpkBlmbA+9TGcgs
         WZGUWGn3pKrK+OhkX3n7dHaoWnOaPkgtzhgCpSeSTGC3EDMkTD0Efp6sxhMSX+f5d9Dt
         Z5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122950; x=1775727750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWHpdeWbui5Rg3xQQVmOU/c9Mip7VYP/vmE+LLZxhfY=;
        b=gq480siqxbaQ5dGAXJNQJw4kTCReSemwZUCsjqQrzIOURALDhlg6R4KTbJjkZqbD4G
         j/8TxWcsRnBJbkJgaggsl/d6KZ9xJLEIfLbdugRvw8Ypv7RKsD4QBgIeR9zpMru7yvfA
         2OMwxYSU1+2mtZb7NMhjJqHrp/cZMQNTcYavjtkKGganjtuhSNyxO1O7e9Sgs+F9ackN
         H/6BQFTGgQDNSPDiBJvkPn+pKbB5KYNdsshXYTo3Gacdh2kl3TlC/PvOmUeb1bkcRiDo
         kty1lrGrf8jz9yrujJ6xVZcPtsvW3h46T0PRhzxIrCZhRmm3KNlf4nS1vp8h8bNCmHcL
         GK6A==
X-Gm-Message-State: AOJu0Yyrr3JKqcR6sQQM3aEVub7I98NBcewfv+03DndOn9V+99zzg9Ls
	PrSKNvZ7w2PpaNveOZP7htyOHNsdm3VdDiOF7kirY0qpEV6/VKpofplBf0rLkknNKaZjtnLKIMK
	R2RMoIVOp47gwvT6EQW1geIGiAIVPkW4mZoi2c2rw/aS4FP2kZOF676uS56bajlKB9UOT
X-Gm-Gg: ATEYQzzFiR3sTKuP+SiMqrrLTErYiTXqQl6NHxLRaFBnmf0OGA5Y3daYic6wBgRtjPo
	xo3SB52FUXdXfob4FRU1TIUo8alLZi/JgCxVxL57rBQAfLwZYqTfbE6dQ2KtvMo7xqAL/E2al7N
	ixQN0GYu7wm9/ORRQY5TLS6sdas49pT8CklUDIjrR2oTTbl5PqM+h4ZeAOgVIMY+wrKIlvDxsXT
	eBJT7FhK1r8lerEuAWZD0dgPJrrnD6HJYftKMoD7255WYBg5yotpOVWYBariNxPjQE532xvamgf
	8Xq16grO5ispH1HOjbBwnvLi3lLh+dH3EmIv3dawQ16WTlrlmkqHKVCsQzTFdGOAnYJj47xYFon
	bSsXfpsE0aM2vwoaOIjzt9QF9C5cbs75CmEgOEHxJuGp+GaUUIUT0kwNNfkavk4//4Ux29WItvY
	wxhoE=
X-Received: by 2002:a05:620a:4156:b0:8cf:d5ca:adde with SMTP id af79cd13be357-8d1b5c0ac51mr680210085a.8.1775122950123;
        Thu, 02 Apr 2026 02:42:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4156:b0:8cf:d5ca:adde with SMTP id af79cd13be357-8d1b5c0ac51mr680208985a.8.1775122949644;
        Thu, 02 Apr 2026 02:42:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d36f16sm573732a12.3.2026.04.02.02.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:42:28 -0700 (PDT)
Message-ID: <6488e6e7-726c-4f0b-a6b0-2914b04e118a@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:42:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] arm64: dts: qcom: eliza: Add display (MDSS) with
 Display CC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
 <20260331-dts-qcom-eliza-display-v1-1-856f0b66b282@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-dts-qcom-eliza-display-v1-1-856f0b66b282@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69ce3a06 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dN0IigM5nE1fyUEilRMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: KJiJNllDCbc2Q0VjTE7VVy4LF-fsvJYI
X-Proofpoint-ORIG-GUID: KJiJNllDCbc2Q0VjTE7VVy4LF-fsvJYI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NiBTYWx0ZWRfXwUvsI3EVrt3z
 MlS0IaPMQRyEWpfqiLb0Bc7lyekl5TYErVPbP4UEXmXzMjug3x3hAbvAU/1E/KIur7cRiJ+cJMX
 ILLF31z2SNpgDxJS67iq0oy9LJ1yReYectgK5ShBUT+dyBTzAN81kBoSSkKWqx1c/ZjsI2EdAKC
 Wb5ZB0LpI73GlDrO4Z+j1JXQRRB7FPcornBj8+MBTjl8naCak+9wppAIaBCEK0iWswR4anNtyZ6
 f5O3V2ZWfwFWnLceOOyRyapauVQ16TSVw1AK3c8Gc8k8TrvqS6OFvh5BznCv5OPuR684sM/n4WS
 mcQYLmNb5lKGpvuWuaOAUHy6Dh2AK+PT37mn3ZVMdVcWmn9Ign/he0cAFH7rxlT0a1nvjl+YyRe
 S6c/ezmgRYItTeU7dj1A0hhntD/1CekmFtPq2w167xS5QNmkzNHoFAPUIiBA6Y92zfSqhstX9Z6
 DGT6bPCJMoHO8WCDrpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020086
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ae95000:email,ae01000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101509-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 689E73871B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 4:02 PM, Krzysztof Kozlowski wrote:
> Add device nodes for almost entire display: MDSS, DPU, DSI, DSI PHYs,
> DisplayPort and Display Clock Controller.
> 
> Missing pieces are HDMI PHY and HDMI controller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

[...]

> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,eliza-dpu";
> +				reg = <0x0 0x0ae01000 0x0 0x93000>,
> +				      <0x0 0x0aeb0000 0x0 0x2008>;

sz=0x3000

[...]

> +			mdss_dsi0: dsi@ae94000 {
> +				compatible = "qcom,eliza-dsi-ctrl", "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";

linebreak?

> +				reg = <0x0 0x0ae94000 0x0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupts-extended = <&mdss 4>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
> +					 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> +					 <&dispcc DISP_CC_ESYNC0_CLK>,
> +					 <&dispcc DISP_CC_OSC_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +					 <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;

Why the source clocks?

[...]

> +			mdss_dsi0_phy: phy@ae95000 {
> +				compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
> +				reg = <0x0 0x0ae95000 0x0 0x200>,
> +				      <0x0 0x0ae95200 0x0 0x280>,

sz=0x300

[...]

> +			mdss_dp0: displayport-controller@af54000 {
> +				compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
> +				reg = <0x0 0xaf54000 0x0 0x104>,

please pad the addr to 8 hex digits

sz=0x200

> +				      <0x0 0xaf54200 0x0 0xc0>,

sz=0x200

> +				      <0x0 0xaf55000 0x0 0x770>,

sz=0xc00
> +				      <0x0 0xaf56000 0x0 0x9c>,

sz=0x400
> +				      <0x0 0xaf57000 0x0 0x9c>;

sz=0x400

Also missing regs for quad-MST (Pixel2/3 @ 0x0af5_[89]000, each 0x400-long
and MST2/3_link @ 0x0af5_[ab]000, 0x600-long). I don't know if the DPU can
do quad-MST but there's registers..

Konrad

