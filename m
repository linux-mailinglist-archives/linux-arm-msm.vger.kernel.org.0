Return-Path: <linux-arm-msm+bounces-105084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Mo0Jhkj8Wl5dwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 23:14:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA748C42D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 23:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21E7D301ED2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 21:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36643A6B6B;
	Tue, 28 Apr 2026 21:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WAjSRAHU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTbRa4HC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1B1397689
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777410836; cv=none; b=RsVWIgFqhurTpdc+QtrKCoEfi56ykcRuMDKjaLtIZdJPMGK083tA9EwfGLUUCK4zaUrxdJ8UfwO65IubTH0ZoEBeEp8CIfDsLwdv9Vio6MTUIUCzPTu8fZgjs419Aq7clD3JxxR6Rm6qKuDOp3GhqOTUJYrml+NgPDpdEnpNOBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777410836; c=relaxed/simple;
	bh=Hrm0ZhcHcgCT1XzU3maGBkU6Snz85dUcp+3SvUfrY4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkuIoInF59cWc8HBPyuNgSHK4QXzdiAEBNEf3nW9pRAQnBATM1SlGt94FLagTlRwBb+2PytQrPlFxQJTww+21MVX3wqAn2vm3HCDdUPFCc/XB4IH3wqcKZPcGNVtyFGniOI/aKHeLfnVZ3KR5Hv5K5ltBhRRN/w/diOPMdo7Nr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WAjSRAHU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTbRa4HC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsRDM3705150
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f7TCDHNSisOZ4cJJC/DCoEBk
	+8T/g6HxxJjaANTvPeQ=; b=WAjSRAHUekQ7NED9nimZkG80gnp5uIoyFJuLDCwa
	kNNQymlHGipY+WOOrKJm4io6w6OWu8RwKxfqDO7cRU+jLhftD8235bgIqmtw4baP
	gjJXdliIxYYO1tORXlyfAf3G3JsWHQXtU4MhiDl0XXhysvyZRjWvCKk/YHlJeYO4
	fjp2+QPDaNj+m43KJyteZK128mNiSnPE2769POprj5nN+nC+x3fxgT+ilqrkV8/r
	5k9zX0P0rKhlryvA5bedIl+XkyZXbBEOlM+FX27qLh7l/2Jl+bJGjLWCQQAXK7hs
	jkSOxkUeGioZoVPVzJgk2QVImHamQUSvnJc2EMlfjpI+vw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxhaep2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:13:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb007bc36so23726161cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777410829; x=1778015629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f7TCDHNSisOZ4cJJC/DCoEBk+8T/g6HxxJjaANTvPeQ=;
        b=VTbRa4HC4+SGxYb+XWJZd8zTO+mdPt8RfMVVwPdUzJUUS74VRHL/Oh3BzN8M7i6PND
         XpehA6YZhfglvYRf4IzUo9xmWCK5ZCKQnfgow0AfzTxB+DU60ReUiz7Jf+xzorQZB01j
         FAUSYPskeRsjFxK77yTwy0FWzH2kur6PnlFUlh5a4FNzcyL6Diear36/JUqgl295nWgs
         6zBOekYZUPAd/Qv0Vb6fiWajV8SCJhnCIY5G7h5u4U19mvvoN+bPd3MSlPkApsDYNxui
         F+o6qY7XE14KMsI1p+r6zLcd7I0S3/inpaualvX68gdeOkxk7gj3jlgM63vpzI2o6nYB
         wmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777410829; x=1778015629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7TCDHNSisOZ4cJJC/DCoEBk+8T/g6HxxJjaANTvPeQ=;
        b=OFD9BOIrnkLRzvOgbbvzsk8Xd4URHPhmdH4ulV1MEHADm9hCEMpau80Q/NAcbNb8AE
         CW9WiXRWv+ecQK1F9IuwpCUXsNq2ekwP6P36Lah/F2vvZFIVkAUcllLbe7Iz0mcrEjq/
         bWsJQNd55EgV4c3ofWm+atHRc08czKdgzEEPyeCGB7O+tkXUiNnQkr7sbLTabgx/P4oK
         XuwAO7jiobgeomO+qV8CrsIpJpmKSxo+4kcfnMbu//Y57yhIRUTbSZl+9cUtJCpt3NnB
         esDxgKd2xSslNuCbiTKXhQ9BWnScokrdojadUqbxvGan8VlFyCmWHHkEB2GLRd1+8FG+
         +1wQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WC742KDVpkVwu28u3UVVrZJ6w1zvXqJHYu8GCqpC4sA23IRKDke/Q8OBlj8CUJbXpvPT3l3acIsq/Icfi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy06Fs8xrWCokkPkYf9KN54j+qpdnlCouLvUGIzASsWKIV31ml
	PLsBG0z15MIMhXFVJ77+SQbCREmyGQ795NYq5CGycD/qvR/qiWVGmcUgjnF61PZNIJI5d7TnRfu
	EtXAe12qUDKFhZ4LG9NZjt+HeN0ymHtJrhIcAtgeeYVIPcizdZJYVuUiqy+W2k2BPoAuq
