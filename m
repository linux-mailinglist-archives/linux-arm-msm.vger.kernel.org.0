Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1D3278F97A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Sep 2023 10:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348578AbjIAIE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Sep 2023 04:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233314AbjIAIE5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Sep 2023 04:04:57 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA087E56
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Sep 2023 01:04:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50078e52537so3121789e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Sep 2023 01:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693555493; x=1694160293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IzO9gCUfcK7k5IuvVe3uhn05iEMO5z76y81oJIjvpxQ=;
        b=JuUFwkXBhiBtLXWZzDSjP7DZkTsIF8yG2b1+ioWGL+ObGniRvouuKapBpBzqL24mCR
         2s5f+ewDtenABFY5Cmjtu5bYLyMDTH87nnccvC2SmLNA/m+rVOLObtr3ZGe+TwIYur0f
         5Ol+W7uFsWW+O8H+KZB+AYLE8zrFByn067Dq6U3g44ECrLrZiL2kQM8wuvYP9A3pFVr+
         h42XGZQHJHH9oBAlQxVDJTkh/qF3VGKPaSzBmvu+z4dyqKb1TY6HDX8QK7T+6FnaNtQX
         bxqywon9+LDa8T7weLOzaJtXy6HoajqctcL47t0jfykPjLSFLkrWFHgfVypjpbFiOUi5
         n37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693555493; x=1694160293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzO9gCUfcK7k5IuvVe3uhn05iEMO5z76y81oJIjvpxQ=;
        b=Ot75o1Q7UQVJEKPZeCwlMpQRITBetzfZ+E9hIOO5MAZCMbLlsvmFA5y8XrRXoplZWZ
         1lNwq807of8PucT0SUwuPZaOJsyk72sP09PCqVfyqrlYVf7Wo3ApF5aRSorkPDyuF3Mp
         8NSjO0vSf00L6MWLPOluBZvdj8/X/Q7sj3S1YNa5F0oakZfsb7l9akoqCl7LxB0mvLLQ
         mJpAIxSxK3KnduBiFs2DopRwAWj7qfHErZYmisWcsj+sS/MCcjItP1282h2Mmy1G9n11
         57VNYk6VdnWVPa52kvprZqWMzaqH5fcs8siOL6937T+4pKAo2PkEdHM48MMzZWEzxiTG
         9GJg==
X-Gm-Message-State: AOJu0Yzfu819C4kZrmA7Ogfinsp3MpTN/PXL6lxYro3ry0GV5LUdmT5o
        45suHI1LvoM70T0gG9qJon8wGw==
X-Google-Smtp-Source: AGHT+IGD9kp6I2JS12SaZje0a91CCugy8xHNz6eemJbMlSkmb/3tNimG4/2DqOvk9/ZGpv/nHkUi0g==
X-Received: by 2002:a19:2d17:0:b0:500:9a45:636 with SMTP id k23-20020a192d17000000b005009a450636mr951676lfj.13.1693555492923;
        Fri, 01 Sep 2023 01:04:52 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id bm26-20020a0564020b1a00b005288f0e547esm1777261edb.55.2023.09.01.01.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 01:04:52 -0700 (PDT)
Message-ID: <99045d3e-53b4-dd75-fe57-9a3465d49b6c@linaro.org>
Date:   Fri, 1 Sep 2023 10:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/5] arm64: dts: qcom: apq8096-db820c: drop simple-bus
 from clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
References: <20230324202244.744271-1-krzysztof.kozlowski@linaro.org>
 <20230324202244.744271-2-krzysztof.kozlowski@linaro.org>
 <CAA8EJprF==p87oN+RiwAiNeURF1JcHGfL2Ez5zxqYPRRbN-hhg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJprF==p87oN+RiwAiNeURF1JcHGfL2Ez5zxqYPRRbN-hhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/08/2023 11:04, Dmitry Baryshkov wrote:
> On Fri, 24 Mar 2023 at 22:23, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> 'clocks' node is not a bus, but just a placeholder for clocks:
>>
>>   apq8096-db820c.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>>     From schema: dtschema/schemas/simple-bus.yaml
>>   apq8096-db820c.dtb: clocks: xo-board: {'compatible': ['fixed-clock'], '#clock-cells': [[0]],  ...
>>     From schema: dtschema/schemas/simple-bus.yaml
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> This patch broke audio support on DB820c. Now the divclk1 clock is not
> registered, as drivers/clk/clk-gpio.c doesn't have CLK_OF_DECLARE().
> 
> Stephen, What would be the best way to fix this? Add CLK_OF_DECLARE
> support to clk-gpio.c? Or simply move divclk1 from /clocks into a
> separate device?
> 
> What is the rule, which clock drivers must support such device-less
> binding using /clocks/foo nodes?

Uh, sorry for that, I think my patch is incomplete. I did not notice
that not all clocks have CLK_OF_DECLARE. How about moving all the clocks
out of "clocks" node to the root? Then they should be instantiated,
regardless of having CLK_OF_DECLARE.

Best regards,
Krzysztof

