Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8E93D1A42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 01:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbhGUWan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 18:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhGUWam (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 18:30:42 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B59C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 16:11:18 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 42-20020a9d012d0000b02904b98d90c82cso3632021otu.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 16:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=l6NCsljiQrmdmWs5o+gfYgXEIbXvOSPe/7s85UmcUXY=;
        b=Ng2sdbS+bbOryLSPSyNKeMVAf5mGYfLp6eg3+fKUB/+chx8u8IoRiUVIPGFW4pDqsb
         YJkC6+Tt5wtHSzJ0SR11hqOPDULPmiJEQWqfFrE+b4iQXYA/YMyRDVx6aFRzEgzxgi+p
         EQwWkKFKG2v2uTbDUpIdmioqKXDdBE2JwQrOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=l6NCsljiQrmdmWs5o+gfYgXEIbXvOSPe/7s85UmcUXY=;
        b=YzGu/9vLFDS/xV3InSow+UqIpj+H/HOu9X/y3gbEwbjDa+DOyb/KjWOezdIXfsQN/D
         7c1+AYGYEE690zG1o9hM0v8GJA9KBbQQFaKuhQoeLuxiRy2MEcMzmXS0+IbQ3jICB6Wm
         L8LOaLQM81ZNTLAqP8aSaLNrzYFCAtN/v4tmBXNFvqEfUzxZhMGqh4rvegz+2or/rOcj
         Wup1GUqQITUdAzoMjppHBd8dyyfi1PseFCdpINzSyjO4xNBZB84iglps+gou7dRHdyDg
         Kwgk7FvDdesXjU1uF9skuZvEhmb+zdEetZHoojjywymue7/bzFrxfY+DpNrkgi5kyQTu
         14/Q==
X-Gm-Message-State: AOAM531PHhnPkqGrFYH61V4UWWz+uDRXVerVg+DJ5v2pHYjKTZCJnbQe
        zAi1LxGB8nLmOLEfmImdJtOIHDEoNLcoNbVl1LIs+A==
X-Google-Smtp-Source: ABdhPJwuI0iSIKzOgj4iQbbvNukC602d4rDbSTR126JlCcUekJzNHeCuIfzTWkK9MqLlu9vEEjVTu/4CH6znZ33wrLg=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr12661331otl.34.1626909078087;
 Wed, 21 Jul 2021 16:11:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 23:11:17 +0000
MIME-Version: 1.0
In-Reply-To: <1620800053-26405-4-git-send-email-skakit@codeaurora.org>
References: <1620800053-26405-1-git-send-email-skakit@codeaurora.org> <1620800053-26405-4-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 23:11:17 +0000
Message-ID: <CAE-0n50rYuZKa2jXNGUb8oUFsa+zo1Zehqsw9qr1ZXoYQe92pA@mail.gmail.com>
Subject: Re: [PATCH V4 3/5] dt-bindings: power: reset: Change
 'additionalProperties' to true
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        satya priya <skakit@codeaurora.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting satya priya (2021-05-11 23:14:11)
> Change 'additionalProperties' to true as this is a generic binding.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
