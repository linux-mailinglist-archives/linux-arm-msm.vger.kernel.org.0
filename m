Return-Path: <linux-arm-msm+bounces-97198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHx1NVSqsmnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:58:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4616A2715F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B462A30715D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144353370FF;
	Thu, 12 Mar 2026 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GHX+lmmn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9D5kGyA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C054B375AC6
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316597; cv=none; b=Sr1QxtIg7/I9CeRKz2ZlmTk0uApxSzLhoSrjuacCToS4uOS6icJBkTr3hpwGuHh3ipLtkObTr0DihbJ6uvdKHSsX/YDAw/NnRE5hMlIKy/JCyRvHmrGm/qU2U/IlsHyBn+rcAi8jxHgCJv4tu+2Q+7wdkkjsrCkNSdrDLsLV9VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316597; c=relaxed/simple;
	bh=Yiq7MaKhVIcsvCWJPAcXPNyHvlc5GtXwTHL0b0+L4EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTluqO8/iLSPyPeR2UroZa0klhV1URaTQoYmzoTKi9X5W88SHSkMHlywjw8Ba0g4PX24CB+5Z3PPOHIRITmUDn6wVgodMMEIChP/wiPB2NNzzZMcOutg/KDqCoF07dUgH4DDeGdiyUnhLlhrAnzeSc1JeQSjLLwcxOOV507hSng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GHX+lmmn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9D5kGyA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAJDxZ1758836
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qyAplPkX7kACDc5uTBJjP1fB
	OnA3ca+udZ7Tm0yU+r8=; b=GHX+lmmnRfO43kLqoMETPIVoAynvuUeFIEb7OQJ0
	+LR7dvL3GMfywoZrm5/8U73Zgzy44NAyovtulhDcRzGj2/gTo05GzRja9mKR1qfi
	Hh47G2cvM4zN7ml1Umjp5NjdE7kz52bEFrzMIpBhypfiZxQqSIy+us3Xqf49B4QY
	sHMzty5XgKNsdMZ//JqpndLatdBanfA4nd4h0a2G5GFANebVk5RmmF9xwYQ1njTm
	Vwx21VDJmXH1rTSGWvB6uUj/HVGJ/89oUPognUEX1Vl+Usi/re46rw23wgL5+3Mg
	qeUKrdJhvuKN7MqIIpIOX1HIIW/OP8SwjS++PsN8kmHDAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53hys4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:56:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd77e5e187so491572285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 04:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773316594; x=1773921394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qyAplPkX7kACDc5uTBJjP1fBOnA3ca+udZ7Tm0yU+r8=;
        b=J9D5kGyA+v3VFAyD6vnoQTiRnDXHpSmm451z7lubQGFKwZ0LSAHPb2lJRTcTbpRqvw
         GtUHADtZQxO4YS3pcLc2cmpo6vLhereqQQB9Ew2W1ZWk8TR5DkiVFJEaa2zn36yk4qXD
         k7BYXOuPJrrdhB9xQ6sp18zp3BcHM4bbbyGStUeaaisybpDtpJvH7OZd1XLxqbkUSgSy
         I11mTVzJcOKn/eEQFszxzqEt5+c5ZOBRRrQrw8/YVAChB5u2a1/vavjvwfoaU+mmJ7fB
         HqTQIRTQQk/tjVPqgZacoQlWn07LXld3L3m8MUpAWBf9ar2Os4b0HTneQa+AZ3KnMiUJ
         bM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316594; x=1773921394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyAplPkX7kACDc5uTBJjP1fBOnA3ca+udZ7Tm0yU+r8=;
        b=aC5+EeGzkbDKyK7oRLCjOV/hlrhzSnB4j+hciyHS83sHjhzonEgy0pDwpESJVKJFCh
         vut/9SGR3BQi0YiIxp7z/RIsC6IzGvnuaJudlN9KwxpS5sSyjdab1oxUNoEhWeMAtjKz
         eYEYh3iLB4YrFNbYxq8qHR94QqwWZvxR3MCciU6RnsanBe6DFPvyoMWCfCnHElYkab0c
         0UhuiVkFqQnd26wm5PXMIg/E7NlZA25tV+02PSVq+sPVgsPW2jiGNBPKHsbSmAgZ4YVm
         a5iGQh5QoEzSsUkCuT8TnluAJqAgTV/76N/F30punrO4SL3wDaKAIJ+AlG+Ho5A/6N67
         wnqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+7adxDTPD3xGH/n4MI4lc1zney9aJX+CQU6W6DMXmIblpFob0h4p2VuJI+9JUp8rdakn19TxJubAW0aar@vger.kernel.org
X-Gm-Message-State: AOJu0YwTvOlhMF3361qGVdTcT5ThpfHFYLlA4U0QMcQFq8vny1mbum2e
	AsuPRk4RJYI4rRy0J0cHvJNixSPB2XHQqchMogsgNfSBqxPHjy2wjGHXEfp8K11J0/4mt06sOfg
	AOhKwvOKc9cERdYo5cQER+cnW5p7JdIQTDSi8+tdlIiilP0CENytq4h8zTm8Ve5kB7ZH6
