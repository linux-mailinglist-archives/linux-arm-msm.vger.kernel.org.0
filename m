Return-Path: <linux-arm-msm+bounces-104011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K3UKeNB6GmZHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 05:34:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A8C441C8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 05:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 936593020824
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 03:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D1339B95A;
	Wed, 22 Apr 2026 03:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5sspKtC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9pm1I7A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A57E2D2495
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776828896; cv=none; b=sWN+BpJAsgLBYQtxLAOxcgvTcPNOGKwLNBU9iM7wXDoQ3/znyexFMk4leEipS9O60vJoeoSeD/a+ykOzBWhL4ZNOO8pYwiOIq4mSVEzvki5J7eeRry+Mryh94hvzCk5p+d33NM7ShCooc9Eks9vCyVOU7pBG78T1MfQTC85uraA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776828896; c=relaxed/simple;
	bh=kQCQBkRcqTbzpMOtHion5GTmkgR8sB2bsMMcFqaRqBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHC3YbIwym2Kx7Wp9tYaSM2WhcABmUbdrvFWw5XpvTQDnnyvjRSrYXlUGEJyms9WMq+DxYsSKqKvLnCqktJEdxRLXcK6aRkxK79IZpLSJifmfr+xtuKcx9YnMr3dLuBcYRSVMSmHQIeNgVovj7EgLjj3HCVNrFlVEtnYLL+RQv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5sspKtC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9pm1I7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIa8UZ3083047
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HydW/iQ1hGLia+6fY3rza5na
	MWMQ/7GHTu6W162sc9U=; b=f5sspKtCinRcD0WUBd4tS2A9grW7B2LUzuQnXG+7
	lVFbZU8w3VFJg16W+pK/hXzXlaVxtOhkFXlkdYfgZhQf+fwCfAD05gTHj2UD723f
	HozD1tSvSfRT1fgIOp4SUjuW+Oc0q1Za9SUC2PhIb9pa0a2cU/G9tz3p4lMAsSW8
	MRuuz8nrl4UIVOyUL147sI7gr3FIfh71DnwUNNJzAZwpF0nwVpJk2wVOKRJIbdVl
	J4NUBPOK84tYnHxp6OExXMgchLthEgvaup7JT6rY9xwkL9ycNk4m1CtVCQFJQ66l
	hz9f4VGBvYy1ag508YiYbw61bSAzCU4ZjG/iIQucTI8wXQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmhg8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:34:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8dac6233so84414061cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 20:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776828893; x=1777433693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HydW/iQ1hGLia+6fY3rza5naMWMQ/7GHTu6W162sc9U=;
        b=B9pm1I7A7z9JurW2S2RvUK10Hm5nPBzLijfAKyr8Uvnlsgo6q/Mujs3R0dYxLSjOjs
         V4N+Phl2wXCYdF4ho4tzbyHR/HYP/FZUpHBT/3fxQlXGRa3aQ0AoKuDfizWRSuHK+XxF
         vd/L2ZkyabGCf4j0ZN/achZhoeFzaUppHEJ/RpaPZNEJ+pNUbis/A+AfF1Fm9G8j4Wwh
         inxp9EBUmWBfGnYATvns+TNez/aBcs+6U41u+aPE0W6+mEys/detfKsNI5fnTehUmMRv
         NZic2pSqOkv0ziPniY6uRoqoIQ1bmWJwwMCeCf8omTjmCosmmRHLY3i/5kDJewvWspls
         Cwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776828893; x=1777433693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HydW/iQ1hGLia+6fY3rza5naMWMQ/7GHTu6W162sc9U=;
        b=LM5ZcuypUHgX8psa05snIuskCFYi2b7mnTPfDDtuonPWNMS6q3SDtKb95w9oIv03qb
         8uDPjPGFMNqury4AVNoV/PvUyoa/JCzvxh7EtTPYWA0UDDh9pc7r42Jncwqfm0GrQlrB
         5S7VKi90RB9xgG9ZykvZbX/saOjGWJMWtgNOKzRRbBz2yn/QUj/krYXIMV0/2v5/GV3B
         Mm4nho0xQYy0K5QvjPxSmvR0j5zJBDXbGGJ9b0SK8XpiJYXVloQ77w9TXK4E2XEfPIHk
         QgZiXYc929AdrcSwOOM0zCcJY+EQVrNXa8vveMMflqE2jOrjixdAlWmp49M2/BYi1Kfb
         2cSg==
