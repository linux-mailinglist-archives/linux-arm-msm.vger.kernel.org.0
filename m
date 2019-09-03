Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDF6A6134
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2019 08:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfICGUo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Sep 2019 02:20:44 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33900 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfICGUo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Sep 2019 02:20:44 -0400
Received: by mail-wr1-f67.google.com with SMTP id s18so16082703wrn.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2019 23:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=YKY88mE2T1JIVhonH4BKsN4In+EOCkLewu/cYwg0NFI=;
        b=oSJnFgvpy0N/Nmx5iIH3UkDpNMrRdPCgW0b4jddqpLvi4/d1Rkz0iH9x6JROMRweXs
         XdX7jguoInFB7gtTaGYBrXzI6qz0J0da8yO+VYo7yCy4565Z/40NDO3pHW7vWgx5Vf0o
         Vxlbis9eTsOPTASQ0Oky9OzE/ET2cNCAJ4t62ZXj4YjOhG+UraKA6e0MvanYzVQ8NR1K
         o9Y685UaF4FtTl+zcgsEUNhEVPOcbPUi24DqfjU46CfvhOizKa8OuRggtVCAjBunUn/s
         klakPSif8jugFhmBXjktCEhCN3hZu5YWuyvSxMGJof5mdhJTcriZLh8wDRDbg/PKbQNP
         jIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YKY88mE2T1JIVhonH4BKsN4In+EOCkLewu/cYwg0NFI=;
        b=GzZhyfGmf8IvLZVtz27EtH+Hz2dJsHHe7Ioikx9X/8OfGOi6lxRLyb1bJjzPrhVI35
         hjTzZFTikJERrzAiISsKgi9TxvJAGfbb3H7elcnNc54XCaDHWEeuvN6jkFoT3c/pglwO
         atLl6A7g6lnlbGtxWFCaGB7a56uuVM9alT+yZLtFta/Z9yRhBZN2jI23As++2b1E8NG/
         GQWvQ+prjwenyu1jOjGlr9+GXM7XIuQsgcjIaAsW8Y4dpCeHXYp4Q1JjJoU7Si+/mizn
         Zp2+GaXeVpOtV5NuEaE5MooW5aN2rQ0WqjuEXiHsB01fSj2UhHNJrgzOv3ltWnYqhZVO
         RUCQ==
X-Gm-Message-State: APjAAAWwYGMQXtPHc0yydGXLj7CgMXXPFh0tYEmDt1lwTIFujrPiCQ+N
        lTi56lOctLvQ9TlSRURLPJpmzID8b3o=
X-Google-Smtp-Source: APXvYqzxTP9Izgjyqm7VZnX7b5HaQgM+sZAiS2X6RszH2QLjrimvK7wmFA+TGBzFrnlM0Gq6VvNosA==
X-Received: by 2002:adf:e912:: with SMTP id f18mr38483436wrm.46.1567491642530;
        Mon, 02 Sep 2019 23:20:42 -0700 (PDT)
Received: from dell ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id o193sm19866846wme.39.2019.09.02.23.20.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 23:20:41 -0700 (PDT)
Date:   Tue, 3 Sep 2019 07:20:40 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Message-ID: <20190903062040.GC26880@dell>
References: <20190902132400.14084-1-lee.jones@linaro.org>
 <20190903054451.GV6167@minitux>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190903054451.GV6167@minitux>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 02 Sep 2019, Bjorn Andersson wrote:

> On Mon 02 Sep 06:24 PDT 2019, Lee Jones wrote:
> 
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > The Lenovo Yoga C630 is built on the SDM850 from Qualcomm, but this seem
> > to be similar enough to the SDM845 that we can reuse the sdm845.dtsi.
> > 
> > Supported by this patch is: keyboard, battery monitoring, UFS storage,
> > USB host and Bluetooth.
> 
> Applied this to next-20190829 and booted it, got a little bit of EFI FB,
> then the screen goes blank and after a while I'm back in GRUB.
> 
> I've not been able to figure out what's causing this though.

Probably DMA.  There is still an issue in the COM GENI Serial Engine
Driver which reboots the system when a DMA transaction is initiated.

However, with a workaround patch applied to the Serial Engine driver
(drivers/soc/qcom/qcom-geni-se.c) this DTS has no issue booting the
system.

We have ~12 weeks to either fix or elegantly work around the Serial
Engine issue.  IMHO is makes no sense to hold back this enablement
patch (which cannot go in via the -rcs) for something which is likely
to be fixed and applied during v3.4-rcX.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
