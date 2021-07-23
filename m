Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7193D367E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 10:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234408AbhGWHhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 03:37:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:56458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234311AbhGWHhF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 03:37:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDD7A60EBD;
        Fri, 23 Jul 2021 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627028259;
        bh=xnAmVgoDuokti2NByNq6/FFRGTSMhdQRxWuJi2rHC0Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fzT5ISx3nPwKdbMu9BnIUTph2mjFB1lUM2vUb2DiOHFTRVsbeYjRZ9mIzVtd5w4BB
         63ePNFLvEybFAJsW5Jd8b4VvRCudZ3uEULO/cI7h/8TaLYpaHj8U8tLSv9D/lxjAAz
         NIQs5QlX5UnLX6OUSTzkVnUrKlMhXGZ29WXZ/1RE=
Date:   Fri, 23 Jul 2021 10:17:30 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
Message-ID: <YPp7Gi9xKtNJpC1a@kroah.com>
References: <20210721100220.ddfxwugivsndsedv@mobilestation>
 <YPf29+ewbrYgHxRP@kroah.com>
 <0064cb2c-5ca6-e693-2e89-8f045c8f7502@kernel.org>
 <YPf+shNM6cXb3mfe@kroah.com>
 <d853df77-8d36-30b0-dd26-da1bfcb068e0@kernel.org>
 <20210721112531.xvu6ni5ksaehsrjh@mobilestation>
 <CALAqxLViEqSO17P3JGRGYJh-wDoHaJiQQV48zeoRgnar4Xd5Bg@mail.gmail.com>
 <20210722181221.xh3r5kyu7zlcojjx@mobilestation>
 <YPnEO6NVFZDS1s//@yoga>
 <20210722215451.cdhvh5jjvtv5zncl@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722215451.cdhvh5jjvtv5zncl@mobilestation>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 23, 2021 at 12:54:51AM +0300, Serge Semin wrote:
> I always thought that ABI is supposed to be something what is
> thoroughly documented and firmly declared to be so. It isn't something
> claimed to be on a random nature but defined to be one when it's
> more-or-less standardized. Thus the Linux kernel developers decide not
> to change something unless it went through the series of iterations like
> testing, stable, obsolete, remove. As I see it the rule-of-thumb is
> supposed to be as "nothing is ABI unless it's declared as such".

Not true at all.  Again, if something works in an older kernel version,
and you upgrade to a new kernel version and it breaks, that is a
regression and must be fixed/reverted.

Lack of documentation does not mean an ABI can be changed.

greg k-h
