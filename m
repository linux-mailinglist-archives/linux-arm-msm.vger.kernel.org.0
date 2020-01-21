Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9B5B144534
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 20:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgAUTet (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 14:34:49 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43200 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbgAUTes (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 14:34:48 -0500
Received: by mail-pl1-f195.google.com with SMTP id p23so173634plq.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 11:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aUV9WIf/+WuAijFM7r520YHMbrBwtEKarCWd4/n07Ys=;
        b=FhT/TGIJMNKVqvFezudJmCy70QJau4Lgjp/pVETFpLGKQ8EmDVkEUFFtkyXnRrHkYb
         +abi96OWoGwyy6dr/SieIwnoqw5R20Gjd4ckWsVfX2yGHbtWL5aUyMGRW6LiVsxYV6y3
         Qaf+kymrwXrnTh5GVcrKKSPuR9zJ47P/iXy6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aUV9WIf/+WuAijFM7r520YHMbrBwtEKarCWd4/n07Ys=;
        b=plymJae4/5hWEQUe6Z7uBaJodymxzRj2DwUVkEMCUpGw41T/yNO5vUGC9Qh/Fu21Ir
         78Z8Jvz/SnZniWCTuRDy6MtdrlxGZSbpgA5lecaUj8Sdgj39HRbaoLt9w+4tNDjpoUOp
         e8JtfryJxdQWf5mrOvKk00R9qVBM0LWSGYNunY08Pc4YtRWZi0RMzMX6WQ8l4mPJspsC
         aZPphcPgi7851GyhjCHbTt+vjBx1KfAMVGcL+lOclFXpoFyxm3oE+7wnwXQ3MOY2TJjl
         UZR4X5CD3KpmYqSvATcfs9HmzxL9vV34dV8DxvXAuApVylvnHzjF7yPAsjjB35aJhlej
         Aqpw==
X-Gm-Message-State: APjAAAWOJGCrUKkiBl4TnHOOWrJ0OoIoPreLq0Ta5e+ARMDx71H3t+oM
        17UIEPUHkSmMC4m1GjTk61yb/g==
X-Google-Smtp-Source: APXvYqzJng6CekTMfIFgFFnU9bzTC0FCHkYRdePeFO8BpDutiEMXegb/7f1wmc0/BSfJE/kQze50dQ==
X-Received: by 2002:a17:902:ba94:: with SMTP id k20mr7189330pls.60.1579635288161;
        Tue, 21 Jan 2020 11:34:48 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z64sm45459115pfz.23.2020.01.21.11.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 11:34:47 -0800 (PST)
Date:   Tue, 21 Jan 2020 11:34:46 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH V2] mfd: qcom-spmi-pmic: Add support for pm6150 and
 pm6150l
Message-ID: <20200121193446.GU89495@google.com>
References: <1572931309-16250-1-git-send-email-kgunda@codeaurora.org>
 <5dc1cb4c.1c69fb81.af253.0b8a@mx.google.com>
 <c4cee81775c6d82024ca05250290f603@codeaurora.org>
 <5dc2f71e.1c69fb81.8912a.f2c0@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5dc2f71e.1c69fb81.8912a.f2c0@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Kiran,

What is the status of this patch? It has outstanding comments and I
couldn't find a later version. Do you plan to post a v3 in the near
future?

Thanks

Matthias

On Wed, Nov 06, 2019 at 08:38:53AM -0800, Stephen Boyd wrote:
> Quoting kgunda@codeaurora.org (2019-11-05 22:43:59)
> > On 2019-11-06 00:49, Stephen Boyd wrote:
> > > Quoting Kiran Gunda (2019-11-04 21:21:49)
> > >> Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
> > >> found on SC7180 based platforms.
> > >> 
> > >> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> > >> ---
> > >>  - Changes from V1:
> > >>    Sorted the macros and compatibles.
> > > 
> > > I don't see anything sorted though.
> > > 
> > Sorry .. I might have misunderstood your comment. Let me know if my 
> > understanding is correct.
> > 
> > >>>> And compatible here.
> > >>> And on macro name here.
> > 
> > This means you want to sort all the existing compatible and macros in 
> > alpha numeric order ?
> 
> Sorry I also got confused on what the driver is doing. I replied on the
> original patch with what is preferred.
> 