X-Gm-Gg: AeBDieuP9K5tiBbbewFqm2aHm0s0Urx1X10hkUqnpFZWhN+LAzq23KWC2So1Pt+f3Vr
	p6LXW7wMCqOvXcPI/r0I7hrgjK9tm0Tlos56+ORzE0nwLPExr9n6/TULc+E/iM/QqrVmLUmSN45
	qS7B2qgmUWOhBobREToKH/qE3v9az/nKz7Bh8krfBXMDBmkYlhSLqzxJOp9gzGCzoGtlsHBmAli
	cNtMv82EzCoYJd9reqeHR/UamI5yoJpN6hKMw/cU7F/zfgHml1cM8oQT6rbrK5EMjABmlOQHuQS
	JuDkSnJDTwZccWmH97xhptqWWe+xenwSki2RAo4l5MVGxpJb14hxF+594WF79KuT7X+bE0BkSX4
	34kXL9sdSKLT1BR+yharXAwiKcoscI/TJkCkBE/MJY7CyqtdK8ONRoyTGt8Vi2Okqxn9KeO60S3
	4Za0NS5WO9e+fHA4D9alcY37ejXjhkU406y9ef78iAZO6LuQ==
X-Received: by 2002:a05:622a:4115:b0:510:1325:58b9 with SMTP id d75a77b69052e-51018a8d7f6mr19041351cf.41.1777410829599;
        Tue, 28 Apr 2026 14:13:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4115:b0:510:1325:58b9 with SMTP id d75a77b69052e-51018a8d7f6mr19040911cf.41.1777410829073;
        Tue, 28 Apr 2026 14:13:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a756d1bsm34384e87.47.2026.04.28.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 14:13:48 -0700 (PDT)
Date: Wed, 29 Apr 2026 00:13:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Make important drivers default
Message-ID: <lccuj5tcir57c3pzlcvyjmle36alr64zv257si4taqis3novrs@exgphqb3k6tx>
References: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDIwNiBTYWx0ZWRfX/jBOb9ARGU3Y
 bYikfvbDWr87eQrA17QpddpjuQLMKLQiMedmuVdlpa72XpyO4QzjziKJhjbaIu5DJWgSSORt56H
 loVwwqwOVgh3QqWG/UZC3EiEiVGMoxx9ZgNrsnphtgXErSInjOGD+WK81ZPXq4OfXhi6SfVet7w
 OqrwhbDcInKr9VRnPcGGJ3yxt0332n3VtbFurr+Z864nNHymj6JATe+R01znwUQng7KHgN5u4Tl
 tEyUnFdpXdBc0fDji7YhS85/wpUgEYIGTkT7b2hVKPSc7LQjWAWsDiSU5gbQFDEbSfBiM61/ZX1
 H9U46vj0Rub4fbAk/jcpcOAjALM3IRXJHPbSomtgqP4pYv7ahBEEXcHx09175VzWlO8WMhOAFMU
 DvBf0EoMmBhFdcbvzBiNy+sc5xr5niFyj08ub/tqu2obpeEmcbNnkX2cqphyznc1t8ZeYjm+xSI
 hFjWXN+P1T9i7KPnnjA==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f1230e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=_EZUpx9RV_GiafN7jJ0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: GjQKQRbabMmPpGBRQ2b-Oc9Nk4KBjsKV
X-Proofpoint-GUID: GjQKQRbabMmPpGBRQ2b-Oc9Nk4KBjsKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280206
X-Rspamd-Queue-Id: 33EA748C42D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105084-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 06:35:49PM +0200, Krzysztof Kozlowski wrote:
> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
> essential for booting up SoCs and are not really optional for a given
> platform.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
> ARCH_QCOM.  This has impact:
> 
> 1. arm64 defconfig: enable PINCTRL_SM7150, PINCTRL_IPQ9650 and
>    PINCTRL_HAWI, which were not selected before but should be, because
>    these platforms need them for proper boot.
> 
> 2. arm qcom_defconfig: no changes.
> 
> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>    platforms, which are already enabled on qcom_defconfig.
> 
> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>    time and feels logical, because if one selects ARCH_QCOM then
>    probably by default wants to build test it entirely.  Kernels with
>    COMPILE_TEST are not supposed to be used for booting.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> I did similar change for clocks and I will be continuing with
> interconnect and other missing pieces.
> 
> Changes in v2:
> 1. Rebase on Linus W. devel branch. This should go with pinctrl, I
>    think.
> 2. Add tags.
> 3. Update also PINCTRL_IPQ9650.
> ---
>  arch/arm/configs/multi_v7_defconfig |  8 ----
>  arch/arm/configs/qcom_defconfig     | 15 -------
>  arch/arm64/configs/defconfig        | 46 ----------------------
>  drivers/pinctrl/qcom/Kconfig        |  1 +
>  drivers/pinctrl/qcom/Kconfig.msm    | 61 +++++++++++++++++++++++++++++

I think it would have been better split into 3 patches, but this way is
also fine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  5 files changed, 62 insertions(+), 69 deletions(-)

-- 
With best wishes
Dmitry

