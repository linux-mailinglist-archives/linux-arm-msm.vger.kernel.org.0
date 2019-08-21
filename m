Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBEA898782
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 00:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729090AbfHUWsq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 18:48:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39546 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729787AbfHUWsq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 18:48:46 -0400
Received: by mail-pf1-f195.google.com with SMTP id f17so2432952pfn.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2019 15:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=teKoEoZBkGuWM1am+bLxrzg6jS/TPSFr7t15zPBCNd0=;
        b=fn83oNtnI1C2eL/2sCStFsle3PKFMa1Tz57GE6Dkhr7A7QS4lH9XiGvffGi10XTFKV
         UsdNPY7I+LpQATbTGIgv7S0LftxvcXeDTKQffKaWrtb9vVR4wU7TNoHVG9WeC+HwjzJI
         ehriVN2QCZnH5FkGXbZeAx8QYXrakhPnYv9qBGrdxpVcW/tfmSVS/FYsKRbPfDglqMzN
         eJ44IDYR6NuXCBuB+dxB347ZfCQ2qbmNR+Tl6X6FSUASKblhb4KeDqVFDxY/vvnyFFVL
         WNyAX1XfPO3sD473CoaKkJaYn05hbRcw9nOyI3JOnVaIYLdm1qyvwWDqaLnUhH0pvsto
         F4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=teKoEoZBkGuWM1am+bLxrzg6jS/TPSFr7t15zPBCNd0=;
        b=dHAm4aG7sGcUE8bA4VGx3s93WNBtMqCA2MtmirHs7rF8w/kwF8TvMpQzBE0nIGZy2r
         f1YBEJ6WLr2b2MJy5bKroLR9nANMgMbTEUkxSXjOHrjeSp0UivmAP/K8LIg6ziMvfyje
         3KiCiLWJpSIKD8MHDPzS2+iGVEpYnPktyiYoUcihQf3HZQBjPIYtRPa7FbIFmGOGkLdW
         I533lhq6kcafIm3uoPb5+ljC754xr1eMZ1qI7jaEhHSEoE/oJPdQ9a+Ta00kGSGJ1Z5e
         B4Lh5bKTiZFiNbIKRRzjqRVXP/PZFCqY+KfqBwIOD34JM/tL9VOLwVcwHznnY9gDbYd/
         KouQ==
X-Gm-Message-State: APjAAAVG762rGlyk72suQHptmHIV8GFnfj+mIV3T34TbvPN2x+siCFGe
        ygQgWrGxaF8DcZ+xDN0j/E6nV07fUi4=
X-Google-Smtp-Source: APXvYqze4CscdkpN+NmoXK9M3820ciVP/ebbyCnpT1BSOyOKbjJX/1IXyEnQhdqXoEY4Czkz9iK+jw==
X-Received: by 2002:a63:e54f:: with SMTP id z15mr30949865pgj.4.1566427725453;
        Wed, 21 Aug 2019 15:48:45 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 5sm21909049pgh.93.2019.08.21.15.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 15:48:44 -0700 (PDT)
Date:   Wed, 21 Aug 2019 15:50:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, vkoul@kernel.org, aneela@codeaurora.org,
        mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org
Subject: Re: [PATCH v2 5/7] mailbox: qcom: Add support for Qualcomm SM8150
 and SC7180 SoCs
Message-ID: <20190821225031.GA1892@tuxbook-pro>
References: <20190807070957.30655-1-sibis@codeaurora.org>
 <20190807070957.30655-6-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807070957.30655-6-sibis@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 07 Aug 00:09 PDT 2019, Sibi Sankar wrote:

> Add the corresponding APSS shared offset for SM8150 and SC7180 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index 705e17a5479cc..2dfd288fe720d 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -118,7 +118,9 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = (void *)16 },
>  	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = (void *)8 },
>  	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = (void *)8 },
> +	{ .compatible = "qcom,sc7180-apss-shared", .data = (void *)12 },
>  	{ .compatible = "qcom,sdm845-apss-shared", .data = (void *)12 },
> +	{ .compatible = "qcom,sm8150-apss-shared", .data = (void *)12 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
