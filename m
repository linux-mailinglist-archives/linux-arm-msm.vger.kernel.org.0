Return-Path: <linux-arm-msm+bounces-93865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE5AFQEUnWkGMwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:59:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA23181363
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EBCD305557C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 02:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031C02749DF;
	Tue, 24 Feb 2026 02:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FC3jOK/E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ky+cfLHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1008B7E0E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771901946; cv=none; b=CzEDA/hRZb6j15/OkFNoDv/yZL1h/0P8qUAuhxNu60xJAi0izT8p8fisVgz6l1YbOJwaS3n/5sjkFFsXuePOyk97vWOBv2qwtjc1hugzX+BXN0uP5prD4Tg3q/TofDxeNTqT+asRO4jKNH5ChlMqZlonbcmAyC7HqzxRpDls8l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771901946; c=relaxed/simple;
	bh=5eAj7fmbcaC0Nc00BluouQmsCChrDict5nRZVu7zguo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prL5euX2wFh4887y4nJiRMk83lFwmNw/IGj72wYqHCvw4t1uMLheCEgzrh1DafoUq8GGloN+SGt7x/S34Aq/yerI1seDlp/T3OX0vy7IZE2WfqSgnna4/xt7slQUKwCt3+oY4pgcBLaPI1MylA0xU+JXgaGDl9mEIFGKryN8GEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FC3jOK/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ky+cfLHO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O2loRj2927454
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NHiMvAW2njVfCIUB0QIs2rUD
	qnPl2wY7CxbqSnIJ2tg=; b=FC3jOK/E5aMH3e07E6NMn9JODjM0XEjCem465eHI
	BETptBwfZd82dlfFOlrjtFA/yL/UBYvEncIlVxj60AeVcKeQxHwflK/eRlO8vzM7
	z8VgseGMNND2wftMDZpeu/wFkW/cLLH/OE60TWL5bFDqTstoOXEBTGuvqDEdTfLd
	cghB4s36c8RZZoB2eBcAzoKyIVRvdeMTik8Ccc+7B/qDNeDV9JTQpn7L/gb5T5rJ
	xx008bsmr1FMThlM/xU9hcs5HuTzLv5RvUgBQ9+H7EFLdLHt4I39hoBTiU6q+n+O
	Malg5BOQYY4hqwSQ1zAfz/MUQdE7hXhP4PBoqtb0jHgvYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8sjqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:59:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71500f274so563571485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771901943; x=1772506743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NHiMvAW2njVfCIUB0QIs2rUDqnPl2wY7CxbqSnIJ2tg=;
        b=Ky+cfLHODG9ev2IqMXuCEk+s/7QTgIj2FpzXUe6St/PQ3FsLoE48X/xFvV4MTuTpRB
         snOqsAJkq2eLpkmEXM0dNorSpHcnRj732x39EI6AqRD+f/fzLLUw0mZ2WWmJmC9t84hL
         Gv22lJBt++VVdRqXyk88zHHM+fAwqZvpTUQhmjvFUYP2El9IvFBa1MkytMcfyVOZqwO/
         2ynSDHCbxOHcB7wCcTI1YtAfU/F0thHocpmXlcPAqD+z1+ZbHP71DLk5F2OFcSd+cs0A
         I/fg2v68vv7cQ8wdSva17ingvfZBY1EvAEIAsdvFp2mnB5pxorrWSlXsQ3dzXM7U5Fra
         COeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771901943; x=1772506743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHiMvAW2njVfCIUB0QIs2rUDqnPl2wY7CxbqSnIJ2tg=;
        b=jNgDgW+de4/RU5n69RCx/OIa7mFi5MTeam//a50VcCit7+q7dDBah8/X8VukgTdmR+
         0zYTUXu0/qTdVpMYU4N8nGM5jJhM06ODF5LoxgA9A781WkuYMgI4ON189NVh0rIQb+Vu
         RPBPZkk6eD+DlMA/RCUl09hR1CgACeH3h3mdRXgqFZEvAi+/ChoIrxvWHoBZWC2doUC4
         oGwzRM4gcuCEzRaLPVhOfQ3sIukrrP3BqHHGwyl3K7emfTLOZ50+POaov8rkBe0O9cj3
         QrYi+HO9DR1X+oJ43JAKvEP8DzjEdi9bN7JCrpM2iPophVwQwgOSb10kgA5a8YcpoUU6
         Q3eA==
