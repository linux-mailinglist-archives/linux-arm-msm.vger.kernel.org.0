Return-Path: <linux-arm-msm+bounces-74458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 630EDB92775
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 19:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 364DB1904C07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 17:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8CE3164AA;
	Mon, 22 Sep 2025 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLzOmE8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A283161AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758562993; cv=none; b=C1QGK5FzAGMP2NU2c3kq5qQdM+37zHE7i0otMOmiuGp4XdUOuIo+G6Sb2QfY3Kb9DhDL8bAd8ZnimOnGoagBceSzOU8IbdGoXNL1zxZoNlywfRrrN1IiSQCcJs01Po/OKNirlfe1f5TaWGS0ETTGbOybKfa6Gl2hXRFDBMD/oFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758562993; c=relaxed/simple;
	bh=JF4w6KNGnuKCjdC182NdLkyovnl2owTMQCcxkDcd66g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMiv6Uej6918Xc4/8ciHJnnvHEdcx1L7veK8LuCWQoOMwrF/cYocNTTIQ/BgpXwvNJw4AdbqNTxNLuW9W4Uw+AYcdx5iTAwlxS7QO3p5LFrHjtBrQNWlfEw41IbnERfhIxl6AsE54+V1BRSnhSGSJ4bEe3RCN+Dga3qto/7h5aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLzOmE8w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHV9eU027593
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 17:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=yvgfuHDV+HWhZSkeRI3Pt16FGGVNb4TH8n/i52MwM3g=; b=NL
	zOmE8wLavsRCLuc23aBaXpL2n2/OVgmwBBv6t621NZ5i8QAv4DyQXNpZDfBkSxkv
	kqYkAfXhhKjyB+H84X0C0t7dzDZa5Wxxr+Qv6MnA4i1YOb7S/OfC8aqfgeeDVh4S
	B0/rqTZ0bGjre7DO2yP+EmLTFzVSdYkl19zmcd0o0Ka/+26N8TM3mD4/Nurzhpe1
	9s4Xyfb2ufV96986hxhPMrW8Qo1xd+m1XiabZoXUBlH+x9uR9FUDf4SR1mwB9B45
	sROklBhbOITms1+jG7dmJtC9EsekRsY2qkcElHhGQGn53cF3i8UfHRH/7MpEEn7j
	PFPk9aK3fWZ08Vo5329Q==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg35me9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 17:43:11 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-32752a91542so6027683fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 10:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758562990; x=1759167790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvgfuHDV+HWhZSkeRI3Pt16FGGVNb4TH8n/i52MwM3g=;
        b=jHzTenEYzJHR+Q3A7d6STp3PnQjdCZekQT5Z8oOP23RvXxtV5RJEr92Oa7LFCAR6kS
         95/yoSrJjgTRf/jxvcTgRxY/Hn7AlypussstDwkZi/BTFsg8huGWSEV6N+GZ8SJkVxSx
         6qYKusZjSscuv87cFrbA+QFWRIpG7dHnDnt12ADOd4qSGKkww7xZjJnm7JEYH56HNef6
         hPOD7TrhmizFNDRZZj9dV0WUYY4BcRyakc86XVfsHhXFbm6sqT9miy0cj5vh1O9d24MR
         gwehiSpCsGBdwrd3RsGDZp2Wx4U+nJ+QQUkAWJtaYegbdWytKM1EF+pJ8SkQfkgcRJpX
         U2TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzGKzb/HEG+HMdcNGQpf/eg0XNncYX2Il0oJwfGAq5lRccny1lYsaf5whYaPptFsKffoowhmqM6FIcF2li@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4GYZ1S8r8X16sNt/GzufwNfDYLuM5ERFg7R9jhetk4cVF5BHU
	rZcRv9+WywCIVDftcoGsU0faLyYAwsFpIz/NopmZLTfBXkLKySEnLkQ1LYeHbEXTt0Fpg/RqVgB
	ruUulPdaCXmv94mwtZcQxTn7gVQIEdKfuCAE+fgFWHzcQiqpuIo4m097g4Zrtm40oE7XOsCMzel
	cDtwbqhe8nkdIfBSBtBlyziphsgBQcdNZx5xFhWg6fedA=
X-Gm-Gg: ASbGnctIjYSYYusPWolxAyLpq8iMMBBks+cX5UBZ92Qsz+cPTM2D83AA8oAiv5Bg7RR
	6WsqS3f2sRZwmI/1aiHxnALkirSudNLMFixxPQ38JAO/CRZCHdjXVFFfLtxErj3xDws7jh19YvC
	QKJmCMmA4zNc7I3jqTDTcUdAOpBaTmqW6N18TYWHt9ZdzKX7CLAhua
