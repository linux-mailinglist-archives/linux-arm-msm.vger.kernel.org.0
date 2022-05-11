Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E872523FEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 00:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348528AbiEKWER (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 18:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348527AbiEKWEP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 18:04:15 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB19425594
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 15:04:14 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-e2fa360f6dso4549376fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 15:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=36iz89P09ojYrmbM5f1H/QsMT0+rmWkuU11oOzTk+Ho=;
        b=e1Tq7sW4VPNVTH04wWKgTBIYHtwcLCkVzIBe8Z3juTk4EnXptXqkLVO6IC764LIGqK
         QGrBAh5GOJdMXMylCB2rPsbo7E06IkKoN9lEerUhcn+6bnGvmdt6JWLDWv39N/2B31Ee
         ifot5DzM5pkuOvvFdNQxrtyfAC5Hjy9XNexUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=36iz89P09ojYrmbM5f1H/QsMT0+rmWkuU11oOzTk+Ho=;
        b=WBCPYy/hhpBmAyHJY+0EAFmMQ7BwGJ7hThTDLykml14DXYxqaqOS48B2qjOHKX165i
         cvtUS6Cfbl72fAjxF5cC3wIAV4x+toSDY7v0Pt1GYoWbdweKUlacMXfmbLmgow8pmxjV
         y6HmER7MAfWwP3VUentQeTAks6e3lznN8i5Y4GloxpaDM0WFDQ1WPJxyIVg0XNODgDKj
         l+9XnjzfWmmNaht9FAm1Rh29Dm0SK20U3KvbXu2lbjyUlggb6wY9Pcmq0PJrEGffP4Zg
         DXhbexaLKJwzUI3ENao2tP3OH3HN/dLsjm/rkzjFw06wujvihFGle7mkFr7o0lWciB8l
         o+vQ==
X-Gm-Message-State: AOAM531Zds4VpITgbF04t2ruGOOiSoxXG/O3v/1e5Aogo3ovVOmCLIua
        g8jWrW9+qQuE5cTTGFSvwap+WyodpUz0s850OPunFA==
X-Google-Smtp-Source: ABdhPJzw3oVKCKyN2EqwMU4CV86X7Qc6lhRr4OE1Ty+q7OzIPM+vgj64ZYEKlp7szGeXEs42G0fteoQQhBd08816Sp0=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr3966022oao.63.1652306653122; Wed, 11
 May 2022 15:04:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 15:04:12 -0700
MIME-Version: 1.0
In-Reply-To: <CAE-0n517iAS9KSdunMX18LpqDrQ4ac-yRCZq82j-XdExaGjCXA@mail.gmail.com>
References: <20220412194505.614002-1-swboyd@chromium.org> <YnKvoh+h07at8b65@builder.lan>
 <CAE-0n517iAS9KSdunMX18LpqDrQ4ac-yRCZq82j-XdExaGjCXA@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 May 2022 15:04:12 -0700
Message-ID: <CAE-0n53eXiz74iCHHQaC-eDFkuui9Y1xXvuqd2g0UnrwbYhZTg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: rpmh: Set wake/sleep state for BCM clks
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        patches@lists.linux.dev, Alex Elder <elder@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2022-05-06 16:24:15)
> Quoting Bjorn Andersson (2022-05-04 09:53:54)
> > On Tue 12 Apr 14:45 CDT 2022, Stephen Boyd wrote:
> >
> > > Set the wake and sleep state for BCM clks here, not just the active
> > > state, as the active only state is dropped when CPUs go to deep idle.
> > > This ensures the clk is always on when the driver thinks it is on.
> > >
> > > This was found by inspection, and could very well be incorrect if the
> > > RPMh hardware copies over the active only state to the sleep and wake
> > > states.
> > >
> >
> > Taking another look at this patch and now it makes perfect sense to me.
> > Sorry for not grasping the problem earlier.
> >
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> >
> > Will you take this in fixes, or do you want me to pick it for 5.19?
> >
>
> I'm waiting for Taniya to reply. For all I know this has no effect
> because there's some sort of copy/paste from one state to another. Until
> then it doesn't seem like we should do anything.

Taniya told me that if there's no sleep or wake state set then active
state remains even when the subsystem is in sleep. Not exactly
copy/paste but at least it is consistent. We need a comment here so this
doesn't come up again.
