Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7864524359C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 09:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgHMH6e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 03:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgHMH6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 03:58:32 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE2FC061383
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 00:58:32 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c19so5790096wmd.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 00:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nCffN1/O4aEsIe0h4ncOW5dmW5XEiYRGz9MDUW3tvf8=;
        b=noSnxdy7tWQADOLjLI6p/s/XwaJfmFMakXQjc8oYZdIfK9UdVAUnV8VA+ZuTkrl0ld
         vKNKCyg9ODvaJSrrGyU6Rn9tW4pWLmdj8+IBK5mvl0GIylT9l9KLmriF/+F8TN6RM356
         B5EQ+VxZgf0yRD2ZKTPx5RjTHjrMFT4nJDCeKZRMKLGyp7W7W0dV4LACfLVLnkqybeIo
         BJxnDuhlwRgrtrdenFPRVksbuhzsaTEzOUKf/4+8vonVt8At7t3sVLKttbLb7SOMbu9Q
         tNmKWsmtdW0cNsGzRBlgNuz7BKpvf8bCHyiAqoRr24e0aj02mdf3+ohWgBhQ7P9mzJVE
         GEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nCffN1/O4aEsIe0h4ncOW5dmW5XEiYRGz9MDUW3tvf8=;
        b=OU3V1w97qiMBdq4GCaxqelSHx9sMdgWRZSB1GTX3Usp15fQvR9yJhaonNnL6N5kI8V
         S3cn0ZbTNHsjRlcsBEfTz3uZgLtAqGq0DQ7NqV49xBpRTXAkK+B6kvKJb0zVRkXsKOTn
         fXlcI0XQkK6mrkPpSjwkM3ns7Rxq5GAlNZgHa4eTj11+5KLEtfvQaZ65FOArzlESTVD8
         PQzFWEvaVpqcwtSrEFH3sK5ZMqMaO46NS3m7SCanP5WGqTgzRtxOa1bn76ONdsORpok+
         3KXt4JXRctPxWkVDBCoyGFL4cNQb07052jZaFaMgKOzLUuIJFecKL6XikD5b4sLkfN2t
         XTJQ==
X-Gm-Message-State: AOAM530wqWgdR7qehfgLk8uLN+AFyWKvBEb0kXgsKt3g8b913E2LJHpB
        bZa+04jFeI6JEkhqCoS1dA7zJQ==
X-Google-Smtp-Source: ABdhPJyV6AY2xx7rwwOFCQ7bw3e71FK+Fkwy3fGO25tAeZ2PyRSgLKsdPeeqoOxndoTFWiSse347Lg==
X-Received: by 2002:a1c:3b89:: with SMTP id i131mr3211258wma.30.1597305510518;
        Thu, 13 Aug 2020 00:58:30 -0700 (PDT)
Received: from dell ([2.27.167.73])
        by smtp.gmail.com with ESMTPSA id b2sm7616298wmj.47.2020.08.13.00.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 00:58:29 -0700 (PDT)
Date:   Thu, 13 Aug 2020 08:58:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Wei Xu <xuwei5@hisilicon.com>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devel@driverdev.osuosl.org,
        linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 00/44] SPMI patches needed by Hikey 970
Message-ID: <20200813075827.GH4354@dell>
References: <cover.1597247164.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1597247164.git.mchehab+huawei@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Aug 2020, Mauro Carvalho Chehab wrote:

> Hi Greg,
> 
> This patch series is part of a work I'm doing in order to be able to support
> a HiKey 970 board that I recently got on my hands.
> 
> I received some freedback from Mark and from Jonathan on a first
> attempt I made to upstream this.
> 
> I'm opting to submit it via staging, because I had to start from the
> patch that originally added this driver on a 4.9 Kernel tree:
> 
> 	https://github.com/96boards-hikey/linux/tree/hikey970-v4.9
> 
> In order to preserve the original SOB from the driver's author.
> 
> The patches following it are on the standard way: one patch per
> logical change.
> 
> This is part of a bigger work whose goal is to have upstream support
> for USB and DRM/KMS on such boards. 
> 
> I suspect that, maybe except for the DT part, those 3 specific drivers
> are more or less ready to be moved from staging, but the other
> drivers that are also part of this attempt aren't ready. Specially the
> DRM driver has some bugs that came from the OOT version.
> 
> So, my current plan is to submit those drivers to staging for 5.9
> and move the ones that are ok out of staging on Kernel 5.10.

What a mess.  This is no way to upstream a new driver.

Firstly, could you please add versioning to your submissions.  I know
this at least version 2.  Were there previous submissions?  Is this
the latest?

Secondly and more importantly, you have submitted what looks like a
new driver (bearing in mind that I'm only concerning myself with the
MFD related changes), then in the same submission you are adding and
removing large chunks.  Please just submit the new driver, on its own
as a single patch, complete with its associated Makefile and Kconfig
changes.

What are your reasons for submitting this via Staging?  Is it not
ready yet?  Are the resultant components not at a high enough level of
quality or enablement to go straight into the subsystems, which is
more typical?  From an MFD perspective, I would be reviewing the
driver as a whole when (if) it moves from Staging into MFD anyway, so
why are you jumping through hoops with this additional, seemingly
superfluous step?

Finally, the subject of authorship is often a contentious one, but
this is a problem you need to work out with the original author, not
something that should require special handing by upstream.  You have a
couple of choices, but bear in mind that upstreaming a non-suitable
driver then bringing it up to standard is not one of them.

