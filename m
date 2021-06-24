Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780FB3B3997
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 00:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbhFXXBf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 19:01:35 -0400
Received: from m-r2.th.seeweb.it ([5.144.164.171]:33455 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhFXXBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 19:01:34 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A56BE3F4E6;
        Fri, 25 Jun 2021 00:59:13 +0200 (CEST)
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
 <CAL_JsqLWqtAtqLRF-MAnq80NMfD0a+CfWPv8JWjjNTJFgMjCxg@mail.gmail.com>
 <CABb+yY0sdSinTm788pMFrqEZ6QMC2OwCP7Kkto+pG9h1aGMzwQ@mail.gmail.com>
 <CAL_JsqKdoMwpL_tYC7VQRAG2AC5nR4diShMQCgDseObcgU+egQ@mail.gmail.com>
 <YNEiUMBqGAx1zLVX@yoga>
 <CABb+yY2wy4iSKjn+SihQ=FE=YwcEzUNOpGw_CV22Anzgbba8hA@mail.gmail.com>
 <YNFKpvhXyZbs8RE1@yoga>
 <CABb+yY3RpQYvNBHvpwZearpBPph0uj8YQwX2qu=TX=QAO6OFBw@mail.gmail.com>
 <YNFegmmCzk6JUTN+@yoga> <9aae3092-2e2b-9261-f4e7-864b873eb2d4@somainline.org>
 <YNT0HPOJEoJYipyE@yoga>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <b0ed9294-e4e1-3185-d81f-63e6e8d45692@somainline.org>
Date:   Fri, 25 Jun 2021 00:59:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YNT0HPOJEoJYipyE@yoga>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 24/06/21 23:07, Bjorn Andersson ha scritto:
> On Tue 22 Jun 09:36 CDT 2021, AngeloGioacchino Del Regno wrote:
> 
>> Il 22/06/21 05:52, Bjorn Andersson ha scritto:
>>> On Mon 21 Jun 22:34 CDT 2021, Jassi Brar wrote:
>>>
>>>> On Mon, Jun 21, 2021 at 9:27 PM Bjorn Andersson
>>>> <bjorn.andersson@linaro.org> wrote:
>>>>>
>>>>> On Mon 21 Jun 20:00 CDT 2021, Jassi Brar wrote:
>>>>>
>>>>>> On Mon, Jun 21, 2021 at 6:35 PM Bjorn Andersson
>>>>>> <bjorn.andersson@linaro.org> wrote:
>>>>>>>
>>>>>>> On Mon 21 Jun 18:19 CDT 2021, Rob Herring wrote:
>>>>>>>
>>>>>>>> On Mon, Jun 21, 2021 at 5:10 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>> On Mon, Jun 21, 2021 at 2:46 PM Rob Herring <robh+dt@kernel.org> wrote:
>>>>>>>>>>
>>>>>>>>>> On Sun, Jun 20, 2021 at 10:03 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> On Sat, Jun 12, 2021 at 4:46 AM Martin Botka
>>>>>>>>>>> <martin.botka@somainline.org> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> This commit adds compatible for the SM6125 SoC
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Martin Botka <martin.botka@somainline.org>
>>>>>>>>>>>> ---
>>>>>>>>>>>> Changes in V2:
>>>>>>>>>>>> None
>>>>>>>>>>>> Changes in V3:
>>>>>>>>>>>> Change compatible to apcs-hmss-global
>>>>>>>>>>>>    drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
>>>>>>>>>>>>    1 file changed, 5 insertions(+)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>>>>>>>>>>>> index f25324d03842..f24c5ad8d658 100644
>>>>>>>>>>>> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>>>>>>>>>>>> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>>>>>>>>>>>> @@ -57,6 +57,10 @@ static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
>>>>>>>>>>>>           .offset = 8, .clk_name = NULL
>>>>>>>>>>>>    };
>>>>>>>>>>>>
>>>>>>>>>>>> +static const struct qcom_apcs_ipc_data sm6125_apcs_data = {
>>>>>>>>>>>> +       .offset = 8, .clk_name = NULL
>>>>>>>>>>>> +};
>>>>>>>>>>>> +
>>>>>>>>>>>>    static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
>>>>>>>>>>>>           .offset = 12, .clk_name = NULL
>>>>>>>>>>>>    };
>>>>>>>>>>>> @@ -166,6 +170,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>>>>>>>>>>>>           { .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
>>>>>>>>>>>>           { .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
>>>>>>>>>>>>           { .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
>>>>>>>>>>>> +       { .compatible = "qcom,sm6125-apcs-hmss-global", .data = &sm6125_apcs_data },
>>>>>>>>>>>>           { .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>>>>>>>>>>>>           { .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
>>>>>>>>>>>>           {}
>>>>>>>>>>>>
>>>>>>>>>>> These all are basically different names for the same controller.
>>>>>>>>>>> The 'offset' is a configuration parameter and the 'clock', when NULL,
>>>>>>>>>>> is basically some "always-on" clock.
>>>>>>>>>>> I am sure we wouldn't be doing it, if the controller was third-party.
>>>>>>>>>>
>>>>>>>>>> If newer implementations are 'the same', then they should have a
>>>>>>>>>> fallback compatible to the existing one that is the same and no driver
>>>>>>>>>> change is needed. If the differences are board or instance (within an
>>>>>>>>>> SoC) specific, then a DT property would be appropriate.
>>>>>>>>>>
>>>>>>>>> The controllers (13 now) only differ by the 'offset' where the
>>>>>>>>> registers are mapped. Clock-name is a pure s/w artifact.
>>>>>>>>> So, maybe we could push all these in DT.
>>>>>>>>
>>>>>>>> Why is 'reg' not used for the offset?
>>>>>>>>
>>>>>>>
>>>>>>> The DT node and its "reg" describes the whole IP block.
>>>>>>>
>>>>>>> The particular register that we care of has, as you can see, moved
>>>>>>> around during the various platforms and some incarnations of this IP
>>>>>>> block provides controls for CPU-related clocks as well.
>>>>>>>
>>>>>>> We can certainly have the multiple compatible points to the same
>>>>>>> apcs_data, but I'm not able to spot a reasonable "catch-all compatible"
>>>>>>> given that I don't see any natural groupings.
>>>>>>>
>>>>>> Any platform that comes later may reuse the already available compatible.
>>>>>> For example drop this patch and reuse "qcom,sdm660-apcs-hmss-global" ?
>>>>>>
>>>>>
>>>>> The problem is that this would change the meaning of
>>>>> "qcom,sdm660-apcs-hmss-global" from meaning "The apcs hmss global block
>>>>> _in_ sdm660" to "any random apcs block with the mailbox register at
>>>>> offset 8".
>>>>>
>>>> To me, the deeper problem seems to be naming a controller "The apcs
>>>> hmss global block _in_ sdm660" just because the h/w manual hasn't
>>>> given a name to it.  But that is okay too, if we name the subsequent
>>>> controllers as "the same as one in sdm660" and provide the h/w
>>>> configuration 'offset' via a DT property.
>>>>
>>>
>>> As I said, I'd need to dig through the hardware documentation for the
>>> various platforms to see if I can find what the common denominators are.
>>> We've always seen this as "the apcs hmss global block _in_ <platform>".
>>>
>>>>>>>> In any case, we can't really get rid of the first 13 instances though...
>>>>>>>>
>>>>>>>
>>>>>>> Right, we have the problem that we have DTBs out there that relies on
>>>>>>> these compatibles, but as Jassi requests we'd have to start describing
>>>>>>> the internal register layout in DT - which this binding purposefully
>>>>>>> avoids.
>>>>>>>
>>>>>> Not these strings, but 'offset' and 'clock-name' as optional
>>>>>> properties that new platforms can use.
>>>>>>
>>>>>
>>>>> Relying on completely generic compatibles to match the driver and then
>>>>> distinguish each platform using additional properties is exactly what
>>>>> Qualcomm does downstream.  The community has clarified countless times
>>>>> that this is not the way to write DT bindings.
>>>>>
>>>> Yes, and I don't suggest it otherwise. For h/w quirks and
>>>> extra/missing features, it does make sense to have different
>>>> compatibles.
>>>>
>>>
>>> But what you're suggesting assumes that they are the same and that we're
>>> done implementing all the software for this block. The platform specific
>>> compatible allows us to postpone that question.
>>>
>>>> However, for _trivial_ variations let us get that value from DT.
>>>> 'offset' is anyway a h/w property.
>>>> That way we won't be distinguishing platforms using dt properties, but
>>>> only support different platforms seamlessly.
>>>>
>>>
>>> As I said previously, this goes against the direction provided by the DT
>>> maintainers. If a property is platform specific this should be expressed
>>> by the compatible.
>>>
>>>> On second thought, we have grown from 2 to 13 aliases in 4 yrs. I only
>>>> have to ignore 3 times/annum to lead a peaceful life ;)
>>>>
>>>
>>> True, but I'll try to find some time to see if we have some reuse of the
>>> IP block to allow us to use some generic compatible.
>>>
>>> We'd still need a patch in the DT binding for every single platform, but
>>> we should be able to avoid the compatible additions in the driver.
>>>
>>
>> Hello Jassi, Bjorn
>>
>> I've read the entire thread and I can't say that Jassi is entirely wrong
>> but I also agree with Bjorn on this matter.
>>
>> This driver is here to "simply" manage the register offset in the APCS
>> IP, which is a pretty straightforward operation.
>> If you check in this driver, you will see that there's not much
>> duplication between the various qcom_apcs_ipc_data that we have for
>> all the different SoCs.
>>
>> Checking further, we can effectively reduce the amount of compatibles
>> in this driver by simply removing some "duplicated" instances and in
>> particular:
>> ipq6018, ipq8074, msm8916, msm8994, msm8998, sdm660
>>
>> and eventually replacing them with either of:
>> - 8bits_apcs_data    qcom,apcs-apps-global-8bit
>>                       qcom,apcs-kpss-global-8bit
> 
> I don't like those compatibles, simply because the binding is supposed
> to describe the hardware block, not the fact that Linux _currently_ only
> pokes this one register.
> 

Since you've immediately misunderstood my naming, yeah, that wouldn't be
the best thing to use as a compatible.

> We could probably "qcom,apss-global" as a catch-all for at least sc7180,
> sc7280, sdm845, sm8150, sm8250 and sm8350.
> 

Doesn't look like a bad idea, but if we want to *enforce* writing also
the platform-specific compatible, I can see patch series going back
and forth and getting refused because this will not be really understood
by everyone, I think.
In this case, if writing the platform compatible is something mandatory,
the only way to really make sure to avoid losing time with reviews like
"[...] here you have to write also the platform compatible", is to just
keep the thing as it is.

> But look at 8996 and 8998, both named "something-hmss-something", with
> different register layout. And a quick glance seems to indicate that
> sdm660 isn't a hmss after all :/
> 

Starting from the fact that I don't clearly remember what-when-why of
my research done more than one year ago, I do remember that conclusion
was that, in this regard, SDM630/660 were "mostly the same" as MSM8998.
In any case, this is something that, at this point, is better get
verified, maybe.

> But introducing qcom,apss-global should catch a bunch of the newer
> platforms.
> 
> 
> On the DT binding side we still need the platform-specific ones and we
> need each one to be added to the binding regardless of the catch-all in
> the driver.
> 
> Regards,
> Bjorn
> 
>> - more_appropriate_name_apcs_data qcom,(...blah)
>>
>> This would mean that we would have to use a generic "qcom,apcs-clk" as
>> the clk_name, but no other modifications would be done, apart checking
>> the return value to choose whether to print or not the dev_err when the
>> clock name is specified but not present in dt, since the driver is
>> already actually covering this case.
>>
>> That would make us able to reduce the compatibles from 6 to 2, relative
>> to the aforementioned SoC specific bindings.
>> I'm positive that, through time, when new SoCs arrive, we would avoid
>> getting this compatible list to be megabytes long...
>>
>> Right now it's not an issue, but since Qualcomm SoCs are now being very
>> actively upstreamed, I can see this coming in the future, somehow.
>>
>>
>> Of course this means that we're getting some fair amount of patch-noise
>> in the mailing lists, since all qcom dtsi files will have to be changed,
>> but that shouldn't really be a problem, I guess.
>>
>> I'm sure that I'm not the only one with such a "wow-idea" in mind :)
>>
>> Yours,
>> - Angelo
>>
>>> Regards,
>>> Bjorn
>>>
>>

