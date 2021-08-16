Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196913EDF75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 23:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232067AbhHPVqx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 17:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbhHPVqx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 17:46:53 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E356C0613C1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 14:46:21 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id s16so11780383ilo.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 14:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5MQaecMruMo90D+KAt7ofTuU0ZRK6FZBpAa7KmNoEuE=;
        b=BwZyjwUDzVNN1nePIhaSHaIy6fkGy8qZIefmUKq7c3URK6ED0dVpkUuJe3mE1kTeDE
         Ocwhh1VNn03xPFmqlYI+xe+7HjgL1TZLWTrf1JuU+vSUZrCGp2r1fXhoH8IMEnX6Mv/2
         pQGCdi3xIz735nPLv18zQqZWgQMNkRxVjmatU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5MQaecMruMo90D+KAt7ofTuU0ZRK6FZBpAa7KmNoEuE=;
        b=tWZKg86qKTwFdiTB+H5VdWefmydh7meSgmQEUHptkMW5VK2AyQuT05mpMEQh2JM4tK
         ipqd55vYQirMYAMZeslP/6cJWOCZYS5o4usUbjz2s4rVqb4HwEItyXVH8yadLJqLH2L/
         n7NqxDw4pPo+5b9SvAqPBcr8VTrSbaUflcUPLQl4LIjSTes95QeCLDH8m5I8uAChbDxi
         8JpweG3Nc1H0ZhZUYo0jr9KxPeQY23TqOjr+Yx8WkZen+s6b0CSjAsDIbEsie0n+PTgW
         wo6sEI0ILLjEfujydzgER3sT1lWoXy8gYBmzJDQH6d+oj2uicMj8oJkClGo0Q6J+Yaw0
         oDlg==
X-Gm-Message-State: AOAM531CJeghJOfTv7XzCNvZHMWvjBxI/6LG0DRqJTAfSMwrtTR5zShZ
        G4DnUbbM9eN9E9y9zipsmEStPgopWnV1MQ==
X-Google-Smtp-Source: ABdhPJypjwS4KmMtLWEa787iq3zo+xFjH778/hKSvJCuZFhvsaIyLpg07YmIRm4JwXeYRfnFDW1MlA==
X-Received: by 2002:a92:bf0c:: with SMTP id z12mr59388ilh.19.1629150380492;
        Mon, 16 Aug 2021 14:46:20 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id n4sm40110ilo.66.2021.08.16.14.46.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 14:46:19 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id j15so7534524ila.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 14:46:19 -0700 (PDT)
X-Received: by 2002:a92:cf4a:: with SMTP id c10mr46909ilr.269.1629150378895;
 Mon, 16 Aug 2021 14:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210811224141.1110495-1-swboyd@chromium.org> <CAD=FV=XKrSfinnZjPPstY0jDX4cP7adAKtCcKFOo5q2=DH+d7w@mail.gmail.com>
In-Reply-To: <CAD=FV=XKrSfinnZjPPstY0jDX4cP7adAKtCcKFOo5q2=DH+d7w@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 Aug 2021 14:46:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WAso9gLe3+nG6N2cnOwTqQb7CDvHa1EzvF7mVhchqruw@mail.gmail.com>
Message-ID: <CAD=FV=WAso9gLe3+nG6N2cnOwTqQb7CDvHa1EzvF7mVhchqruw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180-trogdor: Fix lpass dai link
 for HDMI
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn,

On Wed, Aug 11, 2021 at 3:45 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Aug 11, 2021 at 3:41 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > This should be the dai for display port. Without this set properly we
> > fail to get audio routed through external displays on trogdor. It looks
> > like we picked up v4[1] of this patch when there was a v7[2]. The v7
> > patch still had the wrong sound-dai but at least we can fix all this up
> > and audio works.
> >
> > Cc: Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Fixes: b22d313e1772 ("arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI")
> > Link: https://lore.kernel.org/r/20210721080549.28822-3-srivasam@qti.qualcomm.com [1]
> > Link: https://lore.kernel.org/r/20210726120910.20335-3-srivasam@codeaurora.org [2]
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >
> > Changes from v1:
> >  - Drop sound-dai-cells
> >  - Replace hdmi-primary with hdmi
> >
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
>
> I'm no audio expert, but this matches v7 except for the bugfix setting
> the ID for the `sound-dai` to be LPASS_DP_RX instead of 2, which
> matches downstream.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Since this is a "Fix" and it's my understanding that Fixes can be
landed / pull requests sent for them anytime (regardless of the fact
that it's currently -rc6) maybe it could still land without waiting
for the merge window to start and end?

-Doug
