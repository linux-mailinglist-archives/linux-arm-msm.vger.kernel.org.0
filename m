Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0653BC9CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 12:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhGFK3X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 06:29:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:53186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231208AbhGFK3X (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 06:29:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5724B619A9;
        Tue,  6 Jul 2021 10:26:43 +0000 (UTC)
Date:   Tue, 6 Jul 2021 11:26:35 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "will@kernel.org" <will@kernel.org>,
        "ardb@kernel.org" <ardb@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "vincent.whitchurch@axis.com" <vincent.whitchurch@axis.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
Message-ID: <20210706102634.GB24903@arm.com>
References: <20210527124356.22367-1-will@kernel.org>
 <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 06, 2021 at 09:26:59AM +0000, Yassine Oudjana wrote:
> In-Reply-To: <20210527124356.22367-1-will@kernel.org>
> > Reduce ARCH_DMA_MINALIGN to 64 bytes and allow the warning/taint to
> > indicate if there are machines that unknowingly rely on this.
> 
> The warning is being triggered on Qualcomm MSM8996, as well as the out-of-spec taint:

Is this booting with ACPI or DT?

> ------------[ cut here ]------------
> rtc-pm8xxx 400f000.qcom,spmi:pmic@0:rtc@6000: ARCH_DMA_MINALIGN smaller than CTR_EL0.CWG (64 < 128)
> WARNING: CPU: 0 PID: 1 at arch/arm64/mm/dma-mapping.c:45 arch_setup_dma_ops+0xf8/0x10c
[...]
> This warning is triggered with nearly every driver probe, not only rtc-pm8xxx.

I have a suspicion none of the reported devices actually do any DMA, so
in practice it should be safe but we need to figure out why
arch_setup_dma_ops() gets called.

-- 
Catalin
