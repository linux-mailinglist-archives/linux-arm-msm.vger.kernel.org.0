Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5582B571956
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbiGLMA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233030AbiGLMAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:00:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 78243D83
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657627193;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=S0ks06uXq7bZX9DkLO/5No9MyxDD3CMEruJLReGVPCE=;
        b=c62o/bJKnanYByPyuYYu63XZn9NRNGnKCJLhwrp0dtT6HTKrpagzXMnnlGoSaQ4ElBC5A0
        fM9Up9yo/Nf5ALAWu79yKDqm8mnu50Lke6IjUVBR+tlOQFZN6TQ6drwdhD+fZ8U7Xk05mW
        HfIroyfNTbI3oGx3RkFq0V5E6d+cyck=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-XivLjZS_Pf2WT5sxOztXcQ-1; Tue, 12 Jul 2022 07:59:52 -0400
X-MC-Unique: XivLjZS_Pf2WT5sxOztXcQ-1
Received: by mail-qv1-f71.google.com with SMTP id d18-20020a0cfe92000000b0047342562073so1653234qvs.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 04:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S0ks06uXq7bZX9DkLO/5No9MyxDD3CMEruJLReGVPCE=;
        b=c91jvFSbW1690Erde+jCJntkC9b877c6sXgiyZ4LpXrcbVVLo5bAOxO2AEPfcfa8V3
         gNAKQtPCPeRi3HoQN6DvvNPFwOS/7N72fd0l0h5jHCCaleQQGz/ZuYLddIym25OhGE7M
         PqzBAOgr0yHJu+k1iz3E1a+ePSznZ/QKTJvAgU7ApvOp+8lTy7QK90jXQDDDq9jTyYnJ
         Z6qpdEz2LTfVb/iZDQ1UvwzeqZ0ldPwexi3MR+NsuuOusOUcdKdu+ArnoGkHOIanJOFc
         XQajW5e1nQ+QG9JUBA1KQh/kWRi4Xe4no7jOokq6JhQu0RHrI/U2LHB4dqSdSoRtQACr
         RP9Q==
X-Gm-Message-State: AJIora9HocZfLSNCSwy9xYSwe4IJHWEo2u/tY4n/UVVFKqXIHRao2Mkr
        A1+v+IvVODMdO1Y4XVr9v5/nAgb0/vo2fX8RVSl7ULBC0EL7/TwS1gy1MsOhPxVjKCgx9T12dO6
        1BFWiyD4YqiPB10KddauZAaWq7A==
X-Received: by 2002:ac8:5954:0:b0:31e:b88d:a837 with SMTP id 20-20020ac85954000000b0031eb88da837mr5452867qtz.483.1657627191928;
        Tue, 12 Jul 2022 04:59:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s0D/tQv3zqh31C40FkSsPbSxWuJfxTbACOl24XdOUS2soKn08ACYUh42GAz2eaH7PKH8Qc1A==
X-Received: by 2002:ac8:5954:0:b0:31e:b88d:a837 with SMTP id 20-20020ac85954000000b0031eb88da837mr5452849qtz.483.1657627191658;
        Tue, 12 Jul 2022 04:59:51 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id x8-20020a05620a258800b006a793bde241sm8786977qko.63.2022.07.12.04.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 04:59:51 -0700 (PDT)
Date:   Tue, 12 Jul 2022 06:59:49 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: remove duplicate apps_smmu
 irq
Message-ID: <20220712115949.apmewodpys5rx6tf@halaneylaptop>
References: <20220712075859.875-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712075859.875-1-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 12, 2022 at 01:28:59PM +0530, Parikshit Pareek wrote:
> Remove the duplicate irq number 424, from apps_smmu node. This is needed
> to correct the interrupt mapping for context banks.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 7945cbb57bb4..9583cc53aa03 100644
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
> -- 
> 2.17.1
> 

Looks good to me, thanks!

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

