Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCE235515C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 12:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238793AbhDFK5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 06:57:36 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:42683 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbhDFK5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 06:57:35 -0400
Received: by mail-lf1-f48.google.com with SMTP id o10so21995582lfb.9;
        Tue, 06 Apr 2021 03:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=FEdQ8T8ShTnV7/KIWcPi8USauPRfwGV1+kSK+ns2ves=;
        b=JNHp9EwP5r0jJ5ibhy4L5Sc91DPqgyFkxfJWO5xTHiBZwxtFtQJKGCf5m3YCNJLKxH
         hb9+mAk+ATACSECk7WI+PNEEk0leO08mZ6k7KWLgJD5yXQgSVFgKbEp0RSxZ1xWntM0U
         iKoq9WmtNdYtUg2Z8ybAElUKlvjOjze0yyO3NayqBg8qMGjzT3UKoG4mdKp12RO8zIM/
         hF/L6CXmbnX+/ccUsb4MgHbQNdtnDX5E3GYtJvePByTZ30klpjrLQGCamlxws3OjFO2o
         2gKHhzhIe5k1vuR+glo8KPkqF4V+YPdTAZFHDC2jd/XcSYA/wA58U3r+icFtxsr+bHy+
         L2Rg==
X-Gm-Message-State: AOAM533dBocIdPQ20bD8lm1OQu3iJRaKkTdTUElDJd4kAed21dR3Wtu9
        uUiA7JUDtaylwaMxcFyoCiM=
X-Google-Smtp-Source: ABdhPJxeuonh/Z3VwfyACpkl5uskYDC6lm8z4fgmTODQON9HCJp2hgEx5K8p5Ho+RQtehTUg+0twuA==
X-Received: by 2002:ac2:4ed0:: with SMTP id p16mr20519333lfr.623.1617706645366;
        Tue, 06 Apr 2021 03:57:25 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id h6sm2112464lfd.77.2021.04.06.03.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 03:57:24 -0700 (PDT)
Message-ID: <7706d59fe7120106e4695fd83da5b089d5a36d87.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v4 3/7] regulator: IRQ based event/error notification
 helpers
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org
In-Reply-To: <202104061806.LUDNu0F6-lkp@intel.com>
References: <2b87b4637fde2225006cc122bc855efca0dcd7f1.1617692184.git.matti.vaittinen@fi.rohmeurope.com>
         <202104061806.LUDNu0F6-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Tue, 06 Apr 2021 13:57:19 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 2021-04-06 at 18:27 +0800, kernel test robot wrote:
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/kernel.h:16,
>                     from arch/x86/include/asm/percpu.h:27,
>                     from arch/x86/include/asm/current.h:6,
>                     from include/linux/sched.h:12,
>                     from include/linux/ratelimit.h:6,
>                     from include/linux/dev_printk.h:16,
>                     from include/linux/device.h:15,
>                     from drivers/regulator/irq_helpers.c:10:
>    drivers/regulator/irq_helpers.c: In function 'die_loudly':
> > > drivers/regulator/irq_helpers.c:46:11: error: expected ')' before
> > > 'msg'
>       46 |  pr_emerg(msg);
>          |           ^~~
>    include/linux/printk.h:301:21: note: in definition of macro
> 'pr_fmt'
>      301 | #define pr_fmt(fmt) fmt
>          |                     ^~~
>    drivers/regulator/irq_helpers.c:46:2: note: in expansion of macro
> 'pr_emerg'
>       46 |  pr_emerg(msg);
>          |  ^~~~~~~~

Ouch. Feeling stupid now.
I am sorry for the hassle folks. I'll fix this ASAP and resend.

> 
> vim +46 drivers/regulator/irq_helpers.c
> 
>     43	
>     44	static void die_loudly(const char *msg)
>     45	{
>   > 46		pr_emerg(msg);
>     47		BUG();
>     48	}
>     49	

Best Regards
	Matti Vaittinen


