Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D77056E0960
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 10:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjDMIxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 04:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjDMIxU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 04:53:20 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8653A93E2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 01:53:10 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id z9so8570589ejx.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 01:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681375989; x=1683967989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3H24zP1L7tYYlCqcIbWQTBu/s9gcRQK5v7kIq+g891I=;
        b=KICwgJX+Xasyma77ZsxbeSnEzglwgFHu4leJC6Q3s8sWKcXe+OofACslEldiD6kYnk
         Uk/S4fK55NeQMGpZSU5rjisgBKz2TvsOc+DHlm0wGHBMjBxBCWHI3JMx9bzFZBMKMVze
         ZByORwbDqqjJdRf5ivFzZ4YV+4UtoNrmJEeDuevfmU454EZ1DIBU5w45RjYISe3CA9kd
         DbWcs2scsLHKfAJ7x4503MKzzC9h50CnBFgN/y0e5MXp4arvvwcpLWnZ8f/3Elgc8rE+
         uol62orUHmgKVajfoIyRuDToECRDEMrhWxRhhvYKeTOeElWEmjfBN500oIukkhymkzvH
         9/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681375989; x=1683967989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3H24zP1L7tYYlCqcIbWQTBu/s9gcRQK5v7kIq+g891I=;
        b=YcGnglCiw8cH39kdr3LT+7dn78V1lSEqdVM+ROgaUqXYW7ANrMRrhykDwrt8CnMcMO
         z+Qq0VsOgWEqm9Cen0VMgGPM9ZsmrY9wZjL6rblTe+t5g6hCUZSlNGbAeeawgT1lQP0T
         hlzflLndgCvYIJ+W4QZuFww/GgNqMFIlJI4OwSQjB72fahrwx4/nDMf0BopIy4vlLwxR
         DaIy3zAa9u5P04YQn2b34hrvzChSoaSb1SfPmGhJ0KvZIebh8pVh19KC62wOzXLpUVao
         Q9r9PmkU0pZQfqeFOKK5WJ9N/1qykbrtpadkg2K3BvnhtKlzfYwH5UlQnepkAmo+M5SW
         nRDA==
X-Gm-Message-State: AAQBX9cl2QeM5tQu/OJQFpm/kJi7+KkU01uBDTv5FqwWZAQid4C1N/S7
        rgkQCr54w/BXUsdRJq4zt07nlA==
X-Google-Smtp-Source: AKy350bssJsTsK6f959IfKKZln3Gn31vb5WyeZyv4Fiyd5jiVWOkRLggleMzrk2N2+UqGDJiCAHdxA==
X-Received: by 2002:a17:907:1b1b:b0:94e:4fac:d92b with SMTP id mp27-20020a1709071b1b00b0094e4facd92bmr2018234ejc.58.1681375989020;
        Thu, 13 Apr 2023 01:53:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7? ([2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7])
        by smtp.gmail.com with ESMTPSA id gy18-20020a170906f25200b008ec4333fd65sm637573ejb.188.2023.04.13.01.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 01:53:08 -0700 (PDT)
Message-ID: <a84b11c7-c49d-6859-cdd7-16b4d37489df@linaro.org>
Date:   Thu, 13 Apr 2023 10:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-lenovo-thinkpad: correct pin
 drive-strength
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230407180710.128815-1-krzysztof.kozlowski@linaro.org>
 <ZDVtXkCON8DFUDjh@hovoldconsulting.com>
 <887eb9f6-9882-37c6-4332-ddae7a354187@linaro.org>
 <ZDZUiW+74rhhRAfS@hovoldconsulting.com>
 <15e1d05f-b7e1-27bc-7363-aefd2d155eea@linaro.org>
 <ZDZbif25qQh79cuG@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZDZbif25qQh79cuG@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2023 09:19, Johan Hovold wrote:
> On Wed, Apr 12, 2023 at 09:03:31AM +0200, Krzysztof Kozlowski wrote:
>> On 12/04/2023 08:49, Johan Hovold wrote:
>>> On Tue, Apr 11, 2023 at 06:58:33PM +0200, Krzysztof Kozlowski wrote:
>>>> On 11/04/2023 16:23, Johan Hovold wrote:
>>>>> On Fri, Apr 07, 2023 at 08:07:10PM +0200, Krzysztof Kozlowski wrote:
>>>>>> Fix typo in drive-strength property name.
>>>>>
>>>>> In the future, please try to use the established commit-summary prefix.
>>>>> In this case:
>>>>>
>>>>> 	arm64: dts: qcom: sc8280xp-x13s:
>>>>
>>>> Sure.
>>>>
>>>> commit ca1ce7207e53cfe69aee5002eb3795069668da53
>>>> Author: Johan Hovold <johan+linaro@kernel.org>
>>>> Date:   Fri Aug 5 11:23:17 2022 +0200
>>>>
>>>>     arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add alternate touchpad
>>>
>>> Yeah, we initially used a longer prefix (including "x13s" which was
>>> missing in the Subject of this patch), but quite soon decided on using
>>> the shorter
>>>
>>> 	arm64: dts: qcom: sc8280xp-x13s:
>>>
>>> instead.
>>
>> Thanks. Do you know if this rule applies to other long-names? I was
>> usually keeping full name or shortening them by cutting end, but maybe I
>> should cut the middle?
>>
>> sm8250-sony-xperia-edo-pdx206
>> sm8250-sony-xperia-edo
>> sm8250-pdx206
> 
> I would not call it a rule just yet, but I guess there are further cases
> were this could have been used. Perhaps you can all decide to use it for
> the other Qualcomm dts as well.
> 
> For the X13s the, 'sc8280xp-x13s' is enough to uniquely define the
> board and it mirrors 'sc8280xp-crd' (and using a shorter prefix makes
> the commit logs easier to read).
> 
> The general suggestion is still to check 'git log --oneline' for the
> files in question and use what appears to be the (recent) common prefix.

I do it for subsystems, but I am not going to do it per file. Sorry, I
am sending way too many of them to keep also customizing them per each
file. If you wanted x13s prefix, then you would name the file like that.
If you named file differently, then apparently that's how you want it to
look.

Best regards,
Krzysztof

