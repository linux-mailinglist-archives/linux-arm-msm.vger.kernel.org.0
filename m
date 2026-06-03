Return-Path: <linux-arm-msm+bounces-110973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2K9BB/gsIGrWyAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:32:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC36563818D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:32:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Zv/jD7eh";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MHpEuBDA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110973-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110973-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C730301B928
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 13:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0640423E330;
	Wed,  3 Jun 2026 13:18:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45A629827E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 13:17:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492679; cv=none; b=e3Esmy2Qb0CT2HcUuvvgbBhGSJlbg0feZeiIklzSZWgWLmQ+vJKca2yreZH6MWWsntYgtsd3Th1xzYMPiSmXOJ9bNwWaVeOmVWace+YRzTa8qorDFU3FQd0fw/lBBjJJRQEmv/IwxSta+BZ2kwzVqvCT8P28rLhYpU0Pi0734pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492679; c=relaxed/simple;
	bh=XvtldXilXkY/PAyqaT9gfS+5Z6NSt+lIR0mWqy4PwBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSdNTYU4ZmmZGTtprM3PXEEKYT8jOyVuRdFaKtYWouuVKWKjk/xPXaISkTY/5oGcZE186HsfLmPRQlB2UaJUqsTqumxikH04gB5y2dtlSK0zZjf0V6W8byRw5dJTmotigGtag5nwUaphaDlLCK8oFQXVuLwZNSb+xYhsJn2zleY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zv/jD7eh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHpEuBDA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vbe82368196
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 13:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=csBmCVVylLxai6dnI43bsxJ9
	942nZz/wU4Ao2SyUnqo=; b=Zv/jD7ehjMOQeMS++ZxuuHFJeMs7AJCN5OiS7DT3
	e9htJKue7owJa2ft0KQD9fhM5CzCjYQoqbbh07uLwYa711JhUIXGkUJ9/VOFtWty
	+O5kgF0gssl/Xei60U0664epmcBHXQIWpJZA35NYJBKbUHmG5Ocv/hTuQ0skkCsA
	yAXpRAlGm2UdlXoZZlfGq8ImP2c6SFEPRNSBKh6dZNFKQiQlGQEuxRQ16jrufFhW
	GL8Ub4BzZlevCNyOIVZNDLD+9b18q130Wl+WWu4dLny5CCguUb9E1ccaSogYK9vw
	mqBUmhcuakH4WcTNjQcnQVVzg3+gifeXDGU/WFLlKLIflA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3ggqtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 13:17:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfc66167c4so1680260137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780492677; x=1781097477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=csBmCVVylLxai6dnI43bsxJ9942nZz/wU4Ao2SyUnqo=;
        b=MHpEuBDA6QYyECtLhOhunlTJcEFCE33NyuEyZy0DtjnduPMOXkum+ontWTl/dXH4dN
         BvKaBdZavdjEYzdq2Kh3z0dhSZgYALqrAfqMgkkoHZakyvyaTCbRxYd9SMGqBd4pbsjN
         69iJal6Sm5xiqBtDw7ybtyjAQpoF8MJQI2mKgWeHBSSSxEzJvj+yU/Cvd+5W7xwXX77z
         gKIITR3+Vt73pqdahkA4Ej/hIF6vNdCbWtBhCCYUTH96R0pEZnIJDSm40eb38INKlp/2
         oF0elwJ0xVzHVninb8qeKfJexuFBQjpTBDEWFAA8Y0xEquCEIzXBArDIzn2u/uZQ41ar
         c+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492677; x=1781097477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csBmCVVylLxai6dnI43bsxJ9942nZz/wU4Ao2SyUnqo=;
        b=T9qXRpH/9zD5xNBypItJJzArjA1kL8C2tlw9rRfRBWIRFgUZVQMj3CD+t7CkQWfrz7
         kUiukC63KJSvGsG6a60nCkL/PZP4OSM6R1EhmQQJ809xVrBonxgCSjo+/tJDWimRYXSN
         5JktGNn5W4bP0UQIeW+kMe9wpM7ui6J94GritRea2gDoh5Ot/PnrYOG3lHLaotnjye+V
         0VbuCwJ3dnLPC5mWnmIJdAcnnF21T9dhIG17C1dR9lNQaTA5a4Wb/1n546q+An895Geu
         8s2NuwkTU5gO2Bpq4nqrsDL1JwUNKh8C9EpazS0G5kfQlOYWNBjTjwVbed7zokR0rtIj
         4wsA==
X-Forwarded-Encrypted: i=1; AFNElJ/5genueSk9fGGWRdrnUh9P8KohdXpFDKkBvbZ41P3jAyKwZpxKsnFF2QClNJq+aC1odCWzw64+QQpsJ550@vger.kernel.org
X-Gm-Message-State: AOJu0YxR5uravcIy1cJyQ2UqG3azAqdMOXcQ2xI+94CsvuLovnx3cMlR
	c+/GAxO/3MiQa6xmBbTuFxf7Les2vzzst52cLQc1Cx6t29+iR7uikrgMWeJVSqo9+3gfdTTHtVa
	ilKBZscx6pnS5taRU456ewI0lPD5R4IBPxcNSzriOs0jeJBYVAH5AWZibSCf6Yg9NJVaE
