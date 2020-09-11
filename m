Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0DFD266323
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgIKQLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbgIKQKy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 12:10:54 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0E6C061573
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 09:10:53 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e11so4402963wme.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DbxEUQps6vESScXmyaIzM2lV4nvnmCDf4+bKC4mI+8E=;
        b=QhEUrtgWKj+fZDMyKLwE/BKdNRzvaTQpARmk62ty0kGcVZPcAPywlm22mc9BY1YG2B
         naOPmTBAF/1xl/fT0oV4GdOE67fzk7jmY3lvaE51nNC69qu9CLGLN8DA8nnA+9ifurXo
         geXkXHDs/iwILRS0Lzr1OIGz/k1sFbuM45shEKHEjPHiKkhzKj0a53sglfQ+fKH1kjpv
         4AHTDdt/P4cydao/Lj/hy09u8HvDO982rfjxJfMS54mW6LG4WyGuwx618Hx/kR61E+z1
         ba7Mbo+1qhX1OOYxxWYCefHJwf71oQXGwvjanwXQajdTADvqIc4Q8XCkOpxDlJcgDxUZ
         JvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DbxEUQps6vESScXmyaIzM2lV4nvnmCDf4+bKC4mI+8E=;
        b=O0cQW786UQgV+AhiLwA+rUpMXIGyY88uZlxUyh/ajsK94/RbjrKaEdpZHJbvYdfq0Q
         KvTmuUU2Iuml3n0Ws/AMtQXS+cRGsAy3cpvXYELOC81AOVgHJ/20aIv93LKgBD5KOB8z
         APUYpIDP+m0buX8wSg/wXGeZyCd97LP+NS9qHXAYJNK/nYujal43kFCpJz24GF/6jL0w
         X9E1ML9qmnm0Tmw/VAX2GQ6RkxYIKB4Riitv5og53zt1vahJm2uEm1WtDtNukRwCYnqa
         qeJSYPEn3h3/LOoqVAuVssQws+wkE/LWWeWufpT1s/tlMlsZrUGYjTh17XWIv0DNn8Vd
         Y2YA==
X-Gm-Message-State: AOAM5313rKs7f3pFDltvPupwZBFzjf2CGhWktimhzJfce7ofd4UKf+AX
        ojHtPtrkm9+8GaJgB/3KR9Z35P4kifEykE+fir0zEQ==
X-Google-Smtp-Source: ABdhPJwpsy55MicdcbSdsk7lZoPbb7vZsk90rfIo7W28Aj3HC04QgM46znERfjCsfJQ+KWY8OwY9zlQuMuRiAaiBGyc=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr2898135wmh.152.1599840652329;
 Fri, 11 Sep 2020 09:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Fri, 11 Sep 2020 21:40:16 +0530
Message-ID: <CAMi1Hd2CFjQLoXTSuo9wUWWO-hNvuvZr_PffS1NfgP-6agWDOA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] iommu/arm-smmu: Support maintaining bootloader mappings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu <iommu@lists.linux-foundation.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 4 Sep 2020 at 21:25, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
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

Boot tested the series on Xiaomi Poco F1 phone (sdm845)

Tested-by: Amit Pundir <amit.pundir@linaro.org>

> Bjorn Andersson (8):
>   iommu/arm-smmu: Refactor context bank allocation
>   iommu/arm-smmu: Delay modifying domain during init
>   iommu/arm-smmu: Consult context bank allocator for identify domains
>   iommu/arm-smmu-qcom: Emulate bypass by using context banks
>   iommu/arm-smmu-qcom: Consistently initialize stream mappings
>   iommu/arm-smmu: Add impl hook for inherit boot mappings
>   iommu/arm-smmu: Provide helper for allocating identity domain
>   iommu/arm-smmu-qcom: Setup identity domain for boot mappings
>
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 111 ++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 122 ++++++++++++++-------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  14 ++-
>  3 files changed, 205 insertions(+), 42 deletions(-)
>
> --
> 2.28.0
>
