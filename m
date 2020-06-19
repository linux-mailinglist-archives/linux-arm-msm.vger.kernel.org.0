Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6E520008E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 05:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgFSDMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 23:12:54 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:18415 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726573AbgFSDMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 23:12:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592536372; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=lsyzurmElq8z11uDBfUqzzK77bSrT23gukb17nvxVmw=; b=N9WeD7o0/nAq6Mvb8F+NnI8bTrQHzsglYTu1t5YKTDd8TYV+mQJm7cylBUxaFmwkMDmgyRwy
 JpVgY5zSVHoYUPP++4I7SoS0vtoLXJ3aRIKwJ6m1rsCVtRuUFNuCoJWg9d66BXK5vlvbmlFX
 c4X0l+e+TiQt/2ojplrLJHBvfbI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5eec2d34a6e154319facda45 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Jun 2020 03:12:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 29CFDC433C8; Fri, 19 Jun 2020 03:12:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.6] (unknown [171.78.159.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85401C433CA;
        Fri, 19 Jun 2020 03:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 85401C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH V3 4/5] phy: qcom-qusb2: Add ipq8074 device compatible
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, kishon@ti.com, vkoul@kernel.org,
        robh+dt@kernel.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1591625479-4483-1-git-send-email-sivaprak@codeaurora.org>
 <1591625479-4483-5-git-send-email-sivaprak@codeaurora.org>
From:   Sricharan Ramabadhran <sricharan@codeaurora.org>
Message-ID: <abf692c2-21d8-74eb-b960-6bdb865ea4ab@codeaurora.org>
Date:   Fri, 19 Jun 2020 08:42:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1591625479-4483-5-git-send-email-sivaprak@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/8/2020 7:41 PM, Sivaprakash Murugesan wrote:
> Add ipq8074 qusb2 device compatible for high speed usb support.
>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 393011a..557547d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -810,6 +810,9 @@ static const struct phy_ops qusb2_phy_gen_ops = {
>   
>   static const struct of_device_id qusb2_phy_of_match_table[] = {
>   	{
> +		.compatible	= "qcom,ipq8074-qusb2-phy",
> +		.data		= &msm8996_phy_cfg,
> +	}, {
>   		.compatible	= "qcom,msm8996-qusb2-phy",
>   		.data		= &msm8996_phy_cfg,
>   	}, {

Reviewed-by: Sricharan R <sricharan@codeaurora.org>

Regards,

  Sricharan


