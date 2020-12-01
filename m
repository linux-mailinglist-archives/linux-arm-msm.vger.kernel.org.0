Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27BEA2CAC39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 20:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389789AbgLATZj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 14:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392458AbgLATZh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 14:25:37 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220A0C0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 11:25:10 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id z23so2762033oti.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 11:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SPn0F830zPUmEtXrcmbvv0FgpwCM9EIyGtY9pOM0IAQ=;
        b=ye9t5z4aMn7GwzSPWdrUXPUMc80qSQuyndkXuIcGm2CLfVBcqeMnNX4Rb5z25r3spO
         3dxmC2AtDhSVt4JHT96H17KwWd5Wv2LsQVqzncVSl73bE1q7RWin3fvAk1fKxSUVVd1v
         2ZgfYQRdhaMCkeI3qU09XWEDrGLXGbVIwlaSM5PSAbLrqAJRSXtIuEZxrkTfwuwUI4Eo
         LJxaBln4KY0rq+npZR5folnzOAEqQQ9dl4HwC1vsbrmJMcLZrRUZYZacGIJjR7S9nxlk
         A9UbX9FryyvJwBUgQcIbyRf+7xeQQDh5XPn5sR+qUBRZzwKcSwJH4sPG+VqyduAYKsSj
         wt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SPn0F830zPUmEtXrcmbvv0FgpwCM9EIyGtY9pOM0IAQ=;
        b=NkncOaX6ifyYrX1wGSqvSfiRCrzB6U1LlsOEapQYBgmu1qIonts8cyYslp12yQ9K/9
         u6JWbBIUNpJKgoM0woHMuY5obDu20snKlFYs5+rVv1qJWAVNglrvxtYBZWt1XPvA8t0v
         gspX+o/LtYmL8r7EJzGfza8ihQxKA8lk7pWbChe+gU2BJ1QM8QqLJqdKdrFJlw+/KfO9
         BQk89j1rf61ha1jUhge4kVo1Gv5V+IDDTOJUttT9LmoQ2doz9dEH2GSXOQ5M9qQpVRyy
         39loDxeRdKoSnuTrxi7SGuJfZrrWajKSyvOg3LmvTHNhjmVOCxFrdKZo4HHlB9ABjtLf
         05yg==
X-Gm-Message-State: AOAM531gCPm6iM23Zn+0zEyiKXOd73KUQL0z1jTMxJVMzFyR3mnhiBHl
        QI0dlz69Xcb8RzjWEtXXVKnPcQ==
X-Google-Smtp-Source: ABdhPJz/bHut46tHZb4PgHRmltl+p9cXraMKQLsDXtH/yFPkd9hkFzYY5uiEd3tq6g0CQlcCcgFy/Q==
X-Received: by 2002:a9d:4b82:: with SMTP id k2mr2910223otf.238.1606850709524;
        Tue, 01 Dec 2020 11:25:09 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n3sm107544oif.42.2020.12.01.11.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 11:25:08 -0800 (PST)
Date:   Tue, 1 Dec 2020 13:25:07 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8250: add apr and its services
Message-ID: <X8aYkxFMf+dzNRNt@builder.lan>
References: <20201201153706.13450-1-srinivas.kandagatla@linaro.org>
 <20201201153706.13450-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201153706.13450-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 01 Dec 09:37 CST 2020, Srinivas Kandagatla wrote:

> Add apr node and its associated services required for audio on RB5.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 56 ++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 65acd1f381eb..3b4e98b13d36 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -11,6 +11,8 @@
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,apr.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>

Please move this line one step down to maintain the alphabetical sort
order.

Thanks,
Bjorn

>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
> @@ -2620,6 +2622,60 @@
>  				label = "lpass";
>  				qcom,remote-pid = <2>;
>  
> +				apr {
> +					compatible = "qcom,apr-v2";
> +					qcom,glink-channels = "apr_audio_svc";
> +					qcom,apr-domain = <APR_DOMAIN_ADSP>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					apr-service@3 {
> +						reg = <APR_SVC_ADSP_CORE>;
> +						compatible = "qcom,q6core";
> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +					};
> +
> +					q6afe: apr-service@4 {
> +						compatible = "qcom,q6afe";
> +						reg = <APR_SVC_AFE>;
> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +						q6afedai: dais {
> +							compatible = "qcom,q6afe-dais";
> +							#address-cells = <1>;
> +							#size-cells = <0>;
> +							#sound-dai-cells = <1>;
> +						};
> +
> +						q6afecc: cc {
> +							compatible = "qcom,q6afe-clocks";
> +							#clock-cells = <2>;
> +						};
> +					};
> +
> +					q6asm: apr-service@7 {
> +						compatible = "qcom,q6asm";
> +						reg = <APR_SVC_ASM>;
> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +						q6asmdai: dais {
> +							compatible = "qcom,q6asm-dais";
> +							#address-cells = <1>;
> +							#size-cells = <0>;
> +							#sound-dai-cells = <1>;
> +							iommus = <&apps_smmu 0x1801 0x0>;
> +						};
> +					};
> +
> +					q6adm: apr-service@8 {
> +						compatible = "qcom,q6adm";
> +						reg = <APR_SVC_ADM>;
> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +						q6routing: routing {
> +							compatible = "qcom,q6adm-routing";
> +							#sound-dai-cells = <0>;
> +						};
> +					};
> +				};
> +
>  				fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
> -- 
> 2.21.0
> 
