Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B074844A5F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 05:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239967AbhKIE5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 23:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239768AbhKIE5t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 23:57:49 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 512CCC061767
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 20:55:04 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id bl27so28755541oib.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 20:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3d0bpgnKtpNRbrHQNZy5MuUdrJxoJuPOMsuXvuRPMN8=;
        b=L7BeCSywMcOjoZ/hgoduMlABJb+5iYGwXhMxgvGQrd/1xorjTG4ZAProqrWBWl1xAT
         KEVmbojM/uoaVuD0l9SQzznTg3/MfQ3zE2qERe4OH6Xk1Wx90ck7rTYoUr+gddUQ5gvp
         SMb73RnNcjlIcyU0n/g5YanbCxq5Ewif7JXwxWmQNIWOknOqj1sMKC9qdbkJV1/401oy
         y/eOl+hl+juRhQTUQ6dbBgY4MWLFLTVSYQj+7TNo0Tx7Rm16ff3gF06YBvB8B9MUxqUJ
         mTcrnv2FZTjN7dKpvuzY8M1qNDfbms80Kw+z1NW3hwU27btKCkJ9JoGfIuG4ZD4qPcNl
         hZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3d0bpgnKtpNRbrHQNZy5MuUdrJxoJuPOMsuXvuRPMN8=;
        b=pcCSjG7cIpWkbavu6NEsB1JvRCaeaxvIgv45VXL4S0R6rBO9jG+4Xypck/TWdQTISH
         FAFh9BRurhsYITTiqSs/od0soK0eEIrqYRdBB86cjSxLK4LrVMf17/za07nZHhTGyCZs
         EGkXUi7eUv+iE0DnvX+w2jbJ9QOeueM+d7JRXm1pDmlRL0HfghmMNtPz1Cenyx6SF8jP
         e9L5iT0799vSQGc4OP/mZ69FUSD1BlseNdvZeD82tMGHnFE9YZYutEosXBtj6ROZfs+H
         JTMi5y4ia8v0L/kqgIAjxoK/sUEnWbPf11S3YpyNDwntLlZeVEEoBfkRf3Av1ZtpzJq3
         aTGQ==
X-Gm-Message-State: AOAM533t4PDE6xIBa7GP76JHP0UXdolczaKlsRwnzX6U4N3tIWnSEuYY
        V4iLlmE0Er7PRQIxYbsC8cBKa60IUNUa+CzjWuasIw==
X-Google-Smtp-Source: ABdhPJyIS2IsZz4xKbaYthafvjd3nIdS88pgHNCwEs9uL1201EaOoOE0s06/9PFn4U8mcXjX+/4yPUANDO9cNwZmYoQ=
X-Received: by 2002:a54:4791:: with SMTP id o17mr3428652oic.114.1636433703538;
 Mon, 08 Nov 2021 20:55:03 -0800 (PST)
MIME-Version: 1.0
References: <20211029004610.35131-1-julianbraha@gmail.com>
In-Reply-To: <20211029004610.35131-1-julianbraha@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:54:51 +0100
Message-ID: <CACRpkdYMSMAEp=a6sb9062ohS_F_ak63PhgW4RMuu2wAAtg1Wg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: fix unmet dependencies on GPIOLIB for GPIOLIB_IRQCHIP
To:     Julian Braha <julianbraha@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 29, 2021 at 2:46 AM Julian Braha <julianbraha@gmail.com> wrote:

> When PINCTRL_QCOM_SPMI_PMIC or PINCTRL_QCOM_SSBI_PMIC
> is selected, and GPIOLIB is not selected, Kbuild
> gives the following warnings:

Patch applied for fixes.

Yours,
Linus Walleij
