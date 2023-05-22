Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0D6D70CE5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 00:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjEVW5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 18:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjEVW5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 18:57:00 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51239D
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 15:56:58 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-563874afe98so48715897b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 15:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684796218; x=1687388218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XXcEEoSDUQBuJY5wjK6hHz3D+MpxCJ5uA+e68AM04Xg=;
        b=LOtd/cObzugR2ZdYbrOqKHIvok79/3R00GwQL+I9VwslW8sCTCzrnPLnzCo6Y/1IE5
         w8zIT5twQVE4ziaKPGghO45wQPe/Xgfd6fDg3joKBo4iAAsLF7QMBgScfE7rh1gfi1Ev
         YHUC0JK04uOo7LVDc33zCR6hVSDYHL2L72BPCrbO3l1/oFJsMXbKDY1VWQVEtzYS8p4J
         m4IJdTv3o+oYgOkjoK1dOV3PxWES70Rm9t8uXYz+S7b96B4Rz1OtBgJSi++BzGrp5CcC
         H9qmRW70CWRzUlyy4ZXXrNfLXKbrrtpV5LrNiS6GJuBtwEGPBLaWaQ/3Ycaaf6+5W1Ax
         Sapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684796218; x=1687388218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXcEEoSDUQBuJY5wjK6hHz3D+MpxCJ5uA+e68AM04Xg=;
        b=PPw5lEFpoUyknFMmWBmmJrFb1mC3PoyTKk7PJUfV+jb8hy/P2S+K2e/sCXELzHUGX3
         iDPJYUBitQq6JVCxNuc1hkYX1yZARgo+iGOnX46F/ThV09qzQtOK5+4kiOoBNFEdIckC
         b7zyE0OCdaDoQ1UZ3ryat9cMVIwH/ISkQ9X1YvqUi/J9UMjLRjmyi9Ev70p11RU6V1BD
         HyrLNpXeD2CH6LbkKMSlLiLQFXd4YKzsveIVTQ/ybGmjtaBUduAQ01UROy5XJE0PFqOx
         FmjN/UqwFJiAoYug+WZ5oIMZIV8nOySRHaq7qWD+9nc4KAqsoGNLJizt7YLX70sX2KKy
         2Vyg==
X-Gm-Message-State: AC+VfDxgtIvXhTJCySckTPL+C4Cp803Ev4fW40dVMI4G4Ooy9z2m3QzR
        mE+YeAOud2T4bEv47Lr+qvrE2iToC900H+77Yid/og==
X-Google-Smtp-Source: ACHHUZ7Ub8qC7wd7Cma8FQgO7ATYAbenBB9G3QZ2NY5Z824hncIzM8SI+FEsMKLr6dilkm7r/I6tRIbSIRoMkvNE7c4=
X-Received: by 2002:a81:5289:0:b0:55a:4840:68d with SMTP id
 g131-20020a815289000000b0055a4840068dmr12541888ywb.20.1684796217847; Mon, 22
 May 2023 15:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-6-541c341d6bee@somainline.org>
 <f34cd6a8-6d6d-9dcf-b681-56439416c4b4@linaro.org> <gzhxxdh235nsbjbns37thi33rpk546ynkihihjiam46pkngkud@opwtr2swvdau>
In-Reply-To: <gzhxxdh235nsbjbns37thi33rpk546ynkihihjiam46pkngkud@opwtr2swvdau>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 23 May 2023 01:56:46 +0300
Message-ID: <CAA8EJppniEh3cFpi=AdK-i=KZcd=tzpPru0W4Vq9LJjJL8q=qQ@mail.gmail.com>
Subject: Re: [PATCH RFC 06/10] drm/panel/samsung-sofef01: Add panel driver for
 Sony Xperia 5 / 10 II
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Caleb Connolly <caleb@connolly.tech>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 May 2023 at 01:32, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-22 04:19:45, Dmitry Baryshkov wrote:
> > On 22/05/2023 00:23, Marijn Suijten wrote:
> > > This SOFEF01-M Display-IC driver supports two modes with different
> > > compatibles to differentiate between slightly different physical sizes
> > > (panels) found on the Xperia 5 (6.1") and 10 II (6.0").
> > >
> > > It is currently also used to hardcode significantly higher fake porches
> > > for the Xperia 5, which are unused in transfers due to this being a
> > > command-mode panel but do have an effect on the clock rates set by
> > > dsi_host.c.  Without higher clock rates this panel fails to achieve
> > > 60fps and has significant tearing artifacts, while the same calculated
> > > clock rate works perfectly fine on the Xperia 10 II.
>
> <snip>
>
> > > +/* Sony Xperia 5 (kumano bahamut) */
> > > +static const struct drm_display_mode samsung_sofef01_m_bahamut_mode = {
> > > +   /*
> > > +    * WARNING: These massive porches are wrong/useless for CMDmode
> > > +    * (and not defined in downstream DTS) but necessary to bump dsi
> > > +    * clocks higher, so that we can achieve proper 60fps without tearing.
> > > +    */
> > > +   .clock = (1080 + 156 + 8 + 8) * (2520 + 2393 + 8 + 8) * 60 / 1000,
> > > +   .hdisplay = 1080,
> > > +   .hsync_start = 1080 + 156,
> > > +   .hsync_end = 1080 + 156 + 8,
> > > +   .htotal = 1080 + 156 + 8 + 8,
> > > +   .vdisplay = 2520,
> > > +   .vsync_start = 2520 + 2393,
> > > +   .vsync_end = 2520 + 2393 + 8,
> > > +   .vtotal = 2520 + 2393 + 8 + 8,
> > > +   .width_mm = 61,
> > > +   .height_mm = 142,
> > > +};
> > > +
> > > +/* Sony Xperia 10 II (seine pdx201) */
> > > +static const struct drm_display_mode samsung_sofef01_m_pdx201_mode = {
> > > +   .clock = (1080 + 8 + 8 + 8) * (2520 + 8 + 8 + 8) * 60 / 1000,
> > > +   .hdisplay = 1080,
> > > +   .hsync_start = 1080 + 8,
> > > +   .hsync_end = 1080 + 8 + 8,
> > > +   .htotal = 1080 + 8 + 8 + 8,
> > > +   .vdisplay = 2520,
> > > +   .vsync_start = 2520 + 8,
> > > +   .vsync_end = 2520 + 8 + 8,
> > > +   .vtotal = 2520 + 8 + 8 + 8,
> > > +   .width_mm = 60,
> > > +   .height_mm = 139,
> > > +};
> > > +
> > > +static const struct of_device_id samsung_sofef01_m_of_match[] = {
> > > +   { .compatible = "samsung,sofef01-m-bahamut", .data = &samsung_sofef01_m_bahamut_mode },
> > > +   { .compatible = "samsung,sofef01-m-pdx201", .data = &samsung_sofef01_m_pdx201_mode },
> >
> > Are there really two panels? Can we use one mode for both usecases?
>
> See the commit description where I explained exactly this: the panels
> have different dimensions (6.1" vs 6.0", hence different DPI) and I also
> abuse this to hack in higher clock rates via fake porches.
>
> I just ended up on a scary website that supposedly contains the panel
> names:
>
> - Xperia 5 (bahamut, 6.1"): AMB609TC01
> - Xperia 10 II (pdx201, 6.0"): AMS597UT01

Great! From the patch description it was not obvious if those are two
different panels or a single panel with slight difference in the glass
cover. With these names in place (well, with two distinct names in
place) it makes sense.

-- 
With best wishes
Dmitry
