Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F11D482C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 14:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbfFQMni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 08:43:38 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43369 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfFQMne (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 08:43:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so9766242wru.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 05:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=P1JMAByiWsBIg2xS0Ru/2Rbjg5esxyIW8/0UKnvDABY=;
        b=MH+0Kzd+kVWwz79we3RH983ZGAz63gBz5WxY42gnp/UadfYh8co7ER48PeppvVxr8i
         aTcFTMIPaDdj0f1quEEJ4Uc7qMcs4sQBqS4PX5qu8OpmujM3ApsphVPrWUyo9h6QEaGX
         Y4UZLKuTynl6MgSCq9vMJ8C65pXhCk80cvevh4ObOBte/XQgo8Idw5fuQOldKJaQgLA/
         +VKhR5Hfuoie8hc/jjjTcOzWZj+RkyO3RxpHwvSd6ship6DFhwuDZUWyWemuWb9b2OIx
         fzfImRvVf0PgBinXiPy7/56FENKvbx36FxloJ4CdfhT0PiPNh4Q8DwkeZSZdDEN5Sa/f
         /OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=P1JMAByiWsBIg2xS0Ru/2Rbjg5esxyIW8/0UKnvDABY=;
        b=Ao7n1IaYrEQCXlkQVUfMpNxpvhO2mtycBnQzBRLJkv9wK5xhToSUqdiy6VL7xVbzXU
         ESUUAGmMv31nUcPju/KM5a78ooL+PKztsVaiRbFRcAEiyhqfgWUvQ7hMJnDlCAutufEs
         l4IG7IlsEV9t8L71VgIMXvxHLIwMlUiInJqD3z7SCBqubGDxPbuWr/bJcjjTX7y5aXn3
         GD68xWPMxJ3xOEHpxwmLN9pj6LYb/K9i3m4AOIq9G914V8uYBFBK8Ub9MqYaD/lCflWD
         Fpm6JBxqscoWict6ZgOEvJSlnpWcjwNRPI93JXpYQt3TJyK6n+D52Kk0A20gymftQvAi
         j2xw==
X-Gm-Message-State: APjAAAWqSoPU/9wGewdNQ7CcLpjyHn9rk6WoYNqN5anj4YO2MUEW7rNY
        NKD339jxmCH0KEj5+TW3azDIWA==
X-Google-Smtp-Source: APXvYqyn8N255V7KB12USAc2GJalrZIuvz2ngM6htxvx9fwGULNgykz/ROyo0tyK26aQzp/GOuXRtg==
X-Received: by 2002:adf:eacd:: with SMTP id o13mr4444853wrn.91.1560775412007;
        Mon, 17 Jun 2019 05:43:32 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id y184sm9777350wmg.14.2019.06.17.05.43.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 05:43:31 -0700 (PDT)
Date:   Mon, 17 Jun 2019 13:43:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 4/6] usb: dwc3: qcom: Add support for booting with ACPI
Message-ID: <20190617124329.GH16364@dell>
References: <20190612142654.9639-1-lee.jones@linaro.org>
 <20190612142654.9639-5-lee.jones@linaro.org>
 <20190617102146.GG16364@dell>
 <87y320gzp4.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y320gzp4.fsf@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 17 Jun 2019, Felipe Balbi wrote:

> Hi,
> 
> Lee Jones <lee.jones@linaro.org> writes:
> >> In Linux, the DWC3 core exists as its own independent platform device.
> >> Thus when describing relationships in Device Tree, the current default
> >> boot configuration table option, the DWC3 core often resides as a child
> >> of the platform specific node.  Both of which are given their own
> >> address space descriptions and the drivers can be mostly agnostic to
> >> each other.
> >> 
> >> However, other Operating Systems have taken a more monolithic approach,
> >> which is evident in the configuration ACPI tables for the Qualcomm
> >> Snapdragon SDM850, where all DWC3 (core and platform) components are
> >> described under a single IO memory region.
> >> 
> >> To ensure successful booting using the supplied ACPI tables, we need to
> >> devise a way to chop up the address regions provided and subsequently
> >> register the DWC3 core with the resultant information, which is
> >> precisely what this patch aims to achieve.
> >> 
> >> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> ---
> >>  drivers/usb/dwc3/Kconfig     |   2 +-
> >>  drivers/usb/dwc3/dwc3-qcom.c | 206 ++++++++++++++++++++++++++++++-----
> >>  2 files changed, 179 insertions(+), 29 deletions(-)
> >
> > I'm starting to get a little twitchy about these patches now.  Due to
> > the release cadence of the larger Linux distros, it's pretty important
> > that these changes land in v5.3.  Without them, it is impossible to
> > install Linux on some pretty high profile emerging platforms.
> >
> > It's already -rc5 and I'm concerned that we're going to miss the
> > merge-window.  Would you be kind enough to review these patches
> > please?  The Pinctrl and I2C parts of the set have already been
> > merged.
> 
> I don't seem to have this series in my inbox. This is the only email I
> have in this series.

I did wonder, which is why I made sure I sent this to your Intel
address as well.  Is your @kernel.org address broken?

Will re-send the patches to your Intel address, give me a few
minutes.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
