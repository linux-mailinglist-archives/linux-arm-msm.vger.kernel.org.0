Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADD32BB97B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 23:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgKTWxL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 17:53:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbgKTWxL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 17:53:11 -0500
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5C8C061A04
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 14:53:09 -0800 (PST)
Received: by mail-ua1-x944.google.com with SMTP id h26so3643991uan.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 14:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VppCy+LvcqmPJ0j+BmKuuLjWYOd4m4mcycAyos72/iM=;
        b=VTgoiecSsLHv+TIXTOEbu0waHvUIa8pBnLMmt9VhHqkhOj8jhHEK9AOBRMiyLkibNE
         qNTpwfEQJRmKzWwJISUwv5Jd8DoOrnncnrQufFxkGf2AGwnXrnvFZdkqraHTnrcZOivE
         xdL+iIlNESvQaISCikOJs273gb3+PYmo0YVic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VppCy+LvcqmPJ0j+BmKuuLjWYOd4m4mcycAyos72/iM=;
        b=fzuOHI2puNqG7qX71iz0CFSeVguG0/IiTKCteFbKjerF/gytBNg6qXjnyLjcifNaZc
         4jwUzRLtd3lVEpW/vuClrUUi90HVws0jNA9wNSNOMqvqjh961GKTPDBtDHLrj77bp2JR
         h4Cn/FN/HaNx/c9IkRM0eJZpsoq3JdOKoV96So9ixXMnjivLivsti3f3khs2lT2oRaMs
         IWwNG0TtvOjg/2cyPC4Yofh6sS8Km1fWAv/gMm5H9WcH1rUyVC2QcA9sf2QB4LyHDO4d
         TIKiW3sTXtdeVSpo2SNqQhkVmzCIX5AmqKi7WXe9SnMPPh+coP5sg5Alp3oTc/Zp940E
         pvGw==
X-Gm-Message-State: AOAM530iqwVYdYIAsGKHRoTNzs0qMawyleglECmtXvRdPJHTGpMeeJOO
        oh0UIFa0LS24PTN67aFRF7v8cNmaheY98w==
X-Google-Smtp-Source: ABdhPJzEyNzwqx8CaK92PPRAu2W07DyMOjgCFGGOOarpM5jUhL9YwiBJCxG5+uN76WNdBWf+3Qlz9Q==
X-Received: by 2002:ab0:138c:: with SMTP id m12mr15206828uae.12.1605912788519;
        Fri, 20 Nov 2020 14:53:08 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 2sm460612vso.25.2020.11.20.14.53.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2020 14:53:07 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id u16so2610443vkb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 14:53:07 -0800 (PST)
X-Received: by 2002:ac5:cd58:: with SMTP id n24mr15138352vkm.17.1605912787245;
 Fri, 20 Nov 2020 14:53:07 -0800 (PST)
MIME-Version: 1.0
References: <20201120200913.618274-1-swboyd@chromium.org>
In-Reply-To: <20201120200913.618274-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 Nov 2020 14:52:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vu-oaLk-6C4o8mDzJ0edx0ch5CbW8cve0-j4MZ0WQ6LQ@mail.gmail.com>
Message-ID: <CAD=FV=Vu-oaLk-6C4o8mDzJ0edx0ch5CbW8cve0-j4MZ0WQ6LQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Remove double pull-up on p-sensor-int-l
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Nov 20, 2020 at 12:09 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This interrupt has an external pull-up so we don't need to pull it up
> again. Drop the internal pull here. Note I don't think this really
> changes anything, just noticed while looking at this irq pin.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
