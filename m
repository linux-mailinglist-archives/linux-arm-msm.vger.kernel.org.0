Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81FB0147215
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 20:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgAWTtx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 14:49:53 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40876 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgAWTtx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 14:49:53 -0500
Received: by mail-pg1-f193.google.com with SMTP id k25so1891529pgt.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 11:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:to:cc:from:subject:user-agent:date;
        bh=AsiBDxfR3YiAUP6+urybhWiy8mHMpvOtUZtlAgoqD+g=;
        b=PkSLtKYtYi1OcAK+7nw7vWeNOsVnqbyq+qI+VdhZDT2KFdzpC+bHz8WiajuMhK++nz
         Ne4HKz7CL/6hY12kMMKuYVLgTLGYXi95QSDNG8LX662hiyD70AgACtRdmMyb8KhIm8UR
         VUEH28tRg96g6WLiM4Q22CqJXuRA4WX19k1Fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:to:cc:from:subject
         :user-agent:date;
        bh=AsiBDxfR3YiAUP6+urybhWiy8mHMpvOtUZtlAgoqD+g=;
        b=Oi923TS+dZJEWWhgWRUgu4Fv9iiFLUP1JB9Kspi2/SP4BXhYTPCetWc219hmiydrUd
         VlWTZnLPXw6qeLDFgJiI9YeM03oUENnvhQ9XhRbWXdVYve8w/5Dc/TSvBnCQP+/o5CRb
         a2JidUvVFqLAhelF2Gzq1Je7kaQKhjlQ7dzYhQg+5+Osr4SHwQpllVO/iGHFethZ55lX
         Z2VRRmde9GsQloTSw1sSrenfarMkFFkjwLsN4y9O7B/LdWoAzLzXcZkwtweDcMrvL3sM
         CQIRnAUmSDCF2tpfFo1Jc5qaP85ds+AZqM9sUmnlM0y2J5QYeXR2KMywIEgSLX+r1B8F
         ZFAw==
X-Gm-Message-State: APjAAAWpOMs6gibYdN6pWNwb2i7xwjNaIIAPYy81nQFr8pRdz/Ja9puZ
        zcf5IPsb26p69Z2j8basS23Q/Q==
X-Google-Smtp-Source: APXvYqwVEQXX+m3S5BGhf04yLN3caID/CuWtHA4zxtFC4LRWdaqmOtdLcHFyM8Ypv9iy28HI/QH1FA==
X-Received: by 2002:aa7:9556:: with SMTP id w22mr6978147pfq.198.1579808992570;
        Thu, 23 Jan 2020 11:49:52 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e18sm3856195pjt.21.2020.01.23.11.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 11:49:51 -0800 (PST)
Message-ID: <5e29f8df.1c69fb81.fc97b.8df8@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200123160031.9853-1-saiprakash.ranjan@codeaurora.org>
References: <20200123160031.9853-1-saiprakash.ranjan@codeaurora.org>
To:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Kees Cook <keescook@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Tony Luck <tony.luck@intel.com>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] pstore: Fix printing of duplicate boot messages to console
User-Agent: alot/0.8.1
Date:   Thu, 23 Jan 2020 11:49:50 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-01-23 08:00:31)
> Since commit f92b070f2dc8 ("printk: Do not miss new messages
> when replaying the log"), CON_PRINTBUFFER flag causes the
> duplicate boot messages to be printed on the console when
> PSTORE_CONSOLE and earlycon (boot console) is enabled.
> Pstore console registers to boot console when earlycon is
> enabled during pstore_register_console as a part of ramoops
> initialization in postcore_initcall and the printk core
> checks for CON_PRINTBUFFER flag and replays the log buffer
> to registered console (in this case pstore console which
> just registered to boot console) causing duplicate messages
> to be printed. Remove the CON_PRINTBUFFER flag from pstore
> console since pstore is not concerned with the printing of
> buffer to console but with writing of the buffer to the
> backend.
>=20
> Console log with earlycon and pstore console enabled:
>=20
> [    0.008342] Console: colour dummy device 80x25
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x51df805e]
> ...
> [    1.244049] hw-breakpoint: found 6 breakpoint and 4 watchpoint registe=
rs.
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x51df805e]
>=20
> Fixes: f92b070f2dc8 ("printk: Do not miss new messages when replaying the=
 log")
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

While I like the idea, it seems that this breaks console-ramoops by
removing all the text that is printed in the kernel log before this
console is registered. I reboot and see that
/sys/fs/pstore/console-ramoops-1 starts like this now:

	localhost ~ # cat /sys/fs/pstore/console-ramoops-0
	[    0.943472] printk: console [pstore-1] enabled

Maybe this console can be "special" and not require anything to be
printed out to visible consoles but still get the entire log contents?
Or we should just not worry about it.

