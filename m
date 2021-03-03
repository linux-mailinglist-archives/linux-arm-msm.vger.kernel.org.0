Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3EAA32C214
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbhCCVk7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:40:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244741AbhCCPLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 10:11:44 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C49C061763
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 06:45:33 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id q204so15367579pfq.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 06:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J/L9Vsw6/4k+W5B5jJbhVRSy0ZASEPs2i2qo9aGLtRI=;
        b=VGb1t57vd1AnaLDcJVgN0jcQy4XECFfONFfDLkIfkz2Y2zxu1CIzs1wUoRVoUt5cBE
         skF1UitNqMHZcMEaG27wih+EWlksdJA3G22qW1x6PpOHuSJQDxC6p9CQBWVyjkmuI6TQ
         oIIGFKQBIkdztN5UFttnMGc3DQJPkHEDUqsLlMWzsJ4/x5jl5l36k5fUayG54ngnjAqr
         FTc8XTaGF7QkIxxL7+r2awBrKJJpmUK2JkUY94had+VGDesrEJyxs/m5IXgjTyiHCyZG
         j/y9+IVY+qqn1otynXFQIZvW3wyHtmNaU9htF4kN/blogsAGvdCg3x/EQbPycgC7Eaar
         9ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J/L9Vsw6/4k+W5B5jJbhVRSy0ZASEPs2i2qo9aGLtRI=;
        b=f5mQ87rFvn3eeHuRBS/BNq1b7NiUzdHrPT5gXY5P2Sq5pI47Yk4mAUjfZ6All8riDi
         XDuLbe3l9pXo1EDh3NFudN0ZVtfXip7rgPkjcbsYpbVhpC29dg5XIkXKrFpgqgcxiK64
         7WbUkeLdtltAAk5OTSPKS+JRaCPalkv03P2rfnAugARaaDghM8SQEgIZXwmvAGs1oX7d
         kcBdS6xMcZYOIes5aIK1FeJTzsarqTWDVwabHh1BCtUQNMURhULKYM3av9dzarpHD45U
         XgLjWJawmj1lNx5O6B6KgqZlpnE3QWeQkIux/yDZMpq8cNFddNFVynzAXzvwQA/Rd1La
         b1ZA==
X-Gm-Message-State: AOAM530PrMtv6xduSvBR9CVYwdqkSVkXPawiFjnKLTrlkrQHJQEGrTwr
        A2q/UBUYJsSFOGiYFN7K2ZRDSA==
X-Google-Smtp-Source: ABdhPJyxVLc/RTAHDPDHeJkezvj/md/ZQ4R/ctQEls9J9aAp1iO/W16NfVaxdhPgrjyYZxkQmSaBng==
X-Received: by 2002:aa7:9f52:0:b029:1ee:db83:dac6 with SMTP id h18-20020aa79f520000b02901eedb83dac6mr3276872pfr.45.1614782732430;
        Wed, 03 Mar 2021 06:45:32 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t6sm23716191pgp.57.2021.03.03.06.45.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 06:45:32 -0800 (PST)
Date:   Wed, 3 Mar 2021 22:45:27 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: handle tiles for ACPI boot
Message-ID: <20210303144526.GC17424@dragon>
References: <20210303132622.4115-1-shawn.guo@linaro.org>
 <20210303132622.4115-2-shawn.guo@linaro.org>
 <YD+YSS/s79gqwEpS@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YD+YSS/s79gqwEpS@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 03, 2021 at 04:08:09PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 03, 2021 at 09:26:21PM +0800, Shawn Guo wrote:
> > It's not always the case that DT and ACPI describe hardware resource in
> > the same schema, even for a single platform.  For example, on SC8180X,
> > DT uses the tiles schema while ACPI describe memory resource as a single
> > region.  It patches msm_pinctrl_probe() function to map tiles regions
> > only for DT.  While for ACPI, it maps the single memory resource and
> > calculate tile bases with offsets passed from SoC data.
> 
> ...
> 
> > +#include <linux/acpi.h>
> 
> There are at least two possibilities to avoid this:

So could you explain why we should avoid including this header?

Shawn

>  - use is_of_node(dev_fwnode(dev)), or in case you need board files support,
>    !(fwnode && is_of_fwnode(fwnode))
>  - provide the tiles support directly from the driver thru internal data structures
> 
>  And to me the second approach seems better, because there is no guarantee that
>  tiles support is only defined by the fwnode type.
