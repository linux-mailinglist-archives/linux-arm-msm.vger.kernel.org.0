Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7565F40B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 09:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbfGDHpm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 03:45:42 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40707 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbfGDHpm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 03:45:42 -0400
Received: by mail-lj1-f195.google.com with SMTP id a21so5183523ljh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jul 2019 00:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VqIbRmpqLMGOAT/gnCMxZj540BB+nzZMlAbEvE7fDYw=;
        b=LaqgVE1ssRbhWRJYHPBJhjqh1E8z7JtSWBk911qy/D6r9hoZ3eK1gS+E0H4HqyNfo+
         X2d7vDwKXfMv1lslLTwS47ZIau/5Xn0/1EgFb2Rup+kBttMFiDvppkhRTITPthtcNJwj
         2kDGQBGwgicxgJSJlTRgCgbR+lMO6pGTpiGY5Dl1irjYQavim9ri6XiOh7HtXgUTV+q2
         qY+teMEzE0tgqp6rf674urI9PnH8HCyBhwie21kZy9Anw3Df+hVf83jSHwdaMBKy5iG+
         5BR2O7VurH+pRwKn6pW0JZ4IKVIsN35yPePp/ilP3wgAYhhb7LTFswtXr1ORP6PWbfNE
         WL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VqIbRmpqLMGOAT/gnCMxZj540BB+nzZMlAbEvE7fDYw=;
        b=eMCUjLLrJVnRE1qA7h8xxpN2QwcsVES+HRu4EfG6JssuZogdxmkw7z7QkHZZehsaft
         4I1aC32mRdrXAjig2eHTOVtVX9DLL9gkY1DZZz8y9imHNTWRpXoNmU/mTAxww//+iVJL
         0vx7v29QL5tJIFE9ftXUUvjuZ7qjm+8myWUQ60DCGuxgflexQaQgDao77io72klsc5fJ
         J6VBF9T6YCzb0E3RYBckRXFCr2LEe6xpYcY/nPdBP7+1W2AXncMse8Ceu+7nqmkQiR7m
         0hLvliNd+5sL+oyOb1mAYJmNe2Iu/kUwvIge9XnGOVCIMZYtbp1g6HMC78rnicGq20/w
         zj+g==
X-Gm-Message-State: APjAAAVZRzQEz9PYbNYviLfybl6r1q/AxHroqtqi7rKEgOL5rIhkwS1b
        tsjYqCui4K768lh0L4ENR6vlkpeo8viktHBrfJDpjA==
X-Google-Smtp-Source: APXvYqyvGakK4ylSdsFrtpyn/uqOct9HbmkohFRyFJ5vpJo68nXnvqeMHK72Apyap33ZaUPwqSHgwe9f8bkEGi5kvxI=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr24161474ljm.69.1562226340137;
 Thu, 04 Jul 2019 00:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190702105045.27646-1-vkoul@kernel.org> <20190702105045.27646-2-vkoul@kernel.org>
In-Reply-To: <20190702105045.27646-2-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:45:28 +0200
Message-ID: <CACRpkdatEKYaZF1LEy-O4qfbBFeMQihp4m3Y5TmgBQcXA+v2qg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: qcom: Document missing gpio nodes
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 2, 2019 at 12:54 PM Vinod Koul <vkoul@kernel.org> wrote:

> The bindings for msm8998-pinctrl was missing gpio-ranges and
> gpio-reserved-ranges, so document them as well
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Patch applied with Bjorn's ACK.

Yours,
Linus Walleij
