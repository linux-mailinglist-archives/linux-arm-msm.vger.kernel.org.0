Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7866571957
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbiGLMAx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232683AbiGLMAo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:00:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 09A9A13F1E
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657627242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1B9l4M3Gb8g0QNGeJrexMqY064soYs4k3ADQaItAgs0=;
        b=RkZx/dKOo879vNVmQU2aTXYbWcrtzhhh5+z09d1fgECSBQNLkUQXixxSX7AwpR4O3Zg8hU
        cMI83snS1FLPRw+GPcr91wDvnbcXdQJO7b4YjfohsEzJ1hgt7Ci50qgQY8zRqQRqd+mrba
        BZHQ+Q1xf/0fMGqMPx6TUhzn5gW5tNA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-vKFjyiklOWGvQZy8sN1N6Q-1; Tue, 12 Jul 2022 08:00:31 -0400
X-MC-Unique: vKFjyiklOWGvQZy8sN1N6Q-1
Received: by mail-qt1-f200.google.com with SMTP id o22-20020ac87c56000000b0031d4ab81b21so6710672qtv.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1B9l4M3Gb8g0QNGeJrexMqY064soYs4k3ADQaItAgs0=;
        b=ITlHnbTN/x+myBh17GdI2NTZCfTqDaKs/LLbQOsL2CCDUMBPYHNS41Mst39p7ytwo6
         a/RZ6NOO5B6E/Kw/d90efHxnREW6uvjGLZV2il0l/uu2qZ+vvCz3wZf1S1DLH9bix5Nc
         Mz0Uf+p6WWrSNdYvIJuGmLtu7NwMv7H96jjYSQczOyGsCUCsXjzkHthAE+8P+PUoob/y
         Fo8Po/PJPgmKA6jXXQgYQIaVL71YG+81NUxNsRycAjmdMW4RK+l/fa3S43oGFCuOM58K
         sAdCQUU+68FseYS5rd/8+d2wWGFe9vjXbNmHJ6Geo4nNVdA9MqdgpsWutrbPOvsw/a+s
         7meg==
X-Gm-Message-State: AJIora8y+ej7NzZA4SX+txbxRgoYGeg4a/9s6M6Eop0u55208H2+ExGq
        jBAd7ceqzjfUtI/Veb6W/3uf2XyPaTV8zWSdabt+Ky+SpamV9nXUKFnXxv3E2riGlXEsy2FwSvE
        ChkNp32aBpbaCGwnjVzYndBHnMA==
X-Received: by 2002:ac8:5d49:0:b0:31e:9b4d:acd6 with SMTP id g9-20020ac85d49000000b0031e9b4dacd6mr17946668qtx.392.1657627230963;
        Tue, 12 Jul 2022 05:00:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ufZkHm0eB3LiJmF+ruZs6h0Iv/0sF31KPBH/tbHoHz+4MW9ZWzdjBDkAwmQD4coKLb9II3kA==
X-Received: by 2002:ac8:5d49:0:b0:31e:9b4d:acd6 with SMTP id g9-20020ac85d49000000b0031e9b4dacd6mr17946629qtx.392.1657627230688;
        Tue, 12 Jul 2022 05:00:30 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id w13-20020a05620a424d00b006af0ce13499sm8940957qko.115.2022.07.12.05.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:00:30 -0700 (PDT)
Date:   Tue, 12 Jul 2022 07:00:28 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add missing apps_smmu irq
Message-ID: <20220712120028.wip7praakrj4f5gg@halaneylaptop>
References: <20220712080156.1364-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712080156.1364-1-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 12, 2022 at 01:31:56PM +0530, Parikshit Pareek wrote:
> Add missing irq number 696, and correct the interrupt-mapping of context banks.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 7945cbb57bb4..1197d60c2827 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1591,6 +1591,7 @@
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

Looks good to me, thanks!

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

