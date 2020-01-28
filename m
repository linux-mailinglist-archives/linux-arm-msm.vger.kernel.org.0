Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3A114BDE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 17:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgA1Qh1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 11:37:27 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:41464 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgA1Qh1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 11:37:27 -0500
Received: by mail-vs1-f67.google.com with SMTP id k188so8457733vsc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 08:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wdBTmzXhmHeC2y+w5bp3Tmr7OlXTeRKWIpwTGn8ME1U=;
        b=Jy6LgqTmfR3UQAL/nf0tfINNueuVMCNCsDnr62JvGnqxaaSO6eh3MGvzb2gsmFEIh9
         v8t62XCbAvdWKGGuypZ0FLwOEZ78/yTzMfyma+7Mhjly532URlcehmPWG8YJYOtWvU7+
         LRsSBxPVZR7oanCNXskMFWyNcGIxQQbm+e0KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wdBTmzXhmHeC2y+w5bp3Tmr7OlXTeRKWIpwTGn8ME1U=;
        b=jiXxWI7yyMoOfJGhbJyFdG10HmmwalS55TIYRQsifHuKlZVrC7RpcnFHpjTDnhcTjG
         75zGlWPuWeWdmw01aM3JL2ivw3ZzCPCnHTP7dtfLPO21FwcZPiyHm1jDaNGnY6WitQGW
         9kICDzh8nQyeXeDLH9M0bMB/fhpqU4UrmpkaKQBWImk7NlyaHeVh1BC0OFCyyzZxIHzU
         rd09oAE8MtzOsCNIWmxmI3CpELYWcGf5pIdqCVI1U1VugntxfLtVnSnnG6Y/G096wpz4
         /7uaB/az42YtP4u8i8HwiYXvlJ0Yf82hxPeInht0QbsH4CrKr+stsj0jVoZ09Nh9zET2
         5ErA==
X-Gm-Message-State: APjAAAWh6GVj4Au/2Qqz3jQtA/AXO/5+Rkzfnvk/OIjvQJCI7sJHaYj3
        PiqG5UjyFWcYvPDHfstoWSRus2xrrwQ=
X-Google-Smtp-Source: APXvYqxYgyCEdFDOLbFY34SbHlSYM7fKouFuxodGexRbt+Sax8s+Wb5/WLNd3xiuInjplo2EHdWaTw==
X-Received: by 2002:a67:e9cc:: with SMTP id q12mr6780041vso.173.1580229445948;
        Tue, 28 Jan 2020 08:37:25 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id n189sm5500872vkc.10.2020.01.28.08.37.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 08:37:24 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id k188so8457644vsc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 08:37:23 -0800 (PST)
X-Received: by 2002:a67:fbcb:: with SMTP id o11mr14305246vsr.109.1580229443406;
 Tue, 28 Jan 2020 08:37:23 -0800 (PST)
MIME-Version: 1.0
References: <20200124224225.22547-1-dianders@chromium.org> <20200124144154.v2.7.I3bf44e33f4dc7ecca10a50dbccb7dc082894fa59@changeid>
 <6e585554-d0bd-39d7-2150-e7968dd51fb3@codeaurora.org>
In-Reply-To: <6e585554-d0bd-39d7-2150-e7968dd51fb3@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 28 Jan 2020 08:37:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XpUN0_LRnNc6B-wY3J1f_f23iJussyD-+d8Q-Rjd28zA@mail.gmail.com>
Message-ID: <CAD=FV=XpUN0_LRnNc6B-wY3J1f_f23iJussyD-+d8Q-Rjd28zA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] clk: qcom: Fix sc7180 gpucc parent data
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 27, 2020 at 9:55 PM Taniya Das <tdas@codeaurora.org> wrote:
>
> Hi Doug,
>
> Thanks for your patch. But as mentioned earlier we really want to avoid
> updating the auto generated code.

As per my reply [1], I think you need to update your auto-generation
tools to generate the code that results from my patch.  The existing
code either requires using global clock names to match or requires to
pass clocks in the dts that aren't documented in the bindings.  That
needs to be fixed and my patch fixes it.

[1] https://lore.kernel.org/r/CAD=FV=XFFCPj8S7-WPjPLFe=iygpkYiyMqbneY0DMXsMz+j73w@mail.gmail.com

-Doug
