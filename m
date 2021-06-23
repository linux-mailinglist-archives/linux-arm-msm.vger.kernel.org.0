Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A73C3B1C7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 16:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbhFWObr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 10:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbhFWObq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 10:31:46 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD550C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jun 2021 07:29:28 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id n20so3750507edv.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jun 2021 07:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NwEPWicXEScGAJ5xVFnITtqbN5ZVd/S2/99HIs4jcak=;
        b=GoIaYqmVekjEn37Cxpn5CKQXmVjMm4MFdz0pM0djdApdRBwJI7kswcPMRRvBpFGk5y
         0QkqmWQIFyIwvnyUDc1DYzBBDZtvYKkRk5iV9mPFUqO7Ud2Uf2BcgCfl5he7C4xyxYvd
         RJRtTIR5NQ4rffFIL2UHo/soK2fIyb6S25Wno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NwEPWicXEScGAJ5xVFnITtqbN5ZVd/S2/99HIs4jcak=;
        b=nf9K+Q6Qj9D1bnc8Ecgl82u/7g246CJIruJrWVcf5wYROiUiQEu1ALLfxmbytjnj/k
         9wBBxzGm+pE5uuayWY74w8WE5rMeHiPMvtEcKUIsV2SDHzZ6Rp6o1apd1lVukdn6mzOZ
         ZU2fnVVQRMGuH6B9Fo7BPSBp5QaN4ZIXSWhnqpWFU7Mp6viyX57EC1xe3O6Rv+ChPj5G
         j85dn0zy7mX6BrPuJm1ldYGFQ5NZh+WBRrd59m7mLsfDtEcxvYTNw9LviDErQvqZypg6
         Fswy/mVcRhjv0YYdgEPp5MC+6HUsAxMe7tmC1l7Ol5Ec2LzN3bTGT8z/lskeesSCt/sO
         vrsg==
X-Gm-Message-State: AOAM531c0TMX1yGEW9FvQV8ibq8Huol2UVlXE6tF8CEBsR8WfZU+M+Vg
        fSdRReM9MzHf2BdBjQxvkOYTRY58uM1P9whI9W0PXQ==
X-Google-Smtp-Source: ABdhPJyeMsLNi/QXkqaDM0G+bcsAZpsb5ooggnwbRoIqJuWmxNuU8EYrYKhlFeoc/Wp1w0w5f+3LNTU6B6JSdunayAY=
X-Received: by 2002:a50:afe2:: with SMTP id h89mr13086751edd.308.1624458567386;
 Wed, 23 Jun 2021 07:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210621074152.306362-1-judyhsiao@chromium.org>
 <20210621114546.GD4094@sirena.org.uk> <CAJXt+b-eRLKORqPOX1cJM3xzEyJhdeuj+w9-btpZSmy7v4U6Sw@mail.gmail.com>
 <20210622162307.GF4574@sirena.org.uk>
In-Reply-To: <20210622162307.GF4574@sirena.org.uk>
From:   Judy Hsiao <judyhsiao@chromium.org>
Date:   Wed, 23 Jun 2021 22:29:15 +0800
Message-ID: <CAJXt+b_15SEFW9ztg=CaYHfVJk-q+u46eLVgdPm+2ugjwajc1g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: snd-soc-dummy: add Device Tree support
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Douglas Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 23, 2021 at 12:23 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jun 23, 2021 at 12:10:53AM +0800, Judy Hsiao wrote:
>
> > Thanks for your review comment.
> > This patch is used to support multi-channel where we want one codec to
> > control the only GPIO shared by 4 amps.
>
> So you've got 4 instances of the same CODEC?  Then I'd expect to see
> those all individually represented in DT.  Or if there's a single
> physical CODEC then I'm not sure what the dummies are for?
>
> > In snd_soc_runtime_calc_hw(), by creating dummy codecs that share a
> > DAI link with a real codec:
> >   1. The min/ max channel of  CPU DAI will be directly adopted.
> >   2. The formats and sample rates of the DAI link will be determined
> > by the real codec unless the real codec supports the rate
> >       and format that do not intersect with the rate and format of
> > snd-soc-dummy.
> > That is the reason why we don=E2=80=99t specify the format and sample r=
ates of
> > the dummy codec with the real codec determining the properties .
>
> It's not clear to me why you'd not just describe the actual CODECs here
> rather than using a dummy CODEC, the fact that the dummy CODEC is doing
> what you want is just an accident of the implementation rather than a
> description of the hardware.

Thanks for your inputs. Specifying four codes for the multi-channel works f=
ine.
We have not thought of specifying four codes before as we want to avoid loa=
ding
the codec driver multiple times, but actually loading the
snd-soc-dummy just has the
similar cost. By specifying four codes, the dtsi file describes the
real hardware schematic.
I will specify four codec in the dtsi file to support the four channel
use case and this
snd-soc-dummy patch is not needed. Thanks for the discussion!
