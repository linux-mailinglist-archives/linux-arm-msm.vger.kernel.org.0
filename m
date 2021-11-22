Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB275458FD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 15:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239248AbhKVODL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 09:03:11 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:35483 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239629AbhKVODK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 09:03:10 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQPVR-1n2AXj19g9-00MISw; Mon, 22 Nov 2021 15:00:02 +0100
Received: by mail-wr1-f48.google.com with SMTP id d27so32937965wrb.6;
        Mon, 22 Nov 2021 06:00:02 -0800 (PST)
X-Gm-Message-State: AOAM532USYFTjyWyqv0r5i0ajCTmqRaI6m8AhA/04btDaqBZQp+oyyEz
        8riZKD2vgw3J+2YO0ieG6u9tmcath27PSH8V2hA=
X-Google-Smtp-Source: ABdhPJxCh/ojyr4/SvHXuW7U5+p/QmDPoj1YMC2LiBq4NIhZQKGlqYVI5GRqdzj/oKKcTQft5I91wqEjPDD580xe1kE=
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr39150340wrq.71.1637589601683;
 Mon, 22 Nov 2021 06:00:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636973694.git.quic_saipraka@quicinc.com>
 <9396fbdc415a3096ab271868960372b21479e4fb.1636973694.git.quic_saipraka@quicinc.com>
 <CAK8P3a2Bp4LP7C1-XLKvjyxV-e1vrHb-=3zpm75CRgPYNbY2jA@mail.gmail.com>
 <b07e339c-530d-683c-c626-14b73b42e72a@quicinc.com> <1609f1f7-6f61-6e17-d907-c526f09bffe5@quicinc.com>
In-Reply-To: <1609f1f7-6f61-6e17-d907-c526f09bffe5@quicinc.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 22 Nov 2021 14:59:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1KxJFwgock3XiRDZYzT=5PZ=Hsh_8uFv9heoa1rwNqtA@mail.gmail.com>
Message-ID: <CAK8P3a1KxJFwgock3XiRDZYzT=5PZ=Hsh_8uFv9heoa1rwNqtA@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm64/io: Add a header for mmio access instrumentation
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        quic_psodagud@quicinc.com, Marc Zyngier <maz@kernel.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:XMyzNBAgZe7xR74QkrtGedvidtRv+2nwpPxPhI2n8pLeWwq4pn6
 RnK47A4GM9m84bEYGjA8hIP1DIZCmumOPDrz46KP6e8Tfg8Jpkib3pe5mIyFaU36D2m+vbs
 9MQdv+gOqwYetfsY++nYd4Z9l1buaTZNzFA2ed2QmnqaGzCLKfMs+4iELWB3BqOkrJ9Mm81
 9BUD0iGih2qahJtbnr9QQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yEMk/TlXXDE=:wtUPzDsummXOstf1bOJ8yj
 JU7GINL66BITQtoWWFBYEknpklvS98bJowFowTdupih81RxqVBItcHviQijdw9UKDYLQIXS1U
 UHOtSpf3G5/FiSdN8Brj8SO28eQqf3iMCYa0MfcuWlNlkiA3u31CJx8z+ZEYfKUMMPrfcfV5Q
 jRqM5sM7UuboPPJxHP0t4cSFDcNvnKWehVGPfVNPgZRapLpEcM0Vw4z+tulQznm2drGSNQFx3
 rxUbUHg1HSzdQxb3j18rAgBsoFYPIsLhd3yhPa0Q+Bl1PeggRainsq+t06fQnxv9LAYETsQ93
 2qdh+LMzVW69pVqObgTGVn0tIsORm0vaZsbQ8cnj99ucxXc42iCo+8tc442Iqf9OeNXan0PqT
 cmb5qBoAC3qz3jHVUIIpa92LvsefsbYF/uYw048v7rJZjBqGTtiuQz66j2n+/PfCycm3fZllt
 3mVMPFeeehCeJQ7joi0b0Zy5XD2rLmB0/rTbu4kA1Yyh4Y2MHd/V3Gf4KIuL6CO8bm1xcQoTG
 1OcWwC91UNV2BA9A5gl6GLFBcwpfRcvy2suzJ4QIFsIsfazEOUo2A8Ve/JCamY/GMrl6ChRb5
 Q+/FNLdSX6otO/7ORGLSu99hGscWal1cVR1MMWa1Dz/LAUrgHASHyW4bxvRGydCqp6Jz6mGj6
 FYHsAPDSTyYgTW6oPnl57YAmj/A1L8doQuFuQ5GK50iG+VKN+V/M6YQMCePtevEwvUtc=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 22, 2021 at 2:35 PM Sai Prakash Ranjan
<quic_saipraka@quicinc.com> wrote:
> On 11/19/2021 9:36 AM, Sai Prakash Ranjan wrote:
>
> So I looked at logic_iomem.c which seems to be useful for emulated IO
> for virtio drivers
> but our usecase just needs to log the mmio operations and no additional
> stuff, similar to
> the logging access of x86 msr registers via tracepoint
> (arch/x86/include/asm/msr-trace.h).

I think it depends on whether one wants to filter the MMIO access based
on the device, or based on the caller.

> Also raw read/write macros in logic_iomem.c have the callbacks which
> seems to be pretty costly
> than inlining or direct function call given it has to be called for
> every register read and write
> which are going to be thousands in our case. In their usecase, read and
> write callbacks are just
> pci cfgspace reads and writes which may not be that frequently called
> and the latency might not
> be visible but in our case, I think it would be visible if we have a
> callback as such. I know this is a
> debug feature and perf isn't expected much but that wouldn't mean we
> should not have a debug
> feature which performs better right.

I would expect the cost of a bus access to always dwarf the cost of
indirect function calls and instrumentation. On the other hand,
the cost of an inline trace call is nontrivial in terms of code size,
which may lead to wasting significant amounts of both RAM and
instruction cache on small machines. If you want to continue with
your approach, it would help to include code size numbers before/after
for a defconfig kernel, and maybe some performance numbers to
show what this does when you enable tracing for all registers of
a device with a lot of accesses.

> On the second point, filtering by ioremap isn't much useful for our
> usecase since ioremapped
> region can have 100s of registers and we are interested in the exact
> register read/write which
> would cause any of the issues mentioned in the description of this patchset.
>
> So I feel like the current way where we consolidate the instrumentation
> in mmio-instrumented.h
> seems like the better way than adding tracing to an emulated iomem
> library.

There is another point that I don't like in the implementation, which is
the extra indirection. If we end up with your approach of doing it
inline per caller, I would prefer having the instrumentation in
include/asm-generic/io.h, like

#ifndef readl
#define readl readl
static inline u32 readl(const volatile void __iomem *addr)
{
        u32 val;

        __io_br();
        val = __le32_to_cpu((__le32 __force)__raw_readl(addr));
        __io_ar(val);
        if (tracepoint_enabled(rwmmio_read))
               log_read_mmio("readl", addr, val);
        return val;
}
#endif

I think this would be a lot less confusing to readers, as it is implemented
exactly in the place that has the normal definition, and it can also have
somewhat more logical semantics by only instrumenting the
normal/relaxed/ioport accessors but not the __raw_* versions that
are meant to be little more than a pointer dereference.

         Arnd
