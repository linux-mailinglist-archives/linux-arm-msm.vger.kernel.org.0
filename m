Return-Path: <linux-arm-msm+bounces-114771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uExYGk8VQWpbkwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:36:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E50986D3CF0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:36:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ag+mJwv6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kLDAZLY7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114771-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114771-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E8DD3001470
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 12:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500523A4274;
	Sun, 28 Jun 2026 12:36:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4EE3A2544
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:36:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650188; cv=none; b=lSy9RfdLnJEpHCQGzHJdxUx13l26UiWoKtJ401m53HPp++b8oa+yRcSivK6c31iIuOBa7HTv8rB4XAPqVjTLkwjkrqULh39imDhJM6+q/sxwXfttwSh0MJs9ixxoYA6mjxOif3PAKiuuwb0wFZvFfOjY+tbklqfrpZjmDMUhxX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650188; c=relaxed/simple;
	bh=8WdwCDOAdxTlw0jp7B3yLA2x3+Wn7oqfprfw8LNjvQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgdE4+Nb317YMMK3tGL4kspeEILcASmlS/4CttAN+oZYpGL6f2MVQCGx3RmLm/kAgnK24gHBUgZ6Im4p59de/tjmbyKM1WAhhLo8KgndVZKJ5Il/FynsVJTcN/LcukKdn9IOPyeAgWZAUYlo09zwhMj1118SxUQY3zJtdfURd0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ag+mJwv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLDAZLY7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9OfKs3589562
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QvGNDwVdi08g64ZU9YF0PBq5
	IxE5SHw96hFN5wOlbfs=; b=Ag+mJwv69LASJJsdLD5MusZUKWnJ3XoQJy/AzpAo
	1/NBIyvF2AZ9ocGrpw2GNUgCtllNOMT6bxyMQ3GKBPy6sVDj79QDHsanKYVN7rGy
	1zIP2yuCOPODKa7aGNDHUsUrhPUf4yCaG+ivmVp3qUMCNiTrYqgJ0zBB1sqpf1vT
	pLVr5lsvPICA0pa104fhgJDd0ur+nCL/+6BAg1FSD7ElwqPH7XYa5Ka6PAmNBCUj
	d8OxC5Vf1f1QNKo/USDlOQMx4rIxBHeHwOOnu7ZhpSk9KHu+0U4kNoH6bt8FbvME
	TqS4gtc1yeEhEpSYuszVGGH8mI7SF63XsdV30VkHD5njSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf2rw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:36:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b8fc5cc89so290939685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782650185; x=1783254985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QvGNDwVdi08g64ZU9YF0PBq5IxE5SHw96hFN5wOlbfs=;
        b=kLDAZLY7Ui3/nk49XUF0OaYkuzGmELm6LXcH2U4bYjtkb8+lvbeKA082SygFGMUsyL
         xPGoeIj8EjShz917qnpTjwhyIwHrAiwhUgroDDDl3FD6ueeVxQZZ3u04BdAiKY+dx77I
         AIsIZ/gIrK6rTyiiSYfG1qP3O26/O5cmH0ZqTEguNzhGKgVC1f55aOc8ybxOVzWXCm6j
         r0XHyUh/LSuNfepLHcmcNmplEix2cWJB7WfNJxnItEjLpuEMPdADYqx0kj8aRVIT9PrQ
         p3t47sNNAsNVpopQrqeK27LrnqSuNuZizt5DzScf2PicxFUgizIsV5qQBVSNed1ozPHL
         M6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782650185; x=1783254985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvGNDwVdi08g64ZU9YF0PBq5IxE5SHw96hFN5wOlbfs=;
        b=Q9jjtAuoJ3lOYywYYy/oshjy9VvjTNgvgdYwXnSuX7wCvU9tc82TwAoVsR2am/c1j5
         yxdj9D1QrCWbg6l0/KHepX2BA3t8sx5etWrFPW0TVaw0H0btxzO4k8XhwH5r7pTIoPq7
         5nMOauI5AdZIJxLQpLgnKbYYY6RP13T+VIESGHrcv+uXquRvjzPkpBWjZLBhD5P4zhw1
         Tj8vGejcF5CFARSMWWP8reKJx03hl0+Hc5DEAHkedsn4OPEqGWXpEY9zt9Nv4FgAMT4A
         HB0ieOk7qLc9mLekvYL73yfzgyUOxEP8IpoeNC27ZnGxuiJuAAyURlvl8pL9euX+oCsD
         wFIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QgQQ850bKJLugLrjQp3l0gBdFP1eAwR0lHYkRq+a7xdd4Xmy3IgS+f/lqiTgwPHUBg/H4QpWX7eZC8TVt@vger.kernel.org
X-Gm-Message-State: AOJu0YzYdH6DprhnV8ncxAZwX2mcWqxKT3OxKDSosaHDOQVEd3iMUO6S
	ihgr9XYn1GKBxqjpscbJXPU8hDfMfyOZutqvyEN8bsRWTzhEQFDg+iY5o37hih5qsX8n6NabzIx
	chS4vBU4jnNRmU5hNZ4UxM0w/JXVE//Y+EQRNGtqA6EUCVd7K85fx562Y4fW0UHcGO28X
