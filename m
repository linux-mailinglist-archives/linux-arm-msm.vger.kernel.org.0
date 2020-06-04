Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC17D1EEB30
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 21:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbgFDTdT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 15:33:19 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:59628 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgFDTdT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 15:33:19 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id D09B120021;
        Thu,  4 Jun 2020 21:33:14 +0200 (CEST)
Date:   Thu, 4 Jun 2020 21:33:13 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v2] drm/bridge: ti-sn65dsi86: ensure bridge suspend happens
 during PM sleep
Message-ID: <20200604193313.GA94913@ravnborg.org>
References: <20200604103438.23667-1-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604103438.23667-1-harigovi@codeaurora.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8 a=M66uC3hkwJVUcRF4gK8A:9
        a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22 a=pHzHmUro8NiASowvMSCR:22
        a=nt3jZW36AmriUCFCBwmW:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Harigovindan
On Thu, Jun 04, 2020 at 04:04:38PM +0530, Harigovindan P wrote:
> ti-sn65dsi86 bridge is enumerated as a runtime device.
> 
> Adding sleep ops to force runtime_suspend when PM suspend is
> requested on the device.

Patch looks correct - but could you please explain why it is needed.
What is the gain compared to not having this patch.

I ask for two reasons:
1) I really do not know
2) this info should be in the changelog

Without a better changelog no ack from me - sorry.

	Sam

> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> Changes in v2:
> 	- Include bridge name in the commit message and 
> 	remove dependent patchwork link from the commit
> 	text as bridge is independent of OEM(Stephen Boyd)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 6ad688b320ae..2eef755b2917 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -159,6 +159,8 @@ static int __maybe_unused ti_sn_bridge_suspend(struct device *dev)
>  
>  static const struct dev_pm_ops ti_sn_bridge_pm_ops = {
>  	SET_RUNTIME_PM_OPS(ti_sn_bridge_suspend, ti_sn_bridge_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
>  
>  static int status_show(struct seq_file *s, void *data)
> -- 
> 2.27.0
