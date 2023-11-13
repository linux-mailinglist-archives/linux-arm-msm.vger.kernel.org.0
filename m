Return-Path: <linux-arm-msm+bounces-554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CDD7E9BA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 12:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD402B20B95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 11:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7321CFBF;
	Mon, 13 Nov 2023 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkBpdFYs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8227F1CFAC
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 11:58:47 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4015D6C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 03:58:45 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-507973f3b65so6161473e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 03:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699876724; x=1700481524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iP6G275PfhDARLAGhpGbF3e3yeogL6WcLd6tMRosXuU=;
        b=NkBpdFYsc07dsZW8soBAlu0Z1aSmG3rG5tyuRL36fTytalF2Q/fbHLv88k86SF5B+n
         kD/e3IOffZqltx/ae95tFGRGsp3xMU6Es2EJtkm/Uv6HWrHxaNZJMvxT1/bQn7yar47Y
         4fAd2jTqgzdc//RUhHBhJSfWU2VVHcmnYguu5dBAl/SlXtbKmSL4DBq939ETjmgEJ94e
         8TrMa073T8bB3Ke2qyg9tjI39FS054hYLb7lRvC0bNnBzH+5BX47zlTBQ9g1DtYWnz4N
         qBNuChxX691x1hR24xY36zRokNkunWDDIfQlKES0EhbCNoan2nxruWBpHIibMgFtllqi
         jiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699876724; x=1700481524;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iP6G275PfhDARLAGhpGbF3e3yeogL6WcLd6tMRosXuU=;
        b=l/1hM2jDU0gQmRKFYZCP3SOGnolXEAEWJBDOqbV2oEivCOkumhMUIeKWkkDjAhKrpy
         TVSr6sY0D625p4U47Bsd6o+KHphTC7WYvDqtWV37UOvQeLvbJTNkQo/nH5KaL4tWI2Hw
         UUxPG72jYImgp3t2AO8/M867sibDAw/48nOGAZ8qpzrn/bLBlpJSHcNqhyjUZ93q4iO/
         aQHCbtifMrevUIB4Q1gOZCC6LZ+vn7XjDPP4yA0R8mb1uh7MJpGJiYQaTmGXCCL2DRyT
         RpfSNuXcRG0ZzG7t6Yr2+I9qKi48fzRJ01JDWgubaJNNp2VczYb1iVeZw8yYmZh/AzkU
         ZE7g==
X-Gm-Message-State: AOJu0Yxxjk2UJlw/xDOf/xAFZLTojmGRf+otPZXJJwOZ77BDOXpqSWhv
	H00P6VLEaILa7labeS5SQhaIvA==
X-Google-Smtp-Source: AGHT+IGjcJ76sxnNYlkTPLOyG6TySMakzmNRyHbmHZ48kgb3cwMeMp2H6tium7gewkBJkAL4KN582w==
X-Received: by 2002:a19:8c10:0:b0:4ff:a04c:8a5b with SMTP id o16-20020a198c10000000b004ffa04c8a5bmr3996042lfd.47.1699876723778;
        Mon, 13 Nov 2023 03:58:43 -0800 (PST)
Received: from [192.168.201.100] (178235177064.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.64])
        by smtp.gmail.com with ESMTPSA id gx24-20020a170906f1d800b009c503bf61c9sm3868184ejb.165.2023.11.13.03.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 03:58:43 -0800 (PST)
