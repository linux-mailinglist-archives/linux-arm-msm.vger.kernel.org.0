Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A94AA17B15C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 23:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbgCEWW7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 17:22:59 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:45307 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgCEWW4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 17:22:56 -0500
Received: by mail-vs1-f67.google.com with SMTP id x194so256664vsc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 14:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=95/46g5pEvd0qIotsQKvfp4ftOtWVpLaKSOw5ad1I28=;
        b=SKt/zNaEj7PcvMg41K6OypdkLZVzRG52OYqtYvWkcRWn9j//QnasvOR12OKUzfD7KO
         aYa/iDeDuwOWKaDWQkTBA1cMErzjoLrYYHMJYQWpqpoKcIwr16xsI1/cf0JFFeX2V9iv
         LHt7+5U3D6FQcodeLvvpyfMH/NWNoE/MXgnIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=95/46g5pEvd0qIotsQKvfp4ftOtWVpLaKSOw5ad1I28=;
        b=rISBu5CLLDTCAulUlGrUMHNeMxmPkCwEWN/j8OXUDXNMNAUJSm/ZJOxJBH4lHRxt+p
         FEuhdPl6Yn6aH+Ss2UNn6ziqZZsTnio/rZOQMrTEzbqWv3sgfNt6ujtJL40ASDtyetnS
         BmGHUkx4nj4ZFY6hPet+oerE1JlUz0Q74+sE2agksTIggCkHFClOMxSCC7hQDeiTtybh
         p95s33YMXngBYCh9KONb+tCrAJD2qxwYUM/mEZfGpFPlSG5MQwYJkLog0I8UcQCpw5MY
         DVU/9joQ7/6nCa4P/oyU+Iaf8VcmI8gRm1cqUpFg2/BrkGybMPyfamO1zpEYgeVN1Kla
         WE2A==
X-Gm-Message-State: ANhLgQ2YgiFb2jRHeypCwZq+JBZ0+Z47nqtCMxLNWoj+rYISmxAfzHd1
        bYtC1udLx0L6lhpbrmz8Fon9157KMNA=
X-Google-Smtp-Source: ADFU+vucVu/mFwZEdl+QpeRfdJKGY0nZOsv3o4XuIVSv+e99ALAVaXMZjA1Nx80+5VJ5RKv6vy06Dg==
X-Received: by 2002:a67:e00c:: with SMTP id c12mr321944vsl.197.1583446974055;
        Thu, 05 Mar 2020 14:22:54 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id l5sm2843980vsb.2.2020.03.05.14.22.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2020 14:22:53 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a18so5548uao.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 14:22:52 -0800 (PST)
X-Received: by 2002:ab0:6652:: with SMTP id b18mr61173uaq.0.1583446972244;
 Thu, 05 Mar 2020 14:22:52 -0800 (PST)
MIME-Version: 1.0
References: <1583428023-19559-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1583428023-19559-1-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 5 Mar 2020 14:22:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XwGR+3n__q=ojz7fV3EOSzLYCUdvcsCDY=uLo+eRvUMw@mail.gmail.com>
Message-ID: <CAD=FV=XwGR+3n__q=ojz7fV3EOSzLYCUdvcsCDY=uLo+eRvUMw@mail.gmail.com>
Subject: Re: [PATCH v12 0/4] Invoke rpmh_flush for non OSI targets
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 5, 2020 at 9:07 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Changes in v12:
> - Kconfig change to remove COMPILE_TEST was dropped in v11, reinclude it.
>
> Changes in v11:
> - Address Doug's comments on change 2 and 3
> - Include change to invalidate TCSes before flush from [4]
>
> Changes in v10:
> - Address Evan's comments to update commit message on change 2
> - Add Evan's Reviewed by on change 2
> - Remove comment from rpmh_flush() related to last CPU invoking it
> - Rebase all changes on top of next-20200302
>
> Changes in v9:
> - Keep rpmh_flush() to invoke from within cache_lock
> - Remove comments related to only last cpu invoking rpmh_flush()
>
> Changes in v8:
> - Address Stephen's comments on changes 2 and 3
> - Add Reviewed by from Stephen on change 1
>
> Changes in v7:
> - Address Srinivas's comments to update commit text
> - Add Reviewed by from Srinivas
>
> Changes in v6:
> - Drop 1 & 2 changes from v5 as they already landed in maintainer tree
> - Drop 3 & 4 changes from v5 as no user at present for power domain in rsc
> - Rename subject to appropriate since power domain changes are dropped
> - Rebase other changes on top of next-20200221
>
> Changes in v5:
> - Add Rob's Acked by on dt-bindings change
> - Drop firmware psci change
> - Update cpuidle stats in dtsi to follow PC mode
> - Include change to update dirty flag when data is updated from [4]
> - Add change to invoke rpmh_flush when caches are dirty
>
> Changes in v4:
> - Add change to allow hierarchical topology in PC mode
> - Drop hierarchical domain idle states converter from v3
> - Address Merge sc7180 dtsi change to add low power modes
>
> Changes in v3:
> - Address Rob's comment on dt property value
> - Address Stephen's comments on rpmh-rsc driver change
> - Include sc7180 cpuidle low power mode changes from [1]
> - Include hierarchical domain idle states converter change from [2]
>
> Changes in v2:
> - Add Stephen's Reviewed-By to the first three patches
> - Addressed Stephen's comments on fourth patch
> - Include changes to connect rpmh domain to cpuidle and genpds
>
> Resource State Coordinator (RSC) is responsible for powering off/lowering
> the requirements from CPU subsystem for the associated hardware like buses,
> clocks, and regulators when all CPUs and cluster is powered down.
>
> RSC power domain uses last-man activities provided by genpd framework based
> on Ulf Hansoon's patch series[3], when the cluster of CPUs enter deepest
> idle states. As a part of domain poweroff, RSC can lower resource state
> requirements by flushing the cached sleep and wake state votes for various
> resources.
>
> [1] https://patchwork.kernel.org/patch/11218965
> [2] https://patchwork.kernel.org/patch/10941671
> [3] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=222355
> [4] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=236503
>
> Maulik Shah (3):
>   arm64: dts: qcom: sc7180: Add cpuidle low power states
>   soc: qcom: rpmh: Update dirty flag only when data changes
>   soc: qcom: rpmh: Invoke rpmh_flush for dirty caches
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 78 ++++++++++++++++++++++++++++++++++++
>  drivers/soc/qcom/rpmh.c              | 27 ++++++++++---
>  2 files changed, 100 insertions(+), 5 deletions(-)

One overall optimization idea?

Should we add two API calls:

rpmh_start_operations()
rpmh_end_operations()

These optional API calls would be an optimization a client could use.
When rpmh_start_operations() is called then RPMH code will inhibit
flushing (but will still update the "dirty" flag).  When
rpmh_end_operations() is called then the RPMH will flush if the dirty
flag is set.

This is a pretty simple concept but should have a huge impact in the
number of times we program hardware in non-OSI mode.  Specifically, if
we don't do that and we look at what happens in the interconnect code:

1. We "invalidate" the batch.  We have to flush the non-batch commands
back into the hardware.

2. We program the "wake only" commands.  We have to flush the batch
wake-only commands and also the non-batch commands back into the
hardware.

3. We program the "sleep only" commands.  We have to flush yet again
with everything.



-Doug
