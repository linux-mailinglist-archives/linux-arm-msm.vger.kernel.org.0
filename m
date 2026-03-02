Return-Path: <linux-arm-msm+bounces-94939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBFUGuKQpWmoDgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:30:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D89791D9C6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FDF93005AED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CB737B3F0;
	Mon,  2 Mar 2026 13:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XlTo+jC7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FubZLl+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8FD37B3F3
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 13:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772458120; cv=none; b=JDIO6iO6fQ4GNXOkD6oAHqHgTmC+WQAnkypliWh4TIS504tstVdvYcW+mBwyqCVyWS9lhy/0VfS2RA6hebtpTKMdy3nwzbSErB/5KFdCIJbUX86R65btEttapk/Hj8p825m9tR49p/iXjVfSmOzTKcPSbXlqb7yRlYbJ1o0r/kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772458120; c=relaxed/simple;
	bh=QkJ9Vtha6Z4INRLo41eTUVGK4eUJJ+zEhGgfIC2bVI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0jPVOVYUyFt/VnnmQF8kKStfhnqNaPP2M3UgfsG3QkF8gaBYGeqNvUpjYe8SJCCYCxJVkwg224oQaMnokRZQJKSzCP3zwqBKvO6MqhX6NQxJKunWlQP+6dTloiSGubFB3JPkdawpcQEBZ7oZ3J+WwkW3hSIj21yMWI5hv5+GYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XlTo+jC7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FubZLl+J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294kjX1291354
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 13:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4od3+FkdJj/7JYRTmife2p+H
	VZPbbDIR79j7XAPdZHU=; b=XlTo+jC70hqrtQsXX+Yubu99WVS7B1yE07ganK18
	mhM/i3l5qTbXKsndYKP822aPEswRAtnxEn55kg3YhSSmRWztVz0RUy0cKLrD0mim
	yVuagsdgPvzHJH6Z5xcGIsz5IawtyCUPlEYvcgHX7kxrQBv+e2GWKWUsGf/mtjHy
	rGSiqg22qdEKXhd2suT7W9uvkhZRAOkriLtljZZeS5PIrw1SvOnCGyVGXGUcziMO
	4l0nl7qIDdutgR3Eit+p8b/0wbdIedkQVOh/qOdl5YHYLCYQdS7Rxvms2lMjRF8u
	Xmmjs8sR8M35ea4S2JFfHfpolrBk1KFZuRuBPWiCsERWcg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7ku0ufp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 13:28:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso526326485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 05:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772458114; x=1773062914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4od3+FkdJj/7JYRTmife2p+HVZPbbDIR79j7XAPdZHU=;
        b=FubZLl+JeQfxX/4kB03t6nCxtNKjQ90AeL6abn2BmDcykyo+d+MG943kLPccqebzUI
         iGobj099mqeU3g6G0izj2lfe9tgUpVcoGqIBMoH4p6hdrYYPqnpp2pdCtM/mFjqE3h4Q
         wDpIRI0hxB1sD5qg5LnBCz2lNQvd8zDtUyrNHB2ZB/s/6SaUntWGBxVdfawsTQsMoR9E
         4LHOrPQvrWgITzNKK/glIvumVSYCCvH4sLkIVmu/A7v19Hizw/Y+qgrP70iATLz75i1o
         jNqm7li3sk1Ie12WhGc5Ovk0oe6+CYTkWNfAbsagEtbUfclfjBG0uNzXCC4AEZp7mgsx
         OprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772458114; x=1773062914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4od3+FkdJj/7JYRTmife2p+HVZPbbDIR79j7XAPdZHU=;
        b=tqR7A9zJuyKGz8dzIxJfuAienk6MPbXjNkT3JpN/ubSAX8Lq0vOSbO5vUxsNYF1jCo
         6cv14pI0W3V9TSXElz0+uxZMc9xHgfRY22hcxATcZkVxRs3PaJmaUdIIB0YujKrZBDGr
         TSouPI+Tzd+ZLRFZR4LDiphcYrFI5YFGw3c4MkyExGHTZA19kwhMKxoI80m7dnz8DSNz
         B5H5/SD4ixcsWI4rCQZYcG8QcWQIALAHhGdZLxjGWa2olRo7W032vX2qlrrSyaj1dj3I
         +zDlG0OQ7u37K0GrX80NmowQYlqEqVlb4YH/bkWajrsZDrweKmpwfvcsRR7KGciHX4xD
         ziyA==
