Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686051CE46D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 21:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731411AbgEKT2T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 15:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731416AbgEKT2T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 15:28:19 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984FEC05BD0A
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 12:28:17 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k19so4336567pll.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 12:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SWP2X2+azRyixrjWTJYqW45Td6DT0R10Lg/kNNX7rQU=;
        b=sfGBcaJAVbA0yCwLUwwt/T6iRz+IEXOpy/ZZTCYfyGa/rx+1MFRKy2zZciZtQoD/7c
         YXyl6J2vMthSGMl2uhBetDDrggS6aUMUHzUUEyp9taZhklrs6E+AHINYyUj1I9eiF65n
         DI0cXimOZva3DrLFtGLOUID6tScG//Z5XvaIs9psFN93f5DNY9f4/ArxBd9LwyWlEOiV
         Lr6NoGMwiCDjyd1pjRxvmAw754CG7BnYtfvJiK5X3zEpdZ8NsKXiNCTkWPiE2hceRdRi
         yLT0vKxsBbH15fMwluRfuKTXq79QYWUixK1N+KNGEIeqD7SQzqc+C6dMzhwkw9EpGafQ
         QCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SWP2X2+azRyixrjWTJYqW45Td6DT0R10Lg/kNNX7rQU=;
        b=IU0A2Wh/Ee2FWKcan/VDw2IaixTTvhNhBsDktsrO0R1ZxT2wagFacGs+ZMxdPOtELP
         cTH92f4UYlcU7NVuvLDZFGhYddaELzE9+N15CD329Jz9P4cLSHE0UJMXHgg/F/MY8BBZ
         PTCY5Wlzhnm/K0/WEnYY0xhTqINPxsBNrAGEKo4VaLnB5RnTkHfXyhqHke/TpZqxKmCC
         RXqzVG5c7ARO2Wjmy+9POLC8C/XPf2FUZm/VMsqOFm2w5BOjiTL5CUPyM8RauSZq032E
         dS/S1OgIbSdbJkVNgq0La2VcTcb7p7PttR2z7Ac2a0mAI2p5WkwM3/7rH6QlsBtUwQAF
         m7UQ==
X-Gm-Message-State: AGi0PubxTi7CcnHTJKMFl8M7WdOfWgfL6sqdAVACZpiwmQl3J7O8PvNm
        5DsABsA1pkoCR4d8it7oaBp5Ww==
X-Google-Smtp-Source: APiQypIr4WjwzqF01mqiFbRCkzXFDcsV8vJ6bRcKT9P0+wyECmYt6TgczN9wRKV2kYBT/QbSNs6vZg==
X-Received: by 2002:a17:90b:3588:: with SMTP id mm8mr22957368pjb.202.1589225296927;
        Mon, 11 May 2020 12:28:16 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id fu12sm10800758pjb.20.2020.05.11.12.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 12:28:16 -0700 (PDT)
Date:   Mon, 11 May 2020 12:29:09 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, evgreen@chromium.org,
        ohad@wizery.com, mka@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sc7180: Add Q6V5 MSS node
Message-ID: <20200511192909.GC2166963@builder.lan>
References: <20200421143228.8981-1-sibis@codeaurora.org>
 <20200421143228.8981-7-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421143228.8981-7-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 Apr 07:32 PDT 2020, Sibi Sankar wrote:

> This patch adds Q6V5 MSS PAS remoteproc node for SC7180 SoCs.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 36 ++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 65c14a6d13fef..94cead96eade0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1323,6 +1323,42 @@ pinconf-sd-cd {
>  			};
>  		};
>  
> +		remoteproc_mpss: remoteproc@4080000 {
> +			compatible = "qcom,sc7180-mpss-pas";
> +			reg = <0 0x04080000 0 0x4040>;
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
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
> +					<&rpmhpd SC7180_CX>,
> +					<&rpmhpd SC7180_MSS>;
> +			power-domain-names = "load_state", "cx", "mss";
> +
> +			memory-region = <&mpss_mem>;
> +
> +			qcom,smem-states = <&modem_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
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
>  		sdhc_2: sdhci@8804000 {
>  			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0 0x08804000 0 0x1000>;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
