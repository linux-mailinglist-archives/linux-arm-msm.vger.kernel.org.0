Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1823A2C2F63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 18:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404006AbgKXRzs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 12:55:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404001AbgKXRzs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 12:55:48 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4686DC0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:55:48 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id m16so11559130vsl.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ASb49GMgEQk5JUxUZFVOUivC69eYey0JM4nqNA/W1FQ=;
        b=SJ82uvGUhVyRpvlEm0DW8ZjBfkucQNAdh1ODVXCMTEVB/n47PNRWRkHissZ34gBQLZ
         IVFdQU4/UbVOnKnxxklVwVwyewiOXGlngAWBsqPCyo/lpxZf+ANvLWHkXwG06EzXKj4M
         7XTCjcAIaUtH/njdxeUlzGEAUqHkm3CSUVrxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ASb49GMgEQk5JUxUZFVOUivC69eYey0JM4nqNA/W1FQ=;
        b=bYy9oK9pjhrHOwxkWmRH0bOU9+xZX8m20mPXhUbgeC1C+OCwrLc6LQ5V1MwnOI+im/
         +kAoQ8fDKpJbSi2LbhhuEbjcA+UyuWJcS0nwykkutwHclw9AeG+0V8fDIMbsnUEIAvO2
         1H69gXcd47Oa9DUJFN7EGD1dAsJjbj5KAmRAqcL/Qg94luaT4lO0j7wXDLlHTUKIUE4x
         j4qUp6sKn2bWOilGbvXZhRfX1IlQfGiUdIzc06KhCuvowN5mRNUN0ksGx/PlCS6IZKNj
         vPzP5X9SdDJh5sUUm7YhU8PteOFFySA/pMqHrPRllteckil7s1r4UKLvKikgT6EDTEd1
         qKMg==
X-Gm-Message-State: AOAM532KqJ8IbM5a3rAjLsij6xs+CrGprFkln7tgNvtRRRedUu9qwvTd
        kHsg5F20ic887eFI4mrCWJUn3+yu8Ird8w==
X-Google-Smtp-Source: ABdhPJwzIQc/ffjWG0r7xFvRCS47f89iXFqGIhSkImvS5B5nu7gTeh9GkvTq/6H+M+bgZaDRoOUcLA==
X-Received: by 2002:a05:6102:51:: with SMTP id k17mr4782635vsp.47.1606240547156;
        Tue, 24 Nov 2020 09:55:47 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id l76sm1726905vkl.26.2020.11.24.09.55.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 09:55:46 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id g3so7080041uae.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:55:46 -0800 (PST)
X-Received: by 2002:a9f:36a1:: with SMTP id p30mr4817290uap.64.1606240546042;
 Tue, 24 Nov 2020 09:55:46 -0800 (PST)
MIME-Version: 1.0
References: <1606198876-3515-1-git-send-email-sibis@codeaurora.org>
In-Reply-To: <1606198876-3515-1-git-send-email-sibis@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 Nov 2020 09:55:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XpX3zq-rzMNE8f7mZEWBqD1aOrCekzwzugdG7ANW9j-A@mail.gmail.com>
Message-ID: <CAD=FV=XpX3zq-rzMNE8f7mZEWBqD1aOrCekzwzugdG7ANW9j-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc7180-lite: Tweak DDR/L3
 scaling on SC7180-lite
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 23, 2020 at 10:21 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Tweak the DDR/L3 bandwidth votes on the lite variant of the SC7180 SoC
> since the gold cores only support frequencies upto 2.1 GHz.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>
> V2:
>  * Updated the lite ddr/l3 cpufreq map to have better power numbers with
>    similar perf.
>
>  arch/arm64/boot/dts/qcom/sc7180-lite.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

I certainly don't love the way that this works but it does match the
way folks have agreed that DDR bandwidth votes should work.  Long term
it feels like we should re-think how this is working, but it seems
fine for now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
