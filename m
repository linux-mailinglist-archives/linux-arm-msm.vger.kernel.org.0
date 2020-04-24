Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11AAF1B823B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2020 00:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgDXWwQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 18:52:16 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33622 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgDXWwQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 18:52:16 -0400
Received: by mail-ot1-f65.google.com with SMTP id j26so15383781ots.0;
        Fri, 24 Apr 2020 15:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wF6fQRNcOVGmiPWGuQ33fy/Py3YU3kYZ9u186GNu9uo=;
        b=htSWQD+d0WCZNfCalaDjkEKy4fUv0uwYmrdbZ2zw2QnRhzFFf+B1bWEtkxIGb87ZS4
         4xdAQ5o8cV1mHVZWgD31nep0szycSh+EXz7qPRACAaKse1DdnHgWeDL5MEnhUmqs1pzS
         1uJ/miCjJI83xPldkDyyhAGuvh67apWIkpwKa8Qjdni7qHh2JZkEjZ0v+2iqIigPmu1f
         kc4SecTmjxKKcVCx9LuwXPX5U7sX4Rlk9GpVD+lZ/9CFFOqAadbE1F6SfT0WMHwoTD3G
         muIjFl8rY+0iqAmVhUcAjjIlLJJcTLfVsGiRGXgEekmjn1wHTjNwbOpImYEVKgBEBRT6
         sE/w==
X-Gm-Message-State: AGi0PuY7RlD1W0t/s/thz1oJQOigf9zEac61t4XPSPdRzEX8ISq9Nhx/
        ZEvUvRiWxdj3j4iKolmgKw==
X-Google-Smtp-Source: APiQypL+B3MmVxN4219JD1LUJE3v2D7vWF8MSXRe8ojTj26JKh2LYSmBoJni5bwWB5GfRoFjUUXlwQ==
X-Received: by 2002:aca:c646:: with SMTP id w67mr9239297oif.70.1587768735355;
        Fri, 24 Apr 2020 15:52:15 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s73sm2013006oih.14.2020.04.24.15.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 15:52:14 -0700 (PDT)
Received: (nullmailer pid 18240 invoked by uid 1000);
        Fri, 24 Apr 2020 22:52:13 -0000
Date:   Fri, 24 Apr 2020 17:52:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Sandeep Maheswaram <sanm@codeaurora.org>, mka@chromium.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom-qusb2: Fix defaults
Message-ID: <20200424225213.GA15428@bogus>
References: <20200423111015.1.Ifa8039b6f3031e9a69c4a526a6efc2f499f07292@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423111015.1.Ifa8039b6f3031e9a69c4a526a6efc2f499f07292@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Apr 2020 11:10:27 -0700, Douglas Anderson wrote:
> The defaults listed in the bindings don't match what the code is
> actually doing.  Presumably existing users care more about keeping
> existing behavior the same, so change the bindings to match the code
> in Linux.
> 
> The "qcom,preemphasis-level" default has been wrong for quite a long
> time (May 2018).  The other two were recently added.
> 
> As some evidence that these values are wrong, this is from the Linux
> driver:
> - qcom,preemphasis-level: sets "PORT_TUNE1", lower 2 bits.  Driver
>   programs PORT_TUNE1 to 0x30 by default and (0x30 & 0x3) = 0.
> - qcom,bias-ctrl-value: sets "PLL_BIAS_CONTROL_2", lower 6 bits.
>   Driver programs PLL_BIAS_CONTROL_2 to 0x20 by default and (0x20 &
>   0x3f) = 0x20 = 32.
> - qcom,hsdisc-trim-value: sets "PORT_TUNE2", lower 2 bits.  Driver
>   programs PORT_TUNE2 to 0x29 by default and (0x29 & 0x3) = 1.
> 
> Fixes: 1e6f134eb67a ("dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning parameters")
> Fixes: a8b70ccf10e3 ("dt-bindings: phy-qcom-usb2: Add support to override tuning values")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks.

Rob
