Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB3F355C5CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbiF0IbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 04:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233590AbiF0IbF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 04:31:05 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC826305
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 01:30:55 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id pk21so17566156ejb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 01:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=r/k/Wup5MZ0W8s3nAcDiEGYXaMuQoL3NODuPPee+xMA=;
        b=lV0hqjwlV3MZhzxNn8J0ngh91fVXmi9vWf/WIa5/b2W1b9+8oIcFRgKOPrdy+8dASR
         DOdrhMBP+fGLUTzjFZcAkLERbuOw/AEEQlxqYHhNhNrZ18MI1wAyuyOJgJAlRMOStXts
         pxJ0ngjLsurtzrBRPUCQVX1+dMoWH2hBa8MqTyE5pLkJbOPVg2gJcRpoTIfM4aVY/1Lz
         +oNOJz7kwGPZ/nSVXeXvg/udtItq05wcqGBlIengWSF+eNWJXyBA036sa3papisnP6sE
         XoDS2OOwa0O8pEu0ASXNFVkFmRhISkXRsK0HvE8ENyV7PmT+u4oN3sQjlYeY4LSrdCRL
         +Iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=r/k/Wup5MZ0W8s3nAcDiEGYXaMuQoL3NODuPPee+xMA=;
        b=ufV1cat7ltO4Ain3fL8yjJEAOwEDJ6Qt6oa90eIlptiahq1gzSzwGToQTrWa+BhSpa
         bzq2KJvEMneuGAFbfg0hi7K2mJ8ix//Z/lw4KL7J7UfhTpn5FdbbZo2xzADPVVy1XRs9
         D8SzObr/u209ppTL/ExaTaBxHbLPIfC9lGnfhN4iiFfO4l0efy5bYJP4Pw+u1oBv0izM
         Xz5HC5QuxZFqsv36hgBXSMgJBF1IxXQfrXGGdTqEqaC7+Rlp/zKmKCrv59VZ33iNp90h
         BT0nqmif8x4El0eaJCo2O3P6VpqRb/LQAnNlCHZ2YoPElRjB25H1szKUUewe3a7EbO+A
         AKZA==
X-Gm-Message-State: AJIora/f7Sh1Y7MGCdyus8xaLee40HDmsv3DTwK1nndUVh1KYSO39wyT
        4Hsj2wMYC2lYESVB4bTXRdND3w==
X-Google-Smtp-Source: AGRyM1tnzpEH5baCKq/SmMFgmvAPOw8Kzw5ImotQVhY6SXQgyGQuIua8gVHp77Z1u1oYmIlUc9d81g==
X-Received: by 2002:a17:906:5512:b0:726:be2c:a2e5 with SMTP id r18-20020a170906551200b00726be2ca2e5mr643759ejp.88.1656318654433;
        Mon, 27 Jun 2022 01:30:54 -0700 (PDT)
Received: from [192.168.0.246] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x6-20020aa7cd86000000b0043574d27ddasm7019774edv.16.2022.06.27.01.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:30:53 -0700 (PDT)
Message-ID: <f61cd23e-2e37-accb-6e6c-69fcab0cc3d7@linaro.org>
Date:   Mon, 27 Jun 2022 10:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: adjust whitespace around '='
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm@kernel.org, soc@kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220526204248.832139-1-krzysztof.kozlowski@linaro.org>
 <0a35d997-7e7e-8847-7c87-edd33719f7a3@linaro.org>
In-Reply-To: <0a35d997-7e7e-8847-7c87-edd33719f7a3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/06/2022 10:30, Krzysztof Kozlowski wrote:
> On 26/05/2022 22:42, Krzysztof Kozlowski wrote:
>> Fix whitespace coding style: use single space instead of tabs or
>> multiple spaces around '=' sign in property assignment.  No functional
>> changes (same DTB).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Output compared with dtx_diff and fdtdump.
> 
> Any comments on these two patches? If there are no objections I'll take
> them with rest of cleanups.

I understand - no objections. :)

Best regards,
Krzysztof
