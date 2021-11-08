Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA63449C89
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 20:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237558AbhKHThN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 14:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhKHThM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 14:37:12 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E389C061570
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 11:34:27 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id c4so28847352wrd.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 11:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZfqMWQMUbjmhEJSkL6pUi8fZcDXQhGXqHpkR3NxIB0w=;
        b=Pq72Wuc+TwQ7kdDg9fQNpDsaWj9PsG1NXy2QVK7252I4pPI/i4ELB/louvCSOuT6r4
         OHnGShi35MhvVlEQDJ4LYKVaSrgEV89hu718An9GvNV1O02JPlI4qrDC4bOpXJ5+DHPD
         mWMzFcygJzxHTsyCsMGUhdXzssGMVdJOMNMmPSOXCF+jbiTuQgcIsoqOTzYpzbdBthiV
         y5hzBipuf7P2CfqNgrhc/d+0o0x0q+DaZqFX0hKvegSQWceTHAuWUiwqmH+GZvV7CONL
         zbwx9nn201+8aWx8SjhT/q4N+YYVcX7iHBQZgwuaTRbbsI5TDrrWr0F8BMh92H11xZYP
         ws8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZfqMWQMUbjmhEJSkL6pUi8fZcDXQhGXqHpkR3NxIB0w=;
        b=63gYk+tFh7NhhXHuXsIrLTeWKql6uDExCmtMkr2Kf+dcE+ekBGo/zs6QtYXgejQ8YN
         8llk+wCgxhdyjposF9VeKNLqpasLzzo1GA7Sg5bOINGsErMRfTeXgBHagUPD9I14fDiG
         pqEo0huZPVI3t8SvLamgdoRtIWpv9zNdtZEo8ca6r9ef9pmdFVOMp78pZt0iW2wuQdu9
         XuB8taM1DUuzCdMf7u5WIzeKAln5xG+zzC0TwLjUqSD9w++35ymUfTfA9WGFj1DfmkI+
         2DsPr52gmLeEb7zOcVceO8zsOIFfonTbWSILHumn8+oY9mZ5DGLu0VSVTI0Hj64xKoel
         EQJQ==
X-Gm-Message-State: AOAM533NMSvhliHzy5vN5Qp+zKTGul1VlquayeKLb7kcoUM9cbpI+vRA
        VROr4UFcxgwL0WwgC3Zck2cK5Q==
X-Google-Smtp-Source: ABdhPJy6X8TfhTuDeBXEDxnnB9cLYXfKk1/TslNQYy0mPQHbIf0jQjhY05zH0OFZhoBj6HgD3Amagw==
X-Received: by 2002:a05:6000:110a:: with SMTP id z10mr1959969wrw.396.1636400066285;
        Mon, 08 Nov 2021 11:34:26 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a9sm17455570wrt.66.2021.11.08.11.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 11:34:25 -0800 (PST)
Message-ID: <4195f05a-e926-246c-5276-ec38750909cb@linaro.org>
Date:   Mon, 8 Nov 2021 19:36:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 5/7] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML
 schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
 <20211105033558.1573552-6-bryan.odonoghue@linaro.org>
 <YYlaqTYhe4hbXhFf@robh.at.kernel.org>
 <60841bf0-f5ea-314f-34c6-822a8812000d@linaro.org>
 <CAL_JsqKtesGfaJ+81jaWzB1kD_qXeehv7hrvXh3x=cpo15Ny-g@mail.gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAL_JsqKtesGfaJ+81jaWzB1kD_qXeehv7hrvXh3x=cpo15Ny-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/11/2021 19:22, Rob Herring wrote:
> On Mon, Nov 8, 2021 at 12:58 PM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> On 08/11/2021 17:13, Rob Herring wrote:
>>> Looks like the h/w is all part of a
>>> PMIC, so it should be part of the PMIC binding and probably merged with
>>> one of the nodes these phandles point to.
>>
>> Not sure I really follow you here.
>>
>> The existing PMIC dts arch/arm64/boot/dts/qcom/pm8150b.dtsi has:
>>
>> pm8150b_gpios: gpio@c000 {
>>       compatible = "qcom,pm8150b-gpio";
>> }
>> Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>
>> and
>>
>> pm8150b_adc_tm: adc-tm@3500 {
>>       compatible = "qcom,spmi-adc-tm5";
>> };
>> Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
>>
>> to which I'm adding :
>>
>> pm8150b_typec: typec@1500 {
>>       compatible = "qcom,pm8150b-typec";
>> };
>>
>> Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
>>
>> pm8150b_pdphy: pdphy@1700 {
>>       compatible = "qcom,pm8150b-pdphy";
>> };
>>
>> Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
> 
>  From what I gather, there is not a 3rd h/w device this binding
> describes, but it is just a collection of all the data you happen to
> want for your driver.

The TCPM "virtual" driver presents as a device to the TCPM API and then 
uses phandle to talk to the PDPHY and typec devices yes.

  That's assuming a specific structure for a
> specific OS. Why can't most of this binding be part of
> "qcom,pm8150b-typec" instead of making up some virtual device?

I thought it was a better model to have the TCPM be a separate device 
with the pdphy and typec blocks as their own devices.

#1 Because the address space spans over more than just the pdphy and 
typec device, there's a charger block in between

#2 Because the pdphy and typec have separate IRQ lines and register spaces

---
bod
