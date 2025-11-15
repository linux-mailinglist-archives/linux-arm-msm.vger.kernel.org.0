Return-Path: <linux-arm-msm+bounces-81932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F1AC5FF98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 04:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E9C44E12C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 03:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6616224AF1;
	Sat, 15 Nov 2025 03:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9xyueey";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cazXkV4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6A961FFE
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 03:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763178926; cv=none; b=VOaL81IwX3qfaQBaMRRqt920Tf+zndEWSN4YbUld79ktnCShqok5cESggY+PqX9TnvaWnONdIU8bfkINjclXYZJtbaKyp0SXrgqvrOcwIwNAYq+3hmCctBDuLx2nj4fH85A9oZaLXDAkomafvN8lazKp3PfI5N5Vy4Em5D2zrqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763178926; c=relaxed/simple;
	bh=bSnaxQSmmizFstlMQXtunx/ahtOr9ZdNBIJJWbzQY+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c91aQZ6+xAnQhv9CScaUT+/Qkd5ywzZilTXyyx9NKqWgEnOy/H3UTRp66dQzvjCUizECwYrxd8fgBGqqs8QHmmf1YRxe6S9930BilbIxTPmMFkd/Hndadn4XvpaWpfV9vdOImIGINUSYIH0gceOFGsufCZJAhLNFcWw/MBD3YiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9xyueey; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cazXkV4Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AF3k2qc1460508
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 03:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kpUJE4SYKU9ynxkJ/T5JJhpa
	CqT/i8ZykNmysQrjF+s=; b=V9xyueey6blpzm/jfavsSbhlfoxZqh6ziY9GLiVo
	pRLERZ2MEX31+yuGsAhlfVnpx49LUnkivh7VOeVkX+iEZCpUszfAr6RWAvx/GoxG
	ZijhYK8E3mzyIqhG1hK2L5/w9DdedzrozrD9Lv3PvXEGCefrjA2nK2F6EPnJkN5Q
	59YLYTARTJ+Imk6JfdjaS45qa6wSMYck595UYohLzKOGwUnrjp4w0vmLrwRUpeB6
	SYq4g3sGHee1nq0e3QSLce0NkDu8LM1+cCMEAkTcfdWp6FkDpecyTGsY74vra0rZ
	jqFpR49ENgMSjHk8p1Xtfaa+aw5Hd9R3LM0WfZoyiVfmLQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aehw6g0c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 03:55:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8823f71756dso38600326d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 19:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763178923; x=1763783723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kpUJE4SYKU9ynxkJ/T5JJhpaCqT/i8ZykNmysQrjF+s=;
        b=cazXkV4ZVS3iyyBzmvxJ9RqTB56EFq5WvgaQHCCfn2jSemWR+lcfOj4sGWjQbQISj9
         lZbW/q2UvdAeIU934WA9GEQIIQyKydu04yoWZurZTEjdQFU10x7etsRUxRdkEdxoNa6O
         PFXKk050KyBmG6io1zpxSZAqSVApTbrJo8Tak8N4eYCz5WKDvJb4X70VfUO3SthquWca
         5GbUo0WtZbw398kbI68KMpQpORZOzp1qaZll6P017r6UfrDmCcA9IkQJ5zvSDuoh7mDA
         lypvRXYgKOFNKShnkdzwP4YYqYfAnoG6txqeIq2PxQfnqips9zhZmXUPx2nD/TjzEXi/
         fiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763178923; x=1763783723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpUJE4SYKU9ynxkJ/T5JJhpaCqT/i8ZykNmysQrjF+s=;
        b=RYWeoRUk9XwMvt/IwBLvJiwo3QtoHhATeE1g0Lc1ZwK+3e61ryernQfse5G0uKscNm
         hT0FcaP8aiqRjOmUB0MRE9FdG2qYaapZESabAZy2B0nIR/SvCW7PsGhk2urk5FA5ifoT
         2EI7Cyy0Q9nss0BBLVhM+mC1/4c4xTKjzAtPeAP8YwsN7Iz1z3SHjKoUgVzNbyiJQqM4
         ZUQ5Grr24FYgIScCtldiOcfuLXoKW6ZC5SKaZ11v6FwxZQWLQjxjPyLhThbCHfy+yKXd
         /wE0WfPA/1TIsuBc1yJwoUsQI+Nkd78+kdKG3MXLEOrnkMuNtWAiMrxGp4fi+4UKb1dC
         1Pkg==
X-Forwarded-Encrypted: i=1; AJvYcCXVU0LjWk1F78WGub+VNOe+bD1e8MNgiYuWuaWDxCwfwZ8lTC6GJQ8+BtceJBgaRLRnbZomf7Gq5Z62QnR2@vger.kernel.org
X-Gm-Message-State: AOJu0YySEuInVgCH+XPxv2K1L2h7Px9n0l4WLgGyzy+5ICeoOKGgWycc
	Kukp0tE4jd0uoMiFQh8omxDi/rwx/RWHRSSnfk5IDeOumJzN1XHg7NZoN8YJK99JDr6f1/I1ugd
	z8FHXJTMAJ0bGw7NvELUfLkvDVoxDg5HBj8SrAUwk2LHRlSAeghKCvc8if5STn26pEuMS
