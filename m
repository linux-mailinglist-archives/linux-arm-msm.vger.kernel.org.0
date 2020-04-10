Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 777481A4BDC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 00:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgDJWSU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 18:18:20 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45453 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgDJWSU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 18:18:20 -0400
Received: by mail-pg1-f194.google.com with SMTP id w11so1509822pga.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2020 15:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zWmbbFUQQjeDm+gMt8s5CKmqbSjpsn0Bs7Vf6igbDN0=;
        b=e3lTJwDeR+Nav+528OsUsNEAU/mQAvnOqDzBkyDMHmonykZKMLV0VVtUTENE3pD7Q6
         GnFU+SMC26o3A55F4t3Tt68x4vLPjqJkRXN3RzuTpsdN8C5J50qTnKOpIr9VsyCZ+cLV
         i9mbvKSAC+qjGIAx9O/tI70iccionOxKrTrQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zWmbbFUQQjeDm+gMt8s5CKmqbSjpsn0Bs7Vf6igbDN0=;
        b=iquufar03/6hvvnSELnqqckSKCTpXf/y7nrfKRj4qc61pl7idCcIv29fA6A5nEynt7
         /CQnwZU2YpRcrubGBEUrwwcM5xmYw+xkoQtzaGvU/AQnwKnm0S5PijWRT3Vpp4txMee/
         Irvn/gtLW50jEaTiU42jM7Tq6uDRuUkIUb55zxJdvzHWKzMyaxenlEOKf5xHw6b949O2
         6DZdUtzUgBXxVxr47H1FUBLyT4t4hREorrrAxQ0Rmgtb7YsvoZ3CTz6VknXoLrryk8Fr
         y3VpN+hqQ20g2XXHvmS4CBDDDDwD9/dpRcripyEJdTG3T11zKCgXkhuz/6JDfXQeQljZ
         Vdgg==
X-Gm-Message-State: AGi0PubSBK27HOhfd8gbLVLePcqUMZp0d2kPmoabJQWscUw1OyCMY+h7
        XH16jK6TG7yFc3ZD+scP/3jeKw==
X-Google-Smtp-Source: APiQypL5THpk7QNDWCyORXPdUOyrfq0oJPG9LZXBe4qj/CEWRQMdNwTa2WA43xoyV7Mu3AgOv45XPQ==
X-Received: by 2002:a65:5b4f:: with SMTP id y15mr6701497pgr.134.1586557099575;
        Fri, 10 Apr 2020 15:18:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id x2sm2646600pfq.92.2020.04.10.15.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 15:18:19 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     jason.wessel@windriver.com, daniel.thompson@linaro.org,
        gregkh@linuxfoundation.org
Cc:     hpa@zytor.com, kgdb-bugreport@lists.sourceforge.net,
        corbet@lwn.net, frowand.list@gmail.com, tglx@linutronix.de,
        jslaby@suse.com, linux-serial@vger.kernel.org, mingo@redhat.com,
        will@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        bp@alien8.de, catalin.marinas@arm.com,
        Douglas Anderson <dianders@chromium.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Martin <Dave.Martin@arm.com>,
        Enrico Weigelt <info@metux.net>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        James Morse <james.morse@arm.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Matt Mullins <mmullins@fb.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Nadav Amit <namit@vmware.com>,
        Oliver Neukum <oneukum@suse.com>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        jinho lim <jordan.lim@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [PATCH 0/7] kgdb: Support late serial drivers; enable early debug w/ boot consoles
Date:   Fri, 10 Apr 2020 15:17:19 -0700
Message-Id: <20200410221726.36442-1-dianders@chromium.org>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This whole pile of patches was motivated by me trying to get kgdb to
work properly on a platform where my serial driver ended up being hit
by the -EPROBE_DEFER virus (it wasn't practicing social distancing
from other drivers).  Specifically my serial driver's parent device
depended on a resource that wasn't available when its probe was first
called.  It returned -EPROBE_DEFER which meant that when "kgdboc"
tried to run its setup the serial driver wasn't there.  Unfortunately
"kgdboc" never tried again, so that meant that kgdb was disabled until
I manually enalbed it via sysfs.

While I could try to figure out how to get around the -EPROBE_DEFER
somehow, the above problems could happen to anyone and -EPROBE_DEFER
is generally considered something you just have to live with.  In any
case the current "kgdboc" setup is a bit of a race waiting to happen.
I _think_ I saw during early testing that even adding a msleep() in
the typical serial driver's probe() is enough to trigger similar
issues.

