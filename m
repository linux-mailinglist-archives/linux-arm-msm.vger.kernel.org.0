Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0C5E6C0154
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 13:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjCSMFH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 08:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbjCSME6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 08:04:58 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF09E23664
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:04:21 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id y4so36836197edo.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOFwXh6vZtC92bZGzjuIGNdPIVs7BRd69S29zualIkE=;
        b=uQR2XjGwTRSf/EIB5hGDYjQ35bm6+7HhgxNyyqkP7XjNB1b7/6oNrL2JXG5Z6uwNQf
         JJg+lgcEeM7gssCYgRebL6JhM8jOqa2PG4xGEsmI9JKaVk9QoJcdUr0CwKkU14wuazqO
         3ljFSsd6x0Sd/fL1iF+UMP9f4WneJdcJ/bDsJhWMMF/4dgkeIQgK6bMt4f4K2wxHAL7c
         htx1U3jtumILAa3qumfjgj9idqJrgrGzDhfs+yuNATEkUHkrUCCjJ1TARLO2KQ15aB++
         ZwV77V47EMVNQjcwhm1o5mTRTLpS8dmTR+FAcLLkncUJ9dw+Qp+DupT4MOgpLe/XTDGA
         nsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOFwXh6vZtC92bZGzjuIGNdPIVs7BRd69S29zualIkE=;
        b=QmJBKgSzO5PsLjXnwRNuN6mFy0CLVRyShk3TFgOoeXSKgmffRci1IKpaMMhf+2dlcN
         JJLcgJzsWWYr3w4kepxR2u1mf/fzZ78cQRgFtr10n14dAMLOFbeY7NCmgi9gRqzmQUUf
         lXROGS9Qbdj8IU3dy1pYeNXBxsTId0/tQqvnmo9muwC6vPvx744iXXysgTKXRjwtzBI0
         8UUCyAO/9uINq6Yw4b+PAnNhY31ewnlYourdCisxnkKnRJc9SJ0HupS3bk2HwXD11jBk
         S1duPcBbie3yvss+m6TQqswmkbU9ALoerHc9gsSSep3GuvgyacL21hXCDAZWqCKs7gWi
         rbZw==
X-Gm-Message-State: AO0yUKWQ4swZQ4RO64v4cn+rA8q4q2SkKjh0H3CT4gik5ujChlEF6iiC
        gDGssXPDhod8PPZjlGc3N7/F0Q==
X-Google-Smtp-Source: AK7set9R/qYFVz69W0HqGLExknysHlO0roi/6WDV5hwj4pN19t6DqymA6BFC7JqA67tkpA97BsxpKw==
X-Received: by 2002:a05:6402:50d:b0:501:c0e9:4df6 with SMTP id m13-20020a056402050d00b00501c0e94df6mr872973edv.40.1679227459328;
        Sun, 19 Mar 2023 05:04:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id e9-20020a17090681c900b008cf377e8795sm3176188ejx.199.2023.03.19.05.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:04:19 -0700 (PDT)
Message-ID: <9825ee6d-58b1-4e5f-16ea-2cb00822f147@linaro.org>
Date:   Sun, 19 Mar 2023 13:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 8/9] dt-bindings: display/msm: dsi-controller-main: Add
 SM6115
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
 <20230307-topic-dsi_qcm-v6-8-70e13b1214fa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v6-8-70e13b1214fa@linaro.org>
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

On 18/03/2023 14:42, Konrad Dybcio wrote:
> Add a compatible for the DSI on SM6115.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

