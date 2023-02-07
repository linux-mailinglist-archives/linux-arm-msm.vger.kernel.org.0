Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A94868D3A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 11:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbjBGKJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 05:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjBGKJS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 05:09:18 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8843AEF93
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 02:08:56 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id 5so6109343qtp.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 02:08:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChFbUh5V5b2PhTg4oql0omqyT7uX9lKhtti+6M022E4=;
        b=idipgy+qWiEffhHjv5qFFdPriISepKxzAHVSzRimz3GK5sww8XBYokRXgYZOrojgF+
         EeJl8bX8BzP7ii12uNKEInky3sRlxNW1nB0ZoB8lpfix1RU+Z+9nbn8OpilPMBHXVgzJ
         jnVHI+XRremH/0dVMfhORQljunRs6rl7isWBdSPyPAd8MD+5wI2WhDaSloEa79/tCmRF
         U+A54oDMX2rIRO9XmLTJvW6813N8Xx474fTijhHsQXJoh+K2pC7v+EWNVIjRR/XOTmQu
         dHPdn+sV2kcZPg6N7GDs6LEkzN8UCV1hA6o7VkTaBz2NDLmf/yiQMVDMRtjFX+fSjvui
         8I+g==
X-Gm-Message-State: AO0yUKWVJhJRsrPzwFsCAs2Ec7cZ5Cd1dbaHDuMFRAKGcSbFp7WRIjbp
        E9XOk5sFrnbyQn8IiS/jY7mrGpa472GiUA==
X-Google-Smtp-Source: AK7set+GlVS97G0lJuO8eJztfQBhECBlhqup4oD0M5AT6xqG7j/cqpK//lihkjs7KvXnRfRuuT46xw==
X-Received: by 2002:a05:622a:15d1:b0:3b8:6868:2ab4 with SMTP id d17-20020a05622a15d100b003b868682ab4mr4060669qty.49.1675764515228;
        Tue, 07 Feb 2023 02:08:35 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id n13-20020ac81e0d000000b003b9a4a497a1sm9103083qtl.86.2023.02.07.02.08.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:08:35 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-50aa54cc7c0so189524737b3.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 02:08:35 -0800 (PST)
X-Received: by 2002:a81:6988:0:b0:52a:7537:98a6 with SMTP id
 e130-20020a816988000000b0052a753798a6mr231706ywc.384.1675764169824; Tue, 07
 Feb 2023 02:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org> <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
 <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org> <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
 <4bf0e5a2-23b6-1964-b30f-a5cb57f35e68@linaro.org>
In-Reply-To: <4bf0e5a2-23b6-1964-b30f-a5cb57f35e68@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Feb 2023 11:02:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyMJZaeeaLjzhbb_A7_WDcyjAzpKNWG8f5gtvmZLW0AA@mail.gmail.com>
Message-ID: <CAMuHMdXyMJZaeeaLjzhbb_A7_WDcyjAzpKNWG8f5gtvmZLW0AA@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Neil,

On Tue, Feb 7, 2023 at 10:59 AM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
> On 07/02/2023 10:40, Geert Uytterhoeven wrote:
> > On Tue, Jan 10, 2023 at 5:37 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >> On 10/01/2023 08:57, Laurentiu Palcu wrote:
> >>> On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
> >>>> On 09/01/2023 18:21, Laurentiu Palcu wrote:
> >>>>> It looks like there are some issues with this patchset... :/ I just
> >>>>> fetched the drm-tip and, with these patches included, the "Hot plug
> >>>>> detection already enabled" warning is back for i.MX DCSS.
> >>>>
> >>>> Could you please provide a backtrace?
> >>>
> >>> Sure, see below:
> >>
> >> I wondered, why didn't I see this on msm, my main target nowadays. The
> >> msm driver is calling msm_kms_helper_poll_init() after initializing
> >> fbdev, so all previous kms_helper_poll_enable() calls return early.
> >>
> >> I think I have the fix ready. Let me test it locally before posting.
> >
> > Is this fix available?
> > Do you have a lore link?
>
> The fix at [1] has been applied on 2023-01-26
>
> [1] https://lore.kernel.org/all/20230124104548.3234554-1-dmitry.baryshkov@linaro.org/

Applied where? linux-next does not have it.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
