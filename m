Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D717145FC20
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Nov 2021 03:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347546AbhK0CoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 21:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhK0CmA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 21:42:00 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C62C09B078
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 17:38:02 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id n17-20020a9d64d1000000b00579cf677301so16293412otl.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 17:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/qy2fVsf4IGu5lXH6K0cKVvkPysB8kLgQcCvFksozo8=;
        b=zZRP5+zdTlaagOcbSDxdZ8PuDDuUy/L7LJO3ttHZgQKDlJZE15kNsEiERS21axDcsC
         LUccGVJA9lb+7+bYI5T26Wcb0epFTa0M1Nx7WJgiB79+Z+psUQFoEeivKe2Bfll4f7Ei
         kGlgsOtT3+8TXnqwDPZjqH7LzRmyLYemCBZe+O+KhCaiEkZ9Y2U1l7ffKXknVZqlwtwQ
         FYg8gLxqYn+eSuaag/GfU7zEZfVgmhRyor0e+o0IH9sqXJffV6Ku+SSRsgZJPeXC3Zdk
         hSJzuzKj1vhJCythfVssJF0MTrJMICurmBvllcMeH3K37r+MWPcIZuEYhUMft9+VL7Ul
         wajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/qy2fVsf4IGu5lXH6K0cKVvkPysB8kLgQcCvFksozo8=;
        b=I+er5IqsKxTSha+dkiXfihhQkYT4miQLr8m9eGhw3sV/b+XxKpOMme/XlyGuhLq9Fr
         uD9M54UMDX/Kiw8JmTsWbC2V+wPGyLVB5xGQwqs9lQXjcwRb9RLgc+w3jvMQ40Ajri0d
         g7yyYN29Zzw5nR/Hkki3NKRXz2Y3UKv5JYMJg/RUKqESlJLzyH1hkAFaADtX69f+M7ow
         98G6c9S1lYmV43Lc+IptQ3rRyFimZaO2pCQs6fGPj30faCxLytRESl2LGMf277Uvg3Li
         vvKk5JY86vS7KnYhStXjxQZrQp1IFTdEcQamdRQPHPPAEwC30nP5a9jmVs27+d1ik73c
         SylA==
X-Gm-Message-State: AOAM532z2CTL6/XaIYKOBLjLgoOrRui3S/sg8a1XCednGKjwIzfta87g
        CW+j4gYcX0QQnxrZA/oWGiENi2683vqSsecwN/zoEw==
X-Google-Smtp-Source: ABdhPJwz7YlhjlehvhsdllSAlratkmK3DP53zBfQyCzOUts83RiuSgVdEJlFvaYiY3fJrk8VgZ7a0E75/laPJ89l+QE=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr30440684otl.237.1637977081591;
 Fri, 26 Nov 2021 17:38:01 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdau+wHpoWa1JrLt35dnCHJejs8HZkkzZCrrcnRCx3SinQ@mail.gmail.com>
 <20211126163657.65471-1-dominikkobinski314@gmail.com>
In-Reply-To: <20211126163657.65471-1-dominikkobinski314@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 27 Nov 2021 02:37:50 +0100
Message-ID: <CACRpkdYdOvpS0GgHw9UfMrfnUeEphKUk-y-0vKYSsS9dWc3r3g@mail.gmail.com>
Subject: Re: [PATCH v2,1/5] pinctrl: qcom: spmi-gpio: Add pm8226 compatibility
To:     Dominik Kobinski <dominikkobinski314@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        ivo.ivanov.ivanov1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dominik Kobinski <dkobinski314@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 26, 2021 at 5:37 PM Dominik Kobinski
<dominikkobinski314@gmail.com> wrote:

> From: Dominik Kobinski <dkobinski314@gmail.com>
>
> Thank you for applying the patch. I believe the second one in this series (https://patchwork.kernel.org/project/linux-arm-msm/patch/20211125215626.62447-1-dominikkobinski314@gmail.com/) should be also applied to the pinctrl tree.

Looks like the regulator tree should take this one?
It is a regulator binding...

Yours,
Linus Walleij
