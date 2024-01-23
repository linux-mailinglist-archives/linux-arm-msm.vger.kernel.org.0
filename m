Return-Path: <linux-arm-msm+bounces-7982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8AC8393C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D87611F212F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 15:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBFA5FEF2;
	Tue, 23 Jan 2024 15:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FXwezFBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912B15FF0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 15:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706024961; cv=none; b=Dvp059g/NK6W5o5h6LGFyPXIT4DQc2QRHs7Sf6qVS10MY8f18uu2xvqVanDdAaadPKFGxPKbvnY7H9oPTQz8hCzCwe797qBdWl1G5i5m+HwfF5VVeMjWZDugrN10lXEQWIFPPLqbIurD9/XrK6eRPKOXYPw4QP8i83VcVXZJkRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706024961; c=relaxed/simple;
	bh=W/Q8+hIAfvWD3IeiPkdH00K2CKwKc05dTxcLD2HHPRI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fAXxLCn53YE7IYP5thCtP3PcuFhI9TMtVYYC2LdP6+DUFmc7pe3zzUIS0VsNzW8aQkDc4q6AbKnUmLuhWTzBbVeaApfP/K7M4Up/n++wfYPM05O1uRF6cfsz2wUbABMecZVUFpDj0i2yBhla2eV87j5361bGy8VV4Bpbp9QNxy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FXwezFBu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33924df7245so3279308f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 07:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706024957; x=1706629757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3q1p3YuFo/mOojuPfYR+KIg+iLfaq0IvWE/p5cieFE=;
        b=FXwezFBuHz3lZP+c9ZxUhmvzjx1HGRptrum/KeWFHrptmEZ82uoOZZ9jjchxW9FWGC
         7c31jF880BwvgFIBXwHoDKMSNCZJmbhWE99t9rZodS6u1CqCH+DvT89HuWWTiPE8mlGW
         Sx0QRoZWsgkT1H19kbI3X3dyG7z5EBWCHECSGuHMjAd1HHabBudVP89rdNifJtmjxdFg
         RDOivfvMZKYGDDP0kydw9C0GRc895BcBIDulFogaKyTFZi7cYaNo8jtG1pXnb1Wpx6Au
         jSHTd+z/AtEP8sz+IfhcjhDq0EzsL4CEXghziDtmqpRGl3AYxg+93+2ac43RTBeXApms
         oJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706024957; x=1706629757;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C3q1p3YuFo/mOojuPfYR+KIg+iLfaq0IvWE/p5cieFE=;
        b=CMEbn2avdhLkWE45tq+ErCa9CulK92DXdL4rZtDVPCAi3KGzyT0Eyp/ivA3MaYR/tH
         kJHJ0L1fKGQIRm/LelAu/WraXnHY7ekb8Mc+mtub9dPuWA5PP24pI4KmPC9Vp2YA95fS
         TWh6CMyDWJD9rx4k1W2QXPJYC4dZMy/PDsumyk4iMk7fQbn9g7FBjcULeC4aCCQN3zff
         ii5JTIaw+qfbSt8fHvY+GpuRuWtxGCE9lg0nVcE3tG7qBfEd0ta5evpfcaEsICvKaCmH
         bX6jHwZLZ3CQz8NL1Kg4xK5+LcgNxzO8Ea9e+M658mMr8aO0RIdvKtqhJ7OzRZ0BUTP9
         xszA==
X-Gm-Message-State: AOJu0YxOox2G4Y5CddhZblYQ+9juxSy0z5mX9744NsbCZLh5sRGjjGBN
	h5Yc/oBq0RHm7ICC4Xa2iFRfwvvCBISVYJeo+IlL495lKxCXpFlGGjC8oRn5vxKmOFipjRnlCI9
	F/uO9gg==
X-Google-Smtp-Source: AGHT+IHs1L2yO9ocstNpl+s1UrGsIvn58RlV04/exn4UOqrRZALsey0iqiYMJniRhT0iZUU6iMIxgA==
X-Received: by 2002:adf:fe09:0:b0:337:be35:f698 with SMTP id n9-20020adffe09000000b00337be35f698mr3030943wrr.72.1706024956547;
        Tue, 23 Jan 2024 07:49:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1892:c253:b69f:39e8? ([2a01:e0a:982:cbb0:1892:c253:b69f:39e8])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4d11000000b003392af92996sm8702777wrt.101.2024.01.23.07.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 07:49:16 -0800 (PST)
