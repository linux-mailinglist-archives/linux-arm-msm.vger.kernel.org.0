Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67EDB507F22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 04:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352077AbiDTC5A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 22:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353532AbiDTC47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 22:56:59 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE1836B6B
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 19:54:14 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id i11-20020a9d4a8b000000b005cda3b9754aso246834otf.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 19:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IHAzVnuzxuYJX7ZkepRm9BZc+S59p4HkHNttGn59HI4=;
        b=TTpsWITDGO8DJDNJxeNi3uPnZIZsEi7KOyE47yCr6VLUa14Zr/w+V1mBYLvdY7qH2G
         snjCUL9iNcZQE2b/3/u+ez02PRD4EPz54kz1VGYjVwhnOBkFsBF/zkpZxbHLtbEbwZwM
         P3ZbdGOCZdxxj4o9tNatcIwoGBJU39aVkflY+EzWxaKJsdGMd9zz7tZ6bvsNpKqThITd
         k/BBZFlV4cxJpwSIPse0WC2acMv1kXV3kTvj4nSdO89cka6ntSWfVksv1icoDBpY1XYX
         UsILoa0eFvZwKrf6pD4JNoqapYvQ5VHuJRVivcYiBuPRBrukVFLSV6UEt+EB/2vVUkp3
         Tx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IHAzVnuzxuYJX7ZkepRm9BZc+S59p4HkHNttGn59HI4=;
        b=S0z+zliVY9Od6OpkCYPnXO6R2ua+8kbS1Py1FlNWyou4p6SUnsE2p3ArOvH9GC7Xw8
         XES413vpc9n49vgDtdT3MBCZVPyF72V2iRoMro0ypLVmkQZaq94cRIU4GWRh7zOMR7eb
         72DxGswA74JSmX1O+5etLsT706mMPYwqClVvubxz0h8gyszDEN5OWbYIwHywAFI1H1Gn
         AomzOVidwBc0tqLUsTMi4Gag2Bf0dmYDd3hNDRx7cuAzvpaVBUQHA9FA1uEMoTZ4bUnl
         S61F2amopguu5vEsulkBA5jgojPZyH71FtqraGAJEmOo14SNmnrNMp2ENobACawUWHNy
         cz2g==
X-Gm-Message-State: AOAM531k2x1hI6VnDB0+1+pRTpw7A6H1sz/NJUxxjpey0XV9QkAEMtKR
        6bbGGZl96GHR4YYQToK+oBGMDw==
X-Google-Smtp-Source: ABdhPJwLIrIaD2Ik9Pers9+71R5BMbjnqv2e7ktsi8J2VHGUQ2C8DVItqcC/6zEs/lSLqwJxF7ub1g==
X-Received: by 2002:a9d:3624:0:b0:5e9:5778:d0c6 with SMTP id w33-20020a9d3624000000b005e95778d0c6mr7017809otb.367.1650423253580;
        Tue, 19 Apr 2022 19:54:13 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id c9-20020a4a8ec9000000b0032438ba79b0sm6140956ool.0.2022.04.19.19.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 19:54:13 -0700 (PDT)
Date:   Tue, 19 Apr 2022 19:56:18 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Alex Elder <elder@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>
Subject: Re: [PATCH 3/2] arm64: dts: qcom: sc7180: Remove ipa interconnect
 node
Message-ID: <Yl92UkRwlQsd71mr@ripper>
References: <20220412220033.1273607-1-swboyd@chromium.org>
 <20220415005828.1980055-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415005828.1980055-1-swboyd@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 14 Apr 17:58 PDT 2022, Stephen Boyd wrote:

> This device node is unused now that we've removed the driver that
> consumed it in the kernel. Drop the unused node to save some space.
> 

I'm expecting that merging patch 3 and 4 will work, but cause sync_state
to not happen until the driver changes are merged.

Can you confirm my expectation? And perhaps confirm that it's fine for
Georgi to pick the driver changes independently of the dts changes...

Regards,
Bjorn

> Cc: Alex Elder <elder@linaro.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Mike Tipton <quic_mdtipton@quicinc.com>
> Cc: Georgi Djakov <djakov@kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index e1c46b80f14a..1ff96ef30e3f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1421,13 +1421,6 @@ mmss_noc: interconnect@1740000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> -		ipa_virt: interconnect@1e00000 {
> -			compatible = "qcom,sc7180-ipa-virt";
> -			reg = <0 0x01e00000 0 0x1000>;
> -			#interconnect-cells = <2>;
> -			qcom,bcm-voters = <&apps_bcm_voter>;
> -		};
> -
>  		ipa: ipa@1e40000 {
>  			compatible = "qcom,sc7180-ipa";
>  
> -- 
> https://chromeos.dev
> 
