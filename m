Return-Path: <linux-arm-msm+bounces-27966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B609484F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 23:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C546E1C20BC3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 21:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9870D165F19;
	Mon,  5 Aug 2024 21:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QF3MugR0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76F057323
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Aug 2024 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722893840; cv=none; b=QqK2Q4llfKffB+WHLXYKgsMFTqWQZ2F54RxtdH5mf8XEV3griG490uM24/8EpVopEFl+JDai0eoFEOUhZu/BhFVWyVjxXsLErQmKd0DNsJoJLyPT4s28cKdpN/Ju8+7wyFCgOvLCuMX8rCzIwguKS2JBkD7AdpunF/ystpYojUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722893840; c=relaxed/simple;
	bh=Ed6Rl/7C5d57Fi1GZz8JB4mKEI66eDK+qFFUbTBXrMI=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYGrBtlJNxS1Eh8C+hp6apTKmVmp2hJyIEaneyPQFiKllZrVUXuKnsFN/NdocCQsjd0hvWeri8qhVQ9HU0QzUayCX/GrmPi65fQ1dsp0OXCa7RAbdv3xlypV42jQZ7qvuEbzPAb8DIeL0KCVyst4tB9KAFYvuAD4Ect+JlMyGMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QF3MugR0; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a1d0dc869bso701167585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2024 14:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722893838; x=1723498638; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TTQWoLTs/whgWYI5NXDcDj0/sry6PBheRizhrnqOcg=;
        b=QF3MugR0M8fz9u7kKwdbEuEBewZqWhDHkhp94ciTeBgtsL8qoQL/WYHfQ2qkl10tDZ
         pEyltFPRUQngwNMYCtgzKzfgUZwbf4hlPYdGXT4b0pp71gUy/gqstWsitBzAQA5PEEsH
         PH9lRntCgYTZYcd187sBhX9syCpoGFNAn6sf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722893838; x=1723498638;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TTQWoLTs/whgWYI5NXDcDj0/sry6PBheRizhrnqOcg=;
        b=NHjqT1AjpHggrhA+3zId3XoQZYr3Qb+nUcdTsMsgbRC3sskAwmq51foOqZ6qnYdInv
         UUJOT9t5TzOqosQCupjdmzEObhKMc4w1s18NQnsik0P/bKULAl8Onw4KOCveo5x0GAh7
         RaUntEQHYu++H5w31/KYJEi6E3YJpOTs0I5RL9R2nfRUNk857QuC2QWgDg7S3AjkRTNc
         LrTE1Rk+N81os5fntefSFllFFPTe1eKB5rHolnBsENo2RITdjmV27aXUZxvXBbvbm3kK
         Xg+tHsDgJqEX4HjSGYrFjoNTxsZMxFdCxX0lJ3HbF+1o3b2bbZMY74hWzPuxqHND261x
         gXIw==
X-Forwarded-Encrypted: i=1; AJvYcCWOW7eAosD9hLWyhuIBq4aBGbkpbaWxyuL/F2ppDNfzwb1USbYkr0aFCkmyHGuqeiBsX37k3JWy5+kkDL/35zGtaOjsIUoarSjzWv2xvw==
X-Gm-Message-State: AOJu0YyTPicwW7myTJKpHTC6H8AY5I+Hunhhimj3GIEJap0rvMW2D0Jx
	K5cFBWUAnYgk5oFno81z3Szx6+MMb2fhZHx6cVcgcuXdpGZXdS0lW5+RWHlZ4l8WGYRXUlFxxQs
	murVA3C2IMxroxwGw25M09zlM1E223pWKXv1P
X-Google-Smtp-Source: AGHT+IFS5Tg6/1f5zul0WlstKMG5hOJqpcrTEHbrOjqqZr3yr5nFPOGk40LTscDmB79uY8ZoZrzsbej+EEA5xeCCQ/c=
X-Received: by 2002:a05:620a:240d:b0:7a2:d64:1bbf with SMTP id
 af79cd13be357-7a34eec99d9mr1971902185a.1.1722893837737; Mon, 05 Aug 2024
 14:37:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Aug 2024 14:37:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMi1Hd2_a7TjA7J9ShrAbNOd_CoZ3D87twmO5t+nZxC9sX18tA@mail.gmail.com>
