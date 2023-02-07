Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6300E68D30A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 10:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbjBGJlL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 04:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbjBGJlK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 04:41:10 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02719D2
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 01:41:10 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id h24so16053395qtr.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 01:41:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zp5hYF87tC7LgQJgcE73rMx2/POX2EkkI6L+Y1/9hfw=;
        b=Hp1gLHrDPiaBQvxQLlRaNWdSRX+ygLt9p3tDCcMtc/XOZuQgW9YRwbLnT62KssiWmM
         VQDKL9uYBjdf6d5GRkphmbbJPAuoNZdPTVW0tE+OMF1wePN1Qmrpzal9g5E+xGWEYUt9
         YFe02kD5A4GYUDxn0IeCUJ89zRw9g/QZc7DHhzgcppY1EwDSEwdL5fSL6w/5g69iCXZI
         wnWk9wVUcnGBGownDvHqRUsFNiCyOthJdul40D0LpqDPFUGrmylZ4e4ftGFc47Ugr6UY
         L04313oTL3+BgAGofHLnxG0yz/Bw3vEUeptqh74v3/68tWhdNtuIXYe67eGKU7Xcp5D1
         lOsg==
X-Gm-Message-State: AO0yUKUaVYnXOFv3HcVZ1FDC2YKMGNROdVazW4Ps+fM2ltzJBYQQHh9W
        LntFEQ+qMl3K55Y2adu7tEUhVNRftwAk8w==
X-Google-Smtp-Source: AK7set9Ma2DMICnNKdt1b5YAzZE48fLRXseDKfe+tZckvtmostxflrywwf2LfSjahGsE6WO3PoYU2g==
X-Received: by 2002:ac8:5f4f:0:b0:3a7:e619:61a with SMTP id y15-20020ac85f4f000000b003a7e619061amr4178864qta.37.1675762868933;
        Tue, 07 Feb 2023 01:41:08 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id f3-20020ac84703000000b003b2d890752dsm9009061qtp.88.2023.02.07.01.41.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 01:41:08 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id d189so9689397ybc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 01:41:08 -0800 (PST)
X-Received: by 2002:a25:eb04:0:b0:7b4:6a33:d89f with SMTP id
 d4-20020a25eb04000000b007b46a33d89fmr229443ybs.543.1675762868169; Tue, 07 Feb
 2023 01:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org> <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
 <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org>
In-Reply-To: <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Feb 2023 10:40:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
Message-ID: <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement automatically
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
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

Hi Dmitry,

On Tue, Jan 10, 2023 at 5:37 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On 10/01/2023 08:57, Laurentiu Palcu wrote:
> > On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
> >> On 09/01/2023 18:21, Laurentiu Palcu wrote:
> >>> It looks like there are some issues with this patchset... :/ I just
> >>> fetched the drm-tip and, with these patches included, the "Hot plug
> >>> detection already enabled" warning is back for i.MX DCSS.
> >>
> >> Could you please provide a backtrace?
> >
> > Sure, see below:
>
> I wondered, why didn't I see this on msm, my main target nowadays. The
> msm driver is calling msm_kms_helper_poll_init() after initializing
> fbdev, so all previous kms_helper_poll_enable() calls return early.
>
> I think I have the fix ready. Let me test it locally before posting.

Is this fix available?
Do you have a lore link?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
