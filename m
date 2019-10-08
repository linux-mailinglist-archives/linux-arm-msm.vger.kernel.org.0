Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B47DECFF8F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2019 19:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbfJHRKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 13:10:09 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57020 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbfJHRKJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 13:10:09 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E718660709; Tue,  8 Oct 2019 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570554608;
        bh=Hl31l3HzL5RJakGhA/0Av14OVr8Gji2rQOUJ4T9TSIs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iHd/rtuIymcUsQq10MFmlHuU9cEYiM4GYFrSEl3S23iWaDpmqcmlBoOCpep8jyllw
         c7+wworL1NhWBSDjBDgYTBLyW0CsQk6npOTgHsAhloZvOkV0nhh2fvb9kag7HYRGEC
         tHNyZHimMeuAfcVzpxoNYWWTy2DiPPK0iDCIqcT4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 0B153602C8;
        Tue,  8 Oct 2019 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570554608;
        bh=Hl31l3HzL5RJakGhA/0Av14OVr8Gji2rQOUJ4T9TSIs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iHd/rtuIymcUsQq10MFmlHuU9cEYiM4GYFrSEl3S23iWaDpmqcmlBoOCpep8jyllw
         c7+wworL1NhWBSDjBDgYTBLyW0CsQk6npOTgHsAhloZvOkV0nhh2fvb9kag7HYRGEC
         tHNyZHimMeuAfcVzpxoNYWWTy2DiPPK0iDCIqcT4=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 08 Oct 2019 10:10:08 -0700
From:   mnalajal@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v2] base: soc: Handle custom soc information sysfs entries
In-Reply-To: <20191008154346.GA2881455@kroah.com>
References: <1570480662-25252-1-git-send-email-mnalajal@codeaurora.org>
 <5d9cac38.1c69fb81.682ec.053a@mx.google.com>
 <20191008154346.GA2881455@kroah.com>
Message-ID: <463ec0b5a3f1946df0ed2771ba741545@codeaurora.org>
X-Sender: mnalajal@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-08 08:43, Greg KH wrote:
> On Tue, Oct 08, 2019 at 08:33:11AM -0700, Stephen Boyd wrote:
>> Quoting Murali Nalajala (2019-10-07 13:37:42)
>> > Soc framework exposed sysfs entries are not sufficient for some
>> > of the h/w platforms. Currently there is no interface where soc
>> > drivers can expose further information about their SoCs via soc
>> > framework. This change address this limitation where clients can
>> > pass their custom entries as attribute group and soc framework
>> > would expose them as sysfs properties.
>> >
>> > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
>> > ---
>> 
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> 
> 
> Nice, can we convert the existing soc drivers to use this interface
> instead of the "export the device pointer" mess that they currently
> have?  That way we can drop that function entirely.
> 
Thank you for the reviews.
In the current linux tree i can find these driver instances who is using 
"soc_device_to_device" for populating their sysfs entries.

drivers/soc/ux500/ux500-soc-id.c:       parent = 
soc_device_to_device(soc_dev);
drivers/soc/tegra/fuse/fuse-tegra.c:    return 
soc_device_to_device(dev);
drivers/soc/amlogic/meson-gx-socinfo.c: dev = 
soc_device_to_device(soc_dev);
drivers/soc/amlogic/meson-mx-socinfo.c: 
dev_info(soc_device_to_device(soc_dev), "Amlogic %s %s detected\n",
drivers/soc/imx/soc-imx8.c:     ret = 
device_create_file(soc_device_to_device(soc_dev),
drivers/soc/imx/soc-imx-scu.c:  ret = 
device_create_file(soc_device_to_device(soc_dev),
drivers/soc/versatile/soc-realview.c:   
device_create_file(soc_device_to_device(soc_dev), &realview_manf_attr);
drivers/soc/versatile/soc-realview.c:   
device_create_file(soc_device_to_device(soc_dev), &realview_board_attr);
drivers/soc/versatile/soc-realview.c:   
device_create_file(soc_device_to_device(soc_dev), &realview_arch_attr);
drivers/soc/versatile/soc-realview.c:   
device_create_file(soc_device_to_device(soc_dev), &realview_build_attr);
drivers/soc/versatile/soc-integrator.c: dev = 
soc_device_to_device(soc_dev);

These drivers can use the current proposed approach to expose their 
sysfs entries.
Will try to address these and submit. But i can't able to test these 
changes because i do not have these h/w's

> thanks,
> 
> greg k-h
