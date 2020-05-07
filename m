Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C73C1C98A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 20:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgEGSD6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 14:03:58 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:31447 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727904AbgEGSD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 14:03:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588874637; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jxc6IOMXReaSlkhn51fI24AkRcV8/V9PR5zPvCqwQdw=;
 b=lQ7LrqFYpf9Q2a8Idi+pzbHVvC75eapdjXw8ePY+N0saSD+cIgeAdGatnYVns3zXkQld8yQ/
 hiQhN2cgycwbgLpQ8Q2L+fMLTv+dummWIN+4afYpgJEKP39VaEWgCX+zz2M1hx02Zch4mfsR
 OFJbEjdQaFdQmhvpVnkZdkd65XE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb44d8c.7f2e20e74768-smtp-out-n05;
 Thu, 07 May 2020 18:03:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 30AADC43637; Thu,  7 May 2020 18:03:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FFB5C433D2;
        Thu,  7 May 2020 18:03:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 07 May 2020 11:03:55 -0700
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: defconfig: Remove QCOM_GLINK_SSR
In-Reply-To: <20200423003736.2027371-5-bjorn.andersson@linaro.org>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
 <20200423003736.2027371-5-bjorn.andersson@linaro.org>
Message-ID: <a783c4f600ea40b9242ccd383f464bb2@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-22 17:37, Bjorn Andersson wrote:
> Remove the QCOM_GLINK_SSR option from the arm64 defconfig, as the 
> module
> is assimilated by QCOM_GLINK - which is selected by other means.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Acked-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>

>  arch/arm64/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/defconfig 
> b/arch/arm64/configs/defconfig
> index f9eefb5940ca..f26a0b6ea0e8 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -838,7 +838,6 @@ CONFIG_FSL_MC_DPIO=y
>  CONFIG_IMX_SCU_SOC=y
>  CONFIG_QCOM_AOSS_QMP=y
>  CONFIG_QCOM_GENI_SE=y
> -CONFIG_QCOM_GLINK_SSR=m
>  CONFIG_QCOM_RMTFS_MEM=m
>  CONFIG_QCOM_RPMH=y
>  CONFIG_QCOM_RPMHPD=y
