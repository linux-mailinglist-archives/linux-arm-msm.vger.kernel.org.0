Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F164F48E439
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 07:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236489AbiANGZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 01:25:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236244AbiANGZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 01:25:23 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C46C06173E
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 22:25:22 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id w188so10954333oiw.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 22:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=P31p+kFVwmOiI3/+SfJ1eDPjKnj+4NHA/QnHEDI8vD4=;
        b=Tc2Ij+r2dRStuwdA2z8k/QMP6qz7UzufJqbZuBNmt1dVz9OGE+Gqvdt2IBChmrOzmZ
         sgUJH1uFjqrEblArY8TN8c1ZRl/NJ1pcUnPnpMcYdfOXhYwOmZJTY1IXAIR/C6wfeRLb
         hMDdAM4AnwBziapK/xqYecBGcFHQECgyZFwPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=P31p+kFVwmOiI3/+SfJ1eDPjKnj+4NHA/QnHEDI8vD4=;
        b=LIoYaGVfcpAJcRodUrxQ2X/ySZxaFnlMLktVKLC0AHPXkf4fUh/U9mNAdO3jW1xMX4
         eK/bj9waW1F+WGeKyNYEPJVTiQxBKGJePcBbMWAh4BTJjhKePX+EzaSK0Mn6oWjQGFIn
         B6IAyomOHnhbHD99bAUZQgtECPtSK9w0usVdAR4bFk6qGDK2Zn4AayUsGU8ymuVR3PSe
         PyW+x62hu4e4UjQ9LMAIDeWaKdykKXekri5ZUuwpztF7WJ09uDy/8ZmCWe4m3Ffjb5AJ
         j1DK3vJVbHPxR/NdQS435ebBUbGRCvPNBSFuHHAQco2cbPyTMPZDKv7/G08YHxOFk5Hy
         tl5w==
X-Gm-Message-State: AOAM530wumNLgrO8H/dSTj/7RB9+bYGARvU8oh271tdPhguBoZ3vnaTY
        nizqGzmK/DW8eLBopWSAi3E/JdriipYIuwcVB5hdaw==
X-Google-Smtp-Source: ABdhPJyNhHiiWL0ga7Yjo6ha5I+du9/9cd9L6+5J2+Yl7zVxUoL7i5Wlm7/epPqhp50BL5TwXwGR8sSzD3FdYLj0MT0=
X-Received: by 2002:aca:a953:: with SMTP id s80mr11793776oie.164.1642141522376;
 Thu, 13 Jan 2022 22:25:22 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Jan 2022 22:25:21 -0800
MIME-Version: 1.0
In-Reply-To: <20220113164233.4.I5604b7af908e8bbe709ac037a6a8a6ba8a2bfa94@changeid>
References: <20220114004303.905808-1-dianders@chromium.org> <20220113164233.4.I5604b7af908e8bbe709ac037a6a8a6ba8a2bfa94@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 13 Jan 2022 22:25:21 -0800
Message-ID: <CAE-0n53Y=GzBxbkbG=Vj+5gcrDreZYL1qMwnu4X1FdKJ78Ky-Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc7280: Add herobrine-r1
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     quic_rjendra@quicinc.com, sibis@codeaurora.org,
        kgodara1@codeaurora.org, mka@chromium.org, pmaliset@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2022-01-13 16:43:03)
> Add the new herobrine-r1. Note that this is pretty much a re-design
> compared to herobrine-r0 so we don't attempt any dtsi to share stuff
> between them.
>
> This patch attempts to define things at 3 levels:
>
> 1. The Qcard level. Herobrine includes a Qcard PCB and the Qcard PCB
>    is supposed to be the same (modulo stuffing options) across
>    multiple boards, so trying to define what's there hopefully makes
>    sense. NOTE that newer "CRD" boards from Qualcomm also use
>    Qcard. When support for CRD3 is added hopefully it can use the
>    Qcard include (and perhaps we should even evaluate it using
>    herobrine.dtsi?)
> 2. The herobrine "baseboard" level. Right now most stuff is here with
>    the exception of things that we _know_ will be different per
>    board. We know that not all boards will have the same set of eMMC,
>    nvme, and SD. We also know that the exact pin names are likely to
>    be different.
> 3. The actual "board" level, AKA herobrine-rev1.
>
> NOTES:
> - This boots to command prompt, but no eDP yet since eDP hasn't
>   been added to sc7280.dtsi yet.
> - This assumes LTE for now. Once it's clear how WiFi-only SKUs will
>   work we expect some small changes.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
