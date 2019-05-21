Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1248254F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbfEUQKT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:10:19 -0400
Received: from ns.iliad.fr ([212.27.33.1]:54762 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727817AbfEUQKT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:10:19 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 67CFD20814;
        Tue, 21 May 2019 18:10:17 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 505B620348;
        Tue, 21 May 2019 18:10:17 +0200 (CEST)
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
 <a7514c68-d2d3-ce9e-bc4b-f484bb5bf3cf@free.fr>
Message-ID: <9dfe47bc-9f37-e494-271b-b343205c8073@free.fr>
Date:   Tue, 21 May 2019 18:10:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a7514c68-d2d3-ce9e-bc4b-f484bb5bf3cf@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue May 21 18:10:17 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2019 14:03, Marc Gonzalez wrote:

> the system starts to boot, hangs a few seconds, then silently reboots

Using extremely high-tech debugging tools (i.e. spraying printk left and right)
I traced this one down to:

psci_cpu_suspend_enter: 435
psci_cpu_suspend: 171
psci_cpu_suspend: __invoke_psci_fn_smc c4000001
__invoke_psci_fn_smc: id=c4000001 3 0 0
/*** we never return from arm_smccc_smc() ***/


The following dmesg log caught my eye, and might be relevant:

ARM_SMCCC_ARCH_WORKAROUND_1 missing from firmware


If I revert your patch, psci_cpu_suspend_enter() is never called,
so we don't tickle the arm_smccc_smc() monster.

Could it be that my FW doesn't support PSCI?

Regards.
