Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969411F15B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 11:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729255AbgFHJna (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 05:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728745AbgFHJn3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 05:43:29 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4C6C08C5C4
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 02:43:28 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id s13so13090396otd.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TYEy+8z/tFUxcc58fN1UDywpoBpG6q97Kp55SPoLlFQ=;
        b=mx5PE7c9S7yIQQey9oDYYV9HhPDwCCObLL9zMXO5gI1cq1fvp8xBoTeX/bB9/tcr94
         xvd46Fe5pNQ0KZgTlZt6KqIbH4Ba8t0gt616S9V9UoeG3GZaL5Nqv1clWU+GCJ6/hUK6
         6kgZhSKtE5KQo498/9wTDNy3FdRqcBrQVdMmaj2ktDgYvHLq7vNmGMZCukXeqxXlk0tQ
         cs02Wh3rUj0F0kdy17AJyVtg2hgl6N++aPUkgwKJTAGCq4nhtk4+O+j0c+bnhSas4ZvO
         sfmJvEaew56pHY9q+yfgTM7xGRCkr1OrTzu4+T4NRW/5r8Yq7jx7vWvjBaas3JsWWyP0
         7nIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TYEy+8z/tFUxcc58fN1UDywpoBpG6q97Kp55SPoLlFQ=;
        b=CAgXxFsM8DUntHCu/SJnqTFOFqTeDuEVq4zCSlElvaDl6wzZ7uehjyhbzfJXKPkC7m
         7VJo0SgPKDcAW1/0knKoXSAbynM5ncuMXTzhFGfUFL3+TcSarQziSPnS/OY70q20INd3
         i8bDYS3j87u2fmLe48dmSo/aE7R3ljITCXfa2SC+WfGLkdkslv1NVTXR7LlC1XdvKFwZ
         lro172zRe39XE9Zf5P4V0JqvgsGj6+Oi7yDVwfuaNO5bqz+2DnOVEd4fBhsA9cESsL9C
         yNaLnoeXkkF9bgAxZ2qASISJFJjyPtg6dczywKlQOEmsFvAASQU4I4QcZHsJihGhcNlH
         XeWA==
X-Gm-Message-State: AOAM530gBLIt1eeoGxMSbfcdT0C/Z8oFqiMOG9ZbSdfg+ZOHewnHCDkq
        tjVCuGITMm6JY1lrHRG7gMG9Warw/1afwxzyi0tkzg==
X-Google-Smtp-Source: ABdhPJzch/7ONQ8ZPK1KBOpA7Dst9zDuZ3FJ4djIcjndSpwGsnxcucHOb/OqZROcfPYD8G+gcU9sU93ZNxGx5tHguyQ=
X-Received: by 2002:a05:6830:60d:: with SMTP id w13mr16894582oti.243.1591609407458;
 Mon, 08 Jun 2020 02:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200604120905.1344074-1-robert.marko@sartura.hr>
 <202006050445.tiQi7ZvY%lkp@intel.com> <CA+HBbNFpHugbM6LDGAtJHj4ZAz-K5ojkovaVZ04V3QJS-hytUw@mail.gmail.com>
 <20200608090705.GA1597633@ubuntu-n2-xlarge-x86>
In-Reply-To: <20200608090705.GA1597633@ubuntu-n2-xlarge-x86>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Mon, 8 Jun 2020 11:43:16 +0200
Message-ID: <CA+HBbNFPtHK3AJBnY3TOG67tciW01rEoYaaAu+A7GP0pdcTsvw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: ipq4019: fix apss cpu overclocking
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     kernel test robot <lkp@intel.com>, Andy Gross <agross@kernel.org>,
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

On Mon, Jun 8, 2020 at 11:07 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Jun 08, 2020 at 10:54:34AM +0200, Robert Marko wrote:
> > On Thu, Jun 4, 2020 at 10:25 PM kernel test robot <lkp@intel.com> wrote:
> > >
> > > Hi Robert,
> > >
> > > I love your patch! Perhaps something to improve:
> > >
> > > [auto build test WARNING on clk/clk-next]
> > > [also build test WARNING on v5.7 next-20200604]
> > > [if your patch is applied to the wrong git tree, please drop us a note to help
> > > improve the system. BTW, we also suggest to use '--base' option to specify the
> > > base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> > >
> > > url:    https://github.com/0day-ci/linux/commits/Robert-Marko/clk-qcom-ipq4019-fix-apss-cpu-overclocking/20200605-002859
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> > > config: x86_64-allyesconfig (attached as .config)
> > > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project ac47588bc4ff5927a01ed6fcd269ce86aba52a7c)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install x86_64 cross compiling tool for clang build
> > >         # apt-get install binutils-x86-64-linux-gnu
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > >
> > > >> drivers/clk/qcom/gcc-ipq4019.c:1247:24: warning: no previous prototype for function 'qcom_find_freq_close' [-Wmissing-prototypes]
> > > const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl *f,
> > > ^
> > > drivers/clk/qcom/gcc-ipq4019.c:1247:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
> > > const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl *f,
> > > ^
> > > static
> > > 1 warning generated.
> > >
> > > vim +/qcom_find_freq_close +1247 drivers/clk/qcom/gcc-ipq4019.c
> > >
> > >   1245
> > >   1246
> > > > 1247  const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl *f,
> > >   1248                                               unsigned long rate)
> > >   1249  {
> > >   1250          const struct freq_tbl *last = NULL;
> > >   1251
> > >   1252          for ( ; f->freq; f++) {
> > >   1253                  if (rate == f->freq)
> > >   1254                          return f;
> > >   1255
> > >   1256                  if (f->freq > rate) {
> > >   1257                          if (!last ||
> > >   1258                             (f->freq - rate) < (rate - last->freq))
> > >   1259                                  return f;
> > >   1260                          else
> > >   1261                                  return last;
> > >   1262                  }
> > >   1263                  last = f;
> > >   1264          }
> > >   1265
> > >   1266          return last;
> > >   1267  }
> > >   1268
> > >
> > > ---
> > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> >
>
> <moved post to the bottom>
>
> > Sorry for asking, but are these warnings relevant?
> > GCC9.3 does not throw them
> >
> > Regards
> > Robert
> >
>
> It should if you are using make W=1, this is not a clang specific
> warning (it just happens that clang was the compiler for this report).

Thanks, W=1 does indeed show the warning along with a not evaluated return.
>
> It looks like qcom_find_freq_close is only used in
> drivers/clk/qcom/gcc-ipq4019.c, in which case it should be marked
> static.
Thanks, it does indeed solve the warning.
I will send a v2 today.

Regards,
Robert
>
> Cheers,
> Nathan
