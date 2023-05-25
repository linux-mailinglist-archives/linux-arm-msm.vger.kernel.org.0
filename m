Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C86D71040F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 06:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjEYEY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 00:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEYEYz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 00:24:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D741983
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 21:24:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6B9C364210
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 04:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33335C433D2;
        Thu, 25 May 2023 04:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684988693;
        bh=ZgjcMJXAbgiuGT+4vMseetzh9whOQI/HEIX0xXyVvc0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZlaleiS+drJo8DHyVWJf63X+i+vV2P4r7q7LiQAYCi3pVLJznDrsKeteqqcP4zj4s
         Lbxaam+RWYpJBSBcJzTnlPIxMMs7E9frcNHySHBz3YjnKfU4Of7VrQjhYzIV2qa+A5
         2PmFS9SlWU3k8MS6wz/lkKa4uGu7WpWtfOjMX8dqpCs/IKgJwDWwCpE5rXqV7osOyd
         hZHc0jCq3EyAdbYcsG5lsh624hkbj0nATbSnwJELO6aiK3O8eNdZYyYQqNc3nFMeO3
         nM0II3Lfm6kUyltxiPD2izl3gHm8h+diDmFOUUVWGOWbrPlXmuQtPh0zh0vY9puzuI
         FsWlOAy3LGXhA==
Date:   Wed, 24 May 2023 21:28:44 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: defconfig: Build interconnect driver for
 QCM2290
Message-ID: <20230525042844.pk5i57v5wyut7yte@ripper>
References: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
 <20230523165411.1136102-4-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523165411.1136102-4-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 23, 2023 at 07:54:09PM +0300, Vladimir Zapolskiy wrote:
> Build Qualcomm QCM2290 interconnect driver.

In line with the questions that followed, and previous requests. Please
document why this should be =y.

Regards,
Bjorn

> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e2f6a352a0ad..ec9b828b14e2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1415,6 +1415,7 @@ CONFIG_INTERCONNECT_QCOM=y
>  CONFIG_INTERCONNECT_QCOM_MSM8916=m
>  CONFIG_INTERCONNECT_QCOM_MSM8996=m
>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> +CONFIG_INTERCONNECT_QCOM_QCM2290=y
>  CONFIG_INTERCONNECT_QCOM_QCS404=m
>  CONFIG_INTERCONNECT_QCOM_SA8775P=y
>  CONFIG_INTERCONNECT_QCOM_SC7180=y
> -- 
> 2.33.0
> 
