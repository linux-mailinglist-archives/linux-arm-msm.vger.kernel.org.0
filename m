Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47C8A68C838
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 22:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjBFVEy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 16:04:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjBFVEx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 16:04:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F6B2122;
        Mon,  6 Feb 2023 13:04:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 803EB60FD7;
        Mon,  6 Feb 2023 21:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0679CC433EF;
        Mon,  6 Feb 2023 21:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675717491;
        bh=NXRTdKyGaWu5Gd/N3pJTWe7dq1iBPYNjSH8sVO6+kLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k8jfGduYoZC1zhjywJHDzazSWyQiTMPt93VDKyB8dk4qsoEfSbL690LJHJ2uV1nrk
         XxdQ8zeEsQ9vKAtrvt3VJkpws8CscuIK5elzU+6kIT6tHnYRaW3xTs5xXNl6HCoTvk
         BWsiw3uiKcVI8LIAFoUFGUaWwHW8mUMycIkP8FAEw0gbbUo5jfNfPseZx0+Rq/BZ0v
         mbIPBuH9dxfdqnrRKZL1iEIscTyvUEx4aKhNKRCdD1S4nOIxZlNElIdrqN6i8OsOzi
         ranE5HiPcaYeo5empK5SkT5QoH4pNJpMWJR2XCu7yvTBVL0InlkqWjYtRAq0hQt7W+
         lGr7Sq8iA9HdA==
Date:   Mon, 6 Feb 2023 13:07:06 -0800
From:   Bjorn Andersson <andersson@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH v8 2/9] MAINTAINERS: Add qcom-qce dt-binding file to
 QUALCOMM CRYPTO DRIVERS section
Message-ID: <20230206210706.pzcfttqqkjvhh74j@ripper>
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
 <20230202135036.2635376-3-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202135036.2635376-3-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 02, 2023 at 03:50:29PM +0200, Vladimir Zapolskiy wrote:
> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> 
> Add the entry for 'Documentation/devicetree/bindings/crypto/qcom-qce.yaml'
> to the appropriate section for 'QUALCOMM CRYPTO DRIVERS' in
> MAINTAINERS file.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 590bcd047a7f..5530f07d1c31 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17196,6 +17196,7 @@ M:	Thara Gopinath <thara.gopinath@gmail.com>
>  L:	linux-crypto@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>  F:	drivers/crypto/qce/
>  
>  QUALCOMM EMAC GIGABIT ETHERNET DRIVER
> -- 
> 2.33.0
> 
