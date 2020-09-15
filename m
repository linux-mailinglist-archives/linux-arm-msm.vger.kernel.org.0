Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E4F26B041
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 00:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbgIOUZi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 16:25:38 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37013 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727916AbgIOUYl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 16:24:41 -0400
Received: by mail-io1-f68.google.com with SMTP id y13so5639558iow.4;
        Tue, 15 Sep 2020 13:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k8g/clW7IPHG1LbRVHMEnaiVeLkzzxw5Wen9ULU36ns=;
        b=CHM/qGMjDqVbsE0mo3Aw3YJMEuMzDA9cvd0yl8Zl/5+CnuU1zf733X3u96MWoNHumh
         XCC8FYkdYihVCeDcjTYrxgZnsyAUp4JRF0iXUqi6uQj6M0n34JUW/qN66l4Va/ynxbm6
         ASf/APLt1FwS/ySGyhenPd7DP2tTh73fi4MiZiziUzeSplxIaEhCypNk8gsnX749Hnw8
         yOO7er6/rVDCxrdL0LaxGqc1saJ5DhzUO4bXFQTJ6lK+jSKOOxc2JxXii7ZezQICumqq
         pJOaGyTdKGdg71o1p53W0MjBlExLMrFF2zpLecQbuJeXrXPqySTNI0hOhX3UArNSOB95
         Xotg==
X-Gm-Message-State: AOAM530dnE58USy2gpqe50urtfv7XlBvOTyqkubHgyJ1IgphXqNm1FAc
        kNjA0kNEzbnATGQhf/dw3A==
X-Google-Smtp-Source: ABdhPJy2mL/IlfHwqDOlJmg6GztMT0Y5BZaayRHvuBr8GnCGguHN/BrCKaUKyrH49aML4FbYZNQWxw==
X-Received: by 2002:a05:6602:2e89:: with SMTP id m9mr16868980iow.77.1600201475599;
        Tue, 15 Sep 2020 13:24:35 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id v20sm9357819ile.42.2020.09.15.13.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 13:24:34 -0700 (PDT)
Received: (nullmailer pid 2448015 invoked by uid 1000);
        Tue, 15 Sep 2020 20:24:32 -0000
Date:   Tue, 15 Sep 2020 14:24:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 01/10] dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy
 information
Message-ID: <20200915202432.GA2435458@bogus>
References: <20200910004902.2252694-1-swboyd@chromium.org>
 <20200910004902.2252694-2-swboyd@chromium.org>
 <159972050159.2295844.14715100754744266014@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159972050159.2295844.14715100754744266014@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 09, 2020 at 11:48:21PM -0700, Stephen Boyd wrote:
> Quoting Stephen Boyd (2020-09-09 17:48:53)
> > This binding only describes the USB phy inside the USB3 + DP "combo"
> > phy. Add information for the DP phy and describe the sub-nodes that
> > represent the DP and USB3 phys that exist inside the combo wrapper.
> > Remove reg-names from required properties because it isn't required nor
> > used by the kernel driver.
> > 
> > Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> > Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> > Cc: Vara Reddy <varar@codeaurora.org>
> > Cc: Tanmay Shah <tanmay@codeaurora.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Manu Gautam <mgautam@codeaurora.org>
> > Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Cc: Jonathan Marek <jonathan@marek.ca>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: <devicetree@vger.kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml    | 91 +++++++++++++++++--
> >  1 file changed, 81 insertions(+), 10 deletions(-)
> 
> I noticed that I didn't document the new compatible string I'm using,
> qcom,sc7180-qmp-usb3-dp-phy, ugh.
> 
> Should I copy the whole file over and make a new document for the new
> compatible string? That feels like the better solution vs. making this
> binding have min/max stuff where it fails to enforce the DP part of the
> phy. We can delete this binding once the kernel tree isn't using it,
> right?

It generally depends on how much if/then schema you have (or should 
have) vs. how much is common, but it's a judgement call. It looks 
like you are just extending the binding for the most part. If there's 
dtb warnings until the existing stuff gets updated, that's fine.

Rob