X-Gm-Gg: Acq92OEo/8VIkCBnbn1VachMd/DBEjKfrsh+yNsHMT41WJkmnaHrGAesh2XALAp+xzn
	d8plCqxhg6xYqtAhHXO1pnJELYW3xKQHM7JnTCpBEaqghwEtxJZr2F5FJVjE+tTWdjY3YpJbNi/
	EK2yREvb5EP9ltS5212brcvwj80mUdx4dHCE4mcleCQ8Ntg+XpVhCuuBJRSzNE3NrxoOw4U52/e
	5G6mtV+bGlcW2WM4474egaVPVwtQnaALNw8LnjmVCVLMOseXp7JqufuxpUbpq2AMPrN65o0KOPr
	Y05ahgFi0FLDUOKnw7JJ4bhYKEwqSYwZkxMMPei8DBv0f1WemMUDKPJALPA6xvGS2J5z4BZPvnQ
	6kS+KWzftvhkYdnDEUzGVNPBcsXgx5hG5V841pwCmjbC4ViRKpuVWd/wlyUJpObMXJljqIJxn7v
	vdxCh29a5b2+Sv+km5cRSROjoQzfNTftZletuKxGAdGbj5nw==
X-Received: by 2002:a05:6102:5091:b0:6c5:d55d:c095 with SMTP id ada2fe7eead31-6ec4aac406fmr1221640137.26.1780492677064;
        Wed, 03 Jun 2026 06:17:57 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:6c5:d55d:c095 with SMTP id ada2fe7eead31-6ec4aac406fmr1221577137.26.1780492676569;
        Wed, 03 Jun 2026 06:17:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2e9a9esm8876651fa.36.2026.06.03.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:17:55 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:17:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Message-ID: <ci2ur4vurrljhvkza7nqfq6hsjpj7aurb3r3lvjkebfwkcae35@kvnjmosamfzs>
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNyBTYWx0ZWRfX7koz366jjMtd
 0lCLwOtS4D6BZyZ41jZYVzHTfLq2wqbWEjOWo7T48ysLbWHIJLM2gjfMPCvvkZQ/eBNBmHXGzYt
 upolu6/bG0hmRxhT+GEa3mkKnEYSZ114v8ObKTwAQQIaAAl+ifXWnVY+GRiHUN2IGQyjeTqa03G
 tq67MoXS4adwbglyt34BtS8PbyAU5oO9Nmo8hJ88pz2b/iUIk213tAdpZBSu6SVc0Omc7w2Lkbr
 Rf+1s9fqzIzGpKt+q21xhPVxHzv1jkiSf1CtWQVACTAI49kv+6D2j8wQrsFQ13+YQPrBr99C9yl
 YsjWV7Wev1noyhmVNLyhMM4XPyoNVMScihaNTHOraaM/9lSN3zi3b+55PaEStKaKTY39FBrcT2j
 XHLfklaeFq5nLr5Vv2h9jlYWleAybyY7mctiXOa9k/ytBo/dkVvNOskGjltjqyuQjS/l4kI3Hi2
 XMSi82rcBvtS5pUzoyQ==
X-Proofpoint-GUID: um3A5OmsTk03RmJS_FMdtzbX11qx9jSI
X-Proofpoint-ORIG-GUID: um3A5OmsTk03RmJS_FMdtzbX11qx9jSI
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a202985 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gpHlVAh8_vVDBl5ta1AA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110973-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kvnjmosamfzs:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC36563818D

On Tue, Jun 02, 2026 at 02:52:00PM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
> PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
> enabled on power up but that's not the case for IPQ9650 and we have to
> enable those clocks explicitly to bring up the PHYs properly.
> 
> As per the design team, REFGEN block provides the reference current.
> Hence marked the regulator type as REGULATOR_CURRENT.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-refgen-regulator.c | 94 +++++++++++++++++++++++++++++--
>  1 file changed, 90 insertions(+), 4 deletions(-)
> 
> @@ -62,6 +75,49 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
>  	return 1;
>  }
>  
> +static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> +	if (ret)
> +		return ret;
> +
> +	drvdata->enable_count++;

I think, a regulator enable() is called only once. Is there a point in
having enable_count as int?

> +
> +	return 0;
> +}
> +
> +static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> +
> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> +	drvdata->enable_count--;
> +
> +	return 0;
> +}
> +
> +static int qcom_ipq9650_refgen_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> +
> +	return drvdata->enable_count > 0;
> +}

Linux knows if it had enabled the regulator. I think the usual case for
the is_enabled is to be able to read the hardware state. What is the
point of having this callback?

> +
> +static const struct regulator_desc ipq9650_refgen_desc = {
> +	.enable_time = 5,
> +	.name = "refgen",
> +	.owner = THIS_MODULE,
> +	.type = REGULATOR_CURRENT,
> +	.ops = &(const struct regulator_ops) {
> +		.enable		= qcom_ipq9650_refgen_enable,
> +		.disable	= qcom_ipq9650_refgen_disable,
> +		.is_enabled	= qcom_ipq9650_refgen_is_enabled,
> +	},
> +};
> +
>  static const struct regulator_desc sdm845_refgen_desc = {
>  	.enable_time = 5,
>  	.name = "refgen",

-- 
With best wishes
Dmitry

