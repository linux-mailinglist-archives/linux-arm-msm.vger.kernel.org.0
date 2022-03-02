Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358394C9A8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 02:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238927AbiCBBkA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 20:40:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbiCBBkA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 20:40:00 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2CF7E097
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 17:39:18 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id i5so480317oih.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 17:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=E6diWwTXyeBROW+UGxxDyRa540TTA/bBdes9qrLj4UM=;
        b=jClyHtOzmfwF+u9W6xgJR6B6yp3RH6kTbHE29G8BHKgUzCjDDSxB2nN0yjCN3FJpLp
         KIiE6M+zGmn8Eo2R3XENJVQyVXtU8wnePn/LZyhc0WdkbGAeyhi4RS+uSeaDjnc84n8A
         HihsyMdu+/mY7F3WGgT63ly95lVeSlendbVn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=E6diWwTXyeBROW+UGxxDyRa540TTA/bBdes9qrLj4UM=;
        b=nNKUYyJHSrwPgJvRVJ7TCS4a6UGc4xtTPtGEazY/md8WVAppXyIBdk+1de/QK5fUry
         vh49IVYiTejNnPyyGSfwO0NhF/vuc2CXAwH86xOXok/pu9pCqCbFAAtX0POxVCUIqyxM
         Y5Tvcclc+EQBcPw+3nrUDgUNal6WpwI/GGJya97e7wdBGmmRNnIv7/AdKOanmqrK4XZU
         63DvXdwIOHoVKAcn//HW+fC2iQ3ctlIyEZjUmxUEMmae1xNFXqYunSRb1Frrp3xUBf7G
         Lx/Wxde1GKGMyWApZou1nGqChFbKKi3hfHRYnOV20dyyAandq6gE+oEz1tzWhVSSUGzn
         U3yQ==
X-Gm-Message-State: AOAM532+nSy4ZNkLlrxYD78b1xbOClJtOlYMVDt2CfbxvPngjlwatc7z
        meGCkMc5lVsI9QLnd6dBj5Nazf9owPqTLokeaU+sTg==
X-Google-Smtp-Source: ABdhPJyVc8mt/2E94etQO2CuebnJCzyKdSVFOgRL21bsaQOZk6+CbkyQqoi5RkRSPudHu38uY0wDaLUvCMtoeKLFGLU=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr15559750oiw.64.1646185158007; Tue, 01
 Mar 2022 17:39:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:39:17 -0800
MIME-Version: 1.0
In-Reply-To: <20220302005210.2267725-3-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org> <20220302005210.2267725-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 1 Mar 2022 17:39:17 -0800
Message-ID: <CAE-0n533xbLE8WTO4YKb0rxa9BRqqdPN65MfNdrtEjXytWtCGA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sdm660: Drop flags for mdss irqs
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

Quoting Dmitry Baryshkov (2022-03-01 16:52:08)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
