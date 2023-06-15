Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D5A73115A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 09:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245197AbjFOHup (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 03:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245341AbjFOHuG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 03:50:06 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3652721
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 00:50:03 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f762b3227dso624308e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 00:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686815402; x=1689407402;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2qg/OhTZMxFrneoAf57EQq0qnVlyXa5i01t43MlX9w=;
        b=e4u3NTu/pqU31uuPTG/eKpW/QMItHv1uBLmHN+OELfnX1s9Mil6RX5ENuCEd+YZnhG
         7OUhGO22mHvfSKxtVEmzTjhrKYa2shwfgLFcP1F1bsr57fY9WXdGpU8PEa1qmV+/UOso
         rmHHLXWa5BrPA+jFwFbHBl9kFvdSv6dsJlBQlBRHU5F/6UNHerM+drMF9Bn8JUFM6n8n
         d88djVnlSmR10vM+lao15yr875PzITrl+A8BRXhuhvPs/ko0IXtMGODa7qTaaMkjRSEM
         utKbYzRpfW42pN4JgTL7b4NDD/62ayF+SVwxOQrq4dNQFDCEldZ2/Wf7Z2pkHZgSLy5e
         WoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686815402; x=1689407402;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2qg/OhTZMxFrneoAf57EQq0qnVlyXa5i01t43MlX9w=;
        b=apn2rLPbBlBJD5a2+oeeKQd1ReA0j49i3rkx8FZWn8S3yhFFE5BQxCZrvBKweN+sn9
         nuBSLiOmcchYQnQq3WQ1/qVaPQMja0fR+ljHsXMISBDm2NND0tthHatXwdOrNE3FSIOA
         IIrhCysCP38vgz3FwGN6iU0YhiUfwD6ldrfVfeCFRShMwxVkdRxKx29O6JUjs9Jn57SB
         kFeHnvuv+ATs1YJwaWRPBqy+kqcdgqKxhehQ0G/kjvovtfBCHAccOvtk1qcYeQm0qM7o
         H6DaQivgxTqqd3tzHqVQ3Q8AVlU3K4rEcWvXfxcnvNuKF1cXmRiA/5p0QN54a91J5GNq
         W9FA==
X-Gm-Message-State: AC+VfDxKIKF2fWwN44nNNqPNHVx9aRG/tY5y3U8tuiwecgmR3+d0jVZz
        Pv9LT1SK2jx5qeuu2FYNypkRjw==
X-Google-Smtp-Source: ACHHUZ7U+ZUkuF8q6VsyYsmqbxyJo+bKxv0x5R1kei09Xwyk3EU60144Jc9nNsH0GhPbxK3PfwyqiQ==
X-Received: by 2002:a19:9118:0:b0:4f2:147b:7ee with SMTP id t24-20020a199118000000b004f2147b07eemr1305042lfd.20.1686815401899;
        Thu, 15 Jun 2023 00:50:01 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id p20-20020a19f014000000b004f749b64bbcsm1243348lfc.69.2023.06.15.00.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 00:50:01 -0700 (PDT)
Message-ID: <825f06c1-cf87-c0e3-a9fc-f4ec0edaa0f8@linaro.org>
Date:   Thu, 15 Jun 2023 09:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230526-topic-smd_icc-v6-0-263283111e66@linaro.org>
 <20230526-topic-smd_icc-v6-18-263283111e66@linaro.org>
 <e2afd4bde3e85db358d50553a60a744f.sboyd@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v6 18/22] clk: qcom: smd-rpm: Separate out interconnect
 bus clocks
In-Reply-To: <e2afd4bde3e85db358d50553a60a744f.sboyd@kernel.org>
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

On 15.06.2023 02:48, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2023-06-14 11:04:37)
>> The interconnect bus clocks are now handled within the ICC framework.
>> They still however need to get a kickstart *before* we call
>> clk_smd_rpm_enable_scaling(), or RPM will assume that they should all
>> be running at 0 kHz and the system will inevitably die.
>>
>> Separate them out to ensure such a kickstart can still take place.
>>
>> As a happy accident, the file got smaller:
>>
>> Total: Before=41951, After=41555, chg -0.94%
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/clk/qcom/clk-smd-rpm.c | 278 +++++++++++++++++------------------------
>>  1 file changed, 115 insertions(+), 163 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>> index 6e7f0438e8b8..0d1d97659d59 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>> @@ -498,13 +506,69 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER(div_clk1, 11, 19200000);
>>  DEFINE_CLK_SMD_RPM_XO_BUFFER(div_clk2, 12, 19200000);
>>  DEFINE_CLK_SMD_RPM_XO_BUFFER(div_clk3, 13, 19200000);
>>  
>> +static struct clk_smd_rpm *bimc_pcnoc_icc_clks[] = {
> 
> Can these be const arrays?
Sorta, look below.

> 
>> +       &clk_smd_rpm_bimc_clk,
>> +       &clk_smd_rpm_bus_0_pcnoc_clk,
>> +};
>> +
> [...]
>> @@ -1332,6 +1275,15 @@ static int rpm_smd_clk_probe(struct platform_device *pdev)
>>                         goto err;
>>         }
>>  
>> +       for (i = 0; i < desc->num_icc_clks; i++) {
>> +               if (!desc->icc_clks[i])
>> +                       continue;
>> +
>> +               ret = clk_smd_rpm_handoff(desc->icc_clks[i]);
> 
> This API can probably take a const struct clk_smd_rpm pointer as well.
It would be great, but ideally we want to set r->enabled in that func
for !bus clocks (for unused clk cleanup). I could probably introduce a
separate function for the icc clocks that takes const.

Konrad
