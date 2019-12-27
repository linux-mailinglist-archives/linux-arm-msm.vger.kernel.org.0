Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F27112B094
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 03:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfL0C1I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 21:27:08 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:38564 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfL0C1I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 21:27:08 -0500
Received: by mail-pj1-f68.google.com with SMTP id l35so4266850pje.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 18:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HRaliDhVnq/217XrC6XzvYQIHefSB9f5VfV1cfrjUjM=;
        b=v9A7QNZciiH62Ux6WW7R7xt+ao5jHaKO5BX25D0sUtapTFAFgOI4SFc52AwZFEHshO
         JDbBh61Ud+suCwpCgAM6o9+NuBGMUWV2qmUUocRwJBDnwJXKWFZHaJX1NBVO9OENU8HS
         r9O46WduKLe97dPIGfT2QWAl54m0eUhpvDPO9hKJ0NqZfhzEFoI0CGBSoYsIPLZJ36+m
         IjC458eZoRAZfndRER6z1QjcKv3zefsN5vU9JkklIVU1ahAPpmbP9DjvkCBV7z/oCQTP
         r9K3rINpALchJw3rSinOw7KYQEr5QZ6fyY9Qx2iT9DM74epROK7155Xfo9ERQcKkpWK1
         xkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HRaliDhVnq/217XrC6XzvYQIHefSB9f5VfV1cfrjUjM=;
        b=fLxwYv+/i9xhQVskjVT34ld+5N5RfnQxJbXrdQLI+pUsFE6B8GRGylBmgITdHqPqfm
         hyMwF2gROoJP3jNGtC+kyQXnvMq7svfLPJDV9rRb1+5SM7EqqAVAlKcSdRjAq6lQaqG5
         YXW00BF8eakeBzq+SPFqM965w0BGvedWAU3ojsCtcJJGhw3mEZmYMYfl4dfsVV8ipYpw
         4sET7eZtcdJVgVoE4Xc0Meq/qX+d6L30A32pBDfowdy5WZlGaHRCTwgwiq90iQk1Kpn5
         HVcyqT9fFxrB306UzBSXVDnBJen2M/Pg1Ux+KXp1c8DKEDcjVxxyEM+hSDuiwsjLFnqw
         P7/w==
X-Gm-Message-State: APjAAAUCsf3it4uoLSwE8mke4iCpj9dAudcCK7/T5qIw7Pm4/6axxSb1
        QAoiswZc1lJKKidfA9IiXzkqSg==
X-Google-Smtp-Source: APXvYqz7Pwn5lGym0No+6OsEjVrryh9zt/AGCvff0ordJzYAJnVuW8tN9WwPRMUYgQRsCBMpdTI4qg==
X-Received: by 2002:a17:902:8481:: with SMTP id c1mr21078144plo.319.1577413627086;
        Thu, 26 Dec 2019 18:27:07 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h26sm40975182pfr.9.2019.12.26.18.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 18:27:06 -0800 (PST)
Date:   Thu, 26 Dec 2019 18:26:52 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Niklas Cassel <nks@flawful.org>, Andy Gross <agross@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] clk: qcom: apcs-msm8916: use clk_parent_data to
 specify the parent
Message-ID: <20191227022652.GH1908628@ripper>
References: <20191125135910.679310-1-niklas.cassel@linaro.org>
 <20191125135910.679310-8-niklas.cassel@linaro.org>
 <20191219062339.DC0DE21582@mail.kernel.org>
 <20191220175616.3wdslb7hm773zb22@flawful.org>
 <20191224021636.CF47E20643@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191224021636.CF47E20643@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 23 Dec 18:16 PST 2019, Stephen Boyd wrote:

> Quoting Niklas Cassel (2019-12-20 09:56:16)
> > On Wed, Dec 18, 2019 at 10:23:39PM -0800, Stephen Boyd wrote:
> > > This is odd. The clks could be registered with of_clk_hw_register() but
> > > then we lose the device provider information. Maybe we should search up
> > > one level to the parent node and if that has a DT node but the
> > > clk controller device doesn't we should use that instead?
> > 
> > Hello Stephen,
> > 
> > Having this in the clk core is totally fine with me,
> > since it solves my problem.
> > 
> > Will you cook up a patch, or do you want me to do it?
> > 
> 
> Can you try the patch I appended to my previous mail? I can write
> something up more proper later this week.
> 

Unfortunately we have clocks with no dev, so this fail as below. Adding
a second check for dev != NULL to your oneliner works fine though.

I.e. this ugly hack works fine:
  core->of_node = np ? : (dev ? dev_of_node(dev->parent) : NULL);

Regards,
Bjorn

[    0.000000] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000040
[    0.000000] Mem abort info:
[    0.000000]   ESR = 0x96000004
[    0.000000]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.000000]   SET = 0, FnV = 0
[    0.000000]   EA = 0, S1PTW = 0
[    0.000000] Data abort info:
[    0.000000]   ISV = 0, ISS = 0x00000004
[    0.000000]   CM = 0, WnR = 0
[    0.000000] [0000000000000040] user address but active_mm is swapper
[    0.000000] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.5.0-rc2-next-20191220-00017-g359fd8f91acb-dirty #107
[    0.000000] Hardware name: Qualcomm Technologies, Inc. QCS404 EVB 4000 (DT)
[    0.000000] pstate: 80000085 (Nzcv daIf -PAN -UAO)
[    0.000000] pc : __clk_register (drivers/clk/clk.c:3679)
[    0.000000] lr : __clk_register (drivers/clk/clk.c:3664)
[    0.000000] sp : ffffdb6871043d70
[    0.000000] x29: ffffdb6871043d70 x28: ffff00003ddf4518
[    0.000000] x27: 0000000000000001 x26: 0000000000000008
[    0.000000] x25: 0000000000000000 x24: 0000000000000000
[    0.000000] x23: 0000000000000000 x22: 0000000000000000
[    0.000000] x21: ffff00003d821080 x20: ffffdb6871043e60
[    0.000000] x19: ffff00003d822000 x18: 0000000000000014
[    0.000000] x17: 000000006f7295ba x16: 0000000043d45a86
[    0.000000] x15: 000000005f0037cd x14: 00000000b22e3fc4
[    0.000000] x13: 0000000000000001 x12: 0000000000000000
[    0.000000] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f
[    0.000000] x9 : fefefefefefefeff x8 : 7f7f7f7f7f7f7f7f
[    0.000000] x7 : 6371606e612c6e77 x6 : ffff00003d821109
[    0.000000] x5 : 0000000000000000 x4 : ffff00003dd9d060
[    0.000000] x3 : 0000000000000000 x2 : 0000000000000009
[    0.000000] x1 : ffff00003ddf47b9 x0 : ffffdb68705b0ee0
[    0.000000] Call trace:
[    0.000000] __clk_register (drivers/clk/clk.c:3679)
[    0.000000] clk_hw_register (./include/linux/err.h:60 drivers/clk/clk.c:3760)
[    0.000000] clk_hw_register_fixed_rate_with_accuracy (drivers/clk/clk-fixed-rate.c:82)
[    0.000000] _of_fixed_clk_setup (drivers/clk/clk-fixed-rate.c:98 drivers/clk/clk-fixed-rate.c:173)
[    0.000000] of_fixed_clk_setup (drivers/clk/clk-fixed-rate.c:193)
[    0.000000] of_clk_init (drivers/clk/clk.c:4856)
[    0.000000] time_init (arch/arm64/kernel/time.c:59)
[    0.000000] start_kernel (init/main.c:697)


