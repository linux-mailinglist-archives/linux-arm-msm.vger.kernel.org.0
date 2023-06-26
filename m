Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 261E873DE31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 13:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjFZLvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 07:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjFZLvg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 07:51:36 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDB8E43
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 04:51:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb41682472so1639281e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 04:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687780293; x=1690372293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1KRN2kwx56PybW592i4Zxpvn05bwlWI0tDtPh8NhEg=;
        b=WLySW1KBpz/KJzcNsc59NVPgCs0/v1synHfxTIsyLbwvmmZ0q1G4uQMxNP8Iha9rU5
         nYu4dpTAWLjRLC7L6S88kxQae1zZ06lZwoOjO5nY62Y2f+n2VX7We79rygWziFBrSzDr
         5OH/AMrh5KSRBznFNlhdYDQzCcc1y28keCHzgAWKlWKWdpy9Cj5RLHtmdx3OGb3VFg3y
         4v/McHn8qve61Y+RthNcIV/BMeMls/qTSSRIi7i0iDkar7TDWZpjU1sV/8yy4A66SW5l
         2vbDMg40/2GYFTa54ZZY/dZG4MYfMJA9efcFDWZvaBEtkTnoddCeR0iEMzFLzbhSkK1H
         itQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687780293; x=1690372293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1KRN2kwx56PybW592i4Zxpvn05bwlWI0tDtPh8NhEg=;
        b=KA3feM0r1q6wjLPKKKnOkt48bCx4eBb/nSH7zz+XIjIUWPBGYtxnqpZn8n6/Hw56jZ
         HS9HVUm4vWlInFW+iKV3/XjGRMVL67TNo4G/eCAymJx4xe8RowwabbgmtpS62W1gA85R
         qAvSxq+6uRC0ItCloO21uGuSrXI6op7oRBnayN2K8AUIrv2Ib/Mg64d8zDSKqJ4bwrHS
         ptdu+nTnEw4U4oOHNDjdCRg3n48ldkvosN3SRPhZlFGyjEHUKc0MfrbehsYH7a1+pc4D
         w4hC8DOnfFYLeVLsE4cbJFMu2tSGZQ7QyCyb6oHM3jruO35ATHmfI6jBiAo/jPCEFgQl
         uwwg==
X-Gm-Message-State: AC+VfDxH/nE4tP5KZxZ4ht9GKMWoFGFBSrF2PaaCWJxU+sToM1PgedVp
        zmhG1X/6Fl4gfhKh3r+2IPZrNQ==
X-Google-Smtp-Source: ACHHUZ6ZKKKeeWs8KBrYn8qgsxWybsrih96nxkWBcGmlr49ZSzzEPfVYa5FuhZX/xyPeipQlQ9hKGQ==
X-Received: by 2002:a19:7718:0:b0:4f8:6e6e:3f42 with SMTP id s24-20020a197718000000b004f86e6e3f42mr13692722lfc.14.1687780292947;
        Mon, 26 Jun 2023 04:51:32 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id h25-20020a197019000000b004fb7be56ff0sm47820lfc.292.2023.06.26.04.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 04:51:32 -0700 (PDT)
Message-ID: <b4557ddb-7b0d-dd19-d562-d85349f5a6a2@linaro.org>
Date:   Mon, 26 Jun 2023 13:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 11/26] cpufreq: qcom-nvmem: drop pvs_ver for format a
 fuses
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
 <20230625202547.174647-12-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230625202547.174647-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25.06.2023 22:25, Dmitry Baryshkov wrote:
> The fuses used on msm8960 / apq8064 / ipq806x families of devices do not
> have the pvs version. Drop this argument from parsing function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index 3bb552f498da..2a591fafc090 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -50,7 +50,7 @@ struct qcom_cpufreq_drv {
>  static struct platform_device *cpufreq_dt_pdev, *cpufreq_pdev;
>  
>  static void get_krait_bin_format_a(struct device *cpu_dev,
> -					  int *speed, int *pvs, int *pvs_ver,
> +					  int *speed, int *pvs,
>  					  u8 *buf)
>  {
>  	u32 pte_efuse;
> @@ -181,7 +181,7 @@ static int qcom_cpufreq_krait_name_version(struct device *cpu_dev,
>  
>  	switch (len) {
>  	case 4:
> -		get_krait_bin_format_a(cpu_dev, &speed, &pvs, &pvs_ver,
> +		get_krait_bin_format_a(cpu_dev, &speed, &pvs,
>  				       speedbin);
Might have unwrapped this line while at it :P

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  		break;
>  	case 8:
