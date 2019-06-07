Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFF2D3975C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 23:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730409AbfFGVIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 17:08:20 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35368 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729915AbfFGVIU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 17:08:20 -0400
Received: by mail-lj1-f195.google.com with SMTP id h11so2927593ljb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 14:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f6jL7ejK1vdoksS3xLayzljNzEjieCxBcJeb5tUZgYI=;
        b=vegyCWkoFq7IWHKgGIIU7ajpXmTFnt5PpMQ9WCQO4zF3Q/P2g/7GacC2aZLGSPk7+k
         bwnKT4BjE4rsV0FAHf9xG/aEDLvBOW+z+MciDjGAJnnRQTaNamB/IA7WdfJeNgPuY5VL
         l69vSI2aMGChyzbeGI9JtyDF+xnfqxqznHF5qxCwD1n4/FJaZGuR38MdzlOoNiqnR4+D
         lOx0xMbHlCKYL1nYd151G75AOt9/cgRis88Her1XSNeTwqKZJGwxGK3xCG7hInDN+zoG
         +/PsDxfzby9IDLyGazyfoIU2PDdufTCb8/oXvvsP0ynVXnqs+pyfxXYNdkyYvxFqslBV
         /lZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f6jL7ejK1vdoksS3xLayzljNzEjieCxBcJeb5tUZgYI=;
        b=jQXl/nlOJ/okW4IYUpCjCa91oND0xXBaq93f2t9Bo37I5+i0Utlit98uehK0goT2wR
         37P2bixc2OE/ONAlzh9Zu73CXwUuv30u/nEofokEwsh6wjBZG5kJjoeqKfhS+QRLmvE/
         JonVQHsPhzb2vr0a/x/GISDVot7jvIZlqcl7zO0u/MVyGMNLn4qTIp5Y8gA+2iXzmAH/
         9AdDZEI3qoQUxiXACKAMCz0rOwEo5dF9IV8ZmALghX210qc1L2BemQcP/gLl9kh95dju
         XtNPP2PFw8rIPi4BAfBQbookkhfesXPEEg8fzFRRfdIGJHLySt7jXXyM9n6sf7wclHGl
         v+nw==
X-Gm-Message-State: APjAAAVVHqCCgnfWgPXCL4jc3fz2Fxw9w3nsaKz0uVUhgqSf///1HMQm
        ieWXkeYdPUHkjITfTqB2qz19PbjGGgvYdPVMEd6mkQ==
X-Google-Smtp-Source: APXvYqwPTQVLwavT2qXQKKLz8bFfoqAyN+lJI4vElZiZLHJbP2BQZYrz/3pv5Uyw1qDhaFDWje1vP/YBI4KFNgDVDhs=
X-Received: by 2002:a2e:8902:: with SMTP id d2mr29169874lji.94.1559941698057;
 Fri, 07 Jun 2019 14:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org>
In-Reply-To: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 Jun 2019 23:08:10 +0200
Message-ID: <CACRpkdbdkbSofrvJ0hSV66DX+DcwWXp0ONDjx0265Pz50yE8TA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
To:     Tengfei Fan <tengfeif@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 31, 2019 at 8:52 AM Tengfei Fan <tengfeif@codeaurora.org> wrote:

> The gpio interrupt status bit is getting set after the
> irq is disabled and causing an immediate interrupt after
> enablling the irq, so clear status bit on irq_unmask.
>
> Signed-off-by: Tengfei Fan <tengfeif@codeaurora.org>

This looks pretty serious, can one of the Qcom maintainers ACK
this?

Should it be sent to fixes and even stable?

Fixes: tag?

Yours,
Linus Walleij
