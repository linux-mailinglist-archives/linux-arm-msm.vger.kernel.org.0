Return-Path: <linux-arm-msm+bounces-67796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D28CB1B6F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 16:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A8E7189801A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 15:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D8427932E;
	Tue,  5 Aug 2025 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8hVdAa9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAAC2264A0
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754405982; cv=none; b=MGeidHMJJyDJEEAagt4nPQqfoGoLE/8aHPLL1OP26Vw12VQAClgU94xJaylp2cqzk1aJ5Nd344J82haHT95Mcyu97Gikwk35x7BIaJpUupamX9J02QC+7/X+ZqXalTY/1RRZdUI0ZK4g6DVHwec52NXQkZHfkycGMfjWw/ySrFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754405982; c=relaxed/simple;
	bh=Pqpsb/yXPZJX6a6smsikIW3wjqsIsbIqICPjhHLioKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pU1NtKqJnQtuabGUo8S0M9NhX6Q1/vkIcD44c8af5ob/VBjoqbYaarJN7hPu54nfDtzpe/4+fMuS4iHTNJsZMgkMpNVs6OHJCnPPN7vVoJvnrTkcOTUzLCdOapeoxjC+2/B0t5XNvdI3U2TBxoJ3TZBoNAZbn3ZggeU4ne2vAIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8hVdAa9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575AJL6c011393
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 14:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5VP7v53va29cpzA7nUn1M5nUaw4K/K2gvLeC0gIRIqI=; b=I8
	hVdAa9vHymGy1m3iqE1rs/uXu0OxpGYo0/rAmvtRC4Q/PiSAZwvxA/qCJisjakNh
	e2DEkDS1CHYTABLl0zmGtlUxrpHB7v/ghPhYbiMGGXngaMUaw06Mo8SmOZ9rkrQf
	gFKl9fjcURWaeAcDWUyl5L0qS1IfxKZrmiEqDOmpZqeHw29W+DSqlFtjrLMJJWfS
	MoVALtRJcU55xSvftDaGkMbH3/vArzFMwvUiS9OcT9pzkW1I+lWW0FPh4qTPF3YA
	O8AScuGwREufjFmwMp4xLNnyXM8neUrewBTadujJJS5br7Ag5OeSzmeFosh0ksZe
	Owsr3HGl8OC29rOEmY6g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48avvubuyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 14:59:39 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-741af44b6aeso4559438a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 07:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754405979; x=1755010779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VP7v53va29cpzA7nUn1M5nUaw4K/K2gvLeC0gIRIqI=;
        b=tCWIrzA0qk37XIc1cbZoKOdY1En8Nz2TtM6ZPVzcRqQUoNEJjYsQ4dIltU1SNWSXYy
         kVEOBP0VVJ5yfxP3mmLADQrWla/qssxR60CRnRUoG8HubdDkUznRxyoEVKVyN42m0cIE
         CDA4sfWFd36YKGmSDDvTp0Ox8dAciCxKLzvEHIT0dW8xgCSuh8qzKl+S+++Qmij5sg5a
         w1oh7N/a1JkVcUV+UtXrOmVSBWDL76D7WBAqyzTsoHxOpf5m9UoRgTvYnMttQVfYQlqD
         b6Bip2V1Z+NWxOD9NK6JTSt3aj4UlR/UURBvSDJe6SPQFkXrzsEdO6lMC3bHiY8VeFXk
         AFow==
X-Forwarded-Encrypted: i=1; AJvYcCWsgv9zwb69+KvLns8CtqhEBDjArRXj7lpF6jgRa8KyuYio+5708SdjmK+kPkIZDAHSF0kqQXktIbxGy+ky@vger.kernel.org
X-Gm-Message-State: AOJu0YxJbP3Xq1BfZiJLhYU5DinNBBA6vLvSGR1pP3TSFdlpxLh8ux23
	tduUoFRRpfD74GEIHDULCeekiCvCyDhWRN/YxUCb8b+WTftAmWmruLNhEbx1xcdZVC3wR5Ojnid
	dc5x16jxzcYLLz6FvWqrEeIvtFIPjUnqFA7gqKHKVBymG/s+k5/cBLixGmwwh7R854uJ4xjkNE0
	Ag4e2qAwoqUeM0h+NrOX3h2mMp+jZ8ZuVMEQKhBgeIs5E=
