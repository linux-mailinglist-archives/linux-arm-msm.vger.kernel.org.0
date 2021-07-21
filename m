Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91D83D19E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 00:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhGUWAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 18:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbhGUWAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 18:00:55 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F37CC061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 15:41:30 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id b18-20020a0568303112b02904cf73f54f4bso585905ots.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 15:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=8tFkveikWGKHyoMJpaY3v9EmW9OHfpk/4+Rv8pSLhaw=;
        b=VSje6LWppRrx41vMaJH8+az7aeUTBbPPEmHq2CfO0WLP1LmVI48yuoLFKY8ummLolh
         MTW6XiUtEh6dc7mP5cTDNdk5DzLc+hmxu142zujZynzE6jYN8aqkm+kNKx7ZCMj/vZux
         SU20wbkOWK9sYoGRkbWnhwHYHDJIoGo5qgOkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=8tFkveikWGKHyoMJpaY3v9EmW9OHfpk/4+Rv8pSLhaw=;
        b=Tuy1H7M574hsidM0FzKbpIxsiW47XB++rmRKIaJQplTHI3vD7+Qu/q3QgeTMhgROPE
         QzOODaQbkfuODoeteEhgauqHxiO20aoumtfib3jQLLFAyLGsbZXElkhpvDDwgiX37H0F
         w8FBd8gbTek5IteOztqrJm/Z9jqx1DnP2ij9Y/iUaDc2gi+7ie5iXgIczRYcaaHoNmyY
         WR9IQUJ1YzPKnFlenII7NHsOVVWxD663u9qbDxzH/HyhUYpDppCkVZrMS8aGX02Oytri
         R5p/8f7iRp62GMxOYZIVFG+9X6nWBM1xFggEPZDprbIUTVcufTPRWXG+kSZt6QSgvNZv
         s4bA==
X-Gm-Message-State: AOAM530X+GK8GUkwZ/rChtwykLnjmUX/hPdHa/R8jFTJdIwmRon26mGO
        xPhhQ2oUzQaDnMPmS4145sV8hM7xpLVqD0+SBqpxfQ==
X-Google-Smtp-Source: ABdhPJwwtgsrtyqzBuj1DRjgsHKLLxHFhAJV/T2ZW12VgttzYji/bsI5Wgec8BIoUSxqV9yPHYFOb7uz+/+23sbio8Y=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr27568157otl.233.1626907290064;
 Wed, 21 Jul 2021 15:41:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 22:41:29 +0000
MIME-Version: 1.0
In-Reply-To: <1624365748-24224-4-git-send-email-rajeevny@codeaurora.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org> <1624365748-24224-4-git-send-email-rajeevny@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 22:41:29 +0000
Message-ID: <CAE-0n501_+htzvSp6pgMxxUaWMeZ7qLSKN1fXNWbNX1kwyYgTg@mail.gmail.com>
Subject: Re: [v2 3/3] drm/msm/dsi: Add DSI support for SC7280
To:     Rajeev Nandan <rajeevny@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        robh+dt@kernel.org, robh@kernel.org, abhinavk@codeaurora.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org, jonathan@marek.ca,
        dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajeev Nandan (2021-06-22 05:42:28)
> Add support for v2.5.0 DSI block in the SC7280 SoC.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
