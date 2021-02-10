Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2657C3171EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 22:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbhBJVFm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 16:05:42 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:50221 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbhBJVFi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 16:05:38 -0500
Received: by mail-wm1-f53.google.com with SMTP id 190so3067124wmz.0;
        Wed, 10 Feb 2021 13:05:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2TDlg5kjQ/FiLU6fnovw1yongTK1pX31S0OpLZGyLWg=;
        b=TOJtLrRKBK2DT9E+OxSKWPiVTt5PUV4EwCyND0ro8YRjm41R6dXTjB/XGMyJRjZM5a
         WUY/6e3rW7LL1bJ8SYsisNBfMHY5gz0JoMO6/F1rDvgAX0uI7iwofMzAO1o4wBZqPYFa
         oqE6Oipf34aC/C7V3gsIkHSZrS1s5GeQqRBjrbp4nWcVRsNjF/IF72qM9NHy5mesbdgH
         njtuBowsoYEQ6cmk6uzIiFpnKV+e8HVSbPGgeLl5elokhW0oFA9B/NCYcvzXWyiYbB+x
         PIzxCCmRxy+IlxKyHn0eY9RLmsebCmHxzfyfxRTpLO/HBCYiarXZD19j0Oqa2WkfX6rQ
         fLHA==
X-Gm-Message-State: AOAM530mOd8eZYRs+119t1fBuKocDnnxprFPsbw0vp/GQ/q4p/9YeZi1
        QTDEnP+CTPaKtFzJ8u8RwXE=
X-Google-Smtp-Source: ABdhPJzU6v3Y59YhX2bXBM8NSYFzwjKrJ+YlvSb1W4JYumBTJJMDV+0v5geobBTZEgmiwsMEvzcsmQ==
X-Received: by 2002:a1c:dd55:: with SMTP id u82mr914409wmg.135.1612991095811;
        Wed, 10 Feb 2021 13:04:55 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id s23sm4554534wmc.29.2021.02.10.13.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 13:04:53 -0800 (PST)
Date:   Wed, 10 Feb 2021 22:04:51 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Matthias Kaehlcke <mka@chromium.org>
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
Message-ID: <20210210210451.3coi62cynptzb6wf@kozik-lap>
References: <20210210171040.684659-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210210171040.684659-1-mka@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 10, 2021 at 09:10:35AM -0800, Matthias Kaehlcke wrote:
> This series adds the onboard_usb_hub_driver, the corresponding
> device tree bindings and creation of onboard_usb_hub platform in
> the xhci-plat driver during probe().
> 
> The main issue the driver addresses is that a USB hub needs to be
> powered before it can be discovered. For discrete onboard hubs (an
> example for such a hub is the Realtek RTS5411) this is often solved
> by supplying the hub with an 'always-on' regulator, which is kind
> of a hack.

It seems you are re-developing the power sequence drivers which perform
exactly this. Peter Chen some time ago was bringing power sequence to
USB devices, but I lost track where this ended up.

Some of his (and my) very old work (2017...) can be found here:
https://github.com/krzk/linux/tree/wip/odroid-u3-usb3503-pwrseq

Instead of adding custom driver hiding some USB hub implementation,
power sequence seems a generic solution. What if you need to power cycle
other embedded USB device? Not a hub?

I was not aware of previous discussions so maybe I am repeating
someone.

Best regards,
Krzysztof

