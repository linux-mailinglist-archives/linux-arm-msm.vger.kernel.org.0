Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18BFE6D5C4C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 11:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234190AbjDDJrY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 05:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233828AbjDDJrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 05:47:23 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D0C199E
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 02:47:21 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g19so28509321lfr.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 02:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680601639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1O1fJ/QD0Sr5hbtJk4fgvp8dFxjfJ/As4fthYvER08=;
        b=y1VjK2qIxTXGbrhW7PuyfMAZVtvaxfqf0iOUb8Sv33oWQvC8nV+B43+sPccGbRS+9e
         qAVjct7qMylS7rbl5y46NonRmXe+5R3/A/gFUPgPXNBldTDLaT/E4pT5ve/7zQYhYYRT
         H6uzRnLruQ/dVVyrw2r1Cubv9OL0XA87qCT5eyD0Jt5EQ37Yy3tj9iREJtSYF/TWoNKN
         ISelXjacTEmkXrXHcZZu72y+Y75fjaJ+Ph+9INzk/l2E6r3tA/wxdjvo+4S22Hyc38yj
         xPrxr/OqmdZHv2m0VwcwPjtUy0w5nORtdkjsWTFwNHOiD95W/YTeNSIAHOfxvh5G4bj8
         H6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1O1fJ/QD0Sr5hbtJk4fgvp8dFxjfJ/As4fthYvER08=;
        b=4B9xrZqZsY7hVqBOeL2/FlQGDJbOJWKpmSJvZ5lC8wLb4NA6J9MFNqN23SW19XoBTO
         1DqS15nXkv2MezJlE2PVxhN6oNs0NDj5QT2mPkVcfICA/hBCRrg3NaLS7sTQL5Ga3EKt
         ofG7xK9JRH5cvk8GXN9gQEc7yIyynGIdZZav0nHP7X9sZRGkucWxmm6+XilLhAeSqvgZ
         UonqBVDID8vXodg9qRTro5M+QYQSaqubRGYoV8S2MypsfNl0yWNcK5PwgdR8s1rgYSqQ
         Mv0wANFFdFjCSNhX5de+WkzioE75eZfCFa7mgJ3z2/Y7cBOU36V/5Ecp/xXNdA6i6Ius
         M/rw==
X-Gm-Message-State: AAQBX9f4EW6errZLBi1cKVtrXtXegxL/vcQXEK/TlZqD1hG10vLFJ9SB
        DqUPUtZtnWt0/6x0U4Wn7IfDSA==
X-Google-Smtp-Source: AKy350axP7aYuaRB6bZuTKw/BgneVXxibH2twHQ6/CpCCb9fd9pMdlpREVmardu9htFeu339Ig/XPA==
X-Received: by 2002:ac2:54a4:0:b0:4ea:4793:fad0 with SMTP id w4-20020ac254a4000000b004ea4793fad0mr579816lfk.5.1680601639329;
        Tue, 04 Apr 2023 02:47:19 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id y27-20020ac2447b000000b004e9b183fc5bsm2241581lfl.8.2023.04.04.02.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 02:47:18 -0700 (PDT)
Message-ID: <b99e4236-de56-95e4-f1a1-db52238e937f@linaro.org>
Date:   Tue, 4 Apr 2023 11:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/9] arm64: dts: qcom: Add initial QCM2290, PM2250 & RB1
 device trees
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230403-topic-rb1_qcm-v1-0-ca849b62ba07@linaro.org>
 <20230403-topic-rb1_qcm-v1-3-ca849b62ba07@linaro.org>
 <e1c2605c-6976-4d3e-25c8-e71145eea518@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e1c2605c-6976-4d3e-25c8-e71145eea518@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4.04.2023 08:06, Krzysztof Kozlowski wrote:
> On 03/04/2023 19:36, Konrad Dybcio wrote:
>> Add initial device trees for the QCM2290 SoC, QC Robotics RB1 board, as
>> well as the bundled PM2250 PMIC.
>>
>> On the SoC part, CA53 compatibles were used, as Qualcomm claims that's
>> what has been implemented, despite the cores reporting a Qualcomm Kryo
>> MIDR_EL1[PART_NUM].
>>
>> To get a successful boot on RB1, run:
>>
>> cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb >\
>> .Image.gz-dtb
>>
>> mkbootimg \
>>         --kernel .Image.gz-dtb \
>>         --ramdisk some_initrd \
>>         --output rb1-boot.img \
>>         --pagesize 4096 \
>>         --base 0x8000 \
>>         --cmdline 'some cmdline'
>>
>> fastboot boot rb1-boot.img
>>
>> There's no dtbo or other craziness to worry about.
>> For the best dev experience, you can erase boot and use fastboot boot
>> everytime, so that the bootloader doesn't mess with you.
>>
>> If you have a SoM revision 3 or older (there should be a sticker on it
>> with text like -r00, where r is the revision), you will need to apply
>> this additional diff:
>>
>>         aliases {
>> -               serial0 = &uart0;
>> +               serial0 = &uart4;
>>
>> /* UART connected to the Micro-USB port via a FTDI chip */
>> -&uart0 {
>> +&uart4 {
>>
>> That should however only concern preproduction boards.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
[...]

>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
This I think can go BSD3

> 
> Odd license. Unless you based it on 2.0+, please use standard dual-license.

[...]
>> +	pmic@1 {
>> +		compatible = "qcom,pm2250", "qcom,spmi-pmic";
>> +		reg = <0x1 SPMI_USID>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +	};
>> +};
>> \ No newline at end of file
> 
> Patch error to fix.
Ack.

> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>> new file mode 100644
>> index 000000000000..27d4742cdb19
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>> @@ -0,0 +1,848 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> 
> Same concern. Also in DTS.
This was based off of sm6115 dtsi, which is dual-licensed.
I'm not a legal expert, not sure how much flexibility we
can get here.

Konrad
> 
> Best regards,
> Krzysztof
> 
