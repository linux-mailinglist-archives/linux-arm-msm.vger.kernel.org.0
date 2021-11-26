Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A4845E3CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 01:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbhKZAyh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 19:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238209AbhKZAwh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 19:52:37 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A749C061746
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 16:49:25 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id t23so15723428oiw.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 16:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MJyTUWxQXPHGQkKjZ7k+rOXbAwSNCjxiEhnuPxSPop8=;
        b=iWRpZ+TQ7Il4rGtnfEJ3Sl1RKOJegwgi4Zh+HGjEeqIrfki/Bqmn/eDHt2E2pZ04KZ
         j/mwalws8Op8Bj4TShQ/t72Ka+yfrE4S65oxTUKOeQSeK53wj/5Jat4u48jz1hl9BCyA
         MCpg6TFXBSbISkGhUT0cjW3MaMf88S1ZsTShY0ek6qNZ5N+if6dcVl2dOOaT68jHpUq/
         ywpejwAF0NbXfX3jf2BN6sMoG36btZHlyxrP9TbuMlQ5cIJf+dOloU2b63Nbn4lL1Ju1
         kgkUuMwF5EwUHZ1hyBfffdwJP2pmpGIDE6nWTY4D0tT89gthVMY6FXVow6wFXMxtI1/7
         2aCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MJyTUWxQXPHGQkKjZ7k+rOXbAwSNCjxiEhnuPxSPop8=;
        b=3llR7DNxImwsLbL+0SA7RtQpq4GjSgn13oFgpoIhVt+sahOIAtOB72FhijhTL2EvHb
         vyR/Lj6UDJHrbZayj4bNnqewuPpxlC94FzTpnisuhnmyjtFDVtimvHKaJ6smPfbS+EAz
         UdfpbD3LFmMJ1oh66bBJgAQvyqGGZKb/bKbiCDbIlhsSroaDvcv6P6At14+ckKvKackC
         eAD51eZNFDfVjyS+xDTIIXgjQhSXFAEskQZGhtVyuQGFCw/6zi2qnM2wzCTD/0Yq7N5V
         5I0HPPvH6g9kOlaaLZO7Qu0DffHfbG2nRRYrXgKE6BHtIAeowbEUqymXkyzORshSAgkx
         Q9Dw==
X-Gm-Message-State: AOAM532IuK8YO1lS08b3qTlz9G2Wn8lTF/BAw/yZCvoMd8YEoBYSECVx
        VxS1UT1qOhwxg5XBgJaGiXYOAWiarz7Xadr+51TgpA==
X-Google-Smtp-Source: ABdhPJyI8EnbD3+lbR5qtmfWX7hsHJIxqPMhsn70rie3MdiW7kXMWthnIDliSLATRM4YMvnM1z4kG5OjM6M8yD/QL9c=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr19684713oih.162.1637887764514;
 Thu, 25 Nov 2021 16:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20211125213451.62010-1-dominikkobinski314@gmail.com> <20211125215310.62371-1-dominikkobinski314@gmail.com>
In-Reply-To: <20211125215310.62371-1-dominikkobinski314@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Nov 2021 01:49:12 +0100
Message-ID: <CACRpkdau+wHpoWa1JrLt35dnCHJejs8HZkkzZCrrcnRCx3SinQ@mail.gmail.com>
Subject: Re: [PATCH v2,1/5] pinctrl: qcom: spmi-gpio: Add pm8226 compatibility
To:     Dominik Kobinski <dominikkobinski314@gmail.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 25, 2021 at 10:53 PM Dominik Kobinski
<dominikkobinski314@gmail.com> wrote:

> Add support for pm8226 SPMI GPIOs. The PMIC features
> 8 GPIOs, with no holes inbetween.
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Suggested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>

I applied this to the pinctrl tree.

Is there anything else I should be applying?

Yours,
Linus Walleij
