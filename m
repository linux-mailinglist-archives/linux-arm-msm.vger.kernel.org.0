Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9406A2074F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 15:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391161AbgFXNyh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 09:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391150AbgFXNyg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 09:54:36 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8924C061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 06:54:35 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id o15so1403026vsp.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W6p40MsHSjWo5H0Bxrz9MYk9ZRj7p6reI+RPdQAxE94=;
        b=LT6KTMwzqi9u/IBPmxy4zhm6Oi65biD58CVNoanp3EsX3NEk35jvumPLyeQN7zWy5Q
         pkXb/u3XGnyXyhh+PofR7VhwO3otsMdBVyyV7Y22RFM4ucFacJTaHJmSENLovLghLfJM
         C9gk+K3Gb5lu0d4mnwGBo2cHQQJ6k4Vh2Etm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W6p40MsHSjWo5H0Bxrz9MYk9ZRj7p6reI+RPdQAxE94=;
        b=uTaRO43WeKmtKIJdS7ZD6nqPuNpAL/FzZBj91DHFlD2m4rxzHV5BAt+zQs30bhDMeU
         uc00BN/mRWRPgbrv8VYM+h9Lr2rRcQkdvRrupiNPO7GbeTu0nE3Vrr5lV4DDTJiTvnEU
         db+ruFj2N13tTetE2lGItz9gmLKgqLvrTTgWs3zQprj3ZQwQ1i8+7M6p9CzLaqD4/ey8
         dhpCxMHZr8t/hrPxjTBGxmT0NUjxQacK0MxFKqwWUK9b++xwsG6HH2RY76YEKjoajOnQ
         PWk+1g2JRZnLWvpGGWK3PeUjdXJM+jdQiYU8MvEWpEbp2diyW8GmEkRlwslw2Sb9kwpp
         Xn2Q==
X-Gm-Message-State: AOAM531844vOr82er10cBS3atcRSnFwjDD9AOtj5/WFo9HsrFFax9OvD
        8naM1bFzpFZQZu6+lO5o1cOFjl09Nhw=
X-Google-Smtp-Source: ABdhPJx4Pnw1hBBZT5oXuGLJUFIj5YXo4WbOe2EPq9J+/GZSot0e7hL5agTgp/WFggr0hPbBLx6agQ==
X-Received: by 2002:a67:a64c:: with SMTP id r12mr23936396vsh.127.1593006874708;
        Wed, 24 Jun 2020 06:54:34 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id v201sm3209496vkv.2.2020.06.24.06.54.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 06:54:33 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id e3so713437uan.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 06:54:32 -0700 (PDT)
X-Received: by 2002:ab0:6e8e:: with SMTP id b14mr20672618uav.0.1593006871986;
 Wed, 24 Jun 2020 06:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200624123406.3472-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200624123406.3472-1-saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Jun 2020 06:54:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UAa7RNsHJem1pPT-FAWfSzSzfBsd9aeMg_Ty6CH5jP2g@mail.gmail.com>
Message-ID: <CAD=FV=UAa7RNsHJem1pPT-FAWfSzSzfBsd9aeMg_Ty6CH5jP2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: kpti: Add KRYO{3,4}XX silver CPU cores to kpti safelist
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 24, 2020 at 5:34 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> QCOM KRYO{3,4}XX silver/LITTLE CPU cores are based on Cortex-A55
> and are meltdown safe, hence add them to kpti_safe_list[].
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/kernel/cpufeature.c | 2 ++
>  1 file changed, 2 insertions(+)

Reported-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
