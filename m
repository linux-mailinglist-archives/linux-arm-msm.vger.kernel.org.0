Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E28D74C09A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 05:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjGIDeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jul 2023 23:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjGIDeT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jul 2023 23:34:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF411E4A;
        Sat,  8 Jul 2023 20:34:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 720CC60B74;
        Sun,  9 Jul 2023 03:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290B1C433C7;
        Sun,  9 Jul 2023 03:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688873655;
        bh=7IyIxLZXdqyS/uINjsmig3rHwxN8N1ppiLrJ404RaWA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lIQqNICQ4Yh+VCzWSanMegr6mAn2RYs0Fojke6cvc/h/zPtHvCj0kcl+698PXWDi3
         rFmN8/yPvgZKfDcxFsnhUUe8qMyeOGXsBJUcgoNFyiK45g30qiNuJq3AfyBs7ec41L
         YL9XRbn2b5zGm7ujPjZgXUCMjT7E85C1G//uzqk5SQutEEQmLV7kKNrELNIp2Z44na
         z8TxIJ5Jo0RgCDTnbcPqtueFDQ/9z/Y8KN0BrNiWFYugAfxC7zr4wbGxxrfSBv74z4
         aIHeAFZcsIAzWRXzRS64mVIm5mM0uD96bkEiHfZZDzzl4fdXhpM2yyYHvm3D9w9+Kk
         PxTuGuAsopNuw==
Date:   Sat, 8 Jul 2023 20:37:52 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typc: qcom: properly report Audio Accessory mode
Message-ID: <eadkkijbf6rael64esnx4muzri3ygmbjjink2csu7gdffytys7@6ibcwovgrfjy>
References: <20230708213617.3759954-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230708213617.3759954-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jul 09, 2023 at 12:36:17AM +0300, Dmitry Baryshkov wrote:

Missing 'e' in $subject.

Regards,
Bjorn

> Detect and report the if the Audio Accessory device has been attached to
> the corresponding USB-C port.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 94285f64b67d..56df04af2d2b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -214,6 +214,11 @@ int qcom_pmic_typec_port_get_cc(struct pmic_typec_port *pmic_typec_port,
>  		if (ret)
>  			goto done;
>  		switch (val & DETECTED_SRC_TYPE_MASK) {
> +		case AUDIO_ACCESS_RA_RA:
> +			val = TYPEC_CC_RA;
> +			*cc1 = TYPEC_CC_RA;
> +			*cc2 = TYPEC_CC_RA;
> +			break;
>  		case SRC_RD_OPEN:
>  			val = TYPEC_CC_RD;
>  			break;
> -- 
> 2.39.2
> 
