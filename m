Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D074656674C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 12:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbiGEKDW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 06:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbiGEKDS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 06:03:18 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC7F13F29
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 03:03:16 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z25so2115983lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 03:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=isi6a7fVq8cWarGbVpE2RdlMD/1CV/69s/y//iHVXgs=;
        b=lkTAbTZnFM/J04wdmLCi+WJEQrC9Kdq8gMF+MXDyk+9UAJN/1oRub4OJC3TaQPVMXe
         V0YpeC9wmJc7NPXdjK1YrsRCMe+XmEQbRX4SDZ2Me5MDOxiiTSJhTjXL+NNTpSGaj7JC
         DUx866L0jqXOJ9xStlA3wyt9lDDlb6eT5wOMQEOg8VCz3JaTSGy7CyxXgy/kxghmuWWh
         DoZSLBOKZcaNQHWaF9k2XSBVTvujdCRZOAGWiwmGnpNLYWZcKrhfKTwALDaYsq6haRQn
         PwEWvzW5kr74bRmASWAlOKHY8dpBQA1Qm4709e2A/VVJfAZh652maYxEWfCxUf7zV+AW
         S8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=isi6a7fVq8cWarGbVpE2RdlMD/1CV/69s/y//iHVXgs=;
        b=nvl1EzCnihY7YsBwKAEWHN1YWdPM3ZOuFfnUWcjKIr9//akvljTsp8i/dop7/jJV22
         Q4s/Kzc8AXoi7MibwJDFq1saZfa137xczb7C6hrBywDoxQqS8gZW0BA0xeDZPgYBH6mF
         gUv+tm0ga1T0KPxAuxBX6nC5DwBVvoJpGC12JL3vZotpy+UJCLSosze9YOmfxYdwXPK0
         pzv6u2+/5OIXK8byXv/TcpApR/kwwr4TdGpx4QsndXUsQGDlN4r2GtQA95uheBwCHurZ
         Jh3boxkuwAZSnKp7eIIveGa/lnJasX8YTFOa1qjK/GVoN+6QUKjeGrXt4XPnSh/qYLNL
         1yjQ==
X-Gm-Message-State: AJIora96lJuShs4TbL81g8T1b7oarBokqe1Op7w5NpD+4otdmRdLylqn
        jmI8jrWCYfizP8MEtTDggCUA3g==
X-Google-Smtp-Source: AGRyM1t/CCm8GtXgy4LjtshxePwKKSBsv2Rl+OeKnOAvbq3eR7yiOZ0pCoxKokhIen4sDGJEJr3WCA==
X-Received: by 2002:a05:6512:281d:b0:47f:ac1c:fcf5 with SMTP id cf29-20020a056512281d00b0047fac1cfcf5mr22921572lfb.197.1657015395138;
        Tue, 05 Jul 2022 03:03:15 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id o4-20020a056512050400b004785b66a9a4sm1923266lfb.126.2022.07.05.03.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:03:14 -0700 (PDT)
Message-ID: <f8a9e839-4a0c-238b-802e-b289e5a1e9b5@linaro.org>
Date:   Tue, 5 Jul 2022 12:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/43] dt-bindings: phy: qcom,qmp: clean up example
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-5-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705094239.17174-5-johan+linaro@kernel.org>
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

On 05/07/2022 11:42, Johan Hovold wrote:
> Clean up the example node somewhat by grouping consumer and provider
> properties in the child node.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