X-Forwarded-Encrypted: i=1; AJvYcCUl7T3UWsnQvIqWluDaQfhf5vgHSzgXIpnkO/e3a0ClyuX8uGTe38XnkqsiRCuy8qbKty3MLZDIECMJcdO8@vger.kernel.org
X-Gm-Message-State: AOJu0YyJax3LB+LJRCMAv2k+l3May+nnelRV0gPjc0DLdb3KhdmbHsU0
	JPLCKfmKRnUY6C5E8SXvEtxD6z7QrYRHW1mhz+o8cnbYW636AO82byYNlOxtKkXZbUE45FSeveZ
	teLtHJYxe1LRcjpS+3Dm9k3qmTZWEjl4YTdS9lR0HEeLizdDjdM4HBYKGSAPdGyBc/wUg
X-Gm-Gg: AZuq6aJTTT8TlpoEYvIWP7gbKuPny6wzA2Bl+qGODZM6MFBpm1sXwlKGEGJjcG8Mppu
	wHJ1RIHPBTivv8Pr7Hup4d8Q7EVNgkfGbbmmni9hxczYQTNwffbYk2iec2klHv5TvyYDt0W+0oE
	Z1svIEQCUnhIJCd2GbPF5wjjgK39B9OkHUc6r+tuXLa5vbfw1ljlb2vAOU4huLH4cg9UAZXSAKf
	oNMWwTfWK68yK13VgbxbzuR1S7lK+IaBpSqk6BquNK9Aq9mbHoekKWKVBWxA0U1vLTA+t2zthiB
	S47wWXG8zQRc4iFmhncTchQUKpPjbnYc7KIiphwjLyZGRJKa1/zvSD7gmSDGx8hlnrEV1r8KjsD
	RrDLc4HOojm+2ekVt+VEMTJzjjKI6lF5pcBZZabE2wA9JPI717dRmVdO9iJtUti96hI+M+/nBRR
	vRil5X9pEq12v7pijOsEKeiJuiGORWnuNAkco=
X-Received: by 2002:a05:620a:28cf:b0:8a3:90c:55fb with SMTP id af79cd13be357-8cb8c9fd142mr1275952885a.20.1771901943314;
        Mon, 23 Feb 2026 18:59:03 -0800 (PST)
X-Received: by 2002:a05:620a:28cf:b0:8a3:90c:55fb with SMTP id af79cd13be357-8cb8c9fd142mr1275951685a.20.1771901942822;
        Mon, 23 Feb 2026 18:59:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7af4da9sm19734671fa.43.2026.02.23.18.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 18:59:00 -0800 (PST)
Date: Tue, 24 Feb 2026 04:58:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: agatti: add LPASS devices
Message-ID: <gmmgxlypuvagcyvzdfitovju3oyq3th3mmwzda352i5gosxllr@knaapl7ol57f>
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223133950.221234-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223133950.221234-4-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ks5i48Q0IE-Re0O_0A2I7Y6v348IQU4R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyNCBTYWx0ZWRfXy0ssgn9aB2lA
 8v/2sBtvzAEacpVWeUSkShL+xt1kjq7TgcupeOXyQHQBYFjXVEdi0CpWt/LF+TzLKU5QLn84tDR
 MPDVlRvAZRVyhGCodIw29rQUKDCNCCQ+lq4O4ufqo7Ux/gMKfaYMFWdk969DHYQNUHDDJ2CFic/
 ZYJalENQqCtabR85/xeb/PuuklDkBMggVFKv5B0Ds52MdCksZfgqLktR1xX+s0KvAD2J1PM1fs0
 J/4a9DXUmHzUp/2S75FEie5WsBsez0dPIcDe9peK8DFvdaBDgBSZM6UYQbbTAerrGwColcj1NFr
 rmKjsNuXsormDhNAhCNiH7qCSASHnUyUSx/P2TgeePp9W1vgC+BBgd4Glue3rDIOG+tKi2YKBJU
 CD35H3STA1vGpbMRjFHIQPcj1ZyKDwxlj5qIWIEQqHpDzFapDqhBsZUBG63CFunmZYxoMe8toHR
 ju7gZ2iOzXl+P5zP/ig==
