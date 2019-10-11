Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82CBAD3DFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 13:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbfJKLJ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 07:09:59 -0400
Received: from ns.iliad.fr ([212.27.33.1]:44702 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726935AbfJKLJ7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 07:09:59 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id EB584205C8;
        Fri, 11 Oct 2019 13:09:57 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id D51C52058F;
        Fri, 11 Oct 2019 13:09:57 +0200 (CEST)
Subject: Re: Relax CPU features sanity checking on heterogeneous architectures
To:     Mark Rutland <mark.rutland@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <b3606e76af42f7ecf65b1bfc2a5ed30a@codeaurora.org>
 <20191011105010.GA29364@lakrids.cambridge.arm.com>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <a86e9be2-fc82-afea-5e94-b15d7eef1b84@free.fr>
Date:   Fri, 11 Oct 2019 13:09:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191011105010.GA29364@lakrids.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri Oct 11 13:09:58 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2019 12:50, Mark Rutland wrote:

> Before we make any changes, we need to check whether we do actually
> handle this variation in a safe way, and we need to consider what this
> means w.r.t. late CPU hotplug.
> 
> Even if we can handle variation at boot time, once we've determined the
> set of system-wide features we cannot allow those to regress, and I
> believe we'll need new code to enforce that. I don't think it's
> sufficient to mark these as NONSTRICT, though we might do that with
> other changes.
> 
> We shouldn't look at the part number at all here. We care about
> variation across CPUs regardless of whether this is big.LITTLE or some
> variation in tie-offs, etc.

See also the "Unexpected variation in SYS_ID_AA64MMFR0_EL1" thread
from a year ago: (that was on msm8998)

	https://www.spinics.net/lists/arm-kernel/msg691242.html

Regards.
