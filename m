Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE28F38D07B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 00:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhEUWEe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 18:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbhEUWE3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 18:04:29 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEEB0C0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:03:05 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id b25so21095586oic.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=pzKNRkHD1GNhytbNm0qyC8uugnjVx+JEcDbKcGF2mAQ=;
        b=hzRbJzokd7znZEEz7ntX4xnel0dSN6jBODhNY0TlfutlGOd6LP91lj3MVcyJH4oiId
         XL4+TWRp6BNs8ygjz7cWTvVAJN1XzqlGmRHCNBZ2K0EwFjHijbt4hva1NQ4Nu0WhuKqi
         sbyYhmrB9qP+BmnWFgA0iPDaW+LfVVPsb7TVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=pzKNRkHD1GNhytbNm0qyC8uugnjVx+JEcDbKcGF2mAQ=;
        b=nKf8ZdzBWmSLvl6hFHiPm0ILW6IxgNjOnYogXIva3kNRtKC/b7Qu7Z7L7vhpJwVUwC
         5+DO3ry4rFAyU5/2rcKlQVGt7eOWVgQxLuZv3rXG4PIYbL0pXWDoGeC/DX+wcnFNKNUW
         HZ5zS9ZKoTKwVg8YSbl4ueiKIV4YM+bn+iuN9mYuR0v5H8NPWB+dGBh5P7jb5sTzEYrQ
         BgY8EqLj4ww5TYEUHRrSoSrdzs5XB+KPgmCuqigvr97hAncv8JE2gS6NGdaoGwgztgoN
         TTewDIgLj9cKFpqm7MagJ6XWuNDtv2TbgUEggJI5frGtfCX8ItgoI2fYhswGIFCnOePK
         ltIQ==
X-Gm-Message-State: AOAM530MwdgSn2X+6pLaHadUiIgwg42rvw8u+A3/HXP8TR/OKI+ZENxy
        B/AmObK8iPaXPx0bdR6ETuNyVptEhmO2ryupxbpiHA==
X-Google-Smtp-Source: ABdhPJxzZeFCuvEHHfr0jh0BGj8DNe0c+fJulfyLxZyDQ11XRo+6BhrT+IckpYwjcPqigqEUwkDVDNUQ7PR0eevvL4U=
X-Received: by 2002:a54:4501:: with SMTP id l1mr3716630oil.19.1621634585134;
 Fri, 21 May 2021 15:03:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 15:03:04 -0700
MIME-Version: 1.0
In-Reply-To: <20210521140031.2.Iaa641db08ce7c571860dcce13e4ce056008b711e@changeid>
References: <20210521140031.1.Ibaca694aedfaff823feefa06b29ae746c641dd1a@changeid>
 <20210521140031.2.Iaa641db08ce7c571860dcce13e4ce056008b711e@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 15:03:04 -0700
Message-ID: <CAE-0n52GEV=1=-mmHD-A4fvMG+VHD13=WOCHYs+hcM+acPZOdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] nvmem: qfprom: Improve the comment about regulator setting
To:     Douglas Anderson <dianders@chromium.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Joe Perches <joe@perches.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-05-21 14:00:58)
> In review feedback Joe Perches found the existing comment
> confusing. Let's use something based on the wording proposed by Joe.
>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
