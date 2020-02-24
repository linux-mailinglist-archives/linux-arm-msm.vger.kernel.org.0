Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F93C16A319
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 10:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbgBXJwg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 04:52:36 -0500
Received: from foss.arm.com ([217.140.110.172]:34476 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbgBXJwg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 04:52:36 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74A4E30E;
        Mon, 24 Feb 2020 01:52:35 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 244F73F703;
        Mon, 24 Feb 2020 01:52:34 -0800 (PST)
Date:   Mon, 24 Feb 2020 09:52:32 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-arm-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt: psci: Add arm,psci-sys-reset2-type property
Message-ID: <20200224095232.GB28594@bogus>
References: <1582327685-6316-1-git-send-email-eberman@codeaurora.org>
 <1582327685-6316-2-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582327685-6316-2-git-send-email-eberman@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 21, 2020 at 03:28:03PM -0800, Elliot Berman wrote:
> Some implementors of PSCI may relax the requirements of the PSCI
> architectural warm reset. In order to comply with PSCI specification, a
> different reset_type value must be used. The alternate PSCI
> SYSTEM_RESET2 may be used in all warm/soft reboot scenarios, replacing
> the architectural warm reset.
> 
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/psci.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
> index 8ef8542..a790e5a 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -102,6 +102,11 @@ properties:
>        [1] Kernel documentation - ARM idle states bindings
>          Documentation/devicetree/bindings/arm/idle-states.txt
>  
> +  arm,psci-sys-reset2-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +        reset_type parameter value to use during a warm or soft reboot.
> +

I would rather use param instead of type in the name.

--
Regards,
Sudeep
