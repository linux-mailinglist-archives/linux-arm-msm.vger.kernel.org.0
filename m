Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 668D170341
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 17:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfGVPMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 11:12:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:44630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbfGVPMf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 11:12:35 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6168A21911;
        Mon, 22 Jul 2019 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563808354;
        bh=kDJkVFxJdpfnkKW/VsxQGGICpTCZHEIdkH8Bcq+0pec=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=byjAX7R5IUmwESkY7r6dGfZ49/5cHcamkhxk8gkhdIiUrsaPc+ustzCKDx6EVV1ov
         Ynm4S+VTyh+JIX4W1g1jIJDfVzKzpYM9eU8reREUWl6cl7cGw3Bkknz9oN47oEheUW
         rdDHfLXQ0H2l5KAjFsS0e9N39T2VadYALcZRcaSM=
Received: by mail-qk1-f173.google.com with SMTP id v22so28846055qkj.8;
        Mon, 22 Jul 2019 08:12:34 -0700 (PDT)
X-Gm-Message-State: APjAAAXGFOoZBxBkDZzUwR2Mii/DwKeAds+MXeZm8uwm3bcC4gpKvaLr
        kGPuNzEHBPA/AnPD2fJJDE720hMVROZzyiMo4w==
X-Google-Smtp-Source: APXvYqzhSUDPuFuvd4Ux0ntXUAe5eXIv6i9c/1JIBrLMkzgLDPgCEqHOynVROXpmG4D55eEOyb+eQNi5FFrFzjrK/Dw=
X-Received: by 2002:a05:620a:1447:: with SMTP id i7mr47920813qkl.254.1563808353656;
 Mon, 22 Jul 2019 08:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190722092211.100586-1-stephan@gerhold.net> <20190722092211.100586-2-stephan@gerhold.net>
In-Reply-To: <20190722092211.100586-2-stephan@gerhold.net>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 22 Jul 2019 09:12:20 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Fe+bExtqXRHNoEvATh3qVuDBnS0SqgSJenZs+yDVOOQ@mail.gmail.com>
Message-ID: <CAL_Jsq+Fe+bExtqXRHNoEvATh3qVuDBnS0SqgSJenZs+yDVOOQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: vendor-prefixes: Add Longcheer
 Technology Co., Ltd.
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 22, 2019 at 3:24 AM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> Add the "longcheer" vendor prefix for Longcheer Technology Co., Ltd.,
> an "industry-leading service provider of mobile phone design
> and product delivery". (http://www.longcheer.com)
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
