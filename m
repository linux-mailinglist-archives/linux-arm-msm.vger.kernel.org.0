Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2DB56E8AEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 09:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbjDTHI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 03:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233929AbjDTHIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 03:08:55 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85153AF
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:08:54 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id dm2so4087038ejc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681974533; x=1684566533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvojUsR5pwErXxzLqJHjlEXoz6gI0576CmK0oCJxdpc=;
        b=EAo2Ow3XS1RZ8Q6tdvY+KMv4wd4ak0f8BPocMInIOOFHNFIvuNFzOPCuf90+iwfEgQ
         ZHspYHA6cUYNt5Wgy8/DALjenpgaoNsZVVnOeFM4wbnG+KcFyqLnPb4Rhq/O0yweYnl7
         CYMo+WGq2i8VlcfntymZq6LjZZfDAUQbqMNQcVueagYpplsjB/G9itlTHLHsRArA2mzy
         Y7cpIE39ZVutrHQ/bwm3Ya6cScf537u6tSqFC7ssXf6QLH2GRKojshXPUAMFzyF2fG8H
         FwVgOBTnypFAHXr2yXHmpJz+FOoQQeqpZWXF6PzlTiIoWGkYu8toSbCAON6nc2xY+5xS
         5uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681974533; x=1684566533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvojUsR5pwErXxzLqJHjlEXoz6gI0576CmK0oCJxdpc=;
        b=QCJT5u1IWPOj4S0S220SDO15Tjz38IUcStn0vG6XyJgVgfOVmW2pnLCPmy/R09vUBK
         LHuXKmoCxBhBYN62HqaN+VlHkbr9khmsWF4RfRe77jYUv3O7chFBnyqg/OvCDBEJI00q
         h5qDcl7iQJH13hKbL5y5nluVa1RxJv5UC057Qm2IYCT4Z5h9RECnN15j1Cs8XQedKlNa
         JUVp1DwgpgpVxaRpdg531CuEeFqC3WL3EaeCFM21nDy06OMdcp2wRusZs2OUDYpDHiXa
         4euH4LmEeBTuG3bU+AwMd84vP87V1dCUGYuIq3EZ4TDZ/tXHHzMvpdwQfHUsYgYPyFv/
         yCoA==
X-Gm-Message-State: AAQBX9d2cuxFOcz1VuieAABnPWNibI4zOXHfO5Kopbult2UOieaVbKvN
        QJLMWjuMK/OGAJLJkkSHaHUEBwjHRQoeT2YrJ4SX
X-Google-Smtp-Source: AKy350YkIRiL6/g0txyPQcEysULNj8gjrNyWWXcoEDSMWOaKX/YTC+6vqefm8B56QsKbeEQmmG9BwMkojEpTRumRSyg=
X-Received: by 2002:a17:907:980a:b0:94f:c1f:6d09 with SMTP id
 ji10-20020a170907980a00b0094f0c1f6d09mr214789ejc.7.1681974533034; Thu, 20 Apr
 2023 00:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-11-d1bac46db075@freebox.fr> <08e79278-ad30-73e3-a56c-f569b3fea407@linaro.org>
In-Reply-To: <08e79278-ad30-73e3-a56c-f569b3fea407@linaro.org>
From:   Arnaud Vrac <avrac@freebox.fr>
Date:   Thu, 20 Apr 2023 09:08:42 +0200
Message-ID: <CAG9NU68AqX3P1MrrLvfSKMyw+OsfZ7tyk9F9zU7qvA-QzzqO5g@mail.gmail.com>
Subject: Re: [PATCH 11/11] drm/msm/dpu: do not use mixer that supports dspp
 when not required
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le jeu. 20 avr. 2023 =C3=A0 01:18, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> a =C3=A9crit :
>
> On 19/04/2023 17:41, Arnaud Vrac wrote:
> > This avoids using lm blocks that support DSPP when not needed, to
> > keep those resources available.
>
> This will break some of the platforms. Consider qcm2290 which has a
> single LM with DSPP. So, _dpu_rm_check_lm_and_get_connected_blks should
> be performed in two steps: first skip non-DSPP-enabled LMs when DSPP is
> not required. Then, if the LM (pair) is not found, look for any suitable
> LM(pair).

Good point, I'll add the change.

>
> >
> > Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_rm.c
> > index f4dda88a73f7d..4b393d46c743f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -362,7 +362,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks=
(struct dpu_rm *rm,
> >       *pp_idx =3D idx;
> >
> >       if (!reqs->topology.num_dspp)
> > -             return true;
> > +             return !lm_cfg->dspp;
> >
> >       idx =3D lm_cfg->dspp - DSPP_0;
> >       if (idx < 0 || idx >=3D ARRAY_SIZE(rm->dspp_blks)) {
> >
>
> --
> With best wishes
> Dmitry
>
