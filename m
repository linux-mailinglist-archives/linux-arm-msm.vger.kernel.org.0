Return-Path: <linux-arm-msm+bounces-67794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB441B1B699
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 16:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B77BB163F0C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 14:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C0C275B0E;
	Tue,  5 Aug 2025 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwAWZaWk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49432749D3
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 14:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754404380; cv=none; b=Vpm0ZPc1aKIts18BYLSDn9Gtmj3oLkLoJxnUJ5XcG8wj3nSUx3yLVzfBELQMVv6VS91+nP756AuRkxAHsVXZf/UyQU8htdaGpJo38z7D5Gnh11fesh9v3KFxCxPCTydYp3sHEJDpIklRGJiDWYSpY9klZigxk7GqxBtNU+qzrsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754404380; c=relaxed/simple;
	bh=ubnpttMYthD7m7LTVMglNaj0LN4XBLh6t5L4snkudTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDr80DLCrAbA562JKVVXAHO3kVDqe4smUWwpNaOljmwMkNLDvLIv7HFLZ86AU8839w6BAtX3h5iJTpPC2e1ZS6YqyXD64B9Whcqcgnq8TEMcNvh83TPs/mWdGNPTXOhXcqIDsUvNZNrRMUibz8CdzImijb9GBiV4T4URuvSawGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwAWZaWk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575BhiJa016608
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 14:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=dcfbSdm9Ee7XiCvbdE06SqCLz4R1Y5fBAtNbrpESQsg=; b=kw
	AWZaWkierTuS1AXQ2oj4nv289QBcA0GQMngyrYHc81/b77giiMnAX+R/KpPBHdqK
	JWsAu89I3haARHRFsV3uE1oN2sihg2B14r6uNeVwNczAQ86FCWUjKRpR+iWa33Qq
	IUNoJfrzTSFUHPZEQyF1r4c9HwMAn6JopfniGNwqHu2l5d7SqGQ71tHqwNTy/IJ6
	vvmD9mkKT1fbfFv2QYgTybkdOysUfSIWlodEyoYOitz0MXmrqqTYId7EfXqcDLPT
	Fl6+Lva69KtnX9znbjEAyEK+GkxEFjUSvN0T00mViWL1bkSW41U7DMsj0jULJlGQ
	NvraCNVkSvRKh0X2Vw2Q==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a8m13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 14:32:57 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6195f7f9c0bso794136eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 07:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754404377; x=1755009177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcfbSdm9Ee7XiCvbdE06SqCLz4R1Y5fBAtNbrpESQsg=;
        b=UK2QWLqpgkfOUxAEZBuikJrn6ifEoOKqIjzHsOcGQjj7y4NR5J6qC9NCcb61qolcej
         pvP3TAVewLQgVITZCy3AbAAIa5Eayzic8hPeY/uXrosN65yAYR6lDL/F23elCJkpgVw8
         tviSpYzwxtFlEkIU7+PqVDgJnnn7JACjlBQW18aVXp8gcOUfvgp+NXNMgtMgyopyFAeS
         SgvYEch/2hNSmk4pWkWJRkQve1ts6rCiTMw2/x31ghoYBxvH98wUeQR4Ws3ENwbNuwOY
         fU+znpXu+qZnymh3BAZxLXgp/s1AkRp4zRBzqJQT3nkYH11b0RVdXMVGOK1B2rTBpDZT
         F0kw==
X-Forwarded-Encrypted: i=1; AJvYcCWvYC41I5CtSCzPiS7xThxHNZPk1xVrkuo9j94JvS07kEgW/kmbe8XD0qN4+O8WVw4swTenzbqfEbLWfziu@vger.kernel.org
X-Gm-Message-State: AOJu0YxUsp4tGVOldDvQdgoPUtTylnrZEUxN8vP8VajdQsKP9YYc830z
	sXp/DaJe7Ouo1qkH6zjPssEHz0mne4JjIg8gmMFHhVCp98e8e34fJNQIdsohBxOlr0BTOG0SAVX
	1DGXrqlHgpeFH+wHeEH7jba+UYEPwA120xiRyJx7eoi2ZlSJbO3oonyaJ6ZZZIQo2jp/zxwtb0J
	Qw4Q5hU32YhlKRIYrCXKgEHBtLskbMPRYyy6LMn9qp9gQ=
X-Gm-Gg: ASbGnctwqd7GxDqcAlhHksvZlf2bbfZ4OiUSt5l6DHS5pdE/NosR7Tk/80O6drxvJzw
	fq9BQPJ/jRTbjC2w4sUcDIk09Nt3C/teCYfIsPpv+/TWz+KVBI4VUSI3+soyOQreY4eRl+w3i76
	SWkMwLynRiJC1HL71IWW+QW8+mk76WMHV+GiMi0XZzdGpI4lVMcJ08
X-Received: by 2002:a05:6820:1785:b0:615:9c11:a072 with SMTP id 006d021491bc7-6198f2b7469mr6807597eaf.8.1754404376618;
        Tue, 05 Aug 2025 07:32:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgTHzGv7bbHmoZCYxU0MwfB7R6TpKmYB3jhbd70O5XW2GBJ9V6PQaJ1C7650u9P3ThXFLr3niaQ6AHhJ7ErjM=
X-Received: by 2002:a05:6820:1785:b0:615:9c11:a072 with SMTP id
 006d021491bc7-6198f2b7469mr6807569eaf.8.1754404376188; Tue, 05 Aug 2025
 07:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
 <20250804214317.658704-2-robin.clark@oss.qualcomm.com> <DBUE2QU2CH9N.3C32KHT9LHMMB@kernel.org>
