Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35DBF38DED4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 03:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbhEXBRj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 May 2021 21:17:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46280 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232120AbhEXBRi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 May 2021 21:17:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621818971; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Jy34EtJAVoCMCPxGf5DCNJ6akcTQGePHMmxcOPshkGQ=;
 b=ObqCJG3dcgN+jqhV9ODDDLRiPeDhiszsQ78psmVbNTq+vCsOkLJ7fS+f4wbnL5WdcpowAowZ
 Bku+c/pKaMtNHJ4UvzBJFQ11ezvEAewcaYLkBCKGgzeR47eKiEm0bhk4nvOb5GpgnHkgoe5m
 1lBuOSlAjhfdB8b+Db9iToqpvbM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60aafe442bff04e53b4a837c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 01:15:48
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 320C7C43217; Mon, 24 May 2021 01:15:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7B642C433F1;
        Mon, 24 May 2021 01:15:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 24 May 2021 06:45:47 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Move rmtfs memory region
In-Reply-To: <20210514113430.1.Ic2d032cd80424af229bb95e2c67dd4de1a70cb0c@changeid>
References: <20210514113430.1.Ic2d032cd80424af229bb95e2c67dd4de1a70cb0c@changeid>
Message-ID: <b2c386fd5881c452e0a18438c3f98787@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Sujit,

Thanks for the patch!

On 2021-05-15 00:04, Sujit Kautkar wrote:
> Move rmtfs memory region so that it does not overlap with system
> RAM (kernel data) when KAsan is enabled. This puts rmtfs right
> after mba_mem which is not supposed to increase beyond 0x94600000
> 

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
> ---
> 
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index e77a7926034a7..afe0f9c258164 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -45,7 +45,7 @@ chosen {
> 
>  /* Increase the size from 2MB to 8MB */
>  &rmtfs_mem {
> -	reg = <0x0 0x84400000 0x0 0x800000>;
> +	reg = <0x0 0x94600000 0x0 0x800000>;
>  };
> 
>  / {

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
