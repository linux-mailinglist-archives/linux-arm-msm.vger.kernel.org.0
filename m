Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0CB4566748
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 12:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbiGEKDG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 06:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiGEKDF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 06:03:05 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB3613E16
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 03:03:02 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id c15so13926611ljr.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 03:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=w9+SQsY/NLl9h6xMjjbnzFOp0g9U5sIW1EUYanyyw+c=;
        b=HxGx8j+pPyygvzH4xlqJHqV6m1QNJxV4cPrs2F+AGjML6Y/2hCEL0JqlTSxgBqw1uF
         ObIdy/JmJaNkNCR0ccJCZXrdwJr5hitpKZHHiabgYKkcfEWr+sFr83PBScyKmcJDNhXF
         LNuOPmpjJvgTkQ9JS0tBwA0RsodAOTXEvM1w9xEXHzjzZ0gXx/AkzN9HVYGm92vJmUBW
         0omqDIVJhHeR/O0jgt/X0qDJicb6IGh1H/dTXVw1MYSiwuprvc/8dd3l4KQl1uexv/xf
         0PKX9REU3os1TA811cdPExcyH/+9RhDzWFOCGVu+IkKoGWTsmtmhnSyDKZmN/C8EKyU7
         hJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w9+SQsY/NLl9h6xMjjbnzFOp0g9U5sIW1EUYanyyw+c=;
        b=mmY3OaeicIH6grp39g7bB+tIjQqPeDyMDjitGdGOxlAzNcM/me7WkeG77x6ZvLaRgT
         rcyVsLrgBk4xTSNfy9/RN5+kMvNGdK6ISzUiV3sPUiuklDUKM6jD/mRcz6vxjMKSldQ5
         6VDy1cSj+dAubmHLwnkB0Lo53j3YH6DFHKtPVXwXQtDJX35sSi7wYR6u5AXyQ80TtWvB
         hzLlZgyXUcazaw73ABbY5MuaTDYOmjMHMa2sXgaKbN0IH+t9DoD+/w6EzU6+RdEMd6kj
         GIfPc4FxQOeWNMnYTN3Vuh/0m9uTctgxJ3w2foMyh20VwKsnObZv1Eql4N86dFUW9eDp
         mh8w==
X-Gm-Message-State: AJIora8vvSmDuZx86165gvJsTE10OKN3QMJY1nmWr7zeHmBjOXt+26lA
        ts/5KuAJB0oSjDjrzmHHAT2Clw==
X-Google-Smtp-Source: AGRyM1uwnvOcoQafM3SLYRmg5cf9HHvDJs0sgnpJ9Zzs28wWHyGPma2Rftkuh+3aPkH5nmdGjaunTA==
X-Received: by 2002:a2e:8958:0:b0:25a:852a:c302 with SMTP id b24-20020a2e8958000000b0025a852ac302mr19530866ljk.130.1657015381066;
        Tue, 05 Jul 2022 03:03:01 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id u16-20020ac258d0000000b0047f6f675ea1sm5610685lfo.161.2022.07.05.03.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:03:00 -0700 (PDT)
Message-ID: <7f418618-a40f-9ada-629a-6d6b08a29fd3@linaro.org>
Date:   Tue, 5 Jul 2022 12:02:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/43] dt-bindings: phy: qcom,qmp: clean up descriptions
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-4-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705094239.17174-4-johan+linaro@kernel.org>
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

On 05/07/2022 11:41, Johan Hovold wrote:
> Clean up the descriptions somewhat by using uppercase "PHY" consistently
> and spelling out "clock".
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
