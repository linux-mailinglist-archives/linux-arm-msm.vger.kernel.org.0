Return-Path: <linux-arm-msm+bounces-81986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D54DC6177C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 16:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A7365340581
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 15:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718AF23D7D9;
	Sun, 16 Nov 2025 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STV1aCeq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dpcqo6yN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37C51F874C
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763307130; cv=none; b=PBL2afge8HE6uo4WkBJ3clNPF7ayOhADFe51YMcqNXu36x3vbMGWsACh4qb/wdgjoSbApWcnxzLdyNYlKc9evj6hVEuYo119M/T3qPYUFDO/L29PNCK9o/C+TIA1e4r5J5KqljIXV1IEhumy5lvf/PMpc/RA3UKRIwpae7mJO3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763307130; c=relaxed/simple;
	bh=opueA1Tj3onhtKt90wHgpDBqZHyCmOUWHK/OOSI7zNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnkdiIfmcWtPksuAvnDICVBWj8l6terNSUa1aSCekfKqMv1KIhEcl4MCIHRPG6LBZ0tGLKPR4P/eNbItExlpwFhmca20LdzAUYXabKe7SujDjRr0qxx9vezftWYp8xsDr+ryX5KYpzSG8Ge2Pz1NgKZn41vHWcEyCcdaLkgApIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STV1aCeq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dpcqo6yN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGDNpgP1222765
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 15:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=brXB1Y/LPVXbRpByEO14Lypc
	5NwpFVTcCsuQsNLy+W4=; b=STV1aCeqitSSB1V44tB0l1zmgK/7jDhruQaVos81
	EssOg08VRmId+HKWwnbjmu1A0oxPC5Ot0Oyvyo87OOJHticVG/YB653NVBPtYm9d
	UMItP9V/wSh+4E91LFlEQhJNuVhFvVTS+/bfsvX8obshzPQA/diigqQyXgEmYa+2
	zxXYJ2F40o0rqOYznjpqhDid9v6g18id9gJ19enQV+cFgUdkWcy+0mxpFb239eHs
	p3aVsMkvNCq6kwdAPk3OKLUDSbymiPKKYAioD2H3p7O3WWKAQeMEmM52tSJ1CZTR
	ylI817cj5MU9L4CVRhwrC+CcUAq4YwWU/UgKqZenuQxUbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejhr28sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 15:32:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e4b78e35so189809385a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 07:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763307127; x=1763911927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=brXB1Y/LPVXbRpByEO14Lypc5NwpFVTcCsuQsNLy+W4=;
        b=Dpcqo6yNeodQRtGS8FiTViNsS5mdsST+LPKUwJOfRRiqY8G581/lp4rzm4/U2HHsyw
         H+kyr5CeURvgT1UutJd3kxAoyl7YtKLjQGACg1NXJbT3Q1uLAlGXXn/QI6lTY6/uX93M
         T67DXjr29hQEJsTLDfvWvXMQsmuhx6kfw7QXeMZRXspdx34K8+hhiKyjRrCXbweeYmL2
         RVqcn1mqDp46wIdFkS3UK4s+Z+k/LU9xzmr5ft8sG1wHSMUc5a9jbtErtruQHEB8CTPV
         Gz7G5P2480G9FKfXhHkcayAyF+W50MAeNyLs/XQeflpyjTiIXn4nvy+lmtTwtRmcrI0I
         SqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763307127; x=1763911927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brXB1Y/LPVXbRpByEO14Lypc5NwpFVTcCsuQsNLy+W4=;
        b=OicZk5G/xiJGLGx/dGy9TL0vQK3p/1mDeJXeI+Y10Tg1mB5qatbsvw5KmTvoTVm3sg
         kdSSXR1b414m8iUK4+XtDfWcf8Em0g+vtZqmXHJ4Q5RF86YEvS7KmImrwIm/A5dejMN7
         fYdjW1CL2+N7s+Ndrc/lH7dU7g+HWP7ZlHRSYgnUnifS0XFVcOTgVjMZUJBXNz1DreL2
         kwiMPlsNTYFo4F370xGe2gF2+/E8Oe+jU0Bt0mn9quWQONJjKKag9vN7P0Jf+zT+JiKB
         dVhoCaM4FRel4eyCmkMGhfLlD1djz5lXVIb2UtNn4BPos9d4Dp29naICoMI4lf8mO/Ci
         8nvw==
