Return-Path: <linux-arm-msm+bounces-101321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHBpKWYBzWlNZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:28:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 463593796CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FFB3306A337
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3163AA1A6;
	Wed,  1 Apr 2026 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COiJk5TM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxoqrHRK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63B63F99C8
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042589; cv=none; b=Ktdq8CoPAi0//gd+l8odDjSLSsa9ZMbxD9GVdPNReMtoa4uSjs/D48ejlJUM4nNXk69Z0FQmELg1OWQp4JPz+2emmCEqkjZXA8DsPhSUmneNtEY40ztf3rCoEkpU+S1nPuItVrhmrUUChxtdiDPmAPP03uyGPzGaP3j3GxEkfLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042589; c=relaxed/simple;
	bh=HFZIwdjvFCVqlnlKEXL6zunPKCqxEN+rXSac48bmSfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRMxo4TAJu4a3PZhJ/4K1tvW6eY7RnrEdrEQydFgc1esKqfyHbv4WeY9wvdoEmrv29Jb1ziGLOCrKdfFEB5Oz73WDY02cxHO5oof/sgH/uBRGabxuxcgmuRqGhfbx/oOahJ8X2bKwYvWxYbkvOxASd3vnj5zoSweCRuCwT6rTHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COiJk5TM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxoqrHRK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63188WQn718531
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EFpGHIloUslqBpn7CjNpb/3m
	u/C+T9TgimU/YhpEbzk=; b=COiJk5TMOFLBEqzniUjNzusOdYWQtG1IrGqUvqLp
	HQgarzGSNzQ17FqSVU28xOmwQwgPvEf1r5ZKrofdFd2yQdempDYH0ZLi5oXLQ+8E
	Xzjf7k2VR5p7pxUpASmVNpjZTYId4nITC3VOBzRzBR3J5Pwk4EL0D2FxY5gVCHyS
	U0DpocZlyJQpmtmM5Ui+8nKpvb6Mp2ywWN8PaXpVulNE+hOuI6prOIgxDYSfdIQZ
	WvDWSFGf6sQzXbpnlI1U6FcU7Mg2L9Q0ssz8/QXo+4J87jenD55Nb4a3NDB2rmvn
	RshsTWpIyRJ4chdh9eXG8rTsta5zWuMp+VWHZEDja98qUA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsuq0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:23:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094ba09affso73596791cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775042581; x=1775647381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EFpGHIloUslqBpn7CjNpb/3mu/C+T9TgimU/YhpEbzk=;
        b=kxoqrHRKLT0LA9jAf8aftHA+TtHFjYr4fVwmIfg1FFCl45ykjWxJXsS47YxSPpP5ku
         7qRpRh+6IizcgZ/6P5yTzDcfkkGk8KvlHHZFPQn1crG95+lFTR8YEXZ6JxdH5sfZaf0X
         YnKldYIw/+hYZKZQixr4N8p1TcvyhkWhT0l3wMH5HL1E4ztUQiwChYYzoaiOisiV1VV6
         R0zR+2gaUfQ1DxtbYmohvFDwLwRYH0yxd9x0j+jW3AW0c3bsCqt9he1S7IWf5ZOLgeUW
         jkKYjg37sdELYH3XSB/SWc6FDm1IkZlsvRJUaNL6JdR0H/TM2YnE+H5GaD87aPtmnlHJ
         jiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042581; x=1775647381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFpGHIloUslqBpn7CjNpb/3mu/C+T9TgimU/YhpEbzk=;
        b=B8tlxMIr6JjAeNCpBvZmhMx3Gk1PsB2ot5Ry05qn2ea3OmFxceR0Tb4+omGGDTkDe7
         RJYUDwhijlPeZISsKTl06eqUrKen4QIn67epJ0mDPOuIjfPPbVULEwDOFXoai40oyAzW
         fFBEXcVzM78kDseJ+yv42X3TPw+UQVl2GgmkIZrGRbZJ9PmzlCGyaNO+Sjmm4yTqz/8M
         vssT8bJooegWdFMrrrCp0/Gj8M4FhMGtTkI4/+MoLlJ/PMjOWXvTAmcxurVUy6LeIQHB
         HDfmwBFMP9PeRc81OQtyRUVqnpcf0KlPYx8/AFGCHJdRRL8Z4o1Pdg11TqxTHf+WqbvK
         IpRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWobW2S5EbP/VhqWiO4dPIeDYQxCl8h2NBs3rTJJPbZNdV3zXhOLJtDmpS4ewjKQMOYmN5U6FO2+ND42+UW@vger.kernel.org
X-Gm-Message-State: AOJu0YyULxcMSN3Dfrmo2GBCUjrV9oRBxh1Y5EsghlMw4Bp9MFc+dqgD
	E/rTNmcywAl09Qbc8XcmZ5bS1t/jy2jf8Nv9Nm9qzrYgSaqTVlVesv2LQTnSt2+cG6U7N+n/HrE
	i3oO9VYezunRQw9hm3ZhgkJz9Oe/JiGI4f4QiL+ri+mgZmh1AF99QgLmEMgdi/7s8iwal
