Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52F11EE925
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 19:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730016AbgFDRJN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 13:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730023AbgFDRJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 13:09:11 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F94C08C5C2
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2020 10:09:10 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z64so3558635pfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2020 10:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vTStGj95ld9u7qkUYgU+8qXianN1IvrWD90jNTWUG9A=;
        b=Pp9oePz0iDeW5lK/UVyrG268kmsnptbgxA6fex7JANQGQupPY4LTPKk8NlJSjKAEXg
         MBJxHq+MIzP8rMGcq4X0bD3g3XJT/wzB0Vdv0PA3h9Tqc9+sJi1JwWAtYO+IdoTzROrQ
         Zd4zBPqauS3iobpGI1XpZUmAAfWqDbG2vd8/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vTStGj95ld9u7qkUYgU+8qXianN1IvrWD90jNTWUG9A=;
        b=cPqRinD+XhLB0ofQRockmiH9rcIAn8r4nnQBYCAhnqQtivlGGzyGFGGSMQWq1aSgKZ
         QyPtpPHJXtio+j34AjwEA4J0cP1+Steti6f8lWDvPXdm66fkO33aCqwjyE/kzu4lCBYF
         MqJmnBqNoew8JE6mcMO1Vk37rtHGrf1KL2ElyfqEszgMviweYWZ9IXr6aChW6D4APtyN
         725uOBE82XUcgufEcD9AD23wvZ0PdG/ImKVkoRWH3xz3QXKuIgRW9H8AWaETtL2GHmXB
         x59BckF5VuZN7uGKPffGBu3OfzGhiT2XbEhM7gTcB68cRvtAAgbL5YFf1TF61JCqAQni
         98nQ==
X-Gm-Message-State: AOAM533DtddqXbXx3dV8yduKSa3MAVbQ4wAlfxvZJVmGYeCh5Kbwabzy
        I6D1R44MGyNXyeDmkMBdaJiHBg==
X-Google-Smtp-Source: ABdhPJx2MzNkKVrT8WwTQAmXK4to6UBM/aaS1nLNNdsJTBm3DlU6iQH70iEPakIl6HD11i64VyfOrg==
X-Received: by 2002:a62:8cc7:: with SMTP id m190mr1386879pfd.174.1591290549416;
        Thu, 04 Jun 2020 10:09:09 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id q201sm4970443pfq.40.2020.06.04.10.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 10:09:08 -0700 (PDT)
Date:   Thu, 4 Jun 2020 10:09:06 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Pradeep P V K <ppvk@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc-owner@vger.kernel.org,
        rnayak@codeaurora.org, sibis@codeaurora.org, matthias@chromium.org
Subject: Re: [PATCH V2 1/2] mmc: sdhci-msm: Add interconnect bandwidth
 scaling support
Message-ID: <20200604170906.GP4525@google.com>
References: <1591269283-24084-1-git-send-email-ppvk@codeaurora.org>
 <1591269283-24084-2-git-send-email-ppvk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1591269283-24084-2-git-send-email-ppvk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 04, 2020 at 04:44:42PM +0530, Pradeep P V K wrote:
> Interconnect bandwidth scaling support is now added as a
> part of OPP [1]. So, make sure interconnect driver is ready
> before handling interconnect scaling.
> 
> This change is based on
> [1] [Patch v8] Introduce OPP bandwidth bindings
> (https://lkml.org/lkml/2020/5/12/493)
> 
> [2] [Patch v3] mmc: sdhci-msm: Fix error handling
> for dev_pm_opp_of_add_table()
> (https://lkml.org/lkml/2020/5/5/491)
> 
> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci-msm.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index b277dd7..a13ff1b 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/iopoll.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/interconnect.h>
>  
>  #include "sdhci-pltfm.h"
>  #include "cqhci.h"
> @@ -2070,6 +2071,18 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  	}
>  	msm_host->bulk_clks[0].clk = clk;
>  
> +	/* Make sure that ICC driver is ready for interconnect bandwdith
> +	 * scaling before registering the device for OPP.
> +	 */
> +	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
> +	if (ret) {
> +		if (ret == -EPROBE_DEFER)
> +			dev_info(&pdev->dev, "defer icc path: %d\n", ret);

I already commented on this on v1:

  This log seems to add little more than noise, or are there particular reasons
  why it is useful in this driver? Most drivers just return silently in case of
  deferred probing.

If you think the log is really needed please explain why.
