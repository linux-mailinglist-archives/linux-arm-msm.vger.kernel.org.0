Return-Path: <linux-arm-msm+bounces-104977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAKzOjWj8GlAWgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:08:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 623CD48494E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32A0A3170404
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C704245008;
	Tue, 28 Apr 2026 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3PpFV6e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXwp6Tsu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B142EBBA4
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376462; cv=none; b=NqpUbomwNAl+X7JVpZU2FICnzWjlfp44rxTnV22YMacwpHoYnksdDxLkLmA4C9OEmYtFKlmIzSnLkSNaX9/hIOxHH0T1NO12YtVyPdtSF2LEbO+O6FFRxzIqjTdDgFeSZxCSuFLyLqNaZiAhntIRrSZ8cRn0NczeBMDRRlpWpsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376462; c=relaxed/simple;
	bh=eW0LAkJt7c+5A+uqdJpHBrRAxyHFIfhww3+Djvafb4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wh71Uou+KelsviKrBNzTxwfbqlxbas/NZbPa8SDKpp5ot5rR3vrUs1DdFPt7Zgq/+Ow7cImLO6Y6o+q2GlW/isKUR7UIZ3Xqr7jxisJqXbEwA3Am8R9d32ni5j+lz7WVuQ5oi0tYZVOsvA2kv7yq4vg6uzzSB/Dt8rZu0t0F0D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3PpFV6e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXwp6Tsu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7kWd8440715
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LvoV2Ov1kpFw2uDF2NI6469G
	ftqDuPAXFKdWzhpFPuk=; b=i3PpFV6ekzQiMByIbNp9zdUbr7G7ATFlOiwHGPml
	2pKxFE/jzRqhrhx2KjI4JjgmD0Dv8Z8xRlMiXG5/UdjwHFjIoaC4u/pDcz5v1mli
	DdM3yxlL5rK5SWH5hEQPAZpCQmGRrF3RACX1/hoeLd/hfU3ddHxM586IZ19uq16L
	+blZ4bXv84DuAjffcqco8HqdgW0t67hts6veCq4qZTXqnL0TyZBopD27NxEh7nRe
	ptxXHU5bRKsE3Rgf4buyCJZ+ULikPfEb21SGGPvv4wyvY/ssdniaeMuz0SquYJsJ
	KCX+ThPQbU7SMEJUBOPq41JqRro/ST13poDPcOS8syzwjA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac446v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:41:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so205513461cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376459; x=1777981259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LvoV2Ov1kpFw2uDF2NI6469GftqDuPAXFKdWzhpFPuk=;
        b=DXwp6TsujIytwelZYE3Y+n0oHqgaXG+2+qqetE+ot3U2AXrzQnvpdrhYNrNi1TM/0e
         aLi0mbJAnT1wOZkmJKfa8xVhLfntkoNVCLMkbEkv/7I1FyowhSVwCBJlFYVWERv92CZN
         jcy+Ip9aXr3V0ubV7+FENA1fSwqGSVDnk55Xrh/mFivLb2A6iW//9IKqbGr5gcdgl8hr
         YfzVTr3Ixw5T85bRBfpGPau5c2gGERbarUPDxPSdmr8geZmWx34IEKytXMUUflXyscgz
         yeDKt2vCad1Riif/RPubPN1K0Hi+nTlpC+ip2fGWns43b40K0YtCXCUWIErpR9/866tj
         Gb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376459; x=1777981259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvoV2Ov1kpFw2uDF2NI6469GftqDuPAXFKdWzhpFPuk=;
        b=RlBMMoa4jYVnW7R9Yd1XR66q38RLpQhRcpu5HN3G8OhyMJBpLOJgJDkbfb0Tr1npgA
         QeMVuoSeNCQPkr8lGttL7rebTsRg03IqJFeDRmM6XccP0udG0wNqg/sfcQcuZc8grOmE
         zCwSZhBpIQn7bmeWc98KEDazsRoLRRQxDl56RMVRxtExcJ+U0RL8hTTZwmSDveLgnw95
         eqJjeO0VwQrHkj2fH+7Rm+KREzJWMlqG5Xe07jH/05aCVRSe+hMrvOvLAHLIXtesuXYT
         tktfYqMTrL96timgdIcDqP+DD6zkAXM0O0lFDhT40X+dodV06Xf0wDN2OPWObMbNjs4W
         btIg==
X-Forwarded-Encrypted: i=1; AFNElJ8gqkNCYL1jg+Fpim6vE+RTcsi6kBh6RDDhhFG/uO4m3mfUHXmvnmoRX1+UTz6bhrtvR9Shpv3kfsYEINLL@vger.kernel.org
X-Gm-Message-State: AOJu0YwnwxCOkU3jd+Pmc1kSn46PHigtPXvsyIojyeAnaL6WB+xFW8FC
	iY74BCeG5jVspe0i3QpCsu7LGNBMxQMUsonDMUbj4d74ZIkPpbrlLVsTFFzv3CaLJDh9ihSgG1A
	s7BfbjlIKrc5CgqNt21nYIS4ugyeYJbsHndeekv7LDmoJTunEFy2s52oPINB7KOHTR3qK
