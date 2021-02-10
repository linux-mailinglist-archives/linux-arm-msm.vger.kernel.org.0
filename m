Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9AFB316C16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 18:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbhBJRHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 12:07:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:40042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232169AbhBJRHt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 12:07:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6983E64E15;
        Wed, 10 Feb 2021 17:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612976830;
        bh=YURYTQOKCkXt94zDARkLXusCI3NBqyIqR4OuFkddUF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mg9jzlREFBDrcM+oMkBI9FgvLJQ63MShadyTO/R7NANlZEW4S6rFtQMiwxjRhmWLZ
         e96DYwRgW52o3arAdMgk2obwRpN6tRemAC+KTr7z4k0Mp49u/Ot3WHnJ+cCFjlDde8
         s4AXcrpZH+v7BenV9mgR5zh4KYxc1K9Uwd8RcnF4=
Date:   Wed, 10 Feb 2021 18:07:07 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] usb: dwc3: qcom: Detect DWC3 DT-nodes with
 "usb"-prefixed names
Message-ID: <YCQSu8Zygxhmppgy@kroah.com>
References: <20201205155621.3045-1-Sergey.Semin@baikalelectronics.ru>
 <20201205155621.3045-10-Sergey.Semin@baikalelectronics.ru>
 <YBnZ8O+zI/dzrjDQ@builder.lan>
 <YBpnpj+0KHM1Q8l8@kroah.com>
 <20210210145640.xhvcnarq3xoeeesu@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210145640.xhvcnarq3xoeeesu@mobilestation>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 10, 2021 at 05:56:40PM +0300, Serge Semin wrote:
> On Wed, Feb 03, 2021 at 10:06:46AM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Feb 02, 2021 at 05:02:08PM -0600, Bjorn Andersson wrote:
> > > On Sat 05 Dec 09:56 CST 2020, Serge Semin wrote:
> > > 
> > > > In accordance with the USB HCD/DRD schema all the USB controllers are
> > > > supposed to have DT-nodes named with prefix "^usb(@.*)?".  Since the
> > > > existing DT-nodes will be renamed in a subsequent patch let's first make
> > > > sure the DWC3 Qualcomm driver supports them and second falls back to the
> > > > deprecated naming so not to fail on the legacy DTS-files passed to the
> > > > newer kernels.
> > > > 
> > > 
> > > Felipe, will you merge this, so that I can merge the dts patch depending
> > > on this into the Qualcomm DT tree?
> > 
> > Patches this old are long-gone out of our queues.  If it needs to be
> > applied to a linux-usb tree, please resend.
> 
> Greg, Bjorn,
> I've revised and resent the series. Please find the recently posted
> patchset:
> Link: https://lore.kernel.org/lkml/20210208135154.6645-1-Sergey.Semin@baikalelectronics.ru/
> 
> Alas I've forgotten to Cc the linux-usb mailing list. Should I resend
> the series one more time?

Please do.
