Return-Path: <linux-arm-msm+bounces-111475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZeMrIfcBJGry1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:18:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D089F64D2AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:18:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DcpkRi+g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WmI6wPKJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111475-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111475-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B865E301486F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8331B2EEE87;
	Sat,  6 Jun 2026 11:15:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4263278C9C
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:15:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780744546; cv=none; b=ThyDMetEbQhMjg0Vyg9CV6q3iBUXnh/dViUe86kBjWc18tfJIpTrAKBt/1lNc/iNMWlzE9FCApnDvO9RUmgUjNCGE9PEuwNyMhyWAT9npcShBfYXwO/DFgxuDBEP45rqoIKlZKIgu8H8kDPSVmGZM5CUhacqD4YVaq/wJtvLslU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780744546; c=relaxed/simple;
	bh=35T4RPwZtKj/AACr5jC/VoJ/dH+ywt4DKiJkh67GbEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGmL4twJdaYvvUnlfBOkOOfNODI3Gn37AP2X23mgMzU/i0PKwEHTUDPFZ4eaSYOhL5/OiMiSBLvKBsLPTXgq17Xvx7P/a78yREwKt3WvUcoKU2mcFHMm4m1C69cOEcBjrHOsXThdiaKqbUn34idonKuCtggwdkN8fIw7WEWDONk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcpkRi+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmI6wPKJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65662twO654089
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rY52lz044eYyFkQnD9+hzUtj
	rn2eYKc4Hi2FnVBYibs=; b=DcpkRi+gJXJapy0wslv31vjpyEXwHfmFUKqAivZf
	SLpclcrQ7pyr2zaHCGLzImnznEy3ipjG1uiI/vjwJChVTpAOt/Lq3gzqt3B9vhBb
	sk+STm1QkGawJ/1TZy3SORBCjvpIYEu37Cz0gjZ8UIyeVn5KG9EmNnQ3X0JrHwjm
	atLbAYNCYU0mdnj5itXTZVTOyost3TswOld7MnS/nfl6v3N44E42kFHCOHlAVQUn
	D4Ao8ehQphWG75DhMTf+9XxRngTVyQiqYwbvqOKbb2zQzsiPs8tj3qsJH/Oh73W5
	pJShzb6EHWue4l3gRZk/Zkzhn0Ue4K+PX3kjOWqjNx3uQg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmr8x7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:15:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd2a26ab0so1288557137.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780744544; x=1781349344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rY52lz044eYyFkQnD9+hzUtjrn2eYKc4Hi2FnVBYibs=;
        b=WmI6wPKJaKOOL67KMugyBHdW1xYzDyEWYWyAq7lHhKQRUHXoL8iim5Zr44svhxmC18
         nhr0TjLXLwz4B+9KyfT899rf8QtIArePi2Ha27xCg+oQNYKH6Do9fOHs+N+91dv8N9Ya
         M2zq7UtnPFcJNC5ir8JeiSStfnxaNpBn/bn3D6w9XAoWT49Vh4deDUTpKo7u3kLSFjp6
         1iNyNGj4trLACaT0IbWaJ/PzmCegWVewoKRIkBRgR0u1Bh++b8CNpLYLCbnuc1P2cNVx
         T6Tl4NfOEMK/t0jWOaFOnW5Glf6/jR/z3Wchw2j2AiFYnT7Z0cup1sCnkTC3QbzBLKfM
         3Rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780744544; x=1781349344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rY52lz044eYyFkQnD9+hzUtjrn2eYKc4Hi2FnVBYibs=;
        b=HLL4c02u3ZF5AZrNJUzIw3oU86EDcIXzKmRkdB2bTsKFo5U8ZZ6yKynFQnSAYEhgc5
         lvFhUHmgFjGXC/Pb6z07002vRdwY6e1xUoNKP2YhuGLXiiyqraEGWz+ZmLQvaluVwIWX
         sYKGP3rB9yMXlD454PJ3anEjFnLfRowr64kBvPp2kAlTD+TG2PJZ4vX3njwjVpYvrZ6N
         JSvuqd9DdyBipLiIgxYSFa/8lDhcLp6+vO5CeEzdIMDrt1xtjkDCJ9i/VLvA3f1ZV+B9
         g4n7QmFLOZPkoRp6VkG45C/WuYzQ9ELsacMEtcHxzhKOAf6OL4c1cCgkMLgfLRumz+hy
         fvNw==
X-Forwarded-Encrypted: i=1; AFNElJ8BY/bKTG3X1BHgtWvsnIVLYs9QX9YB1CbyAywsyJWDmMWY9rZ1Y08Zfn4wVjSmqDAOia07LsUiOC25NfPm@vger.kernel.org
X-Gm-Message-State: AOJu0YxveUFHBEvmMRurT0ETLY+L9lckmRvagihQRAwMCWz2jttxkpWE
	+sO3LYYHE6/n3A3xMpq3EA83xyRLwrZ7eM/kNjcwQYNouSd4CT8yb6SlGSICirfslki8LDdYC/p
	ADHZXDLUPcPJ+PeDho1fY0zOoER6jE47CgmAHF+nzbug+fqVyILlwqQmMOyfRStgWSONu
