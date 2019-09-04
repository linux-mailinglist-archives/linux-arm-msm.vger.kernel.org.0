Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC33A8937
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731267AbfIDPFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 11:05:35 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43619 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731266AbfIDPFf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 11:05:35 -0400
Received: by mail-qt1-f193.google.com with SMTP id l22so12513011qtp.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 08:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2VFHwOwmlKF2puTqPRuPTBufUq8IWxw7CTun82Cp4Sk=;
        b=I2OAKDMajFCOALliX2Ivwl+nkhES3h8DjmzJ8OegiDpTe5OHn6uHv9OtKWuA7NV43g
         xqpJ49cE8ZfupCXcQ2tPxByWKkg7YtUTcD4fnxyuY8VST+PiWukImM5XyMan1jmjtzse
         h6EzIsEe/PPZA/5ZP5EZbGAJ6IDpw/Z07ZA03cyDqOTVkjoeIACMB99haLzLs0Z2ASY8
         aTAQuH/em5bqSr9onpEeGC3sGC+Quc4Z4kEQDQt8wk5eMYabR13w/zciFvrEZQnvAsBV
         VOPl4f2/FH8ARuiRitkK4W5FFC+IZijmhlvpMaqRtdMBtlQB3p56cglyvQZeNMoHJSdT
         W8jA==
X-Gm-Message-State: APjAAAWST9d7RPyRxAd6bGV+/VmMQWjJFESDibVGCDXHPBmlEOG9/6MJ
        HqqG0xKLescTm1SPsmg3lfXYk1azJY5xDH/x9JITbQ==
X-Google-Smtp-Source: APXvYqxe8mW1ml9yvZOqbtI/5Jf26rRet5rCmU+Mz4fV1QOEyWNm9JGTgGjKI8EocAJQlA6gxaTXUTQ5dQiHFPu2Ivk=
X-Received: by 2002:aed:2842:: with SMTP id r60mr30176500qtd.142.1567609534527;
 Wed, 04 Sep 2019 08:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <1567317285-8555-1-git-send-email-agross@kernel.org> <1567317285-8555-3-git-send-email-agross@kernel.org>
In-Reply-To: <1567317285-8555-3-git-send-email-agross@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 4 Sep 2019 17:05:18 +0200
Message-ID: <CAK8P3a1D4004g=U_ekNcGeEht-vfss9sSYtYcnFsp7dXQQvGSw@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm Defconfig updates for 5.4
To:     Andy Gross <agross@kernel.org>
Cc:     arm-soc <arm@kernel.org>, linux-arm-msm@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 1, 2019 at 7:54 AM Andy Gross <agross@kernel.org> wrote:

> ----------------------------------------------------------------
> Qualcomm ARM Based defconfig Updates for v5.4
>
> * Add DRM_MSM to ARCH_QCOM defconfigs

Pulled into arm/defconfig, thanks!

       Arnd
