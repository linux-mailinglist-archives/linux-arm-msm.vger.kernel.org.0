Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA8F3CFF9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2019 19:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfJHRRg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 13:17:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:38272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbfJHRRf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 13:17:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 587B2217D7;
        Tue,  8 Oct 2019 17:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570555053;
        bh=fxNwB/OAoq85hLuAEfhbbkdlFQInJq6uZvfK7/uy2/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a1UnvxMiFXusG5Uc+W/4xsdjTvzoL1wfwUhNG1Z0UKu5fpNAIx3mzkOZV3Ey5Qxl7
         Xdmhb9kSn+WST/jOrEmTC/IyaoKMKmdeYxiAKrt65+cC1MQ6Vj/dHB8zGHfb/OKzbB
         srWXkpEA+Y969bjp1jrZbu0MOGnJlYKgq4Ua2FAI=
Date:   Tue, 8 Oct 2019 19:17:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     mnalajal@codeaurora.org
Cc:     Stephen Boyd <swboyd@chromium.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v2] base: soc: Handle custom soc information sysfs entries
Message-ID: <20191008171731.GA2901709@kroah.com>
References: <1570480662-25252-1-git-send-email-mnalajal@codeaurora.org>
 <5d9cac38.1c69fb81.682ec.053a@mx.google.com>
 <20191008154346.GA2881455@kroah.com>
 <463ec0b5a3f1946df0ed2771ba741545@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <463ec0b5a3f1946df0ed2771ba741545@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 08, 2019 at 10:10:08AM -0700, mnalajal@codeaurora.org wrote:
> On 2019-10-08 08:43, Greg KH wrote:
> > On Tue, Oct 08, 2019 at 08:33:11AM -0700, Stephen Boyd wrote:
> > > Quoting Murali Nalajala (2019-10-07 13:37:42)
> > > > Soc framework exposed sysfs entries are not sufficient for some
> > > > of the h/w platforms. Currently there is no interface where soc
> > > > drivers can expose further information about their SoCs via soc
> > > > framework. This change address this limitation where clients can
> > > > pass their custom entries as attribute group and soc framework
> > > > would expose them as sysfs properties.
> > > >
> > > > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> > > > ---
> > > 
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > 
> > 
> > Nice, can we convert the existing soc drivers to use this interface
> > instead of the "export the device pointer" mess that they currently
> > have?  That way we can drop that function entirely.
> > 
> Thank you for the reviews.
> In the current linux tree i can find these driver instances who is using
> "soc_device_to_device" for populating their sysfs entries.
> 
> drivers/soc/ux500/ux500-soc-id.c:       parent =
> soc_device_to_device(soc_dev);
> drivers/soc/tegra/fuse/fuse-tegra.c:    return soc_device_to_device(dev);
> drivers/soc/amlogic/meson-gx-socinfo.c: dev = soc_device_to_device(soc_dev);
> drivers/soc/amlogic/meson-mx-socinfo.c:
> dev_info(soc_device_to_device(soc_dev), "Amlogic %s %s detected\n",
> drivers/soc/imx/soc-imx8.c:     ret =
> device_create_file(soc_device_to_device(soc_dev),
> drivers/soc/imx/soc-imx-scu.c:  ret =
> device_create_file(soc_device_to_device(soc_dev),
> drivers/soc/versatile/soc-realview.c:
> device_create_file(soc_device_to_device(soc_dev), &realview_manf_attr);
> drivers/soc/versatile/soc-realview.c:
> device_create_file(soc_device_to_device(soc_dev), &realview_board_attr);
> drivers/soc/versatile/soc-realview.c:
> device_create_file(soc_device_to_device(soc_dev), &realview_arch_attr);
> drivers/soc/versatile/soc-realview.c:
> device_create_file(soc_device_to_device(soc_dev), &realview_build_attr);
> drivers/soc/versatile/soc-integrator.c: dev = soc_device_to_device(soc_dev);
> 
> These drivers can use the current proposed approach to expose their sysfs
> entries.
> Will try to address these and submit. But i can't able to test these changes
> because i do not have these h/w's

Build testing should be sufficient.

thanks,

greg k-h
