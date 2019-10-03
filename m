Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4612C9DF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 14:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfJCMCt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 08:02:49 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34734 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbfJCMCt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 08:02:49 -0400
Received: by mail-lj1-f194.google.com with SMTP id j19so2448231lja.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 05:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cTYlnAsOJ2TKlVRx7ETxjCGwXU7Jrh//3eORQWciV1I=;
        b=lcp1eFKeXAZyScuFc5xoJJSTTqPHQ8Do+3WrNy+47tu+ROcdW6yllR8HE/6xyxFI1C
         RIQ5vZJOjQSZuylhK/qu0sZ6QXr9SnHoXAHVl6r06m7jOM/BKGeXI4ZxGBKLdruYqNic
         U9qkExsWct/2LLNZFIbyHSfx+z5fEsvWd6jqyog+uXlaCXMjWHtYPVBFkumuVrAJwIN5
         MfbnIneby+9xiN7KIdGVjHFKO1LuanOdth7xQvHvCg2fdmk7Xs5lTNa5I/o+3FZZ7VyG
         ndi/b58SQIf3hMSo5Yw9QKJ3bwdLKcEIKcODFEkcliHkc9jkbPzsp3euz1Vz0kBvzkxe
         UIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cTYlnAsOJ2TKlVRx7ETxjCGwXU7Jrh//3eORQWciV1I=;
        b=d0Q29gI85IVaSqtbuZLXw4MUpjgG1hItqS0zxQdrRgAHIf8tv1CEgiWiJsyzeunuu4
         /90eCMj8mscPBbNvlamq0p4qB3JHLBfMG+Ha8PrGH02Gj0PqWNpQcOXIA2kRw8YOtQ0m
         nDWXzqZF1ZltgvTW5zTOwkxijOtL4smC3w+64Tj5KsEQfVlP0VKQQvST6pRc1pEWuj4F
         WZk9NnccjzlqaLnh5hoNcWcDvieoVmpjYVlDjCMCGMW8Pbsi+4l+DbEcypItAtJyN8AG
         gIUm9q8hOLER0P2mMYuLSeJVLoE5dA9u+aaEokuNwnZPT7SyX1KQOR/ddKt1a887SPX9
         zJEQ==
X-Gm-Message-State: APjAAAUbvGY2k/uPcaAnBcq/znHpmHYJ/ipDp8XYjkFqhoWvrSd6/5kk
        EYyFeHn/sFIoX4yn3tVeYNtYfvGsBKq9Gu5mn9+zqQ==
X-Google-Smtp-Source: APXvYqxkigIHVqqJYtKMd8GkRG6qLd8hE5Cemc8HsFF9oQhJc0+1b5nvoxtB7OvKQsMw9/i59oJz1UG7zrLmwnmixDU=
X-Received: by 2002:a2e:894b:: with SMTP id b11mr5832443ljk.152.1570104165568;
 Thu, 03 Oct 2019 05:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org> <1568411962-1022-6-git-send-email-ilina@codeaurora.org>
In-Reply-To: <1568411962-1022-6-git-send-email-ilina@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 14:02:33 +0200
Message-ID: <CACRpkdYO3ioakyrmv_2mTUuWCeBZ5goW28qr+y_M8qFv64FD4Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 05/14] of: irq: document properties for wakeup
 interrupt parent
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Marc Zyngier <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 13, 2019 at 11:59 PM Lina Iyer <ilina@codeaurora.org> wrote:

> Some interrupt controllers in a SoC, are always powered on and have a
> select interrupts routed to them, so that they can wakeup the SoC from
> suspend. Add wakeup-parent DT property to refer to these interrupt
> controllers.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
