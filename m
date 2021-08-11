Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980593E9B07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 00:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbhHKWqa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 18:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232456AbhHKWqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 18:46:30 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015C2C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:46:06 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id i13so4626904ilm.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vjRZSg+FXeB6OVDD4blHXzlgwCr3hJcyHvFtKEVHOmM=;
        b=TzLuJ5rh2/btnG4ZbzYQCWePh2DQwoyJSunPxCznB6QmPW56nNHMa4K1tOj7b/wETx
         n8rjWB+JFzOzEL0t81K886ggn/GcAyuKaFifuSsweCUdMsEIiaHQf3K98dWztpgZsO5p
         TeZ/xgqM3JS0bjZGfL62ZwQJp0XFa88V0uuzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vjRZSg+FXeB6OVDD4blHXzlgwCr3hJcyHvFtKEVHOmM=;
        b=t5ZgjT3XtzvRsqHdc+koIHIyyKf1Fwm62ITlmakEp1/25hE+ufWEEEdt8nKxfe20Lr
         VGBo5diUaJw91BV8tewblXFxZafGYSz5vBDe9RfzWlaWHXY2M/iFA4dmpY3pCQAqlMR+
         3EMGvw0m5VByzrq4somOMTW3tpEDmBhx5+ef9t9MbBbogZNLbHfKGGhwDt/tPtJoKJl1
         ZAmv//oQDpXVYn7+Tr63dUmrBHGctHiS84WeFTbOWzokgw9MebLjLp73870tjFl5xve+
         fTvcT0AOkCr590KvblsGmGDev1mtBdQGqgZUe10Sxu0nTlafr2aGOijJata9sbL6QpJU
         7jtA==
X-Gm-Message-State: AOAM5311v9Prugk2pbPao5WtCEXJ+yzfwl+EMNsS3uc7PTOspxAY4eJL
        UN+rmActizqjgUfk/SJAI7JmWqJxoAAN7UAX
X-Google-Smtp-Source: ABdhPJzCSKbTRjbG4B06BCfDmWBV4pcYWtTJ5fOQ8lGhD6gy6Tz/eDOT6Aks2o5l9eMVk0arOmZxOQ==
X-Received: by 2002:a92:7d0f:: with SMTP id y15mr598450ilc.10.1628721965235;
        Wed, 11 Aug 2021 15:46:05 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id i3sm354047ilu.46.2021.08.11.15.46.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 15:46:04 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id h18so4652018ilc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:46:04 -0700 (PDT)
X-Received: by 2002:a92:cf4a:: with SMTP id c10mr559866ilr.269.1628721963809;
 Wed, 11 Aug 2021 15:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210811224141.1110495-1-swboyd@chromium.org>
In-Reply-To: <20210811224141.1110495-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Aug 2021 15:45:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XKrSfinnZjPPstY0jDX4cP7adAKtCcKFOo5q2=DH+d7w@mail.gmail.com>
Message-ID: <CAD=FV=XKrSfinnZjPPstY0jDX4cP7adAKtCcKFOo5q2=DH+d7w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180-trogdor: Fix lpass dai link
 for HDMI
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 11, 2021 at 3:41 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This should be the dai for display port. Without this set properly we
> fail to get audio routed through external displays on trogdor. It looks
> like we picked up v4[1] of this patch when there was a v7[2]. The v7
> patch still had the wrong sound-dai but at least we can fix all this up
> and audio works.
>
> Cc: Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Fixes: b22d313e1772 ("arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI")
> Link: https://lore.kernel.org/r/20210721080549.28822-3-srivasam@qti.qualcomm.com [1]
> Link: https://lore.kernel.org/r/20210726120910.20335-3-srivasam@codeaurora.org [2]
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes from v1:
>  - Drop sound-dai-cells
>  - Replace hdmi-primary with hdmi
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

I'm no audio expert, but this matches v7 except for the bugfix setting
the ID for the `sound-dai` to be LPASS_DP_RX instead of 2, which
matches downstream.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
