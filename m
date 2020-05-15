Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F171D4BBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 12:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgEOK4L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 06:56:11 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:59782 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726000AbgEOK4L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 06:56:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589540170; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=pVlXqk0xHFLVzrs5HUJtO3mE2JlonL9O1pnYqUk/Gac=;
 b=ufzmM7VM1tx6EraU3O5fVnADL3tTG6u9/Et3gtv8/bVaj7DX2wRu+bFIfpJgotcLkDuE8Mcx
 FHf2udZAqQuLz002l7nj2QejglAGoDyQlHsEWjqpQyVxA9SWe2aSLaIHcxVDkHwgJCZaaB1S
 bPFNYJL0GjsU6p9BUqh7fZXr9XU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebe7547.7f277fa72d50-smtp-out-n01;
 Fri, 15 May 2020 10:56:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2DAAC432C2; Fri, 15 May 2020 10:56:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E62DC433D2;
        Fri, 15 May 2020 10:55:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 May 2020 16:25:59 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Support ETMv4 power
 management
In-Reply-To: <b0a2ac4ffefe7d3e216a83ab56867620f120ff08.1589539293.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1589539293.git.saiprakash.ranjan@codeaurora.org>
 <b0a2ac4ffefe7d3e216a83ab56867620f120ff08.1589539293.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <56a5563205da61c47eb4f8bbf6120e28@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2020-05-15 16:21, Sai Prakash Ranjan wrote:
> Now that deep idle states are properly supported on SC7180,
> we need to add "coresight-loses-context-with-cpu" property
> to avoid failure of trace session because of losing context
> on entering deep idle states.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
> 
> Resending this because the last patch sent here -
> https://lore.kernel.org/patchwork/patch/1230367/
> seems to have added "coresight-loses-context-with-cpu" to
> replicator node instead of etm7 node.
> 
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 4069bb1c93af..8b3707347547 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1656,6 +1656,7 @@
> 
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			arm,coresight-loses-context-with-cpu;
> 
>  			out-ports {
>  				port {
> @@ -1674,6 +1675,7 @@
> 
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			arm,coresight-loses-context-with-cpu;
> 
>  			out-ports {
>  				port {
> @@ -1692,6 +1694,7 @@
> 
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			arm,coresight-loses-context-with-cpu;
> 
>  			out-ports {
>  				port {
> @@ -1710,6 +1713,7 @@
> 
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			arm,coresight-loses-context-with-cpu;
> 
>  			out-ports {
>  				port {
> @@ -1728,6 +1732,7 @@
> 
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			arm,coresight-loses-context-with-cpu;
> 
>  			out-ports {
>  				port {
> @@ -1746,6 +1751,7 @@
> 
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			arm,coresight-loses-context-with-cpu;
> 
>  			out-ports {
>  				port {
> @@ -1764,6 +1770,7 @@
> 
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			arm,coresight-loses-context-with-cpu;
> 
>  			out-ports {
>  				port {
> @@ -1782,6 +1789,7 @@
> 
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			arm,coresight-loses-context-with-cpu;
> 
>  			out-ports {
>  				port {


The previous version of this patch in QCOM tree seems to have added the
property to replicator node instead of etm7 node, can you please drop
that from the tree and apply this one?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
