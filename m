Return-Path: <linux-arm-msm+bounces-72638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F1B49990
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 024334421C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9662367CD;
	Mon,  8 Sep 2025 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FS3rFM4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E56239E7D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 19:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757358859; cv=none; b=hCi+9JLlPairDSuo2xCRt9jnNk6ag2VMzalRdUk8iNqGxUcS91Rjzi4kH7jJmYob/7FyqMPDZHdkkvkpgVyDTss42asVN5D4BWUz+MF4fTPmmonGurC+E4x7qi6iN8Vs6z9gONYdEG4UmKLa8v6jHgtn/bSoP8ZXYortrbcVRCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757358859; c=relaxed/simple;
	bh=PwWRPdr+5J09MV5oqARBCzeyGhKcPftH5MLE11MY15o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VkIzQgniArZ9FS0RLd53pVEuqyoOGDJ13VBVBNJg0fX4BVp6D/sxCsAE3GXgF8evDJ7eXE42Lyy5sIFUkIXVk2TkhbBiRFTcPGv63YdpehISCGMqHqSGIOB8fFJGMzqZ1X3DrLHiwSOWnJVzFn+2cbKlkqZ97EjzxloYKRnnLRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FS3rFM4T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GKXeW023900
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 19:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=vJousEWyIWj0ub4ZHn6o3Sl6CyGPUwpGa21aRKVc7Yk=; b=FS
	3rFM4TMjv6TCTt1jOjiOlisYyipDiwXSs3XP3nY+uIy+Wv0IScJlR79HTz07MCoX
	Vhi3UqI9HWugk11YV4T6BRdEqYprXSpnLeNVETFcq+NDAEj/6tekTanodfxZBdUx
	UjnFxc3CrYknR3fhLOI30aWVxh2hz7E8tBORhfQLFr5dMsNNC5xxu03kAIbX7uq5
	auogqTpTIYAoECF2qqwLaSHI5yBfx4X5+mHT6rxPXaeYjnXvqCMjbsXEQcrOdx5B
	yAjwite7w03kt/qEymz1bZnPAKU/nV3K4ATSuJSL8iBWertH/A6ufUkCpbhjlEAi
	qsse2VIsiz2tdp2slpZw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a5kub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 19:14:10 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-319c4251788so5972235fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 12:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757358850; x=1757963650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vJousEWyIWj0ub4ZHn6o3Sl6CyGPUwpGa21aRKVc7Yk=;
        b=Cz3tpb5PMShCP1V921ifFreDC8GYDBusIvJkgQ7BHLYAb8npY6FGn46Aefy36tiwQv
         +uJNlPtQXNOH7sbuLxddsO1Z99xFLSZhCmbO73GCiy3j82FEH7TrHS18UCgy+wVmvABg
         I6o7VUYOL3JQnviqEf3LWYqb/NvaL/Nxm9XyKzHuIsjs3yhVt/wvzm8pIWceW5TwtGax
         kV8vvfTtUfLl8O+c+ucPjiSbwA1qXigIKjssd1HGo2SE/ml+TufOW2WJDPt6i3ZqqVQ2
         3sXUh2x7Tvu6Obs952JXfXR7KlyVszgjPiZaHHVix+6bGSTsysYY+f1o8mb7FDZxT9am
         ZrIw==
X-Forwarded-Encrypted: i=1; AJvYcCX0TNrUC2+cwIGCezbVl4iWROEC/fEBIfgD7/GMyVR2tMTTIj1P6boiSoVMSKn7Kf8QpOJX53EemG9qwCuB@vger.kernel.org
X-Gm-Message-State: AOJu0YzZgYtjQ6Kgi8oNibyV2NSXMpcoP85ffIeh4sGGnvJKoEYZMB9x
	4k9HbxfGA1Iz+9UnC1CcOeDu5RRr0+KJ/QwJfb0WIJS8AyoJpHbvWqSUPFlPBobeO4S+gNnON15
	/tszXrbNS3cyS5kqI7f55C90Mxb88AMBKtU7x91VapJq703YJJafnpnbkaf/KoJsNsetqPZDgzQ
	4jQOaGC9oBbdL1WHVjcQ80vE6//OXIvs/8IH7uUNzqsSc=
X-Gm-Gg: ASbGncssULiXGXri7CRXHtcMCJJQmWpPmJq+5SXeE6PBEDFAB+Ua9Rr9Ov90DpUelbO
	AgVRVYV8ZUzZwscNJgR/E/RI6g7MijLSSQvFyT0sJogikz6KD/QjawvgohMuJQXvy56pT6KOgNK
	crge2un/Q0HnljwyqEP7MxovD4DQjIjb1splsiYwTrrMoPgh9JKGcj
X-Received: by 2002:a05:6870:524d:b0:321:2b89:bbaa with SMTP id 586e51a60fabf-3226284cc86mr4609088fac.6.1757358849634;
        Mon, 08 Sep 2025 12:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGokMZ7QUqcfHUl38dF+DB2O10fwJWlpb3ZPwwVbBjH/HoiQE2yWgmsLyAzH2eSvGXvnd62ydkMLjA94QKHo7g=
X-Received: by 2002:a05:6870:524d:b0:321:2b89:bbaa with SMTP id
 586e51a60fabf-3226284cc86mr4609070fac.6.1757358849094; Mon, 08 Sep 2025
 12:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
 <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
 <51cdf832-95a2-47bf-bc27-d43097883701@ti.com> <CACSVV02YrpYrvbFxKc808a=GjdxVjO=FjRG9gs_6qe5W-v=a9g@mail.gmail.com>
 <858dea80-1bd6-4bbc-9b98-9f959c00b304@ti.com>
