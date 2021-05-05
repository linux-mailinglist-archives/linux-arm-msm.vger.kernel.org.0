Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4C5373E15
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 17:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbhEEPFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 11:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbhEEPFm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 11:05:42 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FB4C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 08:04:45 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id d4so2209989wru.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Gi74r6bWKra3O9s/pxea0QXB4uKnGjkF4C2eurOB6E=;
        b=nLiMdnzMk+BC7w/NuLCs1qwRWMroUT6TmMNPUVWnC9KL/r2d5Qk/byRPuOaJ7jZJZs
         VgBpYoWYBneNdYZ6PY+a4m6ELV0ZpDnLOqDoRVymyealRnAXEHeKiTFXsBrOFksMXe/P
         MOb4AOB77V6rFX4XkbZs2J+bQ7wX4PBndAIGfuFjHfBnhdIQhnrmQi0MLJ8S63oOwPTW
         vAAZVAA0HeqP59+dlluj903vCeKMBeR8wsseHrVSZcO+FxYQWVvzYHrYqJfvVth5enW1
         LbgkQv9p8L1exSd7nprCV6VJ+UheC4PeTH195X7DUiwzIZNUcxeKFWcLc4hAWyyT3EJh
         fggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Gi74r6bWKra3O9s/pxea0QXB4uKnGjkF4C2eurOB6E=;
        b=kqAe7wkb4y7I0BcgryXkD+I77xcn7o5i8KVrmtrl8qJvNO9XJKcIriWg2JlzpqPk0i
         D6FzrWFTh5nXU0XirtBxJfLZwzYQ993wg7iq4P50Vc31xTieBUEh2lnuSEQiEl1dHRef
         VpZAqZU1Fwazm1kKCPu5AbQT3D85GFJ2y5E/OMs8J8sAR7z29WPAhBc0DxdQ/0pum6KF
         c1FPt+dUfmhpiGXVBrY/fF89XkIMGpw0jMZTx40z4eFPrNYZv3QvGgSNsjpY77sOGu61
         BSwMoUQ1w+4/K6Ktw2QYYD1bbcq37B1kgSdKG0BH/0Dqs/Gj1kDe58oBoja9Owv9ezam
         6k8A==
X-Gm-Message-State: AOAM5328bbvbho5PHfmLMWsTI4nWlJnSv8PPxPoUGeABwQwEMeslCqiK
        1K4+82goySenx5hYx53GNBCTm8+kEiwQ7OCNZug=
X-Google-Smtp-Source: ABdhPJzxdy+BRtggiZ65xQfdf0Xjz5Pml6ymKZSSgYvYNYJ73wVY2GQ6RFW8wj0zD/FoJW6vHG/Ev8STeG7i4JNnO3U=
X-Received: by 2002:adf:f74d:: with SMTP id z13mr39054140wrp.147.1620227084462;
 Wed, 05 May 2021 08:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLXsLcA=r1x6hXxLx3aVA-8=RG5qd+yj+sKEFiaWPUzkSA@mail.gmail.com>
In-Reply-To: <CALAqxLXsLcA=r1x6hXxLx3aVA-8=RG5qd+yj+sKEFiaWPUzkSA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 5 May 2021 08:08:17 -0700
Message-ID: <CAF6AEGt5AZ4jPO5=qUy-JhDCj1D5oD9nboNDDiJFnFDmWWvOaA@mail.gmail.com>
Subject: Re: Regression: arm64: dts: sdm845-db845c: make firmware filenames
 follow linux-firmware
To:     John Stultz <john.stultz@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 4, 2021 at 11:37 PM John Stultz <john.stultz@linaro.org> wrote:
>
> Hey Dmitry, Bjorn,
>   I wanted to raise a regression I caught in the merge window on db845c.
>
> I was seeing troubles with audio and while there are a few other
> pending fixes needed, they did not seem to work for me. So I spent
> some time bisecting things down and found the problematic commit was
> 7443ff06da45 ("arm64: dts: sdm845-db845c: make firmware filenames
> follow linux-firmware").
>
> It seems for systems using the old firmware filenames, this will break
> dependent devices on adsp_pas and cdsp_pas nodes.
>
> Now, obviously updating the firmware files in userland should resolve
> this, but it adds the complexity that we can't just replace the
> firmware files because older LTS kernels will look for the old names,
> while newer kernels will look for the new names. We can add both files
> to the system images, but then there is some confusion on which
> version of the firmware files are being used where.
>
> So yes, we should align with linux-firmware file names, but I think
> more care is needed for this sort of thing as it has the potential to
> break folks, and this isn't the first time around we've had similar
> firmware name changes break us.
>
> So I'm working on fixing this by including both filenames in userland,
> so we probably don't need a revert here, but *please* maybe take more
> care on this sort of change.
>

It is rather more difficult than you think, because if you try the
wrong path you could end up waiting with a timeout.. we have
shenanigans to work around that for gpu fw in drm/msm to avoid this
sort of regression with people using downstream firmware trees.  I'd
like to rip that out at some point, but I suppose doing so would be
problematic for folks doing upstream kernel on android devices.

Maybe there is some way to add support to simultaneously
request_firmware for two different paths at the same time.. not sure
how that would work from the PoV of the usermode helper path.

It really is a lot of pain to deal with downstream firmware layout..

BR,
-R
