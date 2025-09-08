Return-Path: <linux-arm-msm+bounces-72655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6918B49B4F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 22:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C48EA1BC447B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 20:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B2A2DCF55;
	Mon,  8 Sep 2025 20:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwsAPDy5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4422749E4
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 20:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757365112; cv=none; b=t6lAIbvTxmotNIWaCDji2BT1zHg//Cgf6KUVowIRaM9KlV6DxFvt19RrPokMQ5ksl9oeXlpklcOIzIxHMDAiPv+YkDf8fFIBIe+r0jYYFkZ8llb67ep8f/w8PBPJWdYFy44yjegYXDOdlFSND3W0kIolii7MJlR85QFBGp1X5EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757365112; c=relaxed/simple;
	bh=NcjVrFQ/EeFSpDSdolgFk6WEv6hRfjhGaFe8s7KW78w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3Xhyzin/sabu+UbHd3XYG9ihjIYSm+oO6wyvB3ahIlJci3jRnwD2SdWmP9Y/dYcJwPh0SZS6fYFPts3V6X7dnd5TS4N+I65OWW8kIw91Dyc76vkg9gWfMuq5eC4ICfaZ6rF08yzmT3QKcumTaB0PQwXkanYL+I9bHayNqJANbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwsAPDy5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GBIE8017314
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 20:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XT4D6Rl6xH7fkqut4jVRGRITzuU+VSPL2bAYsUG2sK8=; b=fwsAPDy5ELsm5PqX
	Fro65gKobXPjGVoAHUBkPxR0EE9A7aLm7onUviGKb37+JaUjjsWiBlZepLTJRWii
	2gShlA3u8TTcS56DxxoS/AkQS55kqxTu+Eb1FfXJ4taHz+m5d51VfizsvrANYptr
	LL2BOw2Y8lMqH3ykncbGTt1l9paupuF43t//RGdTL755WhZykTmjT6KGyKalOt3b
	KDe79Ugy1RP3iSdXSymD/+Tt9AxWsWxHUPTw8nXUoQ8sMBDh29genLN1OO2Od06X
	9r81FgOvnQ1SLSxPiWpD2x5soj78B8rl1XyFTjcGgzIzD2UvkfBMjzS4IAXqw0Na
	J4+nUQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8dxub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 20:58:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5ee6cd9a3so89206851cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 13:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757365101; x=1757969901;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XT4D6Rl6xH7fkqut4jVRGRITzuU+VSPL2bAYsUG2sK8=;
        b=K5cT0OqgZaXtdl2u5Uhh/00Ap9uaRLY6eb3PWYWtKX4s4DORqRu3VWMLFZfP2AI1zo
         dmeo5wQW6+G4SCqY38XSjSbw++8K2bknHA2wJnCFIfiQ/Ao4WKSo5nGVCWtBW5999StN
         72YuWPTepJqA5XeTqpgFepfE+ru1rpq08MsMqL95GhTxSr4AvfgdxYiBlSflvr8rZo+t
         zxNgrdBYZtBPKCyyDCPS2mEjkaG05XP+pQz7GbaZ7Dk0gcL3KWJty1vEWcwD63nqQQXp
         MdDXtGhwgeUuZKzRM0jF4zJvv5d/yELxWW32BkGT+EKnkQh6bQCZNTcqZSkcQoDDrhZT
         qyWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMJ+ScQyKJ3NbjICg1+uxFRRkmO7nTdZnw0YJg+qFmIkhz+xsKZp0u8bULWebyPJHZaroe3T+GzpweiE03@vger.kernel.org
X-Gm-Message-State: AOJu0YwV4b4SudfNcu703ZWZ+6csU9YVovojkbZ4Gux/dlySZ8GD+19V
	0ANxlLharSxaiYUwvX/64U/ZPHBQFhrohiL+KXUQ+ddmJlTjbJzhv3u2M0yl506VNJIBY/du3Yo
	S1P8MvoWp3MqG3KAOkB2DF/09i05W9sHyd8RDxBuMQcf2JEBHyryC8+Y1FJRphtF23w9q
