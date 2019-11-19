Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A243C10275D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 15:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbfKSOwK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 09:52:10 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39556 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfKSOwK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 09:52:10 -0500
Received: by mail-lj1-f194.google.com with SMTP id p18so23667593ljc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 06:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yqb0rkinvnzVxsR16s0DvySApOjrl6R+PT2Tv3AwCuQ=;
        b=Krb1OidY+jIOCRMHX0376ZSV9SJGf/bkadTG+k7yzJiYfM8/OZUrPbsHA2qx7Hh7u9
         BlD6DBG51uCKeMj2RsnffcZMQfx8lg8Y1P75xjhiqY2ubZSik/BRMA1scOpsllxqiSj1
         pGFElwRxjYt1QUWiZxwFy1uysySfIgzMuDlnkgVhkQ1UTDrkDxTMysXfIN7qp6pR9LPD
         hc5EMHcWNF/ZhclLFpOv3TFmIPoeq40Lg4UEVtQI6NG199vB/0lyBRR+8hxcMY3KMnRu
         HGVupab+psS5dFxKl9qQGHfMHmLmaOa4GcOBPwtTlVYuKpP6uRx5YEQPwfPZxCn3j/xs
         REbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yqb0rkinvnzVxsR16s0DvySApOjrl6R+PT2Tv3AwCuQ=;
        b=cAmskOfSE2rP1px8f9qnNQhNZW9RYxmNVrnurZkHroU9g54fMd/hMEOjqIffe16F1+
         fVz+55aaCqCYRzj7k5DmlQta0bJ0eILeY+rNKqf7pLorUcdz+b5FryVEztsfi5KCKL/v
         9c5dT/GL0J86hebahw2ee3KYi2xQPbNNDXYs5VOXrFN+Mn0S/HKJF9hOjADXYeJHoS9x
         OhR6LJzNjmP3j5q15ZVqZXbI1vyVJ9IgT2qBrGowDUwv7n3dRTfXt78BouY3EnLxhXj+
         2Z/T3jgbGeGtVRH4WYEQzDtGaIMo0nK+3qLJ6niSXJyrNMrgBgW18MUhbFF6A4u/pClk
         t/lQ==
X-Gm-Message-State: APjAAAUWm8raD7nMaTe16D+ClqUrg0Zyt4RZ6NML4JaVUME1uaUlEhLo
        UJOvXIfjUg6VdsIQ0tgsRetqEozKbWwxYWQRljuaLw==
X-Google-Smtp-Source: APXvYqyrJt5cT9l3Z4fNcoLZnVIbrnYb0eYCPsuJ1H4+NpxJM1ojKC8zDKW4wGHoxq9Q3I8PkV9qxBmveRjuWw+hDa4=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr4342291lji.218.1574175128085;
 Tue, 19 Nov 2019 06:52:08 -0800 (PST)
MIME-Version: 1.0
References: <1573855915-9841-1-git-send-email-ilina@codeaurora.org> <1573855915-9841-9-git-send-email-ilina@codeaurora.org>
In-Reply-To: <1573855915-9841-9-git-send-email-ilina@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Nov 2019 15:51:54 +0100
Message-ID: <CACRpkdYix=G1nYHgdzCKR9WzwchHtJ6N_UUi3R_+sz8UFHmLUg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drivers: pinctrl: msm: setup GPIO chip in hierarchy
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Marc Zyngier <maz@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 15, 2019 at 11:17 PM Lina Iyer <ilina@codeaurora.org> wrote:

> Some GPIOs are marked as wakeup capable and are routed to another
> interrupt controller that is an always-domain and can detect interrupts
> even when most of the SoC is powered off. The wakeup interrupt
> controller wakes up the GIC and replays the interrupt at the GIC.
>
> Setup the TLMM irqchip in hierarchy with the wakeup interrupt controller
> and ensure the wakeup GPIOs are handled correctly.
>
> Co-developed-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
