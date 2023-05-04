Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E73EC6F7176
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 19:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjEDRsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 13:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbjEDRr7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 13:47:59 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613B512F
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 10:47:56 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-b9e66ce80acso1123618276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 10:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683222475; x=1685814475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WmLmZ4NUVex/zW0VW9PZGBLrRjf+L442SsHdQx/ScHI=;
        b=Awgu6kTDO+Fv6jxwGDnu9W+EJCev1TpOimWLGD+Pg7dd6DaHLEE5V0tikC6sDyJrOk
         L5tRxzBQTklw2ag6srHzeuSxoB++mkJpzfvOdWKVzNXtstMVHdAMtbHG3ibgvxjX6COO
         I8siMPKWd213IqMlXZJ4Lz0jHYYnqPh4gkD3j0Wj/PfFVGhNb7+t8rQgyjovOIXLoasF
         e9WW93Y3+ka9f93qEjRoF7jpfFRkOWbqCYYa0upgz/K9gUDjw+wkvspEUyYP8mz1zFLr
         8y8SKAW88JBQ86QjSv5l32swub/pOrx5+fUFhQ4wrZABNBn61JmfmCy/RwzZOB+cPfMa
         +1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683222475; x=1685814475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmLmZ4NUVex/zW0VW9PZGBLrRjf+L442SsHdQx/ScHI=;
        b=AEJXWZk9TSajBlxS7i5ahyPNJiqWGxU3Lpa0Z9iychXm0BRr3jt3FNEwyJWqdYNMZz
         SRqdmWGKwM6PuuU9LmHlweDjxmMlc6FmLDKntKYcE3InKmsEJbnaoHn7/f2qXd0/rNyi
         RRUOPoJVwJR8Vy8u+9TjPhPKWFp38SRS2ewG7iq0U+ex2OH8KHvy6w80JXMIZ3zQwWZQ
         lCkt1H2h/LVtx3MCqjbBWMoQbgzbFEqnyEvzdlLHfZ0Y6LJ+7pi1bsfo2xOV88p7oGK8
         /Na75g6jAPjtwZHftExkIrIf4Y+DyMhiHnnHZYLAlufHHSSRUGzu5L5brliHC9ybr5wu
         CKVw==
X-Gm-Message-State: AC+VfDzOpCWFlLTHgZi4Dw+SMytW7GjliZzYiG9w23xtwulGI7bwg47V
        vLCSc4jtaefNvZQJkW7wyC78MtHjSYHGuoAWQ7dQiQ==
X-Google-Smtp-Source: ACHHUZ4lMg2po+V05CT8e0bF8hKQDOZIyB47SunDrlnkIDMwwPwiH9jVZE0FSxqr7Sd1z2NXBt4lzVZS74b8ghqvt6Y=
X-Received: by 2002:a25:4088:0:b0:b9a:7df5:4f1f with SMTP id
 n130-20020a254088000000b00b9a7df54f1fmr822189yba.37.1683222475562; Thu, 04
 May 2023 10:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230504160430.4014206-1-dmitry.baryshkov@linaro.org> <723f23b2-c4d8-d688-b261-4198537eefe4@linaro.org>
In-Reply-To: <723f23b2-c4d8-d688-b261-4198537eefe4@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 4 May 2023 20:47:44 +0300
Message-ID: <CAA8EJpoHBtxMg559WdG+G=+BEJPiVo4agGEfxCORjWDwMTC5Ow@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: enable dual ("bonded") DSI mode for DB845c
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 4 May 2023 at 20:11, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4.05.2023 18:04, Dmitry Baryshkov wrote:
> > Now as both lt9611 and drm/msm drivers were updated to handle the 4k
> > modes over DSI, enable "bonded" DSI mode on DB845c. This way the board
> > utilizes both DSI links and thus can support 4k on the HDMI output.
> >
> > Cc: Amit Pundir <amit.pundir@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Konrad
> >  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 36 ++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > index e14fe9bbb386..4dea2c04b22f 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > @@ -419,6 +419,9 @@ &dsi0 {
> >       status = "okay";
> P.S. wanna move status last by chance?

Not within this patch, it is not relevant to bonded DSI mode.

>
> Konrad
> >       vdda-supply = <&vreg_l26a_1p2>;
> >
> > +     qcom,dual-dsi-mode;
> > +     qcom,master-dsi;
> > +
> >       ports {
> >               port@1 {
> >                       endpoint {
> > @@ -434,6 +437,31 @@ &dsi0_phy {
> >       vdds-supply = <&vreg_l1a_0p875>;
> >  };
> >
> > +&dsi1 {
> > +     vdda-supply = <&vreg_l26a_1p2>;
> > +
> > +     qcom,dual-dsi-mode;
> > +
> > +     /* DSI1 is slave, so use DSI0 clocks */
> > +     assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> > +
> > +     status = "okay";
> > +
> > +     ports {
> > +             port@1 {
> > +                     endpoint {
> > +                             remote-endpoint = <&lt9611_b>;
> > +                             data-lanes = <0 1 2 3>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&dsi1_phy {
> > +     vdds-supply = <&vreg_l1a_0p875>;
> > +     status = "okay";
> > +};
> > +
> >  &gcc {
> >       protected-clocks = <GCC_QSPI_CORE_CLK>,
> >                          <GCC_QSPI_CORE_CLK_SRC>,
> > @@ -493,6 +521,14 @@ lt9611_a: endpoint {
> >                               };
> >                       };
> >
> > +                     port@1 {
> > +                             reg = <1>;
> > +
> > +                             lt9611_b: endpoint {
> > +                                     remote-endpoint = <&dsi1_out>;
> > +                             };
> > +                     };
> > +
> >                       port@2 {
> >                               reg = <2>;
> >



-- 
With best wishes
Dmitry
