Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF137D8A36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 23:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344799AbjJZVX5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 17:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbjJZVXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 17:23:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DAF61B8
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:23:49 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507962561adso2121606e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698355427; x=1698960227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WaS1F6gxvektWaH+1uXMzK+p2rqyW26a4HQpLvHPqcE=;
        b=JgJgEZo8z0xWPSUgdtQjadp4VGUhjXVVGvrwk55CUM/IM5LXcVAQ01hBzPFMLyU9sS
         Nj1pVuWDj506FC6GhCbU2ZYZy78D6mZ9HPVe3BYN/sS7L7An0uL/qMX63Ao0QKe7Un4d
         nJnJF+PUgcsLyi5aOz1MJAUW/o+g5SCTkbx0feGDsQQkxwWZ5ibVqkABBTx4krCCrvRB
         JNHk/OXPH/yE0kMdrAc9ykkvqLdRCO2yCUXphBahgx6MCSlYWlT5/QiN4w02ylBlZNxh
         9T8KnfqGtzbBgvhIxlumu+xOCtkMYc3rEYglqvjoumtuDfeJzHH/gvUcYoudsIjKeUht
         zh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698355427; x=1698960227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WaS1F6gxvektWaH+1uXMzK+p2rqyW26a4HQpLvHPqcE=;
        b=nCoYwmZ9CZcRLf6+2Q20HixNjxij6gQyxWbDe1ClpqZL/vrZDDZIKtEc9oG7L3m3zR
         SUa6oiGNzRUsdEy3+YK4KebQ8idRuEwVOcMntEbzF1Wx4dCKITDxtlKCBGzxzpmHwCSE
         C5ifVbC545/9XYvLhxlM3UcXl+gchk4Lei6KIJbskOvKMFBkBKenzgOK1SG2T7ukvLq6
         7jBKsgONwJOBAHXXfPPjIm3N1w4q9T1kPR3wY+HIpNN4ihJj+eIXiI2tf/RNbW1697J0
         QrGbfbG1b7rM1wNGltXm00WbfBtyjEAd8eKawM8HhXEeVHL0e1q03LCH1EdyZI1zOe8r
         r3/Q==
X-Gm-Message-State: AOJu0YzpZQbuCKdkTxNDlq7SclZgyGiPD02b/5ZaR5gonDNhrvelt7VM
        j4HzrGoDMbeXUYvYV67X4tRORg==
X-Google-Smtp-Source: AGHT+IG4rn72MceQOMecssoAqNoze+tcPRSKZ88w+fIaYfqgCbPe9Go1xkti6JH9We47TwImsVs2Nw==
X-Received: by 2002:ac2:4553:0:b0:502:f2a4:152f with SMTP id j19-20020ac24553000000b00502f2a4152fmr399943lfm.10.1698355427481;
        Thu, 26 Oct 2023 14:23:47 -0700 (PDT)
Received: from [172.30.204.146] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u15-20020ac248af000000b004fdd6b72bfdsm5498lfg.117.2023.10.26.14.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 14:23:47 -0700 (PDT)
Message-ID: <d2c46459-0686-41ba-bf27-a62fcd00d489@linaro.org>
Date:   Thu, 26 Oct 2023 23:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] ARM: dts: qcom: ipq8064: Add CPU OPP table
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20231019105011.7289-1-ansuelsmth@gmail.com>
 <20231019105011.7289-5-ansuelsmth@gmail.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231019105011.7289-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/19/23 12:50, Christian Marangi wrote:
> Add CPU OPP table for IPQ8062, IPQ8064 and IPQ8065 SoC.
> Use opp-supported-hw binding to correctly enable and disable the
> frequency as IPQ8062 supports up to 1.0Ghz, IPQ8064 supports up to
> 1.4GHz with 1.2GHz as an additional frequency and IPQ8065 supports
> 1.7GHZ but doesn't have 1.2GHZ frequency and has to be disabled.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
I didn't actually check the values against downstream, maybe we
can prettyplease ask Dmitry as he's done that before with msm8960-class
SoCs..

[...]

> +	opp_table_cpu: opp-table-cpu {
> +		compatible = "operating-points-v2-krait-cpu";
> +		nvmem-cells = <&speedbin_efuse>;
Shouldn't this be opp-shared?

Konrad
