Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137E92E78A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 13:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgL3Mrf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 07:47:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgL3Mre (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 07:47:34 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B91C06179C
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 04:46:54 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id e2so11323130pgi.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uWAONLxDd+bCGHWSREagVt2pAL3gkEObT05aXBIf7wo=;
        b=QO1VFyvsisI28KXj/FEx4n3+Kl3n8ZeOee/Dzoqb9zTYh9CUCufykPdozTraIDnFym
         uzBIr4r8h4i1RoRNFBQEFpjcJD7WQTj2ysGj+TtN4bSyzLVwqPwyueMdgMGBxuolSyi3
         NEHlG91nAU2ddhGVsyGAE6Hhr+LAd97xAVSIVzBWnFZk72PKQqnvMwOqZbTEUUEz4Q+w
         jKXwNgZubD9ahmxXGvtKhprhqMqywALbsBScUtfszb2ZBe8YSwNjL76BouPDXkQQIQ6X
         dRUNBWWvRgBo0iZcF8k3fmNTDs70+PwjH0UhM8s9+ZDFyfvG8IHJZy3LipCGFnZEtX3f
         w1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uWAONLxDd+bCGHWSREagVt2pAL3gkEObT05aXBIf7wo=;
        b=RzuPA1cPBB39CREeJH/6HetBwpPo5vJHcxMa21tJcsxraBqToiW6Y/Xj8rNxeuNwvL
         ehMexT7b8ZlMJVIwty6fhfEQjJV+0oydEKBKnhIQLgyO4e2h9UZX2edKf4cZkNeVaAb6
         H4Dr/zHKhMWwsI+NjpCALvbg+MG8UCdhvb9Se8qHTEfOmiHDGlxkAMljuLp/3VnHWt7e
         RY3bXSH6QJ7ghK60Eb1HjfZyuwcJTLdqQp7ovzmyttNCXqRc9p8zR2P5CZWMdHuT8gYV
         SAxD8H+sTvmZ51Sb0JTdg1e3tLG7kmOOfCcLYsGNaTUizOg+vU5A99tCpluwSuH7UAA+
         1qnA==
X-Gm-Message-State: AOAM530/hLu2fnEEwI+FrWURgJ3FpepE/+vmy79jXLQXz7oQwp/Stjac
        /XMXVm5ZTuA/R4g6dz8HZScd
X-Google-Smtp-Source: ABdhPJzsenGntSaKwAqesq3YH9S06iT0WmJXhLIC8oSC2mWObrA/r0qHZzeLoCpsuPe6+krEV41uxQ==
X-Received: by 2002:aa7:82c1:0:b029:19e:3672:50ca with SMTP id f1-20020aa782c10000b029019e367250camr28490384pfn.12.1609332413908;
        Wed, 30 Dec 2020 04:46:53 -0800 (PST)
Received: from thinkpad ([2409:4072:6013:d529:8c5c:9ef7:2471:6df4])
        by smtp.gmail.com with ESMTPSA id h3sm31366035pgm.67.2020.12.30.04.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 04:46:53 -0800 (PST)
Date:   Wed, 30 Dec 2020 18:16:41 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 0/2] PCI: qcom: fixup PCIe support on sm8250
Message-ID: <20201230124641.GC5679@thinkpad>
References: <20201230115408.492565-1-dmitry.baryshkov@linaro.org>
 <20201230123542.GA5679@thinkpad>
 <CAA8EJppWi7POSXsHnBJ__TGDBQezU1YHcvSKk9=7wpoAfREh4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppWi7POSXsHnBJ__TGDBQezU1YHcvSKk9=7wpoAfREh4Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 30, 2020 at 03:38:12PM +0300, Dmitry Baryshkov wrote:
> Hi Mani,
> 
> On Wed, 30 Dec 2020 at 15:35, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Wed, Dec 30, 2020 at 02:54:06PM +0300, Dmitry Baryshkov wrote:
> > > SM8250 SoC requires another clock to be up to power up the translation
> > > unit. Add necessary bindings and driver support.
> > >
> >
> > So what is the exact issue you're facing?
> 
> IOMMU timeouts for PCIe0 device (WiFi)
> 

Strange. I never observed this issue while testing with onboard QCA6390. Is it
only happening on v5.11?

Thanks,
Mani

> -- 
> With best wishes
> Dmitry
