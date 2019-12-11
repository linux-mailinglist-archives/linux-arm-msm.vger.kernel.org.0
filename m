Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A903011BB8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 19:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731135AbfLKSS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 13:18:56 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:43412 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730225AbfLKSSz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 13:18:55 -0500
Received: by mail-il1-f196.google.com with SMTP id u16so20279002ilg.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 10:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hF9BKa5wnk6mlJKv8zSjQWblgjM1RbwR2kAn63Qo6po=;
        b=h0RUCMUGyGK0TWu6erO5q9iiXC0lQgxW2JFdFQNZ/21zcUbvREAdjB593cW6x2Q61H
         C3on1JVH9ccpq4QLbCr6e9C6t7iyU9b1wOd/mGpjehDj66HbCPk/17OlqTdhi0Sf2qCj
         fWtF4vFvDgUKUeSmzB1RdDjj43cP4mAEhCf2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hF9BKa5wnk6mlJKv8zSjQWblgjM1RbwR2kAn63Qo6po=;
        b=rjSJSytBg29jJIfxZK2rCgI+MwxEHGN5S7nk59pKn1/sFOacJy4QTPSNpIufOdO2Dr
         3BpwwGg9gQ4slb1OBJEKKYr+3r4j5OX1GsNWdkUERLcQND8NqmhzdV8U3SJhs0oTcmOw
         +7h+lE6/Qz4FA1TkVGVkXYaJ9sG3+ZmNq/xg/1lWtQpfKUFMbVf16wXogaqnIH9YEiKg
         Kbegyk+2F2G/CZL0xp6I7bN4NJrDMM8mI5/wPri+8JBC+nSq9fQjlLeZlvCRaUBsGBCU
         eJOQFzYUXSpTiLspNXMtm+aSMD/viAVprbxoaXQ0+NWa6E7gdEaGZR9GfW0IK1RikZTZ
         GdnA==
X-Gm-Message-State: APjAAAVjCcvn4SZcRdI2sMt+P+U89fMiY2lUVk0EVDTkIr9s3TM+uz/t
        9yl4OdYqT6RLhilKvrEF9sOaD0eB0vk=
X-Google-Smtp-Source: APXvYqxDYDZqM/uivOwaifcpOIBpHzjziON1tDKT7cJGw831PIbL5+n/2dPwc6u2tbTgu09ZMd79pg==
X-Received: by 2002:a92:902:: with SMTP id y2mr4410355ilg.196.1576088334900;
        Wed, 11 Dec 2019 10:18:54 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id s88sm925190ilk.79.2019.12.11.10.18.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 10:18:54 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id u16so20278907ilg.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 10:18:53 -0800 (PST)
X-Received: by 2002:a92:911b:: with SMTP id t27mr4383452ild.142.1576088333615;
 Wed, 11 Dec 2019 10:18:53 -0800 (PST)
MIME-Version: 1.0
References: <1576048353-21154-1-git-send-email-rnayak@codeaurora.org> <0101016ef3cdeea5-fba7a1a7-75b0-43bc-b7e4-94d19ae6b576-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ef3cdeea5-fba7a1a7-75b0-43bc-b7e4-94d19ae6b576-000000@us-west-2.amazonses.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 10:18:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U_9DGF9L7YwYnw1JAqk-T7XB0OJD78EarUJNfVR6pvzA@mail.gmail.com>
Message-ID: <CAD=FV=U_9DGF9L7YwYnw1JAqk-T7XB0OJD78EarUJNfVR6pvzA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: sc7180: Add aliases for all i2c and spi devices
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 10, 2019 at 11:13 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Add aliases for all i2c and spi nodes
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
