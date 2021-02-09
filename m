Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38227315A1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 00:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbhBIXdw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 18:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234386AbhBIX2W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 18:28:22 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6E6C06121D
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 15:26:26 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id s107so119760otb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 15:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IwjXZ3dkAIZUownYRrDsDZnRxOFipZhcPjf1znpQlRU=;
        b=q91+zAClRM7pyaCnLFx3MyKyH7OSxHVCSJpb77hP1+0SiR/fqGac79HrjLCaptgY6+
         Lf27lzi31zn+AJXdqJYupbclg/9XBIdSU0quV1yfIw1kKidFcATuGNt50YwFLkCR9Sxe
         BTaX1H7MWwVwg71ebPrwXplIv0VvsW1NztckZJign/UjFLsLvxZ0ylNHYQKApzED5RkY
         bCCm+LpNvgdzyq3tECg/zZJzC9K6y8se77udepdOroQ5Efyhi2WTrLtJaocE2nQtKnsv
         zQITzIU3rPEiEOva3hZ4M8wNFLh/qxx2K8hEDQqKsmZBK91un4Xxpr/0TzXFIswzAfAl
         lK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IwjXZ3dkAIZUownYRrDsDZnRxOFipZhcPjf1znpQlRU=;
        b=bfvQj8DIqTl9e/aSSrmxw/mpTVCJ3VxRPn5taSHUqAk3LVw0dYECiJRN88cyL1SQPv
         LuKfW848AkaUhJa1FZCu3uV0AASjdIAmTrZluhtZ9q3cYW9H5L2hPGh+Isxzk2g4f8hV
         hFbPymQueEwMq3fPSRdrI5KZlJnfoReqHOSBY7UmUjKtE8ltL9VuqvORNgY/s583jA8f
         uuNXyWynbfwJlipLPCXoDu9N/yOM9uhModTDQnIJtR9BiPI6Qg97DHTraeVO5vOcKpBI
         n6HKBA6EcNowOH+2+QA7Xgp4IZSs24yrYuxzEfBBcl2M3eRmaIw+0J070XXcWsoFQfnM
         Dq5g==
X-Gm-Message-State: AOAM532/4va8IzdVbqIBfZqoHD5A7cem1SnSz7DQqriCsMNDqoQlcolB
        OvS0l88gZOBFEmT2JtqCalTD3Q==
X-Google-Smtp-Source: ABdhPJwUBm3MgKUTm/uqt3L5ze0JESuAsqG9gWJMpqLjxyJ5YKUQ/ezM6jHaJ8b0gtPMlK1L69wtlA==
X-Received: by 2002:a05:6830:2106:: with SMTP id i6mr62990otc.260.1612913186087;
        Tue, 09 Feb 2021 15:26:26 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y65sm50603oie.50.2021.02.09.15.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 15:26:25 -0800 (PST)
Date:   Tue, 9 Feb 2021 17:26:23 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Gross <agross@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        Danny Lin <danny@kdrag0n.dev>,
        "J . R . Divya Antony" <d.antony.jr@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Steev Klimaszewski <steev@kali.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Vinod Koul <vkoul@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Biggers <ebiggers@google.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Caleb Connolly <caleb@connolly.tech>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.12
Message-ID: <YCMaH1pYhU2VH8wp@builder.lan>
References: <20210204052043.388621-1-bjorn.andersson@linaro.org>
 <161291108058.974605.13581246808545504549.b4-ty@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161291108058.974605.13581246808545504549.b4-ty@arndb.de>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 09 Feb 17:06 CST 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Wed, 3 Feb 2021 23:20:43 -0600, Bjorn Andersson wrote:
> > The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> > 
> >   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.12
> > 
> > [...]
> 
> Merged into arm/dt, thanks!
> 
> I noticed that this came fairly late in the cycle and has a fairly
> large amount of changes in it. It would be nice if you could try
> to send some of the DT contents a little earlier in the future to
> avoid risking them to miss out.
> 

Yeah, sorry about it showing up late.

I'm trying to balance it because I do feel frustration from the
contributors that the Qualcomm branches are "locked down" for 4-5 weeks
per cycle.

> It could also help to split up the largest branches to make them a
> little smaller, e.g. by having one branch just for new SoC and/or
> new board support, and another branch for changes to existing machines.
> 

It's fairly common that things such as PMICs are reused between new and
old platforms, so I fear that such a split will cause unnecessary
conflicts between my trees.

Perhaps I should just send multiple pull requests throughout the cycle?

Regards,
Bjorn
