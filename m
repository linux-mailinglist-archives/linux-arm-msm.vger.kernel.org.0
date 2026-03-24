Return-Path: <linux-arm-msm+bounces-99730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLsgBBn6wmlXngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:54:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A996F31C918
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1743930DC632
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C8735A3A9;
	Tue, 24 Mar 2026 20:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Po2Squ53";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqX3rx1i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5FE3090CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385575; cv=none; b=qMb/LSN9i6uy5oFWHViC8FBKT7qIvuNPtzEuXdSvcrcuABNNerxVpssVGPuGanASH7OTkW5JHoD7Baa64GU8CDoNUrseroDNGjr1nenhY+A0/LdqE9sV80UjrjAVQF4J1t4ia1xwqClDZqAmcu5X+nDvw9/wBeNohC49i2RjPmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385575; c=relaxed/simple;
	bh=2iDi1ewMnzAeZQ9g7JuXZipx60ngATftH2vw/8iWOE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3865015ZSvrXyvJlwT9F87SVLYezlfo5vIUquNNNe6Ns7lVjX+xt65v6UifQ66tBMsUjG5A7JELFw4VZoy/alHQ36ZQSOXwnv0wzKL6mDlkV1WtX56OviBfAaXgUd8CWUw1IVit5SMGPFbKhzY/zkXfpYnKFZBYnkbefS9CB88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Po2Squ53; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqX3rx1i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD8vW3731530
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rqQjayTeZEhxnqXufBt6gqjE
	f6UwDuN2Pb+F55fjRok=; b=Po2Squ53jnRvXfAhYN2ygVpFKzoBHfaNuuZJu4s1
	hjIKr9JyZ/n98sxB9VR24AM1nqdNrSC2MUNUF5QSem87X/Qfq423C7uK4HugJLJB
	B7rJru3ornynbZFRyFNRtNpYsV0WmVSArtDIJG3oqJSSqu6oEsdkMTbZZiuIi0Rs
	6v/IkvmBg+VM1c9ppSBkAGBc9vVIfWuHuLMTMLnZtZCZYizQo3cejA28csLvltzs
	SgzSjrpYwKg5rn1Ukj9URwo7r9J64jJTABAEqkKZ587ZfTENAsNnA2cUXJ3gOOsM
	ANoLQBn2LhJAt5KWvtv+Pc41JS8SUIHe1Fd7VxBtlur+BA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkets13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:52:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so110352471cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385570; x=1774990370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rqQjayTeZEhxnqXufBt6gqjEf6UwDuN2Pb+F55fjRok=;
        b=UqX3rx1i1pWoyvXo+p15IfXl1k9ViOrGKfbiJxlZF5+vxKM+FZxmj5ZlsyZUJii83y
         gkpfjjq1+uvRpG0ZxMrtqgFzETvoiL0vdzCfe6VONz1ymHYznOX6pcocgQ/6gwDWREmK
         bsL7lmBMZhVasA3J8q5i9yFGDPZIDnwEGViHsOjosPzJj8dVSAfkeG8wnIWAl/lna+VO
         WGcJQeI+Du97VkYQW/GztgUOF8phmrMLeg6Q4iumR96t+mE3yx1DnZIrM+nF95pS+dcT
         iNWqZ1Nv6H8Xv8vYMepMqOk/k8OX7kKJlU9vcw0lS8xqPwrCqTAxz1KjA5UVFbYOqkUm
         M+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385570; x=1774990370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqQjayTeZEhxnqXufBt6gqjEf6UwDuN2Pb+F55fjRok=;
        b=DAUCBD8la6cAXtBbV51HPB38k2Kj4W/3Re30mDg/UJWIXy4PlXy6S/+1ruRC5gGONa
         mepmXHqC1AdwJy8M8HBjzWrvYr6u0HQcfQYdeYbU/euO5rJG2yxC2yj1ii1aXrK716w+
         SRNQ6U8MAWBhKs0ls2MXp6M7dYo98nuBy+fmu4iOwblftx4uHhXEmxSFoxdcArnzw3lP
         PZsg7OQitnA+/3iidSHDJtkeHaDmUO5IKIZSllpJl96ZeivwN0J2jYxcexfE8ZoJhzeY
         CUI1Xh3/TaSd7AkjzCDTI01/qz9fvBBPTZ37XaYhQqFMF+Fng0HitfBmM0RVhzYiCpwN
         B+4g==
X-Forwarded-Encrypted: i=1; AJvYcCV9J/S4Kt5t4A4R0uJ6SzvLseP3QDb+VibBNri7cQOi3ZMw2HR8oa7QRvz/1NtoK972ZOm2HhAk8AgU8L/p@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh6x+52WRrt+ULRBfpTooaCtCqF63SF32TSSGjh7zHI2iQ4sCJ
	EhUwuVF1n+WMaehZj+cBYKL5kAA0oZdnKqCJq0u8wyVoW6SYl62niTgFijZvuxuY5jgxR43de6Z
	Kx2TFdu84ciiuAgWB0wap36AoAd6rZvywZ1HWWpKbNqnD26R/C8H8XmWnUcFKRj+pwgHS
