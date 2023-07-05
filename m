Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 896E7747C84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 07:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjGEFjb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 01:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjGEFjb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 01:39:31 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B89C134
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 22:39:30 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5774335bb2aso57680717b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 22:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688535569; x=1691127569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZRUZb3Mavh3zQZr0EyamsRHMcZS99pmjV8Wj5+w+qg=;
        b=x9RjFt6ulqSjQi+8+xXDMCIFQrdt06fwjMPTcE71RERLqQZnJaU5Kj31PMwi3f/DBi
         2uCscmaq04UgqRS5ZYxtcuaaaNndSjhll2FryhV6h4LWPSoyLaLUXau18fV2SpEfSztf
         OXsmtSrGr7pI7T+M9d+zNkhQ3w8g7WuXY80r3of1RHia26zfhcXBRZLqxXlQIZC487KG
         f4cYFubeJ3XdN0iIVWjmQPKB024M9CxBgHkBHuNPIOeRzEiAsutc/e63ypZ2nmv3KBtx
         bQ/XwTtEDhy9yDWdWAKG4MZLd7lSKV3+4+qSGqBKi+0pzhiRStfNh7nAzYS9VlHcdtTQ
         5f2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688535569; x=1691127569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZRUZb3Mavh3zQZr0EyamsRHMcZS99pmjV8Wj5+w+qg=;
        b=SOUXF3UZqZJdLF9ZgNj0Ri8o7EyZxpzkYx9/rzW/cyPrlvYtacGSqHob5MAaR4XPua
         Ulfi+qr/QJfy3Qjc48+UfbwQtCgiogCLKh+EdkmytYydQp7W2QcfrJNQ8lu9+YiOF5nz
         q/BUIyIlAztGB6K+mWJTDLXFOeaULeT7PoEHjqAaDm3GpLcOp6U3ECBZIdrnaFp2ekZq
         uRM6UkI9mOpzulRVTFXNIT1HMqZueCKVEK9YbaeSZvUyuGhqwTqqiATICPg2/djNZjW4
         usKXvoh3JJARcJuTTYlb/FSPfE1IJXQbDrcl33f4YLQUfAbM3UrhuwAws0ZySU315f0m
         ILFQ==
X-Gm-Message-State: ABy/qLa+pDzFlViDtZ6Ka0XUEpilAdhbvxu1YP2yGNwca6PId/IYn2Sh
        IM28VHabfuvItxzv8EnCoRwQ2lC0O+uM9J+Tkt4mZQ==
X-Google-Smtp-Source: APBJJlF/o0+UnDZwtyE3kuzBDCdbAEQWshCz47kYNXjLYoj6S3T1Qy4vIgjTzrrW/XTGavWVmpml++zCtJ2idlA3dPM=
X-Received: by 2002:a25:c303:0:b0:c11:bec7:a029 with SMTP id
 t3-20020a25c303000000b00c11bec7a029mr11967714ybf.46.1688535569460; Tue, 04
 Jul 2023 22:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de> <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com> <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
In-Reply-To: <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 5 Jul 2023 08:39:18 +0300
Message-ID: <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Amit Pundir <amit.pundir@linaro.org>, Marek Vasut <marex@denx.de>,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[Adding freedreno@ to cc list]

On Wed, 5 Jul 2023 at 08:31, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Amit,
>
> On Wed, Jul 5, 2023 at 10:15=E2=80=AFAM Amit Pundir <amit.pundir@linaro.o=
rg> wrote:
> >
> > Hi Marek,
> >
> > On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
> > >
> > > Do not generate the HS front and back porch gaps, the HSA gap and
> > > EOT packet, as these packets are not required. This makes the bridge
> > > work with Samsung DSIM on i.MX8MM and i.MX8MP.
> >
> > This patch broke display on Dragonboard 845c (SDM845) devboard running
> > AOSP. This is what I see
> > https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-dis=
play/PXL_20230704_150156326.jpg.
> > Reverting this patch fixes this regression for me.
>
> Might be msm dsi host require proper handling on these updated
> mode_flags? did they?

The msm DSI host supports those flags. Also, I'd like to point out
that the patch didn't change the rest of the driver code. So even if
drm/msm ignored some of the flags, it should not have caused the
issue. Most likely the issue is on the lt9611 side. I's suspect that
additional programming is required to make it work with these flags.

--=20
With best wishes
Dmitry
