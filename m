Return-Path: <linux-arm-msm+bounces-72587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AE0B4911D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 16:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E0EE3B6104
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 14:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99A130102F;
	Mon,  8 Sep 2025 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhMGD9bD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107DE1A2387
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 14:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757341197; cv=none; b=KnxabUhswG+DOHdkZINkH9tlTc4nPnEWBaHXJbGAkIKxlTAg6HK7MTT5y0xCe1f23CqlHeODGdVa+Kk5dv+LGdLE71u8VDoKriGGkZqxfoc0GwkdG/O8b+owLMKAhArtq/1f5dXVSXzea1q9c2iKBmwPhJQw3VPbOwNrQYZgfTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757341197; c=relaxed/simple;
	bh=TpfEo4KR+IeKvYBbNIbfmMIAuowUTN/DTG1JtQ4Kkjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quM8ym1qC0mbaMOUka0htoAKS/dWeEx+NnnKAdzWm33FVkY6RoHAxEIKYmPA/q6ihHDGCbxqC7XcGGpt78sWicIJTVbElL/BBOaulo1tm7tfVjQvKv9mAPkizgwH/4E0BJ/Nuu6WZ0IBL/gGuK8Co9GXvmaoU9VVfinkGgWaSu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhMGD9bD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58893unm030096
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 14:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=btuLMB/CAC/ZycWyoLU8mXnMfT5xBCHTrrEXhmbeoBY=; b=Vh
	MGD9bDs/crOhZ2Qdox/JMNz8I5TEkqFW2c7xDqQFrGvUbgTxS5RDdREZ83FVIzX0
	/aFccM4m+C48YYFOVTMoW7exDsXz8elP/Psrm7T4HV3q0aGAe06B8IDEz0uRY+Ks
	L5JGeWu0Czt7lgbttgpoOghbF5mZMmhGC+n1GW6aA8UMh/3bG4PWOildgRCNDXrm
	QLwMuzsqnRxUqwecyvz2fDas2a2fj9QTn8goyNbU0mpuY7FYsyPEL1MVeAkVW7sW
	9lVZW0cGF551cfHGsgAmTe1XQQFzEVBc9VzNqimxWvUvYJ7raOb6n0p4ntpYM1aC
	9lb25ryPoPE5NajVJ10A==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kvqm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 14:19:55 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-31d8778cd93so6187029fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 07:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757341194; x=1757945994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btuLMB/CAC/ZycWyoLU8mXnMfT5xBCHTrrEXhmbeoBY=;
        b=StlsH8GXnIaYyuEU+bMas9JE5Ku0jdJLdOwGco6gxhBqKEBbOCDSYpJBtsb4acDtX3
         B2WnNHbvNN+mLeBumYmiVtjf94//Qg+aDb5LANwevSj1oWcd5b/vOkkTaS7rcH/1PY5V
         cekOIonk5LF18gH0CMbbdWcKb7mLVV/3D9Lch/3oENvptccI+efhDPKoNlQzcWnAGchx
         zM3nanwuJtAGLFvIYglmsU7p7DAbZ3hPqJCSvJMbSga/HumPs3LeidG44w2Gpi5Vrpmo
         RcR2F6/c2Lcgd7egDYFer3XYUESFP0+0MzDBCyyLS6qAGY/+c7Dl4bXW+3CDbAImeasy
         xX5A==
X-Forwarded-Encrypted: i=1; AJvYcCWfaEvpPi3aLPCekfyvmywVy/qCXZkitC41TsyV7JBcZ/vmB0IcxoIEA5uqDu44xYfFS3TS+kLBKIwiKNX/@vger.kernel.org
X-Gm-Message-State: AOJu0YxGWl04mN9ITED4TomgQp23HllVSr7zg7GRGcByv2aWZdZr02fN
	17BKPNs3T4raPrlir7F5X9lWwCj5vqrxWR3u7bAUR7uratHgFGPUNmPbcPK/or3xTt/P2+QY7wx
	wnO6DAkmcxroiCIIvAKopmPZh/KEl/LomxGBCumcFzZ5x+hbXmnPPgChm6T4TOwaPOA56NWh/S4
	dJk01pJQCd/g0qOfWRkkrXsRaFFTPCbNBzciVrr8LtuZo=
X-Gm-Gg: ASbGncs51djLf1SafP/GOsdTBgncmpkLmA82DocYKNi4tpl/XQf3oFQcgxT6FN/fTQ3
	UIGXayAHNLVPF+dBk5zJ+j4v9gJp7B5RGa2y9ZgnFxfm4WWarHB0HkAcXrZ0IkLnL7XSkAnNnqh
	aYTKR0ZviZc867ZgsSffSf5yF5DMzerlK85LH6x4qaLKwmpI/nF83T
X-Received: by 2002:a05:6870:1e89:b0:31d:6467:3ddd with SMTP id 586e51a60fabf-322626446aemr3778319fac.3.1757341194024;
        Mon, 08 Sep 2025 07:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTNvBd4kHJ2BnKznwqM+jmbGwcy/k3UWsvd2ldCKNZNQmupE4lvVSNxcIQw2N6Yuv5svQqGxpPyiy7oLfCu5k=
