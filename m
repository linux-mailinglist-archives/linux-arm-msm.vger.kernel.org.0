Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A24F56696B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 13:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbiGELco (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 07:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbiGELcm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 07:32:42 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E4E165BF
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 04:32:34 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id c15so14185054ljr.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 04:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qaYi1wEt2C2JhLIJsincP0Q2Rkx1dIZ1ZvSisaiv2yM=;
        b=myegyeCgfK2LkukV+pPs7crITRe2CkDAlueLDUmQmpB0rDV9FGaDYyCNDnNsxHV+I6
         v2s0FdFJ/IiRX4iMHNeuDeaHin3OTvBe/Wg4X88PGFwVM+LEzRwQ3N/Ea8xF1L8EOwng
         zgLZJg/C5HpkbvMHF8VvbGQnxC/c9Q7L0SjwgWDxlwJip3OX/e/BT0Vbcm7ncVDRtjAc
         tcpFhUPNbd6P+gQHeGkH9xVAXIITxOX7PBxqAUMpOfgAzjSthCsPi/qNxkt+W3fTwFJN
         mgIWaQVWOa/7X+KXd8bBy1Ay12dHeKv3ufjgtfZsCeLmhv4e/CPo3OwmPcP6sleDDm+B
         yAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qaYi1wEt2C2JhLIJsincP0Q2Rkx1dIZ1ZvSisaiv2yM=;
        b=7w5QyUOchEG4xl2oR+h6qyduVKzp0VZIuPTIt7eOt+rPOQh+dh4HgQGb3ebd7KFw56
         bTGjtMFFQvwSQEqDYQl+Bg8XsKG3EsAc5bMGUF2mc03cfjU0j+kZYN3QXZHIRUneOFyp
         feDpmv6OTm8rMQWS/rvX0GgQ3SyniqhYt4cAVK05OYXaRX1mOGKfOjg6oUMU51CSjWal
         CuGYwVjpu8SXglLB+3colXv79aFvoEXLw6793Lr8qD1hXTU0MJTfz5qWLYVjgJ3AlLb0
         7bVy7h9aS1iMYaLfkOe6qfYADsshU8moVcsJ9D2uB0xpckkpv94Btsy31LAJ6q5bBRLK
         /96w==
X-Gm-Message-State: AJIora/ijdzcvV+KHVtVRL0HYtm4t17FfYRjqSgFX9YQA6rhQYVgz75s
        afS3CkCB+rUgerlCHePaX0gJGw==
X-Google-Smtp-Source: AGRyM1sDEMfsIqrE/O54h2/HWiK8uRNTaue2L0djpV2Y+9vKv+BEGYutc3aiZvtNajkxCH+H6rDE7w==
X-Received: by 2002:a05:651c:178a:b0:25a:44ab:593 with SMTP id bn10-20020a05651c178a00b0025a44ab0593mr19941534ljb.358.1657020752431;
        Tue, 05 Jul 2022 04:32:32 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id h15-20020a2eb0ef000000b00255500154fasm5510079ljl.52.2022.07.05.04.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 04:32:31 -0700 (PDT)
Message-ID: <3b91ee2f-3e87-c18c-aa04-2cd93273b63f@linaro.org>
Date:   Tue, 5 Jul 2022 13:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 09/43] dt-bindings: phy: qcom,msm8996-qmp-pcie: add
 example node
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
 <20220705094239.17174-10-johan+linaro@kernel.org>
 <8271f4d5-e12e-ddf0-46ab-86a39577755a@linaro.org>
 <YsQQ2o8aYJnnWuNa@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YsQQ2o8aYJnnWuNa@hovoldconsulting.com>
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

On 05/07/2022 12:22, Johan Hovold wrote:
> On Tue, Jul 05, 2022 at 12:10:29PM +0200, Krzysztof Kozlowski wrote:
>> On 05/07/2022 11:42, Johan Hovold wrote:
>>> Add an example node based on a cleaned up version of msm8996.dtsi.
>>>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>
>> Squash it, please.
> 
> Why? It's a new addition to the schema.

Because it is not really new. When you add new bindings or convert
existing ones (without example), it is expected that example is within
that commit. You do here the same - add entirely new file. Old file had
example and the bindings. You now split some pieces, convert it, so new
file is also expected to come with the bindings.

The same as there is no point to make half-TXT-YAML conversion, there is
no point in half-split of existing bindings. Either this split is
correct and complete, or it's not a finished commit and we do not commit
half-commits.

Best regards,
Krzysztof