Message-ID: <6786954e-096c-4216-94a4-71f090d7eead@linaro.org>
Date: Tue, 23 Jan 2024 16:49:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [RFC] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
Content-Language: en-US, fr
To: Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Alex Elder <elder@linaro.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240122182158.69183-1-brgl@bgdev.pl>
 <u5kvv3iip552yb5ykc4t2arfry2t7f34hwmemd7z6qfw677fs6@ldlwoycyacrm>
 <CAMRc=MeT08vUUqJmtVCP=kSUrbsoKFHP6gHgJPtqztC593oGpQ@mail.gmail.com>
 <2d36zymagbran5m7ggcmy2zmtpt7xpefgys7rebbwydz5bpux2@svlv75ctdow5>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <2d36zymagbran5m7ggcmy2zmtpt7xpefgys7rebbwydz5bpux2@svlv75ctdow5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/01/2024 16:34, Bjorn Andersson wrote:
> On Tue, Jan 23, 2024 at 10:22:33AM +0100, Bartosz Golaszewski wrote:
>> On Tue, Jan 23, 2024 at 5:47 AM Bjorn Andersson <andersson@kernel.org> wrote:
>>>
>>> On Mon, Jan 22, 2024 at 07:21:58PM +0100, Bartosz Golaszewski wrote:
>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>
>>>> I'm limiting the audience of this compared to the PCI power sequencing
>>>> series as I wanted to run the DT part by the maintainers before I commit
>>>> to a doomed effort.
>>>>
>>>
>>> With linux-arm-msm and deviectree in there, you have a fairly big
>>> limited audience... I think if anything, your proposal is doomed by the
>>> lack of a proper commit message describing what this is.
>>>
>>
>> By limiting I meant compared to the PCI power sequencing series but
>> you're right, I should have linked that series in here. In any case -
>> this is not intended for upstream, I literally wanted input on whether
>> this representation is correct before I send a PoC of the pwrseq
>> subsystem using it.
>>
>>> Below you'll find some questions/feedback based on our previous
>>> discussions on the topic, although I'm not able to understand the
>>> motivations behind what you propose - or even fully what it is that
>>> you're proposing.
>>>
>>>> Here is the DT representation of the QCA6390's PMU with its inputs and
>>>> outputs. If I were to implement the pwrseq framework that would be able
>>>> to assign the relevant pwrseq data to the consumer based on the actual
>>>> regulators and not abstract bt-pwrseq or wlan-pwrseq properties - would
>>>> that fly with you?
>>>>
>>>
>>> Why do you need to make up this intermediate/fake "PMU" thing? The
>>> regulators are reference counted already.
>>>
>>
>> Dmitry insists that for QCA6490 we *do* need to implement a proper
>> power sequencing with delays between enabling WLAN and BT GPIOs.
>>
>> See: https://lore.kernel.org/netdev/CAA8EJpqyK=pkjEofWV595tp29vjkCeWKYr-KOJh_hBiBbkVBew@mail.gmail.com/
>>
> 
> I had not seen that comment before, would have been excellent to include
> in your "problem description".
> 
>> Even though the regulators are reference counted, this is not enough.
>> Dmitry tried to implement a power sequencing framework some time ago
>> but the main complaint was that explicit properties like bt-pwrseq are
>> not a right fit for DT as they don't represent hardware. We still need
>> to centralize the control over the shared resources though but what I
>> want to propose is doing that with a more realistic representation of
>> HW and just reusing phandle connections between DT nodes to retrieve
>> the correct pwrseq struct in the driver. But this is implementation
>> detail and before I want to clear the HW representation with DT
>> maintainers.
>>
> 
> In my view Dmitry had at least one proposal, that was rejected, where he
> represented the qca6390 package as a thing in DeviceTree.
> 
>> Dmitry is also correct in pointing out that It's also simply an
>> incorrect representation of what is on the board as the PMU is a
>> discrete module, has its inputs and outputs, even though they're
>> inside the package.
>>
> 
> I'm not sure what you're trying to say here. There's no "PMU module" on
> the board, it's a block within the QCA6390. But perhaps that's what
> you're also saying?
> 
>>>> We'd need to deprecate the existing BT bindings but unfortunately they
>>>> are already described as consuming the host PMIC regulators in bindings.
>>>>
>>>
>>> I was under the impression that the supplies in the bluetooth binding
>>> are the supply pads of the chip. Where the power to those pads come from
>>> is not a property of the binding.
>>>
>>
>> We already model the WLAN and BT modules as separate elements even
>> though they're in the same package. For consistency we should model
>> the PMU module too.
>>
> 
> So what you're proposing is that the PMU is the consumer of the external
> supplies, and it in turn provides a set of internal power-rails which
> should be consumed by the WiFi and BT modules.
> 
> That's sounds like a plausible way to get around the problem that we
> don't want to represent a fake device in DeviceTree.
> 
> That still doesn't answer me why bluetooth suddenly now has an input
> named "vddpcie0", can you please point me to the documentation of the
> internal power routing in the QCA6390 that confirms this?
> 
>> And for the record: I would love to stick to what we have now as it
>> would make my PCI power sequencing series much easier to get upstream
>> but it will result in problems later on, I have to give it to Dmitry.
>>
>>> So what you need to do is describe why the pads suddenly changed.
>>>
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 129 +++++++++++++++++++++--
>>>>   arch/arm64/boot/dts/qcom/sm8250.dtsi     |  10 ++
>>>>   2 files changed, 128 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>>>> index cd0db4f31d4a..c9b1600c57ef 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>>>> @@ -108,6 +108,88 @@ lt9611_3v3: lt9611-3v3 {
>>>>                regulator-always-on;
>>>>        };
>>>>
>>>> +     qca6390_pmu: pmu@0 {
>>>
>>> This is not a thing.
>>>
>>
>> What isn't?
>>
> 
> My bad. You're right, there is a block in the corner of the QCA6390
> called "PMU".
> 
>>>> +             compatible = "qcom,qca6390-pmu";
>>>> +
>>>> +             pinctrl-names = "default";
>>>> +             pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
>>>> +
>>>> +             vddaon-supply = <&vreg_s6a_0p95>;
>>>> +             vddpmu-supply = <&vreg_s2f_0p95>;
>>>> +             vddrfa1-supply = <&vreg_s2f_0p95>;
>>>> +             vddrfa2-supply = <&vreg_s8c_1p3>;
>>>> +             vddrfa3-supply = <&vreg_s5a_1p9>;
>>>> +             vddpcie1-supply = <&vreg_s8c_1p3>;
>>>> +             vddpcie2-supply = <&vreg_s5a_1p9>;
>>>> +             vddio-supply = <&vreg_s4a_1p8>;
>>>> +
>>>> +             bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
>>>> +             wifi-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
>>>> +             swctrl-gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;
>>>
>>> Are these collected here because we still have convinced ourselves that
>>> they need to be handled from a common place, or did you actually find
>>> some documentation you can point to that shows this is necessary?
>>>
>>
>> So the datasheet is not clear on that but it says: "bluetooth enable
>> signal from host" and since the regulators above are also "from host"
>> I figured the best fit is here.
>>
> 
> Per Dmitry's argument that you linked above, bt-enable and wifi-enable
> should be the only things that you need to synchronize.
> 
>>>> +
>>>> +             regulators {
>>>> +                     vreg_pmu_rfa_cmn: ldo0 {
>>>> +                             regulator-name = "vreg_pmu_rfa_cmn";
>>>> +                             regulator-min-microvolt = <760000>;
>>>> +                             regulator-max-microvolt = <840000>;
>>>
>>> These limits should be applied to &vreg_s2f_0p95 (although I'm just
>>> guessing how this maps to the upstream supply...
>>
>> I'm not following. Why?
>>
> 
> Are you saying that the PMU contains a set of LDOs or similar that
> alter the voltage from what's provided on the external pads?

It's what I observe on WCN785x, on one side we have the usual VDD_AON/VDD_PMU/VDD_RFA/...
and on the other side the WCN internal PMU generates the VDDXX_PMU_XXX voltages that
are consumed by the WCN785x again.
The schematics is clearly split into different entities of the WCN785x:
- PMU
- VSS
- GND
- PWR
- CONFIG
- GPIO
- RFA
- PCIE

Neil

> 
>>>
>>>> +                     };
>>> [..]
>>>> @@ -734,6 +816,24 @@ &pcie0_phy {
>>>>        vdda-pll-supply = <&vreg_l9a_1p2>;
>>>>   };
>>>>
>>>> +&pcieport0 {
>>>> +     wifi@0 {
>>>> +             compatible = "pci17cb,1101";
>>>
>>> Does this compatible somehow bind to a entity that knows what to do with
>>> the regulators below?
>>>
>>
>> Ok, so what does that matter? This is device-tree. What linux does
>> behind the scenes is irrelevant - what is important is that there is
>> an ATH11K module here as represented by this PCI vendor/model codes
>> and that it's supplied by these regulators.
>>
> 
> I'm just making guesses about the design and how this fits into previous
> discussions on the subject of PCI power sequencing, because you didn't
> tell me what any of the things in this patch are.
> 
> Regards,
> Bjorn
> 
>> Bart
>>
>>>> +             reg = <0x10000 0x0 0x0 0x0 0x0>;
>>>> +
>>>> +             vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>>>> +             vddaon-supply = <&vreg_pmu_aon_0p59>;
>>>> +             vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>>>> +             vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>>>> +             vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
>>>> +             vddrfa0-supply = <&vreg_pmu_rfa_0p8>;
>>>> +             vddrfa1-supply = <&vreg_pmu_rfa_1p2>;
>>>> +             vddrfa2-supply = <&vreg_pmu_rfa_1p7>;
>>>> +             vddpcie0-supply = <&vreg_pmu_pcie_0p9>;
>>>> +             vddpcie1-supply = <&vreg_pmu_pcie_1p8>;
>>>> +     };
>>>> +};
>>>
>>> Regards,
>>> Bjorn
> 


