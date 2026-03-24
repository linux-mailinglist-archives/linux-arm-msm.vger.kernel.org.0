Return-Path: <linux-arm-msm+bounces-99742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCCWKwUBw2nRngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:24:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E7231CD0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEE6A301983C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA1A35DA61;
	Tue, 24 Mar 2026 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="an8mFH8L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAIHrQkr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE8035DA5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774387405; cv=none; b=ZXzRRfouXA9Mrjymwqi1szDEZB1w7HEtBshUmrZaWtILvzGzytaK66x7irzTswFk+FaedTZoHUf+q9tl7SMIZ+mQimRPSzwB2hPDhu+qg1XOiKPEviHLbE2MG23Ro+A9v3cYamYDRSBQl07hKqfuBv7ikMrSKy6z9Wm7O5TTGTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774387405; c=relaxed/simple;
	bh=UwUHERYtmXxJl0X66fQxCxhaSYJYyWT7RIeWnnfY58A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/gPjwOBYlW6uFgn0xfPOP2GyW4MyVEvbqU+XUnMZFDsZJAq3Iq7uHBX2nXrkmpcS2k48wiuS8O3OoFkVi5lGxsTFAc62O6q5XIuzq4JxAxVyiA6D1B++AkMGpiWsWuQZVs71XTroBUbffuEDG8kDpVNAxdctgM1HqQjGRfLhdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=an8mFH8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAIHrQkr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCsiD3110476
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1uYUkNycc1pWaJFwxUlYF9h0
	XG3GMiPmjoHxa/L+c4s=; b=an8mFH8L6MaAq8RbRnDt9nxEsrCNEaceKSMGPHkh
	1apxYF+3QwB9xV21Qjc82W8SjzcueranvaqlCxebVPo1qgeAlV+mu2xkNViVTWMk
	9JcSqfqiUVd4fFeokslVy0HA0mIaezOrVUYZl6F4Mdz+4P90WlRYMHH6sFza4Bhz
	ItHCBxjnJUC+aBqxHBEvunOeRpKdOR0Wq7ICaJQM6RFF07v04MlnmAFnZXUfnwiy
	LACJhyWqHu8dEnhzjh/AFS5yXn+tjuUZwMOSXjzOXeWH1ZOlzCyx11+k5FTqEY9i
	Zd2Lj6q40KAwyBtN++hNvn4lTjll/0SASiS5j/kVo6f79w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvsh5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:23:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094741c1c1so99072711cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 14:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774387402; x=1774992202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1uYUkNycc1pWaJFwxUlYF9h0XG3GMiPmjoHxa/L+c4s=;
        b=QAIHrQkraKwIiesUi4mpGZbaBbzrouPAO30qAGZVEMTEDEIod4GV6AIReWn+2QQERX
         RdLPUmpHNH+eC8ImE9Cgki6MNUbVJEmQeREWB5KKJd69PL/I6CYiIO4f90WMy1RCQC1a
         2zceDqLdiqWd6hFMBDwUk4/R9r+Dq7mPRaMCO6yn6WDgG63L0yByjKhFaMixiSwTVI15
         sqREmyng/Si5iKq5cmtgOz4pp/xor3tykH5ZfW54VjwbaO6M27yRHEEPElzSLCeeT34r
         T0Ejb2BOm+WpAuSzrQVXKOWf6bw2O5+f2jN/AyjpFDiVOz11HY+Db3yvko+nZMcAhCiG
         QkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774387402; x=1774992202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uYUkNycc1pWaJFwxUlYF9h0XG3GMiPmjoHxa/L+c4s=;
        b=X/GvhoBf1LqdC9VwUBW/V9j//XX742YEMfkAx03HHbaDw+wUISkNoh3FbLuUboFqez
         Ta5GTM3RsZoHitjm+LCXhZFR0mEUEqjRZ7g/gxfgG5C9D07gtWCQVmPVP1m/c9tHzkzX
         cuL6Gs/AkIRSb3ecELARJyA2UfTcBvplJIBFXBX46g16mxFRoms/7SEORKzkoLwzHhqr
         yHxCrfYVBDbZXap3AqRmZx3wCjogZJO6oC9E6vXH10knaSNwRDBPxqhornesFO2SBNGk
         0sBJT2Goal2nWqhiZQv7l9mm25Enjb03YsnszLMmqXPZUrtiTdpcoQdggIucYXLjylB4
         56ZA==
X-Forwarded-Encrypted: i=1; AJvYcCX2tunbkfxOnLd8kEzmmNMuibM9LvCoVhLkMZHgUpirj9de7xMitHp6MyNijoUc2r7+MX9JCVJ3YaNmCS+E@vger.kernel.org
X-Gm-Message-State: AOJu0YywUkfc4S7PLwsQNoaoSSDUY5t9UOhXc16l/H4lHT2Y1pjDGpiW
	hgr2Iv5MJTf4Tcp4HB2tY01xaWDV9av3HguD5j5K8qMfEoyZtB53TnBbdhGjh4aGjFnllqELgy0
	+DMcA5IVmv1gB3j//o8S1e8d+9dKWAV67sG0bgNsdMamPFYszMUsRl3o8sVr6QuxLyEY2