X-Gm-Gg: AfdE7clNJFSBcfqtWTbvs7wNIzQBfJ2QZEbxYGl7mffMauJKxIkNIP+JMXkimMZJiR3
	Ml7AtegjiEPbjf39Zonq9SWWV1gMtR9YNNejBSrxSZAE1A5TEBFuGzdDMpAkIgMpYGLDeqwTvh1
	VZzbN7DXekY3PLlBWMH3NZ6JjZoqRmIIEqcnmBkqzOolPjTcE6jUzXXSgfYTFBaMoPQHYbPIxd8
	iK+SRnmveHmlR6Mhe/3pd8kMGWDj66uOSGH2dlY2vCKXBqCyav54gvTQHKibkbacxIoea8hwaXd
	L1PYAKH3lOHKuTKnNE/271nhSyDjW5zJQw2xnxeKWF7PrLiRxdMcXOBrIiqPFJ0ziPYg1CjFBYf
	4ox07qyZKzzVRnuiyce5iMcrLabmDux8MvAXwsEuEySudbDwWNerEJJeTsMkJ2ThKc3f7dsTvDp
	H6vA4C4x97KtuN02mz+bSPWZ7t
X-Received: by 2002:a05:620a:2a05:b0:92d:6961:9524 with SMTP id af79cd13be357-92d69619913mr599481885a.69.1782650185168;
        Sun, 28 Jun 2026 05:36:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2a05:b0:92d:6961:9524 with SMTP id af79cd13be357-92d69619913mr599479585a.69.1782650184715;
        Sun, 28 Jun 2026 05:36:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afc749csm71506771fa.12.2026.06.28.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:36:22 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:36:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Subject: Re: [PATCH 4/5] arm64: dts: qcom: shikra-cqs-evk: Enable display and
 add ili7807s panel
Message-ID: <6qf7fau4yfmyl7qaecwxbj6kegyawq6euovi7ewwuki57gtepv@57vioqyiladd>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-4-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-shikra-dt-changes-v1-4-449a402673d0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMCBTYWx0ZWRfX7FI5vPZWXonU
 xdMxf/m90g6uGTRB+JzM57qQWbS+to0FnBhiqt3y/brJMlCIxiFu2Uf0ynwT/RCIRmRaUHgSOp+
 k4ozb66pzgBX9bsbzgvB69KrjEwaoWA=
X-Proofpoint-GUID: j6egDmkeE74CnvP7Kpnfev3wZmLqjcox
X-Proofpoint-ORIG-GUID: j6egDmkeE74CnvP7Kpnfev3wZmLqjcox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMCBTYWx0ZWRfX98G5cuDhqtxc
 njwBVD+7krZuoSo2eAbYtF3sPjpMo8SiCr3zSfi15Rs5Wtnegq7Ivb8XgfvLpFNsmRoM/+7ms3h
 COXRjDnKPYW4FBGUoNLmgabswYO4O+Vxb0ZWdCT6mIdRvSBr98h9DpszEvKlbci7E+st5vgUNbJ
 jPMcmnfMJuBMzU1WerDmLBqJ0EXbNcH8IU3CaaglRSjuyoSrElDfT2g2xTlF/n96826uQnHAc0I
 kb2xzznJW9jUmbkaMU56MGaeZHpavzAYaxaQRCE8OX2bL+mw2jxxaMJWhlRuFvPh3BAVzk354iB
 NLr43c6E4qzbehn8cM7NNEZqMa2ur6RICuqcHesr8USPq2q4/N4PMnS80vAkrrwKZt2tSJEfvB0
 0L98ZGUpmCuczjNOyvRJec6fzmn8Td6LyLoyclR4KiI+ivgSLP6LkzD2X0nQTLWxxOUtbUR2/2l
 x0FugCwaI4jiUrqA/3g==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a41154a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=zkD0J19DHjye1_UR66kA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114771-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E50986D3CF0

On Sat, Jun 27, 2026 at 03:31:38PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Shikra CQS EVK
> board and add the DLC0697 MIPI DSI display panel node.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>

Missing SoB.

> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 104 ++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> +&mdss_dsi0 {
> +	vdda-supply = <&pm4125_l5>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +		vddi-supply = <&pm4125_l15>;
> +		avdd-supply = <&lcd_bias>;
> +		avee-supply = <&lcd_bias>;

The same question regardin AVEE supply.

> +
> +		pinctrl-0 = <&panel_bl_en &panel_rst_n &panel_te_pin>;
> +		pinctrl-1 = <&panel_bl_en_suspend &panel_rst_n_suspend>;
> +		pinctrl-names = "default", "sleep";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> @@ -116,3 +174,49 @@ &wifi {
>  
>  	status = "okay";
>  };
> +
> +&tlmm {
> +	lcd_bias_en: lcd-bias-en-state {
> +		pins = "gpio151";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

Order by the pin number.

> +
> +	panel_bl_en: panel-bl-en-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +

-- 
With best wishes
Dmitry

