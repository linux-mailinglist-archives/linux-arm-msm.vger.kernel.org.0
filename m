Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24901358941
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 18:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbhDHQHM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 12:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbhDHQHM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 12:07:12 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC10C061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 09:07:00 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id n12-20020a4ad12c0000b02901b63e7bc1b4so625178oor.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8n6PD398vLDKqWf/ectqMMJzVXR9M2nPC8GQRN8gd1w=;
        b=bownvqCi3YJTcISqfbTLfxHDhrVz8OdhEkj/GuyB/zzXxAIOGiYl3nrvQWCmV8SsTH
         glFehjiK+guuep8vsLJBCFb2jbeI3eDRnwx0t0bUcF6UWZiutMV9MLzLQ2kyI+ULr+82
         NGHyiziysRcDJaqaKBsaHf2DFtNlDkL3zCgc6ECB8ZC91IQH4dOIrLB/7d/rAqkaGTOr
         BGfC6RNM7D787J3qRZBEQ/cO69vy5gBA0Fwj/jDzBmvk48vgcEUObnSgsOxfp3rcTmQV
         4QrvyWpcB7l/7swxnQcBGw/52d9uHByhJ3MEdwfbgYebUowLg5o1hjN3cpBLD/00kB2l
         ENzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8n6PD398vLDKqWf/ectqMMJzVXR9M2nPC8GQRN8gd1w=;
        b=LChEuCwO7DJzmk3cVhOUvsFxoobc9sF44zkBeqjH/k3klrwTqZnXgRd9mupv9xNi1y
         QxqtlDPlsWt82Ybzv+irOrovUR9BQSmljDxsOvnJjE5A8dPpE2fGzbh+P70RP1PtYxFt
         z3r3MGD5/xwGK19Nx1Mxisng5SINOtGQYzSw2nBiHZe/k7ibqDQ6nZIkY4KkFdzuMfTz
         Y+yAtVewPh0rh8BuCuD3S1mEReaAIOCr2yhakEpfoZPKPdckzPBwIspROvphUJCIctLX
         tik2XqwyK8s/jKfZDylEyrnHa270jbWNW1TGQI6ADJENjUPLDmDvf16aH5pxWwY5+pPp
         HKNQ==
X-Gm-Message-State: AOAM531wZpNKpcHJ8/YkV9DWM4oBnvSwua+AzLLa5VvYSuF+G1H228K2
        Qefnv6zJQLE6YIPZlGPzDpImfQ==
X-Google-Smtp-Source: ABdhPJyofHnn0NB/A8bZ/Af2kU9kjgUV8JKD4Y6VBFrtZ+X51GBGSQxpBVwm7UoxRU4RDfvKzXYCMA==
X-Received: by 2002:a4a:4843:: with SMTP id p64mr7998193ooa.9.1617898020081;
        Thu, 08 Apr 2021 09:07:00 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d13sm6242543otk.74.2021.04.08.09.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:06:59 -0700 (PDT)
Date:   Thu, 8 Apr 2021 11:06:57 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Robert Foss <robert.foss@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>,
        Abhishek Kumar <kuabhs@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
Message-ID: <YG8qIfFdY+As5tye@builder.lan>
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
 <161789462034.1629934.2631576576205147984.b4-ty@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161789462034.1629934.2631576576205147984.b4-ty@arndb.de>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 08 Apr 10:24 CDT 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Sun, 4 Apr 2021 11:49:14 -0500, Bjorn Andersson wrote:
> > The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> > 
> >   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.13
> > 
> > [...]
> 
> I noticed a couple of new warnings from 'make dtbs_check W=1':
> 
> qcom/sc7180.dtsi:1204.21-1220.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a8c000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> qcom/sc7180.dtsi:965.21-981.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property qcom/sdm845.dtsi:3912.23-4045.5: Warning (simple_bus_reg): /soc@0/camss@a00000: simple-bus unit address format error, expected "acb3000"
> qcom/sdm845.dtsi:4041.10-4044.6: Warning (graph_child_address): /soc@0/camss@a00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> qcom/sdm845.dtsi:4102.32-4129.5: Warning (simple_bus_reg): /soc@0/dsi-opp-table: missing or empty reg/ranges property
> qcom/msm8916-samsung-a5u-eur.dt.yaml: spmi@200f000: reg: [[33615872, 4096], [37748736, 4194304], [46137344, 4194304], [58720256, 2097152], [33595392, 8448]] is too long
> qcom/sc7180-trogdor-lazor-r0.dt.yaml: gmu@506a000: compatible:0: 'qcom,adreno-gmu-618.0' is not one of ['qcom,adreno-gmu-630.2']
> qcom/sc7180-trogdor-lazor-r1-kb.dt.yaml: memory@80900000: 'device_type' is a required property
> qcom/sdm850-lenovo-yoga-c630.dt.yaml: memory@97b00000: 'device_type' is a required property
> 

I saw your other email regarding these and per Rob's request we've
ramped up our effort on cleaning these out. I've however still not
figured out a good way to incorporate the dtbs_check in my patch
handling workflow.

> Maybe see if you can address these in a follow-up, to avoid regressions.
> 

I'm about to send you a another set of pull requests with some more
goodies that was lingering on the list. I will take a look to see if I
can follow up on that with some fixes for above warnings - and take
another look at incorporating dtbs_check in my workflow.

> Merged into arm/dt, thanks!
> 

Thank you!
Bjorn

> merge commit: 61bac46eed14ad73cd41c5b7075350fef78ca4be
> 
>        Arnd
