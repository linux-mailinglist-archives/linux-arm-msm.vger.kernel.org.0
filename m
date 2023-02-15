Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13FA8698413
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 20:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjBOTEI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 14:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBOTEH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 14:04:07 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750CA34F75
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 11:04:04 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id t16so1840339edd.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 11:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X7zbGW5iAUlXThWXfRt9N53+MyaLgWUvpH0idsYoAA8=;
        b=Q/WlpCc5GwVyDGXb7yVHctZ8yCyIajh/9OzRAzhykG6wruaJzjKyxEkIToxj1bv4j9
         0xlBFNxzywNp36TkBwlDQm6qkGMzy/lXrySqwPIMHOjRhVedYjMBQ99nIIVIxC+BNYH+
         LF3Xt6Fx8bjjjoh2QMffYAk2G60oxdcTwMmqhAYZmt2ZgSx/bhv1nsLXi+EVsckc7J7d
         QoXLdcAQ4cHqu3AdfOd3EvXrJi7EunrzHRiLs5lL/dj7v0nv4m7khqzkDrGserob+Udx
         j7ojaYPjGeZCvVmP7PfqO5jZdeBQB+c/QGwqGg2/3eRr/x6Fewm5DSeCA1DsfXgi7Ynn
         5E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7zbGW5iAUlXThWXfRt9N53+MyaLgWUvpH0idsYoAA8=;
        b=nWeTSr3sCd3G5Yic9WLIs0/ZLaniUYtPEQ4hp7a3UEkBT//3EMQfnRGkt2mr+Q68cF
         0Jj36QjWKHY1OHFWELFmkOKCaejDA3BJ5ukcjeYLl4LZgvigtG3DgjTzdJJ6+SX75FHl
         uYlHZ6WN5CI4s2LO1VUvKjitZ5KIm0xWRjc4dvcTmf08Sbn8JATsMrAnmwpITtFGXrOH
         8WFXyf5ywJchaO1I5cZFBkS1mfNYA1CL/XmngfGQqw3uaoRDLScjIchm5VGh13siZRbN
         sakZBtRxp/EzCVvP9z2KGekWZXtYHiyJUvq6GSC9T80jlnXaYSgIHlkV5jCfqzzhy+i7
         adhA==
X-Gm-Message-State: AO0yUKUZLXxkupRiMwmpgxRM1Q4HR/L6t2bMB73Jqjks9FGrksVz3amz
        QBEzHnBNrRR9wicDY7QyBWeG5A==
X-Google-Smtp-Source: AK7set9AV76QtsFNv6eXKfMRqN81TnxQ66Lv36o+uSxtRPbLCEgtP0RIcqdAs8sBhsiz8iinFCOBfQ==
X-Received: by 2002:a50:fa8a:0:b0:4aa:a4ea:cdc9 with SMTP id w10-20020a50fa8a000000b004aaa4eacdc9mr3088933edr.16.1676487842990;
        Wed, 15 Feb 2023 11:04:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z16-20020a5096d0000000b004aad0a9144fsm9903671eda.51.2023.02.15.11.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 11:04:02 -0800 (PST)
Message-ID: <27866ba4-ea82-68b9-fa10-5c7687bcaf17@linaro.org>
Date:   Wed, 15 Feb 2023 20:04:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/3] dt-bindings: power: supply: pm8941-coincell: Don't
 require charging properties
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230214090849.2186370-1-konrad.dybcio@linaro.org>
 <20230214090849.2186370-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214090849.2186370-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/02/2023 10:08, Konrad Dybcio wrote:
> It's fine for these properties to be absent, as the driver doesn't fail
> without them and functions with settings inherited from the reset/previous
> stage bootloader state.
> 
> Fixes: 6c463222a21d ("dt-bindings: power: supply: pm8941-coincell: Convert to DT schema format")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

