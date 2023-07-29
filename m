Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA6F9768114
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 20:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjG2SpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 14:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjG2SpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 14:45:13 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D263710DE
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 11:45:11 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3a3c78ede4bso2503259b6e.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 11:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690656311; x=1691261111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SR2Co+TdYHY7DGkSsyyM3MvUTGDM8hnANAJOmhCpEt0=;
        b=kc1WJDXvZyBxdE0q8OpmdzDE0s1BozFTY2Q995FUty6Pg9R4yQKp0286KxgI5VoJE0
         XekQRL5evvUNsnTN+Prs2BcTQJirUH+DKTP8zjxpa9SIRyRnUiQ/k/yRKY9SKSgchIww
         kpDrDS2TPtyjeXj4m9Tda6J64gCMXVjNLArHjEo12pC+9DjgYThuoGtRQLjSGIdEYR4r
         Ml1Sa/Em4/IxYsNpBh7Iz6cNgf+4Jtz4eGYCRDuvLtREFxd1sNUm5NlaSlc643S1rwhe
         /xWGjYEi3YQBXH3dfIurCk9DbNHPaW7U4Ze4JCi+EtU0iKagyjKu5dVEUlGi/SykKV+8
         rGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690656311; x=1691261111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SR2Co+TdYHY7DGkSsyyM3MvUTGDM8hnANAJOmhCpEt0=;
        b=g8q5yUzzlMkjgbHIYvB7RoZtOvxHpYj22Gp1HSC/+XpiBhMYXI78W0AvfNRlDLDHNm
         5B9Q3S1MmfGwrppD5h8tqfeAta6DhHdSODKMKgQyY9+wWPmaq0CljvmrSR2Q6X6kduWs
         vjGIk5gaq8vmkVRfCOF+s0EloUX+nUxNXIvt/bd1pYmsUtdNatiYvSTwKdLbq3PXAhDY
         6KlahD7hOTkCWdJLglq7CndSUExXmngC6umAAphsHu9X2b3oTh01vUcwXn4Fnl/oQad7
         b015w3g7KNPZmctXWLCQSByQ2CaH5oXhvi+hsKUwWD6gkDxdl+J0aptNCnBXVxvp4S8N
         +u5w==
X-Gm-Message-State: ABy/qLawevKCPiP029zcXU9jEL9/r1xTK8vV3y87uF1qPX04tvZczzjD
        mB56mB1x2QD55BW4GbC0akEQ6Yos9arR4ZiO1/MU+A==
X-Google-Smtp-Source: APBJJlENqapiWQajD6lL1UOs0OcMIj10H1JvUIJSlzTep2XzVKXoxYh4RcoTIO/I3ObnW1OB7X7YWkp2yxpJ+53aBVg=
X-Received: by 2002:a05:6808:1381:b0:3a5:afdf:8ebb with SMTP id
 c1-20020a056808138100b003a5afdf8ebbmr7603138oiw.17.1690656311081; Sat, 29 Jul
 2023 11:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-4-dmitry.baryshkov@linaro.org> <wv556zme7i33pczp7aqln5xcljz4xuygmqkmcrw2jayrmu4tsh@ohrbffyirknb>
 <e421a9b0-5943-faff-ebde-dc94cce43e69@linaro.org> <kszqijb63rplnqczrw6xuzs5mci33w2qgn6c2ujxeag4x7ych3@7etvtti7ah4x>
