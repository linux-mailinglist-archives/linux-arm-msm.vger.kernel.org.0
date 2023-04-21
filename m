Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA3646EAF0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 18:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbjDUQ2H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 12:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbjDUQ2E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 12:28:04 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 380A713F8C
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 09:28:01 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-506bfe81303so3099488a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 09:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682094479; x=1684686479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S51TzJEKK9WWVDYr4Tc1gJpcMzkHWh1WXqblt4YDlC0=;
        b=CETPV90ihN3b3DZOnlv9hQKr0fh4gspi1VCr9VdP4hwDkdtmZ9AgF5tdmnECAHPp+V
         RKWp1KvQD2X5o8mx+dj5hshVZywtPp011NNTJ1RVMADvlgve1fngNYOOtu8/mkGQv8S3
         UQ4bja+i7aMHCdtiERCr0Kgvko21kA8OJ2FNFCa6SRpFiBUyyaljnZWHdVDyu8sksfeI
         h/qQuwtNvzj1lVvuYVJr/87Ah+oIUnGt4mEOfV5eBH3noIbpPg+/FxLR9om20wPDR89K
         TyR4zf0P3Hb8lkQ6duOweA3p9nR6TklUsLo05M+ge6x8oJzsaY0bBFh/y2FVuvSzXZaw
         IJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682094479; x=1684686479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S51TzJEKK9WWVDYr4Tc1gJpcMzkHWh1WXqblt4YDlC0=;
        b=LtVtHEDQ85pLr5ke4Qy7WfqAlLPyXyvMZ5XPG/xQLfyryBcdnQjSlhnVeoYcs07dle
         Sr0VBAY1fTrR3bo/5RDQe7gUO/dy/GrA9geBWsdMOIF/847XrOn2d9u/PTli6t5fdwLP
         O4PdgmiwXlhS4BCYDn6gkO57ZphFV4BdadSdvQsbEwxXr2vJxeaC2nkCkhOvSt/hIpSH
         UEK9/aaem63+c65SStjKrnptTyeY9IqIxf7VZv9ndMPyDzsk2kiODoi8gDI5vlzqd995
         ufmKMDCklxgAgL0tISHtS4unw7igeBglb3BCflH9FkhRbjt3fn7dmmIUH+h1wkbBrRUD
         zXvA==
X-Gm-Message-State: AAQBX9di2id62MtqAdgjF8N7TxknnntAA/RXZvbY4aApVZZSdR8/3VIy
        ZSbbQmJ5y7D6Mcv8WGcvjlelBw==
X-Google-Smtp-Source: AKy350YDsOgKLoK5tAIioZExs34dWYBZrpIx7o0tWafmx6898YyxY8cwVVzZn6+Qk1owXo7rwySlYg==
X-Received: by 2002:a05:6402:6c7:b0:504:9345:ffa4 with SMTP id n7-20020a05640206c700b005049345ffa4mr7172456edy.21.1682094479554;
        Fri, 21 Apr 2023 09:27:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883? ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id v1-20020aa7dbc1000000b005029c47f814sm1983225edt.49.2023.04.21.09.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 09:27:59 -0700 (PDT)
Message-ID: <f8aae62c-e3c5-5fca-7a56-0bc9c0efbd66@linaro.org>
Date:   Fri, 21 Apr 2023 18:27:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 2/8] dt-bindings: phy: qcom,qmp-usb: Add IPQ9574 USB3
 PHY
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        Johan Hovold <johan@kernel.org>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1680693149.git.quic_varada@quicinc.com>
 <1efa9a64499767d939efadd0aef897ac4a6e54eb.1680693149.git.quic_varada@quicinc.com>
 <0a66e291-a86d-1ff9-e674-839b8cc8f1da@linaro.org>
 <ZDz9t9TkBqZ1fcfn@hovoldconsulting.com>
 <20230421095838.GA5813@varda-linux.qualcomm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421095838.GA5813@varda-linux.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/04/2023 11:58, Varadarajan Narayanan wrote:
> On Mon, Apr 17, 2023 at 10:05:11AM +0200, Johan Hovold wrote:
>> On Thu, Apr 06, 2023 at 09:41:49AM +0200, Krzysztof Kozlowski wrote:
>>> On 05/04/2023 13:41, Varadarajan Narayanan wrote:
>>>> Add dt-bindings for USB3 PHY found on Qualcomm IPQ9574
>>>>
>>>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>>> ---
>>>>  Changes in v8:
>>>> 	- Update clock names for ipq9574
>>>>
>>>>  Changes in v6:
>>>> 	- Made power-domains optional
>>>>
>>>> Note: In the earlier patch sets, had used the (legacy)
>>>> specification available in qcom,msm8996-qmp-usb3-phy.yaml. Moved
>>>> to newer specification in qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>>>> ---
>>>>  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 43 +++++++++++++++++++---
>>>>  1 file changed, 37 insertions(+), 6 deletions(-)
>>
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: aux
>>>> +            - const: ref
>>>> +            - const: com_aux
>>>
>>> Can anyone explain me why do we name these (here and other Qualcomm
>>> bindings) based on clock name, not input? Just because different clock
>>> is fed to the block, does not necessarily mean the input should be named
>>> differently.
>>
>> I guess part of the answer is that this has just been copied from the
>> vendor dts and (almost) no one but Qualcomm has access to the
>> documentation. What would the input names be here?
>>
>> Also note that there are SoCs that enable both 'cfg_ahb' and 'com_aux'
>> (e.g. sc7180).
> 
> The clock name definitions are auto-generated based on the clock
> tree definitions provided by the h/w team. We followed the naming
> pattern done in the previous SoCs.

Are you sure? We talk about clock inputs here.

Best regards,
Krzysztof

