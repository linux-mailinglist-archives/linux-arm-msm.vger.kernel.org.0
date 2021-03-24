Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A9A347EFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 18:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237242AbhCXRM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 13:12:57 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:40917 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237099AbhCXRMp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 13:12:45 -0400
Received: from [192.168.1.101] (abab43.neoplus.adsl.tpnet.pl [83.6.165.43])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6FF621F69D;
        Wed, 24 Mar 2021 18:12:35 +0100 (CET)
Subject: Re: [PATCH 9/9] clk: qcom: gcc-msm8994: Add a quirk for a different
 SDCC configuration
To:     Rob Herring <robh@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210313021919.435332-1-konrad.dybcio@somainline.org>
 <20210313021919.435332-9-konrad.dybcio@somainline.org>
 <20210324171117.GA3260515@robh.at.kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <3947caa6-71fb-371c-cf8e-78348435c830@somainline.org>
Date:   Wed, 24 Mar 2021 18:12:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324171117.GA3260515@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 24.03.2021 18:11, Rob Herring wrote:
> On Sat, Mar 13, 2021 at 03:19:18AM +0100, Konrad Dybcio wrote:
>> Some devices come with a different SDCC clock configuration,
>> account for that.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> ---
>>  .../bindings/clock/qcom,gcc-msm8994.yaml         |  4 ++++
>>  drivers/clk/qcom/gcc-msm8994.c                   | 16 ++++++++++++++++
>>  2 files changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
>> index f8067fb1bbd6..9db0800a4ee4 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
>> @@ -49,6 +49,10 @@ properties:
>>      description:
>>        Protected clock specifier list as per common clock binding.
>>  
>> +  qcom,sdcc2-clk-src-40mhz:
>> +    description: SDCC2_APPS clock source runs at 40MHz.
>> +    type: boolean
> Why don't you have some input clock you can get the rate from?


This is a SONY-custom hardware change and that's as much information as I can get. Schematics are not available and it's solely based on the downstream kernel source.


Konrad

