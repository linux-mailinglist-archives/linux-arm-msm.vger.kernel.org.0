Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3989507A3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 21:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345374AbiDSTab (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 15:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345095AbiDSTaa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 15:30:30 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6D84092C;
        Tue, 19 Apr 2022 12:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1650396463;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=01EJ35R/0l9Atrk/aEq1LlLlljMz21tL7DytWIf/66o=;
    b=ZQNWFsTY/dTw/MrMOiFeEpjIn+tb4691c4c9ZNx/56GuCYpEfTIMmJyXdpsgazZvic
    SFyTj0PuzmRoB9PdOWjSBaUfeOL9i+laRzOpVN7fp+YlcBxSOR0y4qzbbFCKKK2FowB+
    i7NCMq28dgc9kSJQZlciamsOl3Msb2W7sLVKZyWdeRpxv1CYLWj2uFY/t+MwbtpIAass
    O7c3rUR9hNFFrqfkAZxKvczOXZxjd5z5qHom2yW//ICI+2tL+eoiUVEjf1pTCLufrC9Z
    b1XSno2k76AwJ5s8n1L1qG9+lO7OHGJdM3g6YGJiqkJ+6WP7Y0sNjRFRMn8/juZVJoHK
    MW1g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK88/6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.42.2 AUTH)
    with ESMTPSA id u05e50y3JJRhuVD
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 19 Apr 2022 21:27:43 +0200 (CEST)
Date:   Tue, 19 Apr 2022 21:27:42 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, shawn.guo@linaro.org,
        jun.nie@linaro.org, benl@squareup.com, jwillcox@squareup.com,
        jgates@squareup.com, mchen@squareup.com, zac@squareup.com
Subject: Re: [PATCH v1 4/4] arm64: dts: Add msm8939 Sony Xperia M4 Aqua
Message-ID: <Yl8NLldCWaecisH5@gerhold.net>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-5-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419010903.3109514-5-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 19, 2022 at 02:09:03AM +0100, Bryan O'Donoghue wrote:
> Add a basic booting DTS for the Sony Xperia M4 Aqua aka "tulip".
> 
> Tulip is paired with:
> 
> - wcn3660
> - smb1360 battery charger
> - 720p Truly NT35521 Panel
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../qcom/msm8939-sony-xperia-kanuti-tulip.dts | 489 ++++++++++++++++++
>  2 files changed, 490 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
> 
> [...]
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
> new file mode 100644
> index 000000000000..336969f16bc9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
> @@ -0,0 +1,489 @@
> [...]
> +&otg {
> +	status = "okay";
> +	usb-role-switch;
> +
> +	ulpi {
> +		usb_hs_phy: phy {
> +			qcom,enable-vbus-pullup;

tulip seems to have qcom,usbid-gpio = <&msm_gpio 110 0>; downstream.
Have you tried setting it up using linux,extcon-usb-gpio?
See e.g. msm8916-longcheer-l8910, it has a similar setup (it also uses
smb1360 for charging actually).

The advantage is that you don't need the manual role switching using
"usb-role-switch", USB OTG adapters should be detected automatically.

Thanks,
Stephan
