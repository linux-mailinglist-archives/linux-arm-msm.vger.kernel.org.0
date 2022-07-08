Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D31D356C410
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jul 2022 01:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239584AbiGHTYd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 15:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239571AbiGHTYc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 15:24:32 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39038255B2
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 12:24:31 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w62so6541351oie.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 12:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WEH0jKAhMg/R/ZAtXcmhJHyQlTHAR3FwpDaho4cHgOY=;
        b=InH2K7dH2NjuGoaeuhMHZJKkEoIt8KoqlBs0E+Q3TTBS5RZRETLKTZRZT3Y0z2Gv/r
         2khUzoWLTbkefDeaKsc6pHYPsvYpONGBlM58vaEqm98vTDeKmrMelIOsi+LNxKzJ++6F
         HaSvWuREHYxyFwh4AjtzoLhPQruLwmmGLLxKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WEH0jKAhMg/R/ZAtXcmhJHyQlTHAR3FwpDaho4cHgOY=;
        b=S0dCOk0d5ADfowPgxKmIHPnY7BxLz5f3q/KNWpv/Q8IaGgWrWOJWb0bgX4AEABGd+n
         gUa2gchkqPHYmC2AtD1Wx/rVxaIdznRrGCZ1ZXwdSwRB9GmbwU8dMqq02OmOAAxLryzl
         0ddpGlnc1nPcuEVjAesq7td+bCMWfYRncsN2Stk/Io50leXTfdAj3P+wK3+5HAFRWpSp
         tsEKtdA01630OkvzmuYOqtdhN0b8QrYp68cvSI7YeGgb1NkD6cx0kueWwYvCI/dZkzDO
         y0L4VK/iRzs+Dj/xWQl4gb/NM1TT8hCteTmu31QQXremqIBjgxuZgXser/2r2AnYiDme
         mBYw==
X-Gm-Message-State: AJIora+X2AuZU3zaMqe7E1zmrMlT/TQKhymrOdIE8rkd9LGzfYF9aqt3
        vmjeWXbUlLDR8UJF27IJjSsbcQNg57UevFKru1B5EQ==
X-Google-Smtp-Source: AGRyM1ux2p5+c4xtdy4iOeVBnPoqwt4uYj+n6OsML6osTpvAhyLCATU4q8jvRdoE/W3LIwJY4+8mxYJs/1atXzH8xbs=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr831806oib.63.1657308270538; Fri, 08
 Jul 2022 12:24:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Jul 2022 12:24:29 -0700
MIME-Version: 1.0
In-Reply-To: <36a3490f-5c94-0c54-caa4-1b381dae7745@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-6-dmitry.baryshkov@linaro.org> <CAE-0n53An_S5H-jj7GPorLg0Q4jW=KqEn5CCrfqs6fn6LBtGNA@mail.gmail.com>
 <36a3490f-5c94-0c54-caa4-1b381dae7745@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 8 Jul 2022 12:24:29 -0700
Message-ID: <CAE-0n53GJANJT5uXzffPqFZuKu4YkzfrhyaCL15vq1VQrDzSag@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: msm/dp: account for clocks specific for qcom,sc7280-edp
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-07-07 20:59:02)
> On 08/07/2022 04:32, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2022-07-07 14:32:00)
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> index f00eae66196f..1ef845005b14 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> @@ -119,6 +111,50 @@ required:
> >>     - power-domains
> >>     - ports
> >>
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - qcom,sc7280-edp
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: XO clock
> >
> > What is this for? I would guess it's for the eDP phy, but that isn't
> > part of the eDP controller, so probably it can be removed.
>
> Good question. I was documenting what is present in the sc7280-edp
> controller DT entry. Could you please check if we can drop them? I don't
> have the hardware at hand.
>

eDP works fine without those two clks on CRD (hoglin). They can be
dropped from the dtsi file.
