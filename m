Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C051F262DC6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 13:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbgIILZK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 07:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbgIILIq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 07:08:46 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 109F1C061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 04:08:11 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f18so1828730pfa.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 04:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hHbPBPqCAjeHpFptYktHnZF2Ot4j4iCHuxaSsZ+eCnQ=;
        b=m4KHcZLZ3vphfXLl8Z6uPW+Z5xRc7prauxsfl0JLhrjWsiglWRJP4MpIyU91H/iLho
         zrypWq/9xIvYPiotVpXou3HNQ/xOAUSdnA0p1Aeb2P6B8wsSa9RZ/k3wQsg8i79uXKFf
         oqrgkMysLIqLInktyZ0qNeCahTkBgCR1FU+Sdh8z08fzYT7FIdiuUuOj/THP1lBYxblb
         crk/ICcFVagGGuLu1MtvSBSpBtzUON7VuahiwpKU9qQILtWVvIRGlEVE5GFGdKpbyIDw
         gFqItvEzQktmZxC+C5bsJupV5InVVkiOeLk+WlFuumCOeBab41igCm17UsYlleFsQ8ke
         LG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hHbPBPqCAjeHpFptYktHnZF2Ot4j4iCHuxaSsZ+eCnQ=;
        b=SCVsDGOZpuq6d4955eJonSVSQV2O2NIY+h/o8gI1pnFhSqY09D2+aHfTYPjHsviwAA
         ilaRbPXsbSNnayMiehqvQbRHPZkFGK6sAfm8igofvUMBPKUVwKYaI4HU3BPaFGmsJKjr
         v5yIWDlG+yWz/eG+ot5D1q8E2WbB5IMwPWChKvwVVeZgNSnWxcbgZ4S6tFkNsP90sBOx
         SFTBXf3ug9jcYU4wiz2ant33HcCcazDDhAt62/zk2zlZK5sy/k7sYYfFdSq6eaVbfYRc
         Nq0wsaJkthq1BLwOHfOXqViSCLQZG1FuRNHrFHxQ0dnt/6QZQKzdZ3Fv7ztP7HsJwwgg
         2abg==
X-Gm-Message-State: AOAM533GY62QBu0pd5tbVT+xLx4Xikz5DAa10T+4MaGdfkBAMP63WNJv
        p59WPGKpu/Z9qDUZUXtRLo0k5Q==
X-Google-Smtp-Source: ABdhPJy2EZv/VIxB9RnTfqRMANkRu2WWxpNJfCDbS9BRC+1+0r57LjDxgPFYplFTRs+2i65+o+pECA==
X-Received: by 2002:a65:5849:: with SMTP id s9mr215399pgr.439.1599649690536;
        Wed, 09 Sep 2020 04:08:10 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id w185sm2619035pfc.36.2020.09.09.04.08.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Sep 2020 04:08:09 -0700 (PDT)
Date:   Wed, 9 Sep 2020 16:38:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     rnayak@codeaurora.org, Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Qiang Yu <yuq825@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Clark <robdclark@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>, Shawn Guo <shawnguo@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        lima@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Re: [PATCH V2 0/8] opp: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20200909110807.aw3q4bqxis3ya5ci@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <20200831110939.qnyugmhajkg36gzw@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831110939.qnyugmhajkg36gzw@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31-08-20, 16:39, Viresh Kumar wrote:
> On 28-08-20, 11:37, Viresh Kumar wrote:
> > Hello,
> > 
> > This cleans up some of the user code around calls to
> > dev_pm_opp_of_remove_table().
> > 
> > All the patches can be picked by respective maintainers directly except
> > for the last patch, which needs the previous two to get merged first.
> > 
> > These are based for 5.9-rc1.
>  
> > Viresh Kumar (8):
> >   cpufreq: imx6q: Unconditionally call dev_pm_opp_of_remove_table()
> >   drm/lima: Unconditionally call dev_pm_opp_of_remove_table()
> >   drm/msm: Unconditionally call dev_pm_opp_of_remove_table()
> >   mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
> >   spi: spi-geni-qcom: Unconditionally call dev_pm_opp_of_remove_table()
> >   spi: spi-qcom-qspi: Unconditionally call dev_pm_opp_of_remove_table()
> >   tty: serial: qcom_geni_serial: Unconditionally call
> >     dev_pm_opp_of_remove_table()
> >   qcom-geni-se: remove has_opp_table
> 
> During testing by some of the Linaro folks on linux-next, we found out
> that there was a bug in the OPP core (which makes the kernel crash in
> some corner cases with these patches) for which I have sent a fix
> today which should be part of 5.9-rc4:
> 
> https://lore.kernel.org/lkml/922ff0759a16299e24cacfc981ac07914d8f1826.1598865786.git.viresh.kumar@linaro.org/
> 
> Please apply the patches over rc4 only once it comes out (I will
> confirm by that time once the patch gets merged). Else you guys can
> provide your Ack and I can take the patches through OPP tree.

The fix got merged in 5.9-rc4, please apply the patches from this
series in your trees and base them on rc4. Thanks.

-- 
viresh