X-Received: by 2002:a05:6871:81d0:10b0:341:2ab5:7d22 with SMTP id 586e51a60fabf-3412ab6015amr1979925fac.24.1758562985151;
        Mon, 22 Sep 2025 10:43:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoA0dMMXMZm/AwIu12gzZ7XmnuJ5PuUXYj+3q/9EpvzDPqD1DiF05WqIK0oiCIbqyqRkx3oOwvpZFzNPaRND0=
X-Received: by 2002:a05:6871:81d0:10b0:341:2ab5:7d22 with SMTP id
 586e51a60fabf-3412ab6015amr1979906fac.24.1758562984723; Mon, 22 Sep 2025
 10:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
 <20250723190852.18394-2-robin.clark@oss.qualcomm.com> <aNF6N8u1VIFSTaRM@linaro.org>
 <CACSVV033oJodLUS2cwTVeMc9Y3o4np3UgDyX=T8caspRk3--4g@mail.gmail.com> <aNF9TGkEfYqfegrR@linaro.org>
In-Reply-To: <aNF9TGkEfYqfegrR@linaro.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 10:42:52 -0700
X-Gm-Features: AS18NWDhKnn8QaJQZWfqnPyi5wz3R825ji-5IThInATomz4gWftXC54tqlmJrZg
Message-ID: <CACSVV015U3=KpZqxzH7ySO=ok8k-0ff_-Yzc33SK_Smj1c-4-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Fix refcnt underflow in error path
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX6B/vK7jIOVqj
 J9EjlBDY2+/BD+x7YXFmBpVZZHG9E4eib4JLAKQRHQjvWJwQ0HbZCX4fWcjCgkOUyXb8JGshXlw
 lzWSMePSnaGqM1RfMmjPMXm1lg3V9V8ACbsf59kdd47eqIxK5o7qhOlAWYb8wM5x6+sGJGbwXDU
 JX7xArC8SjffC2KGN6U5s92r/iuOMSA9hcR8j9d6LYqYiLA5oC6wYI4jAYmmwzWyHEWAVcU6SMY
 zMQDNO25cXO0K0Y/rdmepcZGQ5Q2IyKFclIaOCn5qSwR7LIRUyUx+vPVpTWNSWpZo3UMiLbwniA
 4Sla/GwrMTSSttaJ+W1WXyLPG59nWtUXjDQsJJ5PKqkeX5RW/4W9kdR8ZSVPrc5KKThLHYqBe5e
 GaYeZ4zs
X-Proofpoint-GUID: tpp04zC-y65SQ_WLND2rONOifHfAXzKW
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68d18aaf cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=rTF-Ql69s_4GWFK6w8YA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tpp04zC-y65SQ_WLND2rONOifHfAXzKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032

