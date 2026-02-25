Return-Path: <linux-arm-msm+bounces-94182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F9rBX9Kn2lEZwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 20:16:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF2519CA3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 20:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3316303FAE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 19:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7E03EDAB8;
	Wed, 25 Feb 2026 19:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deEDZpuC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IjSDXKqH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD8A33ADA1
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046600; cv=none; b=WZJC1sTK5HMlqve4aSdr6LvUT+5gqAenUZNlkoilci1ahdziA26U9oM198Yds4Yd0v37igcvczpHK9f18rfJmW3JDR+JAkTr/JQWUs7jwq1bROtgHy+eQh3tSCSjXxPNRQMLP0iwU/UW+a7TsrR5zm07OYYQlH9529vrc1IOs68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046600; c=relaxed/simple;
	bh=CzfU35N3pjq6xy3wil9kM7JXhYOUU0JGjdRVEwu0+gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWBoBQKmIYjponkTy06niw4j/KvtDIsxUnWvNI9g/O2aHkQU+3kHYTl55OZIauBchAu4DTCzlSV0arI9W3NMcbYyeBWCBqoleHqPw3LrCFL4eNt07lmUs/TnMA1we4LqSderCz6NRj/UisfhxQD/JBXkGm52deI2clAn3tW9/Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deEDZpuC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IjSDXKqH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PGkM5m3632343
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pZEpDcrfMrqqrHue5nZhulZF
	qXVRR9YBcn3GTIB6GfE=; b=deEDZpuCFaGh0XyjzUZOyK0hDDEqcK6/Q8xviVo8
	f4DzXIpDz6jIg0dOrqEWjiyZRnsRXjZahXaUHgSjcY4hE+0TuOxFb3cIpjlhiWXO
	EMqG//Dmp5K8OiZY04WhLhOxkBHvE5subNv+ebJkQ1fm1PFylogeaaJpjQ/IUbwg
	bmDwBPPzBsfJPH+EXvISMBJQv+U2mQTGNNREV6xK5QiIvITBGx5ahrnC2lj4Ggvf
	kAUHDy6kIjJGD4ae1n9TSz7sNZ16SM27+PDkJmbSnmvPa49Gfc/WVHke683i7+A9
	ULivLKJqK5NlQTiFt9Gbj2lWTyCDeteu1eDJedoBVLLxFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj4w4rgdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:09:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb0595def4so76500085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772046597; x=1772651397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pZEpDcrfMrqqrHue5nZhulZFqXVRR9YBcn3GTIB6GfE=;
        b=IjSDXKqH9ea9aDhAJFpCrrYPsckPwLkbe1fnvK/3jzNEypZtpEZlfWL7kUoZswmhOQ
         mmgAr+swlCmrCPARCZIYbiwWyvFhS2ChEO5jEqPOeyYGHcCQNdG2bRHJL1m2hUJjy4ap
         X2SDzWd39aARN1yW82gZyroltjbARLkBr4lmBSP4Yx1G9ehqqY9sbZq+nj0szF2eOAJn
         eh5TBf5Or4bDUDDrvUHIHIaKwsutaL4AahcGImLOEmYFyTVK/sphd6hxqKx2u9v8hCHn
         u6rxuCRZeB/Cr9vEl4IBh61yq89S3ADJAk4Xzwrn1VLgV8nd4qQNEPdogr4eKpfY2N+Y
         Guag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046597; x=1772651397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZEpDcrfMrqqrHue5nZhulZFqXVRR9YBcn3GTIB6GfE=;
        b=d0DWmWwZ8wgSolPyA8aPyXNOAXosf1Xe9WDEIKYUX3VVeIWzbOgH6VbbW5llsVLqK1
         R7W2Ez0+yRgTZ2sTYww+aaSqHR+ZbTCEl+9TuUiEL2Tlx6tu5AYcK4WXJnyYBv/W4nNg
         PxHq0RFW+etSTOHNpyh+9R3sgFDUXzBVJGCaQ1hR1u2ISUZ2IPsFt54yyDG/t/jiyZir
         c5vb1+0Q/tdjHrr+VB/f5fIvFZ7Jtw7zJCjybVnnZSxpcBrLna22RR9vXeTPilhCJLXn
         0RalyyQ0w6EgrywUG5TfZLs0fU8rW8p7HOw8tRFToPokq3dCPMMajWWKegjPOshnho7E
         nYww==
X-Forwarded-Encrypted: i=1; AJvYcCXwIB2N55ABCHQnh3VjuA7qN/6E2O/n8NBG90MtdGMXmSXN0HxuwtAAiTnUhva+6uObj0295pJ7wD3U62Cy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz06NSCk++qsmDOd4SHU91iq1u7M2RGojp5JhHpFVBbRWiUFnVO
	N0jqHf4iuUOFebMNXUuX6Wsts04EP8iXlhF2mvsR+CHnyr53b7Yj/1Bgd84jYYlz6Z6rulT/9Pp
	heU8eoByZ7dSWMYVwNy3PbWka4Wxt1wQOGpGAG85Xh9IHUGliycpX+MGa/IAc5TjSKLnc
