Return-Path: <linux-arm-msm+bounces-109591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFfWErcLFGr6JAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:43:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C65C7F26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1AE6030015A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0008212566;
	Mon, 25 May 2026 08:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmWOalkl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMgHoTx1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FBA3E3150
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698569; cv=none; b=OkS71OR2ipRTHrle1C9zDvRULdWJHd45CKMAebCY/HPbeqohLlJaTa+d08PlzaqOVVdgi8UskCdMcIy4sEsuDo6hrOb7WbD+g1FtM+ZzfPnybiqr6ynEfRotiQ18U8kZJQQ9JFufgjxBE9cbRsbEmursx+hIFYt5FZoooPmDJVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698569; c=relaxed/simple;
	bh=ZuDTkgX6mAwZ+rmvbZMsjFEI+Z4ozYk6bjM5ThhxEyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9aGbSVzwx1/XcKHCiDeZvjgYosZ7JGmmWSakMKW4dBgvjs0i08U+F+6otpXw3+sKHMttXI7wF8vTiVsmuits1iF4h7Bgd4UcFAYDFNU8PAUfmyIpGEg2LFRvNpKbf7s2ftcuF9AJQuhw9nPWLmP3RigvLrMBljxlEyWX2z1IIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmWOalkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMgHoTx1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P1plWa160817
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RfjedfVNMYLqzmmguha+gRd0
	377+9GlhAPQfeTg3V4g=; b=fmWOalklTdggJ1XndlWLwN3g1HZHS7a5qJbDuUNQ
	1M8dr4Ds/RjjPiZhIU2s9tmYspPmLd85fiGwRZ1dqU0nXaKljl+7t0p4gtIwIYD7
	vEAc+0cubSzsb4McLSS8HtqRSYzHrLZDif0EfVfIgrj/Sk6K7P5mhSjXnUcYsJPd
	xM1z1MZyKI00eiyAqah1x27GCkdr/fs7dODd5tSPeqqBzLZSblzOtffpuQr1MRl9
	gzmwaPf2Tiq0jR+GOcdTcHOxXkzhAI+ag9gfKhbMH+GT5K+fQZ9A/La1jtNNQzuP
	SfTVMAV0sBa6+093isy3l1+CLdgbsFZnNfg8mxmO26W8Uw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t60py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:42:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d13328dcso70210191cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779698565; x=1780303365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RfjedfVNMYLqzmmguha+gRd0377+9GlhAPQfeTg3V4g=;
        b=BMgHoTx1uQNXD9dQCH7awxf3fnXs8XE3i6LmO0f/iKSD9ze3eQXEEFjcLavQwKqtfd
         idBLuV1it+f0TgeG9mvpyHK83VI1b9o+31w7QZCYngdyRq1zyY1HC+XLi77WFbcMSnK2
         SHcMln0ctUyuQi5MtZyVdmVWj/jytfmPJj9unG6CF1Z9z8XHmA9GirGtiuGv8h/1aSBR
         dzMYbVBoVzZKwOXlqFpp+PvtJOJfC/leDtkEF0IVCEuRyqFIGW22SqzXDgXdhplx09RC
         zp/hMllWHBDPuZuNjj2nhkdM9daI+V4eau95qG2Q+1zMLRDeLw+LHxayTxEmaDWBc2UF
         mHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779698565; x=1780303365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfjedfVNMYLqzmmguha+gRd0377+9GlhAPQfeTg3V4g=;
        b=d6KRPSTpB7LyxxUX6YMlezqQ/dNw3T+8awrbQVP/ZsJ3onvLcYuc8926EHdgubQ95Y
         Bl+7JlslU5K/Du72pdANw9x7Xx/6pHgBeNUYLpw0qQ+szmEmnY9SnO2eBVovEpZOPKOq
         uQn5hkDUUE7dy41FBsqgSrItl/8GoyQAUjYlLlc/EpY2Wk7/kAvUB0Oacmi/tz5T8ITG
         VQ19ejImX82LH5VPf7TMErj4DQlRv11HjscIVqa5/wFFiP6CAizqp/abZebvAjMTz0O0
         RfyhmezDLeCDOI8hDS2Dl92UIHQJaMYde6Pm0tzLoxbEmOs2H3ZDwzUKt2uVlHsT1rRo
         Qp4g==
X-Forwarded-Encrypted: i=1; AFNElJ+ZXsNNC7x2oeujVaFb3LHeeSnhybpdrlwJ2pJGThqzXfMgtCxsmdWd2UPmJfOIQZxUV59BR6w4NzWMIlpM@vger.kernel.org
X-Gm-Message-State: AOJu0YzrMeEie9AjUUsP5IxeyWJ4U0KR5+pfIBHcdyaAkUUsAwtVz//y
	7l+aqvAVbgNOS6NW4YIG9rU3MD2E33JM23IGKo39STyByNz+9IGMdFPFCnL+Q518TcrlUjjoIN7
	96kbnDAxCvRHOtBiFu2O+Xx477GghaUecmqgPwmRt5ARbDkMolPAu4ZTVbPKCWo0RUCEl
