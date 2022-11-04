Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18ED56199D4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 15:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbiKDO2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 10:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbiKDO2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 10:28:16 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5672D3
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 07:26:12 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id f27so13749009eje.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ezu4+x+FxmyX9LnUOtXYBWAL6xwSTPUJFe4qn695+K8=;
        b=CT1hZWbquyHWvrgB8QGBW5W6X6O9ZmDfiWMIdy36NP115npz/vftPW3Y/KXWY9GwVG
         eHJqRqakklZm2mrqCohYKxxqfmGsVd18ife5cR5uc2d9icoK1bP8AnHKDTb0lM1rWW3X
         7RcvCe2reUBgTMvL6PTalopiQulEArdShKqDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezu4+x+FxmyX9LnUOtXYBWAL6xwSTPUJFe4qn695+K8=;
        b=2gDNE/JIs2/Rpnwp9SV567foeZbOpve7ELH6i3cbIrTVQ5aVezPFSpuoYtsstXOJ6j
         3ORqrU5c8bTzXwZFFN1i6auz++BYsOOUL9fQHVZc5x0lyDPW1Ym9NDO9CBRj+j+sy5mW
         zZImfdvgx/GSwKm7P1YrJDQa7JsIELTe77hZziQDlBZp1AkFj5tn3d6Vru0MpipAP8LX
         bXxxwHIehLK+Afh/SzETnDwGphhXRhvARzr3ImLsf5UOzGR9iSGxV5qpNOMudmkrFoPr
         P6zYnKKfIm+66xHcAhI2bEXvZBgBcuXNTpCp0fmBlbwIQwbF+0EIykela7aJ49lhPfEU
         k+8w==
X-Gm-Message-State: ACrzQf0LhJUZffQSJfw7ZJrVQCN7OxoAJ58hp0iJYs59bDVwkruntNxc
        vu8nTemRZpy7Gs9/Cfxt5wWVuFkUbI+jyrW1
X-Google-Smtp-Source: AMsMyM4mlF9B7hIITh2d5iFBASXV2QDP3jko5PaOxZ5pjvyy/3afSm3+LmkFvmb9hcoAoOLNZxbD2A==
X-Received: by 2002:a17:906:86ce:b0:7ad:fe28:8a0f with SMTP id j14-20020a17090686ce00b007adfe288a0fmr15402953ejy.540.1667571970252;
        Fri, 04 Nov 2022 07:26:10 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id t20-20020a170906179400b0079b9f7509a0sm1903845eje.52.2022.11.04.07.26.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 07:26:09 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso5524295wme.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 07:26:08 -0700 (PDT)
X-Received: by 2002:a05:600c:4486:b0:3cf:6e1d:f4a5 with SMTP id
 e6-20020a05600c448600b003cf6e1df4a5mr20925598wmo.85.1667571968557; Fri, 04
 Nov 2022 07:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221104061941.2739938-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20221104141515.v10.3.I3ac715e729f6f9b5a3e3001b155df4f9d14e6186@changeid> <139c06eb-14b8-10b5-80b7-ba8ec8579846@somainline.org>
In-Reply-To: <139c06eb-14b8-10b5-80b7-ba8ec8579846@somainline.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 4 Nov 2022 07:25:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VwP_s5y0MVNLs+WGD_=nJtJe7h=n+Xu4Ky5RvgdkAw9Q@mail.gmail.com>
Message-ID: <CAD=FV=VwP_s5y0MVNLs+WGD_=nJtJe7h=n+Xu4Ky5RvgdkAw9Q@mail.gmail.com>
Subject: Re: [PATCH v10 3/4] arm64: dts: qcom: sc7280: Add touchscreen and
 touchpad support for evoker
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Nov 4, 2022 at 2:35 AM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
> On 04/11/2022 07:19, Sheng-Liang Pan wrote:
> > Change touchpad and touchscreen node for evoker
> > Touchpad: SA461D-1011
> > Touchscreen: GT7986U
>
> What's the reasoning? Were they changed post r0? Is r0 support
> effectively dropped?
>
> The changes look ok, but I feel like this needs more of a comment in the
> commit msg.

As I understand it r0's toucscreen/touchpad were not right to start
with. We are moving towards getting things upstream sooner and that
means that hardware hasn't always been fully tested out.

I certainly wouldn't object to a better commit message here, but in
this case there are no real world users (yet) and thus nobody is
really affected by this churn. ...so IMO if the series needs to be
spun for some other reason then the commit message could be updated,
but I wouldn't object to it landing as-is either.

-Doug
