Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBAB17BE865
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbjJIRka (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbjJIRk3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:40:29 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B9CAF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:40:28 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-533f193fc8dso8420617a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696873226; x=1697478026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0Hg74zU6ESH8XSh7ezPeKEnzmx/gMQe+/lsq3fFNmM=;
        b=OZ2qBJTIcTv8zryK3leWRiSTOZxW4hQTglqrFGV1qCwT6qbS1kSSv6VW77hR7yBdqc
         +CANlwg6LG7PgUVcsu9KCLtmGL8xFAuuZNvgfTH/0aUHcWGGIkKiZ3Adla9D0Aw+YFz9
         9y07O04SlZNyXdBNW50jm4oAY3aMSYTKbBxSGEBxm7ItTyPmxpcKsA9SxzT1kzZpN7kC
         +EAdylVYvxre/OehQDpSlH9A3KoLYqUTG35KwKznpXM+IbQJXeCcA2Ram21doa3fFUbz
         i96BtEjrl7jKaC5DG3iaLz3/bGXQVmkwQgB6aEzbpHwLrmMC6TKPfSLiPu6FpQr/Skka
         gTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696873226; x=1697478026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W0Hg74zU6ESH8XSh7ezPeKEnzmx/gMQe+/lsq3fFNmM=;
        b=FXDtqYDexzhC6BTppZQRiXBs6JGqRc1bAiKX8f4oRFG8Vtg5Nx5KRud8ijQyA1VYC0
         p/I787mU3VrqVaiYxM2d/nw7rDCTblOFj5UZZcV66roF1X2PvfEcd2Fgq+DE/D82Wwta
         bVf6oOOfvKq1ZkaR+S4kmc6H+o8Rs0C+CEpiig0dspyZZNx2cbE9uhqxSULUYVPAKqAs
         FFcnxWNpzgILs7b8Cxt6GVVpT5deJLrsEYOHHwcfG/1ycFhyiPBR73waSQ5jFFpiLH+T
         EwYCM1IT3UBwJb5rQGAFR7Zzqcpx6SOtyxrOSlnWTBgzAVMFWML2xqR9zsoKzWix2D+K
         VlQw==
X-Gm-Message-State: AOJu0YwWK65UDbnj1kYlcEOz23f9UuqEJgfZZEDbxy/vPOtG82G3q9AT
        1/csRt+SfirHHmqNDouarJagjiv3FOwpmh+hCqvkUuHb
X-Google-Smtp-Source: AGHT+IEsjuGbN899zDjU9g+Ja6nOILX/d8R6MyZMLqwXE7TZqyeBrzEE089Layp1ZBdFnj1gZy4x69oWN2wfKnmsCPo=
X-Received: by 2002:aa7:d1d7:0:b0:52f:a42a:85a3 with SMTP id
 g23-20020aa7d1d7000000b0052fa42a85a3mr13979430edp.0.1696873226254; Mon, 09
 Oct 2023 10:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 9 Oct 2023 10:40:13 -0700
Message-ID: <CAF6AEGs-Ar0+gRrsEg_LuAXmsAhFg7MKZ=kLpQ=jZKTfdXBtOQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] drm/msm: move KMS code from msm_drv.c
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

On Sun, Jul 2, 2023 at 5:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Currently both msm_drm_init() and msm_drm_uninit() functions are trying
> to handle both normal and headless Adreno cases. This results in a
> suboptimal code, since headless case still gets modesetting and atomic
> interfaces enabled. Two mentioned functions are a spaghetti of
> `if (priv->kms)' conditional code.
>
> Move all KMS-related code (not limiting the init / teardown path) from
> msm_drv.c to msm_kms.c, making it more self-contained. This also
> disables ATOMIC and MODESET features for the headless case.
>
> Dependencies: [1]
> [1] https://patchwork.freedesktop.org/series/105392/
>
> Dmitry Baryshkov (13):
>   drm/msm/dsi: switch to devm_drm_bridge_add()
>   drm/msm/hdmi: switch to devm_drm_bridge_add()
>   drm/msm/dp: move pdev from struct dp_display_private to struct msm_dp
>   drm/msm/dp: switch to devm_drm_bridge_add()
>   drm/msm: remove msm_drm_private::bridges field
>   drm/msm: drop pm ops from the headless msm driver
>   drm/msm: rename msm_pm_prepare/complete to note the KMS nature
>   drm/msm: remove shutdown callback from msm_platform_driver
>   drm/msm: rename msm_drv_shutdown() to msm_kms_shutdown()
>   drm/msm: switch to drmm_mode_config_init()
>   drm/msm: only register 'kms' debug file if KMS is used
>   drm/msm: make fb debugfs file available only in KMS case
>   drm/msm: carve out KMS code from msm_drv.c

Reviewed-by: Rob Clark <robdclark@gmail.com>

>
>  drivers/gpu/drm/msm/Makefile             |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |   6 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |   6 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |   6 +-
>  drivers/gpu/drm/msm/dp/dp_display.c      |  34 +--
>  drivers/gpu/drm/msm/dp/dp_display.h      |   1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c          |  21 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h          |   2 +-
>  drivers/gpu/drm/msm/dsi/dsi.c            |  28 +-
>  drivers/gpu/drm/msm/dsi/dsi.h            |   3 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c    |  30 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.c          |  22 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.h          |   5 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c   |  30 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_hpd.c      |   3 +-
>  drivers/gpu/drm/msm/msm_debugfs.c        |  12 +-
>  drivers/gpu/drm/msm/msm_drv.c            | 363 ++---------------------
>  drivers/gpu/drm/msm/msm_drv.h            |   9 +-
>  drivers/gpu/drm/msm/msm_kms.c            | 345 +++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_kms.h            |   3 +
>  20 files changed, 452 insertions(+), 478 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/msm_kms.c
>
> --
> 2.39.2
>
