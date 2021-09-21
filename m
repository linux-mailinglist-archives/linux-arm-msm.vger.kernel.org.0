Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48CF413AD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 21:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbhIUTj7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 15:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhIUTj6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 15:39:58 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DDC4C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 12:38:30 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id r26so820272oij.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hxWj5q7swVty+YFYP6m27mJOeJh7UIopy7fIe7UTFO4=;
        b=UVXAxP0uOhzDLmloqA8Kj/dSEX4Xs+hF2dDuRIBZMQikXY42XgBbF2I/pFCi610NCd
         t0Ycu+rvHhzfNDiRfTGROlj1+5UYMnZV65LyhzOD2L02WFWOlrfXu0usjOXK/eeXPpc+
         yvk51a2PZrAHQAHPJBLFiZovjkk3beJfbK+hEyK4x+qzjfgpEXeEU/+dVAnlxc+178qx
         awxxxZFwZl8srpbxc7snPV7rFlGKPt2XiHw+eW4blbwyZ1mLcO8RFCeA7aoA7yjRjrer
         gKsBbcu90JfI/pdvSCYdg8VnFLrgrvfLmKV+rj7BWZjR2BtCmdbFICyY2YKHhtk7V94x
         qZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hxWj5q7swVty+YFYP6m27mJOeJh7UIopy7fIe7UTFO4=;
        b=c9mhzy+QhRrim2xptG6xkPjqnX593WS9dC8hdcGZbR6BRiJM2cHgBHkV2yhxud52v1
         E/6b0mhvtbOuFQ8roVeuGOhR/rmD7tlFAkhDt0NvNvrumSoloUAKW8YmZ1FOsF8TjGRT
         tBWh9ZLfuYmhW/c9XXeL+33TCisiyzK3U9pT3iT7E2sUkD454y22w5ZIp1tEI1Ab1feb
         OaaQykQS/VzbF5pEOJdR8tfYN6nC+kw64Th3uPl5ABN/HqmQAcRgwPbu2hiqMguifxSp
         iPlbGQtUOIo7kkjvk8FB/u7+U8RIrwu8w79YAn0QfQvbrqmnrWVROEpHLx8sD8fZlnBX
         zamQ==
X-Gm-Message-State: AOAM531frx7J32NJemNOzRWAFj+QLXwojvQX9T7jGhKhX98CDJRMX2Vd
        V3ifaFNvmdN0omOYVMbrpquMvw==
X-Google-Smtp-Source: ABdhPJxBAUpBmPVwAPJMJkbQBgvwTKS+BuQWlZyjmauCiwBkgDLRagF9IeJhCn6F97a8CuI9qL2sfw==
X-Received: by 2002:a05:6808:302c:: with SMTP id ay44mr5211232oib.73.1632253109215;
        Tue, 21 Sep 2021 12:38:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 186sm4318717ood.39.2021.09.21.12.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:38:28 -0700 (PDT)
Date:   Tue, 21 Sep 2021 14:38:26 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8916: Drop underscore in node
 name
Message-ID: <YUo0suaIugOco1Vu@builder.lan>
References: <20210921152120.6710-1-stephan@gerhold.net>
 <20210921152120.6710-2-stephan@gerhold.net>
 <CAE-0n51Ukr0FMhzHotrGnrJjE3=w2X_u4ukc1KC_HpjjsUdNfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51Ukr0FMhzHotrGnrJjE3=w2X_u4ukc1KC_HpjjsUdNfg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 Sep 13:20 CDT 2021, Stephen Boyd wrote:

> Quoting Stephan Gerhold (2021-09-21 08:21:19)
> > Using underscores in device tree nodes is not very common.
> > Additionally, the _region suffix in "smem_region@..." is not really
> > useful since it's obvious that it describes a reserved memory region.
> >
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index 5551dba2d5fd..95dea20cde75 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -41,7 +41,7 @@ tz-apps@86000000 {
> >                         no-map;
> >                 };
> >
> > -               smem_mem: smem_region@86300000 {
> > +               smem_mem: smem@86300000 {
> 
> Shouldn't that be smem_mem: memory@86300000? Node names should be
> generic.
> 

I agree, that seems better.

In the meantime, I've picked patch 1 and 3.

Regards,
Bjorn

> >                         reg = <0x0 0x86300000 0x0 0x100000>;
> >                         no-map;
> >                 };
