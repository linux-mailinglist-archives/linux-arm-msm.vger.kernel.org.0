Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580AA1DC5B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 05:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgEUDhz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 23:37:55 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:61904 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727974AbgEUDhy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 23:37:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590032273; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=N88dxo6w+m1Iy0ZY+M850rvrFBSGl0dC9YXAozfAgWY=;
 b=hZhE3MdZtZUjhc3yrCO8o4fyO/q6R2EkBSLFkk82osTqEaX7E/2Uy8akEpxwgxW1CQi6+FXp
 KerOOTY4epcBbSRBNs2ptF+09aKbTd19m/Ax80H9QwE+4Q2/tIFm9EnFpIzV9CndOMkRglGc
 c+YuCGP5nX99+3EH0g7OzmGv08Y=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ec5f786c60c306cc8dd105e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 May 2020 03:37:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 363CFC433CA; Thu, 21 May 2020 03:37:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B802C433C8;
        Thu, 21 May 2020 03:37:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 May 2020 09:07:41 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Move mss node to the right
 place
In-Reply-To: <20200521010337.229177-1-swboyd@chromium.org>
References: <20200521010337.229177-1-swboyd@chromium.org>
Message-ID: <1e88d48ead56a1c75c3355f389fdb6dd@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-21 06:33, Stephen Boyd wrote:
> The modem node has an address of 4080000 and thus should come after 
> tlmm
> and before gpu. Move the node to the right place to maintainer proper
> address sort order.
> 
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Sibi Sankar <sibis@codeaurora.org>
> Fixes: e14a15eba89a ("arm64: dts: qcom: sc7180: Add Q6V5 MSS node")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++--------------
>  1 file changed, 51 insertions(+), 51 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 6b12c60c37fb..1027ef70f8db 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1459,6 +1459,57 @@ pinconf-sd-cd {
>  			};
>  		};
> 
> +		remoteproc_mpss: remoteproc@4080000 {
> +			compatible = "qcom,sc7180-mpss-pas";
> +			reg = <0 0x04080000 0 0x4040>, <0 0x04180000 0 0x48>;
> +			reg-names = "qdsp6", "rmb";
> +
> +			interrupts-extended = <&intc GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready", "handover",
> +					  "stop-ack", "shutdown-ack";
> +
> +			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> +				 <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
> +				 <&gcc GCC_MSS_NAV_AXI_CLK>,
> +				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
> +				 <&gcc GCC_MSS_MFAB_AXIS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface", "bus", "nav", "snoc_axi",
> +				      "mnoc_axi", "xo";
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
> +					<&rpmhpd SC7180_CX>,
> +					<&rpmhpd SC7180_MX>,
> +					<&rpmhpd SC7180_MSS>;
> +			power-domain-names = "load_state", "cx", "mx", "mss";
> +
> +			memory-region = <&mpss_mem>;
> +
> +			qcom,smem-states = <&modem_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
> +				 <&pdc_reset PDC_MODEM_SYNC_RESET>;
> +			reset-names = "mss_restart", "pdc_reset";
> +
> +			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
> +			qcom,spare-regs = <&tcsr_regs 0xb3e4>;
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
> +				label = "modem";
> +				qcom,remote-pid = <1>;
> +				mboxes = <&apss_shared 12>;
> +			};
> +		};
> +
>  		gpu: gpu@5000000 {
>  			compatible = "qcom,adreno-618.0", "qcom,adreno";
>  			#stream-id-cells = <16>;
> @@ -2054,57 +2105,6 @@ apss_merge_funnel_in: endpoint {
>  			};
>  		};
> 
> -		remoteproc_mpss: remoteproc@4080000 {
> -			compatible = "qcom,sc7180-mpss-pas";
> -			reg = <0 0x04080000 0 0x4040>, <0 0x04180000 0 0x48>;
> -			reg-names = "qdsp6", "rmb";
> -
> -			interrupts-extended = <&intc GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
> -					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> -					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> -					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> -					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> -					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> -			interrupt-names = "wdog", "fatal", "ready", "handover",
> -					  "stop-ack", "shutdown-ack";
> -
> -			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> -				 <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
> -				 <&gcc GCC_MSS_NAV_AXI_CLK>,
> -				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
> -				 <&gcc GCC_MSS_MFAB_AXIS_CLK>,
> -				 <&rpmhcc RPMH_CXO_CLK>;
> -			clock-names = "iface", "bus", "nav", "snoc_axi",
> -				      "mnoc_axi", "xo";
> -
> -			power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
> -					<&rpmhpd SC7180_CX>,
> -					<&rpmhpd SC7180_MX>,
> -					<&rpmhpd SC7180_MSS>;
> -			power-domain-names = "load_state", "cx", "mx", "mss";
> -
> -			memory-region = <&mpss_mem>;
> -
> -			qcom,smem-states = <&modem_smp2p_out 0>;
> -			qcom,smem-state-names = "stop";
> -
> -			resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
> -				 <&pdc_reset PDC_MODEM_SYNC_RESET>;
> -			reset-names = "mss_restart", "pdc_reset";
> -
> -			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
> -			qcom,spare-regs = <&tcsr_regs 0xb3e4>;
> -
> -			status = "disabled";
> -
> -			glink-edge {
> -				interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
> -				label = "modem";
> -				qcom,remote-pid = <1>;
> -				mboxes = <&apss_shared 12>;
> -			};
> -		};
> -
>  		sdhc_2: sdhci@8804000 {
>  			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0 0x08804000 0 0x1000>;
> 
> base-commit: d82fade846aa8bb34956120e3792f494058ec35e

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
