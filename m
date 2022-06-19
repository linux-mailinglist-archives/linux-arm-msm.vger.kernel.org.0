Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C420550A7B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jun 2022 14:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236974AbiFSMC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 08:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236980AbiFSMCw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 08:02:52 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73014D46
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 05:02:50 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id z7so11569334edm.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 05:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5TVNyrHPaBXxANScLiXxuCsDJrfiZta1i604gshu4ow=;
        b=Bg6YFigz7TMrElHB9j5LkHHsLolA/v9p0UkA9mAwWLMCeyLjA3lrvDoi9OciCSAWFA
         DV1mk5qeW1n9A826cNjy8jwmi4yXR9SYpHf0p4hRDzGQkqbrM1D/WAwXXdEQoD4mh62D
         zbuYWnEb7unCMPDcMg8Zw8BZ1vIwFCGcLjbyiBkpu8l48Gh+Gs/3Iyupc2B5tIc5ipXM
         JqbUBGaFNkO3V6kA6r9F9B9385EyNUKh3vrGJC35Pzi9Nq9u1ZO0iloMmg6NWYflBqIs
         Id1DtVRhD9O+0WzbbhSxdiDq7tjyXmXzN4PJfsRDzhCoBqRZQwnUttyTOF1sG/p83WRw
         YgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5TVNyrHPaBXxANScLiXxuCsDJrfiZta1i604gshu4ow=;
        b=qeWqVVObkqEg82461Z1+J0FliYuWSKSsQ9IoFSYiwVCRnsUoaDka2G1gvJnrytMKxs
         dNMMy6aMZ/iT6NPRUhgitLalnL5fkA2RCGAY8iIY2zhHOv7rzOuLeZ6GNa93fvgfApu1
         PSpaEeIvmkl6/+Hnm8yiPM6CvsVPJmTmeUVmNFJjXsPDhhwmrZVBWboYOplynJpxue4d
         YUqsupAmUuN4ibDs5ANznXXs0vkQkLVzxB2zHa0jJNnmWttQrjnM2INfjHigRL0vy1qk
         3QbK0HFb36XSTfCqeWqtvAkXCLhkRWWX4ZS+ts6yRl8pi21YufRZAZSrHn/lZBjhegJA
         PXpA==
X-Gm-Message-State: AJIora8u1BciRRRFyNcAQ0hCsecT7Zwi5549OjiJhvC68OaqsVtTNbwD
        d2Cb9neBdCTjA3Qf0yXg/PtJzA==
X-Google-Smtp-Source: AGRyM1sX79JzihnS5LQ9lBwFQ6OL42649DG5g3G2OvmnO6gC2jOTxV21wSB7U5mIKZampkh3KgWqLA==
X-Received: by 2002:a05:6402:5202:b0:435:8034:fb87 with SMTP id s2-20020a056402520200b004358034fb87mr980364edd.409.1655640168872;
        Sun, 19 Jun 2022 05:02:48 -0700 (PDT)
Received: from [192.168.0.206] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906329500b006fe8a4ec62fsm4504703ejw.4.2022.06.19.05.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 05:02:48 -0700 (PDT)
Message-ID: <34337124-0004-d43f-5ae9-0bb42dbd3720@linaro.org>
Date:   Sun, 19 Jun 2022 14:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] dt-bindings: clock: separate bindings for MSM8916 GCC
 device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
 <20220617144714.817765-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220617144714.817765-3-dmitry.baryshkov@linaro.org>
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

On 17/06/2022 16:47, Dmitry Baryshkov wrote:
> Separate bindings for GCC on Qualcomm MSM8916 platforms. This adds new
> clocks/clock-names properties to be used for clock links.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
