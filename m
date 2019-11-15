Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0740FE544
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 19:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfKOStR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 13:49:17 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45315 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfKOStP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 13:49:15 -0500
Received: by mail-pg1-f194.google.com with SMTP id k1so5093620pgg.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 10:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=C9Cj36xd1lbZSQMwVwr0IaZNtwh3zNWL2afAmoYCPyY=;
        b=iD/GEn5Livuy+b4yiVVH6UhsUI2OG3nT1mwV4ZBVP6vi7ngBjR7d2kHSHVMPUPdcZD
         BBxzvZrjsmwPS6SIfQ8SVvnqtqlStH/zk0U3YzPY5QMNs3oxFmMN30axtfmucEvu/N+c
         6Id/dSsAKReBxANrXCegz5xpuqCHitVUF0c1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=C9Cj36xd1lbZSQMwVwr0IaZNtwh3zNWL2afAmoYCPyY=;
        b=WK+eG8gKjm+ZkXFyHshIu80Vm6nUFTIxlhR9o7pW3P3EMMWu1HlzzBPjcim/VMWcMa
         qmCBZcSbhwg1pDGx9reWh6xkYnWwxxJ6x2e8Qwde+URT73fC2sSeJsD4C8ylG+1Iy9F+
         e1mr7sA3ZOXyZZwli5Gvdg9spueItXUJ7GXyVX+AIp0DWyMRvQWZTaC26qfpfpSDZzUb
         VHi589Eax6om+n8FpW5anHM+1VrgdyXfu8ILUvScLRvyyAxQYiAB6EU8xnLPY/+uSvgg
         uRjg8afWEhMZNA2BvWjNwG/UZSW48yuQ3KpGblH58jwfkTMLUAufrVdIzsPKBgpHXCvx
         Uqew==
X-Gm-Message-State: APjAAAWmaXhmqpxQfFJs7gozCYG6cERXUpoMseUrA6C1ZRxmOZwFk1jQ
        id6VdiDP0vP9MQ14wChrj6xDWQ==
X-Google-Smtp-Source: APXvYqyqijwaOITA/iznJcJleMeC0k4J/bj6fyRiHgrrpM366SlwmOJsBSNOg/33FiUTxUDXU3BlVA==
X-Received: by 2002:aa7:9f0e:: with SMTP id g14mr19827730pfr.202.1573843753287;
        Fri, 15 Nov 2019 10:49:13 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v14sm10822561pfe.94.2019.11.15.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 10:49:12 -0800 (PST)
Message-ID: <5dcef328.1c69fb81.a1a73.f6cc@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-4-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-4-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 03/12] drivers: irqchip: pdc: Do not toggle IRQ_ENABLE during mask/unmask
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 10:49:11 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:12)
> When an interrupt is to be serviced, the convention is to mask the
> interrupt at the chip and unmask after servicing the interrupt. Enabling
> and disabling the interrupt at the PDC irqchip causes an interrupt storm
> due to the way dual edge interrupts are handled in hardware.
>=20
> Skip configuring the PDC when the IRQ is masked and unmasked, instead
> use the irq_enable/irq_disable callbacks to toggle the IRQ_ENABLE
> register at the PDC. The PDC's IRQ_ENABLE register is only used during
> the monitoring mode when the system is asleep and is not needed for
> active mode detection.
>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

