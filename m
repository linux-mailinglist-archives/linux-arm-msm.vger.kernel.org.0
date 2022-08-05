Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398A458B0E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 22:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241029AbiHEUfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 16:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239543AbiHEUfS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 16:35:18 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236BF21E
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 13:35:15 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id f20so4890783lfc.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Aug 2022 13:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=nEs1T+9g6EOckZLPnIrdTfnKnh7WKsJdS1IqvtqzCCo=;
        b=aju/Min+FNvd6MGHQl3ZhpbhXqUw75B+9M+tE/2N7/uF2PFX8BdS8Oz4K6ycHLuAu0
         VNVA+rvfLt6aBpDSAddqEqMDdA2f+SnuzX4cRKX3Lo5chWqJMZsSD4nHC036VbAtdz/n
         HG//CawrK0RA0C+WbdK6U0gFEtR/eWEsSNxutbmgYdiBaGWlCLlWV7xT4bqlG77upLvi
         EuX8PLEBhYHo8DUVzwlMDoVmcAcLxa+92Dnwgwa+zrDdh8BN9MzjfDXWwm4mFoeGW4wn
         i7T0GwxTJLUI+h0ObrUjxyL9BueIHTzr2h1kY+Vm6Bz7Fa6iZRjXrdSeCeAw0G3h+LcD
         mwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=nEs1T+9g6EOckZLPnIrdTfnKnh7WKsJdS1IqvtqzCCo=;
        b=6CROwUuuIFlKO8ob8XYefjv+mOiXN/6cMdVESXwA7AxSLt6f7TX24Xwp9YCbJ6iOfd
         ag4H2jJEjgi2D9xQ97ugl9SN4IbdfVkqHU6cBgrUQWh07Kl6ldXJQscq+W8Ztgir7GY3
         sFmXchy9WVGUZm5j0gzlJEonKjyv1i7UgCrFdYv3G1q6Z7KW1WCB9fmnPphtA3yyCo9R
         CU6JScuK6kZ9OfU6OXV8sUAIXoRFZ2McYIIoP25RiiF9sLKZk0bYUPL0Dt2ZnUMtjsHR
         HxoO0wGOtFMryFs/ZJSB8rD6M844rsNM8hxsA9dTe8N+PC5J+ClzL2s4SbixYuAPNCOO
         +3fQ==
X-Gm-Message-State: ACgBeo2CIWWwzUZWLm6T2Tba7E9dMJeYeNpTlt1Nz00YAOrvk71Tu6/j
        ddyykkHes5y0/h1R22cJTTDB0g==
X-Google-Smtp-Source: AA6agR4TX2+8SBTtftm1b2BwDJfs6bCoS6LwzOGdPX5GT3nTYUN+fOPYC/ADy0ddXk8PDfrnVCLEpg==
X-Received: by 2002:a05:6512:ad3:b0:489:ec0d:761e with SMTP id n19-20020a0565120ad300b00489ec0d761emr3115960lfu.2.1659731713107;
        Fri, 05 Aug 2022 13:35:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y25-20020a2e5459000000b0025e0bcd9127sm584846ljd.73.2022.08.05.13.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 13:35:12 -0700 (PDT)
Message-ID: <c1dcfbf5-3bb8-8156-667c-f5966f7ba1d7@linaro.org>
Date:   Fri, 5 Aug 2022 23:35:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: qcom: Add firmware for Lenovo ThinkPad X13s
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>
Cc:     Mark Pearson <markpearson@lenovo.com>, linux-firmware@kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        bjorn.andersson@linaro.org
References: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
 <2a4ae0d4-8ba2-a202-0051-6bd7b170bccd@linaro.org>
 <CAF6AEGvdnrPn+rnDGmjza1-xoPaOQgdPLkSfaOL6hCPnB2ea5w@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGvdnrPn+rnDGmjza1-xoPaOQgdPLkSfaOL6hCPnB2ea5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/08/2022 23:09, Rob Clark wrote:
> On Fri, Aug 5, 2022 at 2:37 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 03/08/2022 23:37, Mark Pearson wrote:
>>> The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
>>>
>>>     amdgpu partially revert "amdgpu: update beige goby to release 22.20"
>>> (2022-07-25 14:16:04 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://github.com/mrhpearson/linux-firmware lenovo-thinkpad-x13s
>>>
>>> for you to fetch changes up to 4ae4ae88918928e15006eb129ad981aa58216b59:
>>>
>>>     qcom: Add firmware for Lenovo ThinkPad X13s (2022-08-03 16:29:07 -0400)
>>
>> Mark, it's so great to see firmware packages for Lenovo laptops being
>> submitted!
>>
>>>
>>> ----------------------------------------------------------------
>>> Mark Pearson (1):
>>>         qcom: Add firmware for Lenovo ThinkPad X13s
>>>
>>>    WHENCE                             |   8 ++++++++
>>>    qcom/LENOVO/21BX/adspr.jsn         |  28 ++++++++++++++++++++++++++++
>>>    qcom/LENOVO/21BX/adspua.jsn        |  29 +++++++++++++++++++++++++++++
>>>    qcom/LENOVO/21BX/battmgr.jsn       |  22 ++++++++++++++++++++++
>>>    qcom/LENOVO/21BX/cdspr.jsn         |  22 ++++++++++++++++++++++
>>>    qcom/LENOVO/21BX/qcadsp8280.mbn    | Bin 0 -> 14367860 bytes
>>>    qcom/LENOVO/21BX/qccdsp8280.mbn    | Bin 0 -> 3575808 bytes
>>>    qcom/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin 0 -> 14392 bytes
>>>    qcom/LENOVO/21BX/qcslpi8280.mbn    | Bin 0 -> 6213632 bytes
>>>    9 files changed, 109 insertions(+)
>>>    create mode 100644 qcom/LENOVO/21BX/adspr.jsn
>>>    create mode 100644 qcom/LENOVO/21BX/adspua.jsn
>>>    create mode 100644 qcom/LENOVO/21BX/battmgr.jsn
>>>    create mode 100644 qcom/LENOVO/21BX/cdspr.jsn
>>>    create mode 100755 qcom/LENOVO/21BX/qcadsp8280.mbn
>>>    create mode 100755 qcom/LENOVO/21BX/qccdsp8280.mbn
>>>    create mode 100755 qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
>>>    create mode 100755 qcom/LENOVO/21BX/qcslpi8280.mbn
>>
>> I think it's the time to settle onto firmware paths for the
>> Qualcomm-based devices. At some point it was proposed to use
>> qcom/<SoC>/device/*mbn.
>>
>> So, in your case it could be qcom/sc8280xp/Lenovo_21BX/
> 
> I don't think it is a good idea.. we should stick to a path that can
> be constructed from SMBIOS fields if we ever want a chance to get ACPI
> boot with acceleration working

Yes, it's also true. I do not quite like the idea that we are going to 
end up with two different path types. One using the DMI/SMBIOS ids, 
another one using SoC and machine id. Maybe we can settle on using 
SoC+id and then using DMI-based links.

There is another point to remember. I can imagine that once WoA/LoA 
laptops are more common, there can be several different DMI models 
sharing common firmware. So, there will be symlinks involved anyway.


-- 
With best wishes
Dmitry
