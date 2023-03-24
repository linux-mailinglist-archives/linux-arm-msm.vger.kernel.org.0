Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E98D6C7940
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 08:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjCXH4Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 03:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbjCXH4X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 03:56:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5655F227B1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 00:56:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E63A66299C
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 07:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4462FC4339B;
        Fri, 24 Mar 2023 07:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679644582;
        bh=tcdb3u+oQALvYdJlagydXkPjVB03z6C85ADaml3ST8I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m5igMPXYXHC2nSRf+F6n16wn7hX5i1U5ozQaEXJH8wuwGu4fF4zjsJuRyqcjiW6o2
         P0p0l8ZRSafBHeGpnGCR/u5+PRXauQRBLCA6R7witG6FqL4O7sKdZqSXpZhzkFrGGp
         zhNht5KvVw0wOBuVS5xYbD6V2Een8dDfMQoJb1WqxMvleDjm0XFCjxUCugDaRW6ENN
         qOj4huijsCOuSfCSE2+WIcA0t6j5OWt1D25XKaNkBgMT8g+FuJ4FG0rbofL0QJx4DL
         iBzb75XUCibMSTYdZ6IQFU1V5Xu6oNYyEL7Tznk2O33gAT4kwN4Cm+IRqcIq1StVgK
         ttykZVs8RdsEw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pfcHd-0003CJ-FZ; Fri, 24 Mar 2023 08:56:21 +0100
Date:   Fri, 24 Mar 2023 08:56:21 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 03/41] dt-bindings: phy: migrate QMP UFS PHY bindings to
 qcom,sc8280xp-qmp-ufs-phy.yaml
Message-ID: <ZB1XpXou0GI5ibNI@hovoldconsulting.com>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
 <20230324022514.1800382-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324022514.1800382-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 24, 2023 at 05:24:36AM +0300, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,msm8996-qmp-ufs-phy.yaml)
> to qcom,sc8280xp-qmp-ufs-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../phy/qcom,msm8996-qmp-ufs-phy.yaml         | 244 ------------------
>  .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |  94 ++++++-
>  2 files changed, 89 insertions(+), 249 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml
 
>  examples:
> @@ -84,5 +150,23 @@ examples:
>          vdda-phy-supply = <&vreg_l6b>;
>          vdda-pll-supply = <&vreg_l3b>;
>  
> +        #phy-cells = <0>;
> +    };
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +    phy@1d87000 {
> +        compatible = "qcom,sm8250-qmp-ufs-phy";
> +        reg = <0x01d87000 0x1c0>;
> +
> +        clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> +        clock-names = "ref", "ref_aux";
> +
> +        resets = <&ufs_mem_hc 0>;
> +        reset-names = "ufsphy";
> +
> +        vdda-phy-supply = <&vreg_l6b>;
> +        vdda-pll-supply = <&vreg_l3b>;
> +
>          #phy-cells = <0>;
>      };

This example also looks unnecessary.

Johan
