Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF443266DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 19:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhBZSYW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 13:24:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhBZSYW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 13:24:22 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE718C061574;
        Fri, 26 Feb 2021 10:23:41 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id k66so8631587wmf.1;
        Fri, 26 Feb 2021 10:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+if41+OOIdTEnjXmNHOorURwzXxyDnY3DpTEWUu3DAU=;
        b=Tqtnj1MFHSpc1FQCK2N/CCWbj9CtLdzVblqJKfGWGJ5IUfajvAkCXyiEqAYVCxHNVL
         uZO8z/3ZVDrUjGqZG0qInL91G1v7+ppWG1Gk4KXHSAgbxpEy2jlBbp4HTUC5v4MIAjTn
         fTFtbOrC+rABvac0fwLi8Bd2Oj4dZR0laGAdgLZ/DYei1UYBgYnG1ugMCghuVN2LLp8F
         dEE46iC3ez7ye+881OPToutE8LG1fXjr3Qmk8Ky0p+sYeKElX8gPyPzBkDc0E2xme+8y
         FylDUQzKOtxlAAhX3hK3erL0W4+JR5xjXg1HG6faM7KC8ys/GJ+KwA2qokx3q/6SkusN
         RqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+if41+OOIdTEnjXmNHOorURwzXxyDnY3DpTEWUu3DAU=;
        b=nCCDpJej+ndNkGSEZolLffJVqVHbKQSJmwYgiG6DgxazKJA6LUWHciAOJY28ZDV60I
         7N5VflMMx19HbAymVjwCC9S5lmasYy++sQiy9b/isdkCVyeaFaf/yS6/LNVIO/SkT5B6
         7qX2O6vmUj4NC9JOa3+Rftwyb8op9B9dSKQGfuuYjTJP0GsQ4rq97sm2/hkKBm4VySYc
         Q5CVxnkMljyku2iAvx8xEQ411QcSEtH1rMkp7zzHEGCmmgRpxZJdfm40mTUD+3568p1S
         X2oIK+VeRDxTP53fVW3JzHyOTAJRX58KKp2DQBbMKRsUdzXHFDHKuxmEwrbNq3c84Moe
         0HWA==
X-Gm-Message-State: AOAM532POlBKzBmBNZs9lfZq1CcmktNIj4mtCsBfnoVcK8XpOcN8e7Io
        i/MQ6A3kpV47d2oMwv40Gv1YXksrsMmSv57c3Qc=
X-Google-Smtp-Source: ABdhPJxgrMe0mZZyxBO0ola6cjhlCi4j2IxQKxy4A06JD5sd+FlxIa4WTLYGrTX1znn9Z+cNAcbd5kGORqMGIWA9SlE=
X-Received: by 2002:a05:600c:cc:: with SMTP id u12mr4204438wmm.49.1614363820563;
 Fri, 26 Feb 2021 10:23:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1614332994.git.saiprakash.ranjan@codeaurora.org>
 <c607d71eb0fe507c8b83cc0ea9b393777f22149a.1614332994.git.saiprakash.ranjan@codeaurora.org>
 <YDku5PFQZetP4iG8@builder.lan>
In-Reply-To: <YDku5PFQZetP4iG8@builder.lan>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 26 Feb 2021 10:23:28 -0800
Message-ID: <CAF6AEGvJF19JA5hNps37urMrF5r03y90XgvO4FtT6wFPD6UZcA@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific
 impl earlier
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 26, 2021 at 9:24 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 26 Feb 03:55 CST 2021, Sai Prakash Ranjan wrote:
>
> > Adreno(GPU) SMMU and APSS(Application Processor SubSystem) SMMU
> > both implement "arm,mmu-500" in some QTI SoCs and to run through
> > adreno smmu specific implementation such as enabling split pagetables
> > support, we need to match the "qcom,adreno-smmu" compatible first
> > before apss smmu or else we will be running apps smmu implementation
> > for adreno smmu and the additional features for adreno smmu is never
> > set. For ex: we have "qcom,sc7280-smmu-500" compatible for both apps
> > and adreno smmu implementing "arm,mmu-500", so the adreno smmu
> > implementation is never reached because the current sequence checks
> > for apps smmu compatible(qcom,sc7280-smmu-500) first and runs that
> > specific impl and we never reach adreno smmu specific implementation.
> >
>
> So you're saying that you have a single SMMU instance that's compatible
> with both an entry in qcom_smmu_impl_of_match[] and "qcom,adreno-smmu"?
>
> Per your proposed change we will pick the adreno ops _only_ for this
> component, essentially disabling the non-Adreno quirks selected by the
> qcom impl. As such keeping the non-adreno compatible in the
> qcom_smmu_impl_init[] seems to only serve to obfuscate the situation.
>
> Don't we somehow need the combined set of quirks? (At least if we're
> running this with a standard UEFI based boot flow?)
>

are you thinking of the apps-smmu handover of display context bank?
That shouldn't change, the only thing that changes is that gpu-smmu
becomes an mmu-500, whereas previously only apps-smmu was..

BR,
-R
