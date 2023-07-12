Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0912E751127
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 21:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbjGLTYv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 15:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232229AbjGLTYv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 15:24:51 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B881FF7
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 12:24:46 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fbbfaacfc1so12025940e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 12:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689189884; x=1691781884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuljcwj79SeCATTzgc6uDoymx0z61R4nV+VZRoJJeTA=;
        b=oZiJ//xdw4IWYEMmBWCtYEvGdZPQJpjeg2kIZrJ++GLDxXgNWXoHgR/48CnLbuk8JH
         fI8RJY6e6zH4iZUNIJxaHYPuzyIgCwTyKwMGUpu8eBc6jq9mm31v1IFRZjBD4aYor3XI
         NTaDECo5+pjPu1QD5fIbEug6wxAAaU35vunNj2QWkauR30hPdqlNfNSx7gnvl2wnh5Iq
         nFGzJ2XTx6rLmRj/DLnbilGaqvEOM70y85oU+HNRo904NmIUBboftFy9bOm7ximOHXys
         pnCZY7KLAgmEDVZUZj1IyodREq449fJmNeD5hWO+3qqVFi1Xxyjou6CxmGT2fXYrHbxQ
         e3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689189884; x=1691781884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuljcwj79SeCATTzgc6uDoymx0z61R4nV+VZRoJJeTA=;
        b=gN9HYfbwq+yYzLv0guuuQi4ZJiZO1z1wfGJfJVb/oBF/QZMBdxC5YacLx4hbCRPwwQ
         vnE+C8W2Rp4yzPIsEPhHDcg9uL+WLg7btpJqBD/Vx2qsKign+2j86lqv8Lx+JjQ93jfi
         GhikEz7HlxdMtMmHl2/fgQi+5wtG4UqjnDY9KKatTwn+hCJn32AegZ2iFbKJ9LmZj4nH
         0s32nrTKk8jRRvktVk2jAYh9FIkHC4jGfnmt9iBkXctCgGssgo87wO3/rrfNs0fl8n1R
         1T8VDJTDWZlAuHdUYVgUGnhHgFxBaxaymiGgxlvp3LY9ASvvf1NbsrAns4k+cGXY4d67
         tiSQ==
X-Gm-Message-State: ABy/qLZpnW3eInqnh5K+bOi2zIHK5l9K02zNeCVmeLDckNBUM/kCRIG/
        BtVnSmAYVq6yHIB6TPXLG8r+mg==
X-Google-Smtp-Source: APBJJlHH9mhSup4nqjXg2f1Al0hr7uG7FxgO+71OzMqqLnsbjBcgF0gT7glYl3x2V45SA6PNZl7PQw==
X-Received: by 2002:ac2:4e0b:0:b0:4fb:8cd1:1679 with SMTP id e11-20020ac24e0b000000b004fb8cd11679mr18570281lfr.44.1689189884583;
        Wed, 12 Jul 2023 12:24:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id dy23-20020a05640231f700b0051e22d3f328sm3118471edb.96.2023.07.12.12.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 12:24:44 -0700 (PDT)
Message-ID: <1a163ce6-030f-63de-fbfc-04d87a69c99d@linaro.org>
Date:   Wed, 12 Jul 2023 21:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/8] dt-bindings: display/msm: Add reg bus and rotator
 interconnects
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
 <20230712121145.1994830-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712121145.1994830-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/07/2023 14:11, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there are
> other connection paths:
> - a path that connects rotator block to the DDR.
> - a path that needs to be handled to ensure MDSS register access
>   functions properly, namely the "reg bus", a.k.a the CPU-MDSS CFG
>   interconnect.
> 
> Describe these paths bindings to allow using them in device trees and in
> the driver
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

