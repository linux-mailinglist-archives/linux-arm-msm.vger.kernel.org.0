Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5243314FFE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 14:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhBINTH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 08:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbhBINTB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 08:19:01 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE632C06178B;
        Tue,  9 Feb 2021 05:18:19 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 94E453E7E2;
        Tue,  9 Feb 2021 14:18:15 +0100 (CET)
Subject: Re: [PATCH v2 11/11] clk: qcom: gpucc-msm8998: Allow fabia gpupll0
 rate setting
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
 <20210114221059.483390-12-angelogioacchino.delregno@somainline.org>
 <161280865244.76967.4923517866545833837@swboyd.mtv.corp.google.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <a9593d00-3ab4-4833-0bf5-516cf432ba48@somainline.org>
Date:   Tue, 9 Feb 2021 14:18:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161280865244.76967.4923517866545833837@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 08/02/21 19:24, Stephen Boyd ha scritto:
> Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:59)
>> The GPU PLL0 is not a fixed PLL and the rate can be set on it:
>> this is necessary especially on boards which bootloader is setting
>> a very low rate on this PLL before booting Linux, which would be
>> unsuitable for postdividing to reach the maximum allowed Adreno GPU
>> frequency of 710MHz (or, actually, even 670MHz..) on this SoC.
>>
>> To allow setting rates on the GPU PLL0, also define VCO boundaries
>> and set the CLK_SET_RATE_PARENT flag to the GPU PLL0 postdivider.
>>
>> With this change, the Adreno GPU is now able to scale through all
>> the available frequencies.
> 
> BTW, you're probably undervolting your GPU and clocking it higher
> than it should be at the voltage from boot.
> 

Thanks for the consideration, but that's not the case, locally ;)

>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   drivers/clk/qcom/gpucc-msm8998.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
>> index 1a518c4915b4..fedfffaf0a8d 100644
>> --- a/drivers/clk/qcom/gpucc-msm8998.c
>> +++ b/drivers/clk/qcom/gpucc-msm8998.c
>> @@ -50,6 +50,11 @@ static struct clk_branch gpucc_cxo_clk = {
>>          },
>>   };
>>   
>> +static struct pll_vco fabia_vco[] = {
> 
> Should be const.
> 

Ack!

>> +       { 249600000, 2000000000, 0 },
>> +       { 125000000, 1000000000, 1 },
>> +};
>> +
>>   static const struct clk_div_table post_div_table_fabia_even[] = {
>>          { 0x0, 1 },
>>          { 0x1, 2 },

