Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68BD27FB26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 10:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbgJAIN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 04:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731578AbgJAINZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 04:13:25 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1431C0613D0
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2020 01:13:23 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id h23so1467556pjv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2020 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=yWHXn++kRcQbG/MLWQSRUgDAxUjFBToMj9A1ZOoKk8w=;
        b=KyTas28cFWO3JLCzr/Cl68PZnOKbquWDs/ISwZmjeNElBi0qIqAxuWIavAhRLhXvOx
         VSoJIkeeyXn+mBZy6dSkBk/jknKuXRAB2E5Z1LX5meG+qGSjWsCfLLJO3tDUMATrTwkE
         sG/0eJOxRtdcTIWAb6kkq7Iofp50BWjVM72PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=yWHXn++kRcQbG/MLWQSRUgDAxUjFBToMj9A1ZOoKk8w=;
        b=Azjfdw28X0qq3WJufUQrMC9lfCH3idzk4TxuWybXiRHl8FxU6Naqbrk64pr9T4hZbS
         i32bXrz/7+0L0hSSzXiSCnqd16xXgMvZtLbIppr/y2OFSUlfe7gs5wukGrQQylXl/Dof
         M2cTTJTG9YnAEOLrKvIkyJ/6BjZyDNL5MIYRHQzoFt48fMyjfN9DyV4PAA6zsvAR3eat
         o7mqqd9hXjjyHhTorGVB3vuIA9LK/t+GDTcDb7XdXR80ERIm44sT55/cd/EGNU9W+lLn
         obVc38DkBK6qBmDxNZLC3qp+RK3T5WbC0NJS7YPEw+v5MYPlnBWE4iYkRF1xNRw0uBHr
         r1vw==
X-Gm-Message-State: AOAM530CtxPFgb8nD+j4Zy5HjY4QQ62vF8K3cDs3u5Lctx+SyVC2n17f
        LmL8gOjFdNYpb0LsCYAI7TrAsQ==
X-Google-Smtp-Source: ABdhPJwsxlPhxSu0rIBUZbzwNksYMd+sMigsbyAPGmeVkX1Vxi2ToHev2rt0ZPnuKfWBwejxEcLjuQ==
X-Received: by 2002:a17:90a:b302:: with SMTP id d2mr5841672pjr.150.1601540003379;
        Thu, 01 Oct 2020 01:13:23 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id q190sm5763338pfc.176.2020.10.01.01.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 01:13:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org>
References: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v6 0/6] irqchip: qcom: pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Thu, 01 Oct 2020 01:13:21 -0700
Message-ID: <160154000142.310579.14473886526667450677@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-09-27 21:31:58)
> Changes in v6:
> - Update commit message more descriptive in v5 patch 1
> - Symmetrically enable/disable wakeirqs during suspend/resume in v5 patch=
 3
> - Include Acked-by and Reviewed-by tags from v5 series
>=20

Thanks. I tested this series and it is working for me.

Tested-by: Stephen Boyd <swboyd@chromium.org>
