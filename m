Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E192664A7E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 20:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbiLLTGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 14:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbiLLTGj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 14:06:39 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740A6E30
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 11:06:38 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id f20so879134lja.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 11:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEJxu1g81roPe0i8eJryMhOWFdQm6LJI0HdrPNwX14M=;
        b=iRhD01lSx1kvDXvJ6BuHLr5JQj3kD2Whihh5XOAfCBgnmW58a85WEAXw5KjhhDHjU0
         MDW4k1FBeBgtfN1CAh6Aw6pwPP+iKLFAup5CDAWsW9ut4Q7gfjSKIGaLpmnbnrJXi+pL
         ORbjAmov7QEi82Cm5CJZR+Qkb37CiCGiI39NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEJxu1g81roPe0i8eJryMhOWFdQm6LJI0HdrPNwX14M=;
        b=p0NUXnjqfedoRZksMddC2VwlkVwTeEuViAdmUTWV4Tk7mZ89Eu/zJw+VKK52g1w0zn
         fy13e7Tm0Xkn/vGE0oVm5Ym7KvYUkUsp3xADX7BdZUwOXNZBlAGD8613AZps9oK4XwDL
         ph+ls67q9XFX+sdHMS+ErfKK2ZmLA7Zhms6SYbj3Zb9TM3Sw9HrSeWip9Fk4Tj0rZGvD
         QYIi0ZH60PHuAHM/I+aZEo5bhgOkYUh4QeH8y1wrr670PLf02VXBPDMLOG2aQE9Dh2rY
         dypKw2G/Lj1ZvVrMZYjyluSD+nJH2/0v2xv2lPptS2AQYh03hq4Z/iWvXyeTCXf/YTu8
         B3tQ==
X-Gm-Message-State: ANoB5pn+IfIJRCkQrbFQ9MELNx9Dgefugq/OCH7GVDMUgXDJxkWF6AG5
        6GkeXex8JoDJuyKy8sjEbuRUaU8ozzNAb51LR27/Lw==
X-Google-Smtp-Source: AA0mqf6KM9VfMQGMIy4WeHcuGBzKsB8ECIos/Hrea2oX688301W9R/WMM6YATRzZ74GcMNK9B4e3OAS1VsY1w1qDTlY=
X-Received: by 2002:a05:651c:308:b0:279:e368:f650 with SMTP id
 a8-20020a05651c030800b00279e368f650mr9051046ljp.39.1670871996848; Mon, 12 Dec
 2022 11:06:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Dec 2022 14:06:36 -0500
MIME-Version: 1.0
In-Reply-To: <20221212133303.39610-1-krzysztof.kozlowski@linaro.org>
References: <20221212133303.39610-1-krzysztof.kozlowski@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 12 Dec 2022 14:06:36 -0500
Message-ID: <CAE-0n519UP1+VigUCRpzGBcKgpS4wFTeciy1+6SF+4Z=0ZS_Xg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc7180: correct SPMI bus address cells
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krzysztof Kozlowski (2022-12-12 05:32:59)
> The SPMI bus uses two address cells and zero size cells (secoond reg
> entry - SPMI_USID - is not the size):
>
>   spmi@c440000: #address-cells:0:0: 2 was expected
>
> Fixes: 0f9dc5f09fbd ("arm64: dts: qcom: sc7180: Add SPMI PMIC arbiter device")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
