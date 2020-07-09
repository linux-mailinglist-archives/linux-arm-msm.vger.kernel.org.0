Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A8221A17B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 15:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgGINzp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 09:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbgGINzo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 09:55:44 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF310C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 06:55:44 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id x13so1120525vsx.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uvdUTUBCGZqUMdwLDtpi1qhRLGsXKk3oKvMSF6NVFvA=;
        b=PcFOQfbmUAxlh206DQ+dvWUrunk3HxBgHLXkZcFQOj8ZowlcWwXsN2GYmzC1ZYOdqv
         TOI359jYlpOQOnfIyAh5r7B9r7rOiV5OqxFy+tr3700WAE7+ZySwrHqqjEychG11ZqeW
         4ATk4QHxP7h7zvq5HecybANddW3f07dhIipzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uvdUTUBCGZqUMdwLDtpi1qhRLGsXKk3oKvMSF6NVFvA=;
        b=DBIVdz8anJ+c2m53I3gonJH5xwkwVrwIznlQfcDzijn84LC2W9GW+xntt2ldNceyOx
         d4Gk5YmgwjAA2qBFnW7qvhsLiB7DAAXGHc6R6AfgjkNB7nZbWgG8PNwUWhqLG2M2GPwH
         mNizQjgK071hrQ2Srt6su4A6kvBLpKckr9NgHTORFrYf7545ukmk/5gzeULbFicv8c5l
         mvOMg+HAPYTifIXRCyr4Du8WPc6e04TLaaFX7NWfjb91NDF0uj7GshjrhwjLdwW2kkxt
         /F/9TIPkj5CBNow+9raLZQ80NJBk0GdRBaAK63jmcBGXdy1hLxsfhkFZF/iBTOTE79EE
         wMPg==
X-Gm-Message-State: AOAM5305LQs/MrmAqK5JH89SO/PkAiUTFOqpvlNCPjFU2ZER9aQ0Gyd5
        cKenknoBmv4oAoyhnF90r7iBvBX+ByQ=
X-Google-Smtp-Source: ABdhPJw6zC7yBQ+1QfcqGiMZWa+7PHj7OIdyYN5nBMgJeE2Fd8Pq1RmsKfblumE0gF4ayJu1hCo1Fw==
X-Received: by 2002:a67:1105:: with SMTP id 5mr33822440vsr.174.1594302943708;
        Thu, 09 Jul 2020 06:55:43 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id t11sm367964vsl.8.2020.07.09.06.55.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 06:55:43 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id s192so453670vkh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 06:55:42 -0700 (PDT)
X-Received: by 2002:a1f:61c2:: with SMTP id v185mr16505453vkb.42.1594302941836;
 Thu, 09 Jul 2020 06:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
 <202007090806.AIZtwLQc%lkp@intel.com>
In-Reply-To: <202007090806.AIZtwLQc%lkp@intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 9 Jul 2020 06:55:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXSLS8v0nrhQggbp3w-4b_WhsMjzLey-YW0gYoKsjjxw@mail.gmail.com>
Message-ID: <CAD=FV=XXSLS8v0nrhQggbp3w-4b_WhsMjzLey-YW0gYoKsjjxw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Handle broken PDC dual edge case on sc7180
To:     kernel test robot <lkp@intel.com>
Cc:     LinusW <linus.walleij@linaro.org>, kbuild-all@lists.01.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 8, 2020 at 5:53 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Douglas,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on pinctrl/devel]
> [also build test WARNING on v5.8-rc4 next-20200708]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Douglas-Anderson/pinctrl-qcom-Handle-broken-PDC-dual-edge-case-on-sc7180/20200709-051816
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> config: arm-defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/pinctrl/qcom/pinctrl-msm.c:914:6: warning: no previous prototype for 'msm_gpio_handle_dual_edge_parent_irq' [-Wmissing-prototypes]
>      914 | void msm_gpio_handle_dual_edge_parent_irq(struct irq_desc *desc)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> vim +/msm_gpio_handle_dual_edge_parent_irq +914 drivers/pinctrl/qcom/pinctrl-msm.c
>
>    913
>  > 914  void msm_gpio_handle_dual_edge_parent_irq(struct irq_desc *desc)

This is just because I'm missing a "static".

For now I'll hold-off on reposting and wait for additional feedback.
If I don't hear anything for a little while I'll re-post with this
fix.

-Doug
