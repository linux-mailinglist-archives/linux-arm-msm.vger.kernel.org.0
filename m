Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC7E561877
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 12:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbiF3Klf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 06:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234603AbiF3KlQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 06:41:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F6450922;
        Thu, 30 Jun 2022 03:39:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3C40662280;
        Thu, 30 Jun 2022 10:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C92C34115;
        Thu, 30 Jun 2022 10:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656585564;
        bh=7Q9cvikuO49dgWdiIZAhLwZIy1QdEh+fWQtMFXsAoAM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=twzR2zkP+nXrYF87sOSEL9G8bRPEmnToEKV0/dGoIzlQ+O88Gp+v73MnAftlPUwDE
         6Y6jwxQ7iymAFQ2SNTg36V6ekQIrgRD+wsvfLlzi4idnC+4IukxDA+l0EFXCnnW8Tr
         JwpIkZvq2TevhGSvXMblkpOBVad4yLNwKf0+9nwqrzS20CicKAhk3RNFJ9OB1QnCzr
         4PF7R5O5wTdPEGmvcqBkTo5DAYis755AYpIdvB7wOfPt+VlIvYgQ/7v5DE6v75jMc7
         Y7xNos55XQM6HVBuw+9E4K1jzcDYrZMfrcyN92zac+ql1QLl/ioBJ6aXVYodxv3muk
         Ygh7A52bjq3bg==
Date:   Thu, 30 Jun 2022 16:09:20 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 2/7] arm64: dts: qcom: sm8450: Add description of
 camera clock controller
Message-ID: <Yr19WKNoYx5neImj@matsya>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
 <20220630081742.2554006-3-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630081742.2554006-3-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-06-22, 11:17, Vladimir Zapolskiy wrote:
> The change adds description of QCOm SM8450 camera clock controller.

s/QCOm/Qualcomm or Qcom, would prefer former

> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v8 to v9:
> * removed a clock-names property,
> * placed a status property as the last one in the list of properties
> 
> Changes from v7 to v8:
> * rebased on top of v5.19-rc2,
> * minor improvement to the commit message.
> 
> Changes from v6 to v7:
> * rebased on top of v5.19-rc1.
> 
> Changes from v5 to v6:
> * rebased on top of linux-next.
> 
> Changes from v3 to v5:
> * none.
> 
> Changes from v2 to v3:
> * account a renamed header file.
> 
> Changes from v1 to v2:
> * disabled camcc device tree node by default.
> 
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index b06c7d748232..de83df1c73c5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-sm8450.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8450-camcc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> @@ -2301,6 +2302,21 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  			};
>  		};
>  
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,sm8450-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd SM8450_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +			status = "disabled";
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sm8450-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> -- 
> 2.33.0

-- 
~Vinod