X-Gm-Gg: Acq92OE46ZUwUYsOdlGoB9ddPKcv0+OnKXsXnW8+Z8QWtDVYRct2SVZuRFscLBKDkxm
	8CBnSNGLcqB1sTSrlc2zMzWV+1ScDsEbQgGt7cNWL1l8xi9XXNN1uUGtI+VnyKWTnKFnAFoQbBx
	D7pXRu7PeLsuGMneLbXeKgjnwWdnG5+KkpTNR0XVRgSZuU5jEGVgNpGe3ej5ej+ANmOfLV++T3a
	M52q630kqvscV25FsABcnxVcYvx/5o8IrPJ7hk3dDYo2MBZzfdrnlOIwYYBptd0Tdaces9VA7C5
	JM3Qz22QQBpoj9WsoffxjNmO0rshJeBZssxrkFWVFWn7r1k9M3wYviOJoCbgexBODwwOBpvfmdM
	euKaKgdnY6eWkNR3GquJE/Y4Mrj0QTfDIN7kCqZcrbrd6zzVUaK/yKMQPbJF3DUhQuNX/wxkOk7
	YsViQSCVbv84vGG+95Y5Y7k6VmKTE5yIo68iI=
X-Received: by 2002:a05:622a:4a09:b0:50f:6415:1eb4 with SMTP id d75a77b69052e-516d463dee9mr196532091cf.49.1779698565110;
        Mon, 25 May 2026 01:42:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4a09:b0:50f:6415:1eb4 with SMTP id d75a77b69052e-516d463dee9mr196531821cf.49.1779698564659;
        Mon, 25 May 2026 01:42:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc0a196sm21334161fa.21.2026.05.25.01.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:42:42 -0700 (PDT)
Date: Mon, 25 May 2026 11:42:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 4/4] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Eliza
Message-ID: <l7bcvuq3eggjt6oir2yq37vvyy2p2ylegf5m2m5yjhd6nl26hp@e2zonyjx7olw>
References: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
 <20260521-eliza-v1-4-97cdbe88389d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-eliza-v1-4-97cdbe88389d@oss.qualcomm.com>
X-Proofpoint-GUID: xpjQodenaLEhpsguQF-65nijkqYggzZe
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a140b86 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=hYsTZ0akgaehJFdaFsgA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: xpjQodenaLEhpsguQF-65nijkqYggzZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4OCBTYWx0ZWRfX0Lr2RhzbAMrC
 Pc1ZC8jP7g5y8tnpXfGhXUP+ynzjP3Gm5s0m9pRSvQ727r4vcybRPUyUapc2WGg0pF4eEE2mJk6
 0fsf7NPk27WTEyJTfz3VulcnDGVBp/nxo/yt1928qmgQ6vSkI8BqxWo21YxjQVM6Yt1esDuBxPM
 H3K6GPEvCT/iWPEdjj0SZ5EWM65d/RGNUPYZTWulKXUoi0fKOQ+2s+dqWMO2Fkr0h73pRp3ImFM
 okanZY35tDRd8S0TwSjvUJdXj4yY2mjwuRrT2JnjCOTdh2KGjl85KMfPTwknl57e+u1ltFmVO/K
 E5JMtj6/edhn1JE0vNIDdrPtzuaIaKuJ5k2eTFyQRtsPWSTzvDaJD5qwscYiVqDj7tMh7AZWnSb
 SV2l+plObWE5Rm/WGXgvLsbbe6Ad+4Iqpn3t1UNfXTrdFxoxZFEDjKHPRzgwJS1DTKdg1/Q51jM
 WHgCxGWLHVvjEcyhGlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250088
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109591-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D1C65C7F26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 07:35:32PM +0530, Krishna Chaitanya Chundru wrote:
> Add QMP PCIe PHY support for the Eliza SoC. Introduce a new Gen3x1 PHY
> configuration with Eliza-specific initialization tables, and reuse the
> existing sm8550 Gen3x2 configuration for the Gen3x2 PHY instance.
> 
> Also add the missing QPHY_PCIE_V6_PCS_PCIE_INT_AUX_CLK_CONFIG1 register
> definition to the PCIe V6 PCS header.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c        | 139 ++++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h |   1 +
>  2 files changed, 140 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index fed2fc9bb311..113c5f8f1dbc 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -198,6 +198,112 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
>  };
>  
> +static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_serdes_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0x93),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x1a),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x34),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x55),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0x55),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0xB4),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xf8),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x0d),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0xab),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xaa),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x01),

[...]

> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0xA0),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC_3, 0x0F),

lowercase all the hex. Be uniform, please.

> +};
> +

-- 
With best wishes
Dmitry

