Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1414B56C420
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jul 2022 01:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239767AbiGHT1d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 15:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239773AbiGHT11 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 15:27:27 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299A920189
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 12:27:27 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-101b4f9e825so30471850fac.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 12:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=nb54qYULM0vTsfoEr7Cgmm5gQnfLelqJiQLdthiv74w=;
        b=D/+DcpfH0jUz0UsYC43QGWVbL2V/iV2tPM39nWkKun2O+TzQU/iFYfFp6BL8IVrVlp
         bpz79YOq5TrNK3DqJAz16WF8vfx7cBZ/oBPPAI/PkBna+a2odWqP2EG5Bv8/kdTy8nhz
         JqMdy0IYlsCuop0krC1KCGQTDnSFLM71u6XhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=nb54qYULM0vTsfoEr7Cgmm5gQnfLelqJiQLdthiv74w=;
        b=pEO8KpXF1J7h4UCP9QsRTL9vobLCN5HR37qRln2ZfBZWtH3+6PUYM5la1ZUSYeEuJl
         zq66TnE/kTxk5G2Q0d2ZcOGdo4jD865bED7lx94fNwj2LiF+SojyhIhRnDVo4nGvkppY
         tbnotEXMgtl0apD+b88bIrNA7RYGN5l4WNKU/5EWczdnEjP6c9kit6sFpJEPrMCelO0H
         8qMW3JgSX5nUHDpDbziWVRChHip/INnj5gw/tQ0tlrJhfQSwFDYten+nJ5O8TgVuDNAN
         mqk/rFhbc35GQJtBZ4VELygS+RiZItdSPAIZWf9eN7TV4W7TBEK6fu063Syw/O0dWNsD
         FYAQ==
X-Gm-Message-State: AJIora/VpE7U9TJiy3I+SIFeX+/zfXfhelCOoROb7+qYAfR5Dx4hfHDa
        x8YTCqit3fzUzVE1FKbs9sJ5LNgoJZwCpAW8wEna4w==
X-Google-Smtp-Source: AGRyM1vWz0fkrGew2h/UaZYoqGkwYKUnte/wQFFmA/erT7vfCPThAI2cVqmWJbI4fa7+R6xFCtz07OHf3t06kAfGQCs=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr888548oap.63.1657308446479; Fri, 08 Jul
 2022 12:27:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Jul 2022 12:27:26 -0700
MIME-Version: 1.0
In-Reply-To: <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org> <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
 <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 8 Jul 2022 12:27:25 -0700
Message-ID: <CAE-0n52YGDOSZpL+3d=_APsOwVvrJG7uR-x1AcsBej5KrDct5w@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
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

Quoting Dmitry Baryshkov (2022-07-07 20:46:43)
> On 08/07/2022 04:28, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2022-07-07 14:31:56)
> >> The p1 region was probably added by mistake, none of the DTS files
> >> provides one (and the driver source code also doesn't use one). Drop it
> >> now.
> >
> > Yes, looks like the driver doesn't use it.
> >
> >>
> >> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> index 94bc6e1b6451..d6bbe58ef9e8 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> @@ -29,7 +29,6 @@ properties:
> >>         - description: aux register block
> >>         - description: link register block
> >>         - description: p0 register block
> >> -      - description: p1 register block
> >
> > The p1 registers exist on sc7180. They start where the example starts,
> > at 0xae91400.
>
> Do they exist on e.g. sc7280? In other words, should we add the region
> to the DTS? For now I'm going to mark it as optional.
>

Yes I see the same address for P1 on sc7280. Maybe it's a typo? Abhinav,
can you confirm?
