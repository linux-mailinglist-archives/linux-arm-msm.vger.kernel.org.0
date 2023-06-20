Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0415573764A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 22:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjFTUuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 16:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjFTUuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 16:50:13 -0400
X-Greylist: delayed 494 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 20 Jun 2023 13:50:12 PDT
Received: from out-35.mta0.migadu.com (out-35.mta0.migadu.com [91.218.175.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F1ECE6E
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 13:50:11 -0700 (PDT)
Date:   Tue, 20 Jun 2023 20:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1687293715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=L64YVDXOUKmyXfZrd6jQHjCOQDs1molwdJ5PUzFNgJ0=;
        b=HH7Xq/r7d7te0s8mmsjqnMWH3FKTfjbMgo+hJvRRlsFTj10T3ZKyDQke0UYzxLAFVrbeSo
        N0z5scK+Eb8MzeofcMgg60O5s531IdMwpTA2vIBgdQJKdOJVINMkHW4vAYXjnRiZPiCKXF
        s4j+TfnS7njzApxhClSoZlG61QqMkRs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Oliver Upton <oliver.upton@linux.dev>
To:     Mark Brown <broonie@kernel.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Joey Gouly <joey.gouly@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>, nd@arm.com,
        catalin.marinas@arm.com, james.morse@arm.com, mark.rutland@arm.com,
        maz@kernel.org, shuah@kernel.org, suzuki.poulose@arm.com,
        will@kernel.org, yuzenghui@huawei.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v4 16/20] arm64: enable Permission Indirection Extension
 (PIE)
Message-ID: <ZJIPDsD1zmnzu6pD@linux.dev>
References: <20230606145859.697944-1-joey.gouly@arm.com>
 <20230606145859.697944-17-joey.gouly@arm.com>
 <c3598e8e-46a5-c8d6-bf9f-9fb8f6cd346e@linaro.org>
 <c977d0ef-8bb5-4922-a468-8d8858b688a8@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c977d0ef-8bb5-4922-a468-8d8858b688a8@sirena.org.uk>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 20, 2023 at 09:27:18PM +0100, Mark Brown wrote:
> On Tue, Jun 20, 2023 at 09:16:05PM +0200, Neil Armstrong wrote:
> 
> > This patch on linux-next causes a great amount of:
> 
> > X     xxx.xxxxxx Emulated RAZ for ID register: ISS 0x36002f
> 
> > messages printed by the system firmware on the Qualcomm SM8550 SoC,
> > and the platform is barely usable.
> 
> Regardless of what the kernel is doing it looks like there's a firmware
> issue here, all otherwise undefined registers in the ID space should be
> RAZ so spamming the logs like this isn't great.

Agreed. This isn't a kernel issue... We already do 2 ID register reads
in __cpu_setup(), so can't really blame this change for adding a third.

This stinks of Gunyah:

https://github.com/quic/gunyah-hypervisor/blob/3d4014404993939f898018cfb1935c2d9bfc2830/hyp/vm/vcpu/aarch64/src/sysreg_traps.c#L1177

-- 
Thanks,
Oliver
