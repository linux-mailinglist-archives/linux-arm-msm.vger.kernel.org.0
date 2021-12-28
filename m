Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEA3480BD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 18:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236603AbhL1RHs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Dec 2021 12:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236009AbhL1RHs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Dec 2021 12:07:48 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E33C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Dec 2021 09:07:47 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id j124so30940184oih.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Dec 2021 09:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oZ/3RWIICayqeX8NGvH8uNdXpYzICfkoNEUUnjvFbK4=;
        b=hckZEzqYtQUUAo14ly2MATzBb/IMI0LNK7RZEiElcwzKKQHQCCBr93t8BP+tq/LUgx
         5rdGiFVWk7zgQxobsXoBTEVyiA3C075pIhxeIJo2euGcznekXBRmTDZjxipRIjXMvY5C
         qL4w9ZUTXi49MbM7ujw5WJ+5K/+SlnAhc6KAsNLO5vMCMkwXMjCP9/BRkptxE3e4Y1YK
         BY8NZGzMsPAJEaYxCxK3xVMFeOT3/ngFYMeQl8TYqPFe7ZQ/W2q9tsqVpIqdKkgCdAL2
         hJa7Bw0qaA7AwHQXyYAY7ZhlBObeo+DZMzsL2FSzk+dAJXByaA5mXZRuD4IHyN5pyRYc
         VAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oZ/3RWIICayqeX8NGvH8uNdXpYzICfkoNEUUnjvFbK4=;
        b=HPB1xVSM38PTvrwqXi7MNl/jkQ3kbaeW8U132Jzl4VK1XECPJHxg8xQRfwR6y/qAlz
         Ra+jwFZg6VCR5sVnOX2cXOxavM9TUreiBfa1XNu9NI8dVkLuvfVydVJSxXLed9JZkSLD
         I0qDlZvfFfcel24qfVV7IAn7ciTibJGuwX6hxG055iaWnsJb3NNY9JQWJamEI1/nhVAe
         /4///kXQ5+xT4nQ0STS3M1OOV4AADLigIbrUUY84+iU75g7E93uyHuoXJh7CaOA9vQ63
         ikK449RwWi/9Dnn/gT0X1HhLl2Wx/9HuM7oINPqcHc/uOiKxzzmATMZO1sDRcakY8Cjm
         bglQ==
X-Gm-Message-State: AOAM533OcfJLDptniwuAfFpFzGdHzsFsj2lmbuzLXsdlzgTHC5smwL8o
        j4YWo/XFkbzUnBH2ff7j6I2UWA==
X-Google-Smtp-Source: ABdhPJxyp73sBikZUK9fV7aQkyVfeNKeBZfLBnmheicO2np5Qje9WMaB1cRxtpdfGlTKH4B7tIbvOw==
X-Received: by 2002:a05:6808:2111:: with SMTP id r17mr17314232oiw.118.1640711267219;
        Tue, 28 Dec 2021 09:07:47 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w4sm2875922oiv.47.2021.12.28.09.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 09:07:46 -0800 (PST)
Date:   Tue, 28 Dec 2021 09:08:46 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/8] typec: mux: Introduce support for multiple TypeC
 muxes
Message-ID: <YctEnnH8FvS6zRPb@ripper>
References: <20211228052116.1748443-1-bjorn.andersson@linaro.org>
 <279c7bd8-c0bb-e58c-1149-d124102bf8b8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <279c7bd8-c0bb-e58c-1149-d124102bf8b8@redhat.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 28 Dec 04:20 PST 2021, Hans de Goede wrote:

> Hi Bjorn,
> 
> On 12/28/21 06:21, Bjorn Andersson wrote:
> > This series introduces a level of indirection between the controller's view of
> > a typec_mux/switch and the implementation and then expands that to support
> > multiple drivers.
> > 
> > This is needed in order to support devices such as the Qualcomm Snapdragon 888
> > HDK, which does muxing and orientation handling in the QMP (USB+DP) PHY and SBU
> > muxing in the external FSA4480 chip.
> > 
> > Additionally integration of typec mux and switch in the QMP PHY is included in
> > the series, as is the new FSA4480 driver. This is done to deal with the
> > renaming of the driver-side typec_mux -> typec_mux_dev.
> > 
> > Bjorn Andersson (8):
> >   dt-bindings: phy: qcom,qmp-usb3-dp: Add altmode/switch properties
> >   phy: qcom-qmp: Register typec mux and orientation switch
> >   device property: Helper to match multiple connections
> >   device property: Use multi-connection matchers for single case
> >   typec: mux: Introduce indirection
> >   typec: mux: Allow multiple mux_devs per mux
> >   dt-bindings: usb: Add binding for fcs,fsa4480
> >   usb: typec: mux: Add On Semi fsa4480 driver
> 
> Thank you for your series, I will leave commenting on the
> dt-bindings and typec-mux changes to others.
> 
> But what I can do is test this on an x86 device using
> a pi3usb30532 mux for USB super-speed and DP-alt-mode
> muxing / orientation switching.
> 

Thanks Hans, that would be much appreciated. I realize that I failed to
mention that I don't have this hardware, so I've not been able to test
it myself.

> I'm going to wait a bit with doing that till this has had
> some reviews and possibly also some newer versions because
> of those reviews. If you haven't received a Tested-by from me
> when this looks like it is ready for merging please ping me.
> 

Will ping you when appropriate.

Thanks,
Bjorn

> Regards,
> 
> Hans
> 
> 
> > 
> >  .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml    |  14 +
> >  .../devicetree/bindings/usb/fcs,fsa4480.yaml  |  72 +++++
> >  drivers/base/property.c                       |  83 ++++--
> >  drivers/phy/qualcomm/phy-qcom-qmp.c           | 176 ++++++++++--
> >  drivers/usb/typec/bus.c                       |   2 +-
> >  drivers/usb/typec/mux.c                       | 257 +++++++++++++-----
> >  drivers/usb/typec/mux.h                       |  12 +-
> >  drivers/usb/typec/mux/Kconfig                 |   9 +
> >  drivers/usb/typec/mux/Makefile                |   1 +
> >  drivers/usb/typec/mux/fsa4480.c               | 220 +++++++++++++++
> >  drivers/usb/typec/mux/intel_pmc_mux.c         |   8 +-
> >  drivers/usb/typec/mux/pi3usb30532.c           |   8 +-
> >  include/linux/property.h                      |   5 +
> >  include/linux/usb/typec_mux.h                 |  22 +-
> >  14 files changed, 762 insertions(+), 127 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> >  create mode 100644 drivers/usb/typec/mux/fsa4480.c
> > 
> 