X-Gm-Gg: ATEYQzxi9hK6qN/wgORzQaQL7E6XtBPWThQQWhc4XcN+YSvkWAgiWak9jcN7aThW0Qc
	SFSDhlnZKyT4dG53+P0tar2okpyWOEtMtjo7OSeDg/CZLC5PL/XcOyjEzJ3+LXOPX1sS51Y65Iq
	XhCYEQdNxNH956yQHs/qak9Co+N65D0bPSMbp1xCcA1qSXFcNuBiVyBNJqQX9VzwTGwvXnuY1LP
	ZDPIRScF7wE6Fyw5z4tgwUChydt1Vkx1TvBL9HDxhm0xT3q/1nB/L+Xaz1Y13G+JCWQSXyRIcHH
	zl5v75XTXykIC2IylhO4/924PNxn79rdiEw+NCz0DvQGb9kxxvhlwQOBcj+lXsK6kgYF3+KOuqJ
	5kThXOS+nIFHZlKOujhpPH3xKz/0iKOqOTB5GntV3KG5JUjRe8B6JmIaxXPUsJ+okXGwl+/0Oga
	GNzKlSYtdOir6kUlLbdGcowooPj3FJSgQBZvw=
X-Received: by 2002:a05:622a:98d:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b80e8a543mr16740451cf.48.1774385570601;
        Tue, 24 Mar 2026 13:52:50 -0700 (PDT)
X-Received: by 2002:a05:622a:98d:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b80e8a543mr16740061cf.48.1774385570121;
        Tue, 24 Mar 2026 13:52:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f24sm3503310e87.39.2026.03.24.13.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:52:47 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:52:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
Message-ID: <bg6h26xk7cdpf3fx2znm3y5snxmhtrddvrkn5j5ft5uovgpk3i@ume2erp5lrax>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
X-Proofpoint-GUID: 57uDSIOhbaqWaJzz6hK0gPgZS5LV-Pc2
X-Proofpoint-ORIG-GUID: 57uDSIOhbaqWaJzz6hK0gPgZS5LV-Pc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MSBTYWx0ZWRfXziuDpOHUxs8f
 haz9uTgw9KB5oTcMEk60x1FDX/BOhd5w71aU9W+AKBzw/Mr1AsL1x+nyuf2NyyKwY0exlPL1RP5
 jpWOrnzcE4WXghGNhwrEXNXZYWKYQwon+cCOl2YayGL9vKG/dH3jhBhV/zJ3dbDcaFcP9d+igdt
 5OnUiYFakRLC4nfHW09vovcWfAFCuIisn0kxzug1UJ8i8xpYhfdZ8O+zCc91z2bgED4cT5LtcDv
 2YapNAL3Ouaw+XEkAltqVRRhRTywPIxs3iDxfvik1p0voVsJnd9MY9qgIFjaPBQc1OifaSrFHNe
 AZAPK81mETNL8rvMVfTLU28GFaKbR7vaea6cUvkgWu/Eo1fFcIEsRa4naUxDBuYHjMnYBn/+ppy
 2xW7Pp7J6AHXZG3N9gZdHTib7BUqpAowbZqXcWE65/t/IMJEJtNNUWd4+oyLlfR4zHv3irKVgB/
 0M7IVHHZEDmeVl8GP3w==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c2f9a4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qq52r8Dd0ieUO58wh1IA:9 a=heC_-aeoyD3psnDD:21 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240161
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99730-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,0.47.77.96:email,88df000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.139.197.64:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A996F31C918
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 06:43:20PM +0530, Viken Dadhaniya wrote:
> The Talos (QCS615) platform includes a QSPI controller used for accessing
> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
> the QSPI controller node to enable support for this hardware.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 75716b4a58d6..fd727924b8ca 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
>  
>  	};
>  
> +	qspi_opp_table: opp-table-qspi {
> +		compatible = "operating-points-v2";
> +
> +		opp-60000000 {
> +			opp-hz = /bits/ 64 <60000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-133250000 {
> +			opp-hz = /bits/ 64 <133250000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-266500000 {
> +			opp-hz = /bits/ 64 <266500000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +	};
> +
>  	qup_opp_table: opp-table-qup {
>  		compatible = "operating-points-v2";
>  
> @@ -1553,6 +1572,34 @@ tlmm: pinctrl@3100000 {
>  			#interrupt-cells = <2>;
>  			wakeup-parent = <&pdc>;
>  
> +			qspi_cs0: qspi-cs0-state {
> +				pins = "gpio44";
> +				function = "qspi";
> +				bias-disable;
> +				drive-strength = <6>;
> +			};
> +
> +			qspi_data0123: qspi-data0123-state {
> +				pins = "gpio45", "gpio46", "gpio47", "gpio49";
> +				function = "qspi";
> +				bias-pull-down;
> +				drive-strength = <6>;
> +			};
> +
> +			qspi_clk: qspi-clk-state {
> +				pins = "gpio48";
> +				function = "qspi";
> +				bias-pull-down;
> +				drive-strength = <6>;
> +			};
> +
> +			qspi_cs1: qspi-cs1-state {
> +				pins = "gpio50";
> +				function = "qspi";
> +				bias-pull-down;
> +				drive-strength = <6>;
> +			};
> +
>  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
>  				pins = "gpio4", "gpio5";
>  				function = "qup0";
> @@ -3682,6 +3729,39 @@ opp-202000000 {
>  			};
>  		};
>  
> +		qspi: spi@88df000 {
> +			compatible = "qcom,qcs615-qspi",
> +				     "qcom,qspi-v1";
> +			reg = <0x0 0x088df000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +				 <&gcc GCC_QSPI_CORE_CLK>;
> +			clock-names = "iface",
> +				      "core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_QSPI QCOM_ICC_TAG_ALWAYS>,
> +					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;

Should those be ACTIVE_ONLY rather than ALWAYS?

> +			interconnect-names = "qspi-config",
> +					     "qspi-memory";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&qspi_opp_table>;
> +
> +			iommus = <&apps_smmu 0x160 0x0>;
> +
> +			pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data0123>;
> +			pinctrl-names = "default";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
>  		dc_noc: interconnect@9160000 {
>  			reg = <0x0 0x09160000 0x0 0x3200>;
>  			compatible = "qcom,qcs615-dc-noc";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

