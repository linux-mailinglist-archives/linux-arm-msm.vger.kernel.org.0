Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A406D3D1354
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 18:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhGUP3V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 11:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhGUP3U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 11:29:20 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26629C061575
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 09:09:57 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id w194so3388391oie.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t8Achvc6gmB1IWFt2cs1pac8ko7r2FFuKn3p9oKG0ZA=;
        b=vldT/QIXxzEVQWBpeHYUQ8go9Rx1UYSImPxvO2W9NJhxPGqn6ivTFhNgLUs7y7iM4g
         NVC07/ThKIrgvIBibR9sbhncliXK3/ap+NF1BM/zvd+bVxAi8unQHjv7ZJqxSGR8NDAN
         g0WBrObMBEURDEUnKqMinKOu4tUR9ffE2a4DZVinD3ttGahCc/S/QDpzYJr7LN+5vqAc
         /etYwOE/4KpHKThw3Ka4ByYdph5ps7iaTthCYZF9dNmlfA1i10hkmoNc9czLLmZA/Zmj
         7sEyBWllPRPe2+Ht87X1j2iGapKs1V2yavLemz9bHL1bzgzDKDNSoSUuPqgVCX0npChL
         ixPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t8Achvc6gmB1IWFt2cs1pac8ko7r2FFuKn3p9oKG0ZA=;
        b=fX8zs/HP9vThPwY4f3s4j3IhrkmvNHVZx6oAiFwID7TLQdkGXtCT5z9kBumMNEFdPq
         MtIf5ziCyQ4mr5B+S4WrQm4swfvDI6Q+ZBwjtgDbOvx4LTr1VDG5LtO4bAEv3OH+HrkR
         xsV5F8yQFgE0xBK5txaMuW/J+7nt/tDir/EswJBzgaBA0ybFIhyY+BzyPgFMRRY+kYfD
         5rGTJRZ+Pok11zKFT5HOmyc9rr0E25QIx1hOEGczmcTHyYHm3U0/ClyeWBAF4zkaOPix
         eIGVDe8cp/6w0kagX1NZHJnZr5SY0o55pfT1TM3oxkR4p191dSa637ZXn81BSWiIQ04W
         qcug==
X-Gm-Message-State: AOAM532x47jr0Z10ixm5IJOoBuE4kTIf103v9+8rJj74ZyviF+idZozv
        mGuRavqJAqWzqz2RKfvkjTWEKQ==
X-Google-Smtp-Source: ABdhPJzdOEuVZLYICEThb9Za6LmhYAChm6ivQ+jgYvvsv3HW2ePqU61sM8dXW3d/9SGDareQr4yVVw==
X-Received: by 2002:aca:2319:: with SMTP id e25mr24650201oie.27.1626883796492;
        Wed, 21 Jul 2021 09:09:56 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r5sm1214451oti.5.2021.07.21.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 09:09:56 -0700 (PDT)
Date:   Wed, 21 Jul 2021 11:09:53 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Dylan Reid <dgreid@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: trogdor: Update audio codec to
 Max98360A
Message-ID: <YPhG0eiE7ie/WDRz@yoga>
References: <20210625045010.2914289-1-judyhsiao@chromium.org>
 <CAD=FV=VXULSZXqt-wjMWC4YqehGJsoeC0G=Kuut0xPPKo9AEWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VXULSZXqt-wjMWC4YqehGJsoeC0G=Kuut0xPPKo9AEWQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 21 Jul 10:27 CDT 2021, Doug Anderson wrote:

> Hi Bjorn,
> 
> On Thu, Jun 24, 2021 at 9:50 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
> >
> > Use max98360a dts node to correctly describe the hardware.
> >
> > Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> I noticed that you landed several dts changes recently (thanks!) but I
> didn't see this one. Was there a problem with it, or did it just slip
> through the cracks?
> 

No problem, it just sat there nicely waiting in the backlog. It's now
applied and pushed out.

Thanks,
Bjorn
