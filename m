Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1D0119004
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 19:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfLJSu1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 13:50:27 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43544 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbfLJSu1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 13:50:27 -0500
Received: by mail-lf1-f66.google.com with SMTP id 9so14569802lfq.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 10:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mhPkURPg18zPOPI/1FqeW1rV9nEBHkw5+GGSGuxTI4A=;
        b=XyfR7eHFBm0pQiVF/MBhH4Y9RLm8rlxOZfr59pForZKkiWu/GxNadDjF0QjXgF1b+D
         dCr7Mn6GoehwEgEdze6xus1SV6FmBuG2QuqFyZ4BiL1Xx8Udn6w3SAW0orvrJV6dzRXs
         wRm6BHNZTeHCa2gcLH6vFruPmyg39jRkwQIEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mhPkURPg18zPOPI/1FqeW1rV9nEBHkw5+GGSGuxTI4A=;
        b=HHy0HOsZ/VLhflAyK743UQElxnzDw+ZMLy2DVdtvCxV/dZPtmn+AupiPOoSdZZEz6u
         ncl9WUbdZHuH5DqlTabfDlWJIQVea+gtiHy9hZl2WUKOPXUuw+AuP8MfHrxubXZieHFW
         yfAJczryJJpeqEf1UzbAniS66+q1EUkSD2yp1r4M4YUa0fGekISK2K+Qk3PdM4BVGnjT
         jwNirT912CqcR2gwly0px10OuOGR1u8adJ4tpg4AVcWvdGx7I02MmwTHj8Yvb5M+KL9D
         oe3Q99SX6tnbTVigvLRSYqZKCNq4g88ZetO3X2iXEdx8OGS2Oqh5FkhVN9NROdORzVcV
         ZeCQ==
X-Gm-Message-State: APjAAAV3m9vZlfFLterdK7VLDPz8Yxf8kE6mDRQAEus2N4DRo7pSMkYg
        jqcicKmcdwi49+I03zutI0fhV+eFrTA=
X-Google-Smtp-Source: APXvYqxI5OgY341loW16l/4k6Hvs/4mGU2gkcuzEEGyvrV0Aw/GwhZk14eRn5h2oUQP2xukvmrWw0g==
X-Received: by 2002:ac2:4d04:: with SMTP id r4mr19594312lfi.77.1576003824553;
        Tue, 10 Dec 2019 10:50:24 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id w71sm2513259lff.0.2019.12.10.10.50.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 10:50:23 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id z17so21036659ljk.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 10:50:23 -0800 (PST)
X-Received: by 2002:a05:651c:285:: with SMTP id b5mr21619655ljo.14.1576003823222;
 Tue, 10 Dec 2019 10:50:23 -0800 (PST)
MIME-Version: 1.0
References: <20191209135934.1.Iaaf3ad8a27b00f2f2bc333486a1ecc9985bb5170@changeid>
In-Reply-To: <20191209135934.1.Iaaf3ad8a27b00f2f2bc333486a1ecc9985bb5170@changeid>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 10 Dec 2019 10:49:47 -0800
X-Gmail-Original-Message-ID: <CAE=gft665cOomO50oevNuG-=vtBzDfraR+ojjURuhxyFOt+UtA@mail.gmail.com>
Message-ID: <CAE=gft665cOomO50oevNuG-=vtBzDfraR+ojjURuhxyFOt+UtA@mail.gmail.com>
Subject: Re: [PATCH] phy: ufs-qcom: Invert PCS ready logic for SDM845 UFS
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Can Guo <cang@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 9, 2019 at 2:00 PM Evan Green <evgreen@chromium.org> wrote:
>
> The SDM845 UFS phy seems to want to do a low transition to become
> ready, rather than a high transition. Without this, I am unable to
> enumerate UFS on SDM845 when booted from USB.
>
> Fixes: 14ced7e3a1a ('phy: qcom-qmp: Correct ready status, again')
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
>
> Bjorn,
> At this point I'm super confused on what the correct behavior
> should be. Lack of documentation doesn't help. I'm worried that this
> change breaks UFS on some other platforms, so I'm hoping you or some
> PHY folks might have some advice on what the right thing to do is.

Disregard this patch. Bjorn pointed me to the patch below, which is
the right fix for my issue:
https://lore.kernel.org/linux-arm-msm/20191107000917.1092409-3-bjorn.andersson@linaro.org/