X-Forwarded-Encrypted: i=1; AFNElJ/cukW+cXjflY5atzVT62VTwS3ltv6I42aX25jXTUk4xIPPt2OU9vw15EtCWBZQHC48jRjqhcbv9rw9dgSa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxztc3UqA4+VZL9qBvN9/AyzYWaklH1YtgHo14HUHhmByTZmuQe
	9DzvmgGC+hSKqHOw68NTVbzb/ezUtya+I2GymuHqSmz2LQI+J8ULp778ytrUWm8fLLqWtSPaxCc
	M6Y69Ajjzt7sXqfG9LESUGORhb74zexNJZL1xlkgKBXmOwG33C6JMBrqmGmESe1bbYwx0
X-Gm-Gg: AeBDievxgB2ufqM5P4JpYdqsXqLZ3NYvr52gZIaKBAyJIQEJQeKZxxBsUmmvmM2nVeB
	+n/V5WKeXGIRKsxO7mCcHnfZ+SvVBcBCmWNmvLIZw9JSQnXBMdx4FqlUtkK5UBkZ9BYYmUslBZh
	x6XHkobF3HEK/BIt3JHrzIXCNVgC1IANvOntYl8Y057Y/8fSBE7Fbcu17zVoBcCtrJ8CaZuIikx
	RBCp1JNNS/YoqbokG4A+mtBPbQYM1lGuuJFBAY4K0UNI8gtoMuJVdXi31kvVP0BqoNsEGiX5jdD
	Cu7OUzZMpReKHWSY+HBaWezFoVLJ3AilJbDD5DEYx/Ime25Pq3JDS0OyaFIPMXyUoALyDx3i4bs
	pOPpb4D+TC9N1vA6Al1AtorNVQyx/vaT5cDkfU0KjvP4soEvqcqK86nhk+3sLmKctEj945PLHWv
	HFp7qWkWzOoe0vZGO7Wda3q8fPudJbLajEjHklv1pe6JmQHw==
X-Received: by 2002:ac8:7f41:0:b0:50f:b974:7ef5 with SMTP id d75a77b69052e-50fb9748032mr63848941cf.32.1776828893367;
        Tue, 21 Apr 2026 20:34:53 -0700 (PDT)
X-Received: by 2002:ac8:7f41:0:b0:50f:b974:7ef5 with SMTP id d75a77b69052e-50fb9748032mr63848741cf.32.1776828892775;
        Tue, 21 Apr 2026 20:34:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a3fsm4076260e87.59.2026.04.21.20.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 20:34:50 -0700 (PDT)
