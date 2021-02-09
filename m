Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13042315007
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 14:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhBINUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 08:20:23 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:49789 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbhBINUU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 08:20:20 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 708C03EEB8;
        Tue,  9 Feb 2021 14:19:37 +0100 (CET)
Subject: Re: [PATCH v2 07/11] clk: qcom: mmcc-msm8998: Set
 CLK_GET_RATE_NOCACHE to pixel/byte clks
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
 <20210114221059.483390-8-angelogioacchino.delregno@somainline.org>
 <161280847912.76967.9613917615673032246@swboyd.mtv.corp.google.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <eae79cc3-f857-d39e-5257-c6aa263eaf07@somainline.org>
Date:   Tue, 9 Feb 2021 14:19:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161280847912.76967.9613917615673032246@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 08/02/21 19:21, Stephen Boyd ha scritto:
> Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:55)
>> The pixel and byte clocks rate should not be cached, as a VCO shutdown
>> may clear the frequency setup and this may not be set again due to the
>> cached rate being present.
>> This will also be useful when shadow clocks will be implemented in
>> the DSI PLL for seamless timing/resolution switch.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   drivers/clk/qcom/mmcc-msm8998.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> We didn't do this on sdm845, so I'm not going to apply this patch. The
> rate caching thing is a problem with the display driver that should be
> fixed some other way vs. setting nocache here.
> 

Ok, I agree.