X-Gm-Gg: ATEYQzw7oqQSwid1FjadpzA1fretUkYdGo3B76hvT0ZdsIj9QE6RgSHXYz2duwxfrFj
	hLQjOK1CxSW2AjuxWpWCdCSqfa0XorVI6PywqnN/1lb+51FThO180orS0llR5u6FHa6MTiPW2ZP
	mpnEPSEjeXSzl3ESAhVmXWgj7JO+Wu/Wyt+02aR4IgSJxvU3BetPYQtCJKq5L/UiglgAoyDdSlo
	WP6AcTn/Ida6ncqL/GbJOGuyYrfocGt5RB0Ugc1nqZYsM9iJ0DlHmmaVIMdRhu6HqYTGHuerIfr
	VDwI0dW/QH1UwqYl+ycEu2soa5F4C99XLn1hcc7g+7498bv4iDQVFubuIf8sFIDrIAuPkPveTdD
	uue8dAmDeaD7DjWE50XO9rcGQr/2ItUlrHpsEDf6mSR62ffG9LU+KDx1pYkTd818nfVePQiln23
	FVd+DtBlZQ3PQaI6lsEs7ns/QuPB1WGIVgLGA=
X-Received: by 2002:a05:622a:1244:b0:50b:3f09:1942 with SMTP id d75a77b69052e-50d3be2799dmr42181601cf.66.1775042580913;
        Wed, 01 Apr 2026 04:23:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1244:b0:50b:3f09:1942 with SMTP id d75a77b69052e-50d3be2799dmr42181191cf.66.1775042580471;
        Wed, 01 Apr 2026 04:23:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c0b817e2sm930683e87.59.2026.04.01.04.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:22:59 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:22:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
Message-ID: <mxawruvb2p6svks3y4rab7feyn4dhkwe6dosjyc6yt2ozdaual@bvvof6rzm3jo>
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNCBTYWx0ZWRfX7W75waeEojhD
 3aOTC0bSA7wRz95x0h5Q8XsMzeQdNY4QNW1t39xWIsHGV+4/uR+IeZXi1fe2TJkdVU8lWcqSzxg
 TtUl5BOMw/kkCm9mCLioppkysV/RnnrrDYxrSU6sM0boutITo/W+ixPCRaPB08Nuphmty7JpvFE
 4r5x4eLx1Zmg8Qrn8Xk1oQhxL8v1wGnYs2Xtwr9qAt4gPT1NwmcwY8S2XMfVFejg4qkEJzhFKS5
 0I0gX2nbmHIiHSaiu/DVJdX4ASLVJJ0kGbrr+czkCXJriAF+blpTaVevpWoMU+xPAj6l1qmOo71
 ugZdeDqH+O/lRkzEK74sfRYTZ8jM70w/4X2cxGsoZIltuRJ0hRSk+Yatt1rrhMPpTFLnHJ/csHv
 04vUctHAPymTsc8gGy519M9FYZK+zhlEkJL12DnZB1bjqIantMpQM+d2ShiMrQ9hbnAZvO9Z5GD
 idBLv5F/QGLQFPsd9TA==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cd0015 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8M53x7_Y370lfPAVnkgA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: XpSxcvsmkEwoxJ1CY1EtJWjLbBYu-brA
X-Proofpoint-GUID: XpSxcvsmkEwoxJ1CY1EtJWjLbBYu-brA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010104
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101321-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 463593796CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 02:41:24AM -0700, Fenglin Wu wrote:
> PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
> the definition of the channel status register bit fields. Add support
> to handle this difference.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/spmi/spmi-pmic-arb.c | 69 ++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 60 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 69f8d456324a..deeaa39bb647 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -28,6 +28,7 @@
>  #define PMIC_ARB_VERSION_V5_MIN		0x50000000
>  #define PMIC_ARB_VERSION_V7_MIN		0x70000000
>  #define PMIC_ARB_VERSION_V8_MIN		0x80000000
> +#define PMIC_ARB_VERSION_V8P5_MIN	0x80050000
>  #define PMIC_ARB_INT_EN			0x0004
>  
>  #define PMIC_ARB_FEATURES		0x0004
> @@ -63,11 +64,34 @@
>  #define SPMI_OWNERSHIP_PERIPH2OWNER(X)	((X) & 0x7)
>  
>  /* Channel Status fields */
> -enum pmic_arb_chnl_status {
> -	PMIC_ARB_STATUS_DONE	= BIT(0),
> -	PMIC_ARB_STATUS_FAILURE	= BIT(1),
> -	PMIC_ARB_STATUS_DENIED	= BIT(2),
> -	PMIC_ARB_STATUS_DROPPED	= BIT(3),
> +struct pmic_arb_chnl_status_mask {
> +	u8	done;
> +	u8	failure;
> +	u8	crc;
> +	u8	parity;
> +	u8	nack;
> +	u8	denied;
> +	u8	dropped;
> +};
> +
> +static const struct pmic_arb_chnl_status_mask chnl_status_mask = {
> +	.done		= BIT(0),
> +	.failure	= BIT(1),
> +	.crc		= 0,
> +	.parity		= 0,
> +	.nack		= 0,
> +	.denied		= BIT(2),
> +	.dropped	= BIT(3),
> +};
> +
> +static const struct pmic_arb_chnl_status_mask chnl_status_mask_v8p5 = {
> +	.done		= BIT(0),
> +	.failure	= BIT(1),
> +	.crc		= BIT(2),
> +	.parity		= BIT(3),
> +	.nack		= BIT(4),
> +	.denied		= BIT(5),
> +	.dropped	= BIT(6),

Would it be better to extract generation-specific callback to decode the
error rather than defining the list of masks?

>  };
>  
>  /* Command register fields */

-- 
With best wishes
Dmitry

