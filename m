Return-Path: <linux-arm-msm+bounces-110607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEcTFWuKHWrAbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:34:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E98216201AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9391E301378F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 13:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603D63ACA5E;
	Mon,  1 Jun 2026 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFt2RAar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8kWfJNB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8073AC0EB
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 13:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320773; cv=pass; b=mknbPmABJUJkBwnpyrUi+3OdSXuYmNBKji/9M0+OGRBbI8uiooksJVv7jyAN5ifxKyfi8iUIQtyeXDCA+KgE3CbXCeXDq/4dQC/UuxeQQ+wuBnXdce5FEhsPrbkwCANpC1kuGHEjYEcHe0k5KsncTK+Fee+bw0efZ3+1Vsb7iUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320773; c=relaxed/simple;
	bh=FBFDEqVj5Q4xuk6WgsiiDkfFNegk6+mZoIoqPl6nERU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucdtWhhekf3H8l34VfI8nWlOOSuycVegzmGdAHpL9XF27H945VhiPOJREHxGXJoZsd2KYr72KGaIQ9GS4B8NhnxJmA5TdSzB8iND1mXmaBC8+jsFPcA6D3urz6TeP2zmBDwGf/gNE9ux0UJfmUh/d+YA08/goDM4vQDAo8dFsvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFt2RAar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8kWfJNB; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fBUN2740445
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 13:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=iSWiEO3+qeWSnedTIbwacWBgpl1B0hKJbCUNlgrD+t8=; b=PF
	t2RAar6Rx4C+bsZIRoMqTfW1WZG9nbsuJlWkqn83U135u0Z0bylMV0sOgc7F72gV
	sqKCXLPyNmXIQQ/LM30PPnvWdr+IvT+bUtFdYo+RGnFTWLchsKVSlh0FDoPSne/x
	pT8kRmrDo3AgwU10bbeSYRFnjrk+ckhVN2RePt2wOCFetIxgLNKUCdTFwqKwNPpH
	/4urPc305YRMDkPdekrkeylcnqus27uRpJqJZU23OIJXdUhw1wsfdevOrPX/7UiD
	bCTMtjBiSsut7/eI+6phiKEIvPexyRmaB5KOJrOAmfDDzb3RzByJ1NpduMDLwrt5
	I75z8vm444bwcKCfbr9A==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqh5hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 13:32:51 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-485ebc5706cso3861003b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 06:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780320771; cv=none;
        d=google.com; s=arc-20240605;
        b=IVWdkcycjlQEd3Y76dPaAVJH28qQstHvpoYe29C4tbVnarEywVVsjwpQPUE71U7vbB
         TCuvEQB7T4g3Ig8bVUqgtMsGZArU27SEpsEUPqO15gi/8tm7KNvpdJT/3fX4Z1xcJsU/
         xFlillYDLZlIJp2IJ9rcaA8EcSS8oYf0VJ28kRMeytnBoZm4LaABzXI1jQVxrmQ9n2ou
         6aW4SsgKCWghzQ5ld28WNkX/9VVV4w7mVgUuwBvdEDYzlRPadUq3KKbIMie7qXKWLe/Q
         de5Y7uD+4mmT2pBwaylHs4mqMdKpR7Hd4EyPmNkBUOeoDkgpbtpdauchCmvoCHj7ROr9
         TcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=iSWiEO3+qeWSnedTIbwacWBgpl1B0hKJbCUNlgrD+t8=;
        fh=fjxjA78srOIHG6B9ocUthmnSiZzma0/OHCEKqG1rxAM=;
        b=VW5oleMjFQ0dghZWXLlHI7ILf5P+EBVdXoPTbkfIUwTjvBc0ZwM+FTIzcWp/IgRNsI
         xwDo6cCZRaakTOcV2IeS7snqVUMEzzQyV16ozWyeBxnjqO0CfVP9YA/b0EK7kuAMt75s
         ghCWyt39y0JkVK25p1MPYy8e3pWDMsMRhP8N3sIGLpJ+oy1vDAwFR1UxP3DlVsROB/do
         kuv7NnIeJQpVr0MiA4bw2ZTj/rkPNS/3BFQ0ODHeNoRfcBNySAHT+uE1qgdoQ6VUAFtK
         8fJpD+Cp3btYeyypSKH/waoWespszpdnowr4FzuiF5uoOue2tEc4g2Hq6jZfNSOng5xC
         wm8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780320771; x=1780925571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iSWiEO3+qeWSnedTIbwacWBgpl1B0hKJbCUNlgrD+t8=;
        b=G8kWfJNBvCJEkN5Ms3mEU4LmMa3PP7mHdsoVpgtqo0yIlEMBnNYWBO7jdsxIaShjtu
         tQmot2goJiWqTfUOaR85jbKL8gIxwMjC3Od5H5gQRe5BsP6QeEcQU59RSF0J0UNfaS/O
         wrZCEJ/wOX08jIYFVEGuaeqo31aJTzw3rCCy6DeDet/YpfMUCsLBiqyq0zW2Dgm8EBVg
         QBbazINhGi1Rv6lEIJ3gkN2ntya5B7bpg0a0/U5wfce3Eeiux+LA26L0NnxCtlth/PwE
         V5FPeIAoKkh+uVbCikVVx8iD2K5ozw5PkAMaI5qFmHgk8pHA30tSxzzpJWT9bRZ+9jaz
         yrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320771; x=1780925571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSWiEO3+qeWSnedTIbwacWBgpl1B0hKJbCUNlgrD+t8=;
        b=G40ePaE6wkxZrnRgYoLNg5UVK4PKZIXL7nfWqV682hVvyLUn1m8InijN6bB+NuKCyZ
         oIr+oshV2BbrgRzQ5ga1x2+GcWmYkY6rJvX/j0TztTSLBhBbkCxuZNuXwQI/Bp+q0O6g
         bWO8uBhub5aAVJWJVpwoY0bGXXaFFAULrADizOKxkpgTpF0Ly969/bDLiwZey26t0BC+
         zySFRM/bPkzkIXSQffVqCggoPtJBvg6Zlspg12bUXeMzom4cwNAhx2eOAbKr8agv+ON+
         9SG+hmJSqshn2oS3oa6kLj3EFb+c0UfyqzaPfmPiARFIOzsSQRuLOYWLC6XR44RaDDBB
         ANVg==