In-Reply-To: <DBUE2QU2CH9N.3C32KHT9LHMMB@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 07:32:45 -0700
X-Gm-Features: Ac12FXypilQQiU00lSypaqGZbf1ZEMtpPC_1-gRbyH_0q2bmoCLhUbqnnH9WbwE
Message-ID: <CACSVV0270Zk4ApR_pGZ+sKgoi14kvfOo_NvzVq3-QALE0mpFsQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] drm/gpuvm: Send in-place re-maps to the driver
 as remap
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Lyude Paul <lyude@redhat.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=68921619 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3qJefBXy7TsPhfuKpUwA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: _hGSsUtx4dlh9IlWrEQcuVGjx1R3PGgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEwNiBTYWx0ZWRfX0CAmafybx0Bg
 n2xSmjrxk7514HOr9yT9UKXxNEPNr8kql6pC5iDYnnR8nP97xKwjMXOofnwGbG5mDcaJDLddfiM
 Pwzcspk/MvsyJIjFk0B6jPk5keaNJv4REt2UOAgx6ciUEuSQW/r0iKTPAEPpF5EUocRsh/px7mV
 UeI33bZyqvo/mAJf/vn2hQyz/uZjiog6pkflMLA82Ho7SFnoWhBKl17S8pMwGL2XUa6mmVXrfE3
 gWUpvH2kZETD+hsI/bL/GDTaHfcYieKbyFBRPCTTFh4tRPTMexDRF2MLb1/rGiZs4gYJtH3O/C/
 FIVMgRu8lXYvCw2OpsxO0XwLPnl0+mR3HRKhGWSqgmP5AEwMgEfIfX7Vrj7F524OLqZ/tQAONfF
 SURoWV14ZBdd3ni69xpL0mvOjyk7AeOTY0kY4e6mKQKJZxzXl+KujN8E0imc4FwadH38hQBq
X-Proofpoint-GUID: _hGSsUtx4dlh9IlWrEQcuVGjx1R3PGgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=973 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050106

On Tue, Aug 5, 2025 at 2:33=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> (Cc: Thomas, Boris, Matt, Alice)
>
> On Mon Aug 4, 2025 at 11:43 PM CEST, Rob Clark wrote:
> > The 'keep' hint on the unmap is only half useful, without being able to
> > link it to a map cb.  Instead combine the two ops into a remap op to
> > give the driver a chance to figure things out.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c            | 21 +++++++++++++++++++++
> >  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
> >  2 files changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index bbc7fecb6f4a..e21782a97fbe 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -2125,6 +2125,27 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >                                offset =3D=3D req_offset;
> >
> >                       if (end =3D=3D req_end) {
> > +                             if (merge) {
> > +                                     /*
> > +                                      * This is an exact remap of the =
existing
> > +                                      * VA (potentially flags change)?=
  Pass
> > +                                      * this to the driver as a remap =
so it can
> > +                                      * do an in-place update:
> > +                                      */
> > +                                     struct drm_gpuva_op_map n =3D {
> > +                                             .va.addr =3D va->va.addr,
> > +                                             .va.range =3D va->va.rang=
e,
> > +                                             .gem.obj =3D va->gem.obj,
> > +                                             .gem.offset =3D va->gem.o=
ffset,
> > +                                     };
> > +                                     struct drm_gpuva_op_unmap u =3D {
> > +                                             .va =3D va,
> > +                                             .keep =3D true,
> > +                                     };
> > +
> > +                                     return op_remap_cb(ops, priv, NUL=
L, &n, &u);
> > +                             }
>
> I don't see why this is necessary, a struct drm_gpuva_op_unmap carries th=
e
> struct drm_gpuva to unmap. You can easily compare this to the original re=
quest
> you gave to GPUVM, i.e. req_addr, req_range, req_obj, req_offset, etc.
>
> Which is what you have to do for any other unmap operation that has keep =
=3D=3D true
> anyways, e.g. if D is the exact same as A, B and C.
>
>         Cur
>         ---
>         1                       N
>         |---A---|---B---|---C---|
>
>         Req
>         ---
>         1                       N
>         |-----------D-----------|

Ugg, this means carrying around more state between the unmap and map
callbacks, vs. just handing all the data to the driver in a single
callback.  For the keep=3D=3Dtrue case, nouveau just seems to skip the
unmap.. I guess in your case the map operation is tolerant of
overwriting existing mappings so this works out, which isn't the case
with io_pgtable.

I guess I could handle the specific case of an exact in-place remap in
the driver to handle this specific case.  But the example you give
with multiple mappings would be harder to cope with.

I still feel there is some room for improvement in gpuvm to make this
easier for drivers.  Maybe what I proposed isn't the best general
solution, but somehow giving the drivers info about both the unmaps
and maps in the same callback would make things easier (and the remap
callback is _almost_ that).

BR,
-R

>
> In this case you get three unmap ops with keep =3D=3D true, which you can=
 compare to
> your request to figure out that you can keep the corresponding PTEs.
>
> Besides that it changes the semantics that the documentation mentions and=
 that
> drivers are allowed to rely on, i.e. a struct drm_gpuva_op_remap represen=
ts
> an actual change and any call to __drm_gpuvm_sm_map() results in an arbit=
rary
> number of unmap ops, a maximum of two remap ops and exactly one map opera=
tion.
>
> >                               ret =3D op_unmap_cb(ops, priv, va, merge)=
;
> >                               if (ret)
> >                                       return ret;