X-Gm-Gg: ATEYQzyBxJaYhhfrwDH48tQ5Flvxj5chHuM0FuF3/2Nh2us3Hz3iwHweWiWDV4yFkS9
	ibtoHLtW5w/KPpf+kYtf49l9cZRZ4KAslahMRBpHFkbYjlIVAu3Gy/Ov2ar2zuFWokq7LrA86Eq
	/xvtggi0sP+8Og3AOXeW0tX9McZVpL0ER39JEoeLe/LbnQ6L2dwyi7MV7CNHrYa/sWJf1aoUNDl
	duq/b6bizGPIPnqt/oG4I1+MohOXWMiB57xxgjrUa6Oo6W0I7Ocg6HZgKoJjFHuSXxgTyuPhz7l
	AZBX9/TOiiiGWRR7wTxe+8QSaYBp7+nVmJ1DVGwZAkldQBmCD5TvokYY7VzkWLGBM0COVSNPiyy
	nzo9dTn2BMyq92RpSYMBr9MbVufYTQDMTmQ==
X-Received: by 2002:a05:620a:298f:b0:8cb:5176:ee5 with SMTP id af79cd13be357-8cda1a55954mr720884785a.62.1773316594092;
        Thu, 12 Mar 2026 04:56:34 -0700 (PDT)
X-Received: by 2002:a05:620a:298f:b0:8cb:5176:ee5 with SMTP id af79cd13be357-8cda1a55954mr720881885a.62.1773316593532;
        Thu, 12 Mar 2026 04:56:33 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fe27sm133395215e9.9.2026.03.12.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:56:30 -0700 (PDT)
Date: Thu, 12 Mar 2026 13:56:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v4 1/4] arm64: dts: qcom: sm8750: Add display
 (MDSS) with Display CC
Message-ID: <t5e6iw6lhbig4mub3ot4jofcbeqvz7v2ncltlorsun66pqyxvr@3g4acm5bi3ga>
References: <20260310-sm8750-display-dts-v4-0-d571a786bb70@oss.qualcomm.com>
 <20260310-sm8750-display-dts-v4-1-d571a786bb70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-sm8750-display-dts-v4-1-d571a786bb70@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2a9f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CXLNfupebYwubX7vOpMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5NCBTYWx0ZWRfXxotRgW7Thxqb
 /Vy3vaZPuZoZ5tsBuKdimAdlzudu8lMHZYkaJIqk4wlC0muLAUCY+NYI+9rn+ahzVIhQwZjYK4s
 fmsjhltbFO4iZoiOuhjd+NVymMOAKy52roIC2ULZQSvxWG/99B/HkbXlTt6uMQf6XVTcHd+yLYl
 0EfO4r3rJKbkcmV6FrrpMoZoYRLu7yso5uhxf3Wpaj3XAmFiqo8xuQ7hyCaTf+4j8PPN2CuULNc
 zX9WQIV8T5gqhmVfsv3uYh4FulUdrlDJ/3MBeCdG2CwwHOAaTXb3hzhieufpnGvgRrw5b7hPkAk
 GoZ1boMIy9I4E25TgeK/yf7xHg27tZN9/42l/ZPhji0D5TpAwksQcs5P/0g7mAfzgF1Z+/kpRLe
 ebvVFUIvKRA5DXHYeeu+3isf2jTHo50ndI2y6PBDMXocfBPEAU1M7S98745c+Rx7G5ulv87dWnp
 9lGSgrgb9Da8HtOLcTg==
X-Proofpoint-GUID: _q4AT4dOWG6rHA5U7VyVtOroAMxjSxJ7
X-Proofpoint-ORIG-GUID: _q4AT4dOWG6rHA5U7VyVtOroAMxjSxJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120094
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97198-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aaf0000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4616A2715F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-10 11:09:48, Krzysztof Kozlowski wrote:
> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
> DisplayPort and Display Clock Controller.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 437 +++++++++++++++++++++++++++++++++++
>  1 file changed, 437 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index f56b1f889b85..82963f4a6a55 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3,7 +3,9 @@
>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8750-dispcc.h>
>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>  #include <dt-bindings/clock/qcom,sm8750-videocc.h>
> @@ -3001,6 +3003,441 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  

[...]

> +			mdss_dp0: displayport-controller@af54000 {
> +				compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
> +				reg = <0x0 0xaf54000 0x0 0x104>,
> +				      <0x0 0xaf54200 0x0 0xc0>,
> +				      <0x0 0xaf55000 0x0 0x770>,
> +				      <0x0 0xaf56000 0x0 0x9c>,
> +				      <0x0 0xaf57000 0x0 0x9c>;
> +
> +				interrupts-extended = <&mdss 12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel",
> +					      "stream_1_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
> +				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +
> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-192000000 {
> +						opp-hz = /bits/ 64 <192000000>;
> +						required-opps = <&rpmhpd_opp_low_svs_d1>;
> +					};

Drop this one, please. It shouldn't even be 192MHz, it is 19.2MHz, but
it isn't needed.

See here:
https://lore.kernel.org/all/taqh3ipe54cgjwcvyqnysg7dx56mweo7zld3jvmv6goq2vo4b4@ea7ksdyyn3dh/

Best regards,
Abel

