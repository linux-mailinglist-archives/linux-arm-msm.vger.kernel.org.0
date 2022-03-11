Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBED04D5A20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Mar 2022 05:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238164AbiCKE5D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Mar 2022 23:57:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236467AbiCKE5C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Mar 2022 23:57:02 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1C1EF7B3;
        Thu, 10 Mar 2022 20:56:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 659D8B82A4E;
        Fri, 11 Mar 2022 04:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA7EC340EC;
        Fri, 11 Mar 2022 04:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646974558;
        bh=lAGnjdaVIpu+qVHYqg+esd+iu/gEs7nkw3886AUCd7E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JMTanZJGUVYjqqgYgCUwnIoKc/WS3OsaRgQYP/avXI7+SeMpqr0UzDap0B7/+sXTI
         d2dauTzf1OT8kcOgLmv2CT/OsMcoRa83ryouqrEDJo/A2pQYRpuy2NC+WelCPqagKy
         t3QO1z4wV4F5TNXV4fiA5OBZPusDvMZsjnVsbT6xYIdA0bRAq0FCvoIYntplJP6XUv
         KImxGUHIPiXv9sk4XQMX78S1N8Ikrao6VIxE0AVkKgBiTuCwfzacklDy4Fy2CeJlDh
         vKQDO+NxAS0tYX0l8ve1ApYaHBbM3mslMaoWo8kU6+WsXpmFDJW51BYbwu73mN6qG/
         T8OigDvtvyVVQ==
Date:   Fri, 11 Mar 2022 10:25:54 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: fix interconnects property of
 UFS node
Message-ID: <YirWWmm7twjNlTxU@matsya>
References: <20220310221934.1560729-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310221934.1560729-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-03-22, 00:19, Vladimir Zapolskiy wrote:
> All interconnect device tree nodes on sm8450 are 2-cells, however in
> UFS node they are handled as 1-cells, fix it.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Fixes: aa2d0bf04a3c ("arm64: dts: qcom: sm8450: add interconnect nodes")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 0cd5af8c03bd..bbd38b55e976 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -1376,8 +1376,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  
>  			iommus = <&apps_smmu 0xe0 0x0>;
>  
> -			interconnects = <&aggre1_noc MASTER_UFS_MEM &mc_virt SLAVE_EBI1>,
> -					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_UFS_MEM_CFG>;
> +			interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_UFS_MEM_CFG 0>;
>  			interconnect-names = "ufs-ddr", "cpu-ufs";
>  			clock-names =
>  				"core_clk",
> -- 
> 2.33.0

-- 
~Vinod
