Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9B9788002
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 08:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233422AbjHYGiE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 02:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242252AbjHYGh7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 02:37:59 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C951BDB
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 23:37:57 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5280ef23593so852913a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 23:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692945475; x=1693550275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+0GSay6taxycoZO6OBj1m5ETfkXUUoJMPJ0/kOmu9w=;
        b=fbgaqHCOPQ9G60i+iwMr9mzCZhZANvvhX/VAcVRVlYoK3HTFs7mIvgMHuse2DD3845
         Zcyl7SmVY772U3pT02yQ/hAxenx1AyDgtmJqq/Zv0k6fQW49otImf8/mjyYplk+12Ghz
         t5XDFLFFFoGuy8Xfp7lYhNEMinmswlEAVLjbEh2sF/Wo0moxzQfa69enb39ZfPbigQ2R
         +bYmhNiJyIPWpXinmAGYyfVNvgFsz02/uI9ark2nQfrNAkVlj49HwLMKwbXzPtFxR1dS
         aihIUh80NEzZNhohGcoigA2lumLB/4/5wHuvSVyFJKg0tzR3CNOOSg/kkTa/dvIRZEwt
         CHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692945475; x=1693550275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+0GSay6taxycoZO6OBj1m5ETfkXUUoJMPJ0/kOmu9w=;
        b=ARQl4PNcfwbsNAXczuesUcsJJ2SC1Oz60oW/oBO5ef3OtPv/6Nqw8Dn5m/EuT2tRyv
         OiFWCe6ohQstGDViYniHivm9wrm/4JwqHkpFOmcF5ZmtpsUli+P2dCuo76FrodbG14LW
         dYu/+59ZEJu3LjNdFebQtqCVUOLKA021lkntFaIpLI5XQ7F9Zr9iT/zZQiqHT5xmLoEt
         NlJUvryCG7y++xEXyYWq9za/r2yMUS++6w94kFUgRpr/xc7JMXAGC0jgYA2yZHGieWVt
         FTpM6nLhJ7Va+eu6E28K+UXZ3OF26SY14D5D8YMbx788vg70aVD3eC/WeWFKNHdjztzx
         aMmQ==
X-Gm-Message-State: AOJu0YxoEqv/IfV0o3lqXgO6z2DTiucqeChUqOElVAhp7+B0rqfd7epH
        1bLKj8otwI9VNiv5c9+22LfybA==
X-Google-Smtp-Source: AGHT+IEypP8YwF3zoacWp0xHNurKmkvB3OGpiijSl3m27OY1zGiRUfgfDWioUJnwQYSII3jRGVN2mQ==
X-Received: by 2002:a17:907:788d:b0:977:befe:d888 with SMTP id ku13-20020a170907788d00b00977befed888mr13159727ejc.13.1692945475666;
        Thu, 24 Aug 2023 23:37:55 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id i9-20020a1709061cc900b0098e42bef736sm596537ejh.176.2023.08.24.23.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 23:37:55 -0700 (PDT)
Message-ID: <18fbfb35-fc8f-5062-859c-152d3ef933d8@linaro.org>
Date:   Fri, 25 Aug 2023 08:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 01/16] dt-bindings: phy: migrate QMP USB PHY bindings
 to qcom,sc8280xp-qmp-usb3-uni-phy.yaml
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
 <20230824211952.1397699-2-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230824211952.1397699-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/08/2023 23:19, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,msm8996-qmp-usb3-phy.yaml)
> to qcom,sc8280xp-qmp-usb3-uni-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

