Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A531C2E792A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 14:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgL3NHN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 08:07:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbgL3NHM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 08:07:12 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A05C06179B
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 05:06:32 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id t6so8664890plq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 05:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V/V3abGUfnMv5CHsdNdlkRUJBMfCJ9TBAO/vESN3hYQ=;
        b=wAa2dvHFwGgJNQ7elnYrvF/ZqfsogeW90VDTFzLVyRLWDYOEAMtupMgwo3u0ZKQvLv
         unAuDhibgy01aj7eOQv6JAJViDXl2kkSkFMnHlm9J+GnMYMUpt8S4mzDRMt87EcFPjK6
         bxbGH6MVClPtGW9KT6lVBjKuo8zED/F5K4XApe9GUsZ1dJqY31HzP0AQENc0h8E6L8mn
         OwqnqM3CdvkX4gCsTP1XSkvAx9R582j8HH2+yir4GhjwEUeoMSA13AirG10xgCbVxJP9
         Xdxk+AuoMJEILWRGhJXjUl5UItwzKlgCPkCciVm8Cdh5Plqro3lsuzCkh2593XX/KJWx
         C5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V/V3abGUfnMv5CHsdNdlkRUJBMfCJ9TBAO/vESN3hYQ=;
        b=L5wWBJqnRyFpPAXzyRI6I1cMKAP8cnEEhqKsdrz9ciQp2m7a9x6Ixme72bRRqdnaic
         qx7dV1jD8B05ue3LNUeNPg/bRUAP7A8P+6MM3DnO0RFhCrnyaaSnYMYDFMRAzAL9Ro/x
         x/sT9dUyz128lWcnapH2xMZtfsdZrHXT7dtBT6jjSGqlhMH+s/gVPZnKffkNajm54s2V
         UALJeg9mrlRq0zzNOeiKvIi9yrsru5pfWJSlNYEMUyry6tD2PlmBwHgIhiJiJ9wHriOw
         M7OVnmH6Du4TdygyFDB5UWFrPamqLH51UiCP9vqhoiYla8vkh91sg2QNLZHAltEh+ZH2
         2ROA==
X-Gm-Message-State: AOAM531M2+7SOKF+prtO5uCb7NOz+wteR4jfKOPThCRqriIUbUB5Nr4+
        /IA1QwfeJ/f5aR72fd9ngsNN
X-Google-Smtp-Source: ABdhPJx5Wu3MEyxVC/56+IfITLUzxBKfwsIkYmXHZu5SNo5HvAxpBMuyxeCBFS3hhVi8+x5SIrykZQ==
X-Received: by 2002:a17:90a:1b82:: with SMTP id w2mr8742211pjc.127.1609333591547;
        Wed, 30 Dec 2020 05:06:31 -0800 (PST)
Received: from thinkpad ([2409:4072:6013:d529:8c5c:9ef7:2471:6df4])
        by smtp.gmail.com with ESMTPSA id i130sm42257739pfe.94.2020.12.30.05.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 05:06:30 -0800 (PST)
Date:   Wed, 30 Dec 2020 18:36:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 0/2] PCI: qcom: fixup PCIe support on sm8250
Message-ID: <20201230130618.GD5679@thinkpad>
References: <20201230115408.492565-1-dmitry.baryshkov@linaro.org>
 <20201230123542.GA5679@thinkpad>
 <CAA8EJppWi7POSXsHnBJ__TGDBQezU1YHcvSKk9=7wpoAfREh4Q@mail.gmail.com>
 <20201230124641.GC5679@thinkpad>
 <CAA8EJppeD-Vq643VuKrOXvHr1h6gW_U5XYKqGPcxdwGybkLv1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppeD-Vq643VuKrOXvHr1h6gW_U5XYKqGPcxdwGybkLv1Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 30, 2020 at 03:57:54PM +0300, Dmitry Baryshkov wrote:
> On Wed, 30 Dec 2020 at 15:46, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Wed, Dec 30, 2020 at 03:38:12PM +0300, Dmitry Baryshkov wrote:
> > > Hi Mani,
> > >
> > > On Wed, 30 Dec 2020 at 15:35, Manivannan Sadhasivam
> > > <manivannan.sadhasivam@linaro.org> wrote:
> > > >
> > > > On Wed, Dec 30, 2020 at 02:54:06PM +0300, Dmitry Baryshkov wrote:
> > > > > SM8250 SoC requires another clock to be up to power up the translation
> > > > > unit. Add necessary bindings and driver support.
> > > > >
> > > >
> > > > So what is the exact issue you're facing?
> > >
> > > IOMMU timeouts for PCIe0 device (WiFi)
> > >
> >
> > Strange. I never observed this issue while testing with onboard QCA6390. Is it
> > only happening on v5.11?
> 
> No, I've faced it with 5.10 also. Don't remember about 5.9. Downstream
> 4.19 also has this patch.
> It well might be that on your board the firmware enables this clock.
> However to be on a safe side I think we should enable it too.
> 

Okay, then please remove the optional field and make it as a required one.

Thanks,
Mani

> -- 
> With best wishes
> Dmitry
