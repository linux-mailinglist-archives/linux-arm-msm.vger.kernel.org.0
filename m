Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3065A3F8E9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 21:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243479AbhHZTRu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 15:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243458AbhHZTRt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 15:17:49 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA693C061757;
        Thu, 26 Aug 2021 12:17:01 -0700 (PDT)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D2BE91FABC;
        Thu, 26 Aug 2021 21:16:57 +0200 (CEST)
Subject: Re: [PATCH v2] clk: qcom: gcc-sdm660: Replace usage of parent_names
To:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
References: <20210825204517.1278130-1-bjorn.andersson@linaro.org>
 <163000363556.1317818.13808174908685575043@swboyd.mtv.corp.google.com>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <08618b13-816b-7fc3-6ee6-fc222aef0607@somainline.org>
Date:   Thu, 26 Aug 2021 21:16:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163000363556.1317818.13808174908685575043@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 8/26/21 8:47 PM, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2021-08-25 13:45:17)
>> Using parent_data and parent_hws, instead of parent_names, does protect
>> against some cases of incompletely defined clock trees. While it turns
>> out that the bug being chased this time was totally unrelated, this
>> patch converts the SDM660 GCC driver to avoid such issues.
>>
>> The "xo" fixed_factor clock is unused within the gcc driver, but
>> referenced from the DSI PHY. So it's left in place until the DSI driver
>> is updated.
>>
>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
> 
> Applied to clk-next after moving back the arrays so the diff is smaller.
> 

Unfortunately the arrays cannot be moved back up since they (for the 
most part) reference gpll clocks in `.hw = &gpll*` fields - these have 
to be defined first or forward-declared otherwise, which is why the 
arrays were moved down in the first place.

The general structure nowadays seems to place these parent maps/data 
right above the clock that uses them, making it easier to read.

- Marijn
