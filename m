Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07D0719DBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 15:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbfEJNCp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 09:02:45 -0400
Received: from foss.arm.com ([217.140.101.70]:46622 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727258AbfEJNCp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 09:02:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBFD3374;
        Fri, 10 May 2019 06:02:44 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AA5B3F6C4;
        Fri, 10 May 2019 06:02:42 -0700 (PDT)
Date:   Fri, 10 May 2019 14:02:40 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCHv1 2/8] Documentation: arm: Link idle-states binding to
 code
Message-ID: <20190510130240.GC10284@e107155-lin>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <5f25e2b3096fa73f205e1797e355e049ed9f8c9c.1557486950.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f25e2b3096fa73f205e1797e355e049ed9f8c9c.1557486950.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 10, 2019 at 04:59:40PM +0530, Amit Kucheria wrote:
> The enable-method needs to be psci for the psci_cpuidle_ops to be
> correctly registered.
>
> Add a note to the binding documentation on where to find the declaration
> of the enable-method since it is a macro and escapes any attempts to
> grep for it.
>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/idle-states.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
> index 45730ba60af5..3a42335a6f3d 100644
> --- a/Documentation/devicetree/bindings/arm/idle-states.txt
> +++ b/Documentation/devicetree/bindings/arm/idle-states.txt
> @@ -239,6 +239,10 @@ processor idle states, defined as device tree nodes, are listed.
>  			# On ARM v8 64-bit this property is required and must
>  			  be:
>  			   - "psci"
> +			     (This assumes that the enable-method is "psci"
> +			     in the cpu node[6] that then uses the
> +			     CPUIDLE_METHOD_OF_DECLARE macro to setup the
> +			     psci_cpuidle_ops callbacks)

I don't prefer to refer some Linux implementation macros in DT bindings
as they may disappear any day. Further, the use of CPUIDLE_METHOD_OF_DECLARE
is restricted to ARM32 platforms only. So better to move it down without
the reference to the above macro or any kernel implementation details if
possible.

>  			# On ARM 32-bit systems this property is optional
>

Something like:
"This assumes that the "enable-method" property is set to "psci" in
in the cpu node[6] and use this property to set up the CPU idle
management in OS PM implementations"

With something on these line, you can add:

Acked-by: Sudeep Holla <sudeep.holla@arm.com

--
Regards,
Sudeep
