Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066683B3BAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 06:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbhFYEaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 00:30:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26824 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhFYEaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 00:30:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624595267; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FyAYtbaok2H9V9sa1YDKM09HjyZfcS10U+iEyrt8ZqU=;
 b=VX2agA43RM8owgma+M9Vfi3223iNviJxNRvwZwHwtbGWqhbR+ebc7ql0dS69/zNZXQDhhn3J
 fimsbcfa10A9k5P5Dqd3WSA7kzSS/Cxye+c0ry9rguBBq2KtoaMBMSUMVOXXISz6/HjRFywi
 9PCVwnM14iR5x7UMMZ78o00n/R0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60d55b3a7b2963a282f721fa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Jun 2021 04:27:38
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B9480C4338A; Fri, 25 Jun 2021 04:27:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D32A2C433D3;
        Fri, 25 Jun 2021 04:27:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 25 Jun 2021 09:57:36 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 4/9] iommu/arm-smmu-qcom: Request direct mapping for modem
 device
In-Reply-To: <1624564058-24095-5-git-send-email-sibis@codeaurora.org>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-5-git-send-email-sibis@codeaurora.org>
Message-ID: <dd64ccda508175b6b276314bb0798e89@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-25 01:17, Sibi Sankar wrote:
> The SID configuration requirement for Modem on SC7280 is similar to the
> ones found on SC7180/SDM845 SoCs. So, add the SC7280 modem compatible 
> to
> the list to defer the programming of the modem SIDs to the kernel.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 7771d40176de..90d471a387bf 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -179,6 +179,7 @@ static const struct of_device_id
> qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,sc7180-mdss" },
>  	{ .compatible = "qcom,sc7180-mss-pil" },
>  	{ .compatible = "qcom,sc7280-mdss" },
> +	{ .compatible = "qcom,sc7280-mss-pil" },
>  	{ .compatible = "qcom,sc8180x-mdss" },
>  	{ .compatible = "qcom,sdm845-mdss" },
>  	{ .compatible = "qcom,sdm845-mss-pil" },

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
