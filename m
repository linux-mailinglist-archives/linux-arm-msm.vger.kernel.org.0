Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B44D024CCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 12:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbfEUKeu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 06:34:50 -0400
Received: from ns.iliad.fr ([212.27.33.1]:40754 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727673AbfEUKeu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 06:34:50 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id BEC3D206C6;
        Tue, 21 May 2019 12:34:47 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id B0E93206B9;
        Tue, 21 May 2019 12:34:47 +0200 (CEST)
Subject: Re: [PATCH v2 2/9] Documentation: arm: Link idle-states binding to
 "enable-method" property
To:     Amit Kucheria <amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <9dc4ce06143de48039e841c337fafa7cb9c8d7d2.1558430617.git.amit.kucheria@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <9722bb4a-5063-7f4c-c3a1-c0cf99b5ff7e@free.fr>
Date:   Tue, 21 May 2019 12:34:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9dc4ce06143de48039e841c337fafa7cb9c8d7d2.1558430617.git.amit.kucheria@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue May 21 12:34:47 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2019 11:35, Amit Kucheria wrote:

> The "enable-method" property for cpu nodes needs to be "psci" for CPU
> idle management to be setup correctly.
> 
> Add a note to the binding documentation to this effect to make it
> obvious.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  .../devicetree/bindings/arm/idle-states.txt         | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
> index 45730ba60af5..3bdbe675b9e6 100644
> --- a/Documentation/devicetree/bindings/arm/idle-states.txt
> +++ b/Documentation/devicetree/bindings/arm/idle-states.txt
> @@ -241,9 +241,13 @@ processor idle states, defined as device tree nodes, are listed.
>  			   - "psci"
>  			# On ARM 32-bit systems this property is optional
>  
> -The nodes describing the idle states (state) can only be defined within the
> -idle-states node, any other configuration is considered invalid and therefore
> -must be ignored.
> +This assumes that the "enable-method" property is set to "psci" in the cpu
> +node[6] that is responsible for setting up CPU idle management in the OS
> +implementation.
> +
> +The nodes describing the idle states (state) can only be defined
> +within the idle-states node, any other configuration is considered invalid
> +and therefore must be ignored.

Nit: I suppose your text editor automatically "reflowed" this last paragraph?
I would leave it as-is, to minimize the diff, and avoid cosmetic changes.

Regards.
