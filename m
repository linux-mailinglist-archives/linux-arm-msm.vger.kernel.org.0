Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752CC285704
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 05:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgJGDWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 23:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgJGDWv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 23:22:51 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB419C061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2020 20:22:50 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id i5so619491edr.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2020 20:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Lourg1RYIIWpvMWQr+TUObCD9Gx3TD2WZUKJRUks9KE=;
        b=nZqm6qcF6HRSUYLFCRGKoZd6aWjgvq9JFf5HgoJ3L0oAqgW3NjSoU/ig4FvYTuZDUl
         NMBh6WHT/l6//dFKfgbtTbFgX3tBF0z14S2VO7ygvCJgWeHKy1iyZytrc/qyF8hyh2Cw
         EiCUdGhgwObuQVT6J5bNQ3YoKa2n9gxZ6OXLeKFRviIl7VA819vnw94TBnKh+w4ymeve
         A1QoxpwAuw6awYa1el8ezXjUJCLhAy7W16wom9+wt2W4rvEbGeJUI6piUrbcua9eANma
         p0ldgj3w6vTq8ef+EtISgXHmJT043hxqZVkgisHbkHGcvsas2m+S+9eamVLwGN10jl70
         tzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Lourg1RYIIWpvMWQr+TUObCD9Gx3TD2WZUKJRUks9KE=;
        b=sgX1pSl0YO52cIBSqnUrEs5OjnGDg71A5yRxq4+WFlfWb+EMJ6Er7MSnWV9XtPy72i
         2OdSBhTWrPrx24YuZUdVZWzLub29+mBLu8JNb4hzgxp1d/m0KgN79bMoaeOzRZy/OZLN
         EkOU5NZeQ6mfxr6DMz+cDQilOXkcYD9bmPu6hQ6h++CHsKO6J8ZNkiiAsMOcgxNqN/cK
         KIPW2/FbwmNnhJV/uZlhWfLugkczGP2NNaxcsbvS7DnZOU8t+STWP0h6w+Yqac3PYNaz
         LLrwBfQQpic76s3e96IPp5ee+qA3AjmGUIeX5UdDn87gfJrCZgNNnRB4DcMNQ1tZHkZF
         GrrQ==
X-Gm-Message-State: AOAM533T5VihKm9XWIjK5FfrX4Knq+TErgvvIBy7aM5qB7SnPUsY/8cv
        q80mCU/UpzCsXCg0u+Uny+7WczQ0OVWzZ8Nb8uR08Q==
X-Google-Smtp-Source: ABdhPJyO337FEc7TztOCAntc9Y9EOuRv/DLIXBpzL05wvOzTAu1FuBmcfBNGr0GWpgVS72M81efTsD1h+Asz11So/3U=
X-Received: by 2002:a50:8e43:: with SMTP id 3mr1414659edx.178.1602040969392;
 Tue, 06 Oct 2020 20:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200930062603.29009-4-jun.nie@linaro.org> <202010010818.bTfsOYy0-lkp@intel.com>
In-Reply-To: <202010010818.bTfsOYy0-lkp@intel.com>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Wed, 7 Oct 2020 11:22:38 +0800
Message-ID: <CABymUCPW-xKj37FghscTv2xc6fSxGwwbFCVF6kUjgG3iuj2F4A@mail.gmail.com>
Subject: Re: [PATCH 3/3] power: avs: qcom-cpr: add support to msm8939
To:     kernel test robot <lkp@intel.com>
Cc:     Niklas Cassel <nks@flawful.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kbuild-all@lists.01.org,
        Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

kernel test robot <lkp@intel.com> =E4=BA=8E2020=E5=B9=B410=E6=9C=881=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=889:00=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Jun,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on pm/linux-next]
> [also build test WARNING on robh/for-next linus/master v5.9-rc7 next-2020=
0930]
> [cannot apply to battery/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Jun-Nie/Support-CPR-on-m=
sm8939/20200930-142825
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.g=
it linux-next
> config: x86_64-randconfig-m031-20200930 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> smatch warnings:
> drivers/power/avs/qcom-cpr.c:1957 cpr_fuse_match_tuple() warn: always tru=
e condition '(drv->cpr_fuse_map_match !=3D (-1)) =3D> (0-u16max !=3D (-1))'
>
> vim +1957 drivers/power/avs/qcom-cpr.c
>
Rob,

Thanks for your precious comments! I will fix these issue soon after holida=
y.

Regards,
Jun
