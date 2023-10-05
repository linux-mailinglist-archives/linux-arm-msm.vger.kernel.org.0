Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1EE17BAEF5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 00:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbjJEWtv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Oct 2023 18:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjJEWtv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Oct 2023 18:49:51 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E69CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Oct 2023 15:49:45 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-532c81b9adbso2690470a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Oct 2023 15:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696546183; x=1697150983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruHF2qY6fIMsnHXSXu/O5UBGCOEh6ZYhOkBWuKb5maU=;
        b=gPArKHX4H0i621D7XhZaVbZlAs3auE7T10PlNB7v1yKaXPm1YioaF+d1Rqsv9yA5Kh
         5TiY9aGGsYeRlQE3DpwEd+HraKbwpGCs+0ThDDm99p2ks1ABxnnK4HDJf+2uqT5Xwb27
         x+Vb5CPO3KGyjmVCJltxdAoLfdfSMor9aB2giN6VgnxIJOfh4/+t1ub3cbiEbCtvSQfx
         3dn+ZuYPrgHzL9/40EyouxfZQ/dgreBSBS6IgDPXpgESaKVz5WVHkCSA4DOsPRbHTiqP
         dRclu5hxI1VWsgrk73dsvYQ1ZoXbKjv3PK8va2u6yBBanqEL8LeQxPUFgT0bL8ZkMN/S
         PxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696546183; x=1697150983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruHF2qY6fIMsnHXSXu/O5UBGCOEh6ZYhOkBWuKb5maU=;
        b=svBOivk13xvwT2cjSd0woIbHOPFXxGDW3Vl0AR66pqWIFLXT8G93K8RS7T1XhTDLgH
         uFgB/KEVhyf7GeE5ZM6TX63fPTHB65+1jwh1uqY0gnmpsbdVvyHIAr4sUwDx90hARYRr
         kydF5EMoypW1uA68XjY4q8/8cpC3OADt1mjf27kRf8qIEAnXjdGdgspHbs2DV+FFfhHu
         LfXg55zmL2DNACoo3ugNO4YlZxeAu1W2WOvlzy96Qzmhug/vKCkLun6K52L4Dd3RlArU
         r8Fg46Ipk73VbHbegkL/zVQGlGXiyWSx6t3CdWbNEdjb0Nj1pc5yY4Xth19dw6CK2U4D
         iy0Q==
X-Gm-Message-State: AOJu0YxZK3O1dw0DCLYICxjYaQV6r0TMt6ZI2vg4n4GCt4KLQBsEZsvx
        dIKha7rWxa/gObclT1FjLDvguXG1cfEksK/yA1c=
X-Google-Smtp-Source: AGHT+IEaPo1RQwkwbado7ahDJti9JqEe1+NqsIklGIQLHN+kXVQ7cUg7odehdVdsbOarTJ1lMbCsCv9jOV+26I2ZaJw=
X-Received: by 2002:aa7:c991:0:b0:536:e5f7:b329 with SMTP id
 c17-20020aa7c991000000b00536e5f7b329mr6086237edt.33.1696546183113; Thu, 05
 Oct 2023 15:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230908030521.236309-1-dmitry.baryshkov@linaro.org> <20230908030521.236309-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230908030521.236309-2-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 5 Oct 2023 15:49:31 -0700
Message-ID: <CAF6AEGvThK5L-UTAsHwH1_xH5R0zNT+dL6DHvBQUYm3hq9uBdQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/atomic: add private obj state to state dump
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 7, 2023 at 8:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The drm_atomic_print_new_state() already prints private object state via
> drm_atomic_private_obj_print_state(). Add private object state dumping
> to __drm_state_dump(), so that it is also included into drm_state_dump()
> output and into debugfs/dri/N/state file.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/drm_atomic.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index c277b198fa3f..9543e284dc15 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1773,6 +1773,7 @@ static void __drm_state_dump(struct drm_device *dev=
, struct drm_printer *p,
>         struct drm_crtc *crtc;
>         struct drm_connector *connector;
>         struct drm_connector_list_iter conn_iter;
> +       struct drm_private_obj *obj;
>
>         if (!drm_drv_uses_atomic_modeset(dev))
>                 return;
> @@ -1801,6 +1802,14 @@ static void __drm_state_dump(struct drm_device *de=
v, struct drm_printer *p,
>         if (take_locks)
>                 drm_modeset_unlock(&dev->mode_config.connection_mutex);
>         drm_connector_list_iter_end(&conn_iter);
> +
> +       list_for_each_entry(obj, &config->privobj_list, head) {
> +               if (take_locks)
> +                       drm_modeset_lock(&obj->lock, NULL);
> +               drm_atomic_private_obj_print_state(p, obj->state);
> +               if (take_locks)
> +                       drm_modeset_unlock(&obj->lock);
> +       }
>  }
>
>  /**
> --
> 2.39.2
>
