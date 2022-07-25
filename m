Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0238C580302
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 18:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236357AbiGYQmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 12:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236531AbiGYQmB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 12:42:01 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CE1386
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 09:41:58 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id w15so10873972lft.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2jedgEO4YHk9ybZI+voHeoqJA++CworgyjlH//uB6CQ=;
        b=nLlMSeid7nH81c1pFIfRBEvBS+YFlCXMoltkArerE5eJgW1eC20uhpaQe5EJd8bR8m
         PFaNljRvpSvQ1zApkKTH86Gx3ALfG/OdhpRBbF5kyh4qJFHhVDQvZsyj04s3WNSmiBHd
         Z/aOw7rCk3+NWzqmpFgkwRmZnQLJ1OBhdxTUYJ8rUJk7VrC1fGYHih32IiDABQ34CY2r
         dXrJXkPC05mrVeziSrmNhxMYN+Q04erZ03xZ5knEg3DH9quJnYZv4//XrmUrtjcmFOnK
         XpaaTFpukO4RBfBbNd1AGoRHTit8RK0+jhkmWloCj54El6dj5D7sdQvBjDoE4v6P+7bT
         1g2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2jedgEO4YHk9ybZI+voHeoqJA++CworgyjlH//uB6CQ=;
        b=l7WWceamSSSBt1rS/r/bSKtnCM05xnO+wATK7SdNv4FsleS4CxgrniJBIYcz54lDhq
         EOu8XFRLt5zFGsIncFufouzC13tHBNMsQ7yflN6CWeaG4X/br/aSVwx65YSr17HYtIJN
         ooYPXxHlDzGUmvbWHsqWYkFXzhK8cuN4pzwVSmrty1CPLlPdA4xIWGcns5b9FPB+xNtd
         0NqLd48JfJbsAL9PBLtdZca4uJIXAyB2byOrGHFYKnxIDJorimq6RBtisondxiag6/be
         F/fRD398EueDmKIz+hO7Cakpmad9zT1yGM33n6zP/ieN/0ZjnyKYAQ2Ae6DoFgUCZe9x
         HIHg==
X-Gm-Message-State: AJIora8lCPnlmacQbEvrjZtslugx/Bm9L4GhyFADYOhBwjYh709oG682
        CszoyXj0UfBQQO4gCLs6xdZ66A==
X-Google-Smtp-Source: AGRyM1tg1w5VWQhCWBGKwm2fnO0Mgk72rwa3Bf7LGruG7s8kWx9vN2dsMX5PAToUdBDOi5UzI/u21w==
X-Received: by 2002:a05:6512:3e29:b0:48a:7596:b4b5 with SMTP id i41-20020a0565123e2900b0048a7596b4b5mr4926983lfv.486.1658767316968;
        Mon, 25 Jul 2022 09:41:56 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id z20-20020a056512309400b0048a93325906sm409288lfd.171.2022.07.25.09.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:41:56 -0700 (PDT)
Message-ID: <76defcb3-8566-286a-d953-54c4a2b04782@linaro.org>
Date:   Mon, 25 Jul 2022 18:41:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org>
 <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
 <CAD=FV=WGtDMmB08py8D6jc0cv3xGsn5Rfc0MObQbEV=CiisBYg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=WGtDMmB08py8D6jc0cv3xGsn5Rfc0MObQbEV=CiisBYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2022 18:25, Doug Anderson wrote:
> Let's look specifically at the device tree file for the LTE board. One
> way to look at it is that the dts for the LTE board should have
> compatibles:
>   compatible = "lte", "wifi-only"
> 
> The above matches the normal device tree mentality. It says: "hey, if
> you've got a lte driver for this board then use it; otherwise use the
> wifi-only driver".
> 
> However, the above is actually broken for the bootloader use case. The
> bootloader is trying to pick a device tree and, to the bootloader, the
> above says "you can use this dts for either an lte board or a
> wifi-only board". That's bad. If the bootloader picks this device tree
> for a wifi-only board then the OS will try to initialize lte and
> things will crash. To go further, if you think about it things
> actually work fine if the wifi-only device tree says it's compatible
> with the LTE board. This is why I say it's opposite... ;-)

This is not specific to "bootloaders" but your specific implementation
of entire chain. How you described it, you have dependent pieces -
user-space must use the same DTB as bootloader chosen, but bootloader
makes different choices than user-space. It's perfectly fine to make
these choices different, but then user-space should not depend on
something which was/was not initialized in bootloader.

IOW, if bootloader picked up generic WiFi compatible and user-space will
crash if picking up specific comaptible, you have a dependency and
user-space should probably bind to modified DTB, where LTE comaptible is
removed.

Other systems - I would say most of them - are independent, IOW, we try
to make kernel and user-space independent of what bootloader did,
because we are never sure what bootloader actually did and what DTS it
received.

Best regards,
Krzysztof