X-Gm-Gg: Acq92OEhb2/2qaib1ISSTuaWSMU3hrJ00e1i9FFsL0YKhgCmlCYzRaNWEMQ8uautFym
	7yNYdSDtJ+XqGrIBxyzyum6Q1gbXRfCgvjGyKi+VhwAvV0e8GQj+87LdpaeookTbfqZe0rs/wJ4
	3EsZeYBpdiaEBDS7RcKA6DvP7D7jJLdNvRljqBA7TTDt4+fTeleSUqZct74sGI/RE5tFaIhB3G/
	mCp1B5O8j2zsnbQ2rqfqkXw5bfAb0DJ/WXKn39eC5VTmyPmjJihfktCgdNF9yw6y9HNYPfQIGZi
	14W9la6ZzoG6+3bOEKX9EVQ286ZARVOYH0kqWjsEIk3iiiWMe2pgZFeP0GI7hoGr0B1GxR+zm3g
	kjj+4aM//zsR8OYLlqd4RAApYyMg1T5TYLLPwSZr0q8z4p40lK4auk32zKLUH2IVAbpryvX6/oR
	U1Wxj2cq6SjtG3tA2dkjlRSNUu7+BKlHdEoiZLZep8AIpRvQ==
X-Received: by 2002:a05:6102:3e27:b0:65a:fcea:5a8 with SMTP id ada2fe7eead31-6fef75ccdf8mr3760602137.3.1780744543584;
        Sat, 06 Jun 2026 04:15:43 -0700 (PDT)
X-Received: by 2002:a05:6102:3e27:b0:65a:fcea:5a8 with SMTP id ada2fe7eead31-6fef75ccdf8mr3760598137.3.1780744543178;
        Sat, 06 Jun 2026 04:15:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990486sm2354393e87.68.2026.06.06.04.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:15:42 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:15:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExMCBTYWx0ZWRfX9K6f3F2kzQg/
 HEVr6LfWusZbzVLdTsTeLbtNJon6vKc4gO3D4y4o5icF30HVC/fRC4oxG67t3ifpj+8fjyNAFH3
 2q+HBgwKldhQXhX4r0dNkpL+WspQgZP0Xc6hIsFXDQ/VTSHqMvfSP4LmTWKq8H3HKaMpTqpB8EX
 ZT8JRHalFv4FcaUyBMZ6EbhKT3ggiZRMNHn+e40I6wd6VipOiNgCRNBiqrX2bzc3A1hCafa4GyR
 H71UJwnBAq6OQGOQO5R3SjdM4dfV9ycrvxoSDD9MxvHkHiNA8y0Igohs8Ff8QsI81MttuG4PjwT
 t9PWEoQ1MYHQoB+A+eGLk5/u17Q0Mtbhd3wUZq9YwYZp7gjEALovnx0f/a2tFDv/j6LbqxQcElG
 LXyoHmTiMtQyCH9PcwmuQwBrDKq038H2wQN9yJ9rdpOMmTIGL0D8asssZ7o41E64lPkifSY6f+S
 V9knUPsQ5P7C1SwA2JA==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a240160 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=20KFwNOVAAAA:8
 a=jABXd_slnFCNTMqTTkEA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: HsQL9scdhXMXenECw9UsfeDJGyplKZA9
X-Proofpoint-ORIG-GUID: HsQL9scdhXMXenECw9UsfeDJGyplKZA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111475-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,uuhtzbludmzv:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D089F64D2AA

On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
> Several qcom clk providers currently have a sync_state helper set to
> icc_sync_state(). With an upcoming change to the clk framework, if
> sync_state is not defined for the device, then the clk framework sets it
> to clk_sync_state().
> 
> Clk providers that require their own sync_state will need to call the
> framework level clk_sync_state(). Let's introduce a new common helper
> qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/qcom/common.c | 9 +++++++++
>  drivers/clk/qcom/common.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index eec369d2173b..31382c49c948 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -3,12 +3,14 @@
>   * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/export.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk-provider.h>
>  #include <linux/interconnect-clk.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset-controller.h>
>  #include <linux/of.h>
> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>  
> +void qcom_cc_sync_state(struct device *dev)
> +{
> +	icc_sync_state(dev);

Only if desc->icc_hws != 0, otherwise it will mess the interconnect
internals. You might need to set drvdata to desc.

> +	clk_sync_state(dev);
> +}
> +EXPORT_SYMBOL_GPL(qcom_cc_sync_state);
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("QTI Common Clock module");
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 6f2406f8839e..ee448163b1fc 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -88,5 +88,6 @@ extern int qcom_cc_probe(struct platform_device *pdev,
>  			 const struct qcom_cc_desc *desc);
>  extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>  				  const struct qcom_cc_desc *desc);
> +extern void qcom_cc_sync_state(struct device *dev);
>  
>  #endif
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

