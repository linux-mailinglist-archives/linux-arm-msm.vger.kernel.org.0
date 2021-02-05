Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F92310E9B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 18:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhBEPmH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 10:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233231AbhBEPbG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 10:31:06 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1B1C0613D6
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 09:13:13 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id h16so5448085qth.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 09:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XRLPSBu7GnfzbioyN2Rn36eiMaGh3kGmVcZSC5axiZU=;
        b=OpRllUoQoMbc8LvWsziwwfQEPKpWw+Oq6Y1wCA8VjTO6K8lrjlNDlWT9Po1aYZkxwA
         vrug9gc6zOWNCcJYYWas6xpOM+0+OXADX21ysb4pOFU9PjawfuhzfMJVu6zydM33vbtH
         AHp554PzizZcfekbVMSHZMXorvmtosxwmxNIuZs8Sd7bapUFZ7OJkvJPLBx7YZYQsV09
         HpGfP43qM0Lz+VbA19x8m6qiWZey/P7mqA5Z273FLJiVFg6MZ514x3UMWGuMKGaqSebh
         eVK1oAWD2K3xHSpveTjs6Ci49/TbV5685G8tLyWvTm2jFH1BqSu+LFSff8K2794g9bsw
         h1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XRLPSBu7GnfzbioyN2Rn36eiMaGh3kGmVcZSC5axiZU=;
        b=dQBX1voR+psCN1U5dIIlqsQmZGlF2+WOrBFH1cgD62QlGglmS3ejgD4GnGX6tZMBqc
         YvjC0jj4AbqjqwHoKUYSqFDmHq1FtxxS56hwwQ1f56adcXbXjC0IrV7K66bjVGqQ/4LL
         lsNrIMNuuxcn54iX9idZinIIKdOb3VcGsln4338/smKvwR9xCLcVs3xFs7trb0gpLFH8
         kmfScd8NzfWa4hu386x9n3bgY8XA+rrwEXvO8t4mHsTe3jt7pT2/aUZ9J+Xhddof1eBX
         R1suxW3RCixFEA0g8ab4x64zD274kxGl6xdLgWlEkktD0KjQ9/rr9VJ0Som9/KRSifoO
         BsaA==
X-Gm-Message-State: AOAM532C/O1PYergkml+oLhWJmFTzUp3cLITUCZpCZxzs5EekJQU6KYr
        VUC2Ut9iBAOvrq44Ao/Gf943hRvyZs3iqGgLd1BYCg==
X-Google-Smtp-Source: ABdhPJx5tt87aREmGHLaNT7Iq2UoJtK2ylHYFmU6SNEs2nwB+4/ET3YqwIfQ5LhMPM0jiNIr4HT0LDB1v/yUibEExdA=
X-Received: by 2002:ac8:4b51:: with SMTP id e17mr4965120qts.135.1612545192423;
 Fri, 05 Feb 2021 09:13:12 -0800 (PST)
MIME-Version: 1.0
References: <20210117013114.441973-1-dmitry.baryshkov@linaro.org> <161254496801.21053.820582580317270864.b4-ty@arm.com>
In-Reply-To: <161254496801.21053.820582580317270864.b4-ty@arm.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 5 Feb 2021 20:12:59 +0300
Message-ID: <CAA8EJpqbm1N5PER6+Uc76oRfgcdujLdFcyYAkT-DQAkke02NGw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: qcom: fix PCIe support on sm8250
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 5 Feb 2021 at 20:11, Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Sun, 17 Jan 2021 04:31:12 +0300, Dmitry Baryshkov wrote:
> > SM8250 platform requires additional clock to be enabled for PCIe to
> > function. In case it is disabled, PCIe access will result in IOMMU
> > timeouts. Add device tree binding and driver support for this clock.
> >
> > Canges since v4:
> >  - Remove QCOM_PCIE_2_7_0_MAX_CLOCKS define and has_sf_tbu variable.
> >
> > [...]
>
> Applied to pci/qcom, thanks!

Thank you!

>
> [1/2] dt-bindings: pci: qcom: Document ddrss_sf_tbu clock for sm8250
>       https://git.kernel.org/lpieralisi/pci/c/a8069a4831
> [2/2] PCI: qcom: add support for ddrss_sf_tbu clock
>       https://git.kernel.org/lpieralisi/pci/c/f5d48a3328

-- 
With best wishes
Dmitry
