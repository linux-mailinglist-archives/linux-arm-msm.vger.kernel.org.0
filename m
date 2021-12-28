Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7072480B2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 17:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235812AbhL1QTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Dec 2021 11:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235803AbhL1QTl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Dec 2021 11:19:41 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DAFDC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Dec 2021 08:19:41 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id j124so30746285oih.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Dec 2021 08:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AYitZ0Q2H8/UE8ntVEjHxS3ygRuiQMT5kuJ2XWSERHA=;
        b=VFSjddkrSuYDV5bueT8CZ8raosWrrrZ+9XDv2VQ4cJsHzyfj+83vcEz/StnJ5aWbMj
         n/A4OJe4ntdf6qq8sEsnnwlhPHtZtW4kXdR8b8MlSVog3zhL35w3no/3abb2LxdxZZAL
         Igm2moCUsyhyvWDNYv04pnhmZnHUbV6g15mzBRrUymCorkCfU6xBv/dFMBxx759ZzNdN
         UpcF7zfucyXn4KeeYllK+66NUydNBTFx57KNNG5KUkfAKcHru5TytTaZyRkPwn/pfKRQ
         6RxtgrJuNVZ/J+kw0HBY0IIOpM+FUKgzcopb6i5IHvkkPlVOWLjGjUQYJgDBAaiVFWq+
         CT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AYitZ0Q2H8/UE8ntVEjHxS3ygRuiQMT5kuJ2XWSERHA=;
        b=Q++rDFhXYgGBI95WoiV1dj1sK/3Ko0Z6NKRpmwbx47k5qirBxi906CDGjCOFlw/cYA
         J5GkzVeVA3Bx06UApTcYPBOOW8PYiqfL7PKDpUxFnRLiV0owzLK+GU1b1l18j3TAxrup
         j2pY6nj2K/x8r0rXOsQN5Yf7mwx/b5LukSmNaxo5Lw8tGe06q9hMYeBy0kQQRGjzXkPL
         PHRitN+jPq9LzBesHkeWEu1P4kpF5b0LGEa9QfWNC01wD6FhGWja7VmfCCnSzIb615eq
         s17iMtppgmQ6XhbsARCMQzfILY4cU8C+jiUXCfHElDxIS70TOBBpYh5cjQO0opnx403M
         avDQ==
X-Gm-Message-State: AOAM533Qmia2K6xTUqvwf20o1z3MaXaZtdyyyQvRCAxXrCPmf4WO6z/M
        tGDGysTuVQYMZ/66DJ53KGR4Vg==
X-Google-Smtp-Source: ABdhPJwR9tQaHdpponyTVV8xn5GVx9M3djSgjgNJcELczLc3VOt3xH7wlrscMbjQ2O6AGzND2okr3g==
X-Received: by 2002:a05:6808:16a3:: with SMTP id bb35mr17427845oib.72.1640708380807;
        Tue, 28 Dec 2021 08:19:40 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m12sm4072249oiw.23.2021.12.28.08.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 08:19:40 -0800 (PST)
Date:   Tue, 28 Dec 2021 08:20:41 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>, kbuild-all@lists.01.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/8] phy: qcom-qmp: Register typec mux and orientation
 switch
Message-ID: <Ycs5WUwhhUq1g9hA@ripper>
References: <20211228052116.1748443-3-bjorn.andersson@linaro.org>
 <202112282120.JleedcIB-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202112282120.JleedcIB-lkp@intel.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 28 Dec 05:59 PST 2021, kernel test robot wrote:

> Hi Bjorn,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on usb/usb-testing]
> [also build test ERROR on robh/for-next driver-core/driver-core-testing linus/master v5.16-rc7 next-20211224]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Bjorn-Andersson/typec-mux-Introduce-support-for-multiple-TypeC-muxes/20211228-132045
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> config: arc-randconfig-r043-20211228 (https://download.01.org/0day-ci/archive/20211228/202112282120.JleedcIB-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/db0b002b5b2e1055b2df7b430438335a75dc1557
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Bjorn-Andersson/typec-mux-Introduce-support-for-multiple-TypeC-muxes/20211228-132045
>         git checkout db0b002b5b2e1055b2df7b430438335a75dc1557
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    arceb-elf-ld: drivers/phy/qualcomm/phy-qcom-qmp.o: in function `qcom_qmp_phy_remove':
> >> phy-qcom-qmp.c:(.text+0x37e): undefined reference to `typec_mux_unregister'
> >> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x37e): undefined reference to `typec_mux_unregister'
> >> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x384): undefined reference to `typec_switch_unregister'
> >> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x384): undefined reference to `typec_switch_unregister'
>    arceb-elf-ld: drivers/phy/qualcomm/phy-qcom-qmp.o: in function `qcom_qmp_phy_probe':
> >> phy-qcom-qmp.c:(.text+0x14bc): undefined reference to `typec_switch_register'
> >> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x14bc): undefined reference to `typec_switch_register'
> >> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x14e2): undefined reference to `typec_mux_register'
> >> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x14e2): undefined reference to `typec_mux_register'
>    arceb-elf-ld: phy-qcom-qmp.c:(.text+0x14f6): undefined reference to `typec_switch_unregister'
>    arceb-elf-ld: phy-qcom-qmp.c:(.text+0x14f6): undefined reference to `typec_switch_unregister'
>    arceb-elf-ld: drivers/phy/qualcomm/phy-qcom-qmp.o: in function `qcom_qmp_phy_typec_switch_set':
> >> phy-qcom-qmp.c:(.text+0x18f0): undefined reference to `typec_switch_get_drvdata'
> >> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x18f0): undefined reference to `typec_switch_get_drvdata'
>    arceb-elf-ld: drivers/phy/qualcomm/phy-qcom-qmp.o: in function `qcom_qmp_phy_typec_mux_set':
> >> phy-qcom-qmp.c:(.text+0x1962): undefined reference to `typec_mux_get_drvdata'
> >> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x1962): undefined reference to `typec_mux_get_drvdata'

I missed the fact that CONFIG_TYPEC is tristate. As such the QMP driver
now need to be made "depend on TYPEC || TYPEC=n".

I will update accordingly in v2.

Regards,
Bjorn

> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
