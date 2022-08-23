Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A581B59CEDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 04:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239198AbiHWC6R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 22:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237982AbiHWC6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 22:58:16 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E854D47
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 19:58:15 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id v125so14606840oie.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 19:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=Svo0VGhlNsAjRUEIv2HFN82q65Tj9SoA9pghjvSW7MI=;
        b=l4gsy/Cqtu0Ddtr5c0Mw1W6jT9cH4cG+2aDIDHRWR01eumWvfXL5BWx22Th+luIvZp
         yXfVd/YyoBs4Opw8G5MEdcqufPqLdg6SEpWCB7UTX+PuUhXz6mlN0OL8lblsa6AXzKEm
         qFQB9RQrT8mHOn23ZAwZQwXRqyOrGinQwgnvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=Svo0VGhlNsAjRUEIv2HFN82q65Tj9SoA9pghjvSW7MI=;
        b=rsjvWYSaYoHPALlpJ2ywQM8S/8y6aZIMmChTr4RQl9z3zyQWBvnhRvSCn8apMMovOK
         3M1U3W1tAfX0zc5oiNh0V99YFNBA+b9C1uiNN5QFKW4F3vtJABKgzzT81ATF4eZBhaOt
         ctlkfFexZ6zEHAvHgxzFMhvomCADcVdr2GxggB+KXSEszwvx8ZWt6QZCxIyBbw7hj6P1
         eMmipfqlgZJTjTgBVapco1GiCHhkQsXtZkjAPok6W7quUcWLfd/lrs73X4f4tqTe9xUO
         TBsr3icg5GLp3Yc94jkbUl77vcW1IgAkGKI3MftpmGejdCEMV4gEO9csIy4+GJSRQUDI
         yoYA==
X-Gm-Message-State: ACgBeo0K7oQ4F/vktooO/TUNz0QiwvVDU850w5AtMm1pYQzFPvEy2mJm
        TDtOpxNpL0w6VAprbvBYkGrT4UULOQmrG0UcXpjrAA==
X-Google-Smtp-Source: AA6agR6Wi2uGRso3C6MRzWzjATij1xpq9Z5eK8DFfpx6n5awO9yfPC2oMQXAhCtd+xmSU/S7YLGprQPWH9gKZuEtZWo=
X-Received: by 2002:a05:6808:1142:b0:343:86a0:dedc with SMTP id
 u2-20020a056808114200b0034386a0dedcmr513378oiu.44.1661223494913; Mon, 22 Aug
 2022 19:58:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:58:14 -0500
MIME-Version: 1.0
In-Reply-To: <20220822184900.307160-2-dmitry.baryshkov@linaro.org>
References: <20220822184900.307160-1-dmitry.baryshkov@linaro.org> <20220822184900.307160-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 22 Aug 2022 21:58:14 -0500
Message-ID: <CAE-0n53oO8BNA8BLFP3cnQQ4GnknOJZwxgPUb8wR8tphPY6yNA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: msm/dp: mark vdda supplies as deprecated
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-08-22 11:48:58)
> The commit 85936d4f3815 ("phy: qcom-qmp: add regulator_set_load to dp
> phy") moved setting regulator load to the DP PHY driver (QMP). Then, the
> commit 7516351bebc1 ("drm/msm/dp: delete vdda regulator related
> functions from eDP/DP controller") removed support for VDDA supplies
> from the DP controller driver.
> Mark these properties as deprecated and drop them from the example.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