X-Gm-Gg: ATEYQzwgGt5NBeZ52NaReWsDbZ5bqhwTlwTf0zuUT9kOo3jeHHk/gUyy9qULnEpf70F
	5A84MPSA1l+xpu7OvaIT0dsqh8vil5NPiRTVANg8qR6QrEFiygyCg/42FvYUesSk1TvSSM3MTo6
	bOOt5N+pmiy0/8mhI0f/9xYTF+Ev0y175vC6PA1+btEChnvLJtL+tiuewfcMqvv4xcemoYJRTwc
	l/m0pi5xVKrCPRAH2iyQvye6iFTi2HfKvlniK9ww0oGlKm9Ft6/6wBjKGEmiI9l2iZNn4rPxkrq
	oKqcv2dIAsRDvxYlsS3HyCb/sWUxP07Ur7ZtaKcHsq6gC1wk0AVu67ZVTAMrDWwXQOOL9hsJEz3
	UePcWteUJN5ORetq48agDhjb7ZCKLu8qnmhNrqeup+svI3kPvelJo/ryl+tY8sseDU9NgeDkGbM
	2fEtU/st/7eShe3TLq2kNjo23B10mCU9jMEQE=
X-Received: by 2002:a05:620a:4451:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cbbf3658dfmr20930485a.10.1772046596990;
        Wed, 25 Feb 2026 11:09:56 -0800 (PST)
X-Received: by 2002:a05:620a:4451:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cbbf3658dfmr20924285a.10.1772046596434;
        Wed, 25 Feb 2026 11:09:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a1fcb1sm30525601fa.27.2026.02.25.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:09:55 -0800 (PST)
Date: Wed, 25 Feb 2026 21:09:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 04/18] accel/qda: Add built-in compute CB bus for QDA
 and integrate with IOMMU
Message-ID: <x6zseuf7g3ngtdlszf3vxj3nqexlkbtrp5kifo4tg4muzdef4n@5rngfg4gu47m>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
 <ox7jnqkjo3frhbgpp63sse7ram72obihe4qlbbn4z22wbw4szr@7pzoeecdvsyg>
 <e82443ff-f6c1-4b8e-b573-f4620dd0f17c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e82443ff-f6c1-4b8e-b573-f4620dd0f17c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: WXINiIV-BQkOIRNihkXnlq79cAmvv0Wm
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=699f4905 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=yBEyVpS31OZj4jLVKcoA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4MCBTYWx0ZWRfX1i50ftK/GCp+
 a2VtlfMiTuWQ0l5H6Ja5lImRmXpR0w9IiNF+UBetXg4yTQQal23pAEn/RAi5m08GBmu/bCObhFb
 z9MW2UnmuwW7xIhfH5zWhaA2DNWSwGw+/Ut8KIGiVyFY8++M0IXkj+doSn0X7oqFhnDdCvadRCF
 jSn9sknsuExPwpQtIfrmK4wDs0zvgcMtGieSItBBa/Z+NmCLa3B8M5Lz5nKUjFOeZsrnRZb2pbU
 7gWn8hb58IlSgj/V1cftKl9qwxvuFoHECB8nCIixlZ1fv22DkACaE3phSu+niFZyHMeMrQYNDoE
 IobZ90HW4xLJuyb9JIPASq+iY/5ibGJPpDzdQt3JduMPf+orcUv89qdQpwSN8uhZyuZ84MrN/Sy
 8Tto/k2mUt8KE1VyLdGYcq2mv3ka21CmcWPfusCQcOR2ZPA63UybGGwNzCMCZqxlwbuaLYEPu6Y
 pJf3SBMAINIrqELGneg==
X-Proofpoint-GUID: WXINiIV-BQkOIRNihkXnlq79cAmvv0Wm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250180
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94182-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6EF2519CA3A
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 11:26:52PM +0530, Ekansh Gupta wrote:
> 
> 
> On 2/24/2026 4:14 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:38:58AM +0530, Ekansh Gupta wrote:
> >> Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
> >> DSP accelerator (QDA) driver to represent DSP CB devices that require
> >> IOMMU configuration. This separates the CB bus from the QDA driver and
> >> allows QDA to remain a loadable module while the bus is always built-in.
> > Why? What is the actual problem that you are trying to solve?
> Bus needs to be built-in as it is being used by iommu driver. I'll add more details here.

It's an implementation detail. Start your commit message with the
description of the issue or a problem that you are solving.

> >
> >> A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is
> > Don't describe the patch contents. Please.
> Ack.
> >
> >> selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
> >> updated to descend into the QDA directory for both built-in and module
> >> builds so that the CB bus is compiled into vmlinux while the driver
> >> remains modular.
> >>
> >> The CB bus is registered at postcore_initcall() time and is exposed to
> >> the IOMMU core through iommu_buses[] in the same way as the Tegra
> >> host1x context-bus. This enables later patches to create CB devices on
> >> this bus and obtain IOMMU domains for them.
> > Note, there is nothing QDA-specific in this patch. Please explain, why
> > the bus is QDA-specific? Can we generalize it?
> I needed a custom bus here to use for the compute cb devices for iommu
> configurations, I don't see any reason to keep it QDA-specific. The only requirement
> is that this should be enabled built in whenever QDA is enabled.

Why? FastRPC uses platform_bus. You need to explain, why it's not
correct.

> 
> But if I keep it generic, where should this be placed? Should it be accel(or drm?) specific?

drivers/base? Or drivers/iommu? That would totally depend on the issue
description. E.g. can we use the same code for host1x?


-- 
With best wishes
Dmitry

