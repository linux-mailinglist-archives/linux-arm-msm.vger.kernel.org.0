Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A92A5BE012
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 10:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbiITI3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 04:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbiITI3V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 04:29:21 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D24AF08
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 01:29:20 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z20so2108345ljq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 01:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=q+qrPK+uK1obP1R6zQ8ccqdr8h0WGw3mEokOpZ/9RYA=;
        b=n4IcFmsbbihK7kruJhyLwMW46OUSjv2IxTDfKhMes67u/4zkET/1ALtl+oJO+Xrxwd
         +fw1SxdX1YZZv3p4eZl+jA+8QbBV7dkb12yt/5Hquel7h2Yz5G0s8GKt6ueCoCpRrslA
         nvcktY8/j1lS+x+CA4L34Re41UNQjJVrbgPL2C/twRwMVIVi4S0QtfHABx9u20S5U0cZ
         vzwz8TwQIOylB2QfJ8PjK2+Y0cVtp49OVK83vitzZQ9AXut+gu84Nta5LKyepMvz0YOX
         oEHGLpSsQ/g/jd4xg24rnoBKr91ZOTfLpCsIEFeyqeeSan9BEAGN6W84gtnMcqwE6YUe
         c7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=q+qrPK+uK1obP1R6zQ8ccqdr8h0WGw3mEokOpZ/9RYA=;
        b=hNFZnkSd1UULzob+pMLYwxT+dijuqpAuDj3k88jf+tAoeBsHFafJd69KqZoF70FHaI
         dmwxQwKmdQQpX79aNpHQw6CYexSZJ+nfj+HKzC7GzcMwYLiS6ThDA8Twpjfnh3vEGN1X
         kPEFDZJrTeAiQWtbDCRmlJD5SdJi0zPc+IMZuVeeDL0+CeiImRRWgK29th90R5oWatCO
         E4B0lUKrhcmv1zFf1YE+FIa+xkAQDkI6lW1UC4QhzELHmWuct3zFmqOf9MLUN9F8/CtU
         JXxM+He7vENrn7ErlFuH/YTxUVD1mu2Ga9ThJ8y/PRGGOIBeB14IamMqJwko6XelI80v
         K+Zw==
X-Gm-Message-State: ACrzQf1b5ofHuKhsXziegvOC8NuTZGYYiOVqbwCDPqlDoMDecraIUdOo
        9ut9pXvL6a8tsTA4YKIBgRq8YQ==
X-Google-Smtp-Source: AMsMyM6Kprnea7sEuwFMLOSo98vZQJ0lIlpS+dzRwKlUGKUEeFJ1HWosA9iODloVAjdcsbyI3bN3UA==
X-Received: by 2002:a2e:b009:0:b0:26c:3fba:c3b8 with SMTP id y9-20020a2eb009000000b0026c3fbac3b8mr5183171ljk.114.1663662558375;
        Tue, 20 Sep 2022 01:29:18 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b21-20020a056512071500b00494978b0caesm190823lfs.276.2022.09.20.01.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:29:17 -0700 (PDT)
Message-ID: <a94b0149-5e49-3aab-540b-ebc1b70b0799@linaro.org>
Date:   Tue, 20 Sep 2022 10:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: add rpmhcc bindings for sdm670
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220920023709.4865-1-mailingradian@gmail.com>
 <20220920023709.4865-2-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920023709.4865-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 04:37, Richard Acayan wrote:
> The Snapdragon 670 uses the RPMh mailbox for some clocks. Document its
> support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