References: <20240502224703.103150-1-swboyd@chromium.org> <CAE-0n50VDgsg-4QnynvLOzykr3KP5JsnHqeFPA=uRT3EfgL19g@mail.gmail.com>
 <CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com>
 <CAE-0n53X1Gv9nnyDfeivYd7n5W6D1WFkO0tCvYc9drb0+4hQbw@mail.gmail.com> <CAMi1Hd2_a7TjA7J9ShrAbNOd_CoZ3D87twmO5t+nZxC9sX18tA@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 5 Aug 2024 14:37:16 -0700
Message-ID: <CAE-0n52JgfCBWiFQyQWPji8cq_rCsviBpW-m72YitgNfdaEhQg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: Park shared RCGs upon registration
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Laura Nao <laura.nao@collabora.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Douglas Anderson <dianders@chromium.org>, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Amit Pundir (2024-08-05 03:43:14)
> On Sat, 3 Aug 2024 at 06:29, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Also please send back the dmesg so we can see what clks are configured
> > for at boot time. If they're using TCXO source at boot then they're not
> > going to be broken. In which case those clks can keep using the old clk
> > ops and we can focus on the ones that aren't sourcing from TCXO.
>
> Thank your for this debug patch. I thought I narrowed down the
> breakage to the clks in drivers/clk/qcom/gcc-sm8550.c, until I ran
> into the following kernel panic in ucsi_glink driver in later test
> runs.

Thanks for the info. These are the clks that aren't sourcing from XO
at registration time:

  gcc_qupv3_wrap1_s7_clk_src with cfg 0x102601 -> parent is gpll0_out_even
  gcc_ufs_phy_axi_clk_src with cfg 0x103 -> parent is gpll0_out_main
  gcc_ufs_phy_ice_core_clk_src with cfg 0x503 -> parent is gpll4_out_main
  gcc_ufs_phy_unipro_core_clk_src with cfg 0x103 -> parent is gpll0_out_main
  gcc_usb30_prim_master_clk_src with cfg 0x105 -> parent is gpll0_out_main

The original patch is going to inform the clk framework that the parent
of these clks aren't XO but something like gpll0_out_even, whatever the
hardware is configured for. That may cause these PLLs to be turned off
earlier than before if, for example, gcc_ufs_phy_axi_clk_src is turned
off by a consumer and gcc_usb30_prim_master_clk_src is left enabled at
boot. That's why we force park clks at registration time, so that they
can't have their parent clk get turned off by some other clk consumer
enabling and then disabling a clk that's also parented to the same
parent.

This same problem exists for RCGs that aren't shared too, but it's
particularly bad for shared RCGs because the parent PLLs aren't turned
on automatically by the hardware when things like the GDSC do their
housekeeping. At least when software is in control we can enable the
parent PLL and unstick the RCG that was previously cut off.

Can you narrow down the list above to the clk that matters? I guess if
USB isn't working then gcc_usb30_prim_master_clk_src is the one that
should be changed and nothing else. Although, I noticed that in the
first dmesg log you sent the serial console had garbage, and that's
likely because the rate changed while the clk was registered. I don't
know why the gcc_qupv3_wrap1_s7_clk_src is marked with the shared clk
ops. That's confusing to me as I don't expect that to need to be parked
for any reasons. Maybe qcom folks can comment there but I'd expect plain
rcg2_ops to be used for those clks. Anyway, if you can narrow down to
which clk needs to be left untouched it would be helpful.

