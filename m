Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 836A7526A49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 21:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383867AbiEMTUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 15:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383682AbiEMTTu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 15:19:50 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD757393E3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 12:18:43 -0700 (PDT)
Received: from [192.168.1.101] (abxh168.neoplus.adsl.tpnet.pl [83.9.1.168])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7A98F3F401;
        Fri, 13 May 2022 21:18:37 +0200 (CEST)
Message-ID: <89049083-9336-7490-ff89-f4337d4cea1a@somainline.org>
Date:   Fri, 13 May 2022 21:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 5/5] arm64: dts: qcom: sdm660: Add initial Inforce
 IFC6560 board support
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
 <20220503220927.960821-6-dmitry.baryshkov@linaro.org>
 <0574f34c-b898-8ccb-05bd-6e3d454fee2c@somainline.org>
 <ae909313-ef7a-5c40-55b8-a1a802b6cdd5@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <ae909313-ef7a-5c40-55b8-a1a802b6cdd5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.05.2022 00:58, Dmitry Baryshkov wrote:
> On 04/05/2022 19:17, Konrad Dybcio wrote:
>>
>> On 04/05/2022 00:09, Dmitry Baryshkov wrote:
>>> The IFC6560 is a board from Inforce Computing, built around the SDA660
>>> SoC. This patch describes core clocks, some regulators from the two
>>> PMICs, debug uart, storage, bluetooth and audio DSP remoteproc.
>>>
>>> The regulator settings are inherited from prior work by Konrad Dybcio
>>> and AngeloGioacchino Del Regno.
>>>
>>> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>   .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 455 ++++++++++++++++++
>>>   2 files changed, 456 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index f9e6343acd03..5f717fe0e8d0 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -88,6 +88,7 @@ dtb-$(CONFIG_ARCH_QCOM)    += 
> 
> [skipped]
> 
>>> +
>>> +/* BAM DMA doesn't seem to work on the board */
>> I wonder if these are configured differently on your firmware.. what if you remove the `qcom,controlled-remotely` property, or in case that doesn't work, swap out the BAM clock for a fake one, like xo_board?
> 
> You know, replacing BAM clock with xo_board makes the devices probe and work. So does adding interconnects property (together with Bhupeshe's patches which didn't land for some reason). I think I will override just the clocks for now and update the core dtsi once the [1] gets merged.
Hm, perhaps that clock should be marked as protected on this board then, since interactions with it can cause the board to hang.. Can you read the rate in, for example, debugfs without it going crazy?

> 
> [1] https://lore.kernel.org/linux-arm-msm/20211110105922.217895-14-bhupesh.sharma@linaro.org/
> 
>>> +&blsp1_dma {
>>> +    status = "disabled";
>>> +};
>>
>> This reference should come before blsp1_i2c6 alphabetically
>>
>>
> 
> [skipped]
> 
> 
>>> +
>>> +&mdp {
>>> +    status = "okay";
>>> +};
>>
>> MDP should be always enabled in SoC DTSI instead, as MDSS is borderline useless without it..
> 
> I see your point. sdm845 doesn't disable it, but later platforms (sc7180/sc7280/sm8250) disable mdp and require enabling it explicitly in the board files. I'd tend to follow the example of the later platforms. Not to mention that sdm630.dtsi already contains 'status="disabled"' for this device.
845 and 8250 do not, I changed that myself some time ago :P As for sc7x80, I just haven't gotten to play with these just yet..

Konrad
> 
>>> +
>>> +&mdss {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&mmss_smmu {
>>> +    status = "okay";
>>> +};
>>
>> ..and same goes for all the SMMUs (but that's a nit for the future, as I mentioned in one of the previous emails)
> 
> Yes.
> 
> [skipped]
> 
> 
