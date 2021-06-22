Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC053B0A01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 18:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhFVQNX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 12:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhFVQNW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 12:13:22 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55811C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 09:11:05 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id ho18so35372331ejc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vUaa49+IpptNOMLBet5loWbWxua8vz3pz9+hJM0DysA=;
        b=JoWO76bSpdLeQy5raImQZVy8kWIlBu223s0LgU66ck+jTTwwNklVp9QexxIMkCOWnd
         zvYlt55snx4xFt5fFueb8Vor4fraGnMaFhbg6eT4Xif+PZPct8BBxwAGi1Wf8XYUTV8z
         +bSYQeHCU97YONUY2McqcSAiC+lEmyuxvtPg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vUaa49+IpptNOMLBet5loWbWxua8vz3pz9+hJM0DysA=;
        b=pxPFiqsJoBubCRNIXzMX7L8kZy/FFE67G80M+86RAf0YIJlsFLOZactIdHKLzmPEyk
         kAky+QYGGEMxgyK6LdEP5EsRxOeuUPoxGp8ZPutxZAtMJpW0Bpsy176ogcYXwF+1YlMm
         fgRKANsOMeCMeaXXOM3rqn2+SmKX1dQsK+E21jAyHk2kyi8XKymOTJTc7gx7cTagAQS7
         lEhn1pjTEN2kTPbMS24utazwSyfyLKujyVuZcjplmxrPesHDCyUMPHDSqev6UP3iv62g
         FZkICjT11M5UX0wG1szR/z3wrSGOk7PtnI0/rE+/9u6DHewxu8A8Q1r6Tk4l9tWe4MXr
         jIDg==
X-Gm-Message-State: AOAM532fxMB2vxzi/UndkFiAmHzE6qqvibZ7g5iqqyeCUlWxnHfpDllw
        4zjUCXqbQEbGF3WCC7JMaQgfsQ+Sf6yWJT8xU5j9aw==
X-Google-Smtp-Source: ABdhPJyRoaQ6qHQfdem8pZzXTW1Ky+LtLjfwVmIzRD47hgaShM+PfsaM9EDnomrcW5hRGbdsO5lon4HAy7wpYxgvQV4=
X-Received: by 2002:a17:906:8041:: with SMTP id x1mr4713697ejw.81.1624378263922;
 Tue, 22 Jun 2021 09:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210621074152.306362-1-judyhsiao@chromium.org> <20210621114546.GD4094@sirena.org.uk>
In-Reply-To: <20210621114546.GD4094@sirena.org.uk>
From:   Judy Hsiao <judyhsiao@chromium.org>
Date:   Wed, 23 Jun 2021 00:10:53 +0800
Message-ID: <CAJXt+b-eRLKORqPOX1cJM3xzEyJhdeuj+w9-btpZSmy7v4U6Sw@mail.gmail.com>
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

On Mon, Jun 21, 2021 at 7:46 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jun 21, 2021 at 03:41:52PM +0800, Judy Hsiao wrote:
>
> > Support for loading the snd-soc-dummy via DeviceTree.
> > This is useful to create dummy codec devices where we need to have some
> > DAI links without a real Codec.
>
> Why would it be useful to create DAI links to a dummy device that has
> no properties?  If you've got a device with no software control it's
> still going to have some limits on things like what formats and sample
> rates it can accept so you should describe that in DT.

Thanks for your review comment.
This patch is used to support multi-channel where we want one codec to
control the only GPIO shared by 4 amps.
(Please refer to
:https://patchwork.kernel.org/project/alsa-devel/patch/20210526154704.11495=
7-1-judyhsiao@chromium.org/)

In snd_soc_runtime_calc_hw(), by creating dummy codecs that share a
DAI link with a real codec:
  1. The min/ max channel of  CPU DAI will be directly adopted.
  2. The formats and sample rates of the DAI link will be determined
by the real codec unless the real codec supports the rate
      and format that do not intersect with the rate and format of
snd-soc-dummy.
That is the reason why we don=E2=80=99t specify the format and sample rates=
 of
the dummy codec with the real codec determining the properties .

Does reposting a new patch with  a more clear commit message to
describe the use case sound good to you?
>
> Please try to keep the CC lists for patches you are submitting relevant
> to the patch, people get a lot of mail and reviews for irrelevant
> patches add to the noise.
Sorry about that. I have adjusted the CC lists.
