Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DC323354C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 17:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728910AbgG3P1B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 11:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgG3P1A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 11:27:00 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00980C061574;
        Thu, 30 Jul 2020 08:26:59 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id jp10so1812127ejb.0;
        Thu, 30 Jul 2020 08:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sRBXteCx3iMxzf+5YFGiaHOZbhEeLZMnPLZMpPhN9j0=;
        b=mxpwHgVNXl7Gw3UA+uuDLTz10xKua5fw6rE++7C7vRni0IIjZ6gS+ZeYIhLWXHy3y/
         vPMbGrVFEnb64IJ7Ca3gFuoT/t+e55dj9KYyxPjvaL0dq/2g+9XJh2GnXlC0ov5WrW4r
         Rvqv8Y35vB6EitcbM5ZUZxtNCnPnSsi+YFVcw1HHySKymFPJWeEa6sPbPdpt7WQI5ntw
         79LeYQnXgJfuNWyhCcD0m8x5aI8aNo5PdMzhFVVC72vY5I6n+escxqqLBEbmJDJjhOQO
         3MkVcanyh+4vYCe59GpVScPWSVS9yuFf0SgzR6ow2vry8MEcMN6ZbpjL2kclDSMFNJnZ
         Is8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sRBXteCx3iMxzf+5YFGiaHOZbhEeLZMnPLZMpPhN9j0=;
        b=AYYsYbelojyUQDED24MDNwkXIN4YnMHTTvHCGvYsHMekhgzoqT0PqPi24whMce8oNq
         vnN4OpWriADP/l6USfCQpXuXra7Nc+3GjNFPc2Ja3WM8BdzDXWWc0tpBE/MkZZ1dTBxm
         WNoUprDq2f5tHzk4msrpeE/t9BtlqiJMP7X2FrgDMb4O1oiv3wH1iOJ5IU6hbVLFAhG/
         hnB9zP0WyJoHNjYOjBacq1fc17QnhrARjSCt9GF5f7D1I4D9zr8ERDKjStQdzSyGQoSk
         pv1qkG+NsSQY+j1RrNpvpZoPZuBvkY6Ec6PWnNx40z9tKMb7w3M2+1yPRuYNjLFR8R0e
         K9EA==
X-Gm-Message-State: AOAM530wMvYd0rKRstQutmn40ZbsjlTz5jpYZPYuE3SMihPOhSTQwDP9
        kTgnPbD5Rgyi5VVDwW9X6Jj8v7snL002dFiYaQc=
X-Google-Smtp-Source: ABdhPJyj/3mUFNZJ5e36idWlRRi684to1k7BBbmv7VGuv0mgty12MhPpHISg9EXy+G3LWVfB29zmAAC02OJYJvXOXxw=
X-Received: by 2002:a17:906:328d:: with SMTP id 13mr3192634ejw.71.1596122818624;
 Thu, 30 Jul 2020 08:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu> <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu> <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu> <20200730051045.jejrtkor3b32l2qe@vireshk-mac-ubuntu>
In-Reply-To: <20200730051045.jejrtkor3b32l2qe@vireshk-mac-ubuntu>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 30 Jul 2020 08:27:39 -0700
Message-ID: <CAF6AEGuzff9+Wy4EHx0aDx1gBzSEGh--yqT5rnwLHp=U6amnyA@mail.gmail.com>
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

On Wed, Jul 29, 2020 at 10:10 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 22-07-20, 11:00, Viresh Kumar wrote:
> > On 21-07-20, 07:28, Rob Clark wrote:
> > > With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
> > > tree and merge it via msm-next -> drm-next -> linus
> >
> > I wanted to send it via my tree, but its okay. Pick this patch from
> > linux-next and add my Ack, I will drop it after that.
> >
> > a8351c12c6c7 OPP: Add and export helper to set bandwidth
>
> Oops, sorry for the trouble but this needs to go via my tree only :(
>
> I maintain two different branches, one for OPP and another one for
> cpufreq. There was no dependency within the OPP branch and so I
> dropped it that day and asked you to take it.
>
> But when I tried to send a pull request today I realised that one of
> the qcom patches in the cpufreq branch is dependent on it and I need
> to keep this patch in my tree.

Hmm, I've already sent my pull request to Dave, dropping the patch
would require force-push and sending a new PR.  Which I can do if Dave
prefers.  OTOH I guess it isn't the end of the world if the patch is
merged via two different trees.

BR,
-R