X-Forwarded-Encrypted: i=1; AJvYcCXB+JlUzP9Mc94pg1HxdtHX+bvJywj0ORcbaqN6Q+6DYdWS9PtzuGeSszVn176Z328toIwEdZRer7BBn14K@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8COopjmFtFQApVEXSEDyq1nznjOwImq/rmttP2mxbK6roSTA
	TvwG5V8wnAK5pGqeZyN1zBbdF7o8/W4/+49MZ78jxCMK5f3B+dBaxaisw2SpzyJVFNd+qs6uU/a
	kpBhH8a4I9NMwVs9bPH7k97qTnBeuyLx5QF1QZ8F9/Tt3aT9iYJjMT7PODl2Knl5f9796
X-Gm-Gg: ASbGnctwqJ4HAnENH/KLTcVvTsm/2TFQchYhrNIQPUXw+UcuQhJb0qpWALOsCTVwDCK
	57on1pDZc7Qd47AcckL761RgS3hbXPv/KjHSSBqE/28IgqVhkxex8UxgucWAFZmR5thUmpqLcsa
	FXin7yILStfpwBgHinrPvscoIvDny3qJpROHiy8h/Gac9C1vMI0zmOry0jS4HzAJokBWf9qXrxd
	n6SqOn4jbfRthpuImMCsCjg1IKgLB9ZfkrmfQkwe8/xNsdEuidF87OS3QUQbNABiSMMQUh0SDU3
	RPIvC8XvA6iI8itH+GXjFnpDOMlDuDoE/k3HjVx2fddVvgcRBsTgcRSnPTZav5PkWh5pAi6slyW
	lfTQ44r1C6KNJCEdoNj8nfUTaLfwljoyDtRajvMrKPLy7mCzkyeNVQuGJnZJMll+sxvjT3Jb7MU
	U8ByJdg8EnnF+o
X-Received: by 2002:ac8:7dd6:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4edf2177a96mr137561141cf.79.1763307126923;
        Sun, 16 Nov 2025 07:32:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLhJkaOMAE2symS5kOW15WypsaRmGyogTqDdNGkh+5TTdpKm+0QEXmKB8gHRw7DCEiCrhb5w==
X-Received: by 2002:ac8:7dd6:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4edf2177a96mr137560551cf.79.1763307126391;
        Sun, 16 Nov 2025 07:32:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003a4sm2483875e87.59.2025.11.16.07.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 07:32:05 -0800 (PST)
Date: Sun, 16 Nov 2025 17:32:03 +0200
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
Message-ID: <2obhppq6a4ercfnhvm42tbbgh3xut4lz66fc4j7mpev5oxxno7@dydu2wysmgvi>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-2-vignesh.raman@collabora.com>
 <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
 <42v64xdsaqug5yy76yel4tukh6wkt2tp237vlnpteabyl5qjo5@iigtgujvecwc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42v64xdsaqug5yy76yel4tukh6wkt2tp237vlnpteabyl5qjo5@iigtgujvecwc>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDEyOSBTYWx0ZWRfX//mFZLEbQGnL
 9QS4wUHYd1XI4SCrt0O1P75SSsf7LTcVwu0LsEJecjLVSoAdtwIYmyQFBTEX3kE9ItO/1mwusAV
 Wwxuby6bzQ6ItvYL54S37LXEGLnr2By6ealfMYaexEukFw+J6CBMz7usJ9OZldrgqo3FAbocWwP
 mx8nU6Kqe8GQMaF83b9LEjslFBh5l+3/r8qq86V4dd8Rs/M2Hj0hPxHjUNNCwRU0B2I/I3aFzfr
 +H5W86JznXIRDZHxi2QeiMxSenP6k2KymHwuin0Dcw9a5CHN3R7oJAA815RB7DD8LBZMc1KF/mU
 ZRC9gxYnKY6jrJTdQEu0on3KNSBekaf748KqLQwnbATkKJjQSLO+d5ZqAzAcZg4rZjqldtdSm8j
 o22RSEGPOUml8Y2MdoQytPekqYzSzg==
