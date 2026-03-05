Return-Path: <linux-arm-msm+bounces-95537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLMEG+A+qWnK3QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:29:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA7E20D744
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D2E23031AE5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 08:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571C737416A;
	Thu,  5 Mar 2026 08:29:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F958372EE5
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 08:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699344; cv=none; b=n6TosknYbLcWReWINASlddiqioqzNUaCnnkDDWARNpHUH/zhMFyoD9jzX3KSgMSQPNvBhhQrpXRP4dI/PmHaAYrtKqW3IlWoGfx2FJv2DYVv0QoYwVLhUmcU4OLgscjSb/2K3m1S/552ckTpxUp+stupwYfNEpPw4vqkdvpkCNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699344; c=relaxed/simple;
	bh=hefLtFvtSppGuVWRD/xSsfWMjnGgnQggEUG9Y7OFLDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGzOMc0xW+QboeFQOxhuGqYIKTo5r/ijiRAwr3hgwWJesDSbbLp8PtRovHhSlIisk6NRTJSBoHFHINi0FguSZc6LoDwnp/GuibjVizyBQkS6P1MJrvLOVnyFrkZ3vLSjXq0X6raCNYHy3fNiVyvNALoGUwhYxUg+iNnPXXgE6EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ff1836b4b5so2102012137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699342; x=1773304142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlLnToI6SbxsSn7ypnmaqq1RX+miw2VMTyDHKi+gwbk=;
        b=dQtrGpj8C0tqJesY0NtbKP5eaOGU7nWLFcvcTbToBwJMWN61uvADuLmffRRJgcd56i
         ycQ6MH62/6vLQZo6depJwaR2vSKQEwRCeWOchc1iPtP/0YiHodMPKB/x2VxXjQeF0d2M
         ql7B8bZqNEVv5o7Z5lkCVmoumoYH1MU9thR6q+3bGgFpzKeD/xF/yJ6uc2UQJTlI5CWB
         097QMpdDckx+8Qq5uBW1UhNRGyF+F0p6V0E/5NKKYpQmnX4tYwgdfpmfezNicn6DxfPw
         RM1oCtttQ0XestNYo9cwUIIfopqxXxbtBEY9/ikzPMBlAa01S8hwYW4VwlKWPzOZZobV
         00Cw==
X-Forwarded-Encrypted: i=1; AJvYcCU2w7ScDOsGkVicl0lub184SYBtLUWLio6C1bQ6KtU9rtXSChoWK0MwUngHz9NDxv993FkKHyskaieENrRq@vger.kernel.org
X-Gm-Message-State: AOJu0YxXcGInUexfN/vky8tj6SzIOknSQz1F1pxmvCLqbw6vm6dS2Cj2
	NG5HZJqqmfY7ezIupbHWbhSuwHTEfxbMnwhd3aEbU5PeLEdrCx4H3a9LDMWjIPJ6
X-Gm-Gg: ATEYQzwsi9VuPI2PMmNu2sSrlQhKzABWBc6LPb++l4vXtwUGBtYIzr/jBDaZyrB8pjn
	hTi2jle1gzIoxV3a68wjC96LzeJXKX/lkvyuoRuIGuIGNzIb+o76VQLP3tho0TYgw1x5ID8XVAo
	MimMYCeHRYD3AvLwG0iXTXcJzr5ZGOpkmNlFV8xGLZNdntG237zDl8vc8bM9aUSXkra2fxAeU2t
	vQYAuGJr3XkpY5MLhtAtVtTY3ILrbo55h06DMtIEYjt4fEAYWF+2XDiYxjHQyBmdqngqqHB2Pfw
	ktRZdJzdmg6MNlxMuP6fc+eAdXaPmdwWRZrX8SuJtSO0orFduyCavU4FjomB+9tFg2fteOd/80K
	5IntHPVfB4xxaeb2on75bt/0tQOFhGKevbEdBwrcWgYUTFp6+QNF6Vo3FPHRCBrDpEdxbJ1nYrK
	beLSWRzVfbXnAv66cjQsZnQdrwHwW2fyiOXLKX/MBFX45a2dlykOqbD7hqJcSk0pTkNUi4v4M=
X-Received: by 2002:a05:6102:6106:20b0:5ff:b684:f796 with SMTP id ada2fe7eead31-5ffb684fcb5mr1111494137.13.1772699342038;
        Thu, 05 Mar 2026 00:29:02 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df641e133sm20461355241.5.2026.03.05.00.29.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:29:01 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94dd2d71231so2313327241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAr3yn0vPcEnoTM7tqYsYdWBopEZuo1ITCNF3wlFrvYJNBuzeq78mOJY4hUm+ntJ093vNFGyVq//Ple62p@vger.kernel.org
X-Received: by 2002:a05:6102:1607:b0:5ff:c64d:228c with SMTP id
 ada2fe7eead31-5ffc64d2600mr724913137.22.1772699340961; Thu, 05 Mar 2026
 00:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-13-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:28:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
X-Gm-Features: AaiRm50Kgxrt1IEt_9GEmeNyCIrylErpUd7qkh7D4FIoK_FYituUB8DTITetq4c
Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public <linux/phy/phy.h>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: CDA7E20D744
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95537-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,nxp.com:email,ti.com:url,ti.com:email]
X-Rspamd-Action: no action

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:03, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
>
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
>
> Two slight points of contention.
>
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
>
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
>
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
>
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
>
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/phy/phy-provider.h

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -1,246 +1,38 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
> - * phy.h -- generic phy header file
> + * phy.h -- Generic PHY consumer API
>   *
>   * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
>   *
>   * Author: Kishon Vijay Abraham I <kishon@ti.com>
>   */
>
> -#ifndef __DRIVERS_PHY_H
> -#define __DRIVERS_PHY_H
> +#ifndef __PHY_CONSUMER_H
> +#define __PHY_CONSUMER_H
>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/phy/phy-props.h>
>
> -#include <linux/phy/phy-dp.h>
> -#include <linux/phy/phy-hdmi.h>
> -#include <linux/phy/phy-lvds.h>
> -#include <linux/phy/phy-mipi-dphy.h>
> +#include "../../drivers/phy/phy-provider.h"

Shouldn't there be one more "../"?
Interestingly, it compiles with/without.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