X-Forwarded-Encrypted: i=1; AFNElJ9wuVHL9wyHxj/xN0idC49/Roxi5Rskb/HQ4lllM+VZEZG1WOGGIii0bK41wnHgF4NMeaFuxNk/0FQ/j6Lr@vger.kernel.org
X-Gm-Message-State: AOJu0YxEyEe9bgFDPowtRtsOlxhStDkJQrdF31kcWv6pdpmRuf+6bZaT
	RBZfdK0i1UVwLTyZAWNeDQ/inTuqUDGlzKAhGgiz6IPN9z6a2iGpRDlJbozVAIU66tStcoC5guA
	wyUNSPRIQwoflTZHSve+xp0hNk1gmXOYz5NDYBF7xYOleyIHEO41mHspOejkL/3cILV5ESDJo9l
	nfGZfeHA2fRd4Bm/srOGlpfPEC3hAJsyDgWJN9VNBIFkU=
X-Gm-Gg: Acq92OGf2hJrRBO7ekG6vi2nmElk4AmUifmah1P9Y3vSm7r3UHqM1FZz0BcWSCJ3OVo
	vBDSm8kbAF8bS79l8YoCqmM6rtj4qDCgnq3K4RAR2s0o1sD9Pa8lAMKLrBOkRn3w8+EHV2FjKuI
	ucFOqo+CEMupzAeV6CJ1vev7SUYpN7T1PCblRmkD8YVxHllAU1AP1Zghe2X7U+ik2gehK3J0HRq
	nvxZfnpg5s1Pg==
X-Received: by 2002:a05:6808:c413:b0:472:c4ba:32d9 with SMTP id 5614622812f47-485e73685aemr7697307b6e.20.1780320770632;
        Mon, 01 Jun 2026 06:32:50 -0700 (PDT)
X-Received: by 2002:a05:6808:c413:b0:472:c4ba:32d9 with SMTP id
 5614622812f47-485e73685aemr7697281b6e.20.1780320770193; Mon, 01 Jun 2026
 06:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528093437.2519248-1-hch@lst.de> <20260528093437.2519248-2-hch@lst.de>
 <5f7f90d8-cb32-4ffb-8f1c-0722aafbe869@kernel.org> <20260529135045.GA10647@lst.de>
 <5f3ba603-a6ad-4cf2-9a54-aebc10273c59@kernel.org> <58cc76e7-2348-443d-a989-2a06e61178af@kernel.org>
 <20260601113831.GA25535@lst.de> <d7b08296-7f6e-4d89-ab3b-04e43d04929e@kernel.org>
