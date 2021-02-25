Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78F0325656
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 20:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233958AbhBYTLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 14:11:36 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:57319 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233956AbhBYTKI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 14:10:08 -0500
Received: from [192.168.1.101] (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 891011F678;
        Thu, 25 Feb 2021 20:09:16 +0100 (CET)
Subject: Re: [PATCH 5/6] clk: qcom: gcc-sdm660: Account for needed adjustments
 in probe function
To:     Stephen Boyd <sboyd@kernel.org>, phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210220155618.176559-1-konrad.dybcio@somainline.org>
 <20210220155618.176559-5-konrad.dybcio@somainline.org>
 <161404077336.1254594.15002572465360321874@swboyd.mtv.corp.google.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <3917fba4-e5b0-911f-9220-f401a90aac38@somainline.org>
Date:   Thu, 25 Feb 2021 20:09:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161404077336.1254594.15002572465360321874@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi and sorry for the late reply,


>> +
>> +       /* Keep bimc gfx clock port on all the time */
>> +       clk_prepare_enable(gcc_bimc_gfx_clk.clkr.hw.clk);
>> +
> Preferably just set these various bits with regmap_update_bits() during
> probe. Also, please do it before regsitering the clks, not after.

To be fair, now I think that simply adding CLK_IS_CRITICAL flag to the clocks in question is the smartest thing to do. Magic writes don't tell a whole lot.


>> +       /* Set the HMSS_GPLL0_SRC for 300MHz to CPU subsystem */
>> +       clk_set_rate(hmss_gpll0_clk_src.clkr.hw.clk, 300000000);
> Is this not already the case?


This is a mission-critical clock and we cannot trust the bootloader with setting it. Otherwise dragons might appear.


Konrad


