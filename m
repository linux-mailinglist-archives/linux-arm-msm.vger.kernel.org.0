Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DEE397888
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 18:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbhFAQ7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 12:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbhFAQ7t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 12:59:49 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF080C061756
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 09:58:07 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id m13so10606390qtk.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ldU/TPmtPmVs6oGr7yGz/gAY04wIfA/VvvfcSuok9Fk=;
        b=ItrTAwFyEd3vy4gcIMd1nyNP0+p9wLUpoepc2e8uV8llGt5bIcguuOkSItn+6rpc9z
         Fc0Te4vtTh3Nw60Q7F+W0cNouuLl8j8GBlj6SUNYWeWdgIVL1iepdsaHtMug2yW2Ec4h
         NSDfw/DRmV5Dai8I+dDkG+HF4HSBW2P+o0LBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ldU/TPmtPmVs6oGr7yGz/gAY04wIfA/VvvfcSuok9Fk=;
        b=g8iwYbBlxgl6E/5pcyDMEL1nUPy9Sq1tr4yUzXHXvIi08Hba0sMLfTVpctpmMlBdWB
         9W9IpvEe4jtwUmzvACsZ3AI6RTsUmUHoKjRu+VwKWAJsXRRe15ofvj8eVjEFSfwci6k9
         S0WDo/dr8TLr//68tBTUbG6eb0/A8uET7p9omYCFynoU3EbpXRdcW7aBvCh+svO5yrDU
         eVFzgr+KDFNJb6/G4Lm07bSTttPr58tEVdTkW7o9borhVPC/h5WylV4nHEuVPwhqAxwK
         4/IV/TMJ6W2Yk5xnc8PE6Mgrs2VoiHBW/D1Md2dxwYfb93/QLQOYZ9nfRY7n7mWIBQ8f
         HlSg==
X-Gm-Message-State: AOAM530RlDSG4yoBak0oyC266ArFCuBoNFblD73RzghRPS4n6tGpcROU
        VuiQnA5emytRxlXX9jCrAXZ8EEAUK3jsUw==
X-Google-Smtp-Source: ABdhPJwe1fTA5JGk9GRREcynjU0430fZjExbdnnwUIg7N+fE2p89apJB1QuCJ96BfXV8E+HMbry4+A==
X-Received: by 2002:ac8:5a8f:: with SMTP id c15mr19927172qtc.162.1622566686425;
        Tue, 01 Jun 2021 09:58:06 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id d18sm11773858qkc.28.2021.06.01.09.58.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 09:58:06 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id y2so22112599ybq.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 09:58:05 -0700 (PDT)
X-Received: by 2002:a25:8191:: with SMTP id p17mr40654965ybk.405.1622566685333;
 Tue, 01 Jun 2021 09:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210510075253.1.Ib4c296d6ff9819f26bcaf91e8a08729cc203fed0@changeid>
In-Reply-To: <20210510075253.1.Ib4c296d6ff9819f26bcaf91e8a08729cc203fed0@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 1 Jun 2021 09:57:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WMfCi9fVHxUqRiy+abgQU2K28BfOHfUrUpwcwUVrrOOA@mail.gmail.com>
Message-ID: <CAD=FV=WMfCi9fVHxUqRiy+abgQU2K28BfOHfUrUpwcwUVrrOOA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Modify SPI_CLK voltage level
 for trogdor
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Wenchao Han <hanwenchao@huaqin.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn,

On Mon, May 10, 2021 at 7:53 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> From: Wenchao Han <hanwenchao@huaqin.corp-partner.google.com>
>
> On coachz it could be observed that SPI_CLK voltage level was only
> 1.4V during active transfers because the drive strength was too
> weak. The line hadn't finished slewing up by the time we started
> driving it down again. Using a drive strength of 8 lets us achieve the
> correct voltage level of 1.8V.
>
> Though the worst problems were observed on coachz hardware, let's do
> this across the board for trogdor devices. Scoping other boards shows
> that this makes the clk line look nicer on them too and doesn't
> introduce any problems.
>
> Only the clk line is adjusted, not any data lines. Because SPI isn't a
> DDR protocol we only sample the data lines on either rising or falling
> edges, not both. That means the clk line needs to toggle twice as fast
> as data lines so having the higher drive strength is more important
> there.
>
> Signed-off-by: Wenchao Han <hanwenchao@huaqin.corp-partner.google.com>
> [dianders: Adjust author real name; adjust commit message]
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 +
>  1 file changed, 1 insertion(+)

I think this patch is ready to land and it's what we're now using in
the Chrome OS tree. See <https://crrev.com/c/2821728>.

-Doug