In-Reply-To: <858dea80-1bd6-4bbc-9b98-9f959c00b304@ti.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 12:13:57 -0700
X-Gm-Features: AS18NWD6PCBVVpU8xqhBnPcHvCAMvQ-KNt6NE47xv7XjxuR77RvPVN2COWfaD_s
Message-ID: <CACSVV027yBWLKaghuBnnGPg84W6RvrO=O+55ROx-SOeqTMbDGA@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68bf2b02 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8
 a=pGLkceISAAAA:8 a=E82fJwX0KJD4OIwMoWkA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: pQO-xMdVSeTEqvq_eczZbiTmGgXt_w6o
X-Proofpoint-ORIG-GUID: pQO-xMdVSeTEqvq_eczZbiTmGgXt_w6o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX+xdA4tr0yKy3
 pxi+HauaOgc10oQ+SM1lhkhXNkxzb4DIJebSMiAtbke5TwPiKFkM6qITeFWDC/i9uW3pIv8XSy8
 xjS57uHwbtFnN0PCr3HXN77eMuBLAmwexVxGGAi0W532TYlrAswTOrVB8i5pltAGgxhFT+ZRB7L
 v+9ptSnnBb1lrxYdW1glcYPuTjLvTHDzbxGV9OuZH7h//agA9RI3LB0+fwf85foBYk5SkSOpf5H
 Xw4TYNy1nFnUVD2mzlRIgp1ArXALG02vbb1RNGbR2dNInvMEz66/6WwP5k72n923/qzWIpVoedZ
 4s9DA05otk3RXhFAoDD8j71s4sO4ydoNZwYOhWxTO2o2tqTckcjp2MUVw1rb/rQmLiy6Pv0Wn8l
 HlU0OZNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On Mon, Sep 8, 2025 at 10:59=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
>
> On 9/8/2025 9:19 AM, Rob Clark wrote:
> > On Mon, Sep 8, 2025 at 6:39=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wro=
te:
> >>
> >>
> >>
> >> On 9/6/2025 6:24 PM, Rob Clark wrote:
> >>> On Sat, May 24, 2025 at 10:15=E2=80=AFAM Dmitry Baryshkov
> >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>>
> >>>> On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> >>>>> From: Ryan Eatmon <reatmon@ti.com>
> >>>>>
> >>>>> The files generated by gen_header.py capture the source path to the
> >>>>> input files and the date.  While that can be informative, it varies
> >>>>> based on where and when the kernel was built as the full path is
> >>>>> captured.
> >>>>>
> >>>>> Since all of the files that this tool is run on is under the driver=
s
> >>>>> directory, this modifies the application to strip all of the path b=
efore
> >>>>> drivers.  Additionally it prints <stripped> instead of the date.
> >>>>>
> >>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>>> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.co=
m>
> >>>>> ---
> >>>>> The files generated by gen_header.py include the source path to the
> >>>>> input files and the build date. While this information can be usefu=
l,
> >>>>> it inadvertently exposes build system configuration details in the
> >>>>> binaries. This hinders binary reproducibility, as the output will
> >>>>> vary if the build environment changes.
> >>>>>
> >>>>> This change was originally submitted to the linux-yocto-dev kernel =
[1]
> >>>>> to address binary reproducibility QA errors. However, the fix is ge=
neric
> >>>>> enough to be applicable to the mainline kernel and would benefit ot=
her
> >>>>> distributions as well. So proposing it here for broader inclusion.
> >>>>>
> >>>>> [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=3Df36fa=
f0f9f8d8f5b4c43a68e5c6bd83a62253140
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> - Corrected author id
> >>>>> - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446=
518847@oss.qualcomm.com
> >>>>> ---
> >>>>>    drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
> >>>>>    1 file changed, 5 insertions(+), 3 deletions(-)
> >>>>>
> >>>>
> >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>
> >>>> Rob, WDYT?
> >>>
> >>> I'm revisiting this one, in the context of trying to re-sync
> >>> gen_header.py with mesa.. but it is only changing the contents of
> >>> comments, so it's not quite clear to me how this ends up mattering fo=
r
> >>> binary reproducibility.
> >>
> >> The reason it matters is that for Yocto, the generated header file is
> >> identified as a file that needs to be installed into the sysroot.  All
> >> files going into the sysroot are checked to make sure they do not
> >> contain dates and/or paths to the build directory contained within.
> >> Since this is a generated header file that is included in the sysroot =
we
> >> needed to strip out the path and date.
> >>
> >> The idea for the reproducible builds are that the same files on a
> >> different a machine at a different time should produce 100% identical
> >> files.  Including paths and dates violates that tenet.
> >>
> >> Hope that helps explain why we needed this.  So long as the
> >> gen_header.py is being called to generate header files then we need to
> >> maintain the reproducible aspect.
> >>
> >
> > My plan is (was?) to just replace the entire comment header with simply=
:
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
> would be needed to build other packages as part of the distro.  And so
> the header files are all checked against the rules.  A linux-headers
> type package is common for distros to have available.
>

These headers should only be used to build the kernel, they are not in
include/uapi and as such should not be used for building any other
userspace package (or out of tree kernel module, for that matter).

BR,
-R

>
> > BR,
> > -R
> >
> >>
> >>> That said, since the generated files are no longer checked in to mesa
> >>> or the kernel, we could probably just drop all of this if it mattered=
.
> >>>
> >>> BR,
> >>> -R
> >>
> >> --
> >> Ryan Eatmon                reatmon@ti.com
> >> -----------------------------------------
> >> Texas Instruments, Inc.  -  LCPD  -  MGTS
> >>
> >>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>

