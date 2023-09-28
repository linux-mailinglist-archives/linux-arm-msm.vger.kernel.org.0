Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D687B135C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 08:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjI1GxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 02:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjI1GxA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 02:53:00 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA60A3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 23:52:58 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6907e44665bso11303476b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 23:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695883977; x=1696488777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLavBd0ChkldiIHoH3Rd7tflWyzkTFZwiD5y93LwGqs=;
        b=Ktpoy1xXOIE3cw1AffqSeo9R2jumxwuP1pPWyX8QEnhmjufsOSsmBiZUPfPHfU4e2o
         dXnZf7udLuBH3sJk1MQ7yaxr1W5GYo0MJ8rEMmy2k76RHxFmdV1RGunQck8qh/BAExJl
         PNpYIroyHUs0cPN1zqDE2Ejequ4/A8SMdAPhuLV6RxyEQOUjVLnIbrg/fvX+VGtedj/p
         MRzTre6GTYXgkBMRu5li3iDnal6LDYz66FXw8frciVgScC/+03us7hpBv6QQDdrtlbjd
         DNjqIeFeHyrp7EOUaE/dxgY6WFmR3eJCLWnnFs4JIeMdRP1PrNnfgIsS/9jNxAWgaVly
         JtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695883977; x=1696488777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLavBd0ChkldiIHoH3Rd7tflWyzkTFZwiD5y93LwGqs=;
        b=hLjFlFIAZwtvXbvXfL5rgdKdifPreu9UmVe44/9VDWSY1ZqVqHIzD+OJoZG08pr2pj
         o9pCpiTu7hZMrHOEXcWVCdutGTo9oVb/ThcVcnuLm7NL47o7qsCJGi2KKS6WLuJ++JlW
         XlBtDCF7Atflkec6iHjT8tzT1CJWXZx0XnuJu/sKpZYO28y9SDXoKQ5yYZhbMGgOhbW6
         1bjGjWT7ApOCj3P2szvG7N2xOSgZj2P6PctOHIrYks6w1HHzX5OuPYRBLN4gJNqUePL3
         /sUaHOoenP6UxQiEyr6r6YRdzhBdMygt2cS1eU/6IdJIqgy3ZW0C+vBIZCiAJ5oL5Tqt
         cyFg==
X-Gm-Message-State: AOJu0YzmRaN15LZhhzr3RZwwZ1EysjxxRvyIuvVoT3I96VvnqRpMD7ei
        mQi8Aw/qe/h0h4SK9YdpjQXCbA==
X-Google-Smtp-Source: AGHT+IGgw/HyPch+aMnGbgEiUc2qmHuYj+ieXydvpCVbVzoGD4VDZvHhxCpuijbZwhsaF+79B3ztAg==
X-Received: by 2002:a05:6a00:2e01:b0:693:3fa0:5ffb with SMTP id fc1-20020a056a002e0100b006933fa05ffbmr468120pfb.21.1695883977474;
        Wed, 27 Sep 2023 23:52:57 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id x3-20020aa79183000000b00693411c6c3csm1580218pfa.39.2023.09.27.23.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 23:52:56 -0700 (PDT)
Date:   Thu, 28 Sep 2023 12:22:54 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 2/4] cpufreq: dt: platdev: Add MSM8909 to blocklist
Message-ID: <20230928065254.ickuhhnja4pegcyq@vireshk-i7>
References: <20230912-msm8909-cpufreq-v1-0-767ce66b544b@kernkonzept.com>
 <20230912-msm8909-cpufreq-v1-2-767ce66b544b@kernkonzept.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912-msm8909-cpufreq-v1-2-767ce66b544b@kernkonzept.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-09-23, 11:40, Stephan Gerhold wrote:
> MSM8909 uses qcom-cpufreq-nvmem to attach power domains and to parse the
> speedbin from NVMEM (for opp-supported-hw).
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index fb2875ce1fdd..984d2ad1a474 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -141,6 +141,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "nvidia,tegra210", },
>  	{ .compatible = "nvidia,tegra234", },
>  
> +	{ .compatible = "qcom,msm8909", },
>  	{ .compatible = "qcom,apq8096", },

Alphabetical order would have been better.

Fixed and applied. Thanks.

-- 
viresh
