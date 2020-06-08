Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBB21F14C2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 10:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgFHIyr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 04:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbgFHIyq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 04:54:46 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2844AC08C5C4
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 01:54:46 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id c194so14585536oig.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 01:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ROtyPLWOkg3okEi0NwLW2pBM+z9aAMRVrxbgfI3b4pA=;
        b=oyN1beHnXFlzy17CoMj9454c1AhUKNbnqwww/OhaskO1c/8CRxytsLJXVJDHlN05Gw
         WmiJ+1iANSVlyy/ds3iGQteP/3++tq4IesYmnWm4A7ygHPQs5n6/Pw2GXRBG29ui74pH
         /S/iBgNXOLO65muneufsTjAi4FcxT9owaoaBM5Rr+dTbcvW9Kv3EmK1wm6aE954iVjip
         Kkqpk4YTWgK0gpPDaq1/LPAlgS/ZdNvfTlXYzei/S8U2KlyZZm/9wrFTAIZjZYz24SeL
         RoAYrY2DptV5CvyK9HPKIKcjyjufSIIhevJ5ZAV+ItCz+p+kRfVOXBR4zRz1LjvctzuR
         i36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ROtyPLWOkg3okEi0NwLW2pBM+z9aAMRVrxbgfI3b4pA=;
        b=InKv+Xa4OxIjAK+GpNvuasAJEEq4XPZHmr0fqPquu2HXGhEFwoISEl1CnAoR8eYG/8
         pcwkLHDsEXCCclbK8FsH1GmIHZ2feZYJpK475BI9v0/2/3qfryI5Hm/i7KCvLExC6JZe
         4nRU/KTMtbSwxp4KaZsqHqhrwARyCMC1h/DqFOyJ2s//A04g0jkPT8fzd3pL3GzKwQZ6
         t8c152cEU0ES7G6SOcAgc0rdRX/zGT0MOO8sXwb9BTwZ9zJcUysFgchgccLW3ms8EVq5
         rAVAc7MyN6aNVh8dgJAtRoxazPkTg8qOTbV7jbq4X/V1j+KZm1j0UDpFD3oD38QYU5f7
         RHfg==
X-Gm-Message-State: AOAM5323nHNobNUejj7QwxSnCpH1XReEgiAROwa9jvo+NUcWmwJwHSpC
        TR2pfbpZvExO2vH7cLipGKdNq+ySmT9BaN3oMwKzrg==
X-Google-Smtp-Source: ABdhPJw3WRh2WfxEBjtsdO03XTNK03wW3y9RUU7sMpsZrszM14VEdv9E5G/pg0FmlIzdgCjMBDPPxY/Uye5UqFZSCoE=
X-Received: by 2002:aca:a8c3:: with SMTP id r186mr9889996oie.173.1591606485156;
 Mon, 08 Jun 2020 01:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200604120905.1344074-1-robert.marko@sartura.hr> <202006050445.tiQi7ZvY%lkp@intel.com>
In-Reply-To: <202006050445.tiQi7ZvY%lkp@intel.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Mon, 8 Jun 2020 10:54:34 +0200
Message-ID: <CA+HBbNFpHugbM6LDGAtJHj4ZAz-K5ojkovaVZ04V3QJS-hytUw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: ipq4019: fix apss cpu overclocking
To:     kernel test robot <lkp@intel.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        Abhishek Sahu <absahu@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        Christian Lamparter <chunkeey@gmail.com>,
        John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sorry for asking, but are these warnings relevant?
GCC9.3 does not throw them

Regards
Robert

On Thu, Jun 4, 2020 at 10:25 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Robert,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on clk/clk-next]
> [also build test WARNING on v5.7 next-20200604]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Robert-Marko/clk-qcom-ipq4019-fix-apss-cpu-overclocking/20200605-002859
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project ac47588bc4ff5927a01ed6fcd269ce86aba52a7c)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> >> drivers/clk/qcom/gcc-ipq4019.c:1247:24: warning: no previous prototype for function 'qcom_find_freq_close' [-Wmissing-prototypes]
> const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl *f,
> ^
> drivers/clk/qcom/gcc-ipq4019.c:1247:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
> const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl *f,
> ^
> static
> 1 warning generated.
>
> vim +/qcom_find_freq_close +1247 drivers/clk/qcom/gcc-ipq4019.c
>
>   1245
>   1246
> > 1247  const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl *f,
>   1248                                               unsigned long rate)
>   1249  {
>   1250          const struct freq_tbl *last = NULL;
>   1251
>   1252          for ( ; f->freq; f++) {
>   1253                  if (rate == f->freq)
>   1254                          return f;
>   1255
>   1256                  if (f->freq > rate) {
>   1257                          if (!last ||
>   1258                             (f->freq - rate) < (rate - last->freq))
>   1259                                  return f;
>   1260                          else
>   1261                                  return last;
>   1262                  }
>   1263                  last = f;
>   1264          }
>   1265
>   1266          return last;
>   1267  }
>   1268
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
