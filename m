Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB1255B2D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 18:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbiFZQep (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jun 2022 12:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbiFZQeo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jun 2022 12:34:44 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0EADFBC
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jun 2022 09:34:42 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id o10so9992631edi.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jun 2022 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=e9P6heqcp+I8YkZp0/mxY/4PuhtkEMvskXjsnP0rZxs=;
        b=gPZ+TP8C/VUdtYh5E1XrqFM1GsRBMEB9YqWPMpz2s+LqPSi0zFDnLLUFJh6wh5k4gi
         Wu13zScVARUBidaetzSxo9rw8Y92Gk+eHxLWLGUWUeWDHczuOGBQBwzMifGfQ/VLKH4f
         IQQxgWApg4L8k+qIvmeuPwFFlGQhPzDhkm1W3EeDBvRphAnkhR7Vut5fcYGL/YuQveco
         u8Rl0+yiWMMbFJ5gZo790hnyfKENMsufFHbkVW/uaydwEFjmNon4H/Zq2KRynpT6mt8H
         OOMHqZ19jLot1TB0R8CX8Exp+Ss2GE6ygIf5LYxjaoHgrSg1gKISSMdEnvuKgadaLuMi
         umhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e9P6heqcp+I8YkZp0/mxY/4PuhtkEMvskXjsnP0rZxs=;
        b=hEVsueHvkxWpcgCt8TVTr1wPQ1Cao9D0JMVs8bAusJ1+uG15EnJnl07IBVDp4Qv9PI
         8QqQf0Qfqv6Cdl1AVpkxbSBEHy8A1g22Ufd35Mr7wYNKPmlwR5OBYYvowiIWPfVA7nDQ
         1htumf15UwqgGOPjPODGcjn5BXrxPZvEVHS171PZgzFmOLXU2kBGIg4HA9LkwtOS/tIL
         PfL8/rBHuG9ES+jBR6FWnq+PX7U+nf6eMCgibRWa/XgAxYBfHldl6xSM1Kfj8D3yA5e/
         EkaPyI4PkwnuFMu8r1hmALMg295tMH2HQ3HACagD6n0+6DSGHwcIfxkR3eymXVwIZFxW
         t+lQ==
X-Gm-Message-State: AJIora/XPXm6rmKLtK0Tzhgk3cZCbpeguhb86W9NZMVIc9/uyxZCdSx+
        M0F/7GpCgpTqZQZNC9zhxP0I8g==
X-Google-Smtp-Source: AGRyM1uBmdo7hfEaAegqO2f0OjVvZbRL+mNwQ9yHklFk0lD/O1yymQ4kZm8iycCmjFAuDIyXYUJjhQ==
X-Received: by 2002:a05:6402:2948:b0:42a:ae0c:2f26 with SMTP id ed8-20020a056402294800b0042aae0c2f26mr11707300edb.425.1656261281414;
        Sun, 26 Jun 2022 09:34:41 -0700 (PDT)
Received: from [192.168.0.242] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c11-20020aa7c98b000000b00435a912358dsm6144469edt.30.2022.06.26.09.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 09:34:40 -0700 (PDT)
Message-ID: <d35bfc8d-24ca-a3f7-49f8-e9f4c9ffec1d@linaro.org>
Date:   Sun, 26 Jun 2022 18:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: Document lg,judyln and
 lg,judyp devices
Content-Language: en-US
To:     Stefan Hansson <newbie13xd@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20220626151213.10159-1-newbie13xd@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220626151213.10159-1-newbie13xd@gmail.com>
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

On 26/06/2022 17:12, Stefan Hansson wrote:
> Add binding documentation for the LG G7 and LG V35 smartphones
> which are based on Snapdragon 845 (sdm845).
> 
> Changes since v2:

This goes after ---

> 
>  - Rebased on top of
> https://lore.kernel.org/all/20220521164550.91115-7-krzysztof.kozlowski@linaro.org/
> 
> Signed-off-by: Stefan Hansson <newbie13xd@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
Best regards,
Krzysztof
