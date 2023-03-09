Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D5E6B18B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 02:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjCIBZH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 20:25:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjCIBZG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 20:25:06 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5199383178
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 17:25:04 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id k14so350536lfj.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 17:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678325102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjICGJVzL9nMVxJMs+OboL/eAW90Z3QAFSkvi53FGao=;
        b=Ed2bTBKtTClst/w1EjQHKPeNePjpsA4GxBQXAQVLyjRnNjBSeHkE2MJTANaj75p+uC
         x3Qq6NyxAdPohkUHX0jSikkKtPxV0q2U3ENDT4IPAUdrkY0/EFPDHkBgIjA4vOukKj6k
         6m0866x1+byXXQ3fOyGGJYYfq2wEJQYGEr3aoi87B0b/xSK4ssf97JTjxV3NziZdRseU
         OphBB3R3oxXriX7Qr+cSMOD6eIO4aJLXatsBwXQYXDAu6XxtPS4wHmRGutdAYZLY08F6
         VxBrPi6XFnDWejIx6DW4UnqwOI9ZiHDh5/xBVv7pr2HPf+RXS9q1QuSINg9RUqkPOfcm
         rNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678325102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjICGJVzL9nMVxJMs+OboL/eAW90Z3QAFSkvi53FGao=;
        b=H3+JfszXIdTRbJx4yMoJmYJWubidqj2Zo7cm+K4Vmt195Doc9BSMwvK/vuPblPdwdd
         N642fckV98GXXDRjvXvZH2S5GzjQDAbXcEj4w9/KqtypaNu0N2zx4epGA9w1Ays+Znu9
         46MBMx0rdBFzZdgYaN7+sGqFGtpWTOS7jT7ubK1ElYFnqQw638znLKv2IgD+1fCsAEf/
         hgU2oIluJbsZSLzovvC1LNRPzU9HBtde25glIYzi5GLiX+QretF8rkksDsxSTSkP2Wj5
         2dzGk0Q+rTWOUYeZmMwEJhJpXwabdcA3EQVH/NJfEOt2CTnMpB/7WvZgf6aGV/gfR6nh
         x/yA==
X-Gm-Message-State: AO0yUKVPmhSNCxrWInR8y+MQSI2DqgZbrKL4TN13dFTUJYZrPXnoxrSt
        G5lyysdQIWvbfSye0mfQimKX9Q==
X-Google-Smtp-Source: AK7set9qk0csjoBrJFjF/OrPqZdoEG2HNHzXi12l5w++8Y06QxOXIYVILjTkqTxsLExiWuFkVnMV/A==
X-Received: by 2002:ac2:4a9c:0:b0:4d7:bda4:e6aa with SMTP id l28-20020ac24a9c000000b004d7bda4e6aamr5386780lfp.24.1678325102558;
        Wed, 08 Mar 2023 17:25:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k6-20020a2e2406000000b002958bf18efcsm2679398ljk.104.2023.03.08.17.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 17:25:02 -0800 (PST)
Message-ID: <2ded450f-7d94-909d-41fc-e0fc612ae6f2@linaro.org>
Date:   Thu, 9 Mar 2023 03:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 10/14] clk: qcom: smd-rpm: Introduce
 DEFINE_CLK_SMD_RPM_BUS_KEEPALIVE
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-10-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-10-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> In preparation for supporting keepalive clocks which can never be shut off
> (as the platform would fall apart otherwise), add a macro for defining
> such clocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

