Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2E71C9BAB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 22:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbgEGUJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 16:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728383AbgEGUJC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 16:09:02 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F04AC05BD0B
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2020 13:09:00 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f7so3533334pfa.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2020 13:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KL9EzEs11mB5Vs91mETITkzWTIesusmvUGDSfeOr+zo=;
        b=DeX7kVLOVMXbc/cBjy87SIJViP8dRtLE9JYWsZFqz92vNtIdLIaHDD2So/Vd2PrSQB
         t2VfgSYTGbi2BX5/C9YurQA0G8IKcqvp0bzWgxKkzmna4UJNbNj9GPhX1+1zcdVDv5Rq
         Pg1z0yKWuhYTpeCBt87zjQyBVcfBvgtrNFwQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KL9EzEs11mB5Vs91mETITkzWTIesusmvUGDSfeOr+zo=;
        b=h8FKd/IZxz5M2Ha1dPzYHv2c7LKpfeWvmZx7WmRpwE14PBDABfEkcFxSZdQgJUJv94
         7xDPKJGWssBeDfWR3Jq1oFA6fMknKlqppDW4C+i3y6L6tPhVBcwghiJkx80r4YxJoyFI
         nprvA1KHPVfWzZzRWxA6dg31eK/PFRiJ04cWc65tEbTpyyt4xn29Eoe7E5uYpvmIPotK
         khKN5Cuql9BYc1XFm0+/6w7Xdatp2pSPe7IjXdAVMpQ/c0/k3P7Hynw9k20871tx4lag
         eE67Nva93YIOrlU7fpXRUDj1mibKkgAoRBMl8+UXPnxv44OeXm39C22gSDbruupyflgU
         KY+g==
X-Gm-Message-State: AGi0PuaJIaN+5rlXiX7qy/XiGk1nplLORlR60OAMxZ9nG+cIYxVP+wkA
        9NVSbJKrZB9V2CS0ZPWYE7CbrA==
X-Google-Smtp-Source: APiQypIqp2gxVzYysC4NWxVmcszy/VyS+36E00I7n9sMqgA1M9iq1T3DOjbMxV32ALA2B508gUnolw==
X-Received: by 2002:a62:2cd7:: with SMTP id s206mr15067842pfs.183.1588882139748;
        Thu, 07 May 2020 13:08:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id d203sm5547601pfd.79.2020.05.07.13.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 13:08:59 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     jason.wessel@windriver.com, daniel.thompson@linaro.org,
        gregkh@linuxfoundation.org
Cc:     corbet@lwn.net, frowand.list@gmail.com, bjorn.andersson@linaro.org,
        linux-serial@vger.kernel.org, mingo@redhat.com, hpa@zytor.com,
        jslaby@suse.com, kgdb-bugreport@lists.sourceforge.net,
        sumit.garg@linaro.org, will@kernel.org, tglx@linutronix.de,
        agross@kernel.org, catalin.marinas@arm.com, bp@alien8.de,
        Douglas Anderson <dianders@chromium.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Martin <Dave.Martin@arm.com>,
        Enrico Weigelt <info@metux.net>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        James Morse <james.morse@arm.com>,
        Juergen Gross <jgross@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        jinho lim <jordan.lim@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [PATCH v4 00/12] kgdb: Support late serial drivers; enable early debug w/ boot consoles
Date:   Thu,  7 May 2020 13:08:38 -0700
Message-Id: <20200507200850.60646-1-dianders@chromium.org>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
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
pointing it out to me so I can fix it in v5.  If somehow I managed to
not do anything stupid (really?) then thank you for double-checking me
anyway.

NOTE: v3 of the patch series tacks on support for an extra serial
driver from Sumit Garg.  I've piled it onto the end of my series at
his request just to keep everything together.

Changes in v4:
- ("kgdboc: Remove useless #ifdef...") new for v4.
- Add "if KGDB" to "select ARCH_HAS_EARLY_DEBUG" in Kconfig.
- Add comment about why we always return 0 in kgdboc_earlycon_init().
- Major overhauls to commit message.
- No more #ifdef CONFIG_KGDB_SERIAL_CONSOLE.
- Now keep using bootcon even when the system stops.
- Print "replacing" message before calling deinit().
- earlycon should be static.
- s/The the/The/

Changes in v3:
- ("kgdb: Prevent infinite recursive entries to the debugger") new for v3.
- ("serial: amba-pl011: Support kgdboc_earlycon") pulled into my v3.
- Add deinit() to I/O ops to know a driver can be replaced.
- Added example in kgdb.rst
- Change boolean weak function to KConfig.
- Don't just neuter input, panic if earlycon vanishes.
- No extra param to kgdb_register_io_module().
- Removed unneeded sentence in kerenel-parameters doc.
- Renamed earlycon_kgdboc to kgdboc_earlycon.
- Simplify earlycon_kgdb deinit by using the deinit() function.
- Suggest people use kgdboc_earlycon instead of ekgdboc.
- { ; } ==> { }

Changes in v2:
- ("Revert "kgdboc: disable the console lock when in kgdb"") new for v2.
- ("kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb") new for v2.
- Assumes we have ("kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb")
- Fix kgdbts, tty/mips_ejtag_fdc, and usb/early/ehci-dbgp

Douglas Anderson (11):
  kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb
  Revert "kgdboc: disable the console lock when in kgdb"
  kgdboc: Use a platform device to handle tty drivers showing up late
  kgdb: Delay "kgdbwait" to dbg_late_init() by default
  arm64: Add call_break_hook() to early_brk64() for early kgdb
  kgdb: Prevent infinite recursive entries to the debugger
  kgdboc: Remove useless #ifdef CONFIG_KGDB_SERIAL_CONSOLE in kgdboc
  kgdboc: Add kgdboc_earlycon to support early kgdb using boot consoles
  Documentation: kgdboc: Document new kgdboc_earlycon parameter
  serial: qcom_geni_serial: Support kgdboc_earlycon
  serial: 8250_early: Support kgdboc_earlycon

Sumit Garg (1):
  serial: amba-pl011: Support kgdboc_earlycon

 .../admin-guide/kernel-parameters.txt         |  20 ++
 Documentation/dev-tools/kgdb.rst              |  24 ++
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/debug-monitors.h       |   2 +
 arch/arm64/kernel/debug-monitors.c            |   2 +-
 arch/arm64/kernel/traps.c                     |   3 +
 arch/x86/Kconfig                              |   1 +
 drivers/tty/serial/8250/8250_early.c          |  23 ++
 drivers/tty/serial/amba-pl011.c               |  32 +++
 drivers/tty/serial/kgdboc.c                   | 268 ++++++++++++++++--
 drivers/tty/serial/qcom_geni_serial.c         |  32 +++
 include/linux/kgdb.h                          |   4 +
 kernel/debug/debug_core.c                     |  52 +++-
 lib/Kconfig.kgdb                              |  18 ++
 14 files changed, 436 insertions(+), 46 deletions(-)

-- 
2.26.2.645.ge9eca65c58-goog

