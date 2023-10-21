Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 507FD7D1E6F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Oct 2023 19:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbjJURCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Oct 2023 13:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbjJURCr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Oct 2023 13:02:47 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D01A106
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Oct 2023 10:02:38 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c51682fddeso33278651fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Oct 2023 10:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697907757; x=1698512557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HjvvnFB0zYny0SfjUxiQBEKf2HY6VSvzTEznwOL3cxA=;
        b=WHdorEgcolP+by7CxAGPwiWPljo86q5638YB66cDw7DxWaoqp+86p7YwRrJt+Paapx
         SIQjbrj9jlF7uEJ0pjCYs0mCjF0S/SK/m0Cs0P3d7pwhAmZmdZNeH+D+K5eztWm8MLqv
         hN1JGIa++mYzv7Y5jEgB7Us0lgJsHAZzybE/mAhYOgys/IGgkvp9B1fK5atwArmcQ77l
         Yq1w7DWn6Xdnczrj0BkYbplVWNiO4nddvAYX38rdKjnCfFDTBzdvX7UaEDad7gGb4LP4
         OR0+YW470s7Nk5fYPY9zFFw0PNuXFxtHqTEr9HrL2Xrr5dtxzIVILbfsE8aq9FL1/5LI
         f0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697907757; x=1698512557;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjvvnFB0zYny0SfjUxiQBEKf2HY6VSvzTEznwOL3cxA=;
        b=XRCQJb1hJJqzJwOZhm10bru1dK+NJs7EnlaRXT6ULedgu9wSPjlG/NWsZ6+jRr018Q
         625uYFSN2Ca35CgyMohhZrnBSo+wc9fTafj563MnE3oN3CW1nXFa8sYxkSomSxdJpbAx
         CHAqpkD4t+2IWuNZDHhzM/lx3THLTuPRIQt8CZuf/bd9jFWVZoyKibnQm5usQPe2WN+5
         oh7g9hH9YPM7VniMKTzvFXE1F1tkrBH5+ghyD0Zt8f4d2nMKAe9nVLvbAJXJ6xlNUb72
         P6OZ3PNOAqDhHYecNzo8TicDLVAlI7Onbof+u6l4l8xMXpQhNfXXc0xo+uehuazE6G96
         hHDw==
X-Gm-Message-State: AOJu0YwmGNdFTLW3HIhIk10ZpbDtccqwK9LAagUQheOOOO/CjNctq4WS
        2OOCCeOx4E5T8TMyuM/Z2b6Kng==
X-Google-Smtp-Source: AGHT+IG0ya5Xkq87PowH0RwzsI/CgaqLYtXPPjWdteaKOqlyC50RHFBcGQXv3qjT3+2MzVnDBnXwWg==
X-Received: by 2002:a05:6512:2826:b0:501:ba04:f352 with SMTP id cf38-20020a056512282600b00501ba04f352mr2525208lfb.1.1697907756713;
        Sat, 21 Oct 2023 10:02:36 -0700 (PDT)
Received: from [192.168.1.116] (abyl4.neoplus.adsl.tpnet.pl. [83.9.31.4])
        by smtp.gmail.com with ESMTPSA id f10-20020ac2532a000000b004ff8cd27a61sm924443lfh.213.2023.10.21.10.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 10:02:36 -0700 (PDT)
Message-ID: <4acf4ab5-dbdf-429f-82f1-d6789bc6b21d@linaro.org>
Date:   Sat, 21 Oct 2023 19:02:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] clk: qcom: config IPQ_APSS_6018 should depend on
 QCOM_SMEM
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, ilia.lin@kernel.org,
        sivaprak@codeaurora.org, quic_kathirav@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <cover.1697781921.git.quic_varada@quicinc.com>
 <f4c4d65a7cb71e807d6d472c63c7718408c8f5f0.1697781921.git.quic_varada@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <f4c4d65a7cb71e807d6d472c63c7718408c8f5f0.1697781921.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/20/23 08:19, Varadarajan Narayanan wrote:
> The config IPQ_APSS_6018 should depend on QCOM_SMEM, to
> avoid the following error reported by 'kernel test robot'
> 
> 	loongarch64-linux-ld: drivers/clk/qcom/apss-ipq6018.o: in function `apss_ipq6018_probe':
> 	>> apss-ipq6018.c:(.text+0xd0): undefined reference to `qcom_smem_get_soc_id'
> 
> Fixes: 5e77b4ef1b19 ("clk: qcom: Add ipq6018 apss clock controller")
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Closes: https://lore.kernel.org/r/202310181650.g8THtfsm-lkp@intel.com/
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v5:	Update commit log with the error message
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