X-Forwarded-Encrypted: i=1; AJvYcCUyM9ffWjQvzijywJtVwEy3HUjD13Ae1g05RyQIxO4V+ffY5z8hsQ3zFb5nIPBChsyLNvi/erhu6CT/Ezc2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcp3BbuTLgR5cEhhsNZ/8GTDNEKME+t3bPEwCuo8xCRWhHCfjm
	vsXAsPgkxo71xDEaR1oxVQAYvyAj9ClEGEfwB4O/b5GgYH7fGqBviThex1DQrPah5mAnK1LnV7+
	LOk0aVv7wgBMgfP1p7egRup86mGNCzX14Efpj2i+qdQK2N0QyNjIRRf2/upE7ti8B4GoA
X-Gm-Gg: ATEYQzw8MIX7cSuwKHwcJBR6DfyFUgXzUWC74Q81Gv5wmS093vBVwjpchQL5tSUYw86
	vv6GqXAurbonWc69ypcDJp56cKZ2lrnbbtJTEGhM5kUaozANekJkB0N5W2tN7YBogGeQzP92Gkm
	L+ubDxF/QY3uNWDxPoP/O/SXBDZQjECWd5AEdIiQ0btShOhK4+7b7UKGdRw3M8ArODw3aNyEL0d
	PShWgl+sFD5kKaxtXgbay5f7TKmTfGZGTqwFCuIEafHwnC55VVIcde1yo48i9KwFsAaPD9j/t2J
	z8JqjywwQxudsVzptapCx5ADyMONstus+M3M0UFntFRR4MiuaCve77TTmlb2sg5ros7go7WDxyA
	YQeYQJrPegHRtCi76FQRxriAhVKlz6M99VjACcGXybyJnmXhOkOkigCf76dV+XVSyP1sJepanAn
	yOV+KpW3RcXfrzg5KXXjheebeGwfQP/bb5dsU=
X-Received: by 2002:a05:620a:1a08:b0:8c6:ee09:5eae with SMTP id af79cd13be357-8cbc8d99d08mr1401260785a.0.1772458113710;
        Mon, 02 Mar 2026 05:28:33 -0800 (PST)
X-Received: by 2002:a05:620a:1a08:b0:8c6:ee09:5eae with SMTP id af79cd13be357-8cbc8d99d08mr1401257685a.0.1772458113091;
        Mon, 02 Mar 2026 05:28:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115235884sm1827886e87.48.2026.03.02.05.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 05:28:32 -0800 (PST)
Date: Mon, 2 Mar 2026 15:28:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <w4ldxcxvcp3fz7u2zxyyjiii7lsrnoa2l6amzwpsn5a63yzotm@iawh6btqtf45>
References: <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
 <d5c4eed5-bd87-4156-b178-2d78140ec8a9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5c4eed5-bd87-4156-b178-2d78140ec8a9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69a59082 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=kLB4Tgj_1P-E8ogU5GYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ACM4GNsTmBvdKhcZ9wcPH8DE7EDGRezr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExMyBTYWx0ZWRfX1drTDLMYWkUB
 UxXiVXppBZAaVoltDBRsYU82kfUjFKAZcukKKIcXNKtGIKg7TG6/3HA+e4DiLeitC2tW5iLD4D2
 Ks77UWmE1VhJV9V/VBQptYq5nelQT7TEpz9QcBW2isu4Uu9jrraC46P+58UO6+Xiysg/QSK4ODw
 Ehli79nyUHcpVMfLcE0km6y7J8OnXALwlLobDkLx4ROY0idZyvtoT7/d+KPOWH0q9F3tqhT8GvY
 skOyUixmH1bWslB6frI4AF47U83Gr+B2U39xUBcl6qp6XO/lnGl0N5H+HXfxS7MDHvSZk96oMOJ
 iAuV6aeD9Az2+QHDZSktktkSgpgejizf5Wb/ebtETO/aRATdmTTulmmmW1xd4naSyGFmjQupyBw
 ggZuve67o4w7LpmmcBrO7eUG0gqlQi0B/4ig0X0zQlJuWZr32cLuc9YqgLdYlGj1XgeZI23BBJM
 M6a3cppbj/7D8hthbUA==
