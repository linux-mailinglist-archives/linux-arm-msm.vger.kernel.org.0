Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4E33E8FFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 14:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236497AbhHKMA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 08:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237449AbhHKMA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 08:00:27 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97628C061798
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 05:00:03 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id n17so5061572lft.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QntYPwFND9ivHl8sCJvuIY4mpIehwKkRWinAMkSwKQI=;
        b=Q0Rl26bYxsSXpjb/CTuzjeMm5nCjftG0kx2CothuzSLlucNNJW0/NiYUD+62g5T/7F
         Z6Kfdw4iijdQB++sg5aqqT5FQ0Tb3T5im+W0cIQIlxEl/a066C0h+hS3qpvE4YxDcHjf
         6jBnQ1Rd6eFzB3xnkAlhaTdmU88Vw6bFzINRxoDxd0bGZTCqRQIG7K+by4B9VecmTBmd
         md+lPrseDhnPsickBg5Ex4+ZC+BL370H+N8yZipMuK1n/5klrHg5Zp8AdANs3POX0LYd
         KR8d5D3i3fl6Lev3XJrkthKG2Y/zZvfBJWQH7X8WGaIvMNexPiteMDzi85vfI244aZFe
         uaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QntYPwFND9ivHl8sCJvuIY4mpIehwKkRWinAMkSwKQI=;
        b=JfTEt9Gqj2XifwxTlRd/FxjlfA+QU/DnZSv2X0C9yN0CrH2sBnrrVvXgR0/WY+Eri4
         VKJMOpsufeyEMFqtwsYMfjBlXokEhuM9b/X5mUhX/f9kBOlHr+wSjp7Ke3VDc2vyp3BW
         u4nChJYWFDOOw/eNaGrlmpqom09SB6i9tw2ZKlkHb219+Y/WJvTjpzDva5H2iw5wjydT
         zMWVYV17gfYm2ZtRqakwvps7liOLamjB1m4XWacOaOB133U0uH2KoAnB1viMunCUJKbf
         1b7gv1dKEZizcT6ftSn7VvbbduOmnEBZjOADeh6tHPTvwzjzgvCaMOEb//fH3q4HV4hS
         gbMQ==
X-Gm-Message-State: AOAM533haSwIe1rIiMUSO87xG9vMfPN6FjnT65TNamXSPjfrox2TsBIX
        JtL5zEUv1nlpUL5rf6394ynVwlqdlrZf8J8aZksF4Q==
X-Google-Smtp-Source: ABdhPJzqoMybmK8uaattKPYwTnFX/Xb8AOXz9OVi7tq94+ZUBT0mQ9v5TUujLzeL/jhAn7u4PSiH8KInRYVs+H4KkXk=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr25656028lfd.529.1628683201902;
 Wed, 11 Aug 2021 05:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <1627910464-19363-1-git-send-email-skakit@codeaurora.org> <1627910464-19363-4-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1627910464-19363-4-git-send-email-skakit@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 13:59:50 +0200
Message-ID: <CACRpkda6f0QTuW2p13OyPDer4B2NgAMWC5FMN3XrGx5NfL=zUQ@mail.gmail.com>
Subject: Re: [RESEND PATCH V7 3/3] dt-bindings: pinctrl: qcom-pmic-gpio:
 Remove the interrupts property
To:     satya priya <skakit@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 2, 2021 at 3:22 PM satya priya <skakit@codeaurora.org> wrote:

> Remove the interrupts property as we no longer specify it.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied!

Yours,
Linus Walleij
