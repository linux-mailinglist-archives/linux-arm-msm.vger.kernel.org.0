Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FE73D09D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 09:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235097AbhGUG5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 02:57:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:35586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236061AbhGUG5H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 02:57:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0684B606A5;
        Wed, 21 Jul 2021 07:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626853064;
        bh=brlSW06IL1aZHr3OIKZ4WztAJNaW55yizdsBVThvOgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YzRZDG5/4jXPjqaXRkvZS0xOFKhcuoDSnHM6GxVqvfEQHGZS7KYCqEMDleO7TK1Pr
         aPpD3IVSBlQEmSUQdnIxiEiLprkI20JA/pP6ryckXD6iREyM33qCswS74/WS7ZLLzU
         rp9WfzSDe3BKzS+m55jT/R3qJmE4clpiqYIgglK0=
Date:   Wed, 21 Jul 2021 09:37:42 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
Message-ID: <YPfOxiKojC1gB62B@kroah.com>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
 <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 13, 2021 at 05:07:00PM -0700, John Stultz wrote:
> On Tue, Oct 20, 2020 at 5:10 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > In accordance with the DWC USB3 bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > named.
> >
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> I know folks like to ignore this, but this patch breaks AOSP on db845c. :(
> 
> In the exact same way an earlier patch broke HiKey960:
>   https://lore.kernel.org/lkml/CALAqxLWGujgR7p8Vb5S_RimRVYxwm5XF-c4NkKgMH-43wEBaWg@mail.gmail.com/
> 
> (which I still have to carry a revert for).

This is not ok, I'll go revert it and push it to Linus soon.

thanks,

greg k-h
