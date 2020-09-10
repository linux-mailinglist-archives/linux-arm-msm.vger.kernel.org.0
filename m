Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D44426553F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 00:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgIJW4x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 18:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgIJW4u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 18:56:50 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA157C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 15:56:49 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id m7so6140542oie.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 15:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2NDnGAYyaiWbTVVt3qIqOBgyLmtaJBXAa8jclQOHEI=;
        b=PpcMp6z0WjujTy9v6LFo87bHlcmtFD9BhxCTh5vwkEYxcNGtKxm6Le+6WK3M3fyls0
         YZPjLgOexOb74fEnFQYJNAnFz6n96Q/JpujRhI2K9oHIDHvDJjp0PcPSlRSD36YsVp1K
         /7NQX3ZNIlu4MOi1k6IKVfZqz0kPsiwMhW2amKWRWjG210ceyHApHTY4DEwT8NyeP5G0
         B3trw01wLPM6kXTWq8wla2ERqv+Z327xbTglH5a+vxAZ7OPruKtYNAccc/D4U9bPd6rC
         NVdqL6cT/kntQBXUYJYCbr40reULvNmoS2jBNQex+zSlFSxkOeblLuZk6mmqs2yVMMBo
         cBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2NDnGAYyaiWbTVVt3qIqOBgyLmtaJBXAa8jclQOHEI=;
        b=CpL7gn5WpM2yERLxiRqVHGDXe33nDJe3j5ZfzEiblXRFmYfZG2pzPUbLw8jDBXsyDF
         +EQncQoSLIBZyZYWgPRaKMVQekpUN0R0iwdUz+m6IX9NNzDFEdMGQcf110KUCGkoiHoQ
         mkSjPot0qesPOn/7QnV/Im4tb7JRx1i5LAFaEqYF1dWgisNopWsSU0OSz5ijuX8BAYxj
         gKoJiKhPmQ4LASVsdiMmwPfm5zaHwhTwYhB8VVPdnifpgG6ac87eSVsfLsA5Wpex4u5B
         CN2l30B4cGFgEStMgWGqt/QskzUSYWesjFqKDKLsxMBi5y2C3x8oqsiUnQ04W4OpsQqh
         uUbA==
X-Gm-Message-State: AOAM532Dp1s0IGl+R7byZRH4HB/E3WboLa8A0AOOou7eS1TnP/QgmcAu
        jijq1YHYzQggrIiEUU2FbaN3820uIeLkg1LytUNrbfFHDV905Q==
X-Google-Smtp-Source: ABdhPJxnGAvmNMVx3acHPlZF4Rm6WnepSIlFzFBQ06ZpRZx2DZqOEv4RG+mSRfbwXJEELPBvFhkUL1VGumWX5pvvyBM=
X-Received: by 2002:aca:913:: with SMTP id 19mr1392259oij.169.1599778609267;
 Thu, 10 Sep 2020 15:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 10 Sep 2020 15:56:38 -0700
Message-ID: <CALAqxLU6pUFZuB=TXA8_Oke0njKHnrJagXkT2nQ4ZB7vAnJXOQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] iommu/arm-smmu: Support maintaining bootloader mappings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 4, 2020 at 8:56 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Based on previous attempts and discussions this is the latest attempt at
> inheriting stream mappings set up by the bootloader, for e.g. boot splash or
> efifb.
>
> Per Will's request this builds on the work by Jordan and Rob for the Adreno
> SMMU support. It applies cleanly ontop of v16 of their series, which can be
> found at
> https://lore.kernel.org/linux-arm-msm/20200901164707.2645413-1-robdclark@gmail.com/
>

Apologies, I just found this today. I've pulled your patches and Rob's
into my own tree here:
  https://git.linaro.org/people/john.stultz/android-dev.git/log/?h=dev/db845c-mainline-WIP

And they all work fine on the db845c.

So for your whole series:
Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
