Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3965B68D3F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 11:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbjBGKTe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 05:19:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbjBGKTd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 05:19:33 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BDF22DC4
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 02:19:32 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id f10so16094633qtv.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 02:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAbmluMMZmuve7W2pclzwLq8UAZbC40y33BvSstz+p8=;
        b=kFSvhI/y1PvAE3KeamC923IRK/SMX75zVUBNiKuVEfCUBCmaaLyjeWfqNnWH7bIwS6
         YCAwaMuNHnn2Tu4gh757hMZ7xoCp+IOLz/YLvZURI40aTLS1Yepap1h4y5LD/JSPD9uJ
         SPWQKm7l7/36FCg58qavMcERY0al+ltjw6xtEui9tkaScBdzDstui0ovqO4CN+NTVxDG
         8iVbiS804tcf01mvLKk7F+vApQYF+EIkecYwABwoms0nnbiQVWuUb3ndit95L0QdkOtF
         loiuG/5lwUjYdiQ2kDssQ6kbZxohio0N9VD9yveyeJOlKXZE3FBcvQCmDZ/b8WX9CP57
         EggQ==
X-Gm-Message-State: AO0yUKUKV01kRaRBBC/Ig7s/nLFldMHoWqjF66GuTKi4KA/C/tlFk34y
        ZQu9Ywyor4uEUNqSkqSPKim+7zrxrEA1dw==
X-Google-Smtp-Source: AK7set/MGkGVMWuxewXhWf6h3FINn78h8lKJ2Jf7ZU1MmUa6S1zgpHSxNEMWHcAHtwC9AuPBries6Q==
X-Received: by 2002:ac8:58cb:0:b0:3b6:2f49:1acc with SMTP id u11-20020ac858cb000000b003b62f491accmr5020612qta.16.1675765171143;
        Tue, 07 Feb 2023 02:19:31 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id b13-20020ac844cd000000b003ba1ccba523sm5461393qto.93.2023.02.07.02.19.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:19:30 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-52770ee8cf0so113212017b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 02:19:30 -0800 (PST)
X-Received: by 2002:a0d:e9c1:0:b0:514:a90f:10ea with SMTP id
 s184-20020a0de9c1000000b00514a90f10eamr213697ywe.316.1675765170090; Tue, 07
 Feb 2023 02:19:30 -0800 (PST)
MIME-Version: 1.0
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org> <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
 <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org> <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
 <4bf0e5a2-23b6-1964-b30f-a5cb57f35e68@linaro.org> <CAMuHMdXyMJZaeeaLjzhbb_A7_WDcyjAzpKNWG8f5gtvmZLW0AA@mail.gmail.com>
In-Reply-To: <CAMuHMdXyMJZaeeaLjzhbb_A7_WDcyjAzpKNWG8f5gtvmZLW0AA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Feb 2023 11:19:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgtiuxJ9dnjcGy77onHtrhabT5krJMp2XSr4KOD31ydQ@mail.gmail.com>
Message-ID: <CAMuHMdUgtiuxJ9dnjcGy77onHtrhabT5krJMp2XSr4KOD31ydQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement automatically
To:     neil.armstrong@linaro.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Neil,

On Tue, Feb 7, 2023 at 11:02 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Feb 7, 2023 at 10:59 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> > On 07/02/2023 10:40, Geert Uytterhoeven wrote:
> > > On Tue, Jan 10, 2023 at 5:37 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > >> On 10/01/2023 08:57, Laurentiu Palcu wrote:
> > >>> On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
> > >>>> On 09/01/2023 18:21, Laurentiu Palcu wrote:
> > >>>>> It looks like there are some issues with this patchset... :/ I just
> > >>>>> fetched the drm-tip and, with these patches included, the "Hot plug
> > >>>>> detection already enabled" warning is back for i.MX DCSS.
> > >>>>
> > >>>> Could you please provide a backtrace?
> > >>>
> > >>> Sure, see below:
> > >>
> > >> I wondered, why didn't I see this on msm, my main target nowadays. The
> > >> msm driver is calling msm_kms_helper_poll_init() after initializing
> > >> fbdev, so all previous kms_helper_poll_enable() calls return early.
> > >>
> > >> I think I have the fix ready. Let me test it locally before posting.
> > >
> > > Is this fix available?
> > > Do you have a lore link?
> >
> > The fix at [1] has been applied on 2023-01-26
> >
> > [1] https://lore.kernel.org/all/20230124104548.3234554-1-dmitry.baryshkov@linaro.org/
>
> Applied where? linux-next does not have it.

commit cbf143b282c64e59
("drm/probe_helper: extract two helper functions") in next-20230127
next-20230130 next-20230131
commit d33a54e3991dfce8
("drm/probe_helper: sort out poll_running vs poll_enabled") in
next-20230127 next-20230130 next-20230131

but not in any later version?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
