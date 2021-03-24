Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB8F346E61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 01:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbhCXA5G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 20:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbhCXA4m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 20:56:42 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D25C061765
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 17:56:42 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id l123so16132386pfl.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 17:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h2JtxWq5KlA+aTENrci0BbTIjTR5pL1ehPUfioP17ww=;
        b=mdylSgtzUAZCVGwTE47jvcDg5m6W4yNItz32xBuv2n0FJcK5bOI46eXiRKAVhmX5gN
         v69Nc0v05jAQnjH1z50jxw9BfEssWsZemkNU4hdTyWudysyU8wYf6eOMsvynYbEKRHMI
         OwFtpSlbp1dZzAcCPai22SxLKgViyL6wyOqr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h2JtxWq5KlA+aTENrci0BbTIjTR5pL1ehPUfioP17ww=;
        b=WQEnbPoQAm7/PFsM7ZfG4RYwe4PrxuqNInWEVj0CWynj7b0cq6PG1+yDdsTARLt+eM
         dUBjqNtpThSPG/aQi0TYu1nB+QuLiV3Gsvh7qgLGg6ONOcpu0swb2Ng/N/RrQ2+SXOoR
         cfKRk9/EGz0VKZIImlWX1eStTJSoXPTCMMSVD42Dw/Thyshw5fKKqAJSn3/JfQQ0q6oq
         LZZmrWIQyFYslNx0V8Te7UO/9USV5JMLBq4mLt6y70poI0EnpE8OaYXR78ss3NySnCKX
         3SgYEm5n8XaPV1esvNuZa4vZztYWDLNN/RNyszJcg1oj1WptYxqF4j7TSspz3aFSS3N5
         TQkw==
X-Gm-Message-State: AOAM531GZOHT8L3qR8wMROJElU3bA7R4dCnaqnQvUGiBeysiL8ID4iYG
        ZmyD6fSkwZQ/nabcuzNJhToRzw==
X-Google-Smtp-Source: ABdhPJziJ3JXAD6m13EcNQP6pdLqzU32BKmPDBLBzBkozEcZ6Z2/VNUa4r5mBZE4Sm0f/1kY6upfBQ==
X-Received: by 2002:a62:1997:0:b029:1ed:5de5:5f1c with SMTP id 145-20020a6219970000b02901ed5de55f1cmr527401pfz.14.1616547401706;
        Tue, 23 Mar 2021 17:56:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:40a3:9725:46c3:85f6])
        by smtp.gmail.com with UTF8SMTPSA id 186sm356171pfb.143.2021.03.23.17.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 17:56:41 -0700 (PDT)
Date:   Tue, 23 Mar 2021 17:56:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v5 3/4] usb: dwc3: qcom: Configure wakeup interrupts and
 set genpd active wakeup flag
Message-ID: <YFqORzIw5WOLyDwm@google.com>
References: <1616434280-32635-1-git-send-email-sanm@codeaurora.org>
 <1616434280-32635-4-git-send-email-sanm@codeaurora.org>
 <YFna5mxrJAzR2s0g@kroah.com>
 <YFqMivRlDllNuqu/@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YFqMivRlDllNuqu/@google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 23, 2021 at 05:49:14PM -0700, Matthias Kaehlcke wrote:
> On Tue, Mar 23, 2021 at 01:11:18PM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Mar 22, 2021 at 11:01:19PM +0530, Sandeep Maheswaram wrote:
> > > Configure interrupts based on hs_phy_mode to avoid triggering of
> > > interrupts during system suspend and suspends successfully.
> > > Set genpd active wakeup flag for usb gdsc if wakeup capable devices
> > > are connected so that wake up happens without reenumeration.
> > > Add helper functions to enable,disable wake irqs.
> > 
> > That feels like a lot of different things all in one patch.
> 
> Sandeep: one thing you could do to reduce the churn is to add
> dwc3_qcom_enable/disable_wakeup_irq() in a separate patch, without
> any functional changes. Then this patch would only add the different
> branches based on the PHY mode.
> 
> The handling of the power domain could probably also be done in a
> separate patch, if I recall correctly it is only an optimization.

Actually another thing that could be in a separate patch is enabling
wakeup support based on 'wakeup-source'. That's not even directly
related with this series.

With all that you'd have fairly atomic patches and it should be easy to
write meaningful commit messages.
