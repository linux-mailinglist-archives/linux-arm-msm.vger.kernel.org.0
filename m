Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F014C00B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 18:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234768AbiBVR7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 12:59:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232898AbiBVR7B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 12:59:01 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1004D171864
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 09:58:36 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id i10-20020a4aab0a000000b002fccf890d5fso18701821oon.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 09:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9Y2AqDKUpMQgTsOg3FI79lbQQePJo1iYlm+XyAflgx0=;
        b=LmfyH44UGzXt6wILF+bnLCqYn5OW6LnPIuT7x/JfxAHL5ZgBH/SB0zz1GaU07zcKc/
         4vYk85m6gonT+gcZxME1BSo79mzDwxWs/DQMWtRFmpqqANaKCNGtCNVWZYpUTvyW7pcJ
         s2aiFwVT0mO15/chQySqSzZTEL6OTIoxG7sUkG0CHgcdu6qRTesl53RZEWD1iYvozm0e
         I/ABk/YjAZeMhehY75hopIW0b+A1jb1wO0tDxGW+AoMDSRKNcaz3NsaH9+/dpPirWAT5
         wdoLeS6F2wvtIjEkHbZjwUb3ePZ/CBKeWx4JUssJ9dzTW0PoBgqEI0gCOfbPsDGUL/UL
         HbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9Y2AqDKUpMQgTsOg3FI79lbQQePJo1iYlm+XyAflgx0=;
        b=SVeKgoZ2SoRoVBe3TZ861RtWUUKgpxcfiuKgiPRN+y20uMdjREuCiocc8CL4DI2Ngl
         RQ5JdbP2n3//+E8hYTyLYtYmfUMB7D0L4t19WK+vGAQAHrWO58y/GY458SoSq5ThSkcx
         cZxiBXVME6MgGRA4pToT8hXRbz96DzHrGlkmCxoeRNDcogNLEEGQaUDJXP6yOVpgBbAQ
         I6knmVl6us+g38DK4e2n3GL1xk5/EH3uyXykpAwzZH8mjdyMLXMTxcYtlt6epLvQ/+mx
         H1OWX5GzZslgrBFly0SAWbsAlDzg3ACVMPO5SRXAnKqMyLVQwYTrhictCZSrTr2G0aJO
         rHvA==
X-Gm-Message-State: AOAM530njf/U5MGn7HUGn1+xNGuWLRJZk1pQjGLKuLRzAvlqAj3MUjNU
        MWJNEEEHx2FLmOWOMLmizULxow==
X-Google-Smtp-Source: ABdhPJyj87/YvJOCybKJXx1u/9jXrSrA/hbB7V18Hg9PLPl52iAsQhxw+fIIZM13P1F+EGTEAGWXrA==
X-Received: by 2002:a05:6871:7a8:b0:c5:a1b3:43eb with SMTP id o40-20020a05687107a800b000c5a1b343ebmr2265517oap.103.1645552715430;
        Tue, 22 Feb 2022 09:58:35 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id g18sm1751484otp.17.2022.02.22.09.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 09:58:34 -0800 (PST)
Date:   Tue, 22 Feb 2022 10:00:34 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: Enable pm8350c pwm for
 sc7280-idp2
Message-ID: <YhUkwmis0ZY9gypR@ripper>
References: <1645509309-16142-1-git-send-email-quic_c_skakit@quicinc.com>
 <1645509309-16142-5-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645509309-16142-5-git-send-email-quic_c_skakit@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 21 Feb 21:55 PST 2022, Satya Priya wrote:

> Enable pm8350c pmic pwm support for backlight on sc7280-idp2.
> 
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> Changes in V3:
>  - New patch added in V3, to enable pwm support on sc7280-idp2 board.
> 
> Changes in V4:
>  - No changes.
> 
>  arch/arm64/boot/dts/qcom/sc7280-idp2.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> index 73b9911..d4f7cab 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> @@ -34,3 +34,7 @@
>  &nvme_3v3_regulator {
>  	gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>  };
> +
> +&pm8350c_pwm {
> +	status = "okay";
> +};
> -- 
> 2.7.4
> 
