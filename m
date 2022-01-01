Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA24482701
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jan 2022 09:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiAAIC3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Jan 2022 03:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiAAIC3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Jan 2022 03:02:29 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72609C061574
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Jan 2022 00:02:28 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id i31so64050650lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Jan 2022 00:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=phiqoClr7WghpTYPY+gGvK9p/LG4f7wDsCyd/Os15F0=;
        b=KsHgprH5EUX6LY7buF6yMvpQz9QsG34ilT5si4YBOdTmiKrLQLtlIhKmpb0AnShvlI
         Hk8Wttps1QhJTHXiMwo4Cq5ocXltNDdNxeGUb81/GSLtNT3sMYaQCbZMT3V/fsZXv+zG
         GS/naibpTACgt2pVln9BKHxYQo8P5/3p3wzU7+ESDqPLksaT4pXftJBLqLBf/jwFFRC+
         S4KHxdr0cVeOYnpa37ciM+hicOlGx7T61ZqDkVY1WaKLFk/q9GSuqlCEa8KLbZlNn3Hu
         IrYgbOkjZhGaBfN+zrEqd+GeyZlDxSLsKedEHpfPxBONh3cN9wujFgJ8O9KhRUjwYFFJ
         WYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=phiqoClr7WghpTYPY+gGvK9p/LG4f7wDsCyd/Os15F0=;
        b=JTLiknVO94D7xPnn7+/xONFYdNAIK6j/tTCvHuIwDhgsn3/vKfakB79kEOT7jWcHJ6
         nRTkoKCH0jHh9nPBqEt2W59LZWki7HuXhZfHEk2XWIW8Y/blaTusSo+DLZpJ+/nzV9ts
         rZ1+N+jDcnmehpJ0FIS7oCPVEqLon88+qPUVjvTz010CnqfifDuQnljZAG4ClrlVjVHw
         QyY/N2ppvsou8ugizxONeYFTbt+PfZo3Q7rk6cKUzZuavCP26aQKi+Eeo/p2Lt5jZKwX
         Wc6/4it6f5fTM2+XAzrEDt/FZ5fuPJH+7PZGS9gSwSXAmZXsBSlQ1+nVGq6K8UYfiq9y
         +Y+w==
X-Gm-Message-State: AOAM533W+m9SGLQRHeOLawlcxmmd+APaD4FvRyNfXww/r51AkVy+nWTO
        v3Ig8vdv4AvE5L57pXl4M7YdgmRZqdM9Fyl1BRvTMQ==
X-Google-Smtp-Source: ABdhPJz9VvixIekr6Rdug1RTopqQtzuGUt7hfa5y2gWCLkYPIzi4XBkoOCd7KJvQdQIxgEiS4vSb0QoXWBGeBe04GK4=
X-Received: by 2002:a05:6512:750:: with SMTP id c16mr34857438lfs.622.1641024146404;
 Sat, 01 Jan 2022 00:02:26 -0800 (PST)
MIME-Version: 1.0
References: <cbe181af-402d-c8eb-3104-4ee48f8d525a@nexus-software.ie> <Yc9zt9vOWXTPZ8PH@ripper>
In-Reply-To: <Yc9zt9vOWXTPZ8PH@ripper>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jan 2022 09:02:15 +0100
Message-ID: <CACRpkdYLGeYPkNZ5O1jw0dhF2Uo5qKsToGkAQJixG1sPxkB42A@mail.gmail.com>
Subject: Re: External data abort on ipq6018 gpio # 20 ~ offset 0x14000 any
 ideas ?
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     "Bryan O'Donoghue" <pure.logic@nexus-software.ie>,
        linux-arm-msm@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
        Sricharan R <sricharan@codeaurora.org>,
        arajkuma@codeaurora.org, speriaka@codeaurora.org,
        sivaprak@codeaurora.org, jason <jason@wallystech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 31, 2021 at 10:17 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Fri 31 Dec 09:05 PST 2021, Bryan O'Donoghue wrote:

> The reason for seeing this issue is typically that the pins are related
> to some I2C bus that is used for some secure application, i.e. they are
> reserved for TZ to use.

In the best of all worlds TZ should be telling us what it is using
for itself.

> Unfortunately I don't know how to determine the list of protected GPIOs,
> other than trial and error.
>
> But once you have the list, you can use "gpio-reserved-ranges" (a series
> of offset, count pairs) in the TLMM DT node to mark off these gpios as
> reserved.

This is the right thing to do.

If I'm not mistaken the TZ can modify the device tree during boot just
as well as the boot loader can, or it can tell the boot loader to modify
the device tree, and add reserved GPIOs to the
gpio-reserved-ranges.

I think the real problem is that some system manager didn't think
about resource reservation even though we have mechanisms in
place to do them.

Yours,
Linus Walleij
