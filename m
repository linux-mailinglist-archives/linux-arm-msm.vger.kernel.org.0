Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 516E4532FB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 May 2022 19:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240035AbiEXRli (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 13:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240005AbiEXRlg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 13:41:36 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDEE27FEA
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 10:41:34 -0700 (PDT)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl [194.29.137.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E53323F685;
        Tue, 24 May 2022 20:03:46 +0200 (CEST)
Message-ID: <c240075d-55d1-28f6-18ad-3897e55f8e59@somainline.org>
Date:   Tue, 24 May 2022 19:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] clk: qcom: camcc-sm8250: Fix halt on boot by reducing
 driver's init level
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
 <6cb75a3e-49fd-bbe0-4e81-d6aec33b70a5@somainline.org>
 <c1f4cfa7-f7f3-a72a-b48b-97071906398c@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <c1f4cfa7-f7f3-a72a-b48b-97071906398c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 18/05/2022 19:24, Vladimir Zapolskiy wrote:
> Hi Konrad,
>
> On 5/18/22 19:47, Konrad Dybcio wrote:
>>
>> On 18/05/2022 12:35, Vladimir Zapolskiy wrote:
>>> Access to I/O of SM8250 camera clock controller IP depends on enabled
>>> GCC_CAMERA_AHB_CLK clock supplied by global clock controller, the 
>>> latter
>>> one is inited on subsys level, so, to satisfy the dependency, it would
>>> make sense to deprive the init level of camcc-sm8250 driver.
>>
>> Hi,
>>
>> I believe this is due to the fact that this clock is falsely advertised
>> by the header and Linux does not know anything about it, because it is
>> handled by a magic write [1] (as I once said in a similar case, this was
>> going bite eventually..) instead and the index corresponding to the
>> define symbol is not initialized, hence it points to NULL. Adding the
>
> your observation is correct in my opinion, however it does not change the
> identified root cause of the problem, and my rationale remains the same,
> the camera clock controller should be initialized after the GCC, thus
> this change, and currently the critical fix, remains valid.
>
>> clock properly in GCC would let the OF clock stuff handle it gracefully.
>
> If/when the clock is properly added in the GCC, then it will open an
> option to clk_prepare_enable() it in the CAMCC driver, so at least it's
> a point to keep it described in a dts as it's done right from the 
> beginning,
> especially because the platform dtsi describes the hardware properly.
> To add a real CCF clock would be my preference, but, as I've said above,
> even if it happens, it does not belittle the presented change.
>
>> If that is the case, your patch disabling the clock controller block
>> (which I'm against unless there's abosolute need, as having the hw block
>> initialized properly should be possible regardless of the board, as it's
>> a generic SoC components) should not be necessary.
>
> Here I do oppose, I believe board dts files should explicitly describe
> enabled IPs in accordance to actual board peripherals. For instance it's
> unclear why CAMCC or e.g. CAMSS should be enabled by default on a board
> without camera sensors at all. I understand that there is an option to
> explicitly disable some particular device tree nodes in board files, but
> it is against common practicalities.
>
> Also above I do neglect the fact that the GCC clock is always enabled,
> irrelatively of its actual usage by probably disabled CAMCC.

I think there's an opportunity to save some power here by keeping the 
camss ahb disabled by default.. That would include removing the magic 
write from gcc probe, adding the gcc ahb as a proper clock and adding a 
camss consumer to it (possibly with both fw_name and name fields in 
parent_data to keep backwards compat, even though i don't think any 
board uses camera hw upstream, so we may break it here with a good 
justification). Then we could keep camcc enabled by default on all 
boards, and if there are no users, the clocks would just be parked to xo 
or disabled entirely, instead of inheriting an unknown configuration.


Konrad

>
> -- 
> Best wishes,
> Vladimir
>
>> That said, I can not test my theory right now.
>>
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/clk/qcom/gcc-sm8250.c?h=next-20220518#n3647 
>>
>>
>> Konrad
>>
>>>
>>> If both drivers are compiled as built-in, there is a change that a 
>>> board
>>> won't boot up due to a race, which happens on the same init level.
>>>
>>> Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver 
>>> for SM8250")
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>    drivers/clk/qcom/camcc-sm8250.c | 12 +-----------
>>>    1 file changed, 1 insertion(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/camcc-sm8250.c 
>>> b/drivers/clk/qcom/camcc-sm8250.c
>>> index 439eaafdcc86..ae4e9774f36e 100644
>>> --- a/drivers/clk/qcom/camcc-sm8250.c
>>> +++ b/drivers/clk/qcom/camcc-sm8250.c
>>> @@ -2440,17 +2440,7 @@ static struct platform_driver 
>>> cam_cc_sm8250_driver = {
>>>        },
>>>    };
>>>    -static int __init cam_cc_sm8250_init(void)
>>> -{
>>> -    return platform_driver_register(&cam_cc_sm8250_driver);
>>> -}
>>> -subsys_initcall(cam_cc_sm8250_init);
>>> -
>>> -static void __exit cam_cc_sm8250_exit(void)
>>> -{
>>> -    platform_driver_unregister(&cam_cc_sm8250_driver);
>>> -}
>>> -module_exit(cam_cc_sm8250_exit);
>>> +module_platform_driver(cam_cc_sm8250_driver);
>>>       MODULE_DESCRIPTION("QTI CAMCC SM8250 Driver");
>>>    MODULE_LICENSE("GPL v2");
>>>
