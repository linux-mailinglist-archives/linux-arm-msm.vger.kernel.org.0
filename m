Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACC218D9E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 18:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfEIQE7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 12:04:59 -0400
Received: from ns.iliad.fr ([212.27.33.1]:51454 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726469AbfEIQE7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 12:04:59 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id A151A206A1;
        Thu,  9 May 2019 18:04:57 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 7C21020B7F;
        Thu,  9 May 2019 18:04:50 +0200 (CEST)
Subject: Re: [PATCH v1 2/3] drm/msm: Print all 64 bits of the faulting IOMMU
 address
To:     Jordan Crouse <jcrouse@codeaurora.org>
References: <1557252127-11145-1-git-send-email-jcrouse@codeaurora.org>
 <1557252127-11145-3-git-send-email-jcrouse@codeaurora.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <cdf42319-b64c-4455-c6e1-94a9420a2da8@free.fr>
Date:   Thu, 9 May 2019 18:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557252127-11145-3-git-send-email-jcrouse@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu May  9 18:04:57 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/05/2019 20:02, Jordan Crouse wrote:

> When we move to 64 bit addressing for a5xx and a6xx targets we will start
> seeing pagefaults at larger addresses so format them appropriately in the
> log message for easier debugging.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/gpu/drm/msm/msm_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 12bb54c..1926329 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -30,7 +30,7 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>  	struct msm_iommu *iommu = arg;
>  	if (iommu->base.handler)
>  		return iommu->base.handler(iommu->base.arg, iova, flags);
> -	pr_warn_ratelimited("*** fault: iova=%08lx, flags=%d\n", iova, flags);
> +	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);

Why no leading 0 for 64-bit numbers?

Will 32-bit platforms always get 8 useless characters?

Regards.
