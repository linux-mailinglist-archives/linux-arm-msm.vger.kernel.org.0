Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1425E3B68CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 21:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236005AbhF1THq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 15:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233161AbhF1THo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 15:07:44 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51514C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 12:05:17 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id h4so16262212pgp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 12:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UuLWWmnvZt1Eact5E5zQvx40z47gJJnUBnaxQPWrxTo=;
        b=AC1Pf6F2FnAnQz0fGMrj75w/nMyYp0qr4+QQ3bn8kV0Y4xcy0kSbGmGHTtvYY2nQUP
         pzisKJXdkx3dVoHgrmy60jo1+oCRrQ1RaahFguj4q/uz7koXr6re8qrx5tC9FWYa0K41
         mVxkrNdC0PcouiMQPDAnBH08fgAkPD870V2QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UuLWWmnvZt1Eact5E5zQvx40z47gJJnUBnaxQPWrxTo=;
        b=FCQbHd1sBWA+mUHSvrIx3i4T3g4NPQ/iopcRi32hXgWsC9FpbCFGceYgZnjWjj8DnI
         LKiLD7rY6oelUOrSdKNPKpZZt73D0U8ui8Ic5YLnzcbZUBAH2IAvnC6g/ULBaQLvqwzF
         UV1M8MXOpCY2DBfpPI+4sqGiP9vVHlHEbb/ayQfL0Sa7J4v8/jbtD4/pI9QgCHf1L30U
         KK0PcNi01SpEubnh2M3FiQ2SOXL73Vne9Lwva023TTl+f4AbCshXcOhgCw9Hs/iWt+wg
         bzWfpK8BVJa0bEG/noWOB62QT2/F6qGK1DzMMiKbh/ZS+YvAzhR8mcsH15ayrIXRk6uB
         3S0w==
X-Gm-Message-State: AOAM533q7AyOteHl/W1pFMTV776YinbqkDlmZr8s1h3/0gaX3wvnrZVN
        1gYizv1gwpW/4qhvFxgNL1PdaQ==
X-Google-Smtp-Source: ABdhPJwL7reP7lAruztnf+bjjxn2ijxUR1B0eGZgtokgGCAeZnkfQcn7emRJZqXYg3AtdmC6WtP+ug==
X-Received: by 2002:a63:1215:: with SMTP id h21mr24262501pgl.173.1624907116892;
        Mon, 28 Jun 2021 12:05:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:df70:d2d8:b384:35cf])
        by smtp.gmail.com with UTF8SMTPSA id i3sm16606319pgc.92.2021.06.28.12.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 12:05:16 -0700 (PDT)
Date:   Mon, 28 Jun 2021 12:05:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sc7280: Update Q6V5 MSS node
Message-ID: <YNodaqE9n9+sQUFq@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-10-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624564058-24095-10-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 01:17:38AM +0530, Sibi Sankar wrote:
> Update MSS node to support MSA based modem boot on SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  7 +++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 19 ++++++++++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 191e8a92d153..d66e3ca42ad5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -343,3 +343,10 @@
>  		bias-pull-up;
>  	};
>  };
> +
> +&remoteproc_mpss {
> +	status = "okay";
> +	compatible = "qcom,sc7280-mss-pil";
> +	iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
> +	memory-region = <&mba_mem &mpss_mem>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 56ea172f641f..6d3687744440 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -586,7 +586,8 @@
>  
>  		remoteproc_mpss: remoteproc@4080000 {
>  			compatible = "qcom,sc7280-mpss-pas";
> -			reg = <0 0x04080000 0 0x10000>;
> +			reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
> +			reg-names = "qdsp6", "rmb";

Binding needs update?

Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml:

  reg:
      maxItems: 1

>  
>  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
>  					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> @@ -597,8 +598,11 @@
>  			interrupt-names = "wdog", "fatal", "ready", "handover",
>  					  "stop-ack", "shutdown-ack";
>  
> -			clocks = <&rpmhcc RPMH_CXO_CLK>;
> -			clock-names = "xo";
> +			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> +				 <&gcc GCC_MSS_OFFLINE_AXI_CLK>,
> +				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface", "offline", "snoc_axi", "xo";

Binding needs update?

Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml:

  clocks:
    items:
      - description: XO clock
  clock-names:
    items:
      - const: xo
