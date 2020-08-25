Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECF6251664
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 12:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729813AbgHYKO0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 06:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729680AbgHYKOZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 06:14:25 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4BFC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 03:14:24 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y206so6948032pfb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 03:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=GPnySI9eGIS+nROJVq+Xlu/fMmpmJKzPqvzWINBs7Y4=;
        b=E1xgROyYW/hpeGWgWXbs4etB93C7cG+zg89+YnclPgOZvp+zd4y/bluhR/k6gGdJ0F
         0JBErbsslZzwsL5U4QvGZ7cA9tfZZgTs5JOelrZzi9hZTUUWRZ+3LNOcv6Q7407eoxpU
         HDrjmf8syMrkQhlVufwqH7Rio/A87pHrzpQEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=GPnySI9eGIS+nROJVq+Xlu/fMmpmJKzPqvzWINBs7Y4=;
        b=IFRtLBgqWiByhWe5qAoSey0LZSk/Ro4eacPjN12h/1lyIFpq4s5r1v8mEd0ySqDsvE
         BD6C4lOUG8JkZ3iEGDVK4MTlWYnOq5lq+Q2+szhRWCmZtNqviksYOrtL8QbQf8owk1E9
         P8Ngs3p4p/r4JNtTY1O6Y8+ph7TWQ+7Iqu73jpLx4LxKeZqo6fdamYJkSObnYS3INqCz
         C4yAZR0vdxm+bNrS1S9my0Zm8BY/i3FBxOEwdiSeuT6HcAp0cU+69yvhrXkJ20r9MRnb
         T965RC2C6fq7BT+uIKhmQTyeDXm3It3axeIh8+AknlJYDTZSXNLB+ELn3O/6ZSmA0vaR
         wZMQ==
X-Gm-Message-State: AOAM531BqcmJN1JTOUoWTUn6IWjbzpmKcCQI7wbZ6PYbglWMhBJuzLYm
        m87UkMg1u02sUGbh6Tx/tDxYbw==
X-Google-Smtp-Source: ABdhPJwv4+Qo+wlzeIxMzPMIadcLWkFE/ki7LzfhfrKE2iA0FT59MSIQqAgjSDRtixKIAlOrkZzvRQ==
X-Received: by 2002:a62:3641:: with SMTP id d62mr7417362pfa.82.1598350464426;
        Tue, 25 Aug 2020 03:14:24 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x144sm4799456pfc.82.2020.08.25.03.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 03:14:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1598113021-4149-6-git-send-email-mkshah@codeaurora.org>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-6-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v5 5/6] irqchip: qcom-pdc: Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Tue, 25 Aug 2020 03:14:22 -0700
Message-ID: <159835046283.334488.2420672039032709876@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-08-22 09:17:00)
> Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag to enable/unmask the
> wakeirqs during suspend entry.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