X-Gm-Gg: ASbGnctb0Gnvax0M0YErBZaDuXXwoM67fpwzjysnTWh566F8cp1awsbCANB6o4G7yUY
	AerWUXJxbKkmkRNPK4FEL+zAs00RsjaQE9WfZ3OKU85cY8MUXS9CCAZRDmhBrsW6+yjYNGQheHF
	h9MFMfx01QzUs5nV8x5Kw07qzVjLWdbPVVwYkOYB3cu9d0IV7jMSPFAOyRFfTC0JD1MxOs3gxhj
	Mj+JmrFyo/xyUG5z8o0cFhFMuyxkxT97awK+tstaid1Wk37OWJG49xh70asScYviwQTymhE9tJY
	xBhXtzGeKlIQR2pgOo4nneJi/q2BC/XcNl5aXgU8z1tRQtkPLXJfINGrwu8jmIDZYkLautnFPt8
	uGro/2l8KnG6PB6Y6Eg7Yim859dGV/FzH4R94agvlXV3U+6w2E7zQ
X-Received: by 2002:a05:622a:164a:b0:4b4:8f35:c902 with SMTP id d75a77b69052e-4b5f8386268mr101015581cf.4.1757365100954;
        Mon, 08 Sep 2025 13:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgGo4AskYYA97bXQw5ZnjKY3trY7Q/2Y1T6Qh64u6FXmuTPBJyX/pqKAgqBTyfCqSsjgeyRA==
X-Received: by 2002:a05:622a:164a:b0:4b4:8f35:c902 with SMTP id d75a77b69052e-4b5f8386268mr101015111cf.4.1757365100187;
        Mon, 08 Sep 2025 13:58:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50bfda3sm36656851fa.62.2025.09.08.13.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 13:58:19 -0700 (PDT)
Date: Mon, 8 Sep 2025 23:58:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ryan Eatmon <reatmon@ti.com>
Cc: rob.clark@oss.qualcomm.com, Rob Clark <robdclark@gmail.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
Message-ID: <dm22fmz6yuxrn7cwsviwg6djnbbwr2lq7aamatz3rjeeqf7r2q@mdmnolrb3ytq>
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
 <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
 <51cdf832-95a2-47bf-bc27-d43097883701@ti.com>
 <CACSVV02YrpYrvbFxKc808a=GjdxVjO=FjRG9gs_6qe5W-v=a9g@mail.gmail.com>
 <858dea80-1bd6-4bbc-9b98-9f959c00b304@ti.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <858dea80-1bd6-4bbc-9b98-9f959c00b304@ti.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXwR9NEAz1jICS
 Zbq8wWftxEU3VJ/bO8tPUFV5XgsNTFw3o4NofAgeu8B15VHFovhwCu3+WVfFWE0Uv2iJrWsu3cO
 y2KDfjE1FHlek8omVIdcrW2sqVXfxvGwPUK0oJZ9qTxxzgg+52GaR9HSFe6hs2329pVCO1xtptv
 nFTd8HFAN/NXBO1LHITS/VRAfVMdslwy0ekR8FUALLwaN7nvX27/xF3zvo/M3LRi13Ll0Yt/AXy
 /M32BiUJVRtH+ZraGy+IlaSt9x9yPnMZlakKLTk+05xpp1V7h/YL8SoI2ws0j8/zbZeTDCodq1U
 tMbedcd4ink1Fz0tPgxFSLtUZ8asFCk0hIuMaxxNjAC+pJ3MawlZ8U3SLt+kK9I5eyFlFAxbx1U
 Gv79Ezsg
