Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7CC376B8B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 23:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhEGVRf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 May 2021 17:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbhEGVRe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 May 2021 17:17:34 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C48BC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 May 2021 14:16:33 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso9087981otn.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 May 2021 14:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=APM8DPe+LccdNN0+kDhVMWE01PD1ASVom/GfyL9NQwQ=;
        b=GZ6T53sDSxyJBlvDHo4adf5vjclL7ypHDgiGoE9d1hJDXgzjc7xvS4mBAvDmFetP6S
         zVvvaaBvOvbk8k+J9llQCaOZqyWpGt8oBYMJwlr6x4opNvfBkrVv6l1SdiiJ767zIxnH
         qANjmP+kWk142hAEQlZRKMmP/4iOeWNJPGjmkAAO6rb1WkbWXdHPc81gWwn5EF9Q+VzQ
         P8hepX5Yh7YpGT2CX/d6CdG37NdOprVWJCV/YQA5OYTknrOaZV5YokWvUUgo/BWjfzTv
         +eCa08HIF5ECCWpRVu/vHyVHgvXrCpHjAzUx15DSMqjx2OfIobkpZhSCFoG0m/auP6BM
         TM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=APM8DPe+LccdNN0+kDhVMWE01PD1ASVom/GfyL9NQwQ=;
        b=QQGIe07Vc0YwsuAX2wSwzkAy5vxfgVvzxGSwF7ismEJTP+UQL23p7SA1jU8mq3XVL9
         QAlT+LunOcRY55Svl70eM9qQaRiO5gMW1PENRHrXmFCylCfCGlHwFjAYeGXgymBVCGaQ
         xuMQHeABxtoCIgZMbjDpQvq8R6eisxLSqrY2/R1nVMI2yZ7ev87J/02n1la1HoQNul7V
         kgT6dufMk09gjUAwz+vtW8n6bnYwmCY+ERp62C3PUTE4NkeHFpXz2oiBvBBF7bjRvdqo
         pYvyzkIgNVNc7chGAYyI+yvDhimm3wl0E4PRj99MAHo00YyagrQCC3hPWhhPhn+wMmMb
         /4Ew==
X-Gm-Message-State: AOAM533kWS+vhpGpn7aGwTat8spk6glLw19ThbSoyemiRImfDhnpDWP6
        RVthovuid9bV95wmRDvm2NGOYCIO8bO7Gtx/GzGdtQ==
X-Google-Smtp-Source: ABdhPJzqdKU7pUjJzYnNW7PizvgLbISRnoQ261R0j899n4w4iNfHYMQ3jhpX6z4YfUOJK84+o89SjUC0IdMthaqNvM8=
X-Received: by 2002:a9d:1d01:: with SMTP id m1mr10126143otm.155.1620422192855;
 Fri, 07 May 2021 14:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210505213731.538612-16-bhupesh.sharma@linaro.org> <202105061257.2mFnfdJE-lkp@intel.com>
In-Reply-To: <202105061257.2mFnfdJE-lkp@intel.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sat, 8 May 2021 02:46:21 +0530
Message-ID: <CAH=2NtzgdAnMxY0ih9TD9WEW2-7JN4-doywPG6x88rDzZjDCgw@mail.gmail.com>
Subject: Re: [PATCH v2 15/17] crypto: qce: Defer probing if BAM dma is not yet initialized
To:     kernel test robot <lkp@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, kbuild-all@lists.01.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, 6 May 2021 at 10:23, kernel test robot <lkp@intel.com> wrote:
>
> Hi Bhupesh,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on cryptodev/master]
> [also build test ERROR on crypto/master vkoul-dmaengine/next robh/for-next v5.12 next-20210505]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Bhupesh-Sharma/Enable-Qualcomm-Crypto-Engine-on-sm8250/20210506-054114
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/4c00d66a1b254454e85dc82cb7358649e1dda72c
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Bhupesh-Sharma/Enable-Qualcomm-Crypto-Engine-on-sm8250/20210506-054114
>         git checkout 4c00d66a1b254454e85dc82cb7358649e1dda72c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1 ARCH=m68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "bam_is_probed" [drivers/crypto/qce/qcrypto.ko] undefined!

Thanks, I will fix this in v3.

Regards,
Bhupesh
