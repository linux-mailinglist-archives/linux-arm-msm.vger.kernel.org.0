Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3DA056B02F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 03:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236464AbiGHBfC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 21:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236151AbiGHBfC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 21:35:02 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC6672EF0
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 18:35:00 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id s13-20020a0568301e0d00b00616ad12fee7so15253089otr.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 18:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=NpN+oxcYp29c2mO0RL7bthtMEv81FAHmMW8Fv8F+Pyc=;
        b=iWl5UTV4BCL2ICWhQCz2OOigRh3v7wY1W8Fo7FiMGGBTj82rY7DdUTOXNCbMbdmr3e
         fEhHCAyaY7bD+shdmy/Av0dp0/0gcvn1VUZGihTb3Boe0eJQy9sOGQDtViPvgDqEVbSD
         BxbmWrcRSs83U5+lVau7kyba5MQQLRSk0IPoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=NpN+oxcYp29c2mO0RL7bthtMEv81FAHmMW8Fv8F+Pyc=;
        b=FURxO77bD1YdDPf/4eKZ4tHMixfO6y7nTIgIreierNYGpKGLjhIoNz0rQgrphJNbtn
         eCi+4GbEpd4CAQJ+U3f+WCiYzalk8tLZaivuTH+kq82WI7Xc8GPVyz9qTuY8KukDTaqf
         x7jjDW+k/5wlqv7upKWpoQvBkNZztnHprArq3SyPm/SqfFOEzm1p3n4ZJfG0TCg1cN5E
         LDkFMkKCG3xbrr0aLMRmfkAYajZOo719dls5mu8nmlH+Qoqx0sjunuLrbGR2rxnVKaB1
         Ew0iJ1YaOh1RM6+HhWxqs1A/N88k3FW8iWMddVmHOovQKwSn4Igxwrdue/UI4nSK/Y8c
         J0Yg==
X-Gm-Message-State: AJIora+CT3pP6UaT8TE68FQ6OaNP2CbW8nZfdrc1lMpIHw1FPKZcrSWJ
        8MAwhi5lOO2PLQlkTum68kzGgl77qVOrAy/5AONr/Q==
X-Google-Smtp-Source: AGRyM1s5Z2KtVB89iVu23mBhAyGc7cfqJu2d7j28UxYQ5Kp5MhNC59CD9LiVgGmf7x8MOavnVj4gY38gxJKBcHQjIZ0=
X-Received: by 2002:a05:6830:d81:b0:616:c424:6f22 with SMTP id
 bv1-20020a0568300d8100b00616c4246f22mr490761otb.77.1657244099764; Thu, 07 Jul
 2022 18:34:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:34:59 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-10-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org> <20220707213204.2605816-10-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Jul 2022 18:34:59 -0700
Message-ID: <CAE-0n50UePL5x8vJtymaY=i-Eo1PWUxMyLv+DPgY890KpBWaDg@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sc7280: drop address/size-cells
 from eDP node
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
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-07-07 14:32:04)
> Drop #address/#size-cells from eDP device node. For eDP the panels are
> not described directly under the controller node. They are either
> present under aux-bus child node, or they are declared separately (e.g.
> in a /soc node).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
