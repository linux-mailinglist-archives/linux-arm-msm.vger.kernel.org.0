Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687DF306A75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 02:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbhA1BfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 20:35:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhA1Be4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 20:34:56 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CEAC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 17:33:59 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id o63so3201083pgo.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 17:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=csr+vubEtxZXL8yZ0qw0LhP81IqAfO9jQ1ONZwxJeAw=;
        b=kxykKAiVQ76RxKm+5xK0wGATcsMAaZODjbMyP5IvjmsOTcs6Qy6u63ewC5O1whqxZV
         aUIG0M30udM7TeDnuzIYYj0byAwzGjaBiUcHwTlKcqPhNoP90I2osjFPFHggbagQG8cQ
         cXtID4WOooFP4u2IGsbiwaEUW2EQNOSXjlTfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=csr+vubEtxZXL8yZ0qw0LhP81IqAfO9jQ1ONZwxJeAw=;
        b=W9TjCkw3AdQcWbGQZtrbXIXm0iHxE8Baxt4CGs+l58oEtu4Bjk81HhHES/i6bKahvv
         ZvCjhe7OHl6ntEXkjIWrmLG4aFIAzZji+fe7YXAYWORaP8nvocoQ8jEao+F1G0V9hDgk
         jlWRV480HqC6O15QnBU/d8Y7uVicn0hgAPNcu6tJrK1Q3r+GgxI8vODbmF5j/z/6bFcM
         VqVDHfXgkVeww20qTCMWypKeoM1V5Zh5k3W5JvDNRc032TH98eUhzvmmnf8KGNddrd3h
         FGLkEb2r7qCdnWb52WiaHPEk6bM2XbsgFomZ+5Ouo8Nr418GH5p8BRFSotj3m+ycW5eN
         wlVw==
X-Gm-Message-State: AOAM530ULZoE3PDpBd3HbYm9RztCgLjprOmmsnfsmT8hzj3e95GeDyQV
        J35mGRz3ucolbbeX0ZyWsXgRqw==
X-Google-Smtp-Source: ABdhPJy8yjNZJLeagHf8FZWyZhguvfYXVGj36VnR+uX+d1l8/ax2fWk04OBCFHHy0aTN+3BSmKpVew==
X-Received: by 2002:a05:6a00:86:b029:1c1:99a1:fe2b with SMTP id c6-20020a056a000086b02901c199a1fe2bmr13885025pfj.29.1611797639088;
        Wed, 27 Jan 2021 17:33:59 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:304c:5453:303a:8268])
        by smtp.gmail.com with ESMTPSA id r5sm3487125pfl.165.2021.01.27.17.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 17:33:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126150241.10009-1-saiprakash.ranjan@codeaurora.org>
References: <20210126150241.10009-1-saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH] watchdog: qcom: Remove incorrect usage of QCOM_WDT_ENABLE_IRQ
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        stable@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        jorge@foundries.io, linux-watchdog@vger.kernel.org
Date:   Wed, 27 Jan 2021 17:33:56 -0800
Message-ID: <161179763694.76967.7406861246436700530@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2021-01-26 07:02:41)
> As per register documentation, QCOM_WDT_ENABLE_IRQ which is BIT(1)
> of watchdog control register is wakeup interrupt enable bit and
> not related to bark interrupt at all, BIT(0) is used for that.
> So remove incorrect usage of this bit when supporting bark irq for
> pre-timeout notification. Currently with this bit set and bark
> interrupt specified, pre-timeout notification and/or watchdog
> reset/bite does not occur.

It looks like the QCOM_WDT_ENABLE_IRQ bit is to catch a problem where a
pending irq is unmasked but the watchdog irq isn't handled in time? So
some sort of irq storm?

>=20
> Fixes: 36375491a439 ("watchdog: qcom: support pre-timeout when the bark i=
rq is available")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
