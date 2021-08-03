Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D1A3DE3D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 03:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232891AbhHCBK1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 21:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232768AbhHCBK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 21:10:27 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D96C06175F;
        Mon,  2 Aug 2021 18:10:13 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id b11so18103104wrx.6;
        Mon, 02 Aug 2021 18:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cwfRDlhi4nw1htqUjvNDRczeQ0/VaPFUSYWqPgi8u+Y=;
        b=ZweXXMfeU0KJi/8/pjiXrS3//QcwgI4bRE1dTQEC/En+mp2Fzl5ZY5RqvnYeRYqj18
         7eOcAgD8yuDaoid5lmVArFNy5UD2/hYtayFhdpZX3dWx6ife6WXfdAZnyvHcumgauD6J
         6Kxyedhg5BBMfGDZlwlnTaDGW6eetSAvcsYjRSDc3hoaARyBshyf8C7WepZ4Yq7pYk+y
         8jyngsKBYLoHaCXHkNTDKU5PVa9kjA5uXqf9duY0bwCxJQKh9PUQ78xmpmlslphdreR9
         ROjKMFRs95AkcIoGjjzEd+R6u8C3+AzfQclC6WihqLRMkywHPiV0qR4sskcRZhwJPhOv
         4Hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cwfRDlhi4nw1htqUjvNDRczeQ0/VaPFUSYWqPgi8u+Y=;
        b=mp4gU0HycMZdXeReFwqApom29PwWPMdAmj46Q2s7b60cE/7zrWIEDPccR5dd1C4APF
         GGrbyUQwAarP4rtkglPbHbc8aJ/Ra4kpItjage6dBwMpD3tOKnneRc5SC2aSrykdZ/H6
         SH+LFhs0MgMG2jfzW2PbTunJRUiPrgTrnX+lCsLN9k4C5Fz30LbK8JHHy8pge87sfAWd
         eAMji08ltrTOQqAaB8IHsAhf3jv6Q/NjQKE957mKLWG99dW06fj+HrTALoM8bat2oEy7
         8ZekpwsUSLxlMOlZRKwBpphL/nhxzsajhhlo/G5eCwmdqhK4dCk/zcSvN/L9Md9OjPLl
         s+HA==
X-Gm-Message-State: AOAM530XutqCc/EQICp05oSBvEFzAqw8l5dckMA9TIZmB5Hey/ApbBYN
        kuwzwA4lkUi089boBdJx/l7ANqRp+p3aPKfEMZA=
X-Google-Smtp-Source: ABdhPJwLpmDvUbuYbcJzZuoOee6sTseIK6hg03LmLgFOFqG4+uh1U7lqcT3Qttal7+3I2dABf/jzbXRnAo/kilcgfRM=
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr19403081wrm.327.1627953011815;
 Mon, 02 Aug 2021 18:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210727093322.13202-1-saiprakash.ranjan@codeaurora.org> <20210802161206.GA29168@willie-the-truck>
In-Reply-To: <20210802161206.GA29168@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 2 Aug 2021 18:14:25 -0700
Message-ID: <CAF6AEGueDncLYzw9ic=2wkfidOBcG_HcquH7K0ya9xEfY5oteg@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: Add clk_bulk_{prepare/unprepare} to
 system pm callbacks
To:     Will Deacon <will@kernel.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        srimuc <srimuc@codeaurora.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 2, 2021 at 9:12 AM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Jul 27, 2021 at 03:03:22PM +0530, Sai Prakash Ranjan wrote:
> > Some clocks for SMMU can have parent as XO such as gpu_cc_hub_cx_int_clk
> > of GPU SMMU in QTI SC7280 SoC and in order to enter deep sleep states in
> > such cases, we would need to drop the XO clock vote in unprepare call and
> > this unprepare callback for XO is in RPMh (Resource Power Manager-Hardened)
> > clock driver which controls RPMh managed clock resources for new QTI SoCs
> > and is a blocking call.
> >
> > Given we cannot have a sleeping calls such as clk_bulk_prepare() and
> > clk_bulk_unprepare() in arm-smmu runtime pm callbacks since the iommu
> > operations like map and unmap can be in atomic context and are in fast
> > path, add this prepare and unprepare call to drop the XO vote only for
> > system pm callbacks since it is not a fast path and we expect the system
> > to enter deep sleep states with system pm as opposed to runtime pm.
> >
> > This is a similar sequence of clock requests (prepare,enable and
> > disable,unprepare) in arm-smmu probe and remove.
> >
> > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > Co-developed-by: Rajendra Nayak <rnayak@codeaurora.org>
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
>
> [+Rob]
>
> How does this work with that funny GPU which writes to the SMMU registers
> directly? Does the SMMU need to remain independently clocked for that to
> work or is it all in the same clock domain?

AFAIU the device_link stuff should keep the SMMU clocked as long as
the GPU is alive, so I think this should work out ok.. ie. the SMMU
won't suspend while the GPU is not suspended.

BR,
-R


> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > index d3c6f54110a5..9561ba4c5d39 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -2277,6 +2277,13 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
> >
> >  static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
> >  {
> > +     int ret;
> > +     struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> > +
> > +     ret = clk_bulk_prepare(smmu->num_clks, smmu->clks);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (pm_runtime_suspended(dev))
> >               return 0;
>
> If we subsequently fail to enable the clks in arm_smmu_runtime_resume()
> should we unprepare them again?
>
> Will
>
> > @@ -2285,10 +2292,19 @@ static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
> >
> >  static int __maybe_unused arm_smmu_pm_suspend(struct device *dev)
> >  {
> > +     int ret = 0;
> > +     struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> > +
> >       if (pm_runtime_suspended(dev))
> > -             return 0;
> > +             goto clk_unprepare;
> >
> > -     return arm_smmu_runtime_suspend(dev);
> > +     ret = arm_smmu_runtime_suspend(dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +clk_unprepare:
> > +     clk_bulk_unprepare(smmu->num_clks, smmu->clks);
> > +     return ret;
> >  }
> >
> >  static const struct dev_pm_ops arm_smmu_pm_ops = {
> > --
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > of Code Aurora Forum, hosted by The Linux Foundation
> >
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
