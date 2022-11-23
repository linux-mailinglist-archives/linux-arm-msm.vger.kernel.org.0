Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 349BA635A6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 11:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237534AbiKWKlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 05:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237538AbiKWKlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 05:41:02 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC9B21278
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:24:55 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id z4so3959440ljq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z2cZ2aGvz+KFwNkBLj5Eji6CLqnLqwcqLWGZReHxQoo=;
        b=tccV9u0DPOr7WGHaeW7SHV7zoLGrY+IccG2qq+rPFQuqHwLHQPSTKvIQal19aGStQS
         qFuS0TCuUZbKwURtutPUto8/iBsAVhSPMbolATkWfeAE288vQ2/1PjzJzIpouG09dAE5
         egZt69Z7OqqkLA8/BKMIE8YoGoKKb0nAMP5ppVPvVZPtjH3ZoaY/RTgcs3/hg2D+GxkY
         w0Q1PD3Tgaam+isXAgN7hIbbMUV3kDAIQFYtp97WK4jvOvzE8XgtTHHN5YMIf11YkmAS
         nNQ04rpP0i3riYxq7Vqe32Qr4Q6JQClc+92LYISNzEw4ng6mgRNUAhdDXDzMcV5xBi0s
         Rn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2cZ2aGvz+KFwNkBLj5Eji6CLqnLqwcqLWGZReHxQoo=;
        b=JgVKB3lrVpUN8MowDoKolRMj2kli+YldVLmrvhGhKdoVby9JdPRvyAnFOGRYHoMRlb
         mNkh1fdE9qalPBk1apuNIanMHjEftnbQ+tF30uusdqHpOektJv6DZzaBGu5QxQVGBncF
         tIHRGAYBCoSr+MNDLozJjz4EZJ+KgNtQy7pxFHdSimoFj/PMcN10g/JM9giW7CKszouZ
         315spB/sfZhF1SgDZmzhfzjYngx/kuIDwnZP/NG7qsnJOGT1VEqhlESXsBR8ToJ6A+Gq
         ThXjGGcInX21ApJ3sRlRvUvxMIJkk5uSU6zMdxDVb/cylFYB1rkpjh96/fh5sGZbWJB7
         omHQ==
X-Gm-Message-State: ANoB5plDuPzKDJucvcNAkzTSWfEp6G3B9BER2xxwuceL8Fb9dvscqaYD
        LpoSKdvcMKyyZ83zu6V5qeglZw==
X-Google-Smtp-Source: AA0mqf56iGGSkxj6TllkNQuinXzUirCmomHmNOpMWrybBSVRIH2xAEjCe0t5105VGr4MUVvDU2OuHg==
X-Received: by 2002:a2e:6d02:0:b0:279:4a4a:ca9d with SMTP id i2-20020a2e6d02000000b002794a4aca9dmr4481353ljc.27.1669199093716;
        Wed, 23 Nov 2022 02:24:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u26-20020ac248ba000000b004abc977ad7fsm2843143lfg.294.2022.11.23.02.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:24:53 -0800 (PST)
Message-ID: <d7629871-1c29-e23d-1741-33714f187bbd@linaro.org>
Date:   Wed, 23 Nov 2022 11:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 04/11] dt-bindings: display/msm: add sm8350 and sm8450
 DSI PHYs
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122231235.3299737-5-dmitry.baryshkov@linaro.org>
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

On 23/11/2022 00:12, Dmitry Baryshkov wrote:
> SM8350 and SM8450 platforms use the same driver and same bindings as the
> existing 7nm DSI PHYs. Add corresponding compatibility strings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Didn't you have here tag? What changed?

Best regards,
Krzysztof

