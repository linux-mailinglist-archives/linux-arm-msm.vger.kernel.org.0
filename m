Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E01229BBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 17:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbgGVPrP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 11:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbgGVPrP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 11:47:15 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BF5C0619DC;
        Wed, 22 Jul 2020 08:47:14 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id a8so2021556edy.1;
        Wed, 22 Jul 2020 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HoVUwkD/CbiG5/MELncVn64RYUZvFJVClzUVyeNxr7M=;
        b=jE/wvq2Q7DTuw3xPwzOgwmtTwSpZfjrNYA9x3yVk3+2T2eZUI/GEgnLpFbxI7Oys1M
         UV9a7dxVhM8s44FwUkVvBzxdfz0k++qzn1KZCGRDyHgV/bi8uUfwkUl7n/njVt5USEzp
         koIaslLr1+G4INekfMHW9X9OEMNNUC/96hRiys7d64trF8Y2VlxoGrz5kp1cQDtwkkDC
         IACBthdVY/UuorfPqXW3COp/2ZOi0p7OXVZjqDycs6bxKPoUb880KG37PEk20CBA38gM
         WiTrUjRruZEca5HkHPTOF4H0F3lCG4LWfW48bf6wjMQO4FFNj9m55HAwnHQcHUUPQ2tT
         dhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HoVUwkD/CbiG5/MELncVn64RYUZvFJVClzUVyeNxr7M=;
        b=TepTsI4lgwLGPajU+52RFFt0Bah1V6CuMwmbShiZafF5iWy4VgfqSaAsMW4FfzTJ12
         vnRZs/M7vZ6qBoc4JzDV5IhtCOlkNkDKNnt7xiICQJVsTytUmmImamDmqLPYIVE/tvzz
         ypqS6pYqFwcrsO0jfx9palannGdKFUrKEE9/rAEeT3fhug9T5iPAwoPs5US+OLNXpRh8
         wU759yiVVQHAFhuUYlmuFyVqY+TUIGEHcD5bvBH0IQHlSrkYIBsQ6OStCDnFOZfE/Fsm
         L9aPIX5FrPFbfBAHPEPDa+EFwt1weTo4jOpan38uLoNBkFvy6u/MveELyc18cuthWnjm
         h98g==
X-Gm-Message-State: AOAM530rsz3ucdbBK5sHVetF5q7GbaxDkGnmeV/QsGWN/A9O1H1dsJ0e
        2K8fhYtHsDmexuD3j8053+KmLyVK4ZhBJPmT6Z0=
X-Google-Smtp-Source: ABdhPJxosJN11zDQSjXmhENnAY8a/xTlojpLCi063iaBnlxh58oOjashgy9Fq9WU5WMvUzog9st58umRz18yVM4p8bo=
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr117686edi.120.1595432832953;
 Wed, 22 Jul 2020 08:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu> <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu> <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
In-Reply-To: <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 22 Jul 2020 08:47:49 -0700
Message-ID: <CAF6AEGsOZshgBUnUKUF_hOLNHmvrvsDwPzX24-RKos6MZEeusg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 21, 2020 at 10:30 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 21-07-20, 07:28, Rob Clark wrote:
> > With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
> > tree and merge it via msm-next -> drm-next -> linus
>
> I wanted to send it via my tree, but its okay. Pick this patch from
> linux-next and add my Ack, I will drop it after that.
>
> a8351c12c6c7 OPP: Add and export helper to set bandwidth

Thanks, I'll do that

>
> > Otherwise I can send a second later pull req that adds the final patch
> > after has rebased to 5.9-rc1 (by which point the opp next tree will
> > have presumably been merged
>
> The PM stuff gets pushed fairly early and so I was asking you to
> rebase just on my tree, so you could have sent the pull request right
> after the PM tree landed there instead of waiting for rc1.

I guess I should have explained that my tree gets pulled first into
drm-next, which then gets pulled by Linus.

BR,
-R

> But its fine now.
>
> --
> viresh
