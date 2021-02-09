Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4336431500D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 14:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhBINUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 08:20:49 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:56273 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbhBINUr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 08:20:47 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A9CFA3EBCE;
        Tue,  9 Feb 2021 14:20:00 +0100 (CET)
Subject: Re: [PATCH v2 05/11] clk: qcom: gcc-msm8998: Mark gpu_cfg_ahb_clk as
 critical
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
 <20210114221059.483390-6-angelogioacchino.delregno@somainline.org>
 <161280832085.76967.5394456316048533384@swboyd.mtv.corp.google.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <bb7b79c8-7dc7-10ff-eabf-1e9f3ed8660a@somainline.org>
Date:   Tue, 9 Feb 2021 14:20:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161280832085.76967.5394456316048533384@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 08/02/21 19:18, Stephen Boyd ha scritto:
> Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:53)
>> The GPU IOMMU depends on this clock and the hypervisor will crash
>> the SoC if this clock gets disabled because the secure contexts
>> that have been set on this IOMMU by the bootloader will become
>> unaccessible (or they get reset).
>> Mark this clock as critical to avoid this issue when the Adreno
>> GPU is enabled.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   drivers/clk/qcom/gcc-msm8998.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
>> index c8d4c0348952..afea60a3ef43 100644
>> --- a/drivers/clk/qcom/gcc-msm8998.c
>> +++ b/drivers/clk/qcom/gcc-msm8998.c
>> @@ -2081,6 +2081,12 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk = {
>>                  .hw.init = &(struct clk_init_data){
>>                          .name = "gcc_gpu_cfg_ahb_clk",
>>                          .ops = &clk_branch2_ops,
>> +                       /*
>> +                        * The GPU IOMMU depends on this clock and hypervisor
>> +                        * will crash the SoC if this clock goes down, due to
>> +                        * secure contexts protection.
>> +                        */
>> +                       .flags = CLK_IS_CRITICAL,
>>                  },
>>          },
> 
> Please send a followup patch that hits the branch on at probe time and
> removes this clk from the kernel. That will save some memory and
> overhead of worrying about this clk.
> 

Will do!
