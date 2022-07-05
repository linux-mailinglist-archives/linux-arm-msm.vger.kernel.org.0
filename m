Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 858525667CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 12:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbiGEKXt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 06:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbiGEKXm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 06:23:42 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F95314D34
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 03:23:35 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f39so19780326lfv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 03:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=D5siEQlI9XeniTKofv/2Ej6WMzqEAvwWpsCPDQ5Kx7k=;
        b=RGrEAp7zvLo7CTBtpOOl5wiObpP8CTfkfXlUAXMlhsoqFhctrsSeGyQvtum9CIMClQ
         T2ionu2utuPpEtPp8pEJ1SrdUwt2orU2kEVDrs+3cuzWyq/aWS8d8HJ1BODLE3gLG/HQ
         RBUoCV972pvReTzlL93EsOl9qCj7Q0tfHPFaOGFNAc11JkQgLqlPVzTqZU0rPwrcPWPM
         zqah7tRBSuz0NI3lQ0TFfXPoX1D5qN8bfxwKApd5EefSfCQaNvTQxv8fRbZDoiTJmfhX
         MqhY2392OhqhTie0d3Dt2sfN2AmOf8QjBFhWFMU/jXuVt2SwDcxGluCbmyzT1H/m4MVZ
         aNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D5siEQlI9XeniTKofv/2Ej6WMzqEAvwWpsCPDQ5Kx7k=;
        b=TeYgOnJpnGeO7MqDq8/WP02zKQpHFbXzXv2163esyIxPIn5YXHfBgbqwvHE58x3LvP
         bxs6ENTKcOcqOc+hhI2f3TgDemL20cpFGy4U7kMA0DQUhL+u4QOi+Ev4LjLKb4BD/9Md
         6G0/b+o/EgNrRPPwQJB/ytSs18kZJ73VqyJWJfXcRoucz1vzueWiAnpddidarYlXA4rh
         9zXvc3EJndbxgigWDA8n3DwGgKMeQdWYHNyVjyGzR6lgVs9kpJsrR4IGhLRBTRPJrBQQ
         LcEYy7giaGuQMH8mCiyHlqqakEebcqVGrZhbE3z0xnyXd6omPbdUwj4iXpLHDjzfTwvZ
         fR3Q==
X-Gm-Message-State: AJIora/sbqYmR+HkKlVLvrgg6u1EEHs3VpViV6K046EH44yL1u55mgqf
        li9qA+aS4vqEu1U7S5Fm/uz3iA==
X-Google-Smtp-Source: AGRyM1u/5ekv4E6MjvZ4URSOmp1X5JoJIqCjqdBiA5tEuuxuPaVwWaOw4MHCavNj71iNDl2hB3U8ng==
X-Received: by 2002:a05:6512:260e:b0:47d:ae43:62b3 with SMTP id bt14-20020a056512260e00b0047dae4362b3mr23834973lfb.77.1657016613842;
        Tue, 05 Jul 2022 03:23:33 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b0047b0f2d7650sm5622474lfr.271.2022.07.05.03.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:23:33 -0700 (PDT)
Message-ID: <b1a14a8d-489c-6871-332d-230811baace3@linaro.org>
Date:   Tue, 5 Jul 2022 12:23:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/43] dt-bindings: phy: qcom,msm8996-qmp-pcie: clean up
 constraints
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-8-johan+linaro@kernel.org>
 <4b1a9ded-24b1-faf1-e105-f18afef57682@linaro.org>
 <YsQQnT5ixHtSo+vk@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YsQQnT5ixHtSo+vk@hovoldconsulting.com>
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

On 05/07/2022 12:21, Johan Hovold wrote:
> On Tue, Jul 05, 2022 at 12:09:19PM +0200, Krzysztof Kozlowski wrote:
>> On 05/07/2022 11:42, Johan Hovold wrote:
>>> Drop the compatible conditional and tighten the property constraints.
>>>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>
>> Squash it with previous patch. Does not make sense to add new file and a
>> patch later change it.
> 
> I beg to differ, for the reasons I just spelled out in my previous
> reply.

So let's keep the discussion there.

Best regards,
Krzysztof
