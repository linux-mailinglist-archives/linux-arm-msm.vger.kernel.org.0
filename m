Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A20A413F71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 04:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbhIVCaz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 22:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhIVCaz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 22:30:55 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5234AC061575
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 19:29:26 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id e16so1390547pfc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 19:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n0F09JQNk9O6OQoYulA/8nbT18jFP5jIlNLcQ6DehAI=;
        b=eCh8NNy5EXBaan9XkFEXLpaWkmK0YIAGpI+uXzjKNHTN9Zr9C9lmdXT00uW6vTMAqg
         JnU+3Tz0bV7SqHc87YbREAHgLQjC3+7NyIJnsM7JCNS/NCzgxVEfGe+EEPHCDKhyo8m9
         0xNMVDf9sYwVVS8A5FANBjLuk8ohxGVY+fuClHSWUPdxxqpZtyk4ZeXKOjMyUEnGJFCD
         g6jBYQsUjn+JGlOcHuzM7GmRY3+Pajic8MW5sGlXj5vrmDQZXW2bWKiNJ/kmPQum/XZv
         srdV52X68E0cXNpndaSgU0fUgK0hgAZBBjkd9UhEBDS/ActHmLwS8pV5QBpV1V+P7QpK
         mF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n0F09JQNk9O6OQoYulA/8nbT18jFP5jIlNLcQ6DehAI=;
        b=bRll7tpIKEY/eKFCGXjeh6fPzrbrjb6816etaaQjM6A1DKD4zSwFNDhODKxjzGEr7v
         IJ5X1yYZJv1KOLa0bWOgHoObOx3Y8rWpJJZWT03o3QTeYI8J84wX4rQTtg86X48hX7A7
         APifznV7Lo8YZ0D7olrhqm329Q+mHUSaEp42HP7scMPpA67x+HLwD9/hF2plz8H0ab+f
         YIelmsJA40UvpfdLBBylYbD+OtrNdoIsrfaXCBOj2ab1tzjwXgZbah16JQ3Bzp6eX01Z
         SlmbJCHHoDayLDZtaQtEh3hidGn1XmnEGJsw2zb8bTNDFyuoshW4jnFi26jhKWbWEmMc
         G7kg==
X-Gm-Message-State: AOAM530OmfehOV9Eb/PGFZYzeDY2fnQe2AgrSe+W+zBf/DIeVw4Ec2P6
        bCYdouN+djEaXEce7eO9miokEA==
X-Google-Smtp-Source: ABdhPJyAsWJA4ToeLnlZz1RELPyAL8TYLeUKdGGe7s0kTB54NWyRVAgpIRl9yE+f/U00hkGDAEubAA==
X-Received: by 2002:a63:4b4c:: with SMTP id k12mr30573227pgl.172.1632277765877;
        Tue, 21 Sep 2021 19:29:25 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 127sm422884pfw.10.2021.09.21.19.29.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Sep 2021 19:29:25 -0700 (PDT)
Date:   Wed, 22 Sep 2021 10:29:19 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: Add Sony Tulip Truly NT35521 driver
Message-ID: <20210922022918.GA10718@dragon>
References: <20210809051008.6172-1-shawn.guo@linaro.org>
 <20210809051008.6172-3-shawn.guo@linaro.org>
 <20210824025831.GB22595@dragon>
 <YSVPiBLrZMQDURPJ@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSVPiBLrZMQDURPJ@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 24, 2021 at 09:59:04PM +0200, Sam Ravnborg wrote:
> On Tue, Aug 24, 2021 at 10:58:31AM +0800, Shawn Guo wrote:
> > On Mon, Aug 09, 2021 at 01:10:08PM +0800, Shawn Guo wrote:
> > > It adds a DRM panel driver for Sony Tulip Truly NT35521 5.24" 1280x720
> > > DSI panel, which can be found on Sony Xperia M4 Aqua phone.  The panel
> > > backlight is managed through DSI link.
> > > 
> > > The driver is built using linux-mdss-dsi-panel-driver-generator[1], and
> > > additionally modeling the 5V control GPIOs with regulators and adding
> > > Backlight GPIO support.
> > > 
> > > [1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> > > 
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > 
> > Sam, Stephan,
> > 
> > Thank you for the review comments on v1!  How does v2 look to you?
> 
> I will not have time until next week - sorry.
> Please ping me if you have no feedback i one week from now.

Sam,

Could you help handle this patch now?  Thanks!

Shawn
