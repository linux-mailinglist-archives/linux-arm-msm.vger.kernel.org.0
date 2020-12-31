Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83362E7FF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 13:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgLaMjD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 07:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbgLaMjC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 07:39:02 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D677C0617A0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 04:38:21 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id j20so17923311otq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 04:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8fidVqimP5oLeoM0vJSpH6fCyHQZj21WkUFk0MwgeNQ=;
        b=oLCiEBEZu98SfgKQb6gjuHmkiLq9Q/JThumX8OVTJw//mfFucSVklfg5miBYKvTsO9
         j/RIxqNZl2BNO2+k4qm5pHSWbwBMLan0oJ6NP0FhNfn4yjE+l3pQtLYz82g+yqpDRdb/
         hg143UPaB5t1Qtlzeg8EBhWl77NH2khbk9J0Mj3+35j/FQKBf/wAo5TPJ2TGva62AcOx
         CbEG0fcXZNGBIkcBjgHDQxtPseKRLpPoawutWZoUQNO2hJtq7Lgwb0cD4CViXWcIwqVs
         BTKZ/VH/h4oLHlBLDNvWYODuBkoy2FnF8wHrHcpVnJIznAL0Ll3cuOzROvr4i5M1Fqv0
         YLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8fidVqimP5oLeoM0vJSpH6fCyHQZj21WkUFk0MwgeNQ=;
        b=sJsddDruw/O14xhrKgtEFiAzX/EGpcBSOo7hFe8vTtwF6+uXUCrVG7y0RejLWjut+0
         JWaC2GZ0NxYFyPbzpAFhk1FLqsU38WZfX3tPXvMSUvIdmRVv/w+mnplJI/T9SYesKyuK
         S+X/OBy4oTe3MY93TQmgvC0qkXXp7nHAtG61aNbq1AIFSJy7byEirbE1WSx8WOxZk/Vw
         4RJXOlcwta4txjYkSvv2DejMYpjzcyJn57OIGQd7ZWrqcJzLrxxXS8omfpaHmU4hQjlO
         gRzqvSsgxsiYohv11PioSrUGKuthyipbctHRPACepNazcNi5uRTO6VbOthvSIwqtXZsZ
         EFOQ==
X-Gm-Message-State: AOAM531L8LzAggFN9sgh8qiuy8jbK7oQsKoUAxB919Gl5z/ElgnsMmP+
        znN/C0nb7EduNOkoRK0w0dscW+yFAYfF6CwVZmkV2A==
X-Google-Smtp-Source: ABdhPJwxJpVVcdSlD3GOmcVgzLNgibF7TD7Re668GN9W59cJdtK63zsAzP5yK68X3Fao0S5HtCZmobxzHGsJegYau4Q=
X-Received: by 2002:a9d:4e84:: with SMTP id v4mr42700646otk.45.1609418300461;
 Thu, 31 Dec 2020 04:38:20 -0800 (PST)
MIME-Version: 1.0
References: <20201230115408.492565-1-dmitry.baryshkov@linaro.org>
 <20201230123542.GA5679@thinkpad> <CAA8EJppWi7POSXsHnBJ__TGDBQezU1YHcvSKk9=7wpoAfREh4Q@mail.gmail.com>
 <20201230124641.GC5679@thinkpad> <CAA8EJppeD-Vq643VuKrOXvHr1h6gW_U5XYKqGPcxdwGybkLv1Q@mail.gmail.com>
 <20201230130618.GD5679@thinkpad>
In-Reply-To: <20201230130618.GD5679@thinkpad>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Dec 2020 15:38:09 +0300
Message-ID: <CAA8EJprFbGPeALe3=MtLNA-Vr6qRELA6ssa+z2Y2Z1nr9ATrSQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] PCI: qcom: fixup PCIe support on sm8250
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On Wed, 30 Dec 2020 at 16:06, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Wed, Dec 30, 2020 at 03:57:54PM +0300, Dmitry Baryshkov wrote:
> > On Wed, 30 Dec 2020 at 15:46, Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > >
> > > On Wed, Dec 30, 2020 at 03:38:12PM +0300, Dmitry Baryshkov wrote:
> > > > Hi Mani,
> > > >
> > > > On Wed, 30 Dec 2020 at 15:35, Manivannan Sadhasivam
> > > > <manivannan.sadhasivam@linaro.org> wrote:
> > > > >
> > > > > On Wed, Dec 30, 2020 at 02:54:06PM +0300, Dmitry Baryshkov wrote:
> > > > > > SM8250 SoC requires another clock to be up to power up the translation
> > > > > > unit. Add necessary bindings and driver support.
> > > > > >
> > > > >
> > > > > So what is the exact issue you're facing?
> > > >
> > > > IOMMU timeouts for PCIe0 device (WiFi)
> > > >
> > >
> > > Strange. I never observed this issue while testing with onboard QCA6390. Is it
> > > only happening on v5.11?
> >
> > No, I've faced it with 5.10 also. Don't remember about 5.9. Downstream
> > 4.19 also has this patch.
> > It well might be that on your board the firmware enables this clock.
> > However to be on a safe side I think we should enable it too.
> >
>
> Okay, then please remove the optional field and make it as a required one.

Done.

-- 
With best wishes
Dmitry
