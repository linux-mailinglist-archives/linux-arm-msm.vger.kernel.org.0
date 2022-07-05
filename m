Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A10F956676D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 12:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbiGEKJY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 06:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbiGEKJY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 06:09:24 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D345913F65
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 03:09:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f39so19724359lfv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=++vjGe8mpLqU2xGwDgEAFEe55gCpwSIaeI5LQH/HV8I=;
        b=ziJUkeOVTjztBNbWsNcVKJ2DD64yNNIKqNTeaO79n3Nffa+SqEqRkNBXEHA01dKRyc
         emKzAQ+s3mdQ/xo1myOwQlvXoEGVVnZS8bIC5yCQTokr+5hHy2xSGH73ryEE+j0IEP+W
         ZMObpuVOPx2Mq/BNyEDogqsSlW+P6xrCt9Y6jGFDwp4aVSS+nvOj5hw930OhJ2ewhL7S
         ixbjcj/EKAZRqeAOuRRVD+1fKje0IDde2tFpj8+mliaB3WY28dSRwz/OAwF0MAjVUQbu
         VKdVMZgEzuGC5nT/VnqsHNfZwkjr8RaVhZZN4yOXYlUdK0/8vzb2iAwtqIIxGw4b70mM
         KVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=++vjGe8mpLqU2xGwDgEAFEe55gCpwSIaeI5LQH/HV8I=;
        b=0CenGFQki9I/18tDELW2WedmxoICskOCz0SqAYNX78cpdmN2JK/aoTK5jkESKeDVIn
         SIzc0oQAoYafg5JPWlod9Gc+XsSoE3wuUXi66AVhX8tLKFUlvxoj4oGPg18eNdFmI3r1
         sAanMf3aeG/U46+sgVQs/SdOX11j34nC/M2gRVWdh9z71Y0/3NOoAdFdmfyISOq9Sgbz
         BZDu/rabhWQkUDfcgu5ti2sGIGH0niozvWdUB9RQySibT0HNgmDwuxIuBaOSdhgMD8Gp
         c7CeurYrMnzEXIHGkv7wZ5Qezi6BF4XtJVs7bAcbL7wVWiJJ2KHay/8vlI/fHy3WVRaS
         nG0A==
X-Gm-Message-State: AJIora9/TZpdpUSZ/HqdnKQbahZvNQ3ZW31XNAZ21fIp9bCJ5PBb07pE
        X4UFIfxa2fskIuasji6kWQh5/Q==
X-Google-Smtp-Source: AGRyM1sf0BMQF+WZOaMxWUNwUosUm1hFqfRScRMsbYZ0KIwSuavi36s+5xyuEdlSgXOUwwHi060tJg==
X-Received: by 2002:a05:6512:90f:b0:47f:5a23:c62a with SMTP id e15-20020a056512090f00b0047f5a23c62amr22370316lft.598.1657015761269;
        Tue, 05 Jul 2022 03:09:21 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id e4-20020a2e8ec4000000b0025bf4eddbb6sm3221175ljl.133.2022.07.05.03.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:09:20 -0700 (PDT)
Message-ID: <4b1a9ded-24b1-faf1-e105-f18afef57682@linaro.org>
Date:   Tue, 5 Jul 2022 12:09:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/43] dt-bindings: phy: qcom,msm8996-qmp-pcie: clean up
 constraints
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
 <20220705094239.17174-8-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705094239.17174-8-johan+linaro@kernel.org>
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

On 05/07/2022 11:42, Johan Hovold wrote:
> Drop the compatible conditional and tighten the property constraints.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Squash it with previous patch. Does not make sense to add new file and a
patch later change it.

Best regards,
Krzysztof
