Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B553DAA26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 19:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbhG2R3n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 13:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbhG2R3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 13:29:43 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEBFC0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 10:29:38 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id w6so9391266oiv.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=nuL9Gtrngyb6HozKG8XOhySmiHppyZ4SPKwk+KQp+Zc=;
        b=JdtXha2KVXzKZ2i+/dg6/TqTi8BKHsyrpUafLCGrH3a4/NrAgfn9+1VV61+cKYypI/
         zQis9HjO0mRR/RhoP0rU+vdBW8oNeszZsNBI9t+oY9amV7+Q38G2zdiUy58bnHalNRVT
         BzZ5MybexeU8CXngY8eZukXE4Gw0vor1OAyfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=nuL9Gtrngyb6HozKG8XOhySmiHppyZ4SPKwk+KQp+Zc=;
        b=rr0IlvCvpsxxFNBTuUEADLP99dTwcuN8AT+/W+oMnsH1KmVSFgHmQPS6dBYTak3M6A
         Q8HdrmmzV0VznqI35JZwSNa0CpVRzZNT61AeRuOKz7jiQBZaerwQyVuYLv3aBKslxKKa
         Z+/NxQ9yYOiWPlDe0kse9n9OicyZRr1AG9PpwNryy1phjGXOjaiOWvDm59R/sKM+0u/H
         pWM8zfGtXhk8OLoCeICMQ7wCxINjMhCx2ic+8zHN3EAORv3XnxSsIxFXdXCie6c2ShSP
         EVACtGahR+MQJRkoLkh1H26ELF52vRBc6OICdtMMnPygRjFLWM4nJhTrjSD5BS/kk1Gl
         3WTg==
X-Gm-Message-State: AOAM532RlG0eXSnJ2Y4jHVzMAXVJqmfq8WSexmeBqJwLOCCKqbUTx/ZG
        mH0DV7jFyV3uupFbi4v6qoTX2yaSsmoy9jvS3L01hw==
X-Google-Smtp-Source: ABdhPJwi3G9rwu5lrD06uFLjaL3kNc79dxhFbRDbNktWD54FVP7PGqPqCjr1IvDBEJd9gDzQ74iPrFgSWrFNyjY6nRc=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr3928249oiu.19.1627579778357;
 Thu, 29 Jul 2021 10:29:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jul 2021 12:29:38 -0500
MIME-Version: 1.0
In-Reply-To: <20210728172330.v3.2.Iea8318d85a23f0167fd523ea85df5630147649f9@changeid>
References: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org> <20210728172330.v3.2.Iea8318d85a23f0167fd523ea85df5630147649f9@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 29 Jul 2021 12:29:37 -0500
Message-ID: <CAE-0n50GLdByWnMxf2AZJ0r1pdZFRwG3b5t3V69wZY6H6pf32A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sc7280: Add gpu thermal zone
 cooling support
To:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akhil P Oommen (2021-07-28 04:54:02)
> From: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
>
> Add cooling-cells property and the cooling maps for the gpu thermal
> zones to support GPU thermal cooling.
>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
