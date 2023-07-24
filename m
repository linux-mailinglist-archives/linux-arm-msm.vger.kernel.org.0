Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29B0A75EC88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 09:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjGXHaU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 03:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjGXHaT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 03:30:19 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08715180
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 00:30:18 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso5688581a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 00:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690183816; x=1690788616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eed6DWLt+PAEv2fzjhFaM4EpHWh4NNsUY/bR4Sum1Qg=;
        b=EmZgAehGQ97/7mCNx9Vh4rXZQJcq1j3xQYqIFIr5TzLHKf9EoUo2a0OM13XHKRWmoO
         wNJymeEVAkOy7CkiuWPXHku39fqur6sFta09jHEwYX2ZE1Fz0s0Ljidbj5SNnElE6ijQ
         y1p74Ik8p3rw3wN/2Ftn04UwSkFSjXiAqjnrkOMgAZzXtooaOoJ7AgnCWrCR2lIxzUg6
         EvY7azry2ww+y7w6yfjja3fNmWHBIdvxfZ881+z2y2NZn6BmjlnReCEixqnzJ3tNB45d
         ASFCA63fD7ZsB5r43yBmsXWcTpEhqYk1Xe0QFXWQ2mGEA4V3jk465pEqejM15Y0jQC5m
         QYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690183816; x=1690788616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eed6DWLt+PAEv2fzjhFaM4EpHWh4NNsUY/bR4Sum1Qg=;
        b=a7FWtt11UHgWp1bvSXB0rDbFzfUk2eFS3UOcGgLCP0pA67xOTW2NdsKILBl4DiN4TJ
         6097ndbkCGZM3x129D+intf0vqyNMwaneA29Ia2lc5gq+NRY4+gBMaV8nMn0Tqy8CeYu
         2inPDAHG6V89i8A2aAVE+2NoJGZgAuRV/XDmqPVah8Sxf74YBqeSv2lJZicQ+QmiWGpW
         4aPLmQlHSjn3FTofddeQtIQDJGvKW6hM8gZ3O7CwTGlafOunJfhjdIOuekrEfGSa7AE+
         NVF37rmJQ0x7Q/ppmsIEZVFKcQw+0479qaFq7pnC9rQZjEB25Qqm1S/OH20+kuMIBmWr
         Dhlg==
X-Gm-Message-State: ABy/qLZU1xm6IXocqst4v1gp2FYYgYiJDaT2/OcJUGhjxLF/nd1b3x7P
        lU5qXr/l1zssxjiE8pKMADnqmg==
X-Google-Smtp-Source: APBJJlHN5lEzBHCiCy4veV+lfNob/NcWAOyoO7Ae0VmOjJ2HIf52w8Jy/W8Xuq9xRA3IolmjYuCDkg==
X-Received: by 2002:aa7:c753:0:b0:51e:1a51:d414 with SMTP id c19-20020aa7c753000000b0051e1a51d414mr7133256eds.32.1690183816446;
        Mon, 24 Jul 2023 00:30:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id q16-20020aa7cc10000000b0051e0eba608bsm5717511edt.19.2023.07.24.00.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:30:15 -0700 (PDT)
Message-ID: <22ebee3c-c11e-ed0b-bade-c9a845f3ca41@linaro.org>
Date:   Mon, 24 Jul 2023 09:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: qcom,hfpll: Document MSM8976
 compatibles
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230723160827.22660-1-a39.skl@gmail.com>
 <20230723160827.22660-5-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230723160827.22660-5-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/07/2023 18:08, Adam Skladowski wrote:
> Document MSM8976 HFPLL compatibles.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,hfpll.txt | 3 +++
>  1 file changed, 3 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

