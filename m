Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E528F737344
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 19:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbjFTRwi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 13:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjFTRwh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 13:52:37 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D91D1722
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 10:52:36 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51a2c60c529so6122587a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 10:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687283555; x=1689875555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gs0JaMdxaK1cDSK+TclP/9U4A4K+O/89wzrG8AQc9xI=;
        b=mjmHOOAqBwAxZzSllQNJxf665tsGphMNTFp77Y2bw+g48Flapr6EP2l/0RRjjLheCf
         +/2mjdMD+NX9c2KX0vodQwNGtZc4OOotE8XIrVYLUSUV30H1VuYoPzQDo6IQIVxfndJb
         wbUMackc0dtA4x+jLAVPJ4i/Vm+zYpjU7aKWDYnvOBET1f9Kp6GrNbIVOVlbXREQ3M4x
         YkhZZTLxRAQg0PdpwHvvctApE7GjwUC7uwdoVnBnWvKJcAgYwl5gu3eVWlLbKiCcHD31
         i3rYIlTl2tgPkQF9sbnWuLqFDIDl5JVQR9rcAl291I9aeTi0Fe/HASY+xEu7Zzwa/0Hk
         QrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687283555; x=1689875555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gs0JaMdxaK1cDSK+TclP/9U4A4K+O/89wzrG8AQc9xI=;
        b=YlOLHz+ye3AOCPnM91K0oyhCfCM/vrY9KpQxa0xJn7OW4uv0vgr8GL/hLpFpTKQfts
         hl6ijQWv+JEAeuwbkJu/Ghg28J7fnpvTVP/cos6urFG7u21ZFAZYGwssX+1kPtgPvz+U
         yUupg1vc5l1vAc2UmhIAhoo4oVWmZQtUi0fSKBNR4zPFqb5UzveyCdngBSyAGGkEGX3h
         hXFz6nJzCkgM+qFdwHCXhYJCuJIxjfB76J5jAsUH+rkuYIJp9qd8j2bug93YjnPx9TtC
         hOusoB+8AcEFGFw3wGsX8bcl4AhfnaVqhS/MCRGna9IKb40ewKPA9e+lF9ifcCGlhlkl
         GYyw==
X-Gm-Message-State: AC+VfDw4k96zA1nSGiEtxqlGNooU3hbapNE69pKvv4/Eq6lUj46VQnlw
        uZ/NlhDSjxnIBZv9pomXgcgl7w==
X-Google-Smtp-Source: ACHHUZ4Em/Ifysew+y1s7Iw/jNPQp6xq0vy6/GtUvreRdDs/WnjMo3QTxpW0ZCC9qOFrwQpK8dyXCg==
X-Received: by 2002:aa7:cb17:0:b0:50c:2215:317e with SMTP id s23-20020aa7cb17000000b0050c2215317emr8192954edt.15.1687283554877;
        Tue, 20 Jun 2023 10:52:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ca22-20020aa7cd76000000b0051bc7483bc7sm1522173edb.78.2023.06.20.10.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 10:52:34 -0700 (PDT)
Message-ID: <f038a41a-bed5-38f3-889c-39c42f024393@linaro.org>
Date:   Tue, 20 Jun 2023 19:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: qcom,sm8350-lpass-lpi: add
 SM8350 LPASS TLMM
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230619092735.20323-1-krzysztof.kozlowski@linaro.org>
 <20230620172753.GA3858158-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230620172753.GA3858158-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2023 19:27, Rob Herring wrote:
> On Mon, Jun 19, 2023 at 11:27:33AM +0200, Krzysztof Kozlowski wrote:
>> Add bidings for pin controller in SM8350 Low Power Audio SubSystem
> 
> bidings?

It's actually real word...
https://en.wiktionary.org/wiki/bidings

:)

>> +examples:
>> +  - |
>> +    #include <dt-bindings/sound/qcom,q6afe.h>
>> +
>> +    lpass_tlmm: pinctrl@33c0000 {
> 
> Drop unused label.
> 
> With those,

It is used through gpio-ranges below:

gpio-ranges = <&lpass_tlmm 0 0 15>;

Best regards,
Krzysztof

