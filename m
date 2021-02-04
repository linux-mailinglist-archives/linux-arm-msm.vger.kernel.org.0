Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41CC230F8AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 17:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237853AbhBDQzY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 11:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238034AbhBDQyF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 11:54:05 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B41C061786
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 08:53:25 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id n14so3956463iog.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 08:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tMoigY62yIJ7YQaLvSh4gO6ndgFj/k+MzZAps0WdCQs=;
        b=OE8iFElv37z11BKMC5+6KSNhX01GCu8+++7vUS94adQ9iwXQQnxf147b25qPiqp+hX
         Hgobvl6Ru5cEOpk0jtdEb1B87VV+tohUA8qDl4s2vocK9ekMW1S5U2YLfto46yuNmT1i
         fP0SH18Y95ac34e5yi6J1rDzbFFjDaJKLVASWjP+uf9VMFRPpkV2gLnKKb2DC6K9zA8b
         JqixsoMYE7s8YOI4GNLG1BmQ2e+ubgjQOKR4Jvq+01CH37dW0ONjBao3ToP+kXxzyJ5L
         w19dokqqy6+LcS2IpZnVmeOQwtB7d72qMuk3Iapgveh2qYLp647jsezdEI10KuGSs5Fk
         l1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tMoigY62yIJ7YQaLvSh4gO6ndgFj/k+MzZAps0WdCQs=;
        b=IfYv4sVp9R/kxP619fl/OOoPMXTItaEx18v1aHvTI7tieuTwm0H3Kqzx1Iovigku5a
         sujvmqApW/RrF6QjF0UTF+P2OK1+OczCWfPXXg/gGKyXZ7ii/vYZPNBWnm5P7MGd9SNq
         +slM47Rz1mrgcRJBZnd7zNfKxB3sYzBE4N3rpSW6tlg6S3sFD744wH7kJI2beVeOuUQZ
         4PnR6bocvPi0jvh56l4wLwwmI9T1InXZ3LEiXs7TVjAa0ctYtEA+2xk4QXOgukHebhq6
         zwMnEVApq+huwsn2Bl+JKIqD4ZiGdjEDn0jizRKNXJf35Tlgbq4YDN5Vyq55FKHh31Io
         SGNQ==
X-Gm-Message-State: AOAM532JxTepnFhQp8R++UJAyEzYQ6Vb+BBggTRq1quoFfLT+nzT0Wg2
        r96KZZrwyTFJjEdHPL1QBdIhjeeY04qcB3RtOqPHOw==
X-Google-Smtp-Source: ABdhPJzO7TUlQbNvG8Aoc7Cz2V5sQT7YSsyfoUAEWn1aZ1T8jBPXSoj10FQUGe52QiWokGGHWxeONpr4LBRCD0s1vl8=
X-Received: by 2002:a05:6638:1928:: with SMTP id p40mr428995jal.71.1612457604904;
 Thu, 04 Feb 2021 08:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20210204084534.10516-7-arnaud.pouliquen@foss.st.com>
 <202102042006.UBNrTXCE-lkp@intel.com> <c853e1f6-d5f9-4270-5a78-2e9730e5089e@foss.st.com>
In-Reply-To: <c853e1f6-d5f9-4270-5a78-2e9730e5089e@foss.st.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 4 Feb 2021 09:53:13 -0700
Message-ID: <CANLsYky5r2BjBxjXaB4xNFNcb+zyVJshWZzgMUqf6C5Q9op9BA@mail.gmail.com>
Subject: Re: [PATCH v3 06/15] rpmsg: update rpmsg_chrdev_register_device function
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     kernel test robot <lkp@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>, kbuild-all@lists.01.org,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 4 Feb 2021 at 08:11, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
>
>
> On 2/4/21 1:44 PM, kernel test robot wrote:
> > Hi Arnaud,
> >
> > I love your patch! Yet something to improve:
> >
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v5.11-rc6 next-20210125]
> > [cannot apply to rpmsg/for-next agross-msm/qcom/for-next]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Arnaud-Pouliquen/introduce-a-generic-IOCTL-interface-for-RPMsg-channels-management/20210204-165337
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 61556703b610a104de324e4f061dc6cf7b218b46
> > config: openrisc-randconfig-r001-20210204 (attached as .config)
> > compiler: or1k-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/23c166e0b157f0695fa7daefb8c5e30f383c3efd
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Arnaud-Pouliquen/introduce-a-generic-IOCTL-interface-for-RPMsg-channels-management/20210204-165337
> >         git checkout 23c166e0b157f0695fa7daefb8c5e30f383c3efd
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=openrisc
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>>
> > All errors (new ones prefixed by >>):
> >
> >    or1k-linux-ld: drivers/rpmsg/qcom_glink_native.o: in function `qcom_glink_native_probe':
> >>> qcom_glink_native.c:(.text+0x2e88): undefined reference to `rpmsg_ctrl_register_device'
> >    qcom_glink_native.c:(.text+0x2e88): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `rpmsg_ctrl_register_device'
>
> Thanks for highlighting it!
>
> I await further review comments first, but I will address this in my next
> revision, if it still relevant.

I will be surprised if I get to look at your patchset before February
22nd so it may be better to address the above.

>
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> >
