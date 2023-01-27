Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C5767E724
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 14:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233253AbjA0NzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 08:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233221AbjA0NzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 08:55:00 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB5D1EBEA
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 05:54:57 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id t18so5066600wro.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 05:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvWGdXV/thMosfYPTWfHg4iggB9oYYlKgsQ4IGe6GwM=;
        b=zJTsB5rxzOcR/IQYI9B8TxrquxjCdAbnkHrTFD8HEyhKVAeUU0jRRpKo5Onkmgw+8f
         LecJidjIYiWCZ5uOeBhO+LrbIofHOyJjGmRONA5EbKaB3OvpeGJsni6GpV9RPj2X2zJK
         zmf41T0tUELAUdLRqRexXHiVBwbFmp+pp9i1m3klI4+GhOLbQFnpqtIGLeXAOwZnEFWg
         V4hxqgs5YYzT5o1wU+W2H01NRiD0I76vFvd87pbAjZV/+Qp5eda/WReQe3ykkQc92Hx1
         2y9mI+x+37TnvknkQiiRR5+x4FpS22rkz7euvU4biICD3IIgIVLmqAMv700+7+8k7qx3
         vO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvWGdXV/thMosfYPTWfHg4iggB9oYYlKgsQ4IGe6GwM=;
        b=Fp949T0j2J/n1HQ68m0f7XEAN+oAZcJOQ5ZwecX/Du9zQ07AcuO5GE/tya/3G57gtN
         a3SyFgtV17aHqgaxFyp/Ykkvtb6PHU+9JU6AyG4Dsb+D6xPrqKdnNhrlVo5mhsj2emqe
         tjGeg+F9ctA8Y6tWeqOiRD0VdGG99EvgkIkRJx58btiXeUWv8ry8aRn37bEtTPFe/UJd
         nigjBQPSX2vCXWzvnMC5GEfxd6O/k78lVFLLgD4bS/ygPs1Dd4RL6msNETHTVW+BlS//
         +/+yy6lY9dzPy7kIouXyXk/AF5XAnGsxa197lZ8ZWW1HrkE5aUvsVNehTdoMd6nSyIJx
         TQiA==
X-Gm-Message-State: AO0yUKXzOXESK6SUzk+WrUqrzRptplhxblH/XUC6lWOvCV6PhfTY1ur9
        flMvu6Ms0Gir4HKALdaDXxj8HQ==
X-Google-Smtp-Source: AK7set/VMRyDDltG22cGu8ihRDW1/IpQliCrs2cHrRkWoMH5gk2TrOoECuH9qH4INUYj9vpys2Hgew==
X-Received: by 2002:a5d:4988:0:b0:2bf:b3e9:d338 with SMTP id r8-20020a5d4988000000b002bfb3e9d338mr11210015wrq.31.1674827696348;
        Fri, 27 Jan 2023 05:54:56 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s5-20020a5d5105000000b002bdfcd8c77csm4073373wrt.101.2023.01.27.05.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 05:54:55 -0800 (PST)
Message-ID: <951e4459-6d98-f083-1dd9-fc0b12e53c96@nexus-software.ie>
Date:   Fri, 27 Jan 2023 13:54:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm6350: Add camera clock
 controller
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
 <20221213-sm6350-cci-v2-2-15c2c14c34bb@fairphone.com>
 <e5ff49d4-45c7-8c4a-d624-d8f7cc9ce2cb@linaro.org>
 <CQ0I4ONEI6J4.3KWS1KBE7RTKD@otso>
 <3ae863df-3260-4863-d88f-da4d3f442174@linaro.org>
 <CQ2ZDQKO11XZ.HA5CXLK5MTFB@otso>
 <2989138a-8f4b-50a0-3e90-98b6785f2690@linaro.org>
 <CQ2ZY0W1M4F5.32SLTSYMILGOS@otso>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <CQ2ZY0W1M4F5.32SLTSYMILGOS@otso>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/01/2023 13:11, Luca Weiss wrote:
>> Doh I meant to say a power-domain to an mmcx a la
>>
>> power-domains = <&rpmhpd SM8250_MMCX>;
>> required-opps = <&rpmhpd_opp_low_svs>;
>>
>> TITAN_TOP should be in your cci and camss dt nodes.
> Okay, that makes more sense.
> 
> What I don't quite understand is why sm8250 only has MMCX listed there
> since downstream has both vdd_mx-supply = <&VDD_MX_LEVEL> and
> vdd_mm-supply = <&VDD_MMCX_LEVEL> and both "supplies" are used for
> different clocks using .vdd_class

power-domains = <&rpmhpd SM8250_MMCX>; == MMCX_LEVEL required for camcc
power-domains = <&camcc TITAN_TOP_GDSC>; required for cci/camss

now that you ask the question about MX_LEVEL you're making me doubt we 
have a 100% complete representation upstream TB perfectly honest, 
warrants a deep dive..

I just remember that on 8250 we tripped over MMCX not being switched on 
when - display I think was switched off.

---
bod

