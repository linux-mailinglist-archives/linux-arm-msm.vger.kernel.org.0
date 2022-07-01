Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E155562E64
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 10:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbiGAIfP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 04:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235300AbiGAIfJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 04:35:09 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA994677D3
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jul 2022 01:35:04 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id z19so1997054edb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jul 2022 01:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yMa2IUU0MMjVVFZMbcvg6SCECsrNdRpao2T0ErtMqsA=;
        b=W2O615zY5ih5nD4IwyMjJFYDvAf4FusViu+KrnCWjgqcoBbGZuRmZnE21hRHFQctdD
         IyL2wXWczPl5+abTumlZjVh/XEmP2/CUGHCZYtAiKJ47DF4TewkQxcCsA2EWM9jsg/jr
         R16GpzVOrnSmxAgsXYAocuqkSVshtDzdUB6JCA396glcX02IwlbybY0In3pERkbDg8RF
         Y7kTk2UXf3wvj6y3nL+0Yh/h0Za9/iBO67g9XCOtUpE0JXbuQ9bdSxzpWXekqX+zhkh1
         MCflSS+jUFg1QYnKO+Bd8D50D6xPvrVSv4iQJ+sHElkjXV7gnjY8CxlswzoDQoPIsIHF
         vjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yMa2IUU0MMjVVFZMbcvg6SCECsrNdRpao2T0ErtMqsA=;
        b=CtK0ztTVptAgkiljJz6bM36KMldXztabdIip57VXuUAQaezp75yyuNUddex4QJvG7B
         66e7yY6XPRWwc9Bu7lWCjkysk8AjoqO0hRhwv+bpUdaSvhcMLyjN6g5DiPK/VljSkDml
         m/jwjVncaM47foKuYmh41WW7vXH8+8f8YRLmZzWEUgAo4TNZmd73915i1h/IPx04hZ8D
         kl1bNBOqGfMIZe4aE2mvN/U8MODLRzUvnWzD8EpZjkFC3Khr8whmnDW1YmbB2tKd2TIg
         kOIoyRtPXSeMT1i1N0nQnZaMgoPRPMoZSi7EnW4S8pJQ9NgZx8Lg2QcroZE/cs++WVRo
         3SPQ==
X-Gm-Message-State: AJIora9oF88g2rofxlr2xHUZE4LadJ272iksVhwjox/5QKt8etAWBhES
        v7BjfZaZj3nOO9yFa20nvQvOlA==
X-Google-Smtp-Source: AGRyM1tKBOo52SFuio4IS4Jh7TszbiuHbVz1Y1z4yV20RnFhz4nN5NcxJkkBjMXnWFUqhCJYBK2Jwg==
X-Received: by 2002:a05:6402:524d:b0:437:8d2e:c675 with SMTP id t13-20020a056402524d00b004378d2ec675mr17894302edd.65.1656664503461;
        Fri, 01 Jul 2022 01:35:03 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id pj10-20020a170906d78a00b006fa84a0af2asm10183514ejb.16.2022.07.01.01.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:35:02 -0700 (PDT)
Message-ID: <3facb426-e9d0-9421-2eeb-bb2939982a4f@linaro.org>
Date:   Fri, 1 Jul 2022 10:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 03/10] dt-bindings: PCI: qcom: Enumerate platforms with
 single msi interrupt
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
 <20220629141000.18111-4-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629141000.18111-4-johan+linaro@kernel.org>
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
> Explicitly enumerate the older platforms that have a single msi host
> interrupt. This allows for adding further platforms without resorting
> to nested conditionals.

How does it allow it? New platform if not explicitly added to first
"if:" will fall into the "else:", so will be handled and there is no
need for nested if.

Best regards,
Krzysztof
