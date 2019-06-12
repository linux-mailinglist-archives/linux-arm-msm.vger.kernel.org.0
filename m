Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68BF5422C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 12:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438030AbfFLKkV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 06:40:21 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38631 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438032AbfFLKkQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 06:40:16 -0400
Received: by mail-wm1-f68.google.com with SMTP id s15so5998916wmj.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2019 03:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QOUu665VzbrQkdt6yuFrpjcTfZcOezuzhB04ruczt2c=;
        b=cigPc5yqKtc5ty1KWdwigqWdNQXSGwDhC0Fr7SXbLKN7MEyfVKpajuulmqbSG9T7QR
         IcPH51LzN028aYASAjgoEvs/yg4Pg8H7A3SohtTv9x6uhcRAyl9DQBsIVFyyILSkyj9d
         xvuJKhveB91CQX7REZo886hk+/xTsR01v7H+aDTJMS5cjqVGwEnDcLhDG102dooNRbGC
         ULMdawJIHoCs7ZGUg8ib5cVyPBzduAUauJ3SwSKqDPWx3zfLegCI5ahAM1K/OWF9mcoY
         FCwJE2bPnH9bZekPqQ4TYGMFqT1RcIFXKug7miIo23wz9IegSMwwKsCcB+tH6ImR17w9
         eVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QOUu665VzbrQkdt6yuFrpjcTfZcOezuzhB04ruczt2c=;
        b=t9xq0my9JhDCf7nfWFgupxqCzXNM325KRwYNO5gZAyveoYRdgOTOZ4LZHr6UExlcjR
         2uWYiCNvCdOJUWBUzZDygCXLXM0cjq2LvKEovAGWZL9sQcpb5R4nnTcr2EEOZA2pEQLg
         P5D/bF8wSFcfB0CH5MqwYzUbhDM3YynDQHeBYPP+5+1SAl4MZUBXZPWvPp4uuzFETcRH
         boXA6ls6vVYzwBAhHk4hZLqMGNpfUiY/7lwRM1odKN75Vot4WO4jdWUW5qTw89ND+kW7
         J8ochlwt2YzE3WBiB9p0aorRh2B6JGSmj02WHZSzpxzHLvBJyA6VYv1S8UCtyQ+SMMBb
         faew==
X-Gm-Message-State: APjAAAXsIYZOehIpW4YwD+rMCwmH3iGbLlFty6Jc3VJl7bkdgJ/K5ZMX
        UHeNektZzlNH6EyqWMASi/XE8w==
X-Google-Smtp-Source: APXvYqy1InhFscPbjy00LsR+VSBPtrs/pTzNt7sH1NgkU981TFf39ZicVqy8q3leI91RcX0sQgcUIA==
X-Received: by 2002:a1c:a7ca:: with SMTP id q193mr23272055wme.150.1560336014376;
        Wed, 12 Jun 2019 03:40:14 -0700 (PDT)
Received: from dell ([185.80.132.160])
        by smtp.gmail.com with ESMTPSA id g5sm20846547wrp.29.2019.06.12.03.40.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2019 03:40:13 -0700 (PDT)
Date:   Wed, 12 Jun 2019 11:40:11 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/8] i2c: i2c-qcom-geni: Provide support for ACPI
Message-ID: <20190612104011.GA4660@dell>
References: <20190610084213.1052-1-lee.jones@linaro.org>
 <20190612103453.ccet2pneairnlpcc@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190612103453.ccet2pneairnlpcc@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Jun 2019, Wolfram Sang wrote:

> On Mon, Jun 10, 2019 at 09:42:06AM +0100, Lee Jones wrote:
> > Add a match table to allow automatic probing of ACPI device
> > QCOM0220.  Ignore clock attainment errors.  Set default clock
> > frequency value.
> > 
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> Sadly, there is no cover-letter describing if there is a dependency or
> not. I assume there is, otherwise I would get the I2C patches only? But
> what is the suggested way upstream then?

There are no cross-subsystem build dependencies on any of these
patches.  The only reason they are bundled together in the same
patch-set is for cross-subsystem visibility and understanding.

There is wide interest in these devices.

> Also, the current maintainer entry for this driver looks like:
> 
> drivers/i2c/busses/i2c-qcom-geni.c:
>         Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
>         David Brown <david.brown@linaro.org> (maintainer:ARM/QUALCOMM SUPPORT)
>         Alok Chauhan <alokc@codeaurora.org> (supporter:QUALCOMM GENERIC INTERFACE I2C DRIVER)
> 
> I didn't hear from those people yet, would be great to have their acks.

I will see if I can rouse them from their slumber.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
