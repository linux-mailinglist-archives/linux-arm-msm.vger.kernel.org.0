Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E5E334C26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 00:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbhCJXEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 18:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbhCJXD4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 18:03:56 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33316C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 15:03:56 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id q14so27851282ljp.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 15:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QG64oKR42MkQh059e94QTjCnOsjF0zPHrCBWKfuY/L8=;
        b=VA7i8iW77Cf/Okhv+E/UI8ZCHnh9QaZhS0ZqNab9EGe+bED0re5FyrYzLlTwGtRWtX
         n21SkfRwVR5LJJPutChLWJ8kIX1UD2tERVie6vGZfV75sJEDFbXotp6rKOWhCKFPVCj2
         MCqTyGlBf+T4NvKTdZe7Panjm39Ft2pKVg7/pj9z82F5pAQDWOC9Cg0AtK/T9xqFyPpH
         RLMF16blDj6r+vn09l1n7dNuR6Hy8V9NBJQOrWTlYRCnrVnaoAONymBMgdNSQNcRiNj+
         PYhxTdBtzX05MMgn00eQnQS6UcbnVOkMrcsoaheoBCDQJDy7rpv4Cv0/v0ShDV3sRdWl
         /G+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QG64oKR42MkQh059e94QTjCnOsjF0zPHrCBWKfuY/L8=;
        b=Gut9k4CAwj2Yaeos+qTbzA3ImXpBYZlCo+YqN8H1edekKlF73cYlwHlfIA0qvEOGc5
         AZll1T64AfhE5CHP2sNy7nkMi141mOvgWkAg/+z7rjGpVPL6bM5Np4/rsOrlGTMv1qfO
         yp9dW1beB55r/jXCiRnzDB5vxBX9MMtWdinVuZzDJhL5CZQHpFVx74nIvVIdvYRd1y6f
         4DP8pjC8tORy2XUX1fDWixxFFw2pJXSjra6OzzFFmBfYue+p27sjiItCXizcQY7pQAFa
         bapQvFu9+nTeC8+BsDAW+71vyT875SA+Hs+Uu+5TtNG0+a6SQSZsMwAFde88Wd9NqzPJ
         /2Vw==
X-Gm-Message-State: AOAM5321nV99Q9PunvtpAAW8KGiI2QvJ2GMXbhdPN9dzig1Cdbj/bwYy
        K6GuWiQLXru+Q39Np9weDMVxN2epCiDXJf3IDxb4BQ==
X-Google-Smtp-Source: ABdhPJyX7oLLwopBBH+uTI6oA2UtPWQL+42vpvThnDl1xS8oR19DDR2RCeB8rs6+ktXle9KZkxqn6YBbH8lvOuXH3L4=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr3126198ljc.368.1615417434192;
 Wed, 10 Mar 2021 15:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20210303131858.3976-1-shawn.guo@linaro.org>
In-Reply-To: <20210303131858.3976-1-shawn.guo@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 00:03:43 +0100
Message-ID: <CACRpkdZp7m0s+6Fgzq4ScftAr-CtEPtAbz3jGCvKTzdqXJtfAA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 3, 2021 at 2:19 PM Shawn Guo <shawn.guo@linaro.org> wrote:

> In case of ACPI boot, GPIO core does the right thing to parse GPIO pin
> configs from ACPI table, and call into gpio_chip's .set_config hook for
> setting them up.  It enables such support on qcom platform by using
> generic config function, which in turn calls into .pin_config_set of
> pinconf for setting up hardware.  For qcom platform, it's possible to
> reuse pin group config functions for pin config hooks, because every pin
> is maintained as a single group.
>
> This change fixes the problem that Touchpad of Lenovo Flex 5G laptop
> doesn't work with ACPI boot, because PullUp config of Touchpad GpioInt
> pin is not set up by the kernel.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v2:
> - Add pin config functions that simply call into group config ones.

Patch applied!

Yours,
Linus Walleij
