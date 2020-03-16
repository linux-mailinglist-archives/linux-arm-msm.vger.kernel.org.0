Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B36186ED6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731744AbgCPPnL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:43:11 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39668 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731762AbgCPPnL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:43:11 -0400
Received: by mail-wr1-f65.google.com with SMTP id h6so1501764wrs.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DdvuxQV8MUJ3DF0txatG/PoeJXobhfl8uAplHUnRQXw=;
        b=gEq8/ZMBwfLkBD9tGRHGjZfTd20HP1xHo/lJCYGOxGAYI7JgVG9jMowKPQSyqmQoJH
         Q9ZbaY7SOKJp8K4eyLHZOG5BXM7bIz0LDg0iLZ0C7XwnSZgO4Q7ql/grJgyu+f0XKKiZ
         8hj2Hl5fh1i6wP+q7uq/YnEi3K13FYNSMiMBiMDb9rTjtVKuKwTX2bq22JmdTliOTXP2
         K+5zCU0/1lWFBSvTXbDx9fEkSA/zS7i5vKY3n2XrAijwrJW7uI1+D+Ab8wO+LOpxCjFg
         cLiZ+CoMaM/7tmWRw/RxFAOt/xBIBCD8p1Ekq22vHH0ospnbZ5362hTq6dFil73T5VxH
         cAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DdvuxQV8MUJ3DF0txatG/PoeJXobhfl8uAplHUnRQXw=;
        b=XEQhH+wv2LJ7BvsOchj6CyHX2WScC9ZSLf+WS+5MFkhsyB+87JVVS9yH6/3NrD9SxE
         ToRKIbPtPpeO3UXmpSxrIRMErJg5K8GCBDZbdJEjHQL7Eos3rGV4Lf+rQwoY+UyujuM2
         z9tuyfIXeRHQ+eqTD/SAtvDs1kv+i0sLSAUVX3+Njb9paAEy6YF1ZgpftQPOyyV0vgzi
         VzNq1fjoPbuksyAOWa9OVdX4TJ65mrEYWYkNOcu6mVVWZHC2S7fmKw2xxFHSYM+KGU1Y
         rsHOq+GjSCsUMPyNMpySS5odwTUQewGWCajKQgUnRZsAcYbendHvZP1tAP5v5lkVO+L6
         Ph/g==
X-Gm-Message-State: ANhLgQ2M7OW69HGFDBEquynEsfX/WBJ6/1+UvnOts5iS+VmGRDTLBfw2
        85xQ5KAEpEuXW6wc18jo09ByQHvrw0s=
X-Google-Smtp-Source: ADFU+vukGMBSU+PIquYB6P7V4T5BWKneai54XgateQmlyq1EDcQ3i3rP1F+AK6w2nNtuc0TA4HUjIw==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr35844297wrr.125.1584373387505;
        Mon, 16 Mar 2020 08:43:07 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id h13sm433117wrv.39.2020.03.16.08.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 08:43:07 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:42:59 +0100
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH 04/15] iommu/tegra-gart: Remove direct access of
 dev->iommu_fwspec
Message-ID: <20200316154259.GE304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-5-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-5-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:18AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Use the accessor functions instead of directly dereferencing
> dev->iommu_fwspec.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/tegra-gart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
> index 3fb7ba72507d..db6559e8336f 100644
> --- a/drivers/iommu/tegra-gart.c
> +++ b/drivers/iommu/tegra-gart.c
> @@ -247,7 +247,7 @@ static int gart_iommu_add_device(struct device *dev)
>  {
>  	struct iommu_group *group;
>  
> -	if (!dev->iommu_fwspec)
> +	if (!dev_iommu_fwspec_get(dev))
>  		return -ENODEV;
>  
>  	group = iommu_group_get_for_dev(dev);
> -- 
> 2.17.1
> 