In-Reply-To: <d7b08296-7f6e-4d89-ab3b-04e43d04929e@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 06:32:38 -0700
X-Gm-Features: AVHnY4IDUhXdIIQ59yCVYlfBYI5ZXqh2r6jh6SDaQfttaiXqq2hNkv_bQjj9LiA
Message-ID: <CACSVV00k-fxW6+waHNqvmYcnVNDkRexoWWprFzfayZfqdyMuuA@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: improve kmem_cache_alloc_bulk
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Harry Yoo <harry@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Brown <broonie@kernel.org>, Hao Li <hao.li@linux.dev>,
        Christoph Lameter <cl@gentwo.org>,
        David Rientjes <rientjes@google.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, io-uring@vger.kernel.org,
        kasan-dev@googlegroups.com, bpf@vger.kernel.org,
        netdev@vger.kernel.org,
        Alexander Lobakin <aleksander.lobakin@intel.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: t_5hzhjvwfk40rYiXJ9MpkLXTB4oI7zx
X-Proofpoint-GUID: t_5hzhjvwfk40rYiXJ9MpkLXTB4oI7zx
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1d8a03 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=gxV2vm59AnE_F2JHV74A:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzNSBTYWx0ZWRfX4ymVimhGFb0Q
 Ttd2HXslfHRkasbbU2XHMi8fSchehjvnsf8D/IdqVzAjY4NgrJGAOWoTrYmWJUn9vzepflYNfGy
 yhPJTBDC2LOMesqZr0jryRIt5uKlEa+l1RH3BqEPpxZbqUXRG7ab35k9CmkCfIJdSrCZoYsk7fF
 smpe94JW72gDkQ82X6WRMROre6ZTHhTFmxuRpNw0gaEMDQRdEPDRyHzNTe0X8ZShwF6nRYkJoky
 9JeBA6LPROwlmTB7BYf3CsjFgAscE4drY3c8CDE+DJwqm7acmulSM3AOhxZVfAc7BSI1KOqFTHg
 jX23F4BRJeo8P3f4q4ebot9J4FM4nLoeqU4CXUMYNn7rB8pIZMICO1GAiGUkmyfGgO7GFg/jziZ
 z84xDhVr58GREUWP6cBdPPzSDnXQaKaHbAl4/L0hlWQ03aLTeAWe2H5PH4dVPVXCS4LQUWheQ4/
 elD2IoBXyyUdTFqQvvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010135
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110607-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E98216201AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 5:50=E2=80=AFAM Vlastimil Babka (SUSE) <vbabka@kerne=
l.org> wrote:
>
> On 6/1/26 13:38, Christoph Hellwig wrote:
> > On Mon, Jun 01, 2026 at 10:16:30AM +0200, Vlastimil Babka (SUSE) wrote:
> >> > kmem_cache_alloc_bulk() returning 0 was considered a success in that=
 case.
> >> >
> >> > Either fixing kmem_cache_alloc_bulk() (and the comment) or fixing th=
e
> >> > user sounds fine to me.
> >>
> >> Would it be wrong if we just returned true for size of 0? Would someth=
ing
> >> else break?
> >
> > I don't think it is wrong per se, but it feels like the wrong kind of
> > API.  I.e. I don't think the MSM caller actually wants this, as they'd
> > also do a zero-sized kvmalloc.
>
> If p->count is 0 then indeed there's a zero-sized kvmalloc so p->pages =
=3D=3D
> ZERO_SIZE_PTR but then nothing breaks because nothing tries to dereferenc=
e it?
>
> msm_iommu_pagetable_prealloc_cleanup() has a "if (p->count > 0)" branch s=
o
> it seems it's considered possible. But then the rest of the functions als=
o
> seems working fine, i.e. kmem_cache_free_bulk() of zero size does nothing=
,
> kvfree() of ZERO_SIZE_PTR does nothing.
>
> It seems to me kmem_cache_alloc_bulk() returning true for size =3D=3D 0 f=
its
> naturally in this world and is less likely to result in a gotcha?

I think I was probably expecting kvmalloc(0) =3D> NULL ... but it
happened to work out before

Adding an "if (!p->count) return 0;" at the top of
msm_iommu_pagetable_prealloc_allocate() seems like the thing to do..
if you want, I can send that patch (but traveling this week... so
let's see what I can do)

BR,
-R

