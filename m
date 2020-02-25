Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 436A716EF17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 20:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731226AbgBYTdw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 14:33:52 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41972 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730080AbgBYTdv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 14:33:51 -0500
Received: by mail-pl1-f194.google.com with SMTP id t14so201797plr.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2020 11:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=qjq1rYwYZyqa6T9kkCXqj08Gw/H8i3ujajvWEUPawsQ=;
        b=cDqMkNUQ3xXixDRuNzXC11g87RUP7M21eCuL3NDnulLtrqaf0UvLy72WC6qx6PIPKI
         c0Ttar9R/Duu8SU6Q4PEw9ThOWPyP9C35hO0TGX+m1ypebrg9t8d/tktBjrhsD+cz7U7
         0JcYj4pYk1d3S+NsCgSgbxXkwBpkZ8Zoa0bn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=qjq1rYwYZyqa6T9kkCXqj08Gw/H8i3ujajvWEUPawsQ=;
        b=jNDeqFTw0tJdGDLgot68Js3BATdHpOpo9u6diQjMy1GJEJUh5JQiVt2FF98gTEJast
         XBTrrPbMe8tZm9lp9I3xHFnoY4Nx6pk63CEQNKIS/v+zQUxPbIo2ZxiAlddt3VQ3iqOQ
         5FBVNQWbJuU3x+ENTZ4RELehIFZThY2uTmjM0uANH8gcBoZ1yF+ZhCrTOOSmByzcZA2m
         0YDMIWoWntnzjqhtV34udH+sV9Qk7OIMa20C5psOS2ute7dJ8/MsYsMKawWrE9FG1hA4
         A3ABuTB6ONVbwlVZgYh0spZSjPBShcuIbimItkRGe9oL0CnnTOsPToi9TYNKJL0NboMj
         UlZA==
X-Gm-Message-State: APjAAAX6MVOfKieGMz1j/hk812VLx58mKipPBUfN4GJdAWIxrEDRXJL7
        6H2+7STts/+44iM7tbNDNiEadg==
X-Google-Smtp-Source: APXvYqxDKHrP7qTiMvkalQZ2YXorUCJY2C2zjXz3x09A/XTU8PzAM54XPoxry11GFtz5Eb8PKERJtw==
X-Received: by 2002:a17:902:b110:: with SMTP id q16mr46290plr.289.1582659231027;
        Tue, 25 Feb 2020 11:33:51 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z4sm17320690pfn.42.2020.02.25.11.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 11:33:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200219104148.2.I2c848e8f8ab1bcd4042d8ebcf35de737cceec5fe@changeid>
References: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid> <20200219104148.2.I2c848e8f8ab1bcd4042d8ebcf35de737cceec5fe@changeid>
Subject: Re: [PATCH 2/4] drm/msm/dpu: Refactor rm iterator
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Drew Davenport <ddavenport@chromium.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Fritz Koenig <frkoenig@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Shubhashree Dhar <dhar@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhengbin <zhengbin13@huawei.com>
To:     Drew Davenport <ddavenport@chromium.org>,
        dri-devel@lists.freedesktop.org
Date:   Tue, 25 Feb 2020 11:33:49 -0800
Message-ID: <158265922943.177367.14293328114795800228@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Drew Davenport (2020-02-19 09:42:25)
> Make iterator implementation private, and add function to
> query resources assigned to an encoder.
>=20
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_encoder.c
> index f8ac3bf60fd60..6cadeff456f09 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -957,11 +957,11 @@ static void dpu_encoder_virt_mode_set(struct drm_en=
coder *drm_enc,
>         struct drm_connector *conn =3D NULL, *conn_iter;
>         struct drm_crtc *drm_crtc;
>         struct dpu_crtc_state *cstate;
> -       struct dpu_rm_hw_iter hw_iter;
>         struct msm_display_topology topology;
> -       struct dpu_hw_ctl *hw_ctl[MAX_CHANNELS_PER_ENC] =3D { NULL };
> -       struct dpu_hw_mixer *hw_lm[MAX_CHANNELS_PER_ENC] =3D { NULL };
> -       int num_lm =3D 0, num_ctl =3D 0;
> +       struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> +       struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> +       struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> +       int num_lm, num_ctl, num_pp;

All these should be unsigned too?

>         int i, j, ret;
> =20
>         if (!drm_enc) {
> @@ -1005,42 +1005,31 @@ static void dpu_encoder_virt_mode_set(struct drm_=
encoder *drm_enc,
>                 return;
>         }
> =20
> -       dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id, DPU_HW_BLK_PINGPO=
NG);
> -       for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++) {
> -               dpu_enc->hw_pp[i] =3D NULL;
> -               if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
> -                       break;
> -               dpu_enc->hw_pp[i] =3D (struct dpu_hw_pingpong *) hw_iter.=
hw;
> -       }
> -
> -       dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id, DPU_HW_BLK_CTL);
> -       for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++) {
> -               if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
> -                       break;
> -               hw_ctl[i] =3D (struct dpu_hw_ctl *)hw_iter.hw;

Why cast? Isn't it void pointer?

> -               num_ctl++;
> -       }
> +       num_pp =3D dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->b=
ase.id,
> +               DPU_HW_BLK_PINGPONG, hw_pp, ARRAY_SIZE(hw_pp));
> +       num_ctl =3D dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->=
base.id,
> +               DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> +       num_lm =3D dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->b=
ase.id,
> +               DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> =20
> -       dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id, DPU_HW_BLK_LM);
> -       for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++) {
> -               if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
> -                       break;
> -               hw_lm[i] =3D (struct dpu_hw_mixer *)hw_iter.hw;

Why cast?

> -               num_lm++;
> -       }
> +       for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++)
> +               dpu_enc->hw_pp[i] =3D i < num_pp ? to_dpu_hw_pingpong(hw_=
pp[i])
> +                                               : NULL;

