Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F464F6427
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 18:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236974AbiDFQIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 12:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237026AbiDFQHY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 12:07:24 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9B2432D6E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 21:47:08 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id 12so1263528oix.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 21:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=NW58TngHF2iGAMKYPwCczd/NajU2Zo1ovbXcFt5HfVg=;
        b=HbEFFFNDXGE1evlb0UhGkovo3mQz8rrsjMrZ0rgXuwXs/AsmlxLjIo0Y/JJoBSEaQ/
         XsZtm/oRIVWvTKK38RZ5aNicioktfbqpFBo+Sjlu2WX5W20YXu3GB6KXtrAJN9vyxhav
         C18wFUMX1doDa1fxtMwdq+D3EQkj1WUoF1cXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=NW58TngHF2iGAMKYPwCczd/NajU2Zo1ovbXcFt5HfVg=;
        b=LMAg43PVnzq6g6I577F3DCGauSCbV82LHaglND8eqfu03xYiHfOyGolVgCByRqtB77
         AyTCjb48f7iZvREXf4ujV89nfpRdUsv9N9FdL/FC4AbwuArwHbszfEg5Eb2AQEiGm+UP
         BT1WoB8y7rK7+u3RPFLj5WbZN6fLUVJdQ8xqZmD2NggqJiJ86d4ywZ5yyg3WdXcmU9ni
         5P63l6tnL9My9gbrSNlHlRixi4u+qNql7vaXFPWN0O06Mo0Ue1TfdXIJViWM6wSHDe3/
         /aEOCvxDqLwIW4iDXksMkb139xpQqgHC2A+SEa7s0B5TgBywBICXfswhfgUdXvEgKSFF
         KNOw==
X-Gm-Message-State: AOAM530fdESdc5Hd+l4eAHpD7T/+5MXB+fuoxplz/DhEeonXG4GvmY2J
        /uD8hQXvvtRGVEIf+fo1lpCjCl19o8rSfnEMaefmfQ==
X-Google-Smtp-Source: ABdhPJznEpRzhYei7BQOzmtrp7K7kVlyM+t3hMHY0+2YiIUtrVJ/MLs5xc2bsd5dbee7S/GYtq5ePSIQqXJlseQIpxc=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr2700245oie.193.1649220427524; Tue, 05
 Apr 2022 21:47:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 21:47:07 -0700
MIME-Version: 1.0
In-Reply-To: <CAE-0n51xeigKFS9Zek44HZGD9cdc4Em91aQ5HHzuy7P1FBmfFg@mail.gmail.com>
References: <20211125174751.25317-1-djakov@kernel.org> <CAE-0n51xeigKFS9Zek44HZGD9cdc4Em91aQ5HHzuy7P1FBmfFg@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Apr 2022 21:47:07 -0700
Message-ID: <CAE-0n52xQ+SbwpDfzuW-tMLJP17Z2qog2s_pS=XBTULLNpUkLg@mail.gmail.com>
Subject: Re: [PATCH v3] interconnect: qcom: icc-rpmh: Add BCMs to commit list
 in pre_aggregate
To:     Alex Elder <elder@linaro.org>, djakov@kernel.org,
        okukatla@codeaurora.org, quic_mdtipton@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2022-04-05 16:00:55)
> Quoting Georgi Djakov (2021-11-25 09:47:51)
> > From: Mike Tipton <mdtipton@codeaurora.org>
> >
> > We're only adding BCMs to the commit list in aggregate(), but there are
> > cases where pre_aggregate() is called without subsequently calling
> > aggregate(). In particular, in icc_sync_state() when a node with initial
> > BW has zero requests. Since BCMs aren't added to the commit list in
> > these cases, we don't actually send the zero BW request to HW. So the
> > resources remain on unnecessarily.
> >
> > Add BCMs to the commit list in pre_aggregate() instead, which is always
> > called even when there are no requests.
> >
> > Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
> > [georgi: remove icc_sync_state for platforms with incomplete support]
> > Signed-off-by: Georgi Djakov <djakov@kernel.org>
>
> This patch fixes suspend/resume for me on sc7180-trogdor-lazor. Without
> it I can't achieve XO shutdown. It seems that it fixes the sync_state
> support that was added in commit b1d681d8d324 ("interconnect: Add sync
> state support"). Before that commit suspend worked because the
> interconnect wasn't maxed out at boot. After that commit we started
> maxing out the interconnect state and never dropping it.

I'm also wondering if this means suspend doesn't work without sync_state
support? Does this mean that device links are required? And device links
are only made if fw_devlink is enabled? I don't see any devlinks made in
drivers/interconnect so I worry that we have to use fw_devlink to get
device links made to make sync_state happen to remove the max votes that
are put in at boot.

>
> It would be good to pick this back to stable kernels so we have a
> working suspend/resume on LTS kernels. I tried picking it back to
> 5.10.109 (latest 5.10 LTS) and booting it on my Lazor w/ LTE device but
> it crashes at boot pretty reliably in the IPA driver. Interestingly I
> can't get it to crash on 5.15.32 when I pick it back, so maybe something
> has changed between 5.10 and 5.15 for IPA? I'll try to bisect it.

Bisecting pointed to commit 1aac309d3207 ("net: ipa: use autosuspend")
as fixing it. I think before that commit we weren't enabling some
interconnect, but now we're booting, runtime suspending, and then
runtime resuming again. With the sync state patch I suspect the
interconnect bandwidth is dropped and IPA needs to use runtime PM to
actually turn resources back on because it assumed that resources are on
when it probes.
