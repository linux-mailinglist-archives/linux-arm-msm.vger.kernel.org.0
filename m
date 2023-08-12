Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251D277A046
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Aug 2023 16:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjHLOIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Aug 2023 10:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbjHLOIh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Aug 2023 10:08:37 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D49B91FE7
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Aug 2023 07:08:39 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9b9f0387dso42848181fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Aug 2023 07:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691849318; x=1692454118;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wE2+WVoosrPee0DZtLB5UCPP6Y/U/wvEYDBeHWdSxz4=;
        b=GAUgrx6+OhnDwlfFsnF1u4e2QFtEPKb4wIBJyaVfkbKjCczs1pVuNua/YwHwMJGiS9
         mEIvfLXR75+ilT8y+yV//0et0FR9fI4VO966GuNI6uL1shqBJnPsd+b6VaKNxIdcsjxB
         RKPyNjSPPUu5ly0mkF8iOT1YdLMboFgo+Vqe7Y6/zwi2Jov+i6CY6krSRIELW+LvFW/z
         TgI8X9dq+9A46sMI9YMElek2aVna1ae6WejjwK9WRvse0e5xKK14k4F5785i/kLpKydx
         uQ5+KKiRbzDoxl0fAWILaV48dZyK79+6F9dRkyxkhFBQmeqNnxQ6CUG3r3N1YXhFTMB/
         jjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691849318; x=1692454118;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wE2+WVoosrPee0DZtLB5UCPP6Y/U/wvEYDBeHWdSxz4=;
        b=Te7EAf+RYNzH26Ulc/Io2Y1HAWJPI0IGDkfSduebnjJ/emB3EaP6js/YGw1S5RgrqR
         FeKcP7hDuD4fg2sZKWgfQ51aHEBI5bx6OCovvsV413uJUJ0+5Grc6DG4J9RyRkfLGI/i
         mXvPDCy9F8MVeObm6ZXrvowJ4RFq95bMgUI9jNeybmnRquzjKcLNYxo2ksNFvhsr9ADg
         sIW7wvhx+gDqVPkDkdTFrePKFaopfP6xlSbs7RVESKPrL/UXxmZGYstKzjfkJCvsBzUw
         UK16wXhpO/PdaD3zEoVvVR0zV3YvWm5At6+VwsORQLlACw3IMTDnL5+Rf5uMwpZN2mY1
         0yiw==
X-Gm-Message-State: AOJu0Yza3SikOcmDEvH2zFxgqoCFa2EoAIHiR0IEqqGh4hF8H/mQdbYr
        Jgq6UpJHG3/dEvNSqOWp0K+J8w==
X-Google-Smtp-Source: AGHT+IEhrYtuMEpNSD45OgcAAM02I3FwwbeD5t8qUmrmiRwwEVKiYML/xv2nukFX15McJmlLEvGmeA==
X-Received: by 2002:a2e:925a:0:b0:2b9:f13b:6139 with SMTP id v26-20020a2e925a000000b002b9f13b6139mr3775646ljg.20.1691849317588;
        Sat, 12 Aug 2023 07:08:37 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id z14-20020a2e884e000000b002ba101dae4asm1409192ljj.90.2023.08.12.07.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 07:08:37 -0700 (PDT)
Message-ID: <389904f7-86fa-48be-ba30-aa8cfeb44353@linaro.org>
Date:   Sat, 12 Aug 2023 16:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom: ipq4019-ap.dk01.1: align flash node
 with bindings
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230811210142.403160-1-robimarko@gmail.com>
 <20230811210142.403160-2-robimarko@gmail.com>
 <4c96210b-4567-4cb5-80bb-7adca6c5f124@linaro.org>
 <CAOX2RU6X0Tww4UkTKVfc=PLY=RKVJdsm+gomytT0vOydTF+Hnw@mail.gmail.com>
 <7116b473-7f22-43df-af39-81e5f6db4507@linaro.org>
 <CAOX2RU6nMvpTkGdwBoLJrES5v0qARnDDT6nCVd-DZid7p3pg6Q@mail.gmail.com>
 <e784f70f-3232-42e6-bf4c-67075abd210a@linaro.org>
 <CAOX2RU7cLoK206hLkfDr+Ry8QgS5F48EEiSbJ+gbGK_xkXBDpA@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
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
In-Reply-To: <CAOX2RU7cLoK206hLkfDr+Ry8QgS5F48EEiSbJ+gbGK_xkXBDpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12.08.2023 16:07, Robert Marko wrote:
> On Sat, 12 Aug 2023 at 12:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 12.08.2023 11:55, Robert Marko wrote:
>>> On Sat, 12 Aug 2023 at 00:56, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>> On 11.08.2023 23:35, Robert Marko wrote:
>>>>> On Fri, 11 Aug 2023 at 23:28, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>>>
>>>>>> On 11.08.2023 23:01, Robert Marko wrote:
>>>>>>> Rename the SPI-NOR node to flash@0, remove #address-cells and #size-cells
>>>>>>> as they should be under the partitions subnode and use the generic
>>>>>>> jedec,spi-nor compatible.
>>>>>>>
>>>>>>> Signed-off-by: Robert Marko <robimarko@gmail.com>
>>>>>>> ---
>>>>>> You can also do "nandmanufacturer,mx25l25635e", "jedec,spi-nor"
>>>>>
>>>>> Hi,
>>>>> I grepped the vendor U-Boot to make sure it's not being triggered off
>>>>> the mx25l25635e
>>>>> compatible but the only hit is the IC support itself.
>>>>> MX25L25635 was just the original NOR IC Qualcomm used on the board so
>>>>> to me it made
>>>>> most sense to just use the JEDEC compatible as NOR itself is JEDEC NOR
>>>>> compatible.
>>>> OK if dynamic identification works fine
>>>
>>> It should work fine, datasheet is clear that its JEDEC compatible.
>>> That being said, I dont actually have the board, just figured it was
>>> time for a cleanup as
>>> OpenWrt has been patching DK01 and DK04 for ages.
>> Hm. Do we know whether there are still users of this boards?
> 
> I honestly doubt it as they have been broken in OpenWrt for years and
> nobody complained.
> So we are currently removing support for them, but I still wanted to
> at least fixup the DTS state
> upstream.
> These boards are not obtainable anymore.
I also noticed they were detached from the other snapdragons in u-boot
for no good reason (at first glance anyway).

If we don't get any hands up from users, I think deprecation is in order.

Konrad
