Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3920064B55E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 13:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235467AbiLMMlc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 07:41:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235495AbiLMMkx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 07:40:53 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3C620188
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 04:39:35 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id x28so4681244lfn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 04:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W8Ii6msPEVKQt1P5G0aRPGnILIqNaBRvzKSD/qqikEk=;
        b=VStU1ltw+NYCDF25+lGk+Bmp1GIGepuS914SsP18BA76sELo4+XQWxK5aR6V5JCeIN
         Ak9TebDan27fx/uBdVpD4Bs7H39IK2wpQlCkRB0QiwFlo9pZRDg8Dv9xEzer2uj2FMmS
         R2rbjC+lVZTAOf7aviw+jVIsfl+k4MJYucBAJnOheX9CJRcY7QzCDh93p3lEhMZKF6Xz
         nzAjtteTiQDvg1WzTtPaEmiUd1f+OeigxFNyBxUunlVJzwJA071Y1iIdSdJrqSKeBp9l
         l9tMo6CrM7nqdbvAYm3gZ5CIkTJqgrU8JcaufTJ5ZWCa4nyD5au4A5KHut0geag/VXC1
         CVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8Ii6msPEVKQt1P5G0aRPGnILIqNaBRvzKSD/qqikEk=;
        b=YFuF7v60mra08KcULHqGvDrMqBP2vtwy1uY+VP1E6YXFbRhjuKpLpp7pqrZlOmtxk1
         oyCm1eGlSHVUtGJAiWBgrce9H0bq7yGViAcZIINe9giENk1Qagb7QU+LfWpLmwVhMtyr
         q5MdhrYOASHmzsWi5lsC8oQdJnjrnJ7FVnZBceSMr3ujWyrfo/r/jLDw0oDyJfdfHm9y
         2/Toc3JMGa60UltSVsQTHtZ9n7TCnOGZ0Ep4+V6PMDy2GeuQQ9wu3sgJZdkwkphmqmJ9
         R+egtaw7TT4THCViIOj35sC+w4w2OLlENmUDQn8aDVgjaLIQkeLKHCDpEgI3Z2JXVIae
         sung==
X-Gm-Message-State: ANoB5pl82kYQt8q+R7dJPx1E+2J+k8P1fa/kEvDTYH5V+Zg/LF6fQRax
        4xf+dqzVcWQiWglH1Slz2JlEfQ==
X-Google-Smtp-Source: AA0mqf4TZ+VAcI1tgVC11lLsOsiWNWbSBWtubhjbmejUWqylyhTEoe/BvN7ZP4D7rmNyF6fZP8U4Yw==
X-Received: by 2002:a19:5f0d:0:b0:4a4:68b9:608c with SMTP id t13-20020a195f0d000000b004a468b9608cmr5750856lfb.23.1670935174316;
        Tue, 13 Dec 2022 04:39:34 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id e11-20020a19500b000000b0048a921664e8sm356552lfb.37.2022.12.13.04.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 04:39:33 -0800 (PST)
Message-ID: <739feff0-914b-c565-bd16-5099ceda49a9@linaro.org>
Date:   Tue, 13 Dec 2022 13:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6115: Move USB node's
 'maximum-speed' and 'dr_mode' properties to dts
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, andersson@kernel.org
References: <20221213123823.455731-1-bhupesh.sharma@linaro.org>
 <20221213123823.455731-3-bhupesh.sharma@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221213123823.455731-3-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.12.2022 13:38, Bhupesh Sharma wrote:
> Normally the 'maximum-speed' and 'dr_mode' properties
> of a USB controller + port is dependent on the type of
> the ports, regulators and mode change interrupt routing
> available on the board(s).
> 
> So, move the same from the sm6115 dtsi file to respective
> board file(s).
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts | 5 +++++
>  arch/arm64/boot/dts/qcom/sm6115.dtsi                | 2 --
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> index fa57f4bf58256..3f39f25e0721e 100644
> --- a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> @@ -229,6 +229,11 @@ &usb {
>  	status = "okay";
>  };
>  
> +&usb_dwc3 {
> +	maximum-speed = "high-speed";
> +	dr_mode = "peripheral";
> +};
> +
>  &usb_hsphy {
>  	vdd-supply = <&vreg_l4a>;
>  	vdda-pll-supply = <&vreg_l12a>;
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index b5f7480c2e713..e4ce135264f3d 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -1031,8 +1031,6 @@ usb_dwc3: usb@4e00000 {
>  				snps,has-lpm-erratum;
>  				snps,hird-threshold = /bits/ 8 <0x10>;
>  				snps,usb3_lpm_capable;
> -				maximum-speed = "high-speed";
> -				dr_mode = "peripheral";
>  			};
>  		};
>  
