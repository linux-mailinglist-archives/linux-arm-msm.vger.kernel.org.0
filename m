Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB86F7CB30B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 20:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbjJPSzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 14:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbjJPSzs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 14:55:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63BB3EB
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 11:55:47 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EB8C433C8;
        Mon, 16 Oct 2023 18:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697482547;
        bh=2GBwzaXzbOKf0eg+w1BbmkVO8YmTa2dT8tq8q0TmPFw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UmX1nmLe6MIsX3kKW64YIwV/PnT2L45x0ehHU2o9ThY3MFQMhj0lEIXUvxyXTwHMX
         kfCKHexqBbQdI9ERiWrewISCIcFST79xPlJgPdwlaV0G7sG74v/PXmTx9m3U5rPfWq
         tSJ38eYjl3lGH6h/6U/Zp1rz+/6GemuZQCIhrYsTQUhT+OxLCjZbp1kindlhtwJaTc
         b8bCXj4cNmfpcH5jeq0zClnzvp6Ua4bDle1m4IHggQD/3LgMB8Jd5TjqPon+TcCC3A
         BKmtUUa0KSxBBri1eepWyp/YUQ82AunVJbo1gAxwbgXZIudopoqaeii5+THDvccxsR
         asjFURJK760Wg==
Date:   Mon, 16 Oct 2023 11:59:34 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qrb4210-rb2: don't force usb
 peripheral mode
Message-ID: <bynrxecoatjrnx7tpaqn5wv5szht5bjn23xtxdco22pywyndpq@apszoqkoxl22>
References: <20231010-caleb-rb2-host-mode-v1-1-b057d443cd62@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010-caleb-rb2-host-mode-v1-1-b057d443cd62@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 10, 2023 at 11:46:58AM +0100, Caleb Connolly wrote:
> The rb2 only has a single USB controller, it can be switched between a
> type-c port and an internal USB hub via a DIP switch. Until dynamic
> role switching is available it's preferable to put the USB controller
> in host mode so that the type-A ports and ethernet are available.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

Applied, thanks.

> ---
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072
> 
> // Caleb (they/them)
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index a7278a9472ed..9738c0dacd58 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -518,7 +518,6 @@ &usb {
>  
>  &usb_dwc3 {
>  	maximum-speed = "super-speed";
> -	dr_mode = "peripheral";
>  };
>  
>  &usb_hsphy {
> 
