Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 731C055F658
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 08:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbiF2GOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 02:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbiF2GOQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 02:14:16 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FD619C27
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 23:14:15 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id fw3so2756737ejc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MmF1du2ylVDr8xJMUNJ8PZh1/Xb57TfnDF3b9gRJpt0=;
        b=FKgRXwQCFkXdqFwyGiX3cIUWyDWovuprXZ/ONaoPETsY5/YgrbFdFxiScnnAMLGBIl
         uR51YLCM8v/yHodq8992rO5zrgLlGlsT3NLEL861ZEND+kwEsihdZ13Ucqo9NBPlT1Gi
         C8WILUvP18ED581LFsaxNtNiUSOecljuY+lDt7SwuW12qR4kZ7uhzTNbipG0MTX25DG+
         OFrDWIxhX8oOCmeRFHHd4iGFpKnAzOXN+GhP71LLiOL7sSuefPVBfOpyZvBKvmU4pCW6
         lUS7nctXfNAmss5nbUZhwVRrMj39GlIHS/FaH9kP4UDaopo8p2vUiU1sbEQkKX42Lf6H
         mlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MmF1du2ylVDr8xJMUNJ8PZh1/Xb57TfnDF3b9gRJpt0=;
        b=vsKR8sQYYRjyq8/bci5YqKRNr+BRAz7XV+qP89C7xsdopYKYVz8aCdteig8i/oCJjn
         pGGdys4qxWgSk/5TXaTOWq7A20D8iYFrk36j62Uf0EfE5iiV/ak5DTMlLaC0+s4rDLAa
         l50tKWgLwMEHBSEvFELkuS2KhbKVwJgxm+qJO5Lb7Dy1D5gQM2Sd635DQxEB4Uwycbhz
         aCxhH6KQXZexywqapeNUKDXLvKdaMkJHlNSLEcPiYNVPoNbWPs/UASshU98pNc9xRGkU
         x55h2iYx7gFUXTClxwr6wOmU6rafz+QNZik8AfglqbECyMeKttrqnPTI8q8whRyBGb/W
         iVMQ==
X-Gm-Message-State: AJIora+TBo/tbzScJ8x3/s7dc1m1QnDH5cmuZN/PcAK7moeD0gCbpPN9
        Hoq+kO/ePiidrTC0u/WVwfqPyA==
X-Google-Smtp-Source: AGRyM1sL8drXcAVjnDFcws+DixDxqtS4d3ygjMxZkQkzufaPqB/t4/hIsYtbViUbltel0oQSOYvYCw==
X-Received: by 2002:a17:907:1c9d:b0:726:3666:2ea4 with SMTP id nb29-20020a1709071c9d00b0072636662ea4mr1665574ejc.547.1656483254247;
        Tue, 28 Jun 2022 23:14:14 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d17-20020a1709061f5100b0072846e4dbd9sm534911ejk.215.2022.06.28.23.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 23:14:13 -0700 (PDT)
Message-ID: <e625e2c9-7321-51fa-b9bb-40ed9742ffcc@linaro.org>
Date:   Wed, 29 Jun 2022 08:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: msm: Convert kpss-acc driver
 Documentation to yaml
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
References: <20220628184137.21678-1-ansuelsmth@gmail.com>
 <20220628184137.21678-3-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220628184137.21678-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2022 20:41, Christian Marangi wrote:
> Convert kpss-acc driver Documentation to yaml.
> The original Documentation was wrong all along. Fix it while we are
> converting it.
> The example was wrong as kpss-acc-v2 should only expose the regs but we
> don't have any driver that expose additional clocks. The kpss-acc driver
> is only specific to v1. For this exact reason, limit all the additional
> bindings (clocks, clock-names, clock-output-names and #clock-cells) to
> v1 and also flag that these bindings should NOT be used for v2.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

This is still not fixed and not tested. Since 4 versions of this
patchset (previously was part of other set).

I retract my review. Please test the bindings.

Best regards,
Krzysztof
