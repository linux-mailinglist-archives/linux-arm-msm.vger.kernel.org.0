Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D03583DF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 13:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbiG1Lrf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 07:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235201AbiG1Lrf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 07:47:35 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49D7FD1D
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 04:47:33 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s14so1691660ljh.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 04:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n0GfnOx42koEcO5+/PVzP+w1zirglEDHUOT3VpjHSPg=;
        b=K5NRv5yHc/zPIxFDViCXnDRQ3JPb3CkvlN8nCjU0H+WnC+ZCxaSXgX2CsVyjrvfCc4
         FH3d9VPzUC9U/rbBFX9qZCzeXyPo8/uJ+8o6aqEPvdo+tWKwLPWgNmjG6Bn8CWOGoLPG
         b1WsistX7ROQS/wAoNm2FmksMVGZfx9laqc/6NgODjwEhzoNM1ZrP5W+2EiwiqKjnI4P
         3HYYyTjrSHlrmX759/3nS9CqNSUYCecX/CMVF0xDYsaBwXTQ7IBKEgXe9LGTZ+SvWTi0
         7+3ZZt11Lgzgc9ZH6J5WqvWC9cNV4lDEP08g2heMab2UsLm4y2X/E59OyewWoNCbI0yO
         neTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n0GfnOx42koEcO5+/PVzP+w1zirglEDHUOT3VpjHSPg=;
        b=YUI0DP5imB23DoV5wX0TiIAJxcU9F0kiiMB1MAQCInqzZ6LNqvZds/jPkPzwzjUaZf
         AZXpQYrdrGB0HjByajAdEOIwlv+KV8LgbGWkBX9p/V8HSpwapZGjxsBBd+6ZUNgXEIDr
         p8NioFtHGhVGhYTUxyR8KvmsmulWurXNT2HS3MP8Qtssk3guT+jAEoUA8XQXf6dxLpYR
         CopnyFGRAS9FqM5vtcAzpalYYY/kF9x63VyWsIuTRH7puYrmiYHS3x7iyI+uOKZaToQ6
         AtROXaCou/7t9JYDGSo+JaoEszONYv87YU+I+aO5Td2ihd0eIMJVivMov1wQulEgw1X8
         LIEA==
X-Gm-Message-State: AJIora8wbq804LLTvdPZ3MuHKAWm3h9uqyPLg2BJXFHyMBBFuYLNyD7v
        YIR3z6am3ULNIExQdZb42Q3mkA==
X-Google-Smtp-Source: AGRyM1v4vjYqO3CkCMpBNTBZ/IKMSVwDPE4TYZ0uxKEVLNs/RiM2204FwMlW7/gwgeSXvTXEKcTw2A==
X-Received: by 2002:a05:651c:118a:b0:25d:e721:a35a with SMTP id w10-20020a05651c118a00b0025de721a35amr9114206ljo.278.1659008851776;
        Thu, 28 Jul 2022 04:47:31 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id u30-20020ac251de000000b0048a9603399csm164412lfm.116.2022.07.28.04.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 04:47:30 -0700 (PDT)
Message-ID: <aef9bae5-b72b-d520-a8e5-8f6a838775eb@linaro.org>
Date:   Thu, 28 Jul 2022 13:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] dt-bindings: phy: add definition for MSM8960
Content-Language: en-US
To:     Shinjo Park <peremen@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220728111740.30595-1-peremen@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220728111740.30595-1-peremen@gmail.com>
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

On 28/07/2022 13:17, Shinjo Park wrote:
> Document the changes introduced by MSM8960 inclusion.
> 

1. Thread your submissions.
2. Use subject prefix matching the file.

> Signed-off-by: Shinjo Park <peremen@gmail.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>

It is a v1. How the review tag got here?

Best regards,
Krzysztof
