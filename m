Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573CD50FB37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 12:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349363AbiDZKqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 06:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349043AbiDZKp4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 06:45:56 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25535D52
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 03:36:35 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id j6so1297468ejc.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=03JHyVcnDtVRCT1SZNlsYY6E7LDhShIBmeQH7UCWb5Q=;
        b=TLmerg/GnvN27In+YodvcDqxMfddqh49b8DPl2i75Ctw7YdreDnekmhoIONxgupBK3
         cljPnMDHPuHi+TqxLolsnnSvvO5THxbVDg7QIxBJVf+OA5hZ7yfGtDuje2WZf7gQAKt9
         nOMgs/BZ5KjfMPVQ43XeMYpOMBAJvJM9kOGEPfyXNbcTowT743xsqsfabmWcKwGsrBsS
         xP7V72u+YQwHg40v3OKtYOGtEjS3HllQvWrXtbxAM0GUMTc/OFZJtR/UYB0oZwfz+BzQ
         +c4QxCLjqHXATif+W/FxwIi6kgXHwAEJELnuUkE9MCiWiGcO8pm/Vbi5L2mned/HUKn+
         Nkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=03JHyVcnDtVRCT1SZNlsYY6E7LDhShIBmeQH7UCWb5Q=;
        b=ZoLHoQFj/6bHE7HEsCB70YQQf0UZqZMoorwqRdWROYIpMBrcxysS8QYO3u3RP34EBw
         utSqD3yYnIOTwgfOHSICyTWPyz+O+06tb4Suz7ScbB1ucketI7px5hUUvNedc57t6+x5
         mKa8Uv+T4lDPaJhsBZGmFSqPBublujUICwFBt4SnNOYhyYXgOgEA5A5IXWnpFdtb1ttv
         xBPLaICL51qGeVhrgnRlsbB3lcuMESIwXqBNZyHTr5kGY3nMhWoUsLjv/oVt5zpair+O
         URaLhbESezgnCalijjj0OuW5kF371SXE9CDqhanoPKNL26NTpgIKsEKyXb7jTSeN3GqV
         Yacw==
X-Gm-Message-State: AOAM533UytVnr7j4K9GyvngLRQ84AOhVJRJD/J1/vYiEYJmNq6NfZJgU
        Z3WE7JzU4gi7kipWsjceVI3LQw==
X-Google-Smtp-Source: ABdhPJw6DaMltbJJc7Yzq1Tp0x7WQkv+N3L4u8ibEqiMFEoXnXRu3hTBOVsKOG02p9gMJClHF/WxHg==
X-Received: by 2002:a17:907:a425:b0:6f3:6b5d:a29c with SMTP id sg37-20020a170907a42500b006f36b5da29cmr15857758ejc.144.1650969393687;
        Tue, 26 Apr 2022 03:36:33 -0700 (PDT)
Received: from [192.168.0.249] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i12-20020a05640200cc00b00421058b175esm5978605edu.53.2022.04.26.03.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 03:36:33 -0700 (PDT)
Message-ID: <d1cd8e2c-d882-5f6b-863a-2c623fa38edb@linaro.org>
Date:   Tue, 26 Apr 2022 12:36:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom-ipcc: simplify the example
Content-Language: en-US
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, netdev@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Alex Elder <elder@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>
References: <20220402155551.16509-1-krzysztof.kozlowski@linaro.org>
 <a3edf0e1-644a-38b2-b23d-30cc01005786@linaro.org>
 <CABb+yY3uRxKdQ_Q-yvWipmOqLNbJXmJ141oYJnq1di_Yu66T_Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABb+yY3uRxKdQ_Q-yvWipmOqLNbJXmJ141oYJnq1di_Yu66T_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/04/2022 16:22, Jassi Brar wrote:
> On Wed, Apr 20, 2022 at 3:42 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 02/04/2022 17:55, Krzysztof Kozlowski wrote:
>>> Consumer examples in the bindings of resource providers are trivial,
>>> useless and duplicating code.  Additionally the incomplete qcom,smp2p
>>> example triggers DT schema warnings.
>>>
>>> Cleanup the example by removing the consumer part and fixing the
>>> indentation to DT schema convention.
>>>
>>> Reported-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Jassi,
>> Do you plan to pick this mailbox patch?
>>
> Yes, I do.  I am ok too, if you want it through some other tree as a
> part of some bigger patchset.

It's not going through any other tree, so please pick it up.

Best regards,
Krzysztof
