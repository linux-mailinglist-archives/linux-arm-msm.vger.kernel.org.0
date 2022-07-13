Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D98857393D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 16:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbiGMOwJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 10:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236611AbiGMOwH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 10:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A84283C8DA
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657723925;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ikv0yYnyHu88PsTI9SYSW6P6SO9b6N9X5DEilUKoCmA=;
        b=QD4uR7Xanb+jQqQWZ4h0FyXzkMYYOoH5xeWCq1czXFJXy2iyJbblhG0nSXdGbyimj5Xdp3
        PJTJZRV40LDLL9hhAMKRdalz32KEP1VhJshdA56Iu27IXNiAqqttE5I2/tIvOMeO1Ld2Md
        NBzdwdF45OKpQSvjeounNI8oV8agCl8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-a3mkGAGHOdO_nWWdJOBvUA-1; Wed, 13 Jul 2022 10:51:56 -0400
X-MC-Unique: a3mkGAGHOdO_nWWdJOBvUA-1
Received: by mail-qv1-f71.google.com with SMTP id u15-20020a0ced2f000000b004732a5e7a99so3866188qvq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 07:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ikv0yYnyHu88PsTI9SYSW6P6SO9b6N9X5DEilUKoCmA=;
        b=X1UySWo6CoOj6Zu6rjQgr8t9La6D3gq+w/J6Lhjkf6WfgmXqY8Y8gBMyJGgutCXj2N
         pIcLykKhhAyr7UaQep18I7NKRtnvAOA3fWcqiFkACdFOo2d3EG9kKrzoBh1VyX8nEQKS
         7Chxb5/2QJMX8pKbFHt5iR6w7Fv9n1FnA2AEoVZFLMbxz1MnIz5TupSW9pJlFLsxDacq
         IFyf/fSO7cr8c6Yac2/yYou0k0deZjTrq5vYzXp1vxwlS6YKZfytvhuG1RFyfenFGS15
         3dRCA7SBcB/fw2mPzETLOxNBs3CUMVPl1+x/9iqHpbLgGN8CytzIprIQYqXvu8ucF8L1
         9fnQ==
X-Gm-Message-State: AJIora/7DyojxeEQh1fgxoa104WHYuXUUsEO2VHEoAYB7TgktrQfkK6o
        XFJkLPXWVz9wfSesU2h5KM4YnHk+dBq0OvDQ4mvfwaHM9HC0xN2XQ/a7fHaJ6+sfOHmfC2PL3H8
        bCrTXo/xr8w8hZbDzBMcct2NKJA==
X-Received: by 2002:a37:48c:0:b0:6b5:652e:de46 with SMTP id 134-20020a37048c000000b006b5652ede46mr2644412qke.714.1657723916394;
        Wed, 13 Jul 2022 07:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uTFR8vE33A5iuBwNe9uo1BBClQFZiEvQzoa9rbYphjZn84xJH7w0tkL11pTm1Ylbi4ETILLw==
X-Received: by 2002:a37:48c:0:b0:6b5:652e:de46 with SMTP id 134-20020a37048c000000b006b5652ede46mr2644393qke.714.1657723916059;
        Wed, 13 Jul 2022 07:51:56 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id t16-20020a05622a149000b00304e33f21f7sm10645897qtx.68.2022.07.13.07.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 07:51:55 -0700 (PDT)
Date:   Wed, 13 Jul 2022 09:51:52 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Steve Capper <Steve.Capper@arm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix PMU interrupt
Message-ID: <20220713145152.32igy7dmg7qvm6jk@halaneylaptop>
References: <20220713143429.22624-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713143429.22624-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 13, 2022 at 08:04:29PM +0530, Manivannan Sadhasivam wrote:
> PPI interrupt should be 7 for the PMU.
> 
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Reported-by: Steve Capper <Steve.Capper@arm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 268ab423577a..2d7823cb783c 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -477,7 +477,7 @@ memory@80000000 {
>  
>  	pmu {
>  		compatible = "arm,armv8-pmuv3";
> -		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
>  	psci {
> -- 
> 2.25.1
> 

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

