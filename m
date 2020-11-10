Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C5B2AD7D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 14:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731107AbgKJNjQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 08:39:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730044AbgKJNjQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 08:39:16 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7BDC0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 05:39:14 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id x9so2256564ljc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 05:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SHs6rk+covBOCGa2r5C59z2WGwm3xWIwmPpRpLKUBrI=;
        b=rljdcMQH15DQ/TeY5NhmS4o1EytbBid0vSuhKrAorR2rNginA8bCNSY0zfOtyMEaFe
         t4k4lx/dBCGVYmYU/nMpYZxg3hZw4ANlKdrVoU7kSdVOnRXZNAlP+uKrazKw0deR8Jjf
         1xCXGsjZPP+BRJ9Xb8ONAOqvEVDA8uOLmvM7ytQYG/7skKGcT56NbY9zfx3jUujtrmC4
         4XEjCGK9sXSXsGHGGoKhUlwrdZMU8TxxoCKydKfH08pB7qDsMyLt/kzwFgV9/E5WLnXP
         aPpcn3i2BCqecFus7aau5lVenc+LchvQ0u2eb2f/Ns0RwXXcG2qEjJR8nThtm0AkT3B6
         VCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SHs6rk+covBOCGa2r5C59z2WGwm3xWIwmPpRpLKUBrI=;
        b=dlW2R1LQW7OeJ5Go0daSpJJTJtvabjda5M7dPO9WHlxoYelujD58/1Y5JHjmXmivbq
         DWZ76y0Rx+tFrrzgKj4a9sxe+St+1yvw8ZClPYdzMJ3/aTTsa+iOQQZ+WMZbalvxmIRN
         KlEsgXsWDXvPV8vdKsu0tcN+Cj9P4XiGJcnTlk7lU8TYColxSlAjqd7FnQZ9/e2ifgUl
         Wr6A3tTSYTbkVv9dJ/nTTAdZHppM7M5PZC9Uw5U5NdkYWqfUp10bqx8gxw7RTOZR+4KR
         aDLqGiAw22bmfOVn55bKICvFVV4khj7AtRNSAjNPIZNg8NL+8fBIVbMnWdIVq1Z+vXSY
         9ilg==
X-Gm-Message-State: AOAM533q3rPmQGdHxyVRcGadaJqux//pKjEFZGxk/c3aDUZwX7ue550L
        IutoRtDJRjPOGQzhlFMw2jHY9H6YLWiFzwv1xhkHgQ==
X-Google-Smtp-Source: ABdhPJxFkRY1YghIW2j4XkQuAhS5OZqLnFX6JIthyRCWafLjgS8SdBZKjGUYmIWmJTqBtPworFWH3SEKou/Xi3XCz18=
X-Received: by 2002:a05:651c:1205:: with SMTP id i5mr8925422lja.283.1605015551546;
 Tue, 10 Nov 2020 05:39:11 -0800 (PST)
MIME-Version: 1.0
References: <1604570192-15057-1-git-send-email-rnayak@codeaurora.org> <1604570192-15057-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1604570192-15057-2-git-send-email-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:39:00 +0100
Message-ID: <CACRpkdbhezgd7ph2pS3+FeRijdfVCAKEk_O8Jg2_+FrROSC2mQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add sc7280 pinctrl driver
To:     Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 5, 2020 at 10:56 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for SC7280 SoC
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> v2: Consolidated functions under phase_flag and qdss
>     Moved ufs reset pin to pin175 so its exposed as a gpio
>     npios updated from 175 to 176

Looks good to me, just waiting for a nod from Bjorn on this one.

Yours,
Linus Walleij
