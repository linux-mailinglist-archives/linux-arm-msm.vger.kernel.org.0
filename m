Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 854925538B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 19:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353026AbiFURRA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 13:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353122AbiFURQ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 13:16:57 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5E92CDDF
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 10:16:56 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id cs6so16865190qvb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E5ccaIvRIXteqVNt2w/oxW2Vfyr34lOQhBiY70Y2LiY=;
        b=ukzNEN/xGYg9ZwWaTaxi/CYWjN1UXK+IY2/TKjL+wloNxlUdoJRzLvkMCVkfEwO4aN
         1bWcy9Y90TS3+x/R6MmfLOOFVTaFDVhWAjHcJ8ev3cFJJ095ei0I5lZHgebIJo2zR0WR
         j35TfRnQ6d4deWqqSgVHNkHo9a1iOswMR5v0Xji6rJ1ZtgSguQnGO2XALyfIBdDGTIdQ
         55D7s7HuF8FzXaL/0pRZG07Nt4ubghd70zGZRxL088Gwh6un2jjdGz83AWbiW2bUgBi1
         LCXonnOQhnGePzt3elAb7pz/8JJ52pnBNhSlsGnM2PmyTeEQAeN+yoC0f/Osyj2Lp49l
         Yirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E5ccaIvRIXteqVNt2w/oxW2Vfyr34lOQhBiY70Y2LiY=;
        b=5oO/e2E10Ps+JRzOHJ8L6zFHzdX5BHBz0AGqQ+vc9yKgOI7/fR85rvqWVRtyhSb+oB
         hGqyJODYLBVJ9y/8s56Vuf113iZ71abumTs5l/9g7hA9Rp5E4kSAiJSSxr1debUF1QJi
         BRowiPoXIj9ztpVqF2gwkDuG3g0RDWxFYAEhSwPwUjAMJ9HobgzpusvzUsyBsd9/vVtW
         SndgbUkTRTiOLAod22V5GIkgj+cqmZ5fPx26hwnIQBBCZMvcX5F4VfCvHSoDlkPukClU
         9X/0uMF2aGJWkYHrO9c+SxlvQ91k25BMxRFStJm4dd01JColLdbtV2EjFlwYKyrRxfeO
         e2DQ==
X-Gm-Message-State: AJIora8CmW2l7TyAz02l8tsxBGhZypEj5pJ6/VwMIEAlHjhEvvo4xSjD
        Su2WS0C5Xe44hQY2cEGWxwWZB5L7xb+cGhFKddE2lA==
X-Google-Smtp-Source: AGRyM1szZM/xn2oBTLu0KT0Kma3pFng6DiJJW2zHeQ49W5OAaSbei+2IZa+4TPCPwzTRPns55/vkxr0LiQy3eLxlUaE=
X-Received: by 2002:a05:622a:487:b0:304:fbfc:9933 with SMTP id
 p7-20020a05622a048700b00304fbfc9933mr25369800qtx.682.1655831815253; Tue, 21
 Jun 2022 10:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220621163326.16858-1-ansuelsmth@gmail.com> <20220621163326.16858-2-ansuelsmth@gmail.com>
In-Reply-To: <20220621163326.16858-2-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 20:16:44 +0300
Message-ID: <CAA8EJpo2cfWz6ph1BQLjkQ5HEvG3HWqmxN273dpDxg-aoHXzVw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: lcc-ipq806x: add reset definition
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Jun 2022 at 19:33, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> Add reset definition for lcc-ipq806x.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v2:
> - Fix Sob tag
>
>  drivers/clk/qcom/lcc-ipq806x.c | 7 +++++++
>  1 file changed, 7 insertions(+)

-- 
With best wishes
Dmitry
