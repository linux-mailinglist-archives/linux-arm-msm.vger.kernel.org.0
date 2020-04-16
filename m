Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B531AB9DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 09:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439163AbgDPH11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 03:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2438921AbgDPH1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 03:27:24 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C636C061A10
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 00:27:23 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f13so3513527wrm.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 00:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QxpHiucnhhWIScTRux26ZlKVnMyZxog3DZwM1hu74UY=;
        b=NJcoaFebkFEC/7qlTmJhtWoHhwkOt2K/gdRXFxzWdbjoaCzZkTTDYWJMPxpTxW8ORd
         aqdKBnWmj8kePfOpjU8NPE/K9DebqACnnOY/FjoNYBlalaz3Y7bsKDEIL5UA88ARoLMm
         jLsTpzXX2PUz8MV0Z0FvA4bkhGRJ5KWyld1m4wWCMZo3MjNRlWk17d4JYVtk1hLZ67bj
         s26VJ9CmUDcD6Kc/BNZxY+sr/GLlB5EAsCx8/v0s5n9op7aXDrmyBtKYhq0sSya8+Lvx
         /0YWTdD9FXCJAaR3d/Fsy4pbFIRIFBBLratFGfQH62kukXlOmPMjjWGyit+QrJKZBOrX
         v45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QxpHiucnhhWIScTRux26ZlKVnMyZxog3DZwM1hu74UY=;
        b=f7pFxUWqZLSxCZ1f9kUhkNYtGg/BCMDWJCAR+xsvLLMdv9+6OxwjxAw+9SIf6oAUM1
         0K+muICIqndWkBGZRAlA9RpTdcnqz/17NZMckmoI/g/dhgi/rfqxaVqxupNxFbgVBMqe
         vZ/UelPvQDwC5/dElCEQYbzNwcIeHj2XLNmLqhSPgmTAehi8Pz7Rn0E2+5aYjzspdH+/
         b25Ffb4RQ+zJAag41apbw+nsBY8r/PwUKzLvEw8OWn8mYUgS5++G5vlVWUOHFTlszZe0
         YIiFvJvWnI7FEdl4Tjc+2ibQLMa+DgzMbmuu/WvI2o27JmysjjZRsb6ycjHgPZgtU7Ng
         uhGw==
X-Gm-Message-State: AGi0PuZo5cL/mgFA4gEyYEkMPPkRf90KA8wgER7axTq34RYC28/ruC3t
        Z3u045mdOUCaqrcZE8FtwyvCjg==
X-Google-Smtp-Source: APiQypJqsIciqFOzLwVCqcUPSlriBEOlFHJnwMEFkwbNqkG6VNGQqvq0iwyOSnnG1sOY8gY5eFSegw==
X-Received: by 2002:a5d:49d2:: with SMTP id t18mr16202952wrs.85.1587022041753;
        Thu, 16 Apr 2020 00:27:21 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id b191sm2542521wmd.39.2020.04.16.00.27.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Apr 2020 00:27:20 -0700 (PDT)
Subject: Re: [PATCH 2/2] dt-bindings: soc: qcom: apr: Use generic node names
 for APR services
To:     Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org
References: <20200415081159.1098-1-stephan@gerhold.net>
 <20200415081159.1098-2-stephan@gerhold.net>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f0735d41-d274-841e-f6d3-69c301726883@linaro.org>
Date:   Thu, 16 Apr 2020 08:27:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200415081159.1098-2-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15/04/2020 09:11, Stephan Gerhold wrote:
> Device nodes should be named according to the class of devices
> they belong to. Change the suggested names of the subnodes to
> apr-service@<id>, which is already in use in
> arch/arm64/boot/dts/qcom/sdm845.dtsi.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   .../devicetree/bindings/soc/qcom/qcom,apr.txt | 20 +++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> index f8fa71f5d84b..2e2f6dc351c0 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> @@ -65,30 +65,30 @@ which uses apr as communication between Apps and QDSP.
>   		compatible = "qcom,apr-v2";
>   		qcom,apr-domain = <APR_DOMAIN_ADSP>;
>   
> -		q6core@3 {
> +		apr-service@3 {
>   			compatible = "qcom,q6core";
>   			reg = <APR_SVC_ADSP_CORE>;
>   		};
>   
> -		q6afe@4 {
> +		apr-service@4 {
>   			compatible = "qcom,q6afe";
>   			reg = <APR_SVC_AFE>;
>   
>   			dais {
>   				#sound-dai-cells = <1>;
> -				hdmi@1 {
> -					reg = <1>;
> +				dai@1 {
> +					reg = <HDMI_RX>;
>   				};
>   			};
>   		};
>   
> -		q6asm@7 {
> +		apr-service@7 {
>   			compatible = "qcom,q6asm";
>   			reg = <APR_SVC_ASM>;
>   			...
>   		};
>   
> -		q6adm@8 {
> +		apr-service@8 {
>   			compatible = "qcom,q6adm";
>   			reg = <APR_SVC_ADM>;
>   			...
> @@ -106,26 +106,26 @@ have no such dependency.
>   		qcom,glink-channels = "apr_audio_svc";
>   		qcom,apr-domain = <APR_DOMAIN_ADSP>;
>   
> -		q6core {
> +		apr-service@3 {
>   			compatible = "qcom,q6core";
>   			reg = <APR_SVC_ADSP_CORE>;
>   		};
>   
> -		q6afe: q6afe {
> +		q6afe: apr-service@4 {
>   			compatible = "qcom,q6afe";
>   			reg = <APR_SVC_AFE>;
>   			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>   			...
>   		};
>   
> -		q6asm: q6asm {
> +		q6asm: apr-service@7 {
>   			compatible = "qcom,q6asm";
>   			reg = <APR_SVC_ASM>;
>   			qcom,protection-domain = "tms/servreg", "msm/slpi/sensor_pd";
>   			...
>   		};
>   
> -		q6adm: q6adm {
> +		q6adm: apr-service@8 {
>   			compatible = "qcom,q6adm";
>   			reg = <APR_SVC_ADM>;
>   			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> 
