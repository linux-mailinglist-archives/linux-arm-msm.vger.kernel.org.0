Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB58FEAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2019 19:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfD3RSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Apr 2019 13:18:51 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37694 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfD3RSu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Apr 2019 13:18:50 -0400
Received: by mail-pf1-f195.google.com with SMTP id g3so7391613pfi.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2019 10:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8M09mf4d9C1R3KhxiH2MmcrT4xP2EWrCq3b8NOgfWsA=;
        b=gKipQ1pdsxyErkdzR4ohu+KryhsxU0t02ME3acogkXzYjGZqrLQpbvN2VvU/jZHq0m
         r/2mcwlwkVfldN3jyPeDdZHsaaDkJUcRscSvQQ9fxAi6uurcWSbzsMHMlOfYlpW0dNRo
         UlzG43xtofCSz8L9oBYfvJ021Cg9PWvy/ekarl2gcVf+ONj/mhHFzK7dJSILqyCx2kqR
         l+BKgBsF91HV/77sLCLVJ81dHeq+1dQLCuelv4G5L1h7Y96YkCfCOHX/BbD3XGQx1/FU
         uQk5s8d0Wx/tHdp6tNYmWm7XdWXau+vl8W70B/QdeoaeOFMfjuoSUNe0ugFEPOpHCEGz
         wuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8M09mf4d9C1R3KhxiH2MmcrT4xP2EWrCq3b8NOgfWsA=;
        b=nYwuY3Zjhz8igznxGanh5egQPZLNPVxBeH9sGSDRSAzVnLLyIhscbND6cmb05KuumK
         npWGnFnqGL68vGnxf7Zz+Oa85qBZEStu7x2Y0iNG0/zXM4b2YVAl8B3W/4PAHyO5awp1
         H8Ex+N/eylMMgRs3JJ6imWU7v2S//hjlNNBN5XTy0SfOibuP3+WqojVKl+mPd8j8I+vD
         cbWERAAWzIaFq8wXeq5HzA7Bc62MTm2pbrIUrDEfnfTKtPODE/yh8qFK7WR8E8UB8fMi
         xabUXdI0qE8/C2yX16yYVNqY1XoA/Fw/KTWgag64Rgw3zGUr1rcvRCFvgrKq01idA6YT
         pzDg==
X-Gm-Message-State: APjAAAUM6rNpasb4ZoNvvXZ45LV1mw/Y2pPF05Qg8Yp3fEVqe3zI48LN
        IL7jtnMxte1bqcHe0GY1Gb0jDw==
X-Google-Smtp-Source: APXvYqwIV6fARS8L5xf7OJfpsq2RSKwS5E7u2mONG4DLIAVZsS+loPGnOikPOS8QYUxQ3gJEOj4fIQ==
X-Received: by 2002:a63:e003:: with SMTP id e3mr36640958pgh.0.1556644418940;
        Tue, 30 Apr 2019 10:13:38 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k7sm11692657pfk.93.2019.04.30.10.13.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 10:13:37 -0700 (PDT)
Date:   Tue, 30 Apr 2019 10:13:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/8] qcom: spmi/ssbi gpio: correct gpio hogging
Message-ID: <20190430171339.GE2867@tuxbook-pro>
References: <20190306005316.12232-1-masneyb@onstation.org>
 <20190427053034.GH3137@builder>
 <20190427102206.GA296@basecamp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190427102206.GA296@basecamp>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 27 Apr 03:22 PDT 2019, Brian Masney wrote:

> Hi Bjorn,
> 
> On Fri, Apr 26, 2019 at 10:30:34PM -0700, Bjorn Andersson wrote:
> > On Tue 05 Mar 16:53 PST 2019, Brian Masney wrote:
> > 
> > > Here are some patches that fix gpio hogging for all boards that use
> > > spmi-gpio and ssbi-gpio. These depend on the following two patches
> > > that were merged in 4.20-rc1:
> > > 
> > > commit 149a96047237 ("pinctrl: qcom: spmi-gpio: fix gpio-hog related
> > > boot issues")
> > > 
> > > commit 7ed078557738 ("pinctrl: qcom: ssbi-gpio: fix gpio-hog related
> > > boot issues")
> > > 
> > > I've already fixed pm8941 for the Nexus 5 and that fix is queued to go
> > > into v5.1 during this merge window:
> > > 
> > > https://lore.kernel.org/lkml/20181101001149.13453-7-masneyb@onstation.org/
> > > 
> > > Andy: You may want to consider submitting these post rc1 as a fix for
> > > v5.1 and possibly marking these for stable.
> > > 
> > > Brian Masney (8):
> > >   ARM: dts: qcom: apq8064: add gpio-ranges
> > >   ARM: dts: qcom: mdm9615: add gpio-ranges
> > >   ARM: dts: qcom: msm8660: add gpio-ranges
> > >   ARM: dts: qcom: pma8084: add gpio-ranges
> > 
> > Looks like I missed the ARM patches before. All 8 picked up now, with
> > Linus' r-b.
> 
> Andy already picked these 8 patches up in his tree.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git/log/?h=for-next
> 

Perfect. And I see that all 8 are included in Andy's pull request for
5.2

Regards,
Bjorn
