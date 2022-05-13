Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6A8525C10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 09:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238932AbiEMHE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 03:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377642AbiEMHEy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 03:04:54 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9274F2A375A
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 00:04:53 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id f2so3126428wrc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 00:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C+u3AiC1dawn1wODq9KxNRT8POmnKx6C2urDt+hG4Do=;
        b=pns86EpQ3iiaMql9P0KjmTVlwTTFlmM88zrF5IysawSPE6ndHYTKY5QGbDfbuVWsNs
         aFsBS1GCKajBd99p7ZORbqj9VgYjp3Lb/K03a+PniYXqvlDPjUyF1STItkoQv5YTjvTD
         G7AoC6XwJlGWRBi+LLjntRCRoEQlRr35Q+yoneCVxe7kt5oWS/0AtaOgUxgarecCdAM0
         1Hr//iH4qH7xz+Z8aO0/RhVpZQ5j/y0lc6JPWfIVbpWMdHOVQ1Oio3Y8vLbQQqhcuCT3
         u1VCrZQOzu/q6/YL6GxSIK/2Sxk1NU5JQviVxdLrRkfHcSonKnfMOgJiTaez5nePcc8h
         zavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C+u3AiC1dawn1wODq9KxNRT8POmnKx6C2urDt+hG4Do=;
        b=x+jRAB2lJUUz3qqsawj0S07MKlJH1Ize0+6Tg/wyd3XD8wO7n8JSDXIn7Pjcc+TvEC
         W6HZ2yzDdy8+UKL4KXXJ+p0qpzxYmPmKVXqoECm/gNJH5XmUWSd+fxSfV82JVmpJzzKq
         juZ9d04gDApE2k6j+acx+ZLQz/ElQnHsBCH/7cWIl6f3t7YpZUmk7WUIY3vVlNJbN9+s
         coWRNJbeUkbNitDslXzTjQOtLVQpPTWkUENyTJW/gNKBlNXw6p6bdPBWmZEBnEudCyl0
         hdbAqT/j3L0jDmnigpq0mjt+wPqgXCqSNNsoW+EUUCoNSmGBmkV3d1oUB9i7tjvxgB2s
         HQEA==
X-Gm-Message-State: AOAM531is3WkwzZVh9vBuwAetUks78Q5GNvcEa3xOQNfsbg/A4Y4BUTP
        wuCY4/f0DDa54mlEAFfzogx56w==
X-Google-Smtp-Source: ABdhPJzE0Ir7jveil7kkvYnNIM3CEnO+xSRXGVpiyz8jAi/khmcGAdSZ9Rdob2AK/TR/HXPQ4+ULeQ==
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id p1-20020adf9581000000b001edc3414ed1mr2483247wrp.299.1652425492152;
        Fri, 13 May 2022 00:04:52 -0700 (PDT)
Received: from [192.168.0.168] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bd19-20020a05600c1f1300b003942a244ee4sm1814837wmb.41.2022.05.13.00.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 00:04:51 -0700 (PDT)
Message-ID: <903a575c-10dd-96c1-0bbc-3b7c8d61f889@linaro.org>
Date:   Fri, 13 May 2022 09:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RESEND v2 8/8] dt-bindings: arm: qcom: document sda660 SoC and
 ifc6560 board
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220512234349.2673724-1-dmitry.baryshkov@linaro.org>
 <20220512234349.2673724-9-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512234349.2673724-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/05/2022 01:43, Dmitry Baryshkov wrote:
> Add binding documentation for the Inforce IFC6560 board which uses
> Snapdragon SDA660.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