X-Proofpoint-GUID: 5yelU0PiaTzTAGQQboHGgnDLUv528TYQ
X-Authority-Analysis: v=2.4 cv=dLCrWeZb c=1 sm=1 tr=0 ts=6919ee77 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=zodt2Hv4yxvvtHnNIosA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: 5yelU0PiaTzTAGQQboHGgnDLUv528TYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160129

On Sat, Nov 15, 2025 at 05:55:17AM +0200, Dmitry Baryshkov wrote:
> On Sat, Nov 15, 2025 at 02:44:56AM +0200, Dmitry Baryshkov wrote:
> > On Fri, Nov 14, 2025 at 08:30:50AM +0530, Vignesh Raman wrote:
> > > Uprev mesa to adapt to the latest changes in Mesa CI, including support
> > > for firmware via LAVA overlays, removal of the python-artifacts job,
> > > split container and build rules, use lava-job-submitter container,
> > > and various misc fixes.
> > > 
> > > Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > ---
> > >  drivers/gpu/drm/ci/build.yml         |  22 +++---
> > >  drivers/gpu/drm/ci/container.yml     |  28 ++++++--
> > >  drivers/gpu/drm/ci/gitlab-ci.yml     |  95 ++++++++++++++++++++-----
> > >  drivers/gpu/drm/ci/igt_runner.sh     |   4 +-
> > >  drivers/gpu/drm/ci/image-tags.yml    |  22 +++---
> > >  drivers/gpu/drm/ci/lava-submit.sh    | 101 +++++++++++++--------------
> > >  drivers/gpu/drm/ci/static-checks.yml |   1 +
> > >  drivers/gpu/drm/ci/test.yml          |  18 +++--
> > >  8 files changed, 186 insertions(+), 105 deletions(-)
> > > 
> > 
> > Thanks a lot for taking care of it!
> > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Hmm, this causes a lot of failures, see [1] (note, the run is not
> finished yet):
> - On some platforms (msm, rk3399, mt8173) the
>   core_setmaster@master-drop-set-root test fails. On other it seems to
>   work correctly
> - sm8350 seems to have some issues with this uprev, it cant' finish the
>   jobs at all
> - mt8173 and rockchip:rk3399 seem to have other test failures too

I have fixed most of the fallouts, see [2]. But ideally this should be
split into two parts: fix before mesa uprev (I think some of them are
already there), uprev mesa, applying necessary fixes and then enable apq
jobs.

At this point I have no idea what's wrong with MT8183. Most likely it
needs either a DT fix or a driver fix. The driver fails to probe because
it can't build a sensible component chain.

On i915 several tests kill the hardware, making it timeout all remaining
tests in a bad way.

BTW: I see that for some of the drivers we skip the absolute majority of
the tests. What are we actually testing on those?

> 
> Could you please update fails / flakes tor all the affected platforms?
> Also I'm really interested in the master-drop-set tests. Why do they
> fail on some of the platforms, but not on all? This seems to be some
> infrastructure-related issue, since exactly the same kernel with the
> same IGT passes those tests (at least on msm hardware).
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1547684

[2] https://gitlab.freedesktop.org/lumag/msm/-/commits/msm-next-lumag-db820c


-- 
With best wishes
Dmitry

