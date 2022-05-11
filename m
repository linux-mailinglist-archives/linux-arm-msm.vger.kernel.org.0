Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD32523B97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 19:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244493AbiEKRd3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 13:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345602AbiEKRd2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 13:33:28 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4692317DB
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 10:33:27 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id i19so5440423eja.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 10:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RnK+iHlohBHk+K+PPu2H+s8rv61aQCy6hHkZXbGO1nI=;
        b=KSDW7EaxEEAox9ArNl/cG0HEgm3SfZ3GtqPNzdmMU8fD7w0C0oDZs3MEyYZ6yoLdeu
         yShjYNBWL3FgGR6nQX6mpwU5Yirj2LjWdpRYv8a8UxBup5whzO4smQ6iqzPoBSfjp87S
         7RlaOLEm4NKQMZeXbACuJSvVt1Ssh4WSaqYVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RnK+iHlohBHk+K+PPu2H+s8rv61aQCy6hHkZXbGO1nI=;
        b=1wuZg0NfOQxtzLrnBF10kVzy+staFk/Ya/TD/OFQ5c1dmPPILdG7QRafcIjls3Gyi+
         Sekk8Hk7tlJhDfMTgAspApr8pTJwmi8D+Bch1qKOrLUtK/f6QTvSfR8vZZyByLCZIS3w
         coiBifLNU2DKaVGCg3svu1zWMRYtBQfMFFYXhjcIx2kJdtI+NvNIJ62Mtokk4pAPSpUY
         VSVs74pWcr5j6ec58kMrlBmOS59hYgFJMREs1h2Usofwam/5QvYS35GPsuylGNgeGr3Y
         5HtKXpf4tAjEQrTY7t2RM3U+k1BeeLFJ0MApoap11T4KUTdYLVVvLGjnl1E+OBSxL8pH
         cx2A==
X-Gm-Message-State: AOAM533/0YAiZ8A+TvYBKOp71U9jGja24Xwb/z39k473qYOmGciNSZaQ
        jO81UnCh2mQt7p6ZCcLBPTpI3qw+TrQF5HEN5Po=
X-Google-Smtp-Source: ABdhPJzaS4OGgp/nUqO4YBR9bOi2Z2IPcQgo4WjpoWifH2duOzEyHZhmi5WPNHfvoegfHNthi2LR6A==
X-Received: by 2002:a17:907:9720:b0:6f4:31d4:925f with SMTP id jg32-20020a170907972000b006f431d4925fmr25892256ejc.658.1652290405542;
        Wed, 11 May 2022 10:33:25 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id g19-20020a170906521300b006f3ef214e7bsm1190113ejm.225.2022.05.11.10.33.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 10:33:24 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id q20so1645946wmq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 10:33:22 -0700 (PDT)
X-Received: by 2002:a1c:4c06:0:b0:394:65c4:bd03 with SMTP id
 z6-20020a1c4c06000000b0039465c4bd03mr6060279wmf.8.1652290402369; Wed, 11 May
 2022 10:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com> <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
In-Reply-To: <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 11 May 2022 10:33:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
Message-ID: <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
To:     Dave Airlie <airlied@gmail.com>
Cc:     Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 10, 2022 at 10:07 PM Dave Airlie <airlied@gmail.com> wrote:
>
> > And use it to store expectations about what the drm/msm driver is
> > supposed to pass in the IGT test suite.
>
> I wanted to loop in Linus/Greg to see if there are any issues raised
> by adding CI results file to the tree in their minds, or if any other
> subsystem has done this already, and it's all fine.
>
> I think this is a good thing after our Mesa experience, but Mesa has a
> lot tighter integration here, so I want to get some more opinions
> outside the group.

Honestly, my immediate reaction is that I think it might be ok, but

 (a) are these things going to absolutely balloon over time?

 (b) should these not be separated out?

Those two issues kind of interact.

If it's a small and targeted test-suite, by all means keep it in the
kernel, but why not make it part of "tools/testing/selftests"

But if people expect this to balloon and we end up having megabytes of
test output, then I really think it should be a separate git tree.

A diffstat like this:

>  7 files changed, 791 insertions(+)

is not a problem at all. But I get the feeling that this is just the
tip of the iceberg, and people will want to not just have the result
files, but start adding actual *input* files that may be largely
automated stuff and may be tens of megabytes in size.

Because the result files on their own aren't really self-contained,
and then people will want to keep them in sync with the test-files
themselves, and start adding those, and now it *really* is likely very
unwieldy.

Or if that doesn't happen, and the actual input test files stay in a
separate CI repo, and then you end up having random coherency issues
with that CI repo, and it all gets to be either horribly messy, or the
result files in the kernel end up really stale.

So honestly, I personally don't see a good end result here.  This
particular small patch? *This* one looks fine to me, except I really
think tools/testing/selftests/gpu would be a much more logical place
for it.

But I don't see a way forward that is sane.

Can somebody argue otherwise?

            Linus
