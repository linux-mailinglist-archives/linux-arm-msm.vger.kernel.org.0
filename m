Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9474C9A82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 02:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238814AbiCBBjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 20:39:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbiCBBjf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 20:39:35 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16387E097
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 17:38:52 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id r41-20020a4a966c000000b0031bf85a4124so363783ooi.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 17:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rIkwW4M5gVOhf6lStrndyYQMI45yK4r8ntbnRtdBpfQ=;
        b=TKKK6Cm980ULKq4I2QCxffulSprZbP7BMvFu2JAr/2/up2F7lA2dwyqJ12Zt6efIim
         PUS2AW5T8/QbIO7WsJ0Nei+H1tlbhOklnsWn7koBBV49QPJUxR697SSlt5j/U/o6pv13
         gRYOnZ/vjQ6anC866KKgcw89XkP7CotO/+KLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rIkwW4M5gVOhf6lStrndyYQMI45yK4r8ntbnRtdBpfQ=;
        b=QmEA/eAZbQ7ufhrOnI4m4jXv9b+8wk5C+BwSAHHY1PiFT/6LCnc959KPvGeqY1zxG0
         d8D+bQinXPZr47a850hwmUDIVttZ8pEN8r0gOAKaQvO0Hf2J7Y6h5juxRByNSaS/NoqO
         kISosdulT+ya+gRcByMhvNbL+7HvK9qn4ARnrpEXuVOM7XRUD6zalo+72IIP7sXvuPqC
         GH/XFBDYqK1WRXR8dDtmgvu/hzOAYB++u51omBgn/eId9CdP/JCDB6uqS6dE4Q2WBLHw
         I8kq43usGgJOcHvwRv9iiVmy0yvDdOvx1cqJR57WOqpuWR6GqQAWjq5sknwMQTPRNqyB
         al5A==
X-Gm-Message-State: AOAM532xoZO9hlRdXizHASITssOXrf4YpEC1SqyX/n4TLcd615SpB5w2
        XQUaWJD9Hh4z9l5qDMG7+tyT0x2UajNOLjFEm9OfTw==
X-Google-Smtp-Source: ABdhPJxzYrMW2U+TG3BLR0861lZPPswIdwTyU+n8hPIaCWD803U1juloOlCoo84blCjcV1MqrGMAewbBXyc6GyGp9bU=
X-Received: by 2002:a4a:9821:0:b0:320:52bb:3806 with SMTP id
 y30-20020a4a9821000000b0032052bb3806mr797405ooi.1.1646185132284; Tue, 01 Mar
 2022 17:38:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:38:51 -0800
MIME-Version: 1.0
In-Reply-To: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 1 Mar 2022 17:38:51 -0800
Message-ID: <CAE-0n52brK_6gg5-hYA1cNzk3WVw9f0f_XO3QpUywJzY19u=kg@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8996: Drop flags for mdss irqs
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-01 16:52:06)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