X-Gm-Gg: ATEYQzwsUQuXHcysRfcE0BGzWYf+O7d3R21gDZgxhDQNsxa5VdbGrXaXnmSmG9tpcaa
	kWSzd0/kULxzu0pVPItVIYW5MK+AfDHFtuPOywLsxv5QO9x+tE/WklSXuZoWLZds+jbAFLzSHHe
	1hYkE7mXNH0OlJ3lBHbuoEZAiocDUUZmJQtHQvgm83dTWgUwMkDyARI8FDF+6S4hS5xEC2FHd/w
	FLpF6VTlmFWJiUY/XifbwzPEWJn9vhIDI0cGNRyDK8xUMdyIY/UrNEfaakP9GmU0tLd02fSu75f
	gvWvX8IF3FZrWEI/H799DtnB5iTYUWBLswdN8d/WC0o1gvBEf1pIKiDdwAlFgnLuSqnkb/uIJaR
	HIQhGckwtNxQ6Ui7veMni+4PBXi7WRaM10rWcd0vvw6vnwEIst72MKdTnDgrMsmGoqXEKSsZ0CZ
	utvZruI1cAxUyA3w0C26uwesSfRz50Q57DGp4=
X-Received: by 2002:a05:622a:19a9:b0:509:50d:b9c8 with SMTP id d75a77b69052e-50b80cd0762mr19250491cf.1.1774387402284;
        Tue, 24 Mar 2026 14:23:22 -0700 (PDT)
X-Received: by 2002:a05:622a:19a9:b0:509:50d:b9c8 with SMTP id d75a77b69052e-50b80cd0762mr19250201cf.1.1774387401816;
        Tue, 24 Mar 2026 14:23:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ae8570sm32654221fa.42.2026.03.24.14.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:23:20 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:23:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for
 Glymur
Message-ID: <x3ts7to7c4qnorloahe7cgup3uekn4wolmmorqa3b3bjfslqfn@eijnzdp2ops3>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2NSBTYWx0ZWRfX2F8ZDhTTeb0e
 QpzHu+7G3mE62iCfq5E2tSLV3SAL2zOztQOQ0YQwQ96orAaaZqSjbekUlrNoQEvPYmlk89upMMR
 +xoB9TI23nwgNOD96NViVS4Qzo9XJ2LGInpu8+TRqs5ZdCk/bcQECBgyryPBTy7D8yWNE1283Lu
 6OvzfRF9/zO0QYu9ZT+rAh7s6sKLFPhTh8Qh8R73UvpY+Zc58BEQglXUrhRVeHJQueaPByKs0jb
 gEqmNdC5SBcR6eCjeCIMpI2OJPAmrtpcZlgVF7P4gUAfQpRl7clCVqcer17Ze5kl365fSLQuDhU
 nKa7oW0WjUN2GXCMj0/DJfJEcX8ReTj8VGNJg+loF5I90Hb3CTi1wJdvbeFRqBRRzZAaH3tC0U3
 YwTdjfvxXGhs+eKuB3o6qe4CO918HO1DipdzzfQUGFMXoDvbzIwdL/eM3+YPV65vWf8tfjHYP2x
 WBKzld0Zj/GqqnPI5HA==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c300cb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8302d4AOEtq-Q5Zcfl0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: qw0E2TdXagpqLgqSKteEMKRZEzpv89ZZ
X-Proofpoint-GUID: qw0E2TdXagpqLgqSKteEMKRZEzpv89ZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240165
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99742-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19E7231CD0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 12:15:31AM -0700, Qiang Yu wrote:
> The third PCIe controller on Glymur SoC supports 8-lane operation via
> bifurcation of two PHYs (each requires separate power domian, resets and
> aux clk).
> 
> Add dedicated reset/no_csr reset list ("phy_b", "phy_b_nocsr") and
> clock ("phy_b_aux") required for 8-lane operation. Introduce new
> glymur_qmp_gen5x8_pciephy_cfg configuration to enable PCIe Gen5 x8 mode.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> @@ -4705,6 +4713,23 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
>  	.phy_status		= PHYSTATUS_4_20,
>  };
>  
> +static const struct qmp_phy_cfg glymur_qmp_gen5x8_pciephy_cfg = {
> +	.lanes = 8,
> +
> +	.offsets		= &qmp_pcie_offsets_v8_50,
> +
> +	.reset_list		= glymur_pciephy_reset_l,
> +	.num_resets		= ARRAY_SIZE(glymur_pciephy_reset_l),
> +	.nocsr_reset_list	= glymur_pciephy_nocsr_reset_l,
> +	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_nocsr_reset_l),

Just for my understanding. If it was not the NOCSR case and had to
program the registers, would we have needed to program anything in the
PCIe3B space?

> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +
> +	.regs			= pciephy_v8_50_regs_layout,
> +
> +	.phy_status		= PHYSTATUS_4_20,
> +};
> +
>  static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> @@ -5483,6 +5508,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
>  		.data = &glymur_qmp_gen5x4_pciephy_cfg,
> +	}, {
> +		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
> +		.data = &glymur_qmp_gen5x8_pciephy_cfg,
>  	}, {
>  		.compatible = "qcom,ipq6018-qmp-pcie-phy",
>  		.data = &ipq6018_pciephy_cfg,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

