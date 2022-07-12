Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 414EE571CF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 16:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbiGLOku (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 10:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbiGLOkt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 10:40:49 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2DEBA38F
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 07:40:49 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id f11so6875743pgj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 07:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bgXmLUfMZm+FHfqXm9CRoi+Eod2lOK0rLKn3ZzuVh74=;
        b=P5Ph292NkfrhA0X/Eh4CsE9SXG9i3orTafX0WiI9t6Dp60/9+Er1SbB6dastsyfXZE
         g3KGnrblsyHNKl7tv9v1sFLunSuk6tBtdEKETxNnFRMayrfw+/SpGcU6nQr/8BXu1qgA
         +M8qnsoQF7RSXISkY2tBOoxJVMtvskgaXeDEA8FT045HNMp8MeBHdcN0fOf1wykPhGO5
         AXArbKcmoyNatteZX3MkixHmJvFEkJA+eLiyQAPNjS1RisyTjxT/94IqQbhM02INMFd2
         qBlnAKeaQ/Zp5cwYn6tsBxFfO8RcPm4hpLV5ftnT6rGe/RGOUWRTA79Ob+Oykyfg266w
         CcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bgXmLUfMZm+FHfqXm9CRoi+Eod2lOK0rLKn3ZzuVh74=;
        b=rkaD2yhoXqdHvnot0CmWkVBUQuM03jtjJ7Pr+l+bibd6IioetEMHFfu0CFIAvOKBUP
         yo4uQncdglx5/o6k4716oGIZM+nHQHE0HxCznUkoBoyICRLX2znUR0oYSpM4eUb/qjdY
         l7wQLcxkUydIWhEFpZgcip2vVKiYsqf8o9ujun6VIBguIS3tXDBhO5EqyoMCTYloDr3a
         JLDOE4d8pm1rlff2OPgFBiuEEuA3wtMZYiP0IzbSBd6Cg7bpbq7ClLCv/52BV/21F5zo
         HyHl1pSVqjyV83BsN7jzpX/YPViMHjgtEIROn0hg1mUvMjECsQxulUWcugh0BFeOcNng
         g2pg==
X-Gm-Message-State: AJIora/r5Qxe7Eu+/bDN7zVJ+Gq2xPCYDwKewVTCG7Qk8XQJYYCCjaGV
        3pd8Gd6JEkRakp1ekdJsQMNzJBjfjYvd
X-Google-Smtp-Source: AGRyM1tG2DyV0SGxy6wZHh9xCj+9YCCX20xfjtEWNNwdNXqfCMdK5z7dukWIR8ydy2pHog4Gypj9wQ==
X-Received: by 2002:a63:1952:0:b0:411:90a3:5853 with SMTP id 18-20020a631952000000b0041190a35853mr21301431pgz.474.1657636848549;
        Tue, 12 Jul 2022 07:40:48 -0700 (PDT)
Received: from workstation ([117.207.31.14])
        by smtp.gmail.com with ESMTPSA id 80-20020a630353000000b0040dd052ab11sm6226706pgd.58.2022.07.12.07.40.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 07:40:47 -0700 (PDT)
Date:   Tue, 12 Jul 2022 20:10:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: fix apps_smmu irq
Message-ID: <20220712144044.GD21746@workstation>
References: <20220712140009.20765-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712140009.20765-1-quic_ppareek@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 12, 2022 at 07:30:09PM +0530, Parikshit Pareek wrote:
> Wrong values have been introduced for interrupts property. Fix those
> ones, and correct the mapping of context banks to irq number.
> 

And you ignored my comment about sorting the IRQs...

Thanks,
Mani

> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 7945cbb57bb4..1276a833251e 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1580,7 +1580,6 @@
>  				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> @@ -1591,6 +1590,7 @@
>  				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
> -- 
> 2.17.1
> 
