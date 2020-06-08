Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA3A1F1505
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 11:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbgFHJHK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 05:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgFHJHI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 05:07:08 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0CBC08C5C3;
        Mon,  8 Jun 2020 02:07:08 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 69so13038301otv.2;
        Mon, 08 Jun 2020 02:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kyMIQpiaSrHfD4wH9LTT6NvRIK3724cSEnBCBR1wvMQ=;
        b=nABDCeEM3dzF7JQ9SMjPCtyx8TOKskfVB23RcOSPnUPwT8/GfvHd9n+ZEw5F1DZgmu
         7WWFv3bfQ32q/E+YN6aYblJubrvGiDgMSyXq6RaJqb21GX7laPv6JAMoUEzN5U86MMWE
         A2zP50eucFkg+sNPrvxNlBzgTGitwPpfFqzLl8PmG50EDU5dyoegJfEGzrMgaRKPQwLD
         aKeNkZGngsjPIYm8HAxy4ziHHrLMLAQ+zg6kLRqyfj6aC2dJhsYpAaXBoyiLL/bYevRl
         zylJs/rqttS4ir4ZgvOEn2cjFw90wfxKWhd4+TNBRvJscAeF/jOL3a/0+OG9CWJ6rfQq
         wiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kyMIQpiaSrHfD4wH9LTT6NvRIK3724cSEnBCBR1wvMQ=;
        b=k0Xd47rLjeyTcQ60/AnyZTTNXQ/B3DjmGRHwjtlBBMJjiXpESya9EUD6U55xUt8fFt
         aqvfN4vTqMaM+EV5c0pZ0tqi7OVZ+3jODUq5o6MvZ+0bv2HEry55GixRpkW9QXUdWru9
         3k/8EC3vii1zaTm/WGQ88V8uPDKPrstx8x/cz4xOAQgaQO5vMl5sYyu/j4KFfN+Y15kb
         shixRnRgdLLg6qUHmI+/5TydQOvj75xwFpf9SHr6T+JMTyHzjbfh1C/P9tkK4OpPL1ca
         oTj5sZEinSVqNMxMpGCiLFmVYUfdavZZ1BxNWNlB0/4puhDRkRbTT9aGuhsdl+ryNnVd
         Snfg==
X-Gm-Message-State: AOAM532uVl8SaL3mZ9T1P7+2Slby8OKsxWRhMdLA9FZQ2DUy5una9jgI
        zUupnTvHdOr9x6Q1YcCABrs=
X-Google-Smtp-Source: ABdhPJzZBL4OC4tz51uUlNYWA7nD++LRVVOJG2JdpduPG2MOljQMNsMDudsDIyeFZ1NJdJboq2kslQ==
X-Received: by 2002:a9d:27a3:: with SMTP id c32mr17871531otb.233.1591607227454;
        Mon, 08 Jun 2020 02:07:07 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:4111:8b00::3])
        by smtp.gmail.com with ESMTPSA id 126sm2321493oii.39.2020.06.08.02.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:07:06 -0700 (PDT)
Date:   Mon, 8 Jun 2020 02:07:05 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     kernel test robot <lkp@intel.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        Abhishek Sahu <absahu@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        Christian Lamparter <chunkeey@gmail.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH] clk: qcom: ipq4019: fix apss cpu overclocking
Message-ID: <20200608090705.GA1597633@ubuntu-n2-xlarge-x86>
References: <20200604120905.1344074-1-robert.marko@sartura.hr>
 <202006050445.tiQi7ZvY%lkp@intel.com>
 <CA+HBbNFpHugbM6LDGAtJHj4ZAz-K5ojkovaVZ04V3QJS-hytUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+HBbNFpHugbM6LDGAtJHj4ZAz-K5ojkovaVZ04V3QJS-hytUw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 08, 2020 at 10:54:34AM +0200, Robert Marko wrote:
> On Thu, Jun 4, 2020 at 10:25 PM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Robert,
> >
> > I love your patch! Perhaps something to improve:
> >
> > [auto build test WARNING on clk/clk-next]
> > [also build test WARNING on v5.7 next-20200604]
> > [if your patch is applied to the wrong git tree, please drop us a note to help
> > improve the system. BTW, we also suggest to use '--base' option to specify the
> > base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> >
> > url:    https://github.com/0day-ci/linux/commits/Robert-Marko/clk-qcom-ipq4019-fix-apss-cpu-overclocking/20200605-002859
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> > config: x86_64-allyesconfig (attached as .config)
> > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project ac47588bc4ff5927a01ed6fcd269ce86aba52a7c)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> drivers/clk/qcom/gcc-ipq4019.c:1247:24: warning: no previous prototype for function 'qcom_find_freq_close' [-Wmissing-prototypes]
> > const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl *f,
> > ^
> > drivers/clk/qcom/gcc-ipq4019.c:1247:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
> > const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl *f,
> > ^
> > static
> > 1 warning generated.
> >
> > vim +/qcom_find_freq_close +1247 drivers/clk/qcom/gcc-ipq4019.c
> >
> >   1245
> >   1246
> > > 1247  const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl *f,
> >   1248                                               unsigned long rate)
> >   1249  {
> >   1250          const struct freq_tbl *last = NULL;
> >   1251
> >   1252          for ( ; f->freq; f++) {
> >   1253                  if (rate == f->freq)
> >   1254                          return f;
> >   1255
> >   1256                  if (f->freq > rate) {
> >   1257                          if (!last ||
> >   1258                             (f->freq - rate) < (rate - last->freq))
> >   1259                                  return f;
> >   1260                          else
> >   1261                                  return last;
> >   1262                  }
> >   1263                  last = f;
> >   1264          }
> >   1265
> >   1266          return last;
> >   1267  }
> >   1268
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

<moved post to the bottom>

> Sorry for asking, but are these warnings relevant?
> GCC9.3 does not throw them
> 
> Regards
> Robert
> 

It should if you are using make W=1, this is not a clang specific
warning (it just happens that clang was the compiler for this report).

It looks like qcom_find_freq_close is only used in
drivers/clk/qcom/gcc-ipq4019.c, in which case it should be marked
static.

Cheers,
Nathan
