Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7C8207E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2019 15:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfEPNWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 May 2019 09:22:11 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:39647 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbfEPNWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 May 2019 09:22:11 -0400
Received: by mail-yb1-f193.google.com with SMTP id x5so1238664ybn.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 May 2019 06:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4c/eHlt6Y2MSltoHNBiW76PU+BUs11lf5e6M64GBW24=;
        b=BXvLxUG+rrwtufrtsoEwanZPpxvShNZboOp0jN1+zafuntCSmyO8gX2zolP3Vr3pw+
         09rvmfQO1fjL1gJMr3BvEZUvig9MpmYjUXz9sT7RhtbjAVfqGqFxX9YPnCB0+MYmbYCr
         Y60LJ2FSL6+/MF8N88rCw7bO8t6sYffb43cyAbJsRaR9tzgdLZb2bfYHofuka3if48uV
         zeV+gQkP0sTel0HLOtdgrB/Brvt6XOcx1V4BJzM/12B6HSo/eJPxaGKYcfwdtan4y8j+
         ix85zsiqYKteo9ZwSpFslfF57pJdFciRFHkLNxrjKsWoJ3yri8+D7dVoRpCcqJsLKCUv
         v4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4c/eHlt6Y2MSltoHNBiW76PU+BUs11lf5e6M64GBW24=;
        b=RLs4EZjFFaVuPLAcTOHVO/4iY7KMnB+0EfONMWSU9sgURZ7NjAk+WrAs1I1eQIdGoq
         l4B9z/nkOcEwfgZrYWi5POop55lzroMIwwgXCQGZq3G6njELzavSdmxrqSEQrk3eji12
         L6M82Mii2MtxBMLTVyRORsM77FdNcfBceDoolSadsH+PCo0YiqTSnWs0RljOZD/+DrHz
         Fvxrua5eDiV9s0D1/6d+umU9BKlwu4o3zTSKW5rvMaKxdS9zlQjee9lLxtd5hlvJrRdP
         3zEhvC5fUKc8ABrvpyRjKcBAMTieOrGmPfzXeoIBfO/e8TF/s2GzIKkQ6tAOnRBSmNcj
         pk8Q==
X-Gm-Message-State: APjAAAWVNDd7F41jQGkJMM8Z1IsE1PQBOZ0ndJSHmzeP+1tzWMBu4pEY
        Kc02sTijROpdSNX0o4pxLWwoYQ==
X-Google-Smtp-Source: APXvYqw9jqhY5l1HANdlGqjcRlv2RmkEXMS5oeV+k8cx1Pw7T8hUhYJ4WqE5HLWtD0vmeuLgsJ2NTQ==
X-Received: by 2002:a25:2254:: with SMTP id i81mr21841202ybi.343.1558012929941;
        Thu, 16 May 2019 06:22:09 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (li483-211.members.linode.com. [50.116.44.211])
        by smtp.gmail.com with ESMTPSA id e6sm479541ywb.71.2019.05.16.06.22.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2019 06:22:08 -0700 (PDT)
Date:   Thu, 16 May 2019 21:21:56 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 04/11] ARM: dts: ste: Update coresight DT bindings
Message-ID: <20190516132156.GF12557@leoy-ThinkPad-X240s>
References: <20190508021902.10358-1-leo.yan@linaro.org>
 <20190508021902.10358-5-leo.yan@linaro.org>
 <CACRpkda4aEfgW6e7EfqC=FE_=QzKi5UTDLLzHEryQ6kpcKYzVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda4aEfgW6e7EfqC=FE_=QzKi5UTDLLzHEryQ6kpcKYzVg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Linus,

On Thu, May 16, 2019 at 02:53:48PM +0200, Linus Walleij wrote:
> On Wed, May 8, 2019 at 4:20 AM Leo Yan <leo.yan@linaro.org> wrote:
> 
> > CoreSight DT bindings have been updated, thus the old compatible strings
> > are obsolete and the drivers will report warning if DTS uses these
> > obsolete strings.
> >
> > This patch switches to the new bindings for CoreSight dynamic funnel and
> > static replicator, so can dismiss warning during initialisation.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Will I need to carry this patch or will you send it to ARM SoC?

Please pick this patch into your tree and I will monitor rest
patches with other maintainers.  Thanks a lot!

Thanks,
Leo Yan
