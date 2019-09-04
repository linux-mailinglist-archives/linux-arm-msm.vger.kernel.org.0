Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD56A894E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730516AbfIDPKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 11:10:03 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:38563 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730173AbfIDPKC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 11:10:02 -0400
Received: by mail-qk1-f193.google.com with SMTP id x5so5796025qkh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 08:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jQ37U1P5cGyfzKjPymXuFm8nIXURCK34LUc9c2XKlYo=;
        b=Y8KAyGoDLiUDOD72N9vl+2ezXcrZc1yv5fKZhVAnZl1x67pVgOn6KDIWyWihRkotGO
         mbmv455N+OnJ6k5AvFqRY/xb9hB27du9HwtvqCPhlPlNPMkHvWGOLfWchIKyKegxvImm
         9TAktQdo3duI5UZOpvW5TtKzAIQq7XMszpPhDnzPJxsAGYl6YM/FL2S1NUnxdjsojVi/
         8svvuQbH2eAbzK3n+uKo2QjUGjxz+kWB+2ysWtuN2bW2nlvhIqcz8xpNSQF3y/qMgVcP
         512uTNRYIp7FS9Oc7DwOAZeZf23/8xLjYye6TB0kXMGumHG5yG7psOUzZh7OrQtC4Zxy
         pSMw==
X-Gm-Message-State: APjAAAU+cvYcVkIk2yisBuaUFVsNX55V7rFG2Y2JqW9bd1zJ1J2EZCHx
        1dMi9DWy2az3a8jEunmd9eQw0zCyUcc3ql3IuEFJXw==
X-Google-Smtp-Source: APXvYqwVxsJtmwK8v0tdFXjRDq+bPa0/JL+uIX7Nr/y5QkNc41fZGRKTFOXi1DoZJPrmMwbHbJzDzDrMbXMrvhx1UTY=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr39289518qka.3.1567609802118;
 Wed, 04 Sep 2019 08:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <1567317285-8555-1-git-send-email-agross@kernel.org> <1567317285-8555-4-git-send-email-agross@kernel.org>
In-Reply-To: <1567317285-8555-4-git-send-email-agross@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 4 Sep 2019 17:09:46 +0200
Message-ID: <CAK8P3a295gmeD9ebhW5cyAXmiLo5drsdO=4wuRaZ18U1gLCFMg@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm Driver updates for 5.4
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

> Qualcomm ARM Based Driver Updates for v5.4
>
> * Add AOSS QMP support
> * Various fixups for Qualcomm SCM
> * Add socinfo driver
> * Add SoC serial number attribute and associated APIs
> * Add SM8150 and SC7180 support in Qualcomm SCM
> * Fixup max processor count in SMEM
>

Pulled into arm/drivers, thanks!

       Arnd
