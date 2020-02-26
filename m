Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 080A916FEA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 13:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgBZMJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 07:09:28 -0500
Received: from foss.arm.com ([217.140.110.172]:34998 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbgBZMJ2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 07:09:28 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 352171FB;
        Wed, 26 Feb 2020 04:09:25 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D98253FA00;
        Wed, 26 Feb 2020 04:09:23 -0800 (PST)
Date:   Wed, 26 Feb 2020 12:09:19 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt: psci: Add arm,psci-sys-reset2-type property
Message-ID: <20200226120918.GA21897@lakrids.cambridge.arm.com>
References: <1582577858-12410-1-git-send-email-eberman@codeaurora.org>
 <1582577858-12410-2-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582577858-12410-2-git-send-email-eberman@codeaurora.org>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 24, 2020 at 12:57:36PM -0800, Elliot Berman wrote:
> Some implementors of PSCI may relax the requirements of the PSCI
> architectural warm reset. In order to comply with PSCI specification, a
> different reset_type value must be used.

This reads as-if you're saying the firmware isn't spec compliant, and
this is a workaround in order to get the expected behaviour.

Can you please elaborate on what you mean by "relax the requirements"
here? What's your firmware doing or not doing that you want to avoid?

> The alternate PSCI SYSTEM_RESET2 may be used in all warm/soft reboot
> scenarios, replacing the architectural warm reset.

I assume you mean SYSTEM_REET2's SYSTEM_WARM_RESET reset? Please call
that out explicitly by name -- it makes this easier to look up, and
if/when more architectural resets are added the commit message won't
become ambiguous.

> 
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/psci.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
> index 8ef8542..469256a2 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -102,6 +102,11 @@ properties:
>        [1] Kernel documentation - ARM idle states bindings
>          Documentation/devicetree/bindings/arm/idle-states.txt
>  
> +  arm,psci-sys-reset2-param:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +        reset_param value to use during a warm or soft reboot.

A "soft" reboot isn't a PSCI concept, so I'm worried this is just
hooking up magic values for Linux internals.

I'd like to better understand what you're trying to achieve here.

Thanks,
Mark.

> +
>    "#power-domain-cells":
>      description:
>        The number of cells in a PM domain specifier as per binding in [3].
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
