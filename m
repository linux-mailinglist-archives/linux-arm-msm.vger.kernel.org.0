Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2914540D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 07:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbhKQGYD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 01:24:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhKQGYC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 01:24:02 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B64AC061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:21:04 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id z2-20020a9d71c2000000b0055c6a7d08b8so2882315otj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=02STHSCJ+jlfTWifoEAhvcHaf43ykG6Mrv7Wewp8ywE=;
        b=ts+ssPefBnK/b0xWWGyuIHXzQvtf0bKkDpcKwhHFgCAOipm9TZROyc5ycNCt79uxos
         7bc/7L8DdLy6AXP2HysL6ftcAx9in+/YQDC2IO1ckXG2c5GIhwUB4oe1ZgGnj7zomIiF
         DLWEllyBlxgcgDr7FS1D/WMLD3eJZtaIgT7TnYIQXFv67Tyjt8gG/B8YzprE/HmF4tj8
         pT8zicMULnJARBOTf3Nt8JDUQ72vbq5ZeHjX/NnEX/2EX1sidEnivE/WfaTp8AwqlHvi
         51OY1/2ysPEZzxANAPd9nuDV2yRVtS3gcqQj/nG9GcSO8qUi6DkpnQnKFMIeGN1S4SWt
         /BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=02STHSCJ+jlfTWifoEAhvcHaf43ykG6Mrv7Wewp8ywE=;
        b=zsirsSQBxdQnV8DQRcj/ttr8B5Zv4Zs+ppdGxQWl7Mypa1hfUqPkzcsPxm75yi9c34
         WV7TpRNA4XM60R0NJuUfZzeXmLHnU0WDm4fZ/zABrg9tFlG9F4q8yIwloRPLkI7dU3r1
         HYqQpOIH9KDgYwqdiLtLtQZFx1zTDPFNqYZjvtCemzHr5ZQp1JQRLqDmw52d8Lok22Xg
         Y9NmvipboUbhMX9pJEwgC/fR8fqMiCuP+9TtacYQvCflAQJCs0nYmymkWpC+fO1mQdFv
         eJSjNZm/bi85YxwLgCttN1YGoZEzfZe3lfAZLdkUyfjNYH9YwdbbG6jenxV5yIfPjpZ+
         fy9Q==
X-Gm-Message-State: AOAM530UvBp2j8L99WLYwgc2xXt9pen/07AUHUDVqnJzZIwMM00pnSuZ
        6zJmBjNIFvpcS18rT0qy4gl9nw==
X-Google-Smtp-Source: ABdhPJyosdYfUTLZJbq491fRXwcpGZHjZtnVxZZx9dDPfScH/FG3mEvQ3JbD4RMslrC2fwzcxo7amQ==
X-Received: by 2002:a9d:6304:: with SMTP id q4mr10991214otk.290.1637130063455;
        Tue, 16 Nov 2021 22:21:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h14sm4128983ots.22.2021.11.16.22.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 22:21:03 -0800 (PST)
Date:   Wed, 17 Nov 2021 00:20:58 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Katherine Perez <kaperez@linux.microsoft.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/4] arm64: dts: qcom: sm8150: display support for
 Microsoft Surface Duo
Message-ID: <YZSfSgz/ALWTfLQ5@builder.lan>
References: <20211117013516.4111383-1-kaperez@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117013516.4111383-1-kaperez@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 16 Nov 19:35 CST 2021, Katherine Perez wrote:

> Hi Bjorn and Vinod,
> 
> I'm trying to enable the display subsystem on SM8150 but am having
> trouble enabling the DISP_CC_MDSS_AHB_CLK. Trace shows "disp_cc_mdss_ahb_clk
> status stuck at off". Do you have any pointers on enabling this clock?
> 

Hi Katherine,

This looks quite similar to an issue I'm chasing the past few days on
the sc8180x platform (which is derived from sm8150).