X-Proofpoint-ORIG-GUID: ACM4GNsTmBvdKhcZ9wcPH8DE7EDGRezr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94939-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D89791D9C6A
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:41:59AM +0100, Konrad Dybcio wrote:
> On 2/27/26 8:05 PM, Dmitry Baryshkov wrote:
> > On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
> >> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
> >>> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
> >>>> On 1/12/26 9:25 AM, yuanjiey wrote:
> >>>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
> >>>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >>>>>>>
> >>>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> >>>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> >>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>
> >> [...]
> >>
> >>> Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
> >>> dpu_runtime_suspend, then we should be able to also skip setting OPP
> >>> corner in dpu_runtime_resume(), because the previously set corner should
> >>> be viable until drm/msm driver commits new state / new modes.
> >>
> >> That matches my understanding.
> >>
> >>> The only important issue is to set the corner before starting up the
> >>> DPU, where we already have code to set MDP_CLK to the max frequency.
> >>>
> >>> Which means, we only need to drop the dev_pm_set_rate call from the
> >>> dpu_runtime_suspend().
> >>
> >> I concur.
> >>
> >>>> For MDSS, we're currently generally describing the MDSS_AHB clock, the
> >>>> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP
> >>>
> >>> No. As far as I remember, MDP_CLK is necessary to access MDSS registers
> >>> (see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for MDP5
> >>> platforms")), I don't remember if accessing HW_REV without MDP_CLK
> >>> resulted in a zero reads or in a crash. At the same time it needs to be
> >>> enabled to any rate, which means that for most of the operations
> >>> msm_mdss.c can rely on DPU keeping the clock up and running.
> >>>
> >>>> table.. The GCC clock is sourced from (and scaled by) the NoC, but the
> >>>> MDSS_AHB one seems to have 3 actually configurable performance points
> >>>> that neither we nor seemingly the downstream driver seem to really care
> >>>> about (i.e. both just treat it as on/off). If we need to scale it, we
> >>>> should add an OPP table, if we don't, we should at least add required-opps.
> >>>
> >>> I think, dispcc already has a minimal vote on the MMCX, which fulfill
> >>> these needs.
> >>
> >> I have slightly mixed feelings, but I suppose that as we accepted Commit
> >> e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the domain"),
> >> we can generally agree that it makes sense that calling genpd->on() actually
> >> turns on the power indeed
> >>
> >> What I'm worried about is if the clock is pre-configured to run at a high
> >> frequency from the bootloader (prepare_enable only sets the EN bit in the RCG,
> >> and doesn't impact the state of M/N/D at a glance), we may get a brownout
> >>
> >> This rings the "downstream really did it better with putting clock dvfs states
> >> into the clk driver" bell, but I suppose the way to fight this would be to
> >> simply set_rate(fmax) there too..
> >>
> >> I attempted an experiment with pulling out the plug. MMCX enabled with the
> >> AHB clock off results in a read-as-zero. I tried really hard to disable the
> >> mdp clock, but it seems like the "shared_ops" reflect some sort of "you
> >> *really* can't just disable it" type behavior (verified with debugcc)
> > 
> > I think, in 8996 it was possible to disable it. Not sure about
> > 8998/630/660.
> > 
> >>
> >>
> >> There's a possible race condition if we don't do it:
> >>
> >> ------- bootloader --------
> >> configure display, mdp_clk=turbo
> >> ------- linux -------------
> >> load rpmhpd     |
> >> load venus      |
> >> set mmcx=lowsvs | mdp_clk is @ turbo
> >>                 | brownout
> >>                 | 
> >>                 | <mdss would only probe here>
> >>
> >> *but* that should be made impossible because of .sync_state().
> > 
> > Yep, sync_state should prevent MMCX or CX from dropping under the boot
> > level.
> > 
> >>
> >> This may impact hacky setups like simplefb, but as the name implies,
> >> that's hacky.
> >>
> >> Relying on .sync_state() however will not cover the case if the mdss
> >> module is removed and re-inserted later, possibly with mmcx disabled
> >> entirely but the clock not parked at a sufficiently low rate.
> >>
> >>
> >> TLDR: reassess whether MDSS needs the MDP clock, if so, we should just
> >> plug the MDP opp table into it and set_rate(fmax) during mdss init
> > 
> > And what will drop it afterwards? MDSS will still vote on the MMCX / CX
> > level even though DPU will change the clock freq.
> 
> That's a good point. Perhaps the easiest resolution will be to leave a
> comment before the prepare_enable() explaining that this should have a
> vote, but it's easier to rely on the providers' .sync_state() keeping them
> online until the consumers fully probe.

Yep.

> 
> [...]
> 
> > Let's go through them.
> > 
> > All SoC except those currently supported in DPU require SMP (shared
> > memory pool) support to be ported from the MDP5 driver.
> > 
> > Most of the remaining platforms (except MSM8994/92) also had HW cursor
> > implemented in a fancy way, in the LM rather than in a separate pipe.
> > I'd really like to postpone those, possibly first completing migration
> > of the other platforms and dropping support for them from MDP5.
> > 
> > 1.0  - old MSM8974
> >        I'd rather not touch it, it had bugs and I don't have HW
> 
> I have reasons to believe msm8974 v1.0 never reached store shelves.
> Let's remove this.

Please send a patch ;-)

> 
> > 1.1  - MSM8x26
> >        Probably Luca can better comment on it. Should be doable, but I
> >        don't see upstream devices using display on it.
> 
> Because there's no iommu support for these

I promised to put it on my todo list, but the list is very long.

> 
> > 1.2  - MSM8974
> >        I think it also had issues, no IOMMU support in upstream, etc.
> > 1.3  - APQ8084
> >        Had hw issues, no testing base, no MDSS in upstream DT
> > 1.6  - MSM8916 / MSM8939
> >        Can be done, low-hanging fruit for testing
> > 1.7  - MSM8996
> >        Supported in DPU
> > 1.8  - MSM8936
> >        No upsteram testing base
> 
> 8936 is 39 with some CPUs fused off (unless you have info suggesting
> otherwise)

Hmm, you added 8x36 to mdp5_cfg.c, stating it is 1.8. See commit
81c4389e4835 ("drm/msm/mdp5: Add MDP5 configuration for MSM8x36.")
Author: Konrad Dybcio <konradybcio@gmail.com>

Please remove it from the mdp5_cfg to avoid confusion.

> 
> > 1.9  - MSM8994
> >        No upstream testing base, no MDSS in upstream DT, normal CURSOR planes
> > 1.10 - MSM8992
> >        Even less testing base, no MDSS in upstream DT, normal CURSOR planes
> > 1.11 - MSM8956 / 76
> >        No complete display configurations upstream
> 
> +Marijn, is your computer museum still running?

Should we open a Qualcomm Virtual Museum?

> 
> > 1.14 - MSM8937
> >        Supported in DPU
> > 1.15 - MSM8917
> >        Supported in DPU
> > 1.16 - MSM8953
> >        Supported in DPU
> > 1.17 - QCS405
> >        Zero testing base, no MDSS in upstream DT
> 
> No upstream MDP5 support either. And it doesn't seem like that SoC had
> much uses that didn't end up with the thing glued shut..

I saw and touched devices, but that was display-less version.

> 
> > MSM8994/92 would have been an ideal testbeds for SMP testing, but...
> > they mostly don't exist (please correct me if I'm wrong). Which means
> > that the next viable targets are MSM8916, MSM8x26 and MSM8956/76. All of
> > them require SMP support and don't make sense without cursor handling.
> 
> We can think about poking at some of these it one day, but certainly not
> high prio..

-- 
With best wishes
Dmitry

