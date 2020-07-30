Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607302335DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 17:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729387AbgG3Ppi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 11:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728452AbgG3Pph (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 11:45:37 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1194AC061574;
        Thu, 30 Jul 2020 08:45:37 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id n2so20294894edr.5;
        Thu, 30 Jul 2020 08:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e1J01Oczhd220RAym1LfngVA7OUijoix/GTLOnOq0wQ=;
        b=mYI2K30rokgxWE0w7UBhOkOYryaDcfDKVw60BHk8x3vYQ//HRCVaVYL2FU1hFijMfT
         8rwLHSUgRg6/W4AvbrMRanJPGCBILdYCXc9SWKUFPRFJy2DEbfn3agkQJvTbPEzwd5hq
         Z7xb4bbxbDLahiPDYZ4URSuz3MQj++4zVmHqM/tXhleHuX4XwfDzWsqa7a3ASLmbqdNw
         PQtvqxQ6Qv1RyiW63qtuPBNmZF21uFplD/0Yigy4RjgHLEr3/XZIdkL6GA62Vw7iCzbH
         ocQCE4wQEl0soppOd8kGhR6nr5YcIrnu8VKQ6oc7usO2cTRWz0ICuZi+gHH8fMD59RgR
         HGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e1J01Oczhd220RAym1LfngVA7OUijoix/GTLOnOq0wQ=;
        b=sXlybJHqzcOrGf0G1i8J882oE/PXqPuQGnJ0kxpsvyZA1gJcZX/25K8gNEN7hfjkZt
         oiQa55JDQfxg+qZHwD9vYLtx/CfdSYpysTTBWOeTtfXyf+QBHkjAA1tOSegoclfMM1pU
         KJF2TMrC5JkGvwZ2tJmSJqsTivzhLvszKjFWU3OTzxycd5hftKnX5X3/VXT3/4PT7w6n
         +NWog3J0NLrLo0OYhrwaur5ImoIwBg6NL427uX0WDFyjNmWZaz4t3Up2rxgD9Zms7ud4
         8qi2oBJD6guqPX4mbwwqyqMa3N7nuo40zFqKmLMhGrpJ+q7Zb9RrL6+ijzwl/5zo4W7w
         GFGQ==
X-Gm-Message-State: AOAM533w3hX8+0Gt5hFlrZ2jNicNPnyOrrdfW9c3Pqvf8O40Fq+tuZcT
        83o5tEcGcbGn0mM/noWnqvGA7Hk0XeQA6qcz2Ww=
X-Google-Smtp-Source: ABdhPJxJBzb6IrbCKjuOC0BujTWS0dRylwUyeXRe0DDUCUbkZVlP/EuIVuplkgjxRZfoLFnUlWJiDAFypFhpWjX6r1E=
X-Received: by 2002:a05:6402:1c10:: with SMTP id ck16mr3213692edb.151.1596123935735;
 Thu, 30 Jul 2020 08:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu> <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu> <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu> <20200730051045.jejrtkor3b32l2qe@vireshk-mac-ubuntu>
 <CAF6AEGuzff9+Wy4EHx0aDx1gBzSEGh--yqT5rnwLHp=U6amnyA@mail.gmail.com> <20200730153722.cnpg6n6tnmvjtuso@vireshk-mac-ubuntu>
In-Reply-To: <20200730153722.cnpg6n6tnmvjtuso@vireshk-mac-ubuntu>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 30 Jul 2020 08:46:16 -0700
Message-ID: <CAF6AEGs9=-0YBJpONaXf1wavU5ZpxhAQ19vfOn4JHby1zgPwpg@mail.gmail.com>
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

On Thu, Jul 30, 2020 at 8:37 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 30-07-20, 08:27, Rob Clark wrote:
> > Hmm, I've already sent my pull request to Dave, dropping the patch
> > would require force-push and sending a new PR.  Which I can do if Dave
> > prefers.  OTOH I guess it isn't the end of the world if the patch is
> > merged via two different trees.
>
> I don't think a patch can go via two trees, as that would have two sha
> keys for the same code.

it looks weird in the history, but other than that I think it is
fine.. at least I see it happen somewhat regularly with fixes in drm

> Though it is fine for a patch to go via two different trees if we make
> sure the same sha key is used for both.
>
> Will it be possible for you to provide a branch/tag of your branch
> that I can base stuff of ?

You could use https://gitlab.freedesktop.org/drm/msm/-/commits/msm-next/
(or the tag drm-msm-next-2020-07-29), which already has the OPP patch.
I've been trying to avoid force-pushing that because downstream trees
are already pulling from that.

BR,
-R
