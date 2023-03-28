Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA5C06CB76F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 08:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjC1GpB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 02:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjC1Go5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 02:44:57 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30535126
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 23:44:56 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id ek18so45377199edb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 23:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679985894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmTvziNt2VFrSmXaXHn7cfTQldiBzclyda4PoCjJxWE=;
        b=KDvjJ+sJSVFfF+ax9cNRTuZm3PPD4QOVnSoLIozYu62wHnN0LvthEFWDLtXVvroHmO
         UG9miq8QhrSuSD27nq641NkuPALs5ipEHnV2igK6U9zVyewBXLMQOl9i+yOXyBoC7lO5
         +RWiBPkGLmNJk6NBYnc5sgw9mquFl1aSyyfIb0YeNCzFf7oPSekfsQhhlM7O4frh3zA2
         mbjauxBgowvPV19/w2zFI47p57F/g/8S6qlIcTdtJ7NDO09LanXxtC3z2GTab4qNsumB
         F9bLEszOEd2ps5tmD3bCfc0BI90KsOK12rR+l5AvfV/oKzqwipnPXF382hkkXduQ1Hu6
         LtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmTvziNt2VFrSmXaXHn7cfTQldiBzclyda4PoCjJxWE=;
        b=0jxD5qd38MyK65nd3stxWr8nAYUdY6vfNYGMEfaMHNCO14ksIdo63TKgcKm3suaPrB
         mov5Nr/oFkUA+Flqzk738VDbgLw7r1eN6wSQIDWDYBEuw79Uv/kRnZaNkCSBOe+2smCW
         n9cfnGW2bvUnLZHVycyxXcKVU4o6NA5Qmd94LvfPOOoYH1ua0prwMHNIVYDPgFv3EZ2l
         xltJaUm1kkJ7C1a5vGRdIb00P0g5WY1vtMwlgjSGEHYBlDPst/+DEIZgyimDOy+bwSLq
         SuqixCt/e9jnrB0MO/WtfaN9nWXPPuQu7MypC2ukYWUFDQgDQDH5qFwniHB5DF0S83hP
         yYZA==
X-Gm-Message-State: AAQBX9emZ5WlKyLOdIwnHtOJnQZChukYg+0pC7LQKnBHMRpxGkpQXOLH
        P11hk8sxhGYQqRd/W+i+hWnOKw==
X-Google-Smtp-Source: AKy350Yo2Rt1rOFhXVKxwzhnMFISblPFU1CUUdS7F8h8GwafujSMEOGbp0rS44wexna8I2I5SC9t/w==
X-Received: by 2002:a17:906:9f04:b0:944:8c30:830d with SMTP id fy4-20020a1709069f0400b009448c30830dmr7483214ejc.42.1679985894744;
        Mon, 27 Mar 2023 23:44:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id k2-20020a50c082000000b005002daeb27asm15465414edf.37.2023.03.27.23.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:44:54 -0700 (PDT)
Message-ID: <06919af5-a518-2da8-5cd0-ac657948b6c3@linaro.org>
Date:   Tue, 28 Mar 2023 08:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: remoteproc: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230327170114.4102315-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327170114.4102315-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/03/2023 19:01, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

