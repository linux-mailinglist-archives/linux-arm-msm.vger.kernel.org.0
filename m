Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C990D7ACCC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 00:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjIXWwt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 18:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbjIXWwt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 18:52:49 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB338107
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:52:42 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59bf1dde73fso66089817b3.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695595962; x=1696200762; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=auyqnC2od1D1E6PNuRLFn85+jnnL3wyAnZ8O7zNakLM=;
        b=T4XnOvo/zEBfnDlfKDUEotIa4EeUZ0PoqHYYEkuw9P9Jfa31bwEfonNG0Z5ouicPLe
         hOl29kn30x8N5t0GObTs7oxTtLtJGuQjO7KE5+wMrrjWRBHTO1SuYKHAUi9bbH3jJlvH
         G2F1zJaz2xt60QTrWyUS1QFAhdQ5SAu7rqCsRZyRRfJ+tQqACwjNOW78lP/vBZHEs6MS
         +3Q8gb/IIl4s4DJz49T8b/z6Z6d27POqch4HFnAEP0VmtHnBecW5GrmspDFjlunqcUWc
         f+5r8sgAyj2Qq5JBlkfo14vrUAEewgKln96wr4VLjEEEEMlIb6kOj6f/0lDqwRSxNS6+
         t/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695595962; x=1696200762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auyqnC2od1D1E6PNuRLFn85+jnnL3wyAnZ8O7zNakLM=;
        b=CUIkAZCW5+xLimkRE0AubYufROotuD9JsuyBnNPTeCF43Avng9cqwNjnIJdCDPMwj4
         +l0V74DDOywEMJ3978yFY2XqVo82+ZGjWuGttjIhamtL14onVrwCBMUx5l8shy3yT81m
         MGW9vMThiAyjtCboZdjmdLQ5QVrabgsCKY7taQBezs7xN+6Qqbrsv0U3r5sK2zemZ/OY
         qTh5F2dkQRvsL/2ERFASCsBpyk3JbVxJ34K2lFLfZZUek3DH31PvUE5f9sE3zLyFwtlk
         NRYL+cEwSgYHWziRlQAiGAts1RRT6LAlhmZM3N3vVKxmvS5wQ6omEQ/2nwz5u8g0P38Z
         2IMQ==
X-Gm-Message-State: AOJu0YzDUQIP1cXZeBDpvUnbim6FXfxhRPBVmEKJp4+LXX22pK2hctG8
        WOdCCl13isTN/bSE3ktTBgYj7sXKpnJ6J8hsOAS67A==
X-Google-Smtp-Source: AGHT+IEf/xYhIiOIqZMykdecpoI0YeQjJIGoahaAMKx6VZ6eeH9LAMmD9EAFBb2rL/KQnqGYfMv336+BVVn5GBeu+So=
X-Received: by 2002:a81:9191:0:b0:59c:786:f58f with SMTP id
 i139-20020a819191000000b0059c0786f58fmr4913540ywg.6.1695595962104; Sun, 24
 Sep 2023 15:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230924183914.51414-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230924183914.51414-1-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 25 Sep 2023 01:52:30 +0300
Message-ID: <CAA8EJpoQJUSS=tKNbKLy1AFm5w1FdOkVacDw0wzGOBTdsEfyLA@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/4] ARM: dts: qcom: apq8064: drop incorrect regulator-type
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 24 Sept 2023 at 21:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> regulator-fixed does not have a "regulator-type" property:
>
>   qcom-apq8064-ifc6410.dtb: regulator-ext-3p3v: Unevaluated properties are not allowed ('regulator-type' was unexpected)
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 1 -
>  arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts         | 1 -
>  2 files changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
