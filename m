Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6AD35A5F76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 11:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbiH3Jcb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 05:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbiH3JcL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 05:32:11 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760EBDEA7B
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 02:32:08 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id v26so4460222lfd.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=DI8R5uBfUCPdaITMxiTJ7CTu8pb9+geNomuQXiCpnr0=;
        b=EI+kX0MIh7dM75jIWk5kzV+psrJX2vqVdAV3nYBd368tgD9H4/7BQNqg/NqSfxwQWw
         NO52QwNk1KHMnuXWgM0aY13g4hlfug1T2ig/krnVYsA0T66MxhlBMCvkhCqUvOw0ywqG
         bDzuxncaHbd25Zpu1lkX5ZY4cnBXfS++ss7GhLx+Op2yAf+vBD2s+ol8DTusmln4r+mu
         NrxlZ0tW6emLdtJPTFReevrJghIz6LpvusVer4pP5dZAaQMXsRtDPa7KmmUjle9Dp0l+
         MpNw5gCu8Qp2Ygqg1i+tGXvAizICUojIuJyW0lNihDW/8Yv7cNv0W5UqnwtWTZDkuaSl
         BCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=DI8R5uBfUCPdaITMxiTJ7CTu8pb9+geNomuQXiCpnr0=;
        b=jPQoKZUXv/iDrIugCo19yeKzcznrcy4RtUXRKjkPoctMbPO/MIpVtQOP+mCUEdQ4B7
         i3IEc2vZjJ4+DioNR05Za6rRuvoXYf91ocUYNYOQfkz2oCpXn5FdZ3S6BD8oeN9ThZXC
         vzdtJWH7SvkVXzJmYsJMM0klT4LT03erKvF71oofKHPJJLBugjMwr45QWoTbeGjHRQW/
         8xbeIdfU7ZPsLEWZaKTjFTSrYnCrXX2GIDEhgaTCo57G+iI7NcRA4WZmvVH+yIdxSVqn
         eBvjX3wQIQUcClI16SmKrJ8gxsmxBrqdy4lM/wFNrGODPBhHu94IZZ0qlG5MdPhIaP7e
         MB2Q==
X-Gm-Message-State: ACgBeo2hvXG4/MJxBLmd0XVXvxMhGyQkP08oF+wqTrNsDtiuClKaVFiz
        ec/eGPhvlmgHgym7Mx8v4StXFw==
X-Google-Smtp-Source: AA6agR5pvdm6ppGDodlxvczV0eI5jT2RR3G29/7S9uRukhMpYXw8vrXirlsmxe2a8LQqnM76clooew==
X-Received: by 2002:a05:6512:261b:b0:492:cd8a:e1c with SMTP id bt27-20020a056512261b00b00492cd8a0e1cmr7173154lfb.528.1661851925857;
        Tue, 30 Aug 2022 02:32:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a28-20020a2eb55c000000b0025e2c5a12b6sm828961ljn.129.2022.08.30.02.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:32:05 -0700 (PDT)
Message-ID: <aeec2729-e610-f266-f336-847675cf85ec@linaro.org>
Date:   Tue, 30 Aug 2022 12:32:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3 00/30] phy: qcom,qmp: fix dt-bindings and deprecate
 lane suffix
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220714124333.27643-1-johan+linaro@kernel.org>
 <Yw2a44l9a6zz5qTJ@matsya> <Yw21t1SUGjCcUuuw@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Yw21t1SUGjCcUuuw@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 30/08/2022 10:01, Johan Hovold wrote:
> On Tue, Aug 30, 2022 at 10:36:43AM +0530, Vinod Koul wrote:
>> On 14-07-22, 14:43, Johan Hovold wrote:

[skipped]

>>> The final patches add support for the updated binding to the (recently
>>> split up) PHY drivers. Included is also a related combo PHY cleanup.
>>
>> This fails at patch 2 for me on v6.0-rc1, please rebase and resend
> 
> Are you sure you haven't applied anything to your local tree that causes
> this?

When doing the QMP split, we ended up in a similar situation if I 
remember correctly. Most probably the easiest way is to provide a branch 
for Vinod to pull in addition to the patches being sent to ML.

> I just tried fetching the v3 series from lore and it applies just fine
> on top of 6.0-rc1.
> 
> Note that if you've added a new compatible string locally, the second
> patch which sorts the compatible strings is likely to fail to apply.
> 
> Johan

-- 
With best wishes
Dmitry