1. Keep the original author's authorship and SoB, make your changes
   and get them to review to ensure they are still happy about being
   associated with the resultant code.  Ensure you mention all of the
   changes you make in the commit message and follow-up by adding your
   own SoB.

2. This is the contentious bit.  If you've made enough changes, there
   is an argument for you to adopt authorship.  You should discuss
   with the original author whether they are happy for you to retain
   their SoB.  My suggestion is always try to keep the SoB as a bare
   minimum to preserve patch history and out of pure courtesy.

> Mauro Carvalho Chehab (41):
>   staging: spmi: hisi-spmi-controller: coding style fixup
>   staging: spmi: hisi-spmi-controller: fix it to probe successfully
>   staging: spmi: hisi-spmi-controller: fix a typo
>   staging: spmi: hisi-spmi-controller: adjust whitespaces at defines
>   staging: spmi: hisi-spmi-controller: use le32 macros where needed
>   staging: spmi: hisi-spmi-controller: add debug when values are
>     read/write
>   staging: spmi: hisi-spmi-controller: fix the dev_foo() logic
>   staging: spmi: hisi-spmi-controller: add it to the building system
>   staging: spmi: hisi-spmi-controller: do some code cleanups
>   staging: mfd: hi6421-spmi-pmic: get rid of unused code
>   staging: mfd: hi6421-spmi-pmic: deal with non-static functions
>   staging: mfd: hi6421-spmi-pmic: get rid of the static vars
>   staging: mfd: hi6421-spmi-pmic: cleanup hi6421-spmi-pmic.h header
>   staging: mfd: hi6421-spmi-pmic: change the binding logic
>   staging: mfd: hi6421-spmi-pmic: get rid of unused OF properties
>   staging: mfd: hi6421-spmi-pmic: cleanup OF properties
>   staging: mfd: hi6421-spmi-pmic: change namespace on its functions
>   staging: mfd: hi6421-spmi-pmic: fix some coding style issues
>   staging: mfd: hi6421-spmi-pmic: add it to the building system
>   staging: mfd: hi6421-spmi-pmic: cleanup the code
>   staging: regulator: hi6421v600-regulator: get rid of unused code
>   staging: regulator: hi6421v600-regulator: port it to upstream
>   staging: regulator: hi6421v600-regulator: coding style fixups
>   staging: regulator: hi6421v600-regulator: change the binding logic
>   staging: regulator: hi6421v600-regulator: cleanup struct
>     hisi_regulator
>   staging: regulator: hi6421v600-regulator: cleanup debug messages
>   staging: regulator: hi6421v600-regulator: use shorter names for OF
>     properties
>   staging: regulator: hi6421v600-regulator: better handle modes
>   staging: regulator: hi6421v600-regulator: change namespace
>   staging: regulator: hi6421v600-regulator: convert to use get/set
>     voltage_sel
>   staging: regulator: hi6421v600-regulator: don't use usleep_range for
>     off_on_delay
>   staging: regulator: hi6421v600-regulator: add a driver-specific debug
>     macro
>   staging: regulator: hi6421v600-regulator: initialize ramp_delay
>   staging: regulator: hi6421v600-regulator: cleanup DT settings
>   staging: regulator: hi6421v600-regulator: fix some coding style issues
>   staging: regulator: hi6421v600-regulator: add it to the building
>     system
>   staging: regulator: hi6421v600-regulator: code cleanup
>   staging: hikey9xx: add a TODO list
>   MAINTAINERS: add an entry for HiSilicon 6421v600 drivers
>   dt: document HiSilicon SPMI controller and mfd/regulator properties
>   dt: hisilicon: add support for the PMIC found on Hikey 970
> 
> Mayulong (3):
>   staging: spmi: add Hikey 970 SPMI controller driver
>   staging: mfd: add a PMIC driver for HiSilicon 6421 SPMI version
>   staging: regulator: add a regulator driver for HiSilicon 6421v600 SPMI
>     PMIC
> 
>  .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 182 +++++++
>  .../spmi/hisilicon,hisi-spmi-controller.yaml  |  54 ++
>  MAINTAINERS                                   |   6 +
>  .../boot/dts/hisilicon/hi3670-hikey970.dts    |  16 +-
>  .../boot/dts/hisilicon/hikey970-pmic.dtsi     | 200 ++++++++
>  drivers/staging/Kconfig                       |   2 +
>  drivers/staging/Makefile                      |   1 +
>  drivers/staging/hikey9xx/Kconfig              |  35 ++
>  drivers/staging/hikey9xx/Makefile             |   5 +
>  drivers/staging/hikey9xx/TODO                 |   5 +
>  drivers/staging/hikey9xx/hi6421-spmi-pmic.c   | 381 ++++++++++++++
>  .../staging/hikey9xx/hi6421v600-regulator.c   | 479 ++++++++++++++++++
>  .../staging/hikey9xx/hisi-spmi-controller.c   | 351 +++++++++++++
>  include/linux/mfd/hi6421-spmi-pmic.h          |  68 +++
>  14 files changed, 1773 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
>  create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
>  create mode 100644 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
>  create mode 100644 drivers/staging/hikey9xx/Kconfig
>  create mode 100644 drivers/staging/hikey9xx/Makefile
>  create mode 100644 drivers/staging/hikey9xx/TODO
>  create mode 100644 drivers/staging/hikey9xx/hi6421-spmi-pmic.c
>  create mode 100644 drivers/staging/hikey9xx/hi6421v600-regulator.c
>  create mode 100644 drivers/staging/hikey9xx/hisi-spmi-controller.c
>  create mode 100644 include/linux/mfd/hi6421-spmi-pmic.h
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
