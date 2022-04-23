Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27D3350CC17
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 17:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236229AbiDWQB0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 12:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236196AbiDWQBZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 12:01:25 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750031571F
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 08:58:27 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id s203-20020a4a3bd4000000b003191c2dcbe8so1967196oos.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=27WRb8TAj1xwCmRX5jLJOJcOnmbBFcgubgVjuAUaE4o=;
        b=y6xW2G1XsSHeyH5DXQeveuW/+O0IFPUrGFlQdrEGfcYGVPfpVes+ogoxf7DdHI/rMa
         S8CrJLRFP05dPLdga+w21Qd116oGA0vO+lAzTSoTXebiKhah9Ph1yHMOHQgKMiaXlGiY
         5xmiiuhimxwugnQGhKahuJCYouLaT7oKHwdPdVgdnCoH2QOVmA6tPHoJqkbsvusRTQcm
         0ll1BLKmpkslmQZMJJz4FLOKBMGF0M2ilrmO+BAxwZf224P5MYKanmGke0HCiAFh1gzT
         2YStkcU3++Wqa9VF6mP3hDJz/aE5Xo7uJ4vBngiH1obS1VEWtTAwNxXBwhfuOToxYiMG
         YA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=27WRb8TAj1xwCmRX5jLJOJcOnmbBFcgubgVjuAUaE4o=;
        b=FDzAuArlBrOSYejFYGJVIXvViqMRrE381M2cy2QbMU99ro4cc+eVKHfBAjL+Zx18+Q
         Nma9ZHWwjiVanNvcOkWgW8aPxtPMCriurkSlXTYTG6rziXn5GsNyye0/8kLnhKx+4HZd
         osCz5DA4+47aJnjkoKpas1T8QGYgvY5NGDNw9YG0+4MKv9uSae6wJmTcmqItpAZqrH/Q
         ZhLei75wx+BtTpBp2epj43rtbuEREjagfYZej0rC5tBKoOHVuvWqmWrrDRLAXKiY+JdO
         0BjX3o+UKPjlwucLYRoPLLqnDv+HQaeowFR+Ru7/CxC6uA/r6PHQNfb/Tb7FV3MLU+ip
         wItg==
X-Gm-Message-State: AOAM5330rPoclcP/pA21PA8ogX0eqTVFn7QKgwvHnORd1A4E96wAbqGc
        FuunPWbrZGNQSelioBHBcAmpzQ==
X-Google-Smtp-Source: ABdhPJxirqopZgxakMSnC5mL6OQFJH4GIYYrYUpo7jcz3xc42mq/IIeVQ0PA9j/DS5UivlF8dtmF+Q==
X-Received: by 2002:a4a:c294:0:b0:329:2fed:ad3f with SMTP id b20-20020a4ac294000000b003292fedad3fmr3543974ooq.4.1650729506813;
        Sat, 23 Apr 2022 08:58:26 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id a37-20020a9d2628000000b0060563c52952sm1915719otb.8.2022.04.23.08.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 08:58:26 -0700 (PDT)
Date:   Sat, 23 Apr 2022 10:58:24 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        quic_rjendra@quicinc.com,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add ldo_l17b regulator node
Message-ID: <YmQiIJatomyUVahR@builder.lan>
References: <1650550779-8133-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650550779-8133-1-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 21 Apr 09:19 CDT 2022, Srinivasa Rao Mandadapu wrote:

> Add ldo_l17b in pm7325 regulator, which is required for
> wcd codec vdd buck supply.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> index b833ba1..17d0c05 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> @@ -113,6 +113,11 @@
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> +		vreg_l17b_1p8: ldo17 {
> +			regulator-min-microvolt = <1700000>;
> +			regulator-max-microvolt = <1900000>;

Can you confirm that this doesn't need to be in HPM mode?

Thanks,
Bjorn

> +		};
> +
>  		vdd_px_wcd9385:
>  		vdd_txrx:
>  		vddpx_0:
> -- 
> 2.7.4
> 