On Mon, Sep 22, 2025 at 9:46=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Mon, Sep 22, 2025 at 09:41:07AM -0700, Rob Clark wrote:
> > On Mon, Sep 22, 2025 at 9:33=E2=80=AFAM Stephan Gerhold
> > <stephan.gerhold@linaro.org> wrote:
> > > On Wed, Jul 23, 2025 at 12:08:49PM -0700, Rob Clark wrote:
> > > > If we hit an error path in GEM obj creation before msm_gem_new_hand=
le()
> > > > updates obj->resv to point to the gpuvm resv object, then obj->resv
> > > > still points to &obj->_resv.  In this case we don't want to decreme=
nt
> > > > the refcount of the object being freed (since the refcnt is already
> > > > zero).  This fixes the following splat:
> > > >
> > > >    ------------[ cut here ]------------
> > > >    refcount_t: underflow; use-after-free.
> > > >    WARNING: CPU: 9 PID: 7013 at lib/refcount.c:28 refcount_warn_sat=
urate+0xf4/0x148
> > > >    Modules linked in: uinput snd_seq_dummy snd_hrtimer aes_ce_ccm s=
nd_soc_wsa884x regmap_sdw q6prm_clocks q6apm_lpass_da>
> > > >     qcom_pil_info i2c_hid drm_kms_helper qcom_common qcom_q6v5 phy_=
snps_eusb2 qcom_geni_serial drm qcom_sysmon pinctrl_s>
> > > >    CPU: 9 UID: 1000 PID: 7013 Comm: deqp-vk Not tainted 6.16.0-rc4-=
debug+ #25 PREEMPT(voluntary)
> > > >    Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN53WW 08/02/2024
> > > >    pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--=
)
> > > >    pc : refcount_warn_saturate+0xf4/0x148
> > > >    lr : refcount_warn_saturate+0xf4/0x148
> > > >    sp : ffff8000a2073920
> > > >    x29: ffff8000a2073920 x28: 0000000000000010 x27: 000000000000001=
0
> > > >    x26: 0000000000000042 x25: ffff000810e09800 x24: 000000000000001=
0
> > > >    x23: ffff8000a2073b94 x22: ffff000ddb22de00 x21: ffff000ddb22dc0=
0
> > > >    x20: ffff000ddb22ddf8 x19: ffff0008024934e0 x18: 000000000000000=
a
> > > >    x17: 0000000000000000 x16: ffff9f8c67d77340 x15: 000000000000000=
0
> > > >    x14: 00000000ffffffff x13: 2e656572662d7265 x12: 7466612d6573752=
0
> > > >    x11: 3b776f6c66726564 x10: 00000000ffff7fff x9 : ffff9f8c67506c7=
0
> > > >    x8 : ffff9f8c69fa26f0 x7 : 00000000000bffe8 x6 : c0000000ffff7ff=
f
> > > >    x5 : ffff000f53e14548 x4 : ffff6082ea2b2000 x3 : ffff0008b86ab08=
0
> > > >    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008b86ab08=
0
> > > >    Call trace:
> > > >     refcount_warn_saturate+0xf4/0x148 (P)
> > > >     msm_gem_free_object+0x248/0x260 [msm]
> > > >     drm_gem_object_free+0x24/0x40 [drm]
> > > >     msm_gem_new+0x1c4/0x1e0 [msm]
> > > >     msm_gem_new_handle+0x3c/0x1a0 [msm]
> > > >     msm_ioctl_gem_new+0x38/0x70 [msm]
> > > >     drm_ioctl_kernel+0xc8/0x138 [drm]
> > > >     drm_ioctl+0x2c8/0x618 [drm]
> > > >     __arm64_sys_ioctl+0xac/0x108
> > > >     invoke_syscall.constprop.0+0x64/0xe8
> > > >     el0_svc_common.constprop.0+0x40/0xe8
> > > >     do_el0_svc+0x24/0x38
> > > >     el0_svc+0x54/0x1d8
> > > >     el0t_64_sync_handler+0x10c/0x138
> > > >     el0t_64_sync+0x19c/0x1a0
> > > >    irq event stamp: 3698694
> > > >    hardirqs last  enabled at (3698693): [<ffff9f8c675021dc>] __up_c=
onsole_sem+0x74/0x90
> > > >    hardirqs last disabled at (3698694): [<ffff9f8c68ce8164>] el1_db=
g+0x24/0x90
> > > >    softirqs last  enabled at (3697578): [<ffff9f8c6744ec5c>] handle=
_softirqs+0x454/0x4b0
> > > >    softirqs last disabled at (3697567): [<ffff9f8c67360244>] __do_s=
oftirq+0x1c/0x28
> > > >    ---[ end trace 0000000000000000 ]---
> > > >
> > > > Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
> > > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_gem.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/ms=
m_gem.c
> > > > index 33d3354c6102..958bac4e2768 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > > > @@ -1114,10 +1114,12 @@ static void msm_gem_free_object(struct drm_=
gem_object *obj)
> > > >               put_pages(obj);
> > > >       }
> > > >
> > > > -     if (msm_obj->flags & MSM_BO_NO_SHARE) {
> > > > +     if (obj->resv !=3D &obj->_resv) {
> > > >               struct drm_gem_object *r_obj =3D
> > > >                       container_of(obj->resv, struct drm_gem_object=
, _resv);
> > > >
> > > > +             WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> > > > +
> > > >               /* Drop reference we hold to shared resv obj: */
> > > >               drm_gem_object_put(r_obj);
> > > >       }
> > >
> > > This patch seems to break something for direct IRIS/video playback us=
ing
> > > dmabuf. I use a simple GStreamer test pipeline for testing IRIS on X1=
E
> > > (on GNOME, in case that matters):
> > >
> > >  $ gst-launch-1.0 filesrc location=3Dbbb_sunflower_2160p_60fps_normal=
.mp4 \
> > >    ! qtdemux name=3Dd d.video_0 ! h264parse ! v4l2h264dec \
> > >    ! capture-io-mode=3Ddmabuf ! waylandsink
> > >
> > > The video plays fine, but if I try to exit (CTRL+C) the display hangs
> > > for a few seconds and then the console is spammed with pretty much
> > > exactly the messages that you tried to fix here. If I revert this pat=
ch,
> > > everything is fine again. It feels like your patch does exactly the
> > > opposite for this use case. :-)
> > >
> > > It seems to run into the WARN_ON you added.
> >
> > Hmm, are we allocating from drm and importing into v4l2, or the other d=
irection?
> >
>
> Is there an easy way to check?

Maybe strace?  But, I think this would help, at least if v4l2 is allocating=
:

- if (obj->resv !=3D &obj->_resv) {
+ if ((msm_obj->flags & MSM_BO_NO_SHARE) && (obj->resv !=3D &obj->_resv)) {

(sorry about gmail mangling the formatting)

BR,
-R

>
> I would need to study the code to be sure, you probably know more about
> this than I do. I just run this command and it always worked so far
> somehow. :-)
>
> Thanks,
> Stephan

