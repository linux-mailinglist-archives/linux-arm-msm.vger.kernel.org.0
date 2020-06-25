Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A524520A046
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 15:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404890AbgFYNsS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 09:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404888AbgFYNsR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 09:48:17 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9504C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 06:48:17 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id e6so2281817vsm.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 06:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qcjptYLlu8YiX/3FPEXIl1WOzbmhaUe5lplH8CkoFv4=;
        b=YZUaAsN3Cfoe4wVRvvlXqZvom5U/mXmUVhgRgW0RrvQ5RwkdVPOaUeSi4rqPeCKG0G
         k9kKuXiXjkKCeUymnoUjqf3I3TRhDXpxecMXGOOg6DTr5vJXkLQTFjY8iGvl+JMBW6lV
         ZA5unte6LgSFrrEua1UonyayueBsmqg7utHt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qcjptYLlu8YiX/3FPEXIl1WOzbmhaUe5lplH8CkoFv4=;
        b=swfkxztO1udPCLyZ/QtG1Mqz53WH4ZRSQjqy9GQVqey/u3CsasydvyK4Gm4mhY9tWe
         3gefdwyEXnJeMMlK7qESFRBYmuD75aWmzXf1XebdXF7ScGtm4UCvFqYOmYJLqe04ccUn
         wQvidfUoqx6yk2eZeLE5UUPxpA5GFFMzwhGB3Ouud+o0itm5+iGS8ZmEfdZT1LcIiUX+
         AQfpi2RNffFlwaGam/QS6015oI41qxi5wKIQE3bJhRo2ZvqBvvMDkkHZMZ+q6+XTn8ZH
         kuWtzYd4xpnsfsmIdbqF/NjCklMNBZaBW7NO6sajkFMn9wRBis/qvXBs/0PUasKSKMey
         ulpg==
X-Gm-Message-State: AOAM531YQSre7aEAIBT0wqzVQEgfV58mJWRH5Ths2CKD/vFiT9SS+Xof
        YGg0a0eUDrBLaXH45GX/DcIw0u6en68=
X-Google-Smtp-Source: ABdhPJxPctD7NOHsG1E1pnUC44cEhSX+u38FROs2YSfnfm3f3mpEi/+JFxLIO6uSRnQYiLeiu8+XxQ==
X-Received: by 2002:a67:1e45:: with SMTP id e66mr26115331vse.95.1593092896683;
        Thu, 25 Jun 2020 06:48:16 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id b21sm2052613uap.15.2020.06.25.06.48.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 06:48:15 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id r11so3570524vsj.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 06:48:15 -0700 (PDT)
X-Received: by 2002:a67:62c4:: with SMTP id w187mr25684156vsb.109.1593092894920;
 Thu, 25 Jun 2020 06:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200625103123.7240-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200625103123.7240-1-saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Jun 2020 06:48:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WONg5C0Twm7b=aED21VLb6GLk4K6DMmYcSXVLAtdkUZg@mail.gmail.com>
Message-ID: <CAD=FV=WONg5C0Twm7b=aED21VLb6GLk4K6DMmYcSXVLAtdkUZg@mail.gmail.com>
Subject: Re: [PATCH] arm64: Add KRYO{3,4}XX silver CPU cores to SSB safelist
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 25, 2020 at 3:31 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> QCOM KRYO{3,4}XX silver/LITTLE CPU cores are based on
> Cortex-A55 and are SSB safe, hence add them to SSB
> safelist -> arm64_ssb_cpus[].
>
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/kernel/cpu_errata.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index ad06d6802d2e..cf50c53e9357 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -460,6 +460,8 @@ static const struct midr_range arm64_ssb_cpus[] = {
>         MIDR_ALL_VERSIONS(MIDR_CORTEX_A53),
>         MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
>         MIDR_ALL_VERSIONS(MIDR_BRAHMA_B53),
> +       MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
> +       MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),

Reviewed-by: Douglas Anderson <dianders@chromium.org>
