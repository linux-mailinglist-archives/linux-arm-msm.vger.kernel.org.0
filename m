Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03CF45608ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 20:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbiF2SUG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 14:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiF2SUG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 14:20:06 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B331836B
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 11:20:05 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id fi2so34198833ejb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 11:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Nwpelz2yYk2AJreWBU5vYWksQbOUxY6BuiNnURKYIow=;
        b=o4TASc3XH2/v+vYZDAf03ZDksUe13BzCnvdTQuNuoaKyJmU+JP/yneRRjtpwK+rNmg
         nb0iW4bXxSSyI/8az60VphieGLX+sfA1VKKB3hX+jvFIBXsKtwYgD9GgSmtc6hq2x3ps
         DhYLVIukDRDYpDaWKP99jvPdzlwwW6XYuCKoc9fSi+YUAMzeHPN8B5pjui3of9DkBgNm
         MsNOHWXtI2XO6HqQXmY9XjJTEfi8vWHk/nwRnQcsbEVL5O/efKUoUcHlvo1hcBh07c/4
         g6E1NoqmyDwCoOmyNqNg5WytBv4GmTkJUAJYu2Wg2eOd14KU23i4Zf6kkuVx+5Ovwu5u
         41Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Nwpelz2yYk2AJreWBU5vYWksQbOUxY6BuiNnURKYIow=;
        b=4N6r9JLzdqGUJWw71FW5VCdoJ0/CS/kw4YZGUKCndnVnIia+BLAYm0GlTfxwv0bj+X
         aqseUnK5uhNiaH3PIP0934/0TMRGzckNu1sqEJpZxQb6JrELkc8EwSrElUYqCVvnArNF
         om3RJtjb5Y+6pX0XwmuCc95X5zWcNKNucN10cajZt1AZnkXXyfhGhJ36RaAn3BWoJOa9
         IAETvzqJ1eSaM7/HMVTC73OzjO4KyOzXLYzFH5Jda861d+W3nu6xkor35+7gxuqceW6K
         /QoAueSTmCmiKwdVOoBWZ6eFdJ0DIOh3Rq7wwObFHJ4CJhk1SkNwB70NxZg6cJu3JwSU
         UFew==
X-Gm-Message-State: AJIora+QJ1JRxHZJ1VexxY4gV577u0IJQ3rpPf6Z6f6PC8WiaRGgPlhz
        LhwbALEzD8/w78yV61nFXABJw+8nRIqQtg==
X-Google-Smtp-Source: AGRyM1vOJ0Wdq/eNjRHXprFEM3BGQd2hjYzn4uTI1owYHLkViCQXRkwZRXcA9dzU9gJqVH+gE0E52g==
X-Received: by 2002:a17:906:9f0c:b0:724:a98e:1909 with SMTP id fy12-20020a1709069f0c00b00724a98e1909mr4558258ejc.481.1656526803787;
        Wed, 29 Jun 2022 11:20:03 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r23-20020a170906705700b006fec56c57e6sm8071294ejj.46.2022.06.29.11.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:20:03 -0700 (PDT)
Message-ID: <d2e07baa-575d-b4f2-6eb3-5e6424ec0dbc@linaro.org>
Date:   Wed, 29 Jun 2022 20:20:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RESEND PATCH 2/5] dt-bindings: opp: Add msm8939 to the
 compatible list
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, ilia.lin@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        krzk+dt@kernel.org, devicetree@vger.kernel.org
References: <20220629130303.3288306-1-bryan.odonoghue@linaro.org>
 <20220629130303.3288306-3-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629130303.3288306-3-bryan.odonoghue@linaro.org>
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

On 29/06/2022 15:03, Bryan O'Donoghue wrote:
> msm8939 will uses this driver instead of the generic dt-cpufreq. Add to the
> compatible list.
> 
> Cc: ilia.lin@kernel.org
> Cc: robh+dt@kernel.org
> Cc: krzk+dt@kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
