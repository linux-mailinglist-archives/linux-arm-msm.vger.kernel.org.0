Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D757E5178F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 23:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbiEBVWR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 17:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbiEBVWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 17:22:16 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A77FDBC3A
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 14:18:45 -0700 (PDT)
Received: from [192.168.1.101] (abxh26.neoplus.adsl.tpnet.pl [83.9.1.26])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1B8673F585;
        Mon,  2 May 2022 23:18:43 +0200 (CEST)
Message-ID: <5007e01d-03b0-1bab-6dae-8b24a369aee5@somainline.org>
Date:   Mon, 2 May 2022 23:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: add uart20 node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
References: <20220501195458.4134911-1-dmitry.baryshkov@linaro.org>
 <6b0ef19b-a45b-ae6f-9f6f-41e72f2c71fd@somainline.org>
 <CAA8EJpqeR8FF7V1fdyWtQsU3xnFw5+4obBSndb3wS+H8Xgu8Rw@mail.gmail.com>
 <CAA8EJpoZaWXhD7aq4fR+6atJ6oMRNmA=8GJFmtXOSSbrBez53g@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <CAA8EJpoZaWXhD7aq4fR+6atJ6oMRNmA=8GJFmtXOSSbrBez53g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2.05.2022 21:49, Dmitry Baryshkov wrote:
> On Mon, 2 May 2022 at 22:01, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Mon, 2 May 2022 at 20:59, Konrad Dybcio <konrad.dybcio@somainline.org> wrote:
>>>
>>>
>>>
>>> On 1.05.2022 21:54, Dmitry Baryshkov wrote:
>>>> Add device tree node for uart20, which is typically used for Bluetooth attachment.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 ++++++++++++++++++++++
>>>>  1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>> index 4fcb6e2b096b..8b9d9c2cd02c 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>> @@ -996,6 +996,19 @@ spi20: spi@894000 {
>>>>                               status = "disabled";
>>>>                       };
>>>>
>>>> +                     uart20: serial@894000 {
>>> I think it should come before SPI alphabetically?
>>
>> Argh. I sorted it using the label!
>>
>>>
>>>> +                             compatible = "qcom,geni-uart";
>>>> +                             reg = <0 0x00894000 0 0x4000>;
>>>> +                             clock-names = "se";
>>>> +                             clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
>>>> +                             pinctrl-names = "default";
>>>> +                             pinctrl-0 = <&qup_uart20_default>;
>>> No sleep state?
>>
>> No, uarts do not provide a sleep state.
> 
> I've checked other dts. Usually the sleep state is provided by the
> board dts rather than the SoC's dtsi.
Weird. Perhaps we could consider centralizing that, since it's common(-ish) in the end?


> 
>>
>>>
>>>> +                             interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
>>>> +                             #address-cells = <1>;
>>>> +                             #size-cells = <0>;
>>>> +                             status = "disabled";
>>>> +                     };
>>>> +
>>>>                       i2c21: i2c@898000 {
>>>>                               compatible = "qcom,geni-i2c";
>>>>                               reg = <0x0 0x00898000 0x0 0x4000>;
>>>> @@ -2757,6 +2770,15 @@ qup_uart7_tx: qup-uart7-tx {
>>>>                               drive-strength = <2>;
>>>>                               bias-disable;
>>>>                       };
>>>> +
>>>> +                     qup_uart20_default: qup-uart20-default {
>>>> +                             mux {
>>> Please drop the unnecessary mux{} here.
>>
>> Ack.
>>
>>>
>>>> +                                     pins = "gpio76", "gpio77",
>>>> +                                             "gpio78", "gpio79";
>>> I think these could fit into a single 100-char-long line>?
>>
>> I'll check.
>>
>>>
>>>> +                                     function = "qup20";
>>> Are there no default properties for this setup? I think boards that don't use standard Qualcomm connectivity setups (like Bluetooth on this specific UART) are rather scarce and it'd be more convenient to keep a standard setting here and override it where need be instead of copy-pasting the same thing over and over in 95-100% of the boards.
>>
>> I see your point. Let's do this.
> 
> Well, comparing with other SoC dtsi shows that most of them declare
> pins&functions in the dtsi and leave bias/ details to the board.dts
> (despite code duplication). So let's follow that approach.
Eh, you're right, but I'd still argue it's really a thing that used to be more relevant in the past though, especially as newer devices seem to get closer and closer to Qualcomm reference designs.. Maybe Bjorn could give some input on this matter?

Konrad

> 
>>
>>>
>>> Konrad
>>>
>>>> +                             };
>>>> +                     };
>>>> +
>>>>               };
>>>>
>>>>               apps_smmu: iommu@15000000 {
>>>>
>>
>>
>>
>> --
>> With best wishes
>> Dmitry
> 
> 
> 
