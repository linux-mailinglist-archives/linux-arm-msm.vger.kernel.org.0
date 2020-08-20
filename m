Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E312424B6FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 12:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgHTKp5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 06:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731412AbgHTKpo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 06:45:44 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940CCC061386
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2020 03:45:43 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id v15so937718pgh.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2020 03:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e8inUcZeC1EMvDkcDtQU8bF16fiEKmHQKTdE6UvD9Ao=;
        b=ZP0QD+506tNSnZWgxhklM3ACdIxHLDAKs7Y13NpvZb2lV6r7xBuNUnDBfXq2jvNYt5
         7/lQtWJa3Cu4CfERXUOwODKWYU+mc5q5qYgKK8atZQD/l3Z7Zcqfa36O+ah8JEkloJ7/
         4QI/MwpTcOG0VE1ecRxhrUQkH0pIEadmkkaLn0VK5zuxbvSE/NDTjXl7TAQDuoYLIrg7
         lZTOkJP3RN5mhSYnn8+JpyUvQtmpkgc0Oenv7D/7CoFEV7ycyqokUoEQRnSzpdLZ3gXr
         77bL4G/C9sDbJETUHN0n73YPe+3B9OdykJGXhLF73vdoXwUpld0sK/DvCVXPwvGnU8BH
         JPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e8inUcZeC1EMvDkcDtQU8bF16fiEKmHQKTdE6UvD9Ao=;
        b=QBqFsh0JYvL3j67lJN7oz2JbQ6BeFuPOn0GqeRo1SvH+eDBHUStaO8z4Wdb8pyeEHi
         3WyaKSehYhn097WG/8UFTKsRz+NTO0LAJKrkLXPju8hfBYuMJw7YnOlm4fzGilz+n3ff
         jipE7ee5T0umBrjonaRPai2dt6EFfMRkvnTjinJZjooKL9sAOgPWd3DxYXn+2LEEjdhL
         JNTciJZOIs1FeQXNeXWCYx+3B2kPvXg3Yh674ODVtScfa1yyAOuSe1j6pLrRMMjX4t5J
         N9HDknebzrc/2tPpySz26bUB2ivhJ9By+WkcZ/qbZMu9lIl8KgY7L75ST3cPnnjqBYpS
         Gb1A==
X-Gm-Message-State: AOAM530A+b1d/FaoUBC6iOpoWgTLRtdumEsniE+bcmgCCGIdku4rAzTN
        fN5THQiW6s1UEerBoBQ5vd5gKw==
X-Google-Smtp-Source: ABdhPJxOJujoHIwJeXRT5jnwcXre+SjocPhd74ZRzEkHGK2rTIfJshGRbE/6smUIR6n+rpoJPe8BDw==
X-Received: by 2002:aa7:83cf:: with SMTP id j15mr1682989pfn.251.1597920342783;
        Thu, 20 Aug 2020 03:45:42 -0700 (PDT)
Received: from localhost ([122.172.43.13])
        by smtp.gmail.com with ESMTPSA id s125sm2589935pfc.63.2020.08.20.03.45.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 03:45:42 -0700 (PDT)
Date:   Thu, 20 Aug 2020 16:15:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@chromium.org,
        robdclark@gmail.com, stanimir.varbanov@linaro.org,
        mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 1/6] tty: serial: qcom_geni_serial: Use OPP API to set
 clk/perf state
Message-ID: <20200820104540.4c4cg4rn4oa4rh6t@vireshk-i7>
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <1592222564-13556-2-git-send-email-rnayak@codeaurora.org>
 <159347264530.1987609.11350620235820019545@swboyd.mtv.corp.google.com>
 <a3d53f82-b29d-97ef-3ba1-ca9bd650d354@codeaurora.org>
 <20200630030552.cfp5oh33qde6nlnf@vireshk-i7>
 <159532101373.3847286.9695594340556014384@swboyd.mtv.corp.google.com>
 <20200722052444.updchi2yfjgbf3hb@vireshk-mac-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722052444.updchi2yfjgbf3hb@vireshk-mac-ubuntu>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-07-20, 10:54, Viresh Kumar wrote:
> On 21-07-20, 01:43, Stephen Boyd wrote:
> > It seems that dev_pm_opp_set_rate() calls _find_opp_table() and finds
> > something that isn't an error pointer but then dev_pm_opp_of_add_table()
> > returns an error value because there isn't an operating-points property
> > in DT. We're getting saved because this driver also happens to call
> > dev_pm_opp_set_clkname() which allocates the OPP table a second time
> > (because the first time it got freed when dev_pm_opp_of_add_table()
> > return -ENODEV because the property was missing).
> > 
> > Why do we need 'has_opp_table' logic? It seems that we have to keep
> > track of the fact that dev_pm_opp_of_add_table() failed so that we don't
> > put the table again, but then dev_pm_opp_set_clkname() can be called
> > to allocate the table regardless.

I have sent a patchset to clean this stuff up a bit now.

-- 
viresh