I decided that for the above race the best attitude to get kgdb to
register at boot was probably "if you can't beat 'em, join 'em".
Thus, "kgdboc" now jumps on the -EPROBE_DEFER bandwagon (now that my
driver uses it it's no longer a virus).  It does so a little awkwardly
because "kgdboc" hasn't normally had a "struct device" associated with
it, but it's really not _that_ ugly to make a platform device and
seems less ugly than alternatives.

Unfortunately now on my system the debugger is one of the last things
to register at boot.  That's OK for debugging problems that show up
significantly after boot, but isn't so hot for all the boot problems
that I end up debugging.  This motivated me to try to get something
working a little earlier.

My first attempt was to try to get the existing "ekgdboc" to work
earlier.  I tried that for a bit until I realized that it needed to
work at the tty layer and I couldn't find any serial drivers that
managed to register themselves to the tty layer super early at boot.
The only documented use of "ekgdboc" is "ekgdboc=kbd" and that's a bit
of a special snowflake.  Trying to get my serial driver and all its
dependencies to probe normally and register the tty driver super early
at boot seemed like a bad way to go.  In fact, all the complexity
needed to do something like this is why the system already has a
special concept of a "boot console" that lives only long enough to
transition to the normal console.

Leveraging the boot console seemed like a good way to go and that's
what this series does.  I found that consoles could have a read()
function, though I couldn't find anyone who implemented it.  I
implemented it for two serial drivers for the devices I had easy
access to, making the assumption that for boot consoles that we could
assume read() and write() were polling-compatible (seems sane I
think).

Now anyone who makes a small change to their serial driver can easily
enable early kgdb debugging!

The devices I had for testing were:
- arm32: rk3288-veyron-jerry
- arm64: rk3399-gru-kevin
- arm64: qcom-sc7180-trogdor (not mainline yet)

These are the devices I tested this series on.  I tried to test
various combinations of enabling/disabling various options and I
hopefully caught the corner cases, but I'd appreciate any extra
testing people can do.  Notably I didn't test on x86, but (I think) I
didn't touch much there so I shouldn't have broken anything.

When testing I found a few problems with actually dropping into the
debugger super early on arm and arm64 devices.  Patches in this series
should help with this.  For arm I just avoid dropping into the
debugger until a little later and for arm64 I actually enable
debugging super early.

I realize that bits of this series might feel a little hacky, though
I've tried to do things in the cleanest way I could without overly
interferring with the rest of the kernel.  If you hate the way I
solved a problem I would love it if you could provide guidance on how
you think I could solve the problem better.

This series (and my comments / documentation / commit messages) are
now long enough that my eyes glaze over when I try to read it all over
to double-check.  I've nontheless tried to double-check it, but I'm
pretty sure I did something stupid.  Thank you ahead of time for
pointing it out to me so I can fix it in v2.  If somehow I managed to
not do anything stupid (really?) then thank you for double-checking me
anyway.


Douglas Anderson (7):
  kgdboc: Use a platform device to handle tty drivers showing up late
  kgdb: Delay "kgdbwait" to dbg_late_init() by default
  arm64: Add call_break_hook() to early_brk64() for early kgdb
  kgdboc: Add earlycon_kgdboc to support early kgdb using boot consoles
  Documentation: kgdboc: Document new earlycon_kgdboc parameter
  serial: qcom_geni_serial: Support earlycon_kgdboc
  serial: 8250_early: Support earlycon_kgdboc

 .../admin-guide/kernel-parameters.txt         |  20 ++
 Documentation/dev-tools/kgdb.rst              |  14 +
 arch/arm64/include/asm/debug-monitors.h       |   2 +
 arch/arm64/kernel/debug-monitors.c            |   2 +-
 arch/arm64/kernel/kgdb.c                      |   5 +
 arch/arm64/kernel/traps.c                     |   3 +
 arch/x86/kernel/kgdb.c                        |   5 +
 drivers/tty/serial/8250/8250_early.c          |  23 ++
 drivers/tty/serial/kgdboc.c                   | 266 ++++++++++++++++--
 drivers/tty/serial/qcom_geni_serial.c         |  32 +++
 include/linux/kgdb.h                          |  25 +-
 kernel/debug/debug_core.c                     |  44 ++-
 12 files changed, 401 insertions(+), 40 deletions(-)

-- 
2.26.0.110.g2183baf09c-goog

