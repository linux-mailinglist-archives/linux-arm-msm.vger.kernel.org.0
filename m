Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35CBB308463
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jan 2021 04:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbhA2Dun (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 22:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbhA2Dug (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 22:50:36 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADABDC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 19:49:55 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id s18so8941728ljg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 19:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xMvJoMHuEXdWFwhVnHo1SQV4orUEAbd3SRkoCZWs3jQ=;
        b=CT2ivzq/AImbcMwRyug0dhVU6XpQ/KDjrVZcJ34Noi/PqsGK+I5u7bJv7mdhfy6eHs
         eFxrnCd5XyJisiZ/vrTzQUX8pM+TcDvW3UTi9L4SqdM0hTLNu9GSZINp2Ug9ChGVd2Gz
         NGNDRVGNYeFCUm7HRLNsZwzo5EWIWzmgIBjvhZCCqGd4wLtX+ZV/vtdnbYlXX5702Flb
         oJ30u05CYXRwhOTP0gi4yWMSjIPiWItLIS97IJhatJdelZvO+QeHTsyA41+QZ5UjCv/+
         9N3YCtS5QqHR99FOzFAfM3zbX3JNyS52Rr7UTTCmFzmN684SL12/vNWI8b/CamzL3LRr
         S5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xMvJoMHuEXdWFwhVnHo1SQV4orUEAbd3SRkoCZWs3jQ=;
        b=LgG6F2+0VxSIbr6HJqz8hHCEicEFdz/ihc78H/CrAlx3ADw//GOm5HjcAemnCr05ES
         UPO4hmq2UYrX2CN0daAWoow4yKRMuE+G4djzfJ9Zv8Epc/AmbpPYtEjWUTFNWKm86J0F
         0ySVRCZJyu/QqGA3xJ4/G97JKDh06XeF2KP0W5qgXo6R2p2eYvZkpIUlnDIqec6X6SCu
         W3uzrnvg/dp0CZZOK9GKs0mD/OUmCaqi0VMvEsuef+dRmbLh5V9W+xyXA4vTc1dZbp7E
         SkUlk61Uu3g1YwnRA8t3voUw1SM3Z4bNnLZ83A2ACUCl1fEe8xZZxp682FVCdFOCS2ES
         lRBw==
X-Gm-Message-State: AOAM533JSyMUuEdwEGGVIpcPfpIwwJ45zCerFVkh0FZytZppjKaD1wCt
        JQHZ9setWJGKb/3I3bQOTwWEow==
X-Google-Smtp-Source: ABdhPJy5iwaV6zkENFUGsz+wmKhi/YZasjaeDKImIMv+I+rcV9HgjHv5ad5v55Gggc+I3ABQ67djow==
X-Received: by 2002:a2e:5802:: with SMTP id m2mr1385650ljb.145.1611892194238;
        Thu, 28 Jan 2021 19:49:54 -0800 (PST)
Received: from [192.168.1.211] ([94.25.229.83])
        by smtp.gmail.com with ESMTPSA id s3sm2347641ljj.4.2021.01.28.19.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 19:49:53 -0800 (PST)
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add Bluetooth support on RB5
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        PCI <linux-pci@vger.kernel.org>
References: <20210128175225.3102958-1-dmitry.baryshkov@linaro.org>
 <20210128175225.3102958-6-dmitry.baryshkov@linaro.org>
 <CAL_Jsq+nNRv3KceHthgktHR1oRMs+eKWC4O7n0k78izs1aTPfA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <6dd1f5cd-03c7-5945-9fa2-1c2698405110@linaro.org>
Date:   Fri, 29 Jan 2021 06:49:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+nNRv3KceHthgktHR1oRMs+eKWC4O7n0k78izs1aTPfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/01/2021 22:15, Rob Herring wrote:
> On Thu, Jan 28, 2021 at 11:52 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>
>> Add Bluetooth support on RB5 using the onboard QCA6391 WLAN+BT chipset.
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> [DB: added qca6391 power domain, removed s2f regulator]
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 29 ++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> index b39a9729395f..c65c13994a86 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> @@ -19,6 +19,7 @@ / {
>>          compatible = "qcom,qrb5165-rb5", "qcom,sm8250";
>>
>>          aliases {
>> +               hsuart0 = &uart6;
> 
> Serial devices should be 'serialN'. Don't add custom aliases.

Ack

> 
>>                  serial0 = &uart12;
>>                  sdhc2 = &sdhc_2;
> 
> BTW, this should be dropped too.

Ack

> 
>>          };
>> @@ -689,6 +690,26 @@ &pm8150_rtc {
>>          status = "okay";
>>   };
>>
>> +&qup_uart6_default {
>> +       ctsrx {
>> +               pins = "gpio16", "gpio19";
>> +               drive-strength = <2>;
>> +               bias-disable;
>> +       };
>> +
>> +       rts {
>> +               pins = "gpio17";
>> +               drive-strength = <2>;
>> +               bias-disable;
>> +       };
>> +
>> +       tx {
>> +               pins = "gpio18";
>> +               drive-strength = <2>;
>> +               bias-pull-up;
>> +       };
>> +};
>> +
>>   &qupv3_id_0 {
>>          status = "okay";
>>   };
>> @@ -1194,6 +1215,14 @@ wlan-en {
>>          };
>>   };
>>
>> +&uart6 {
>> +       status = "okay";
>> +       bluetooth {
>> +               compatible = "qcom,qca6390-bt";
>> +               power-domains = <&qca6391>;
>> +       };
>> +};
>> +
>>   &uart12 {
>>          status = "okay";
>>   };
>> --
>> 2.29.2
>>


-- 
With best wishes
Dmitry
