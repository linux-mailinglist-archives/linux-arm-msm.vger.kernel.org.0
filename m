Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0F544CC913
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233137AbiCCWeo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:34:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbiCCWen (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:34:43 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E52313D921
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:33:57 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id x193so6225975oix.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lF0Dtfm5tuXnG8vTMCkjXhHNJyKSmMyJEFbODIk9Ay8=;
        b=hP54rWK9695Xv6Ax4gxz/Z0LyxkVeLS1cVuj+Db7e++0rVJLFrPRykRPG8sBya9xWB
         QVDQc9kZGQ/hBdMAZZcyqteJ2EWRSG2oiUOkVL0f38FyPYqTqDFbIIgwvcY6TjCpfmyT
         2Y3vLXbzh8+57i5lLQyGXbNpXCHzl1FVrx9oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lF0Dtfm5tuXnG8vTMCkjXhHNJyKSmMyJEFbODIk9Ay8=;
        b=4LoPW7BFnTt2six9dkkeBhV+sZT4yUPXPT6Cai+rs7LwUW2u5T0/oW8rdVTmFQjyMm
         xmckGtIlX9FkNdf5BkqzxN3ybhuF2Zo8lw5PicPbaNcwrz0H6T7kFJ02g7ZDo29b+dpb
         o4nlrfGvAzHUhCfm4gMwq28PyUWVc7xp+23KxxnTX5oqxiQWus450vOQf2LNNNLj5ORR
         wmVbYcESNL+wK03ABhwJ9/uujF+WqI7GJC2+uIKNU1EqG4CfKI4HnqjnhakuUYTwx/XQ
         QzAJgXMwI7IrSSA1O/BY1RQRIoaUdXESFbg2x0UqR0w1tlErUZEaK0dyz/OPtVOgaV/9
         lfdw==
X-Gm-Message-State: AOAM532Huucda3LEQOrTViKfFUaCdN/2iQrI7xTh/IN0qe09DKu9IpEo
        E1ZACulAaLWjo1KRKGK1AUibbGVD2sjJDHRsYHFoWw==
X-Google-Smtp-Source: ABdhPJzgOEQ4DnlS7qHir2txR1YyHGHvpGpOujLYaX4vwlMWe2204uMruSrw8Lxh9lr5F/i7YbKW6Tr1Gwe+2d24nNM=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr6674548oiw.64.1646346836818; Thu, 03
 Mar 2022 14:33:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:33:56 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-6-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org> <20220217055529.499829-6-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:33:56 -0800
Message-ID: <CAE-0n53fxr=-jT2LvbNsyTMqT4B9t9q=OzzmdMSdf7U0QJLNuw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] drm/msm/dp: rewrite dss_module_power to use bulk
 clock functions
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

Quoting Dmitry Baryshkov (2022-02-16 21:55:29)
> In order to simplify DP code, drop hand-coded loops over clock arrays,
> replacing them with clk_bulk_* functions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
