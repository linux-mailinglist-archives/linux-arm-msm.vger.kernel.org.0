Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049D9D3C1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 11:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfJKJTg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 05:19:36 -0400
Received: from ns.iliad.fr ([212.27.33.1]:48836 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726585AbfJKJTg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 05:19:36 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 2CEE92058F;
        Fri, 11 Oct 2019 11:19:34 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 15A5A204C8;
        Fri, 11 Oct 2019 11:19:34 +0200 (CEST)
Subject: Re: Relax CPU features sanity checking on heterogeneous architectures
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <b3606e76af42f7ecf65b1bfc2a5ed30a@codeaurora.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <7ef16e2a-b35c-0807-67be-c56dadb6fa66@free.fr>
Date:   Fri, 11 Oct 2019 11:19:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b3606e76af42f7ecf65b1bfc2a5ed30a@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri Oct 11 11:19:34 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2019 07:49, Sai Prakash Ranjan wrote:

> diff --git a/arch/arm64/kernel/cpufeature.c 
> b/arch/arm64/kernel/cpufeature.c
> index cabebf1a7976..207197692caa 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -164,8 +164,8 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr0[] 
> = {
>          S_ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, 
> ID_AA64PFR0_FP_SHIFT, 4, ID_AA64PFR0_FP_NI),
>          /* Linux doesn't care about the EL3 */
>          ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, 
> ID_AA64PFR0_EL3_SHIFT, 4, 0),
> -       ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 
> ID_AA64PFR0_EL2_SHIFT, 4, 0),
> -       ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 
> ID_AA64PFR0_EL1_SHIFT, 4, ID_AA64PFR0_EL1_64BIT_ONLY),
> +       ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, 
> ID_AA64PFR0_EL2_SHIFT, 4, 0),
> +       ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, 
> ID_AA64PFR0_EL1_SHIFT, 4, ID_AA64PFR0_EL1_64BIT_ONLY),
>          ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 
> ID_AA64PFR0_EL0_SHIFT, 4, ID_AA64PFR0_EL0_64BIT_ONLY),
>          ARM64_FTR_END,
>   };
> @@ -345,10 +345,10 @@ static const struct arm64_ftr_bits 
> ftr_generic_32bits[] = {
>          ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 24, 4, 
> 0),
>          ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 20, 4, 
> 0),
>          ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 16, 4, 
> 0),
> -       ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 12, 4, 
> 0),
> +       ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, 12, 4, 
> 0),
>          ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 8, 4, 0),
> -       ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 4, 4, 0),
> -       ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 0, 4, 0),
> +       ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, 4, 4, 
> 0),
> +       ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, 0, 4, 
> 0),
>          ARM64_FTR_END,
>   };

Hello Sai,

Could you configure your webmail client to not wrap "long" lines?

Wrapping might break the patch, and the kernel logs would look better
in their original form.

Regards.