X-Gm-Gg: AeBDiesT1/EwcUEjBhv/VhlssnVZ2XWuCyLUFE+T7E69WoRBImwb6SKJFZMVE4Tmffn
	AEpZkZUHLEgK3avTTDC89M24r3TanuJ6mEcwNq0o1ZWXctkpVag5+xB23s7+10u8gOeoeiSo40E
	3nRtmQyf+TOrHXx79t9MZUagDu0RtowtMcOQhSsAoqrvik8q6WBAavCZEIeixhhNcK9K6dn5OmR
	PlWSciY4tNN3NydX5imZLjFT5X/IhBVIWSNYbl646Koz78kanM1yYNSIglMbiZvU5cWVHRDdWfW
	1NMFq1A3t8YrxFkJaLUAUNg7elonXSMWEU2D4znCZfJf4zsmgCSHfvG58HzeFJ/GMMyZyA+if25
	G6WwpvJklmEWbjTHslkXznVY0N8YmOH3epJwsB1vMKxBya0kpBJQC7rmzfpBeuvL0VkG6+J+sX8
	vl/P1KlS76FkhMsN5UBAVLof25nHmRPfGf6wh9OLUl7B2AOg==
X-Received: by 2002:a05:622a:15c7:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-5100e1ea5b9mr35845531cf.55.1777376458950;
        Tue, 28 Apr 2026 04:40:58 -0700 (PDT)
X-Received: by 2002:a05:622a:15c7:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-5100e1ea5b9mr35844401cf.55.1777376457975;
        Tue, 28 Apr 2026 04:40:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462ca617sm567782e87.5.2026.04.28.04.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:40:56 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:40:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        konrad.dybcio@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
Message-ID: <s6ortwyjjoq6lsxjjykbbshg2rczchtol4ntmxipcrsqufvsby@whwxtlnn74id>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
 <20260427214217.2735240-5-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427214217.2735240-5-ronak.raheja@oss.qualcomm.com>
X-Proofpoint-GUID: PRP5S0twTm_G8RttfV61v7hVs5_n2__y
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f09ccc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=REwqGe_ukdr-d6Ko48MA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: PRP5S0twTm_G8RttfV61v7hVs5_n2__y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNyBTYWx0ZWRfX9Pw0ray0HHsy
 knIG5hwR7XKNm4BZeQWTlRjTXc158dMGfUAkaByFHDtp4AwXMFtWS4F+tfCe0WfMcTmSfkI7kJP
 MD4+LiUTlD+Tv5z6XJ5HDncwlUjYd+7iYea1FZUft/YSGpeEwMJAx7gqIaTaGvYi887+pyFfyHy
 YhJw4MFEwRHFT7LgzEh2a1QJacUs1YxOMv6bi8yNN4woynkeel956psSSEmBsvQQQtbgVDRT3Nn
 oJp8VGvTeMA3bbP/XPsJ0cc8pzh9iSsJtTcokkTZ+sBGpSNnC7LHzVaorpl4UZwcvvzMQIpMOnY
 jRI7dGr5vKsC58T0ihVBMj9FzfTGimP2J26Gw3II0zcYEYZNXSt5xo01iQQHKe1r3ohpsReKiol
 tDRznlYMYVP26V8+/mBbzGCQsf/6+VvXVrjOW0klOSsJclZJkmBXMlg7Vcn/9YYCCeHL4K83FU5
 LvbU3GT7tJ9iSwLxKWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280107
X-Rspamd-Queue-Id: 623CD48494E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104977-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026 at 02:42:17PM -0700, Ronak Raheja wrote:
> Add support for the USB3-DP combo PHY found on Hawi platform.
> 
> The QMP PHY for Hawi uses QSERDES V10 register layouts. Add the required
> PHY sequences from the hardware programming guide and new V10 register
> header files. Also add a new v10 offset structure to incorporate the new
> COM AON register module.

Was this tested with the DP too or did you test only the USB part?

> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
>  .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
>  .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
>  9 files changed, 506 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
> 
> @@ -2198,6 +2368,7 @@ struct qmp_combo_offsets {
>  	u16 dp_txa;
>  	u16 dp_txb;
>  	u16 dp_dp_phy;
> +	u16 aon_toggle;

Are there (or will there) be any other regs? Is it just one-register
space?

>  };
>  
>  struct qmp_phy_cfg {
> @@ -2705,6 +2895,27 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
>  	.regs			= qmp_v6_n4_usb3phy_regs_layout,
>  };
>  
> +static const struct qmp_phy_cfg hawi_usb3dpphy_cfg = {
> +	.offsets		= &qmp_combo_offsets_v10,
> +
> +	.serdes_tbl		= hawi_usb3_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(hawi_usb3_serdes_tbl),
> +	.tx_tbl			= hawi_usb3_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(hawi_usb3_tx_tbl),
> +	.rx_tbl			= hawi_usb3_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(hawi_usb3_rx_tbl),
> +	.pcs_tbl		= hawi_usb3_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(hawi_usb3_pcs_tbl),
> +	.pcs_usb_tbl		= hawi_usb3_pcs_usb_tbl,
> +	.pcs_usb_tbl_num	= ARRAY_SIZE(hawi_usb3_pcs_usb_tbl),
> +
> +	.regs			= qmp_v10_usb3phy_regs_layout,
> +	.reset_list		= msm8996_usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),

No DP counterpart and no mention of it in the commit message.

> +};
> +
>  static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
>  	.offsets		= &qmp_combo_offsets_v3,
>  

-- 
With best wishes
Dmitry