X-Gm-Gg: ASbGncs36zRTy04aQtLw2sHshysAx6ImPoR50aoyTmmBrn0qdcswsi1CzS8dSh8f4dY
	E2dqcqPi0+9iH6D/J42k6VoPiap7TTW4TTtmYXR7vcBktCKI2A1w/2WzNqFJI0X3FH7nJsdbF2b
	wb9seJwcwwXGoG793oAEaYck169zs9+0nQYOVpONjLyDfbB337AsEn
X-Received: by 2002:a05:6808:124a:b0:401:e721:8b48 with SMTP id 5614622812f47-433f020d6f7mr7919658b6e.8.1754405978938;
        Tue, 05 Aug 2025 07:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+6ybutU9RtNNd8gKO1lElM7QyIOMCpne6QzqtryagfoJGG3ah1wcU/O0jC53ssU8ygi7M+t21QA06+nZ7Szo=
X-Received: by 2002:a05:6808:124a:b0:401:e721:8b48 with SMTP id
 5614622812f47-433f020d6f7mr7919636b6e.8.1754405978390; Tue, 05 Aug 2025
 07:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
 <20250804214317.658704-2-robin.clark@oss.qualcomm.com> <DBUE2QU2CH9N.3C32KHT9LHMMB@kernel.org>
 <CACSVV0270Zk4ApR_pGZ+sKgoi14kvfOo_NvzVq3-QALE0mpFsQ@mail.gmail.com> <DBUKRNHY14ZN.95GVIGMY7RAN@kernel.org>
In-Reply-To: <DBUKRNHY14ZN.95GVIGMY7RAN@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 07:59:27 -0700
X-Gm-Features: Ac12FXyia9P5tgbRPxVXrZTiL6VK4xUgl9aLrubrFFRerh-QJyYy5THAuzSUSx8
Message-ID: <CACSVV01zZ=o55YY=GHTKaJY1HorRUu73KA+5Puz2MonqH7JwuQ@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEwOCBTYWx0ZWRfX3gBVWHWY3dJ8
 4HGss4JUlqq/rpDit+UBqjLfeWHReUO7Y1XImnTvbXQiIx1TpZU58s8qaLcR7pu1Rvo1UFA1PuA
 ul55Gh0YnxFBhIX4gMkNxtBPTVvoz064D7/BETia0s0F/RBMXhocTitYHgnd7I2MaPTKiW78pVc
 MOUxtnZhrGqWFMUgVgf1u7VftkZ0rHoOCDLyxUHrf+lPNmPs/cPlXHWiULP+C3vAZJ4DqlZ83zs
 n99jnc4DYi9zVSesT7mnkin4hwdCzETmEs3KLjtjTpGUTuS6oVTIkbc/B77bK5kh3i6SW0oeilO
 ixEG3errcHx1TKz7FSypH9clWysweTLnkKv4kKkben9WMg6923HxHmumLsCG3d2joqkIMhNiJm3
 g36JrACh06zl4czgvoe2jjeQcDGXqAt8aSZRAkZVA9QbOAfdSKqGEhRR+ELdvOnCyrks78ea
X-Proofpoint-GUID: 7RSmbc4MQUgkQXB_hEwrXYNB-p9-9Bn6
X-Authority-Analysis: v=2.4 cv=OYKYDgTY c=1 sm=1 tr=0 ts=68921c5b cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=VwQbUJbxAAAA:8 a=gugPwdCod9cupdveROQA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: 7RSmbc4MQUgkQXB_hEwrXYNB-p9-9Bn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050108