This line is pretty hard to read. Maybe use an if/else?

> =20
>         cstate =3D to_dpu_crtc_state(drm_crtc->state);
> =20
>         for (i =3D 0; i < num_lm; i++) {
>                 int ctl_idx =3D (i < num_ctl) ? i : (num_ctl-1);
> =20
> -               cstate->mixers[i].hw_lm =3D hw_lm[i];
> -               cstate->mixers[i].lm_ctl =3D hw_ctl[ctl_idx];
> +               cstate->mixers[i].hw_lm =3D to_dpu_hw_mixer(hw_lm[i]);
> +               cstate->mixers[i].lm_ctl =3D to_dpu_hw_ctl(hw_ctl[ctl_idx=
]);
>         }
> =20
>         cstate->num_mixers =3D num_lm;
> =20
>         for (i =3D 0; i < dpu_enc->num_phys_encs; i++) {
> +               int num_blk;

unsigned int?

> +               struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
>                 struct dpu_encoder_phys *phys =3D dpu_enc->phys_encs[i];
> =20
>                 if (!dpu_enc->hw_pp[i]) {
> @@ -1056,17 +1045,15 @@ static void dpu_encoder_virt_mode_set(struct drm_=
encoder *drm_enc,
>                 }
> =20
>                 phys->hw_pp =3D dpu_enc->hw_pp[i];
> -               phys->hw_ctl =3D hw_ctl[i];
> +               phys->hw_ctl =3D to_dpu_hw_ctl(hw_ctl[i]);
> =20
> -               dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id,
> -                                   DPU_HW_BLK_INTF);
> -               for (j =3D 0; j < MAX_CHANNELS_PER_ENC; j++) {
> +               num_blk =3D dpu_rm_get_assigned_resources(&dpu_kms->rm,
> +                       drm_enc->base.id, DPU_HW_BLK_INTF, hw_blk,
> +                       ARRAY_SIZE(hw_blk));
> +               for (j =3D 0; j < num_blk; j++) {
>                         struct dpu_hw_intf *hw_intf;
> =20
> -                       if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
> -                               break;
> -
> -                       hw_intf =3D (struct dpu_hw_intf *)hw_iter.hw;
> +                       hw_intf =3D to_dpu_hw_intf(hw_blk[i]);
>                         if (hw_intf->idx =3D=3D phys->intf_idx)
>                                 phys->hw_intf =3D hw_intf;
>                 }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm=
/disp/dpu1/dpu_rm.c
> index dea1dba441fe7..779df26dc81ae 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -83,7 +97,7 @@ static bool _dpu_rm_get_hw_locked(struct dpu_rm *rm, st=
ruct dpu_rm_hw_iter *i)
>         return false;
>  }
> =20
> -bool dpu_rm_get_hw(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
> +static bool dpu_rm_get_hw(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
>  {
>         bool ret;
> =20
> @@ -635,3 +649,16 @@ int dpu_rm_reserve(
> =20
>         return ret;
>  }
> +
> +int dpu_rm_get_assigned_resources(struct dpu_rm *rm, uint32_t enc_id,

Return unsigned int?

> +       enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_siz=
e)

unsigned int blks_size?

> +{
> +       struct dpu_rm_hw_iter hw_iter;
> +       int num_blks =3D 0;

unsigned int?

> +
> +       dpu_rm_init_hw_iter(&hw_iter, enc_id, type);
> +       while (num_blks < blks_size && dpu_rm_get_hw(rm, &hw_iter))
> +               blks[num_blks++] =3D hw_iter.blk->hw;
> +
> +       return num_blks;

It's not possible for it to be negative number right?

> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm=
/disp/dpu1/dpu_rm.h
> index 9c580a0170946..982b91e272275 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -24,26 +24,6 @@ struct dpu_rm {
>         struct mutex rm_lock;
>  };
> =20
> -/**
> - *  struct dpu_rm_hw_blk - resource manager internal structure
> - *     forward declaration for single iterator definition without void p=
ointer
> - */
> -struct dpu_rm_hw_blk;
> -
> -/**
> - * struct dpu_rm_hw_iter - iterator for use with dpu_rm
> - * @hw: dpu_hw object requested, or NULL on failure
> - * @blk: dpu_rm internal block representation. Clients ignore. Used as i=
terator.
> - * @enc_id: DRM ID of Encoder client wishes to search for, or 0 for Any =
Encoder

Why is Encoder and Any capitalized?

> - * @type: Hardware Block Type client wishes to search for.
> - */
> -struct dpu_rm_hw_iter {
> -       void *hw;
> -       struct dpu_rm_hw_blk *blk;
> -       uint32_t enc_id;
> -       enum dpu_hw_blk_type type;
> -};
> -
>  /**
>   * dpu_rm_init - Read hardware catalog and create reservation tracking o=
bjects
>   *     for all HW blocks.
> @@ -93,28 +73,9 @@ int dpu_rm_reserve(struct dpu_rm *rm,
>  void dpu_rm_release(struct dpu_rm *rm, struct drm_encoder *enc);
> =20
>  /**
> - * dpu_rm_init_hw_iter - setup given iterator for new iteration over hw =
list
> - *     using dpu_rm_get_hw
> - * @iter: iter object to initialize
> - * @enc_id: DRM ID of Encoder client wishes to search for, or 0 for Any =
Encoder
> - * @type: Hardware Block Type client wishes to search for.

Ah I guess it's copied from here.
