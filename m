Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCB936C9CE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 09:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232795AbjC0Hy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 03:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbjC0HyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 03:54:25 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18001BF5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 00:54:23 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id x3so32018447edb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 00:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679903662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0t3ruGYNkMf76KNcTUJPq9yBYl9XCBc+D2thkRyK74=;
        b=yIGRWZzb1a0x2vaMpxaEXhh9fvn8mSNO3iibgj/iasgabDhJBeUnpUkrjD3Y7QeKz8
         9jQo1x0ep2fQyLqNSqK1TyobPmPIIHIsbmQ/7a62BeTgNede+XrtNa22wenOXCniR2pO
         aFLRXJ4X6mmWadBwXU/0zNhO/QLPYaz1qpyMQb+bV/sEko09gfHR+7MHHceQG9qhkygN
         z4pOJ6vZALIsrE8CpV69C4nIVmfZPVZ0CejZ3lWeG+HpO+i7r1KGBXSI7BpVnAM8SnKY
         PXfdzS8pim3KJy0YmIW6KASUMy8jkCAViwAMl/IBtqgrLy6Hb1HaJpJxAYAZyqtSvQfE
         HWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679903662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0t3ruGYNkMf76KNcTUJPq9yBYl9XCBc+D2thkRyK74=;
        b=4jaO+pmax3Gf+1Hfu9avL8ULfasQraXKiNnAFhW+tLQztmNLSRknPnExzYppy1CltR
         8O8Bwkh27VCgENMO2xF5Dea+wc0/wsUkTzbDvG+vY/RnbZzz4rQFg07DWVL5nEbAWneW
         SqYckVLupwiMItxPupRAiIwdzs2d18UAsmnRqrXBlaMujD699B2vpCR+I3e1mJSWeXrz
         cLCMMQvN7NJEYG3y+L+HiXpu36AgO9uC6Zn74368Vp7d/7ZtXbNi43pLf5kckVdJv7+y
         t6qGIJAkkUm3lsWO/v7Bhs2c0z9lyGI48UAEDXmsLuWeilvfrUBJW6/X4iSysNesfbUr
         CXaA==
X-Gm-Message-State: AO0yUKXMqjKi81RTn7eTcTaHxZoTcO15L2OsefpKkxz09Y2Fdad66J5l
        /7T/qVaviKFAPL+HsMqVleMtlw==
X-Google-Smtp-Source: AK7set8BX1ahhN81AgayGWjVpXDh3cPG8DY8Fs/MTLHdB7ZdkxDvBNYUAmbMfeEeNBfqsd+JpdMQ6g==
X-Received: by 2002:a17:906:79c7:b0:931:54:f24d with SMTP id m7-20020a17090679c700b009310054f24dmr16136837ejo.22.1679903662319;
        Mon, 27 Mar 2023 00:54:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:198e:c1a5:309b:d678? ([2a02:810d:15c0:828:198e:c1a5:309b:d678])
        by smtp.gmail.com with ESMTPSA id q18-20020a50c352000000b00501d39f1d2dsm9868277edb.41.2023.03.27.00.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:54:21 -0700 (PDT)
Message-ID: <4ade1709-1310-a556-b9b4-2cdbcef02e94@linaro.org>
Date:   Mon, 27 Mar 2023 09:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 03/12] dt-bindings: phy: qcom,qmp-pcie: fix the sc8180x
 regs
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230325122444.249507-1-vkoul@kernel.org>
 <20230325122444.249507-4-vkoul@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230325122444.249507-4-vkoul@kernel.org>
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

On 25/03/2023 13:24, Vinod Koul wrote:
> sc8180x pcie phy requires to describe six reg areas for the phy to work,
> so move the description to the correct place documenting tx, rx lane 1,
> 2 and pcs and pcs misc.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

