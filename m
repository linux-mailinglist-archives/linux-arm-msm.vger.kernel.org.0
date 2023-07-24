Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B0075F786
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 14:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjGXM7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 08:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbjGXM6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 08:58:05 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C066F5FD0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 05:54:46 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f954d7309fso5406310e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690203219; x=1690808019;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2Ax+g4Vq22atUQfE+CrYPUiHKIfw129Y1mAPVdfhrk=;
        b=yIjEagSPzyrV4pnOzGUMMfEoceZFbE4b2sE2bDD34FCS9owCq5V48XdsU3g05ebZAd
         1rdKzRxjTXXlk8BAaIU/FYi6gf4ly6wUBZ87I+2zs1toMcGk3mcfmltS90FnjYZf2PM+
         zWmYpWGqIXMDcxhu/KHB8jUHxNXfeXimh1aWxjChWy6OfZezytgZrvzZTXQa2E29l1iQ
         EkOUKoO4jKZPPBwyxpFh+othkKSu/BkQ63tb3Nuyp01uLqNcpCxJTI2A2QJnSmAECKP+
         LBwKMkqIkylWf74OoEOrFYOo1Ax74/TUnpbJKFcMgqLHpk73Aps09ydWTHMEYv5zwJhw
         PQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203219; x=1690808019;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2Ax+g4Vq22atUQfE+CrYPUiHKIfw129Y1mAPVdfhrk=;
        b=S+XwG4cAZ718s289NTZJqqgZBdzENH3AQ2bi6Qo0G0ofFf8JRsEpDv8WmB+RCsfv+J
         oeYHtYpfMeDpWWPEZ4euHglueBw9pd5yyi5XDO61gX3WxERhOdVKJ6G/DRdh7ML8V9qV
         EwyV7uWZeuXUtOma+OmIu9/+izgBxEIB6ye9Bnl6jkSGkVHHWPyHmsQCBdG1fGEmYtnH
         OD6L+tvLALb5kAOaC/x61oXU8/30JsRkCrtuRs2gNap37LUSr7JwYBppxPC1abdP85Ce
         mtWMU6a98SMY8Rb2N6u75vXYqhG/7DRUEQIAh926YzHz6ynTAYCFFTypc7qL61QzGhUW
         Sv7A==
X-Gm-Message-State: ABy/qLZjE8UK+tzef6BF+lXISSCz6MC40lnRV6UuUC177mFWIq2UUKHW
        aV8Vpu9f2O0vSWxbHd7jQ+Ns2A==
X-Google-Smtp-Source: APBJJlF3M0XAIIrNjCgd3lRmor0h1II8rIjFWnG7yMxjXazt29zxHtYqTKVQn1cYI8S8IR2Mgzm7Nw==
X-Received: by 2002:a05:6512:e8c:b0:4fb:8ff3:1f74 with SMTP id bi12-20020a0565120e8c00b004fb8ff31f74mr3971328lfb.20.1690203219568;
        Mon, 24 Jul 2023 05:53:39 -0700 (PDT)
Received: from [192.168.1.101] (abxj221.neoplus.adsl.tpnet.pl. [83.9.3.221])
        by smtp.gmail.com with ESMTPSA id m8-20020a195208000000b004fb86662871sm2166604lfb.233.2023.07.24.05.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 05:53:39 -0700 (PDT)
Message-ID: <af7d1db2-8bbe-e078-6b17-7f841fb7f475@linaro.org>
Date:   Mon, 24 Jul 2023 14:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] PCI: qcom: Add early fixup to set the max payload
 size for IPQ9574
Content-Language: en-US
To:     Praveenkumar I <quic_ipkumar@quicinc.com>, mani@kernel.org,
        agross@kernel.org, andersson@kernel.org, lpieralisi@kernel.org,
        kw@linux.com, robh@kernel.org, bhelgaas@google.com,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     quic_varada@quicinc.com, quic_devipriy@quicinc.com
References: <20230724124711.2346886-1-quic_ipkumar@quicinc.com>
 <20230724124711.2346886-2-quic_ipkumar@quicinc.com>
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
In-Reply-To: <20230724124711.2346886-2-quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24.07.2023 14:47, Praveenkumar I wrote:
> Set 256 bytes as payload size for IPQ9574 via early fixup. This allows
> PCIe RC to use the max payload size when a capable link partner is
> connected.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
[...]

> 
> +static void qcom_fixup_mps_256(struct pci_dev *dev)
> +{
> +	pcie_set_mps(dev, 256);
Looks like setting "dev->pcie_mpss = 1" here would make the PCIe generic
code take care of this.

Konrad
