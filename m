Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27AD356B000
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 03:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbiGHBae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 21:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236954AbiGHBad (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 21:30:33 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61A572EE8
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 18:30:32 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id w83so25457341oiw.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 18:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=mGR8qW/qcR3tV8N518zXTOtY5AVTv6L2Gv4vwTMvX2c=;
        b=Ue0qNkMJastmFq+YudyeYt2KIe+niHTqyrivhnn+9BmvMSOmjJzkOt/UBQWfBf2b53
         cC1+vGvZvdYF516WCMQwCHxWN3Q/j7JhyJOecljID8oFeNWFvSQkgWYcRvUfp8fhypoT
         fqeCky+as3DBGScPTDOT6uHMYWv6Qge4d41+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=mGR8qW/qcR3tV8N518zXTOtY5AVTv6L2Gv4vwTMvX2c=;
        b=M1SpcEvdDnHm32tb4q+rfYyHwVjruZuI8PWCwbF49ew7BYbCEwKNEzv6ShG8fG+kSn
         sdLJBZFUwH38KwlgjvoPO408btIPDjvOneA2Ad9yvmIpFbzYg1ARYYOl4ejuR/QvGdYS
         yzO20GB/J+eIRg0v40OVVxj0hZSqvIel0uidps+34zkVb3AkFlGX8FOgUHatNjx6sQdA
         zk7pW5tFqermAdR3Tt671jQfENhtmMkPwAUA3TkgIlydI0X0+NWCMTUcrBMnxELnpDEy
         KxzrDYZSGbPmzBDbnTCqIxPuV8xWfLOR4mN7EJ7hy5oD1PUF4kak9zxOL31hvGTwT8ia
         BwHQ==
X-Gm-Message-State: AJIora8vf4zAMtIvFysK3y8WARLAi5frVg8qbPmzxgrq1vZU3qHu1C/w
        toz9OCRJqDzrlB8tIXWh68PkT8o0mm2E2aSHLOtqGA==
X-Google-Smtp-Source: AGRyM1seFnmCmW9IUueoNP90VpqA1jwKAoGBliX7GDJogEyAv6R8J1FU+8CcIIRVxUr4LlXHPKu47wp3cT8ZmPpjRSE=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr498377oib.63.1657243832038; Thu, 07
 Jul 2022 18:30:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:30:31 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-5-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org> <20220707213204.2605816-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Jul 2022 18:30:31 -0700
Message-ID: <CAE-0n53ES+cLCWpd_T1bohybNrw4V7ntj87AbsesQJcmFedcgw@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: msm/dp: add missing properties
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

Quoting Dmitry Baryshkov (2022-07-07 14:31:59)
> Document missing definitions for opp-table (DP controller OPPs), aux-bus
> (eDP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