X-Proofpoint-ORIG-GUID: 7UNfoOdjS3liNoHPkEIYohJFRV8tiIdn
X-Proofpoint-GUID: 7UNfoOdjS3liNoHPkEIYohJFRV8tiIdn
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bf436e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=7zjSVlYyKO-sLu-dpfcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On Mon, Sep 08, 2025 at 12:59:37PM -0500, Ryan Eatmon wrote:
> 
> 
> On 9/8/2025 9:19 AM, Rob Clark wrote:
> > On Mon, Sep 8, 2025 at 6:39 AM Ryan Eatmon <reatmon@ti.com> wrote:
> > > 
> > > 
> > > 
> > > On 9/6/2025 6:24 PM, Rob Clark wrote:
> > > > On Sat, May 24, 2025 at 10:15 AM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > 
> > > > > On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> > > > > > From: Ryan Eatmon <reatmon@ti.com>
> > > > > > 
> > > > > > The files generated by gen_header.py capture the source path to the
> > > > > > input files and the date.  While that can be informative, it varies
> > > > > > based on where and when the kernel was built as the full path is
> > > > > > captured.
> > > > > > 
> > > > > > Since all of the files that this tool is run on is under the drivers
> > > > > > directory, this modifies the application to strip all of the path before
> > > > > > drivers.  Additionally it prints <stripped> instead of the date.
> > > > > > 
> > > > > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> > > > > > ---
> > > > > > The files generated by gen_header.py include the source path to the
> > > > > > input files and the build date. While this information can be useful,
> > > > > > it inadvertently exposes build system configuration details in the
> > > > > > binaries. This hinders binary reproducibility, as the output will
> > > > > > vary if the build environment changes.
> > > > > > 
> > > > > > This change was originally submitted to the linux-yocto-dev kernel [1]
> > > > > > to address binary reproducibility QA errors. However, the fix is generic
> > > > > > enough to be applicable to the mainline kernel and would benefit other
> > > > > > distributions as well. So proposing it here for broader inclusion.
> > > > > > 
> > > > > > [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
> > > > > > ---
> > > > > > Changes in v2:
> > > > > > - Corrected author id
> > > > > > - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
> > > > > > ---
> > > > > >    drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
> > > > > >    1 file changed, 5 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > 
> > > > > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > 
> > > > > Rob, WDYT?
> > > > 
> > > > I'm revisiting this one, in the context of trying to re-sync
> > > > gen_header.py with mesa.. but it is only changing the contents of
> > > > comments, so it's not quite clear to me how this ends up mattering for
> > > > binary reproducibility.
> > > 
> > > The reason it matters is that for Yocto, the generated header file is
> > > identified as a file that needs to be installed into the sysroot.  All
> > > files going into the sysroot are checked to make sure they do not
> > > contain dates and/or paths to the build directory contained within.
> > > Since this is a generated header file that is included in the sysroot we
> > > needed to strip out the path and date.
> > > 
> > > The idea for the reproducible builds are that the same files on a
> > > different a machine at a different time should produce 100% identical
> > > files.  Including paths and dates violates that tenet.
> > > 
> > > Hope that helps explain why we needed this.  So long as the
> > > gen_header.py is being called to generate header files then we need to
> > > maintain the reproducible aspect.
> > > 
> > 
> > My plan is (was?) to just replace the entire comment header with simply:
> > 
> >    /* Autogenerated file, DO NOT EDIT manually! */
> > 
> > That said, I'm not entirely sure why these files should get installed
> > into the sysroot?  I'm not super hands-on familiar with Yocto, so
> > maybe there is a good reason.. but if there is, maybe the plan to
> > remove the license/etc from the comment header isn't such a good idea
> > after all?
> 
> The generated header files would be part of a linux-headers package that
> would be needed to build other packages as part of the distro.  And so the
> header files are all checked against the rules.  A linux-headers type
> package is common for distros to have available.

I think you mean linux-libc-headers here. No, as Rob wrote, it is not
(these headers are not even under include/ subdir.

Do we check the work-shared/kernel-source and kernel-build-artifacts for
sysroot paths?

> 
> 
> > BR,
> > -R
> > 
> > > 
> > > > That said, since the generated files are no longer checked in to mesa
> > > > or the kernel, we could probably just drop all of this if it mattered.
> > > > 
> > > > BR,
> > > > -R
> > > 
> > > --
> > > Ryan Eatmon                reatmon@ti.com
> > > -----------------------------------------
> > > Texas Instruments, Inc.  -  LCPD  -  MGTS
> > > 
> > > 
> 
> -- 
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
> 

-- 
With best wishes
Dmitry

