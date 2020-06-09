Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775D71F3D5E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 15:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbgFINyo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 09:54:44 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57652 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730174AbgFINym (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 09:54:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591710882; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MI3qK4wgmDjHmo1cYjSV72uJg5VksJKTM0Lx81cwbYE=;
 b=NGqELEmjwyCWkpW6RP1vqyJoGnh7kYTiwMlgqXrtZrt1kZKL821XBItGGhKAEOUTJJTgeYRw
 7sLxh1SvVW2ZhyxypD6U/VME/kIMBSKlHVf5/2Ado5QA1o0zqiMYy9bRYYPeUcduph637gVn
 fMTjz4gxbvwpbjVg0F45dFFfKcw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5edf949bf3deea03f309cf52 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 13:54:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A88EBC433CA; Tue,  9 Jun 2020 13:54:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 326BFC433C6;
        Tue,  9 Jun 2020 13:54:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Jun 2020 19:24:34 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7180: Add support to skip
 powering up of ETM
In-Reply-To: <7599d58142dcefbcb08a2eaff71c7f411a1d52b1.1589539293.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1589539293.git.saiprakash.ranjan@codeaurora.org>
 <7599d58142dcefbcb08a2eaff71c7f411a1d52b1.1589539293.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <70271f66ad792f7ab16a907ddf73e0f3@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2020-05-15 16:21, Sai Prakash Ranjan wrote:
> Add "qcom,skip-power-up" property to skip powering up ETM
> on SC7180 SoC to workaround a hardware errata where CPU
> watchdog counter is stopped when ETM power up bit is set
> (i.e., when TRCPDCR.PU = 1).
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
> 
> Depends on ETM driver change here -
> https://lore.kernel.org/patchwork/cover/1242100/
> 
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 8b3707347547..de4bae4ec224 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1657,6 +1657,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> 
>  			out-ports {
>  				port {
> @@ -1676,6 +1677,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> 
>  			out-ports {
>  				port {
> @@ -1695,6 +1697,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> 
>  			out-ports {
>  				port {
> @@ -1714,6 +1717,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> 
>  			out-ports {
>  				port {
> @@ -1733,6 +1737,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> 
>  			out-ports {
>  				port {
> @@ -1752,6 +1757,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> 
>  			out-ports {
>  				port {
> @@ -1771,6 +1777,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> 
>  			out-ports {
>  				port {
> @@ -1790,6 +1797,7 @@
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
>  			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> 
>  			out-ports {
>  				port {

I have sent this patch as a part of other coresight changes
to keep all coresight DT changes together[1], we can drop this
patch now.

[1] - https://lore.kernel.org/patchwork/cover/1253969/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
