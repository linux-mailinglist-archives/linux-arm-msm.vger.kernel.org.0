Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD469413A04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 20:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbhIUSWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 14:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbhIUSWh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 14:22:37 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F0DC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 11:21:04 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id w206so458544oiw.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 11:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=oTbwphUyMcUq5zg/CsUrGt3c85TPtT8AudcLfTHHPRw=;
        b=fAG8kCpLs9c56J44qQJX25oUwBezBYg9w2YlFDD4beNPRmBiZUMwhXyGdQdZNQ/IM1
         8AVIqChAqsGBkggBlVKMdr28bwvmaAUHAKgBKrQCspSq+4nli/4fGaSTSLFRgn72hxlQ
         k3hghlEdO75HNSTflSJW+ukN8U4t635IpZBeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=oTbwphUyMcUq5zg/CsUrGt3c85TPtT8AudcLfTHHPRw=;
        b=2i2IR3wkuRhuW8y7/a36MBMLklbQxOOkVe5tankoYbF5y0mtlBeDmtmpKNkJYwgD0S
         F6cwBEeuhRjLKAm39iqLeJrdg5skpRmOgiRnCoVZE4oxVErFxpI5+ekYiQGHsznin+h8
         /CBWKNppQhjvHqjcVtyxapWkVhrjr4OeEhgN6DNO0ktbZdY1N0pM9HGqybFbbCzE5Qcp
         wiEijauO4bCp1VCPQLuuElu5RlD1oknoDr5i5qZ0hX+0G3BBMJAcEYQ28ccvfNhyC5lH
         aw2Ag5yZUL+ehjGWjGwBWpMVRkpp6bztZ9RHhOcfZ7P4gUu3Jx3HffoyHISChbzVrt/5
         VnOA==
X-Gm-Message-State: AOAM533aN2IAFINwSYSG5vnINq/9MEDRxrZF9MiSRda4uaI+T83Wataz
        jroEqVtcrUrovqkpbumpSqT8XVVZdOgHtKaOZNcYoA==
X-Google-Smtp-Source: ABdhPJyydMJjdCZcxyhh8uCiqPjp/pNbiuuBLftCdm2CAKUIFkpS2cU/UwoPgO81bRBDQOv9WN0x3XTb0WFb6Y2j7uA=
X-Received: by 2002:aca:1a11:: with SMTP id a17mr4818777oia.164.1632248464401;
 Tue, 21 Sep 2021 11:21:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Sep 2021 11:21:04 -0700
MIME-Version: 1.0
In-Reply-To: <20210921152120.6710-3-stephan@gerhold.net>
References: <20210921152120.6710-1-stephan@gerhold.net> <20210921152120.6710-3-stephan@gerhold.net>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 21 Sep 2021 11:21:04 -0700
Message-ID: <CAE-0n53a7afqnB50Y0aoaALCUWoMkTY0=+Urd0MbRKppOvspJA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916: Add "qcom,msm8916-sdhci" compatible
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephan Gerhold (2021-09-21 08:21:20)
> According to Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> a SoC specific compatible should be used in addition to the IP version
> compatible, but for some reason it was never added for MSM8916.
>
> Add the "qcom,msm8916-sdhci" compatible additionally to make the
> device tree match the documented bindings.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
