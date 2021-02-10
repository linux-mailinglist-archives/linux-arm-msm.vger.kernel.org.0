Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1F9317382
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 23:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233097AbhBJWiS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 17:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbhBJWiN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 17:38:13 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2DFC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 14:37:33 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id 189so2251595pfy.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 14:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s90SilBQFi+ziwOIINhOeEY8oYLj+xr0s/beSIR3XzA=;
        b=MnEVVT6ElZKR6HNoGnByOlde92Fc00O5NLMZG97kXOqfO9xJdd/lo+nOZrahuarmX4
         VpRMSLM/1rx0YTuEN6S/wDCBZBx1OX/tF+6TJrlgVtxArkAUYjwv4gpdTc7RvK11vkhi
         bDep2WDFkBv5OrnATTrAr3VFk391/iVVMxyQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s90SilBQFi+ziwOIINhOeEY8oYLj+xr0s/beSIR3XzA=;
        b=Zsyvb3Qhddg9yGEc725TrUPEmHrkxF5BL5nP2KDjRo3+PPc5+xVywIPQHxOELMIkdV
         e5Lzn4AaeXnTPm/h6DAGHaXtHx33vanJfaT6XHBRG41ff40KhQVDElr44QJCFH4XMhMY
         ro2Y/boXT5kdCS7KnOjARC4vHsfRQZTJZweAfcXUvQDQUYRu+xM+oajb+hH3TZW4pouo
         6lODnDXkzkuyraTzU+pEdQqEfJLL3SJEki0YoKeOYctKrUSMmLIVAan28z0QZjqvVYN2
         TV/B7eVC/ul5TNu1fbKpaGk4oPAMphqB4Y8QD4d9xklF8ZoCN1rMGZu1Zak+omPhUXnf
         QvFw==
X-Gm-Message-State: AOAM531wN03hbbUP/DRcDotEyf35hPip2brq4RtHFXCbk+4LxXkPJP1A
        tEv3+0m++BzSrEsq7/pNKnFRfQ==
X-Google-Smtp-Source: ABdhPJyK3ihZe4QNyRenuGNSz4QvYRxteZ2JVLj89pyhupD+zRHusDk4TLTrUBPt+L3CXxPY8cRUiQ==
X-Received: by 2002:a63:4a49:: with SMTP id j9mr5225931pgl.197.1612996652851;
        Wed, 10 Feb 2021 14:37:32 -0800 (PST)
Received: from localhost ([2620:15c:202:1:d8e6:826a:fc50:2158])
        by smtp.gmail.com with UTF8SMTPSA id j20sm3331858pfe.172.2021.02.10.14.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 14:37:32 -0800 (PST)
Date:   Wed, 10 Feb 2021 14:37:30 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 0/4] USB: misc: Add onboard_usb_hub driver
Message-ID: <YCRgKpnBOv1+u0Lh@google.com>
References: <20210210171040.684659-1-mka@chromium.org>
 <20210210210451.3coi62cynptzb6wf@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210210210451.3coi62cynptzb6wf@kozik-lap>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On Wed, Feb 10, 2021 at 10:04:51PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Feb 10, 2021 at 09:10:35AM -0800, Matthias Kaehlcke wrote:
> > This series adds the onboard_usb_hub_driver, the corresponding
> > device tree bindings and creation of onboard_usb_hub platform in
> > the xhci-plat driver during probe().
> > 
> > The main issue the driver addresses is that a USB hub needs to be
> > powered before it can be discovered. For discrete onboard hubs (an
> > example for such a hub is the Realtek RTS5411) this is often solved
> > by supplying the hub with an 'always-on' regulator, which is kind
> > of a hack.
> 
> It seems you are re-developing the power sequence drivers which perform
> exactly this. Peter Chen some time ago was bringing power sequence to
> USB devices, but I lost track where this ended up.
> 
> Some of his (and my) very old work (2017...) can be found here:
> https://github.com/krzk/linux/tree/wip/odroid-u3-usb3503-pwrseq

pwrseq was brought up in the discussion about this driver, but wasn't
deemed suitable for this use case which might require more complex
configurations:

https://lore.kernel.org/patchwork/patch/1313000/#1512725

> Instead of adding custom driver hiding some USB hub implementation,
> power sequence seems a generic solution. What if you need to power cycle
> other embedded USB device? Not a hub?

The driver could be extended to also cover other types of devices if desired.
Maybe it should be called usb-pwrseq then, even though it's not directly
related with the original pwrseq series.
