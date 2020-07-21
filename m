Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2577D228A25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 22:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgGUUtM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 16:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgGUUtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 16:49:11 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63E7C061794
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 13:49:10 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id z5so22728pgb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 13:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T1FdvEWm0bfVCGRMrjZ0Oz5z4raBlVnmb8HIxtTcpT0=;
        b=dC3/vy4vItm5I3D3y+CF7YUq0K0hA8q0s3108YmDJjZ1VieV8wa/KLT5/roFmkoyrv
         2955RT/XiYkYBC/LUamk8XwuLg3sBVi0vQWN04GzRaGRfjoyZif24PbQcV3gl7KvTXdS
         2F7q8EML8AKSA6IIsZWL2v4UQj2r2l03RRLnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T1FdvEWm0bfVCGRMrjZ0Oz5z4raBlVnmb8HIxtTcpT0=;
        b=HRK2qSUqbN1wbLEH+ZS3oMGApOXlWFXDlfffCyDaZC6i0O4p5yZ3Y+taGdBCjgmljt
         6OCSSa+AykmUeuT5zrFJnKNL0l3+5cZ0qZAW78B0rEJHMvYnZVhSI5hm9Y0oxHgj66lv
         mLAZzz8XAdFILTSavZ0vYcw4D3Nh6D2aPHkSievMfASgebfaZgqLjUoDF9vBfY0PNI6t
         M73s36iaxpYIv2Fo8Y0uir150tljbfnK0ez4RKcDoW3/W1ApL/KWfO8chY4G9fwac3qn
         450tlif20RVd9dC2ptwnrrXOYFeCZaweb60JEVs0UMojijYzvd8ExIuV5DHgOnYer+bI
         nXHA==
X-Gm-Message-State: AOAM530S3LgHxJLSryYn1EDSwhepP076WuzCAD+OqL8u/+1pPCV404nJ
        +sQTVm7ZCNnJGun8NM+mi7DM9w==
X-Google-Smtp-Source: ABdhPJzi3t7SQrabajvrJliI/CN809h5fAgeXVfMvd2DnZ8oKsJmFIHYafJxOmoEPmu73OuMpakRvg==
X-Received: by 2002:a63:6dc7:: with SMTP id i190mr23933441pgc.304.1595364550483;
        Tue, 21 Jul 2020 13:49:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id b4sm4081125pjn.38.2020.07.21.13.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 13:49:09 -0700 (PDT)
Date:   Tue, 21 Jul 2020 13:49:08 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, kbuild-all@lists.01.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <20200721204908.GV3191083@google.com>
References: <1594235417-23066-2-git-send-email-sanm@codeaurora.org>
 <202007132352.yb6jBpFv%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202007132352.yb6jBpFv%lkp@intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 13, 2020 at 11:34:11PM +0800, kernel test robot wrote:
> Hi Sandeep,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on balbi-usb/testing/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Sandeep-Maheswaram/usb-dwc3-Host-wake-up-support-from-system-suspend/20200709-031939
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/next
> config: i386-randconfig-a012-20200713 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-14) 9.3.0
> reproduce (this is a W=1 build):
>         # save the attached .config to linux build tree
>         make W=1 ARCH=i386 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    ld: drivers/usb/dwc3/core.o: in function `dwc3_suspend_common':
> >> core.c:(.text+0x3f0f): undefined reference to `usb_hcd_is_primary_hcd'
> >> ld: core.c:(.text+0x40c7): undefined reference to `usb_wakeup_enabled_descendants'

The problem here seems to be that:

CONFIG_USB_DWC3=y

and

CONFIG_USB=m

Add a Kconfig condition that disallows usb_dwc3 to be builtin when the
USB core is built as a module?
