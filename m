Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03C2543E08
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 22:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233991AbiFHU4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 16:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbiFHU4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 16:56:36 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D36203A1F
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 13:56:35 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-f2cbceefb8so28740279fac.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=uoflk9ZD42yTqlWFFFtt2B3OyFO93fCK9K2LB5UTMT8=;
        b=mspAVxZx07cISScTn8vphHUwaC9+I1lJP/rNe4vCeLEPkIMfrye3kzXFsg8y30kNUQ
         E8axWJREnFK7kgXPPdhb40iW94D8vS94Xa+Q1cGSDK+kpoAIHLcEnO9xUwW2BqULnlQt
         JgsziaHWOF+CdH+0ugkPKHjk7GSuBnZrUas/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=uoflk9ZD42yTqlWFFFtt2B3OyFO93fCK9K2LB5UTMT8=;
        b=lXdoYfJnTUqwSgVCcMJ2wXldMRJ3r8uNWO8mJGCfzjWZW+SGIeIuS6IBjtSq41CY/i
         JcRny2g/dXRrTWkuhQ60rPDLpcRzvboqoWQjBq4K5tUPo62pzs5xHovIJLrEwdfciInT
         7XNgPMCgFg6AAL0dvRGREp0llS6t0zDEFwYHPLpGi8YNN+xZMrEkJBwh75HmaGgTyGj5
         eLaTtAFSv+T9bEVY4srZbs/iD1uy0S1pZkrAXZ4PvPCN0dfIZd8zzHmUTfBNWDcmom9h
         Sn1K2ItNMI9dcB5fKjJDokauxWIQ5g4QZf0lFjjFx4GPQainCCJcU+Uw2a8iDBEfTNLg
         hEvg==
X-Gm-Message-State: AOAM530NvjaR9i5MiuTyUgyGcIDjTZX7fyDxuvetNWr67oIkPNVOakb0
        j11W8iDQZKRcMa+igZA3b3FArD1q/rSVZ3NtItJAOA==
X-Google-Smtp-Source: ABdhPJyIaQ3UiUYUvaiSPO44e3POU/qNgkGu5ZFpgew9NSUx88rB+R+DEX5E3FMCjq8MpcqYcFKBsJcgHwyAMwkkIzQ=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3367934oap.193.1654721794575; Wed, 08
 Jun 2022 13:56:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:56:34 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-3-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org> <20220608120723.2987843-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 8 Jun 2022 13:56:34 -0700
Message-ID: <CAE-0n53UGHQXcU++xk+sXxNTg78_Na=Cw4Jjtmn_JtknW=r+5w@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: display/msm: hdmi: mark old GPIO
 properties as deprecated
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-08 05:07:13)
> Mark obsolete GPIO properties as deprecated. They are not used by
> existing device trees. While we are at it, also drop them from the
> schema example.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
