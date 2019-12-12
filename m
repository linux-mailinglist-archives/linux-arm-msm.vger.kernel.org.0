Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD8011D9EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 00:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731150AbfLLXVS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 18:21:18 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44099 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730883AbfLLXVS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 18:21:18 -0500
Received: by mail-pf1-f195.google.com with SMTP id d199so257351pfd.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 15:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PwEI1yJ6T0AFskT5dlCNbVTasQQQ68Q/cR6yPVKDil0=;
        b=iG1uqwZNOR1syLRVOi5Xd7H0Lm4Jnn5MY+w22djMXoS46pswB6y0UCzuOqvdbdDikD
         AqJ2oBwf5BDU2K5gqkyjBAX1/hVf5EGz7VOxT693uKpiOw2uPledAL9RuFL+kuoGGMPD
         5nGJceZfX101Ebtp07JCQeG86/VFQXUbhpKzahW9CIndokO35peMC+Vjxg7s3+S5I1Hd
         Qz93ae7WzVta5hovaCxu8Zaz7CGm17bIW9ZtfxFEkmNYd9MHOfXMS8H6/vXg195vAPKV
         EH+Px9KjnYEWp2VV/d1fJTukKJWcI5BSKIH7TY6NjJ8+IB57+Zwa7PWjfRAk/5uaD8v6
         AZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PwEI1yJ6T0AFskT5dlCNbVTasQQQ68Q/cR6yPVKDil0=;
        b=GwNzHQjfB83uKhZSPddda2a6F0G3x5cYlyV6RCSl1UmKb24lvIPqYosKMNKgEWy1nH
         tp6zMUS7kDOcVrnrUlanVZ8ktA6GRVBz7V0ihz8fy1GXJ6GFYkze3J8DvuYDvXR3PORB
         cBh/o+MtdsWY8urdC5rLNg9QWDnfMboXRtxfU8YEVGmwP3Jtb3qn8peSiqICnVohK57b
         4dejvEI3SXKY27ZZhPRe1KpL6quBHAKrZH/uBLkpty1afuJSdI9Tn+TUvSptb2u8Dzwv
         MDEPFTZOoCgALa0tiX5EO0zcPUMMuqgkT6XAPwzriLNjlLcTzrFGossGyGcp5MBfF95u
         Aing==
X-Gm-Message-State: APjAAAVN8R5FaSGg6KBVkMLZKY/zcq+s+PWExLEXbz0zsAjZQIm6dSAi
        UvHvPBpgMdFBkvh9Ba2cv9letA==
X-Google-Smtp-Source: APXvYqxov3K1Wj491tYe3QMx2tNmECKyTzhVquS5PWR+IxNp3gxFXhBdBmzbiNQlyXk9Y/bYPZ5YJQ==
X-Received: by 2002:aa7:9306:: with SMTP id 6mr12471387pfj.159.1576192877506;
        Thu, 12 Dec 2019 15:21:17 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h5sm8646678pfk.30.2019.12.12.15.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 15:21:16 -0800 (PST)
Date:   Thu, 12 Dec 2019 15:21:14 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        mka@chromium.org, Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 0/7] arm64: dts: sc7180: Make dtbs_check mostly happy
Message-ID: <20191212232114.GQ3143381@builder>
References: <20191212193544.80640-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212193544.80640-1-dianders@chromium.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 12 Dec 11:35 PST 2019, Douglas Anderson wrote:

> This gets rid of all of the dtbs_check that showed up atop the current
> qcom maintainer tree for sc7180-idp, except the errors in the
> 'thermal-sensor' nodes.  I believe those are known / being dealt with
> separately [1] [2].
> 
> I don't expect this series to have any functional changes, it just
> makes the device tree cleaner.  I was able to boot after applying
> these patches atop a working tree.
> 
> I have tried to sort the changes here, first including the "obviously
> correct" changes and later changes I am less certain about.  There are
> no known dependencies between the changes.
> 
> [1] https://lore.kernel.org/r/CAD=FV=UXC3UT78vGBr9rRuRxz=8iwH4tOkFx6NC-pSs+Z5+7Xw@mail.gmail.com
> [2] https://lore.kernel.org/r/CAD=FV=UtHebABCpJo1QUc6C2v2iZq2rFL+pTMx=EHBL+7d=jTQ@mail.gmail.com
> 

I applied patch 1-4 and 6. Would like to hear from Rob on patch 5 and
waiting for you to finish up the commit message in patch 7.

Thanks,
Bjorn

> 
> Douglas Anderson (7):
>   arm64: dts: qcom: sc7180: Add SoC name to compatible
>   arm64: dts: qcom: sc7180: Rename gic-its node to msi-controller
>   arm64: dts: qcom: sc7180: Add "#clock-cells" property to usb_1_ssphy
>   arm64: dts: qcom: pm6150: Remove macro from unit name of adc-chan
>   arm64: dts: qcom: sc7180: Avoid "memory" for cmd-db reserved-memory
>     node
>   arm64: dts: qcom: sc7180: Avoid "phy" for USB QMP PHY wrapper
>   arm64: dts: qcom: sc7180: Use 'ranges' in arm,armv7-timer-mem node
> 
>  arch/arm64/boot/dts/qcom/pm6150.dtsi    |  2 +-
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  2 +-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 45 +++++++++++++------------
>  3 files changed, 25 insertions(+), 24 deletions(-)
> 
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
