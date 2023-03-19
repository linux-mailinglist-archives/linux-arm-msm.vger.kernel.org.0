Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D413F6C00F2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 12:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjCSLnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 07:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbjCSLnT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 07:43:19 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7871CF64
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:42:58 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id b20so3710093edd.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679226176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xxWabTw55wd8qd+cYP4SIvdo0VOpWmN0UD74WsPLkOc=;
        b=uXyc13MDuqZolGH3kUoJ2531oY5CbITURypC0nasP6EljJH/5lyBhCJWRAuCzdxxre
         Npr+xDn+8VT5MtHbintDABpOWKhOmqwamnop5WtbCJGNNSTCTY9rcgwpLhTJ7wo8QpEc
         q3E5XgE8AB+Ty+yOs2b3z36SoULswIPTFiro8rKIHzvr6LqpIfiJzw5j2Xj+xPgNCyax
         jZCmNnQVOQ+na2A3a0IhW3Gn9RrMdUY9wNcCcBJnXe1WMLVqcSL+gK/2r6nPzTmazpkj
         VZp7hTQwI2JY2Ie7aPubxKia2+LArz1QtODbSNbO9EzcaZvFu0IoxQqVkD3DeZF03Iuc
         Ve3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xxWabTw55wd8qd+cYP4SIvdo0VOpWmN0UD74WsPLkOc=;
        b=EVVc+qbH1xApyW4s9ADx37wByR8nlXLMHAPEophLIbiuG3fClg/VmC+/inQ/pBMoaB
         YVE3tezHi6uY0FV1oXIFwLDbu4Unh2m4MxcMtgZPmUexytz71tQQ2suZJocYyofTjioH
         9WtdjQrVlz/mGFEV7jl6pd9X3eLqsJQ8FLjjzT2cc4lq5KWTUPNOoEkp0OpvwnpqOM+N
         nas6yS9ZOdPQXfwvwKrFXZREm6F3EyGzMOlABxGIpA6u+qfGToonLt5Ay/IUpSAZSgFt
         b4XQ9IwrXKtWm5xdWj5BWLU0VvqZ4DoJbvlJ/lSFRYvkxlMHTRg/Vtc24Es1OLgqruZH
         UdgQ==
X-Gm-Message-State: AO0yUKWfR7Z6QpuMwRIgqciRreFLFIa54+wADBvofRt2Z21AhpZPZopv
        iC5ExcHTudtRx1o/eJt0/ZUdwQ==
X-Google-Smtp-Source: AK7set958bazdc1YDhAcA3kV4NeAFmnbA5G56RvJYPb86v5tUfe5H6Iex5TwmOax4+14XijNkgHm1A==
X-Received: by 2002:a17:906:c193:b0:932:1af9:7386 with SMTP id g19-20020a170906c19300b009321af97386mr5092936ejz.27.1679226176629;
        Sun, 19 Mar 2023 04:42:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id qq24-20020a17090720d800b008df7d2e122dsm3159479ejb.45.2023.03.19.04.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:42:56 -0700 (PDT)
Message-ID: <6465e5cd-82ed-6718-c628-8a55d439ce39@linaro.org>
Date:   Sun, 19 Mar 2023 12:42:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 03/18] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add orientation-switch as optional
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-4-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318121828.739424-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/03/2023 13:18, Bryan O'Donoghue wrote:
> orientation-switch it the standard declaration to inform the Type-C mux
> layer that a remote-endpoint is capable of processing orientation change
> messages.
> 
> Add as an optional since not all versions of the dp-phy currently support
> the orientation-switch.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

