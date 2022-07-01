Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96254562E40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 10:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236366AbiGAIa0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 04:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236374AbiGAIaK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 04:30:10 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 446616D572
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jul 2022 01:29:58 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id o25so2743974ejm.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jul 2022 01:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=W2JBG9IMgo5iuUpGjo0Ma0emVBYFSehxFIdcsMEXUdA=;
        b=arFQqYu6F88L3CXLHaovq6nC8iPoIB5p/cUlMA41dv82tviQib8TEVgLwkCk5Oyu5M
         O2nhQgu0phboN7L+EY4ZSPWK7by9eue8AdroQbTlVFfK34VGzZtIsT5FhmxfB1z2REgC
         2TxfH0ogXBYtzT1QoRTuJThP+EktiC9LGj6rhgFfQMPPAossEMyTL3ofHZY+lNP9HkQR
         boptAY61H7EZd0f7mJlPhkpha3bZzBPm8Xl/yKKijjUYLdHES4yXURuUAbQ+KkdD8HJ3
         3mJVoHQAjtNw/3XQmf1tSMvI22n3zAy8DTuGDhGXdYjiXw+kacaTQTm10pQxKR0XOHtD
         eNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W2JBG9IMgo5iuUpGjo0Ma0emVBYFSehxFIdcsMEXUdA=;
        b=GVRjT7UXvJkqGhc0B1EOS4nOltT/y9NQTWOHbHUsLvglLZzRcU0gMu1ZQv8bIXvBoF
         vuSrNG7uYjkxJmf78F+sWpltxwCiw41O6RuhP3bY1j4ZCNSoIViJs66sfblg31bKpOKg
         y1u2AhL4OVtyRUnXxtlQD8ua433OyzN4I+RFlZYbY9L7IZJiCNci5bjbre1VonHaBP1V
         zhsxqEMctlk+W9Dn1tpoJKXEIcjtVuYdzl8U3kzYaa2K6crbbH5pAo3Dzc/Z9K/4odtk
         csvf6qVvrK3Il1eiCEubFZ457bs7qwpHhuAvga1ENPfCvZY+v3yC0/zrWDDusMJGoX8x
         fKHw==
X-Gm-Message-State: AJIora/wIsdPWVPFT9LsUc1BdS+KSJsN3UXPApo7UreHEovnICBrEffd
        wfeVYkyftBW8hjoBgFBIM3LvHA==
X-Google-Smtp-Source: AGRyM1vv2YExw/cf6QKoCypS6wU8W0tcFVHArFOydF7PZL2zFGDhvteLzs9veunwCivobmZcttE8wQ==
X-Received: by 2002:a17:906:dc8f:b0:725:28d1:422d with SMTP id cs15-20020a170906dc8f00b0072528d1422dmr12676225ejc.131.1656664196827;
        Fri, 01 Jul 2022 01:29:56 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v10-20020a1709063bca00b00706e8ac43b8sm10100208ejf.199.2022.07.01.01.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:29:56 -0700 (PDT)
Message-ID: <9115208b-23c9-0741-2fe0-9e833800375a@linaro.org>
Date:   Fri, 1 Jul 2022 10:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/10] dt-bindings: PCI: qcom: Fix msi-interrupt
 conditional
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220629141000.18111-1-johan+linaro@kernel.org>
 <20220629141000.18111-3-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629141000.18111-3-johan+linaro@kernel.org>
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

On 29/06/2022 16:09, Johan Hovold wrote:
> Fix the msi-interrupt conditional which always evaluated to false due to
> a misspelled property name ("compatibles" in plural).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