On Tue, Aug 5, 2025 at 7:48=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Tue Aug 5, 2025 at 4:32 PM CEST, Rob Clark wrote:
> > On Tue, Aug 5, 2025 at 2:33=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> >> On Mon Aug 4, 2025 at 11:43 PM CEST, Rob Clark wrote:
> >> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm=
.c
> >> > index bbc7fecb6f4a..e21782a97fbe 100644
> >> > --- a/drivers/gpu/drm/drm_gpuvm.c
> >> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> >> > @@ -2125,6 +2125,27 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >> >                                offset =3D=3D req_offset;
> >> >
> >> >                       if (end =3D=3D req_end) {
> >> > +                             if (merge) {
> >> > +                                     /*
> >> > +                                      * This is an exact remap of t=
he existing
> >> > +                                      * VA (potentially flags chang=
e)?  Pass
> >> > +                                      * this to the driver as a rem=
ap so it can
> >> > +                                      * do an in-place update:
> >> > +                                      */
> >> > +                                     struct drm_gpuva_op_map n =3D =
{
> >> > +                                             .va.addr =3D va->va.ad=
dr,
> >> > +                                             .va.range =3D va->va.r=
ange,
> >> > +                                             .gem.obj =3D va->gem.o=
bj,
> >> > +                                             .gem.offset =3D va->ge=
m.offset,
> >> > +                                     };
> >> > +                                     struct drm_gpuva_op_unmap u =
=3D {
> >> > +                                             .va =3D va,
> >> > +                                             .keep =3D true,
> >> > +                                     };
> >> > +
> >> > +                                     return op_remap_cb(ops, priv, =
NULL, &n, &u);
> >> > +                             }
> >>
> >> I don't see why this is necessary, a struct drm_gpuva_op_unmap carries=
 the
> >> struct drm_gpuva to unmap. You can easily compare this to the original=
 request
> >> you gave to GPUVM, i.e. req_addr, req_range, req_obj, req_offset, etc.
> >>
> >> Which is what you have to do for any other unmap operation that has ke=
ep =3D=3D true
> >> anyways, e.g. if D is the exact same as A, B and C.
> >>
> >>         Cur
> >>         ---
> >>         1                       N
> >>         |---A---|---B---|---C---|
> >>
> >>         Req
> >>         ---
> >>         1                       N
> >>         |-----------D-----------|
> >
> > Ugg, this means carrying around more state between the unmap and map
> > callbacks, vs. just handing all the data to the driver in a single
> > callback.  For the keep=3D=3Dtrue case, nouveau just seems to skip the
> > unmap.. I guess in your case the map operation is tolerant of
> > overwriting existing mappings so this works out, which isn't the case
> > with io_pgtable.
>
> There is no "your case" as far as I'm concerned. Please don't think that =
I don't
> care about solving a problem, just because it's not relevant for any of t=
he
> drivers or subsystems I maintain. :)

Sorry, I didn't mean to imply that.. I was just trying to point out a
constraint that you might not be aware of :-)

> > I guess I could handle the specific case of an exact in-place remap in
> > the driver to handle this specific case.  But the example you give
> > with multiple mappings would be harder to cope with.
> >
> > I still feel there is some room for improvement in gpuvm to make this
> > easier for drivers.  Maybe what I proposed isn't the best general
> > solution, but somehow giving the drivers info about both the unmaps
> > and maps in the same callback would make things easier (and the remap
> > callback is _almost_ that).
>
> I generally agree with that, my concern is more about this specific patch=
.
>
> There are patches on the list that replace all the req_* arguments of
> __drm_gpuvm_sm_map() with a new struct drm_gpuvm_map_req.
>
> Maybe the unmap callbacks could simply provide a pointer to this object?

I think that would help.. I'd probably want some additional
information about overlapping 'keep' unmaps in the map callback as
well, or at least the range of the 'keep' unmaps so the map callback
knows that part of the new va is already mapped. But this seems
doable.

BR,
-R

> > BR,
> > -R
> >
> >>
> >> In this case you get three unmap ops with keep =3D=3D true, which you =
can compare to
> >> your request to figure out that you can keep the corresponding PTEs.
> >>
> >> Besides that it changes the semantics that the documentation mentions =
and that
> >> drivers are allowed to rely on, i.e. a struct drm_gpuva_op_remap repre=
sents
> >> an actual change and any call to __drm_gpuvm_sm_map() results in an ar=
bitrary
> >> number of unmap ops, a maximum of two remap ops and exactly one map op=
eration.
> >>
> >> >                               ret =3D op_unmap_cb(ops, priv, va, mer=
ge);
> >> >                               if (ret)
> >> >                                       return ret;
>

