Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D953233ABB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 23:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730663AbgG3VZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 17:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730711AbgG3VZ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 17:25:28 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D80C061574;
        Thu, 30 Jul 2020 14:25:28 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id di22so13822020edb.12;
        Thu, 30 Jul 2020 14:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wawmnCkVtSyffuOwOyR8jlmGJuUCenrTBxUUEtQt514=;
        b=EBuP8Sph1VcJ11/DEK8U8Vw5lkys5pkoPHdRkZ4qSn04EMNMYTDwn/188gwovds3b0
         OxdeWFiNycKygBIF6EbR439Ba0O/evJ4dO/OFAOCDCXGWdnWyuTEaEQ8pxWkgDQsDT49
         ixEd1m7vu0YdVDd23vJduP196itvUII6BXff9dn2zs9UWBlMCs1DExy4Lg6ONdto1EAN
         xJAHxGd85yfCUYW4BRAtUxIHQjFb/fYkR1sMz+pqTluqvHpLxXQjuP6uqQWzj/TQv2iK
         TWOlPm33HCVveFBueimXJMG8cza2wAsC2GHxv1npabeVJskgo2cNIa+B/RqtY2jKX2l+
         ZY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wawmnCkVtSyffuOwOyR8jlmGJuUCenrTBxUUEtQt514=;
        b=j1yam8CvRgypQq7LgrOZ5mCuIp14uHLRBA+fC5lZjQI2UDBib/AuITE72wVs1EXSar
         UEAwNhUge7q+BsgZyjo0ifXs4nOIdFtiyIBzrqoxcbdC9r3kp+nygx/nlB4dhi22t9hM
         i4mkXBdaYP+AMoyjw3u/bADzW1IwBROu3nt59eHk/a5jshKbOkec8fJJkwDEiCm9QGel
         MA7gxctDTSUUf/q8ZPfTFcVQlMSSfTLz99mRe5Qd2RrRHSpwSc7MjuLE75FzUXimqCXM
         3aa8+OapYhVs8QA8A86NIDG5yMQSnFegA6TmNfYv7E0VrekPQ36Q+l0Ruf6h3hmoP4u6
         YBhg==
X-Gm-Message-State: AOAM5327asKtEiVE6aQjAEEhn37QxnkSH33FCzaQYGycgUla46SQzpud
        NhuIaVMNOx76kFGYdeBxri34WBKg/Ufe3sOT9qs=
X-Google-Smtp-Source: ABdhPJy1pelESLieAiXYCo+JBitUpkLV1nPOYhvQ2AwIzIy7aygRU3kvbY5RKU7cSN8I5DNmYQdtC1A9nfBZJYuxf0o=
X-Received: by 2002:a50:fd19:: with SMTP id i25mr976597eds.101.1596144326878;
 Thu, 30 Jul 2020 14:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu> <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu> <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu> <20200730051045.jejrtkor3b32l2qe@vireshk-mac-ubuntu>
 <CAF6AEGuzff9+Wy4EHx0aDx1gBzSEGh--yqT5rnwLHp=U6amnyA@mail.gmail.com> <20200730153722.cnpg6n6tnmvjtuso@vireshk-mac-ubuntu>
In-Reply-To: <20200730153722.cnpg6n6tnmvjtuso@vireshk-mac-ubuntu>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 30 Jul 2020 14:26:08 -0700
Message-ID: <CAF6AEGv-e5KdbcDcst=y+h-uhDa4sKKEMoGuA88bvZ_1i46RLQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Dave Airlie <airlied@gmail.com>
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
        Bjorn Andersson <bjorn.andersson@linaro.org>
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
>
> Though it is fine for a patch to go via two different trees if we make
> sure the same sha key is used for both.
>
> Will it be possible for you to provide a branch/tag of your branch
> that I can base stuff of ?
>

Ok, I sent a v2 pull req that dropped the OPP patch.  Both are tagged
so Dave can use either version, so I guess you two can coordinate this

BR,
-R
