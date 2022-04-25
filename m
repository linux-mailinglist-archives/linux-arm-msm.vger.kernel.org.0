Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B77050E7D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 20:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244253AbiDYSQZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 14:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233957AbiDYSQZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 14:16:25 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9530E111161
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 11:13:20 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id p18so14279188edr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7iXUh6w5klPzZmwb5uwLAuLc4DT8QKgVuYqByN0Wq3o=;
        b=dLfuIvuztwY7oZGDEDolqppkr6SYbEWG/68mEJoZoBp4Z5VJ3RUsY7L9CWlSy54GqE
         6I5QpJz3r5cYEimbdAZJzIN5QwEk0BGT8321wJ9DPZ90/Y34FX+lTatOJzGrGU51siY7
         ORTAYBCMTQfA1dGtSbjYBHnB2ZzES9Y7MtYEw5Pq2X7B0+o2Cr2qZYBlbNE4BO/sa56S
         VArRa0BUdsnQijAtLKrw/OqFMpL9bo0EduNxn/yqQdBYzvFbgepPHwY/UnTRx5TG5lyc
         rEX15Qs9D88Qqr+9c0Mb/CsFOfmc8LCEZenrrCtqdeOPPP6W5Sm/GuP3bpewkk+ntqQB
         sHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7iXUh6w5klPzZmwb5uwLAuLc4DT8QKgVuYqByN0Wq3o=;
        b=fCflyM46/uUE36mlILYN2rKs/jcSYrpyFq1fcWg/bmTN7RqrREl9In8cO6jZI7I0RF
         nybxO2K9vaW2jp+rodwg/lAyXd0k1JK6d3bmj6PJtwm8BMKLMU0CaBn2axGnh3pdtMom
         MP0J1OAFGxCiSl7Vxps9edTDq+CmgVtjMx8X5Ejwsq1l/XiXj4a0tzbIhM09hIt+Kysq
         WRebSV9ixRpmiAnfOS0lo1Z2flTxvzMYjfBndg0C5VIxh3ioIC/mb09nbBeOX+P0Eg6y
         9gE/kUcjA9CpeMhYyWwzWwBRGtds0VM5n/KKjAFRdoe7S8bGTKgfP5UwsRnZ7gjMgs8X
         I33g==
X-Gm-Message-State: AOAM530zsQd6nbvkGlqVKBEW05s/0hMcIvbMjycihqz4LaFqWGMyGwGs
        ZxrmnyC9LlGXuvFP8Vq9URs49Q==
X-Google-Smtp-Source: ABdhPJxKuXeaUAj8ZrVnSgp5aI4Q43HTeLfHUZ/VwVZHs7i0fciNqh+oIbav14YsHrviQQqTDLBXaw==
X-Received: by 2002:a05:6402:2999:b0:418:eb22:64f9 with SMTP id eq25-20020a056402299900b00418eb2264f9mr20130391edb.391.1650910399169;
        Mon, 25 Apr 2022 11:13:19 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006e894144707sm3904428ejb.53.2022.04.25.11.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 11:13:18 -0700 (PDT)
Message-ID: <1c356a5c-ae85-9aa7-f8cb-e463480c24b8@linaro.org>
Date:   Mon, 25 Apr 2022 20:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: clock: qcom,gcc-apq8064: Fix typo in
 compatible string
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220425133527.3723233-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425133527.3723233-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/04/2022 15:35, Rob Herring wrote:
> The compatible string should be 'qcom,gcc-apq8064', not
> 'qcom,gcc-apq8084'. Found by enabling undocumented compatible checks.
> 
> Cc: Ansuel Smith <ansuelsmth@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks Rob!

Fixes: a469bf89a009 ("dt-bindings: clock: simplify qcom,gcc-apq8064
Documentation")

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
