Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD445EF19E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235335AbiI2JOz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235497AbiI2JOw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:14:52 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B60E3340E
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:14:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id s6so1305682lfo.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=oG4V5/QKWGgMxbROXthhVPDw1tYajaC1j8zKjAVTP/s=;
        b=c+1JB19/ob7FNVZB/2s6KeGqwM+0h262yjV6pFpJoWRYNfkqsSKvy+yVJzknHkjfNU
         lLfSzR97ENtQJy9aoN9v18N0H4QxmiZiFTx7/PZnEn0sykS6rDyzm28jeReR8HecnPha
         6DYDrGQBn7eyY6Q4u1BNvmgjD5GbVUEW06P/wOY8+4uKEdx5F7mMS0XKBAv/Lo+AJpcJ
         WGrM2HbkTlMoRAbQSueMKblT3ORqDufwswRs+MBHeiTvUxH8itXoNFH6y+3/+lsqEth5
         6a6GTb5fJY5APEfI9aZEklCjB/RfFKGZI+NKeJMffrOroP7EMivYLJWboaXrThcgmjjc
         Ddfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=oG4V5/QKWGgMxbROXthhVPDw1tYajaC1j8zKjAVTP/s=;
        b=09xphN8U/rhKvZlqRYRcPyUMlcdCoQBDnxDHP4OT5Sr+fP94etceOOLKFuZeNsgKfO
         g0vYpSlu8wG3b5gOoRr9AOonh/itn2Tr8xLIyG1pGglm5mkKd/pzj5y8PXchpjBmunwK
         gpoKpT7BbVXhZn6mRvlqWXszK4uGQ9XUdVMV38+Vs0k3/kLRo/CcQeP16WXrTw+pMQZ6
         YgFUIruPZpAF9RRjxAG2CEGgx22V6JCw0WTlh310ybLEFxRYOdDbSIvTYfQd23CqKhOF
         AEBEPJDIM3oBFaT8zB1vtta+j/RRun24Dk88J3xcdDEIKCI5MfEQtbn0UQYUSXUXFENg
         XoOg==
X-Gm-Message-State: ACrzQf2BPJoGX/ogzADNb0QKT4/wrSR/XwcEiWGCGT8c2smhS0e77Lqe
        aK404Nm21YjsQA6J1gV+Jb1NOA==
X-Google-Smtp-Source: AMsMyM6jS636wjyiYHep3uGw4IsbjoNSvQqDnO5vRLd2ADo8AYrRIjxlkUmi0s2cwHxd8kptP/2owg==
X-Received: by 2002:a05:6512:1592:b0:4a0:2c52:d128 with SMTP id bp18-20020a056512159200b004a02c52d128mr916510lfb.288.1664442887396;
        Thu, 29 Sep 2022 02:14:47 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u22-20020ac243d6000000b00497a7dfe6a9sm729393lfl.64.2022.09.29.02.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 02:14:47 -0700 (PDT)
Message-ID: <4d391a78-f524-5bb7-92e0-9778396ed0cb@linaro.org>
Date:   Thu, 29 Sep 2022 11:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Update SNPS Phy params for
 SC7280
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1664435628-4011-1-git-send-email-quic_kriskura@quicinc.com>
 <CAA8EJpr9pcN-SG-yQNUGEoHCmv74prChprj4f42PKpSAzGzVKQ@mail.gmail.com>
 <0cc382cb-b76e-a5a5-3480-47a451bdc958@quicinc.com>
 <CAA8EJprvHSFKS2ZOLyeYgUpj4Fzec01RhQ7=nUh=qDpYBe0hrA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJprvHSFKS2ZOLyeYgUpj4Fzec01RhQ7=nUh=qDpYBe0hrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2022 11:02, Dmitry Baryshkov wrote:
> On Thu, 29 Sept 2022 at 11:54, Krishna Kurapati PSSNV
> <quic_kriskura@quicinc.com> wrote:
>>
>>
>> On 9/29/2022 1:29 PM, Dmitry Baryshkov wrote:
>>> On Thu, 29 Sept 2022 at 10:14, Krishna Kurapati
>>> <quic_kriskura@quicinc.com> wrote:
>>>>
>>>> Override the SNPS Phy tuning parameters for SC7280 devices. These
>>>> values are common for both trogdor and herobrine variants.
>>>
>>> They are common for trogdor and herobrine, but should these parameters
>>> be a default? In other words, a random new device based on sc7280
>>> would more likely use these overrides or the hardware defaults?
>>>
>> Hi Dmitry,
>>
>>    Currently there are only two platforms, so I made these changes on
>> common dtsi. If a new platform comes (mostly it won't) we can override
>> them in platform specific file is what I thought.
> 
> This is not how it usually works. The 'sc7280.dtsi' is not a 'common
> dtsi' for trogdor and herobrine. It describes the SoC.
> Thus in my opinion if these overrides should be a default to all
> sc7280 platforms, this patch is fine. If these overrides are
> applicable only to the two mentioned platforms, they should go to
> respective platform-specific DT files.

Dmitry's conclusion is correct here. The true question is whether these
are properties of the SoC itself (so do not depend on the board or board
layout) or these depend on design of board.

Best regards,
Krzysztof

