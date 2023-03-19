Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603636C0149
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 13:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbjCSMEC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 08:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjCSMEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 08:04:00 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6EE1422B
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:03:58 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r11so36777284edd.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227437;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSXUCaRqA2KtFe3Fei38UJFcRtmzs4d/93iu0lEJ7eE=;
        b=A3UdxjgBuua477jAvg/jfzl8VfYvRAp5jD2nIFvnnso6EJ0HJW7BERvWj4q6oJx5qw
         L+aAgmNW38AvQKfLcm2Cw40S1ju3aTn26Hh2fCBB1m34+1wQGgONJ3GBgBr6OyTZmaol
         q00OFQ5ZJofiqPgZf+Zt4CFoMcw91iF8qN5Dnd0lKgbcUNUkSN7BhjiF9nXVhZewXQ0G
         B3A4GBAdRtrvc/ngn7ZxTLvMKE6+wHlY9Nfdw9MZVj/2K/sVgwVPLkcgnJ57i23rzXFR
         jIH4HidO7VrFPiNIzIfycQlaZHGvUeQsZnxSj2+X8Il9mr39VuA+aLovCvZiKggW8HKS
         +O6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227437;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSXUCaRqA2KtFe3Fei38UJFcRtmzs4d/93iu0lEJ7eE=;
        b=fjh3T9ErfCQxBHGTua1FePokK8qH8pQFWcgF0BvzvSWt8bZOux0TNUrWl6ysODw63Y
         vV6h2u7vrzch1f3pLIi9LwS9YAGe8S1lqNa5F6Gei2zqx572ClfW0w7Xgz7mxNS7yJiS
         9rugC5JR1VHxzoRb5PtIRy1BR5X4mB9h84P77MGOZHyaHAFgNx/BtdPjpU6wWps9SUW+
         hS8ixhZefqXCAHzysNAZGxMbBX1HlWrLT6+NfGHZOqoDpZ4wxeQ9Dy1RdlaU9fiFUwN+
         9tlBY+ISuetI42HwXL938S5IOmLtr5elCSfue2KhA/JAUeaIx4nFj2FXCT4GPWQ6gVXH
         +YxQ==
X-Gm-Message-State: AO0yUKUYj0MKZHwcOGYLb8phzlF/mULu4GdWIZQ4vPha54pSTXWsQamz
        3SR2vtU32UWNSR/FyIwPk9fIWQ==
X-Google-Smtp-Source: AK7set+90vgthv/jxsDWW9xfaWDLTNj1lisQrdqpycvWFzwCMmchtYzT7MyBWOCRp8E9tH88s4X5ig==
X-Received: by 2002:a17:907:9709:b0:8dd:5710:a017 with SMTP id jg9-20020a170907970900b008dd5710a017mr7030413ejc.4.1679227437125;
        Sun, 19 Mar 2023 05:03:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id z17-20020a5096d1000000b004aee4e2a56esm3435257eda.0.2023.03.19.05.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:03:56 -0700 (PDT)
Message-ID: <ec652851-4d6d-cc0f-c071-f83a71d9748d@linaro.org>
Date:   Sun, 19 Mar 2023 13:03:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 1/9] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
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
 <20230307-topic-dsi_qcm-v6-1-70e13b1214fa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v6-1-70e13b1214fa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/03/2023 14:42, Konrad Dybcio wrote:
> The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
> alone. This however didn't quite work out and the property became
> undocumented instead of deprecated. Fix that.
> 
> Additionally, the "qcom," prefix was missed previously. Fix it.
> 
> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