X-Proofpoint-GUID: Ks5i48Q0IE-Re0O_0A2I7Y6v348IQU4R
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d13f8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=TDFUEI97JGkJoDmUmkYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93865-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ADA23181363
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 01:39:48PM +0000, Srinivas Kandagatla wrote:
> From: Alexey Klimov <alexey.klimov@linaro.org>
> 
> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
> controllers are required to support audio playback and
> audio capture on sm6115 and its derivatives.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 167 +++++++++++++++++++++++++++
>  1 file changed, 167 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index 76b93b7bd50f..e59a1a87ee0a 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -758,6 +758,42 @@ data-pins {
>  					drive-strength = <8>;
>  				};
>  			};
> +
> +			lpass_tx_swr_active: lpass-tx-swr-active-state {
> +				clk-pins {
> +					pins = "gpio0";
> +					function = "swr_tx_clk";
> +					drive-strength = <10>;
> +					slew-rate = <3>;
> +					bias-disable;
> +				};
> +
> +				data-pins {
> +					pins = "gpio1", "gpio2";
> +					function = "swr_tx_data";
> +					drive-strength = <10>;
> +					slew-rate = <3>;
> +					bias-bus-hold;
> +				};
> +			};
> +
> +			lpass_rx_swr_active: lpass-rx-swr-active-state {
> +				clk-pins {
> +					pins = "gpio3";
> +					function = "swr_rx_clk";
> +					drive-strength = <10>;
> +					slew-rate = <3>;
> +					bias-disable;
> +				};
> +
> +				data-pins {
> +					pins = "gpio4", "gpio5";
> +					function = "swr_rx_data";
> +					drive-strength = <10>;
> +					slew-rate = <3>;
> +					bias-bus-hold;
> +				};
> +			};
>  		};
>  
>  		gcc: clock-controller@1400000 {
> @@ -2188,6 +2224,137 @@ glink-edge {
>  			};
>  		};
>  
> +		rxmacro: codec@a600000 {
> +			compatible = "qcom,sm6115-lpass-rx-macro";
> +			reg = <0x0 0xa600000 0x0 0x1000>;
> +
> +			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_HW_DCODEC_VOTE
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&vamacro>;
> +			clock-names = "mclk",
> +				      "npl",
> +				      "dcodec",
> +				      "fsgen";
> +			#clock-cells = <0>;
> +			clock-output-names = "mclk";
> +			#sound-dai-cells = <1>;
> +		};
> +
> +		swr1: soundwire@a610000 {
> +			compatible = "qcom,soundwire-v1.6.0";
> +			reg = <0x0 0x0a610000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&rxmacro>;
> +			clock-names = "iface";
> +
> +			resets = <&lpass_audiocc 0>;
> +			reset-names = "swr_audio_cgcr";
> +
> +			label = "RX";
> +			qcom,din-ports = <0>;
> +			qcom,dout-ports = <5>;
> +
> +			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
> +			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
> +			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
> +			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
> +			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
> +
> +			#sound-dai-cells = <1>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +		};
> +
> +

Double empty line

> +		txmacro: codec@a620000 {
> +			compatible = "qcom,sm6115-lpass-tx-macro";
> +			reg = <0x0 0x0a620000 0x0 0x1000>;
> +
> +			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,

Please adjust indentation (the most logical would be to put the whole
clock definition to a single line.

> +				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_HW_DCODEC_VOTE
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&vamacro>;
> +			clock-names = "mclk",
> +				      "npl",
> +				      "dcodec",
> +				      "fsgen";
> +			#clock-cells = <0>;
> +			clock-output-names = "mclk";
> +			#sound-dai-cells = <1>;
> +		};
> +
> +		lpass_audiocc: clock-controller@a6a9000 {
> +			compatible = "qcom,sm6115-lpassaudiocc";
> +			reg = <0x0 0x0a6a9000 0x0 0x1000>;
> +			#reset-cells = <1>;
> +		};
> +
> +		vamacro: codec@a730000 {
> +			compatible = "qcom,sm6115-lpass-va-macro";
> +			reg = <0x0 0x0a730000 0x0 0x1000>;
> +
> +			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,

The same

> +				 <&q6afecc LPASS_HW_DCODEC_VOTE
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			clock-names = "mclk",
> +				      "dcodec",
> +				      "npl";
> +			#clock-cells = <0>;
> +			clock-output-names = "fsgen";
> +			#sound-dai-cells = <1>;
> +		};
> +
> +		swr0: soundwire@a740000 {
> +			compatible = "qcom,soundwire-v1.6.0";
> +			reg = <0x0 0x0a740000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&txmacro>;
> +			clock-names = "iface";
> +
> +			resets = <&lpasscc 0>;
> +			reset-names = "swr_audio_cgcr";
> +
> +			label = "VA_TX";
> +			qcom,din-ports = <3>;
> +			qcom,dout-ports = <0>;
> +
> +			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x03 0x03>;
> +			qcom,ports-offset1 =		/bits/ 8 <0x01 0x02 0x01>;
> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
> +			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-lane-control =	/bits/ 8 <0x00 0x00 0x00>;
> +
> +			#sound-dai-cells = <1>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +		};
> +
> +		lpasscc: clock-controller@a7ec000 {
> +			compatible = "qcom,sm6115-lpasscc";
> +			reg = <0x0 0x0a7e0000 0x0 0x12000>;
> +			#reset-cells = <1>;
> +		};
> +
>  		remoteproc_adsp: remoteproc@ab00000 {
>  			compatible = "qcom,qcm2290-adsp-pas", "qcom,sm6115-adsp-pas";
>  			reg = <0x0 0x0ab00000 0x0 0x100>;
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