Date: Wed, 22 Apr 2026 06:34:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/13] drm/msm/registers: Add perfcntr json
Message-ID: <2hffq4vggj7udmaxiiqpkrx2dmik2eopscwnh7cztfw77umioj@lvxpatbxwsrv>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-5-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420222621.417276-5-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: 087u0_3Rh63bw7X_I_Kp_7g1QeP1-lcH
X-Proofpoint-ORIG-GUID: 087u0_3Rh63bw7X_I_Kp_7g1QeP1-lcH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAzMyBTYWx0ZWRfX6COVihATmGxN
 tz1YYoD2GpymWUnYXHT5iCNc9F2tT7JNFOcViqmpqea2+p0pOsTq1cl7HT73I4qAi0cDf8Ih2GK
 F5ODwwnK0TjtaUKb3puu1oV1R9pwVYViKiiEUTLXGrGPucxa2bKtLBYP81F8wSIMyvVnZBRiRxM
 ucipIjEej3AaCOCSMrfdKmLqthFwjsFz1dIVNGvIu7AKZbKkqcZm+mtGkUGaoxL4cwHiDt3oZQM
 n+Hx5KcEHrCAP2F31Asoh7EZqL+IXF1CATP1zPK8JazwQPiR4CpVi0na2w2S8Pp/4KLaIqwcHGI
 SLYWLO4mlAdoYZ6AY843rhTbnem5cIamBuHZqhORaJp3JP3okq+oE23A9lZ39RRW9TkYSbLXz71
 gpEgwFwSKtB+oLdBvOgSP1MTXRInNWllM51Gzeqzq8XfoX74HA8ddN//MzhAy/3AHMuY2oiTzZu
 zbQL3UqlZHEH9wpjU5Q==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e841de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=rwQr2M8RuynTKpNwVosA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220033
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104011-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51A8C441C8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:25:26PM -0700, Rob Clark wrote:
> Pull in perfcntr json and wire up generation of perfcntr tables.
> 
> Sync from https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40522
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                  |  17 ++
>  .../msm/registers/adreno/a6xx_perfcntrs.json  | 105 ++++++++
>  .../msm/registers/adreno/a7xx_perfcntrs.json  | 228 +++++++++++++++++
>  .../msm/registers/adreno/a8xx_perfcntrs.json  | 240 ++++++++++++++++++
>  4 files changed, 590 insertions(+)
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index ce00cfb0a875..55388544de9f 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -176,6 +176,11 @@ quiet_cmd_headergen = GENHDR  $@
>        cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(src)/registers/gen_header.py \
>  		      $(headergen-opts) --rnn $(src)/registers --xml $< c-defines > $@
>  
> +# TODO how to do this for a2xx/a5xx which have different .xml arg?
> +quiet_cmd_headergen_json = GENHDRJSN  $@
> +      cmd_headergen_json = mkdir -p $(obj)/generated && $(PYTHON3) $(src)/registers/gen_header.py \
> +		      $(headergen-opts) --rnn $(src)/registers --xml $(src)/registers/adreno/a6xx.xml perfcntrs --json $< > $@
> +
>  $(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
>  		$(src)/registers/adreno/adreno_common.xml \
>  		$(src)/registers/adreno/adreno_pm4.xml \
> @@ -192,6 +197,18 @@ $(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
>  		FORCE
>  	$(call if_changed,headergen)
>  
> +$(obj)/generated/%.json.c: $(src)/registers/adreno/%.json \
> +		$(src)/registers/adreno/a6xx_perfcntrs.json \
> +		$(src)/registers/adreno/a7xx_perfcntrs.json \
> +		$(src)/registers/adreno/a8xx_perfcntrs.json \

The extra .json arguments are unnecessary. Instead there should be a
a6xx.xml as a target prerequisite. Also the .json.c names should be
added to the targets variable, otherwise they will be remade all the
time.

> +		FORCE
> +	$(call if_changed,headergen_json)
> +
> +adreno-y += \
> +	generated/a6xx_perfcntrs.json.o \
> +	generated/a7xx_perfcntrs.json.o \
> +	generated/a8xx_perfcntrs.json.o \
> +
>  ADRENO_HEADERS = \
>  	generated/a2xx.xml.h \
>  	generated/a3xx.xml.h \

Consider applying the following diff on top of your changes. It handles
a2xx and a5xx prefcntrs, all the dependencies, etc. I tried
experimenting a bit, but I think the generated rules is the easiest way
to handle all the requirements in a simplest way without extra
repetitions.

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 6143283d91fd..d405b04fa7b7 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -180,7 +180,7 @@ quiet_cmd_headergen = GENHDR  $@
 # TODO how to do this for a2xx/a5xx which have different .xml arg?
 quiet_cmd_headergen_json = GENHDRJSN  $@
       cmd_headergen_json = mkdir -p $(obj)/generated && $(PYTHON3) $(src)/registers/gen_header.py \
-		      $(headergen-opts) --rnn $(src)/registers --xml $(src)/registers/adreno/a6xx.xml perfcntrs --json $< > $@
+		      $(headergen-opts) --rnn $(src)/registers --xml $(filter %.xml,$^) perfcntrs --json $< > $@
 
 $(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
 		$(src)/registers/adreno/adreno_common.xml \
@@ -198,17 +198,22 @@ $(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
 		FORCE
 	$(call if_changed,headergen)
 
-$(obj)/generated/%.json.c: $(src)/registers/adreno/%.json \
-		$(src)/registers/adreno/a6xx_perfcntrs.json \
-		$(src)/registers/adreno/a7xx_perfcntrs.json \
-		$(src)/registers/adreno/a8xx_perfcntrs.json \
+ADRENO_PERFCNTRS =
+
+define adreno_perfcntrs
+ADRENO_PERFCNTRS += generated/$(1)_perfcntrs.json.c
+$$(obj)/generated/$(1)_perfcntrs.json.c: $$(src)/registers/adreno/$(1)_perfcntrs.json \
+		$$(src)/registers/adreno/$(2).xml \
 		FORCE
-	$(call if_changed,headergen_json)
+	$$(call if_changed,headergen_json)
+endef
+
+$(eval $(call adreno_perfcntrs,a2xx,a2xx))
+$(eval $(call adreno_perfcntrs,a5xx,a5xx))
+$(eval $(call adreno_perfcntrs,a6xx,a6xx))
+$(eval $(call adreno_perfcntrs,a7xx,a6xx))
+$(eval $(call adreno_perfcntrs,a8xx,a6xx))
 
-adreno-y += \
-	generated/a6xx_perfcntrs.json.o \
-	generated/a7xx_perfcntrs.json.o \
-	generated/a8xx_perfcntrs.json.o \
+adreno-y += $(ADRENO_PERFCNTRS:.c=.o)
 
 ADRENO_HEADERS = \
 	generated/a2xx.xml.h \
@@ -244,4 +249,4 @@ DISPLAY_HEADERS = \
 $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
 $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
 
-targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
+targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS) $(ADRENO_PERFCNTRS)

-- 
With best wishes
Dmitry