The problem seems to come down to the fact that we're not holding the
MMCX power-domain at a high enough performance_state through the boot
process and in contrast with other platforms these two are stricter in
their requirements.

For these platforms, the essence of the solution is that we need to hold
MMCX at nominal as long as there's display clocks ticking at high speed,
unfortunately there doesn't seem to be any quick way to achieve this -
so I now have a handful of patches that fix various aspects of this
issue, but not something reliable enough to post just yet.

Regards,
Bjorn

> msm_dsi_phy ae94400.dsi-phy: [drm:dsi_phy_driver_probe [msm]] *ERROR* dsi_phy_driver_probe: Unable to get ahb clk
> disp_cc-sm8250 af00000.clock-controller: supply mmcx not found, using dummy regulator
> platform ae96000.dsi: Fixing up cyclic dependency with ae00000.mdss:mdp@ae010000
> ------------[ cut here ]------------
> disp_cc_mdss_ahb_clk status stuck at 'off'
> WARNING: CPU: 6 PID: 76 at drivers/clk/qcom/clk-branch.c:91 clk_branch_wait+0x14c/0x164
> CPU: 6 PID: 76 Comm: kworker/u16:2 Not tainted 5.15.0 #17
> Hardware name: Microsoft Surface Duo (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : clk_branch_wait+0x14c/0x164
> lr : clk_branch_wait+0x14c/0x164
> sp : ffff80001078ba40
> x29: ffff80001078ba40 x28: 0000000000000000 x27: ffff65e6008e2100
> x26: ffffb8630ec8e278 x25: ffff65e60005e005 x24: ffffb8630ebc0f98
> x23: ffffb8630e234dd8 x22: 0000000000000001 x21: ffffb8630d5b8b60
> x20: 0000000000000000 x19: ffffb8630eb5e7b8 x18: 0000000000000030
> x17: 2e726f74616c7567 x16: ffffb8630d5a3800 x15: ffffffffffffffff
> x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
> x11: 77705f313439386d x10: 0000000000000027 x9 : ffffb8630cf974bc
> x8 : 0000000000000027 x7 : 0000000000000002 x6 : 0000000000000027
> x5 : ffff65e6f93cc9a8 x4 : ffff80001078b890 x3 : 0000000000000001
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff65e600851d80
> Call trace:
>  clk_branch_wait+0x14c/0x164
>  clk_branch2_enable+0x3c/0x60
>  clk_core_enable+0x78/0x220
>  clk_enable+0x38/0x60
>  dsi_phy_enable_resource+0x98/0xac [msm]
>  dsi_phy_driver_probe+0x29c/0x4f8 [msm]
>  platform_probe+0x74/0xe4
>  really_probe.part.0+0xa4/0x328
>  __driver_probe_device+0xa0/0x150
>  driver_probe_device+0x4c/0x164
>  __device_attach_driver+0xc0/0x128
>  bus_for_each_drv+0x84/0xe0
>  __device_attach+0xe0/0x188
>  device_initial_probe+0x20/0x2c
>  bus_probe_device+0xa8/0xbc
>  deferred_probe_work_func+0x90/0xc8
>  process_one_work+0x1f4/0x43c
>  worker_thread+0x78/0x4f0
>  kthread+0x154/0x160
>  ret_from_fork+0x10/0x20
> ---[ end trace 734ed75908fc6b0e ]---
> 
> Katherine Perez (4):
>   arm64: dts: qcom: sm8150: add dispcc node
>   arm64: dts: qcom: sm8150: add display nodes
>   arm64: dts: qcom: sm8150: add DSI display nodes
>   arm64: dts: qcom: sm8150: display support for Microsoft Surface Duo
> 
>  .../dts/qcom/sm8150-microsoft-surface-duo.dts |  26 ++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi          | 292 ++++++++++++++++++
>  2 files changed, 318 insertions(+)
> 
> --
> 2.31.1
> 