Message-ID: <4243a841-5509-4d04-8ec7-191f2ba5677a@linaro.org>
Date: Mon, 13 Nov 2023 12:58:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: ipq6018: add USB GDSCs
Content-Language: en-US
To: Robert Marko <robimarko@gmail.com>
Cc: agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
References: <20231025104457.628109-1-robimarko@gmail.com>
 <20231025104457.628109-2-robimarko@gmail.com>
 <CAOX2RU4MBvDZZ767RPS9XKj0U2L3gviVG5cyR8NKyO4LD+sfYQ@mail.gmail.com>
 <20c8cfde-3f55-45c5-bc23-21979ac9680d@linaro.org>
 <CAOX2RU5-XFZhGzjigNtu-qFnPWDd2XkpGpY=HXWigRa5SXw4TA@mail.gmail.com>
 <ef377506-4132-4805-a76e-18f241afe319@linaro.org>
 <CAOX2RU4K67evm10giQvF1rcfqTfR+e--KQT3ZePoHQoqASv_fg@mail.gmail.com>
 <bdf6be0b-c137-48ce-8a3f-ab74bced6f87@linaro.org>
 <CAOX2RU4z1Dcs7ct0BAaS7wicYVmQEiSe74=w_grFDKQv22uoFg@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <CAOX2RU4z1Dcs7ct0BAaS7wicYVmQEiSe74=w_grFDKQv22uoFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2023 12:28, Robert Marko wrote:
> On Tue, 7 Nov 2023 at 22:51, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 10/31/23 10:01, Robert Marko wrote:
>>> On Mon, 30 Oct 2023 at 22:12, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>> On 30.10.2023 21:37, Robert Marko wrote:
>>>>> On Mon, 30 Oct 2023 at 20:37, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>>>
>>>>>> On 29.10.2023 12:04, Robert Marko wrote:
>>>>>>> On Wed, 25 Oct 2023 at 12:45, Robert Marko <robimarko@gmail.com> wrote:
>>>>>>>>
>>>>>>>> IPQ6018 has GDSC-s for each of the USB ports, so lets define them as such
>>>>>>>> and drop the curent code that is de-asserting the USB GDSC-s as part of
>>>>>>>> the GCC probe.
>>>>>>>>
>>>>>>>> Signed-off-by: Robert Marko <robimarko@gmail.com>
>>>>>>>
>>>>>>> Unfortunately, after testing on multiple devices I hit the same GDSC
>>>>>>> issue I had a long time ago
>>>>>>> that was the reason I did not send this upstream.
>>>>>>> It seems that USB3 port GDSC (USB0 GDSC in code) works just fine,
>>>>>>> however the USB2 one
>>>>>>> (USB1 GDSC in code) it is stuck off and USB2 port will fail due to this:
>>>>>>>      1.607531] ------------[ cut here ]------------
>>>>>>> [    1.607559] usb1_gdsc status stuck at 'off'
>>>>>>> [    1.607592] WARNING: CPU: 0 PID: 35 at gdsc_toggle_logic+0x16c/0x174
>>>>>>> [    1.615120] Modules linked in:
>>>>>> Can you dump GDSCR (the entire 32-bit register) at boot and when toggling?
>>>>>
>>>>> Sure, here it is:
>>>>> [    0.023760] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3e078 val: 0x8222004 init
>>>>> [    0.023782] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3f078 val: 0x8222004 init
>>>>> [    0.988626] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3f078 val:
>>>>> 0x8282000 before toggle
>>>>> [    1.202506] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3f078 val:
>>>>> 0x8282000 after toggle
>>>>> [    1.207208] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3e078 val:
>>>>> 0xa0282000 before toggle
>>>> Any chance
>>>>
>>>> .en_few_wait_val = 0x2
>>>>
>>>> (turning BIT(19) into BIT(17))
>>>>
>>>> will make a difference?
>>>
>>> Sadly, it makes no difference and GDSC status bit newer comes up which is
>>> rather weird as USB0 one seems to work just fine.
>> What if you add clk_ignore_unused?
> 
> To the USB1 master clock or?
That's a command line parameter, effectively setting it on all clks.

> 
> There is definitively something broken regarding the GDSC as
> GDSC_STATE bits (30-27)
> change from 0 to something on the USB0 GDSC but on GDSC1 they are 0 even after
> SW_OVERRIDE BIT(2) is set to 1, and the POWER BIT(31) newer changes to 1.
> 
> However, if you manually set BIT(2) to 1 then the USB1 master clock
> can come up so
> GDSC seems to work.
> USB1 (The USB2.0 HS) port is still broken after this if USB mass storage is used
> but that was present before the GDSC changes as well and I still need
> to figure out
> which quirk is missing for this.
Please try clk_ignore_unused and see if toggling the GDSC is still broken.

Konrad