X-Received: by 2002:a05:6870:1e89:b0:31d:6467:3ddd with SMTP id
 586e51a60fabf-322626446aemr3778298fac.3.1757341193225; Mon, 08 Sep 2025
 07:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
 <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com> <51cdf832-95a2-47bf-bc27-d43097883701@ti.com>
In-Reply-To: <51cdf832-95a2-47bf-bc27-d43097883701@ti.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 07:19:41 -0700
X-Gm-Features: Ac12FXxslNmNXRsbTxmU1Iy_jtvuzXP9Loe6WDYzQOeLeHFE1_OVc4JUJB4dkzA
Message-ID: <CACSVV02YrpYrvbFxKc808a=GjdxVjO=FjRG9gs_6qe5W-v=a9g@mail.gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve reproducibility
To: Ryan Eatmon <reatmon@ti.com>
Cc: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX06D+BZcgSe+V
 m6ESsG6AgWDTTpFEAFxnXVztcTJOcd8AYTflts3Afap9gSXKiAoztfixRNebJCAbmmJEEBDQ3yE
 iM5iqcfMUGgGRGTVqm2sGJilviDC2+2X8CCIQVPQAvxQLAu2J+l63rY5uq84T4pd5Tfbxqr4gkg
 L4x8kQSTzNbDblM60dHKM9zqwF8tOVWAoAptB8LldQ76TRvzzEUjzhgLDkzhhRku2/0CbUsNwAe
 jXK4TFz7IHLHzmRGj9bnMYRIVw2tpoY1QsRVp2mznx68GjJ5MaCJkx8doF/Q9rwsLI/0NI1lrzM
 daxkuLFJAbHZnRWYjvmYx+oX7DYZKkvoBljc6xQQJ4FoTyVZplYa2PBRL0Xv+MVwhWCnTozthA2
 ya5wFvTC
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bee60b cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8
 a=pGLkceISAAAA:8 a=UuwjNODqMk2Ng1o2D8wA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: XT_ROdZKQu8ZFIhXHSWSfwn2vOJdaOVT
X-Proofpoint-ORIG-GUID: XT_ROdZKQu8ZFIhXHSWSfwn2vOJdaOVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On Mon, Sep 8, 2025 at 6:39=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
>
> On 9/6/2025 6:24 PM, Rob Clark wrote:
> > On Sat, May 24, 2025 at 10:15=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> >>> From: Ryan Eatmon <reatmon@ti.com>
> >>>
> >>> The files generated by gen_header.py capture the source path to the
> >>> input files and the date.  While that can be informative, it varies
> >>> based on where and when the kernel was built as the full path is
> >>> captured.
> >>>
> >>> Since all of the files that this tool is run on is under the drivers
> >>> directory, this modifies the application to strip all of the path bef=
ore
> >>> drivers.  Additionally it prints <stripped> instead of the date.
> >>>
> >>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> >>> ---
> >>> The files generated by gen_header.py include the source path to the
> >>> input files and the build date. While this information can be useful,
> >>> it inadvertently exposes build system configuration details in the
> >>> binaries. This hinders binary reproducibility, as the output will
> >>> vary if the build environment changes.
> >>>
> >>> This change was originally submitted to the linux-yocto-dev kernel [1=
]
> >>> to address binary reproducibility QA errors. However, the fix is gene=
ric
> >>> enough to be applicable to the mainline kernel and would benefit othe=
r
> >>> distributions as well. So proposing it here for broader inclusion.
> >>>
> >>> [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=3Df36faf0=
f9f8d8f5b4c43a68e5c6bd83a62253140
> >>> ---
> >>> Changes in v2:
> >>> - Corrected author id
> >>> - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a44651=
8847@oss.qualcomm.com
> >>> ---
> >>>   drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
> >>>   1 file changed, 5 insertions(+), 3 deletions(-)
> >>>
> >>
> >> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>
> >> Rob, WDYT?
> >
> > I'm revisiting this one, in the context of trying to re-sync
> > gen_header.py with mesa.. but it is only changing the contents of
> > comments, so it's not quite clear to me how this ends up mattering for
> > binary reproducibility.
>
> The reason it matters is that for Yocto, the generated header file is
> identified as a file that needs to be installed into the sysroot.  All
> files going into the sysroot are checked to make sure they do not
> contain dates and/or paths to the build directory contained within.
> Since this is a generated header file that is included in the sysroot we
> needed to strip out the path and date.
>
> The idea for the reproducible builds are that the same files on a
> different a machine at a different time should produce 100% identical
> files.  Including paths and dates violates that tenet.
>
> Hope that helps explain why we needed this.  So long as the
> gen_header.py is being called to generate header files then we need to
> maintain the reproducible aspect.
>

My plan is (was?) to just replace the entire comment header with simply:

  /* Autogenerated file, DO NOT EDIT manually! */

That said, I'm not entirely sure why these files should get installed
into the sysroot?  I'm not super hands-on familiar with Yocto, so
maybe there is a good reason.. but if there is, maybe the plan to
remove the license/etc from the comment header isn't such a good idea
after all?

BR,
-R

>
> > That said, since the generated files are no longer checked in to mesa
> > or the kernel, we could probably just drop all of this if it mattered.
> >
> > BR,
> > -R
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
>

