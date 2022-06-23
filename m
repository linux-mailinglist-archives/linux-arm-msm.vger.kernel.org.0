Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7985E557CE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 15:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbiFWN0t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 09:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbiFWN0t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 09:26:49 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B50749CA4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 06:26:47 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id e2so17602397edv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 06:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BWtywWXxkwvovMIXtrTmO3/YOYg8/WdqZTGc+AK29lA=;
        b=sZ7ku9dgfbUr4sAKkhhOykgJ+ezo2z/y+eqV6NdXPESqQPurnxYGemNE33Be0ZMwFB
         fPfVCELnAEkQC5AMV3vRq0EAF31YOZEWoI8YgvJ6evFlTtKqwN61PG4JV0nppugz32b/
         DXUh1qqSNi76Qh6x4qMH8nAIXm3EQ6fi8+9xHDnCdYhwk29lys3/aiXJsaPuRwPt03CA
         8JTUsMn033xEFscHJBwJR+EV69O4CgfOHJq6ptELeDCXBxxMQGHY/N5Ilhbz+OQpXADK
         G8CMrIjQ4wpkXD0pWxsesEp/2pg3JDRlmc8hwmgr2dPm+CLb0iCNlUo2kudCZOx9jCN1
         E5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BWtywWXxkwvovMIXtrTmO3/YOYg8/WdqZTGc+AK29lA=;
        b=II4/HRnWRSXGhwal7xaf5jyxY/jKKCNfJym921HFW2XKFgfFaxKEUI68sIcGSG5iz9
         YxEFIW70+UWDfa8KXo1tZa0ETQrdADRMCP7wNxFrZZME4rwwoOT40sRPkhoxuLTogVyH
         MTB1WGfgZUfU1d2apeDUb7ot/4scKQ1ZAB4CNUMqAsFAEr4TUIV8ZivTYbqBN4AW6QpF
         aOHKU9rqsEqEZVhzFqUHxjgtKNnlRLFg+dXSq8GSxvjyuRS5tqbIY3WoFjwvOQU0muL/
         S9hAZi7Nh1XTq56feG1J5Mz8iWArDB0aTe35CwMLqUhiyMGAp2Ao4kYWGwMfLN99bC3u
         ywog==
X-Gm-Message-State: AJIora97yR0bVqVBs+aR4lG21wc2WQgtderGprcDXCy8CdBpxyx6lB6A
        AujlJFUm2YEVqJGlpc4ueREpcA==
X-Google-Smtp-Source: AGRyM1sXuGfb1U67lmsrb9UiJ1H/KgcSb5tCjSll3oNHilBT7iIdQgnIYQn/FF5ye6ZvQmmdZB+sng==
X-Received: by 2002:a05:6402:3227:b0:435:8e00:62b4 with SMTP id g39-20020a056402322700b004358e0062b4mr10697408eda.325.1655990805936;
        Thu, 23 Jun 2022 06:26:45 -0700 (PDT)
Received: from [192.168.0.230] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p1-20020a05640210c100b004357dca07cdsm10486338edu.88.2022.06.23.06.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 06:26:45 -0700 (PDT)
Message-ID: <3f04d27f-4949-3544-9d39-73151a303569@linaro.org>
Date:   Thu, 23 Jun 2022 15:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] regulator: qcom_smd: Add PM8909 RPM regulators
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220623094614.1410180-1-stephan.gerhold@kernkonzept.com>
 <20220623094614.1410180-4-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623094614.1410180-4-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/06/2022 11:46, Stephan Gerhold wrote:

>  static const struct rpm_regulator_data rpm_pm8916_regulators[] = {
>  	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm8916_buck_lvo_smps, "vdd_s1" },
>  	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm8916_buck_lvo_smps, "vdd_s2" },
> @@ -1222,6 +1245,7 @@ static const struct rpm_regulator_data rpm_pm2250_regulators[] = {
>  static const struct of_device_id rpm_of_match[] = {
>  	{ .compatible = "qcom,rpm-mp5496-regulators", .data = &rpm_mp5496_regulators },
>  	{ .compatible = "qcom,rpm-pm8841-regulators", .data = &rpm_pm8841_regulators },
> +	{ .compatible = "qcom,rpm-pm8909-regulators", .data = &rpm_pm8909_regulators },
>  	{ .compatible = "qcom,rpm-pm8916-regulators", .data = &rpm_pm8916_regulators },
>  	{ .compatible = "qcom,rpm-pm8226-regulators", .data = &rpm_pm8226_regulators },
>  	{ .compatible = "qcom,rpm-pm8941-regulators", .data = &rpm_pm8941_regulators },

Isn't this a new compatible? Looks like, so it needs bindings.

Best regards,
Krzysztof
