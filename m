Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC89206CF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 08:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388844AbgFXGr3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 02:47:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:12454 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388972AbgFXGr2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 02:47:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592981247; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fgAzExtdq4ynaWrs/fcnkpqUduKWfsqLXERwz3zJhrw=;
 b=vasFtkyiQZRtOAHd2KsjOo2IPfSlkNGbXpztpB+rDB11FTk2xnU584YjDNI8q6y6vVqVkiH+
 95JM7WnLaxBH7cHJDhxl9BKbVRLC7SG16ltbloGYpoqj8rSs/CUNBn6TlsPu/dgmGfrbeEWJ
 P9wu1CCutcs32f6HukQefD3ysO0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-east-1.postgun.com with SMTP id
 5ef2f6ed8fe116ddd92ef683 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Jun 2020 06:47:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 41425C433C8; Wed, 24 Jun 2020 06:47:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E02D4C433CA;
        Wed, 24 Jun 2020 06:47:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Jun 2020 12:17:07 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] venus: core: add shutdown callback for venus
In-Reply-To: <1592044386-15654-1-git-send-email-mansur@codeaurora.org>
References: <1592044386-15654-1-git-send-email-mansur@codeaurora.org>
Message-ID: <7223de0f80de73835238abe13a79d1bc@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mansur,

On 2020-06-13 16:03, Mansur Alisha Shaik wrote:
> After the SMMU translation is disabled in the
> arm-smmu shutdown callback during reboot, if
> any subsystem are still alive then IOVAs they
> are using will become PAs on bus, which may
> lead to crash.
> 
> Below are the consumers of smmu from venus
> arm-smmu: consumer: aa00000.video-codec supplier=15000000.iommu
> arm-smmu: consumer: video-firmware.0 supplier=15000000.iommu
> 
> So implemented shutdown callback, which detach iommu maps.
> 
> Change-Id: I0f0f331056e0b84b92f1d86f66618d4b1caaa24a
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c
> b/drivers/media/platform/qcom/venus/core.c
> index 30d4b9e..acf798c 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -371,6 +371,14 @@ static int venus_remove(struct platform_device 
> *pdev)
>  	return ret;
>  }
> 
> +static void venus_core_shutdown(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret = venus_remove(pdev);
> +	WARN_ON(ret < 0);

I don't think you should warn here, its shutdown path and you can't
do anything with this WARN unlike remove callback where you have
to be sure to cleanup properly so that you are able to reload module.
But if you still want a hint about this failure, then just add a 
dev_err()
to indicate the failure instead of a big stack trace spamming kernel 
log.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
