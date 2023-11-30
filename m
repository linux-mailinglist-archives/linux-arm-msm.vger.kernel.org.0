Return-Path: <linux-arm-msm+bounces-2709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2157FEFA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 14:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE1BBB20D47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 13:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484453B1AC;
	Thu, 30 Nov 2023 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8EFAB10C9;
	Thu, 30 Nov 2023 05:00:06 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9C931042;
	Thu, 30 Nov 2023 05:00:52 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E56963F5A1;
	Thu, 30 Nov 2023 05:00:04 -0800 (PST)
Date: Thu, 30 Nov 2023 13:00:02 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com,
	linux-arm-kernel@lists.infradead.org, quic_asartor@quicinc.com,
	quic_lingutla@quicinc.com
Subject: Re: [PATCH 3/3] firmware: arm_scmi: Increase the maximum opp count
Message-ID: <ZWiHUt-N8GvG5z_O@pluto>
References: <20231129065748.19871-1-quic_sibis@quicinc.com>
 <20231129065748.19871-4-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129065748.19871-4-quic_sibis@quicinc.com>

On Wed, Nov 29, 2023 at 12:27:48PM +0530, Sibi Sankar wrote:
> The number of opps on certain variants of the X1E80100 SoC are greater
> than current maximum, so increase the MAX_OPP count to the next log level
> to accommodate that.
> 

Hi,


> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/firmware/arm_scmi/perf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> index 3344ce3a2026..edf34a3c4d6a 100644
> --- a/drivers/firmware/arm_scmi/perf.c
> +++ b/drivers/firmware/arm_scmi/perf.c
> @@ -24,7 +24,7 @@
>  #include "protocols.h"
>  #include "notify.h"
>  
> -#define MAX_OPPS		16
> +#define MAX_OPPS		24
>

There is an hashtable, opps_by_freq, sized by an ilog2()....

....so, can we stick to a power-of-2 like 32 instead ?
(and be more future proof too...)

Other than this, LGTM

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

