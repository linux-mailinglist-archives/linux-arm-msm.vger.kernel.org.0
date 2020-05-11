Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47EEF1CE47C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 21:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731216AbgEKTac (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 15:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729453AbgEKTab (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 15:30:31 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7828C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 12:30:31 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id r14so5196240pfg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 12:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gzyfnO/5LbG2mrH2lA0azbgAQiWtK0agPG/QW/aD0JA=;
        b=OzVpqUU6k4CDMc0nrbShznwLyn+kmnl+BiPHhPbWnikxGiuco8hPSb3nS1q3qW7Cek
         TlIdfXMHgEChfZXCfsI3of4zCEHuppr5PoCE3ZmpK0SP1LiofuG1NSTRPyOmD0nbKgGD
         Bwa03tUplrVt+uaafrpI8WO/Kiw8FLdoImebhEbTRHIm2mxwGlr8SIVV8RSntyAW7IIW
         m9WJ98M8I/GIgMuti/4gM3KJ4GRCV7VPnkIyNoVSwhRvr8uOQ9XfPJNaLkNucRR21ygo
         7yLopUX/fMQxLY0w5Z54iE/yRdh2wOKRkc5CN/QWkO77VCCiI1CCgHTzJiuY46Yq4gJI
         1epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gzyfnO/5LbG2mrH2lA0azbgAQiWtK0agPG/QW/aD0JA=;
        b=ZLsZjhUCBJGv7j4hv7+U7Hma6xa+jkWi8sYaM/bjffIJkVvX4/StIF2JY8jaiz/spP
         4H8lgk9PP43HcoCgBQOJMwLKgxENuBL6Di9TdaigetLL93O007I4huO+UWOhwd8DqE2b
         4gHuNGVy9BYwDu5qaKLWOAoaTSQbx6N7UTydiyWS1/2Le6xkTI0O3V8hmBQq0HIzFcnW
         rHOTYmU+KLZWORBr94fQcTmzggsTlScVC6q0JauGKAxmWJWHGhbikeVxaSGt1NewidFR
         xuaq0tpFIvi+TPzeDikmlkHCBG85u7E5WBRzdK2Di/DIv8Ojdy9zPeMxhcD/loT7y4z5
         mbAg==
X-Gm-Message-State: AGi0PuZloCvc/isVfcSTdtG9rTFHD7414nCdF5fH5Xwxh52aZnrMCF+1
        Ewfqam3O8jhQR4DOKtllaClrdbAXfGg=
X-Google-Smtp-Source: APiQypIOtVLmN26sBLQEPnN3hrhyIv6xvI5WifHGysFUwEmFLrhzINvd3EvqA0ARHr6GkqxEp7LIOw==
X-Received: by 2002:a63:750b:: with SMTP id q11mr15767211pgc.138.1589225431230;
        Mon, 11 May 2020 12:30:31 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z185sm8726197pgz.26.2020.05.11.12.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 12:30:30 -0700 (PDT)
Date:   Mon, 11 May 2020 12:31:24 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        swboyd@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
        evgreen@chromium.org, mka@chromium.org
Subject: Re: [PATCH v6] iommu/arm-smmu-qcom: Request direct mapping for modem
 device
Message-ID: <20200511193124.GG20625@builder.lan>
References: <20200511175532.25874-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511175532.25874-1-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 May 10:55 PDT 2020, Sibi Sankar wrote:

> The modem remote processor has two access paths to DDR. One path is
> directly connected to DDR and another path goes through an SMMU. The
> SMMU path is configured to be a direct mapping because it's used by
> various peripherals in the modem subsystem. Typically this direct
> mapping is configured statically at EL2 by QHEE (Qualcomm's Hypervisor
> Execution Environment) before the kernel is entered.
> 
> In certain firmware configuration, especially when the kernel is already
> in full control of the SMMU, defer programming the modem SIDs to the
> kernel. Let's add compatibles here so that we can have the kernel
> program the SIDs for the modem in these cases.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> V6
>  * Rebased on Will's for-joerg/arm-smmu/updates
>  * Reword commit message and add more details [Stephen]
> 
>  drivers/iommu/arm-smmu-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index 5bedf21587a56..cf01d0215a397 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -17,7 +17,9 @@ static const struct of_device_id qcom_smmu_client_of_match[] = {
>  	{ .compatible = "qcom,mdp4" },
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,sc7180-mdss" },
> +	{ .compatible = "qcom,sc7180-mss-pil" },
>  	{ .compatible = "qcom,sdm845-mdss" },
> +	{ .compatible = "qcom,sdm845-mss-pil" },
>  	{ }
>  };
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
