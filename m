Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3256224446E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 07:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgHNFJS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 01:09:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32073 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgHNFJS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 01:09:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597381757; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VeWbi+16wYbZZqduDvhUZ1AT4GOjuU763k6XIGoWzBQ=;
 b=sdPvLlW3CSxlOOBlupguGpw4oQmwGsyHHjY7KmCHVfduIf02i1Yw3OXuKOewLD6D2ooVvMuD
 IutE6rvvfqFCUiggr3BOwx0elC6cehObFK6RwjbPZEqoT/8tZODoiMSQhfuj8CX4zd5RY9dr
 F+T8JJZCPi56EpYqnpouFFNpOTc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f361c0203528d40248f6b1b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 14 Aug 2020 05:07:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0E394C433CB; Fri, 14 Aug 2020 05:07:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 78E4BC433C9;
        Fri, 14 Aug 2020 05:07:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 14 Aug 2020 10:37:13 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, swboyd@chromium.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: add SC7180 entry to soc_id array
In-Reply-To: <20200813080345.1.I85bb28f9ea3fa3bf797ecaf0a5218ced4cfaa6e2@changeid>
References: <20200813080345.1.I85bb28f9ea3fa3bf797ecaf0a5218ced4cfaa6e2@changeid>
Message-ID: <87c217e5fc01c73fe008179274fa373f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-13 20:33, Douglas Anderson wrote:
> Add an entry for SC7180 SoC.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index e19102f46302..e56eea29615c 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -223,6 +223,7 @@ static const struct soc_id soc_id[] = {
>  	{ 321, "SDM845" },
>  	{ 341, "SDA845" },
>  	{ 356, "SM8250" },
> +	{ 425, "SC7180" },
>  };
> 
>  static const char *socinfo_machine(struct device *dev, unsigned int 
> id)

 From the chipinfo document that I have at hand, this is correct soc id 
for SC7180, so

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>


Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
