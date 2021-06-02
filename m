Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F5C399108
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 19:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbhFBRCI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 13:02:08 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]:34535 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhFBRCI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 13:02:08 -0400
Received: by mail-qk1-f182.google.com with SMTP id k11so1425791qkk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 10:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=krdPBd6E7hUIUxi1Nz7QlKa3o1eOrT+mUsytvFlZevg=;
        b=U2j0n5Ddssabjjp0li32g/LWz+4f0D8lev5wNe2y7k+iTDXO0Np8412sKQ4hKlqrp3
         rmaStCsnD5f+Q0MCd3RxDfdsouDw+BPK800ob4up7LWuJP6bQGxLAzPFR7oaEVDaC6KW
         yYkxlTIqLZnX9X1s6kIDjUxZCvA5efeYXpE+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=krdPBd6E7hUIUxi1Nz7QlKa3o1eOrT+mUsytvFlZevg=;
        b=Z8niWo93xfB1ozQcrvlyC6Gw1IzSCI7Q1qB0DA8D9Eu1T3rowjuULbZnBP3A54+61k
         kSnazlNxZzkFN9DIXANx9mDFD6jjEDutSK8CPMrGzThoDgyBo0YOUrC6bqlLneRo89gY
         iOLQ0NuimJyrlO4p9cons+rIP9TZ7UN0770kdZuCX3tX0XJStd1AJ1nz3icerhLTnlbM
         quaCom0GJUQZlu3w0BfagnVTSTA+djLCzoFoufq8rT7GeF6X5KBpah1kvfAa1jG/9f8D
         cQvHSeLCaWDkSYXG3i0bQpwvTTsWLxYciNVRHe6WSBTM43PI7l17hx1bHLmSiGgGIAjp
         QJeA==
X-Gm-Message-State: AOAM530oR9aQs85HoKROl/T88WQf29OSuOo0L4mni6FKtK1GVbFvCydy
        hRNj4aqU5z+7YDk/aKURPCkoAcHmQTD+rw==
X-Google-Smtp-Source: ABdhPJy/eN5+XtVRo6vMoMhkvcQkfF3t9yx0iGWOUBl25AdF2bQgHWzzn8C+7Mm2j08us+IOqPLuqw==
X-Received: by 2002:a37:6f05:: with SMTP id k5mr21969397qkc.313.1622653152521;
        Wed, 02 Jun 2021 09:59:12 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id f130sm197226qke.37.2021.06.02.09.59.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 09:59:12 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id y2so4730258ybq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 09:59:11 -0700 (PDT)
X-Received: by 2002:a25:b801:: with SMTP id v1mr51811091ybj.32.1622653151565;
 Wed, 02 Jun 2021 09:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210601184417.3020834-1-swboyd@chromium.org>
In-Reply-To: <20210601184417.3020834-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Jun 2021 09:59:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X52FyU7F4itVjegwTdX9L40Qpb33sdSvi_=McH4KxVrA@mail.gmail.com>
Message-ID: <CAD=FV=X52FyU7F4itVjegwTdX9L40Qpb33sdSvi_=McH4KxVrA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Disable PON on Trogdor
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 1, 2021 at 11:44 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We don't use the PON module on Trogdor devices. Instead the reboot
> reason is sort of stored in the 'eventlog' and the bootloader figures
> out if the boot is abnormal and records that there. Disable the PON node
> and then drop the power key disabling because that's a child node that
> will no longer be enabled if the PON node is disabled.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Right. So essentially you're saying that the bootloader on trogdor
(coreboot / depthcharge) doesn't do anything with this and thus it
doesn't make sense on this board. That sounds right to me. Basically
there's no way in userspace to tell the bootloader to reboot into
recovery mode or developer mode. Those things need to be initiated
manually by the user.

It's possible that Qualcomm internally has some out-of-tree patches
where they use the PON for ramdump mode. +Rajendra as an FYI in case
there's somehow he should give a heads up to about this.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