In-Reply-To: <kszqijb63rplnqczrw6xuzs5mci33w2qgn6c2ujxeag4x7ych3@7etvtti7ah4x>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 29 Jul 2023 21:45:00 +0300
Message-ID: <CAA8EJpopdvoUy4hyhFyYJrq-kVtCKDaLupXTbAr_ePYRd87rog@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/msm/dpu: inline _setup_intf_ops()
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 29 Jul 2023 at 21:28, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-07-29 02:45:43, Dmitry Baryshkov wrote:
> > On 27/07/2023 23:10, Marijn Suijten wrote:
> > > On 2023-07-27 19:21:00, Dmitry Baryshkov wrote:
> > >> Inline the _setup_intf_ops() function, it makes it easier to handle
> > >> different conditions involving INTF configuration.
> > >>
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >
> > >> ---
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 47 +++++++++------------
> > >>   1 file changed, 21 insertions(+), 26 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > >> index 8ec6505d9e78..7ca772791a73 100644
> > >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > >> @@ -524,31 +524,6 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
> > >>    DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
> > >>   }
> > >>
> > >> -static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
> > >> -          unsigned long cap, const struct dpu_mdss_version *mdss_rev)
> > >> -{
> > >> -  ops->setup_timing_gen = dpu_hw_intf_setup_timing_engine;
> > >> -  ops->setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
> > >> -  ops->get_status = dpu_hw_intf_get_status;
> > >> -  ops->enable_timing = dpu_hw_intf_enable_timing_engine;
> > >> -  ops->get_line_count = dpu_hw_intf_get_line_count;
> > >> -  if (cap & BIT(DPU_INTF_INPUT_CTRL))
> > >> -          ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
> > >> -  ops->setup_misr = dpu_hw_intf_setup_misr;
> > >> -  ops->collect_misr = dpu_hw_intf_collect_misr;
> > >> -
> > >> -  if (cap & BIT(DPU_INTF_TE)) {
> > >> -          ops->enable_tearcheck = dpu_hw_intf_enable_te;
> > >> -          ops->disable_tearcheck = dpu_hw_intf_disable_te;
> > >> -          ops->connect_external_te = dpu_hw_intf_connect_external_te;
> > >> -          ops->vsync_sel = dpu_hw_intf_vsync_sel;
> > >> -          ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
> > >> -  }
> > >> -
> > >> -  if (mdss_rev->core_major_ver >= 7)
> > >> -          ops->program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
> > >> -}
> > >> -
> > >>   struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
> > >>            void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
> > >>   {
> > >> @@ -571,7 +546,27 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
> > >>     */
> > >>    c->idx = cfg->id;
> > >>    c->cap = cfg;
> > >> -  _setup_intf_ops(&c->ops, c->cap->features, mdss_rev);
> > >> +
> > >> +  c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
> > >> +  c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
> > >> +  c->ops.get_status = dpu_hw_intf_get_status;
> > >> +  c->ops.enable_timing = dpu_hw_intf_enable_timing_engine;
> > >> +  c->ops.get_line_count = dpu_hw_intf_get_line_count;
> > >> +  if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
> > >> +          c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
> > >
> > > While at it, could we sort these down with the other conditional
> > > callbacks?
> >
> > What kind of sorting do you have in mind?
>
> Moving this conditional ( if (...) ) down with the other conditional
> assignment below, instead of being right in the middle of get_line_count
> and setup_misr, both which are not conditional and make it harder to
> read, especially considering the lack of newlines and/or curly braces.

Ack, sounds good.

>
> > >> +  c->ops.setup_misr = dpu_hw_intf_setup_misr;
> > >> +  c->ops.collect_misr = dpu_hw_intf_collect_misr;
> > >> +
> > >> +  if (cfg->features & BIT(DPU_INTF_TE)) {
> > >
> > > Any clue why we're not using test_bit()?  Feels a bit inconsistent.
> >
> > Yes, some files use test_bit(), others just check the bit directly.
> > Maybe after moving some/most of conditionals to core_major_ver we can
> > clean that too.
>
> Sounds good.
>
> - Marijn
>
> > >> +          c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
> > >> +          c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
> > >> +          c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
> > >> +          c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
> > >> +          c->ops.disable_autorefresh = dpu_hw_intf_disable_autorefresh;
> > >> +  }
> > >> +
> > >> +  if (mdss_rev->core_major_ver >= 7)
> > >> +          c->ops.program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
> > >>
> > >>    return c;
> > >>   }
> > >> --
> > >> 2.39.2
> > >>
> >
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry
