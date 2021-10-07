Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E75A425CF1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 22:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbhJGULM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 16:11:12 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36392 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230015AbhJGULM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 16:11:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633637358; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TgUP7H/55CzhTMa+kBh6z+HzWDqvhowEqxczuK+iB1E=;
 b=cOgAqdGb37sKY9RaWlhMO89VjFQejErda0OF4E/C4d38cyh2HRouFSdh4W/RQJ/xQI5A8XrK
 s4kkEQYBLOxt2RLjC9ZgmbrdN+DEXVJjzMfEZmAvlJDbqK5Ds5QM7eZsXmtjGqlWyLbUZMJR
 eqFffOBSNgusWI/QkfchIFLt1rQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 615f53d9de4c4ed3855fb0f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 20:08:57
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 379A6C4360D; Thu,  7 Oct 2021 20:08:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B3021C4338F;
        Thu,  7 Oct 2021 20:08:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 08 Oct 2021 01:38:55 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     will@kernel.org
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, swboyd@chromium.org,
        mka@chromium.org, ohad@wizery.com, agross@kernel.org,
        mathieu.poirier@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        evgreen@chromium.org, dianders@chromium.org,
        sibis=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v5 04/10] iommu/arm-smmu-qcom: Request direct mapping for
 modem device
In-Reply-To: <1631886935-14691-5-git-send-email-sibis@codeaurora.org>
References: <1631886935-14691-1-git-send-email-sibis@codeaurora.org>
 <1631886935-14691-5-git-send-email-sibis@codeaurora.org>
Message-ID: <0dcf1cae8c8d173922788d2807a7975f@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Will,

Can you pick this patch up, the rest of
the series is now in linux-next.

On 2021-09-17 19:25, Sibi Sankar wrote:
> The SID configuration requirement for Modem on SC7280 is similar to the
> ones found on SC7180/SDM845 SoCs. So, add the SC7280 modem compatible 
> to
> the list to defer the programming of the modem SIDs to the kernel.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 55690af1b25d..3b9b46fca0b3 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -231,6 +231,7 @@ static const struct of_device_id
> qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,sc7180-mdss" },
>  	{ .compatible = "qcom,sc7180-mss-pil" },
>  	{ .compatible = "qcom,sc7280-mdss" },
> +	{ .compatible = "qcom,sc7280-mss-pil" },
>  	{ .compatible = "qcom,sc8180x-mdss" },
>  	{ .compatible = "qcom,sdm845-mdss" },
>  	{ .compatible = "qcom,sdm845-mss-pil" },

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
