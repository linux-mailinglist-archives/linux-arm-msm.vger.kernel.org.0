Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9FEE1E0D63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 13:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390145AbgEYLe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 07:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388733AbgEYLe6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 07:34:58 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A09C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 04:34:58 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z13so10724457ljn.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 04:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wi+gk3CC8jugnfSNVoMn5WXhzhJYTbdK21k8+STJk6k=;
        b=Y+pESXNupJYz2M2etZnKieO/VeNhDEch9p7SVInZEB86XRO8h8M0GoDFaLeaBHge/W
         Xp9kIUqUEkWWSw7pjtUsHwOtULbYumcsJXagBz9Ug1w/NyvSgP0CQ3BbjxCv+HgrB1fH
         v0FMESlvZPYhwTC1m2O/dm7zggf8bAm563//moUatJJH3uVnOVQ1G5LKgQlw+V4pmaQE
         nFAU4UIJmnE5qEc7JF6agjan+4tXxbuDF5lKRg0yWE12MncRS99VJLMnqTN2QXnDp6Ne
         9pZ90O0+wuTvskb5fFW0cpQxlH0kvGuiwxPPgcUyNGvUm478ynq1TcZi70/WmqqsQyp4
         NTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wi+gk3CC8jugnfSNVoMn5WXhzhJYTbdK21k8+STJk6k=;
        b=RASUPQ0SEDDSHUhSIpkc0Au4zOjJQrVRtfn5sZOh8nK1oCaqW/UqES7KZn3ahaU3Yy
         aVyvS3wcD4tjlI7lNccyGLiNYLuLmkse5uMVnhIp7uIsW2NuzA9buWcg0P7p4niy6BiI
         eWawaoUNUatuKmcSSdJvtCv7TJjQZOl5sbO0D5MVG5GbQ/9jK/brZ2CmkI0r9PKX/hfY
         GM8xmbmTus4uLPufJ0sKU0f0n+5DcLS/cSvQapGR5/m1SEtg7EPLmyoWrbi/tK2VlDyK
         PtxTf3LbFJiP3dK4tysVsQFshNNOsJEnXRPhoqeHa8XoDyIkyBW/dDjSVUxY0hhSyrth
         jj1w==
X-Gm-Message-State: AOAM530hKG3L0jnAF9vYDAVHAdnEo6H1jSVyJ8GXieksI+DDS+y2XuP1
        Vkv+WXInwP9uvNdfpJYAmlb/oujrBwfntcCWKvUuog==
X-Google-Smtp-Source: ABdhPJxFW58LmjFQ2sV+aQMAz5AdRkRbkgO4NOt9cugPGtvFDYY4xWr6++WnNjKk6nO+SbTF8QVEWA7J+F6+Lk6vtb4=
X-Received: by 2002:a2e:8703:: with SMTP id m3mr14339462lji.286.1590406496492;
 Mon, 25 May 2020 04:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <1590153569-21706-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1590153569-21706-1-git-send-email-mkshah@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 13:34:45 +0200
Message-ID: <CACRpkdbpbOPfMfgjF17C=ET1SCiY49Wu55fgO6-kjBwR0mmQrg@mail.gmail.com>
Subject: Re: [PATCH 0/4] irqchip: qcom: pdc: Introduce irq_set_wake call
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 22, 2020 at 3:20 PM Maulik Shah <mkshah@codeaurora.org> wrote:

>   pinctrl: qcom: Remove irq_disable callback from msmgpio irqchip
>   pinctrl: qcom: Add msmgpio irqchip flags

For these two:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
so the irqchip maintainers can merge them.

But you ideally also need Bj=C3=B6rn's ACKs.

Yours,
Linus Walleij
