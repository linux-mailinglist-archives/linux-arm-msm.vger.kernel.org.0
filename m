Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3529E6F4330
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 13:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbjEBL6s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 07:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233918AbjEBL6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 07:58:47 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31D4E48
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 04:58:45 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4efe9a98736so4240728e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 04:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683028724; x=1685620724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ZLjR/b8+keXd4JwUhwNrpQMc/9k78bL8mpWHNXC7FY=;
        b=d9CnNyNC4Dr5bGdHR5X2sSmBg1SLH/sERPVg49DEiZOcOYQ/pp/YQJvwNYzkFKv7ZD
         oO3U1Lkvuyi9EQcc0TqtwsBZd1HZ23ng+3puBWyDJedXi36eeC6ycfFsYHPyY1DG2gRw
         14R2fUD90CnRrhnoTwEdXjIh4SneCbYaZEKzCCqZr9E5ZBKvFxR/cQeB9uNmbDnuKPnY
         PmUt9/xG/+X0VRP5u9VPKBw86EDm/9Q5TupgvqKRISjIkKPdR8W3fSgYByUu3cEMIW2/
         J6+0o6OCDV1clo2AhIx9BqNaNVmGl5feqb1fqmr04DAu7sLKxn5xJ39UZeqQnfdbo8Ew
         szuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683028724; x=1685620724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZLjR/b8+keXd4JwUhwNrpQMc/9k78bL8mpWHNXC7FY=;
        b=g+TTMrJH0Bq+lHweGYZgMjKexMCrQL/4yfrk8B4TnSbKSPGIa5IgyZvs9DDsR12dCw
         cLEt9nM80+/swFivCJZPkgie0N3XRY1ZfxOA12ZRkqJAQP9bFEAnemspDHxFBRYLKelu
         +AL6EV0dAGJt2JBbiUD54O6znllUL1Wcx2hHt5Mb/0TB0UVCryiLX3DzxNL/rFwB/BrS
         t0munZhEAjMfi1xtC6DnRIWdp0lOxb3qvbLYwpRMPOv7d+3d4dI7b5Pzeo6FNKdXnNr4
         M7p1D99bZDiOwM3rwO9Jlrk6i1H+VgolEbuB6U95o/jeINnpyRykgAy0AGTwun8dlfR/
         SmxA==
X-Gm-Message-State: AC+VfDyNRB5kC9mphh/GUp+IZ2s/Oq1MhdT/SwGnFREZyszFLKOW2a59
        iM8psCLhep0WoA+XJgnBHucOKw==
X-Google-Smtp-Source: ACHHUZ6DBCWxeubXScpmVueBxthXP0zHmxD3gmdHnO6MGzNPzscZeBHyG7NUjv6mx3wCmoM7LLeXrg==
X-Received: by 2002:ac2:5228:0:b0:4ee:e0c7:434d with SMTP id i8-20020ac25228000000b004eee0c7434dmr5108578lfl.51.1683028724007;
        Tue, 02 May 2023 04:58:44 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id g13-20020a19ac0d000000b004dc4b00a1eesm5286239lfc.261.2023.05.02.04.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 04:58:43 -0700 (PDT)
Message-ID: <1aaff58a-f07b-1e2a-e27b-df41eacd19e7@linaro.org>
Date:   Tue, 2 May 2023 13:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb4210-rb2: Enable aDSP and
 cDSP remoteproc nodes
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org,
        devicetree@vger.kernel.org
References: <20230501105832.1185477-1-bhupesh.sharma@linaro.org>
 <20230501105832.1185477-4-bhupesh.sharma@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230501105832.1185477-4-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.05.2023 12:58, Bhupesh Sharma wrote:
> Enable the aDSP and cDSP remoteproc nodes on Qualcomm QRB4210 RB2 board.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index bff6ba1d689f..3ab46499d3fa 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -34,6 +34,16 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	status = "okay";
> +	firmware-name = "qcom/sm6115/adsp.mdt";
status last
also, don't we want to use .mbn (squashed binary)?

Konrad
> +};
> +
> +&remoteproc_cdsp {
> +	status = "okay";
> +	firmware-name = "qcom/sm6115/cdsp.mdt";
> +};
> +
>  &rpm_requests {
>  	regulators {
>  		compatible = "qcom,rpm-pm6125-regulators";
