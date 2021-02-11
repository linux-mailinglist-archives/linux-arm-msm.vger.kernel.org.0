Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F0A31955B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 22:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhBKVq5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 16:46:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhBKVq5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 16:46:57 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9AF9C061786
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 13:46:16 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E47B21F625;
        Thu, 11 Feb 2021 22:46:14 +0100 (CET)
Subject: Re: [PATCH v2 5/9] clk: qcom: rcg2: Stop hardcoding gfx3d pingpong
 parent numbers
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
 <20210113183817.447866-6-angelogioacchino.delregno@somainline.org>
 <161307478271.1254594.18219937886787415438@swboyd.mtv.corp.google.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <2fb677ae-03ac-58a9-4b6e-c0c40b9a8e0d@somainline.org>
Date:   Thu, 11 Feb 2021 22:46:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161307478271.1254594.18219937886787415438@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 11/02/21 21:19, Stephen Boyd ha scritto:
> Quoting AngeloGioacchino Del Regno (2021-01-13 10:38:13)
>> The function clk_gfx3d_determine_rate is selecting different PLLs
>> to manage the GFX3D clock source in a special way: this one needs
>> to be ping-pong'ed on different PLLs to ensure stability during
>> frequency switching (set a PLL rate, let it stabilize, switch the
>> RCG to the new PLL) and fast frequency transitions.
>>
>> This technique is currently being used in the MSM8996 SoC and the
>> function was assuming that the parents were always at a specific
>> index in the parents list, which is TRUE, if we use this only on
>> the MSM8996 MMCC.
>> Unfortunately, MSM8996 is not the only SoC that needs to ping-pong
>> the graphics RCG, so choices are:
>> 1. Make new special ops just to hardcode *again* other indexes,
>>     creating code duplication for (imo) no reason; or
>> 2. Generalize this function, so that it becomes usable for a range
>>     of SoCs with slightly different ping-pong configuration.
>>
>> In this commit, the second road was taken: define a new "special"
>> struct clk_rcg2_gfx3d, containing the ordered list of parents to
>> ping-pong the graphics clock on, and the "regular" rcg2 clock
>> structure in order to generalize the clk_gfx3d_determine_rate
>> function and make it working for other SoCs.
>>
>> As for the function itself it is left with the assumption that we
>> need to ping-pong over three parents. The reasons for this are:
>> 1. The initial model was MSM8996, which has 3 parents for the
>>     graphics clock pingpong;
>> 2. The other example that was taken into consideration is the
>>     SDM630/636/660 SoC gpu clock controller, which is ping-ponging
>>     over two dynamic clocked and one fixed clock PLL.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
> 
> Applied to clk-next but I modified it a bunch. Let me know if it doesn't
> work.
> 

Will check asap!
