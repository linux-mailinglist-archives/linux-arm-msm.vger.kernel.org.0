Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F68651026
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 17:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbiLSQTL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 11:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbiLSQTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 11:19:10 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E94CC2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 08:19:09 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id v70so8257820oie.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 08:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FzfwFyE+sSo7ANEauBVW9ZLP3F3r13UfuJs8RcyCrw8=;
        b=NhV5Tw8ZgsfyFjwkPlchKtqK1L2895WBh+U3hylBRokB378KBrak4q5ikdIN1YCHb8
         gE6xYOOI+AwuoBssFtnr1hYKA7N6nJ5+rKlsbOyi7yZndY4ts91E0gEMpiikil7MdjaO
         WvFRhuAaOVjZKma2c/ElhriNgPTK/j05nUguqrNpsacCSQK/wo6g08O+fKTgdrXo3YMc
         eAUpG41yfCHljt2CVqn7m1znKJU57Em/dMeRhApo+O8Q3SGOPwMtcVFH0pk4uy4CurEz
         qMyFTMRq8PHYUIalhIGoR9aYTmvrODCi5d1toApLLUH35MZJgW086Z8BO1WIzFzdAv9u
         z4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzfwFyE+sSo7ANEauBVW9ZLP3F3r13UfuJs8RcyCrw8=;
        b=2Usz1Rb5SvjVr+usD/HyH0lVegiEYaikw+iQ8apU6ZSpZ5j2zo7b0bTOVpFlKfCME9
         pSX2SqOGQIZOsyZlO9XbwP1raJI+Weoysnhi63V0vtMcdve816AH8uFOVvsTPYuukHM4
         BN/6X0fkh7WGqFekGhowqY15MV5FDEokDKJvFD76SyM860S5gZtDjcQprIYDzwZfQSfy
         HBBpT3LSUvp4x+ls2Ug4Yy+Uest1ANLbP5dQ6rSe5bNMjGeIeKE8zqFiP2Dr4NfRdAoS
         aqpuElWNYc09UnVnPXmKFX019TlGxv1wMzSPnxJLdIEDPppc+n8qg98I1zen2IulFqyt
         efQw==
X-Gm-Message-State: ANoB5pkIYlVPvY7PaJqokUZHtLjJlLlZO8WByEE7I0B65U0RKaxNVMeY
        xzNNZ9DWrUKkYn1qj/8o7tN7UuOjOo06TJQ8rg/vDg==
X-Google-Smtp-Source: AA0mqf7on98KXtfG6FXd1XYA9zHC5OaIHzJz81TJPiavIoA4qtg8I+HyZWzvci+P6yoDgTZYZpTHsplgpSVeBuN966o=
X-Received: by 2002:aca:1c07:0:b0:359:ef86:2f4f with SMTP id
 c7-20020aca1c07000000b00359ef862f4fmr1017340oic.14.1671466748381; Mon, 19 Dec
 2022 08:19:08 -0800 (PST)
MIME-Version: 1.0
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-6-robert.foss@linaro.org> <feda0561-1291-daa7-ea01-db5729a1a415@linaro.org>
In-Reply-To: <feda0561-1291-daa7-ea01-db5729a1a415@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 19 Dec 2022 17:18:57 +0100
Message-ID: <CAG3jFyuku05O_7oQhYCeOKmkZzEipASyJX0yBcJAHxP8HGOtaQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] drm/msm: Add support for SM8350
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 8 Dec 2022 at 00:50, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 05/12/2022 18:37, Robert Foss wrote:
> > Add compatibles string, "qcom,sm8350-mdss", for the multimedia display
> > subsystem unit used on Qualcomm SM8350 platform.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_mdss.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index a2264fb517a1..39746b972cdd 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -293,6 +293,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >               /* UBWC_2_0 */
> >               msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
> >               break;
> > +     case DPU_HW_VER_700:
> > +             msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 1, 1);
> > +             break;
>
> Judging from the vendor kernel, the highest_rank_bit is 3, with usual
> todo for 2 for LP_DDR4.

Thanks! Will fix.

>
> >       case DPU_HW_VER_720:
> >               msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
> >               break;
> > @@ -530,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
> >       { .compatible = "qcom,sc8180x-mdss" },
> >       { .compatible = "qcom,sm8150-mdss" },
> >       { .compatible = "qcom,sm8250-mdss" },
> > +     { .compatible = "qcom,sm8350-mdss" },
> >       { .compatible = "qcom,sm8450-mdss" },
> >       {}
> >   };
>
> --
> With best wishes
> Dmitry
>