>
> [    7.882923][    T1] init: Loading module /lib/modules/ucsi_glink.ko
> with args ''
> [    7.892929][   T92] Unable to handle kernel NULL pointer
> dereference at virtual address 0000000000000010
> [    7.894935][    T1] init: Loaded kernel module /lib/modules/ucsi_glink.ko
> [    7.902670][   T92] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000886218000
> [    7.902674][   T92] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> [    7.993995][   T64] qcom_pmic_glink pmic-glink: Failed to create
> device link (0x180) with a600000.usb
> [    8.078673][   T92] CPU: 7 UID: 0 PID: 92 Comm: kworker/7:2
> Tainted: G S          E      6.11.0-rc2-mainline-00001-g4153d980358d
> #6
> [    8.078676][   T92] Tainted: [S]=CPU_OUT_OF_SPEC, [E]=UNSIGNED_MODULE
> [    8.078677][   T92] Hardware name: Qualcomm Technologies, Inc.
> SM8550 HDK (DT)
> [    8.078679][   T92] Workqueue: events pmic_glink_ucsi_register [ucsi_glink]
> [    8.078682][   T92] pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT
> -SSBS BTYPE=--)
> [    8.078684][   T92] pc : pmic_glink_send+0x10/0x2c [pmic_glink]
> [    8.078685][   T92] lr : pmic_glink_ucsi_read+0x84/0x14c [ucsi_glink]
> [    8.078704][   T92] Call trace:
> [    8.078705][   T92]  pmic_glink_send+0x10/0x2c [pmic_glink]
> [    8.078706][   T92]  pmic_glink_ucsi_read+0x84/0x14c [ucsi_glink]
> [    8.078707][   T92]  pmic_glink_ucsi_read_version+0x20/0x30 [ucsi_glink]
> [    8.078708][   T92]  ucsi_register+0x28/0x70
> [    8.078717][   T92]  pmic_glink_ucsi_register+0x18/0x28 [ucsi_glink]
> [    8.078718][   T92]  process_one_work+0x184/0x2e8
> [    8.078723][   T92]  worker_thread+0x2f0/0x404
> [    8.078725][   T92]  kthread+0x114/0x118
> [    8.078728][   T92]  ret_from_fork+0x10/0x20
> [    8.078732][   T92] ---[ end trace 0000000000000000 ]---
> [    8.078734][   T92] Kernel panic - not syncing: Oops: Fatal exception
> [    8.078735][   T92] SMP: stopping secondary CPUs
> [    8.279136][   T92] Kernel Offset: 0x14d9480000 from 0xffffffc080000000
> [    8.279141][   T92] PHYS_OFFSET: 0x80000000
> [    8.279143][   T92] CPU features: 0x18,004e0003,80113128,564676af
> [    8.279148][   T92] Memory Limit: none

That looks like 'client' is NULL in pmic_glink_send(). The VA of 0x10 is
the offset of 'pg' in struct pmic_glink_client. I don't know much about
that driver but I'd guess that ucsi_glink has some race condition
assigning the client pointer?

Oh actually, I see the problem. devm_pmic_glink_register_client()
returns a struct pmic_glink_client pointer that's assigned to
'ucsi->client'. And pmic_glink_ucsi_read() uses 'ucsi->client' to call
pmic_glink_send(). That pointer is NULL because the workqueue that runs
pmic_glink_ucsi_register() must run before
devm_pmic_glink_register_client() returns and assigns the client pointer
to 'ucsi->client'. This is simply a race.

 CPU0                                        CPU1
 ----                                        ----
 ucsi->client = NULL;
 devm_pmic_glink_register_client()
  client->pdr_notify(client->priv, pg->client_state)
   pmic_glink_ucsi_pdr_notify()
    schedule_work(&ucsi->register_work)
    <schedule away>
                                             pmic_glink_ucsi_register()
                                              ucsi_register()
                                               pmic_glink_ucsi_read_version()
                                                pmic_glink_ucsi_read()
                                                 pmic_glink_ucsi_read()
                                                  pmic_glink_send(ucsi->client)
                                                  <client is NULL BAD>
 ucsi->client = client // Too late!

>
> I couldn't reproduce this kernel panic on vanilla v6.11-rc2 in 50+
> test runs after that. So I'm assuming that this debug patch may have
> triggered it.
> Attaching the crashing and working dmesg logs with the debug patch applied.
>

Sounds like you just need to reboot a bunch! Or add an msleep() in
devm_pmic_glink_register_client() after the notify call to open the race
window and let the workqueue run.

