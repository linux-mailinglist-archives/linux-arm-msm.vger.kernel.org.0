Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBD17E2F9D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 23:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbjKFWMF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 17:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233169AbjKFWME (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 17:12:04 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EAD10A
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 14:11:59 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5ac376d311aso58139267b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 14:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699308719; x=1699913519; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TGM/lCcxyrtlyI0/1HNh1y04S/ydjRYuctHpQFy0HgE=;
        b=fOSjCrxsmtOjyHb79uh94YHHINCfW/Sxo11YOFK1QJ/+fjrg12nE3EU2Nn2kQd1vHb
         M17+eXnLOAQ0g0s58qg5BLrC9Cf9Z9+zHXEJlpmiTw0G2ZA/6XFctPBornXjZi3z7Zeg
         YLjuKLONRHjnkEh3DrDkKQWb/+YShf9AJwFZ/b0znx9byd/s2pFu9a5cbmQbF7JVUj9h
         5nYNKgaAgiBAbeAPu31hR3XKCcEZW8Z1v9hl/veI9JqNEoByEbc1OYODMoj+wnHhTrU/
         ucK1QbuJAsVeSYtZrh/06clVJ3VTphUtBp/oOXaJwZ2bDzuqmi/USe8c76/DGBpHTxyd
         Rf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699308719; x=1699913519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGM/lCcxyrtlyI0/1HNh1y04S/ydjRYuctHpQFy0HgE=;
        b=jtOu+a4xgywQpZyAWrK10XBXHqtMmWzybL+EJ91tJK30A2trSlOUJLXV24kPKChe2x
         tpHJi56BT5RuvbMhhE5eocEp7effV0I06O0KNI6TGoYR3K9iVK8q+LqZlJMaKWuX1e1a
         OgLpCMFyYBOa6oAVkVroBX0PqdEsGVQc4XaCLEVp0+YnkaX6oV2hK69vk8Dfmy7Dgnb9
         ApVNhu2cZd1gNhrHWXOHiVA1Kfftw8k94LD/Z4H7vTporE0dlMCBnGvxZX9AZjKFNsfs
         xgHK7cwbADQuCRUg9pVVkuu4Mg1t6qCD6KnKqgKHCOFR6JuFEnLmxvlLH83xQNtT/XGx
         07ng==
X-Gm-Message-State: AOJu0Yzn3F2gyW6tqscJ75v3pHEFbdL9cwLk8mtj+cYrC/7K6FjqcIN5
        6LqMrZW1UC+3g04FVAXg/LmANHI65PkmQpnv6Uewvg==
X-Google-Smtp-Source: AGHT+IH4OKDEo0z40E9ned6EK3zJyr56Otbk/sjKYRo1vUt/B3CisEMRaJv/JlQGTxVvoMPU5l/04Q9U9RkfcQ4U0Ds=
X-Received: by 2002:a81:990d:0:b0:5af:196c:dfcc with SMTP id
 q13-20020a81990d000000b005af196cdfccmr10650083ywg.8.1699308718929; Mon, 06
 Nov 2023 14:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20231009171139.2691218-1-dmitry.baryshkov@linaro.org> <e4c94f9d-773a-e894-d655-41afeb01dae1@quicinc.com>
In-Reply-To: <e4c94f9d-773a-e894-d655-41afeb01dae1@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 7 Nov 2023 00:11:47 +0200
Message-ID: <CAA8EJprpBy6UhtScRkFS24TgKevBOb9nVBFCqPhEof=-k58Mwg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: correct clk bit for WB2 block
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Nov 2023 at 20:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Sorry for the delay in getting back on this. There was quite a bit of
> history digging I had to do myself to give a certain response.
>
>
> On 10/9/2023 10:11 AM, Dmitry Baryshkov wrote:
> > On sc7280 there are two clk bits for WB2: control and status. While
> > programming the VBIF params of WB, the driver should be toggling the
> > former bit, while the sc7280_mdp struct lists the latter one.
> >
>
> No, this is not correct. Both are control bits. But for the context of
> where this is being used today, that is setting the VBIF OT limit, we
> should be using the VBIF_CLI one. So the below change itself is correct
> but not the commit text.

Maybe you can update dt bindings for the SDE driver? Because they
clearly speak about the control and status bits.

>
> We need to make the same change on sm8250 WB2 as well as this register
> is present there too. In fact, anything >=msm8994 for setting VBIF OT
> for WB2 we should be using VBIF_CLI bits of register MDP_CLK_CTRL2
> (offset 0x2bc).
>
> For anything >=sm8550, we need to use WB_2_CLK_CTRL present within the
> WB block and not the one in the top.
>
> Hence for this change, we can do below:
>
> -> update the commit text to indicate both are control bits but for the
> vbif ot context we should using the corrected one
> -> if you can also add sm8250 in the same change i can ack it and pick it up
>
> Have you re-validated WB with this change? If not, let me know I shall
> while picking this up for -fixes.

No, I haven't validated this on sc7280. I'll try this on sm8250 and
then I'll send v2.

>
> > Correct that to ensure proper programming sequence for WB2 on sc7280.
> >
> > Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > index 3b5061c4402a..9195cb996f44 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > @@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp = {
> >               [DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> >               [DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> >               [DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
> > -             [DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
> > +             [DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
> >       },
> >   };
> >



-- 
With best wishes
Dmitry
