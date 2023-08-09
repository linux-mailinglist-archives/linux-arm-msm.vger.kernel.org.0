Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21DC477603F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 15:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbjHINLm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 09:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbjHINLl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 09:11:41 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35E810FB;
        Wed,  9 Aug 2023 06:11:40 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3a36b52b4a4so587378b6e.1;
        Wed, 09 Aug 2023 06:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691586700; x=1692191500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bsfHSbir+1N3BPwsEF83+v9jo06cZjJVauWxQE2x88=;
        b=X39VyQ81ASYk/nBdQF2k0zkOJr/0vtM4ZpjXBKvnXgqH0R4bVOzYwN862VOzrR+xcj
         x3FpupRMsRy7LDq7LpyqF25wC6tbW75E04I9YjPO14TSPjRX6C5prULvlJsGvEEptNVm
         +KaJ1dgo9yDYvvU9xgG4hPh/jBo2jN+cWTaB9vM2sw0taGzXVXkI09vm9gjv3YdsbQfq
         fVPylz6eN+KR5L6QcKAbs2scRSlOmKkbZMpF9eiAuRUCeeiue3+fNiq6cua13K7CE3MR
         iwhCAiADw5MAtzoz2nRqhIRpteROYyPsV+/Zu+9qMzuIk9n/JNtv02kFrJu5jM+1rnUx
         ohVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691586700; x=1692191500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bsfHSbir+1N3BPwsEF83+v9jo06cZjJVauWxQE2x88=;
        b=OWRkcqykIuEfSO7ul/S3lcp7vSK6unliTaSElOULR/T9XE1KOfPW8lghJ4vv9sG5Vz
         i7gDThpBT2elOtbVuxZbf5+8RmbPR+BVuFAzqrYVQGmfImVr6uK+miHW/sFQMeWs9Zb9
         NpGvbqQv/EdBKatErDq3HJHBqWNyGUj9ukyufNjIrjbbP4/uEBkQQlJShXsiDZWGIuG+
         l2Bf5ZSpMxjtLI3JAwPU0uSdw4ERzC0Z6thgvjoybeW82H6ugfgyLkor0EShJf1tP6Px
         uewNJbz6d7jlu6llurl6AoljqTZ87e2PgTUBzOe+Y15RjVcM6TdFR8UvQeAvDWzw5h9M
         QX1w==
X-Gm-Message-State: AOJu0YwXPFIXVBGB5KBGcbm8q6qMX/zbHuLYuwZTNb9DvtMFN3ZClJi2
        lPZWX9/dAaEIQ1yf/raUburbVFyjCPQGSav6VhE=
X-Google-Smtp-Source: AGHT+IGr/N7x0qp/tLHJD9vnx3F+mQLn8Qo3mYlXKDAIof/DZHtBXv2c6gcV9z6BHmLltXrWKyQrwzMGuJze0KPjlPM=
X-Received: by 2002:aca:bb0b:0:b0:3a7:46c4:e8cd with SMTP id
 l11-20020acabb0b000000b003a746c4e8cdmr8330814oif.12.1691586700314; Wed, 09
 Aug 2023 06:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
 <20230809034445.434902-2-ruanjinjie@huawei.com> <c2b0d96e-b768-b295-c672-3ae52e14b10b@amd.com>
In-Reply-To: <c2b0d96e-b768-b295-c672-3ae52e14b10b@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 9 Aug 2023 09:11:29 -0400
Message-ID: <CADnq5_MZXYBmxr3dJn4vmW2qAbzUDM0eL48anjCot77LinE8tg@mail.gmail.com>
Subject: Re: [PATCH -next 1/7] drm/amdkfd: Remove unnecessary NULL values
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Ruan Jinjie <ruanjinjie@huawei.com>, Felix.Kuehling@amd.com,
        alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
        Rodrigo.Siqueira@amd.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, bskeggs@redhat.com,
        kherbst@redhat.com, lyude@redhat.com, kraxel@redhat.com,
        gurchetansingh@chromium.org, olvaffe@gmail.com,
        paulo.miguel.almeida.rodenas@gmail.com, wenjing.liu@amd.com,
        haoping.liu@amd.com, Charlene.Liu@amd.com, chiahsuan.chung@amd.com,
        george.shen@amd.com, sancchen@amd.com, tony.tascioglu@amd.com,
        jaehyun.chung@amd.com, tales.aparecida@gmail.com, drv@mailo.com,
        aurabindo.pillai@amd.com, quic_vpolimer@quicinc.com,
        jiasheng@iscas.ac.cn, noralf@tronnes.org,
        jose.exposito89@gmail.com, javierm@redhat.com,
        mairacanal@riseup.net, davidgow@google.com,
        arthurgrillo@riseup.net, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Applied.  Thanks!

On Wed, Aug 9, 2023 at 2:15=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 09.08.23 um 05:44 schrieb Ruan Jinjie:
> > The NULL initialization of the pointers assigned by kzalloc() first is
> > not necessary, because if the kzalloc() failed, the pointers will be
> > assigned NULL, otherwise it works as usual. so remove it.
> >
> > Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for this one=
,
> the amd display code and the radeon stuff.
>
> Thanks,
> Christian.
>
> > ---
> >   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c b/drivers/gpu=
/drm/amd/amdkfd/kfd_mqd_manager.c
> > index 863cf060af48..d01bb57733b3 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
> > @@ -48,7 +48,7 @@ int pipe_priority_map[] =3D {
> >
> >   struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_node *dev, struct que=
ue_properties *q)
> >   {
> > -     struct kfd_mem_obj *mqd_mem_obj =3D NULL;
> > +     struct kfd_mem_obj *mqd_mem_obj;
> >
> >       mqd_mem_obj =3D kzalloc(sizeof(struct kfd_mem_obj), GFP_KERNEL);
> >       if (!mqd_mem_obj)
> > @@ -64,7 +64,7 @@ struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_node =
*dev, struct queue_properti
> >   struct kfd_mem_obj *allocate_sdma_mqd(struct kfd_node *dev,
> >                                       struct queue_properties *q)
> >   {
> > -     struct kfd_mem_obj *mqd_mem_obj =3D NULL;
> > +     struct kfd_mem_obj *mqd_mem_obj;
> >       uint64_t offset;
> >
> >       mqd_mem_obj =3D kzalloc(sizeof(struct kfd_mem_obj), GFP_KERNEL);
>
