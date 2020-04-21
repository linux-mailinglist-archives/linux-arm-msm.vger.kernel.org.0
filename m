Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63361B319C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 23:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgDUVPU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 17:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726106AbgDUVPT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 17:15:19 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDFAC0610D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 14:15:18 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a22so1940235pjk.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 14:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZVMZ4A2aUpVGf4Oc1yQl1xwOhbFiOotMi5P6czDpQa4=;
        b=EhGKndkNNLMd8oIUr2bAwR6mWJIp8ph7ENARvnw3cdMbIf1ajkrFCKAv2OQAMTvbPR
         kM8mHKCTnFzszTypxEH9ebQxkkMxL0VSHTY2whgFNuG/iXXcLYXDnthD2HacK9CXzYYL
         FQsDuC9RLpIJg1u9xIWL7HeFAx+uq9dnNah1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZVMZ4A2aUpVGf4Oc1yQl1xwOhbFiOotMi5P6czDpQa4=;
        b=TDirVf/+kV97wH5iEgksiGs2y6+EIyFwdYxa2LSK5J8LWTtTYBBDJAH28M4YiTt+Fm
         aB6ZD/1+tZXa2FGEDRNkhbZ7TtweLEqVeE3zkkEbgsDlrHFQKT9SmShcBHTgJcYYroAG
         QijCrgDX/AxpXBcomrVKCKRllSvN94QtQZqFz8otZnuIMRZaPjDrYG9CSuxblFQ5gKaq
         8UCY6MkieVVTi/pDpVNLPYJB46TM8hD256B+fOpIvdiiGQu1GKZd26lkX2Mdy1Aa2CyL
         8CvhUyRXawgL8o5RqobOmKbf0UTRjelAoF1xogD1IqKFInfblU6ELdA8iAQA3b5EBP2J
         +pqA==
X-Gm-Message-State: AGi0Pub3ZzZNT3tb1f0uACODT9ieB/CtqtSeQKnlAx0sDnbeFs8B01h3
        O5fZhzkKHftSqeL7xc6iWgjEqQ==
X-Google-Smtp-Source: APiQypL/w37lt59/d7Bk0r82TDa4H/b8TqQLgMzL4SnVuX0nsHFVIhTdSVQrHB/00H7CAlZFO9jN9g==
X-Received: by 2002:a17:902:ab90:: with SMTP id f16mr22835817plr.291.1587503718068;
        Tue, 21 Apr 2020 14:15:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id c1sm3287880pfo.152.2020.04.21.14.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 14:15:17 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     jason.wessel@windriver.com, daniel.thompson@linaro.org,
        gregkh@linuxfoundation.org
Cc:     kgdb-bugreport@lists.sourceforge.net, mingo@redhat.com,
        hpa@zytor.com, bp@alien8.de, linux-serial@vger.kernel.org,
        agross@kernel.org, tglx@linutronix.de, frowand.list@gmail.com,
        bjorn.andersson@linaro.org, jslaby@suse.com,
        catalin.marinas@arm.com, corbet@lwn.net, will@kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@suse.de>,
        Dave Martin <Dave.Martin@arm.com>,
        Enrico Weigelt <info@metux.net>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        James Morse <james.morse@arm.com>,
        Juergen Gross <jgross@suse.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Matt Mullins <mmullins@fb.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Nadav Amit <namit@vmware.com>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        jinho lim <jordan.lim@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        x86@kernel.org
Subject: [PATCH v2 0/9] kgdb: Support late serial drivers; enable early debug w/ boot consoles
Date:   Tue, 21 Apr 2020 14:14:38 -0700
Message-Id: <20200421211447.193860-1-dianders@chromium.org>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
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
pointing it out to me so I can fix it in v3.  If somehow I managed to
not do anything stupid (really?) then thank you for double-checking me
anyway.

Changes in v2:
- ("kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb") new for v2.
- ("Revert "kgdboc: disable the console lock when in kgdb"") new for v2.
- Assumes we have ("kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb")
- Fix kgdbts, tty/mips_ejtag_fdc, and usb/early/ehci-dbgp

Douglas Anderson (9):
  kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb
  Revert "kgdboc: disable the console lock when in kgdb"
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
 drivers/misc/kgdbts.c                         |   2 +-
 drivers/tty/mips_ejtag_fdc.c                  |   2 +-
 drivers/tty/serial/8250/8250_early.c          |  23 ++
 drivers/tty/serial/kgdboc.c                   | 262 ++++++++++++++++--
 drivers/tty/serial/qcom_geni_serial.c         |  32 +++
 drivers/usb/early/ehci-dbgp.c                 |   2 +-
 include/linux/kgdb.h                          |  25 +-
 kernel/debug/debug_core.c                     |  48 +++-
 15 files changed, 400 insertions(+), 47 deletions(-)

-- 
2.26.1.301.g55bc3eb7cb9-goog