X-Gm-Gg: ASbGncuhoKgrrZuEkMzKHbP5Y2aezMQZJ5Q3suca+h6xDE84F6n1fRTSqJgka/QDmGC
	COcgvmgSoj9J39YukYY/fqWwgsF2iTNIHjszMtZpOrTOqHuD+jpq7VJ3s2SqunK+lnRmoi9j+E+
	Iz0uCgHBj+9IEYx+Nd3tdEXPOJdphMXx84bu0nuWsK2Q7NatIqtTE7s6LNo8+xU8BlkQFwOn2sU
	ET8iIAcVo5VCZceeFNSH4xHalSbLAjpEkd7tnqCg66RF99E/p9wANipbtf06wUMQJiVBzgZvCZA
	HzaNKlKLhDKayBI06Ov/M9lu6snyA5Mhf/mUp17Ab68hInf4zobJX1lpBLj1RHLonyxvr5FgjcI
	nw2jT3guGXu/1wSD71j8iK9gI/Vu1S88JNPPgD33OVTiAFV/sMYUXBbS/nHNJ75Cvf0c/VSxyDW
	lp7VU/RrWtSZpf
X-Received: by 2002:a05:6214:c65:b0:882:4dec:42b9 with SMTP id 6a1803df08f44-882925f280amr79893276d6.26.1763178923084;
        Fri, 14 Nov 2025 19:55:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH21xNZD/1SaQbAJXQ9lzSs2ET/wK99qDySnRnPvmoMPz0h942r+lDos6cmgLn70aSgdH9ifQ==
X-Received: by 2002:a05:6214:c65:b0:882:4dec:42b9 with SMTP id 6a1803df08f44-882925f280amr79893116d6.26.1763178922595;
        Fri, 14 Nov 2025 19:55:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040c7ccsm1449901e87.100.2025.11.14.19.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 19:55:20 -0800 (PST)
Date: Sat, 15 Nov 2025 05:55:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] drm/ci: uprev mesa
Message-ID: <42v64xdsaqug5yy76yel4tukh6wkt2tp237vlnpteabyl5qjo5@iigtgujvecwc>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-2-vignesh.raman@collabora.com>
 <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
X-Proofpoint-GUID: bKFxXACZbO0E6NjdE47GrrlbFLGeXPYB
X-Proofpoint-ORIG-GUID: bKFxXACZbO0E6NjdE47GrrlbFLGeXPYB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAyOSBTYWx0ZWRfX3OLvjglfB8fD
 0yQfa5Aw1s+/ddYZMr6r99OgTi6WzuHgyfRKzcc/uOSFkz0Bsv1Em8g97SUd3QMiv3mE4j640lT
 cDTq7LonYwq2bKGBQvXES/UOsA/oUrhUgOHEUN2KDceNga9dgbsu3zIby8u+rULZuRYHnzIB3gC
 nOQLOubcVM1IGwgt7tY5P2Z1ylsqFx0BfVo7Y9Lo3NUcnroqkruV3YghOSzTQUM08oeloLj+AuB
 JrfShQN2fftXsmJwX6f2oCwwPOGOZnMSkgMCclcmLJXY0utNYDUeYcPgBxwFMRlNpmRtomwG5QX
 0fHq9KyvzIP0rMNttEk6rEk+a9l51bHN2sKysYTBEHgWn2fOZovQI2kCR8N7Noo1mIO1ePbd+MX
 ormXGFqiUt8Mdl4bdLaiLtMIuUFjsA==
X-Authority-Analysis: v=2.4 cv=cILtc1eN c=1 sm=1 tr=0 ts=6917f9ab cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=E-Vn-V3zxCEcjh91BPMA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511150029

On Sat, Nov 15, 2025 at 02:44:56AM +0200, Dmitry Baryshkov wrote:
> On Fri, Nov 14, 2025 at 08:30:50AM +0530, Vignesh Raman wrote:
> > Uprev mesa to adapt to the latest changes in Mesa CI, including support
> > for firmware via LAVA overlays, removal of the python-artifacts job,
> > split container and build rules, use lava-job-submitter container,
> > and various misc fixes.
> > 
> > Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > ---
> >  drivers/gpu/drm/ci/build.yml         |  22 +++---
> >  drivers/gpu/drm/ci/container.yml     |  28 ++++++--
> >  drivers/gpu/drm/ci/gitlab-ci.yml     |  95 ++++++++++++++++++++-----
> >  drivers/gpu/drm/ci/igt_runner.sh     |   4 +-
> >  drivers/gpu/drm/ci/image-tags.yml    |  22 +++---
> >  drivers/gpu/drm/ci/lava-submit.sh    | 101 +++++++++++++--------------
> >  drivers/gpu/drm/ci/static-checks.yml |   1 +
> >  drivers/gpu/drm/ci/test.yml          |  18 +++--
> >  8 files changed, 186 insertions(+), 105 deletions(-)
> > 
> 
> Thanks a lot for taking care of it!
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Hmm, this causes a lot of failures, see [1] (note, the run is not
finished yet):
- On some platforms (msm, rk3399, mt8173) the
  core_setmaster@master-drop-set-root test fails. On other it seems to
  work correctly
- sm8350 seems to have some issues with this uprev, it cant' finish the
  jobs at all
- mt8173 and rockchip:rk3399 seem to have other test failures too

Could you please update fails / flakes tor all the affected platforms?
Also I'm really interested in the master-drop-set tests. Why do they
fail on some of the platforms, but not on all? This seems to be some
infrastructure-related issue, since exactly the same kernel with the
same IGT passes those tests (at least on msm hardware).

[1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1547684

-- 
With best wishes
Dmitry

