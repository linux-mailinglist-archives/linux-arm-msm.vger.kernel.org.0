Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7317A740E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 09:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbjITH2O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 03:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233733AbjITH2L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 03:28:11 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E786C118
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 00:28:02 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-59bbdb435bfso64952037b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 00:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695194882; x=1695799682; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gwW/aKgkBI8jvoRbmdXukbiIBoNPv5CCX3I1vI78hY0=;
        b=h5mSKrfPKpCCxo4pMG4TlBKo/jda3yon1VbC92fBSx/r2HeJuIkWuFCGR90rrxLhC0
         Hu+9RCN3QahZiSdRwv0R4ZUnk4nzpXmp2kzrT+DyJFq3hO5vZlebADclUCNwH99vRuYt
         dnHbYVjUNhqVhf4iWvIQtEXdSfrc9UFj2xYiyQlz4OQ+eA/PlVj/DzuzmZhTP6AuJv7/
         VpIkAsYRS0i4Em9kvpixFRb9HPj6V/Jt0Kb74IDpuFQoOKl+Ygf+M9MDZXgNJ4BlxyZb
         pTblqomJpNw/x2NxAHhsWkS7862DR+yf8McuSbrP1YuG2MJUZvG9/Sq5yBdHDI/UeemY
         xcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695194882; x=1695799682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwW/aKgkBI8jvoRbmdXukbiIBoNPv5CCX3I1vI78hY0=;
        b=A51NRUsJYdx0Z8tHEoCttDxhQ8XV0ZrhyEyBe44/MQ0z4/Q9o4aHu8U24xMHcTMVsL
         LN1aKhb+7KzKCHEd7/pmSohQS7xSk9sbAQ0mEN0eX8eDAltd1nhl94JUKkEX6fIb5OG3
         L0foOKxs+igrGm9fQQOo9a40q08u2Gm7HY1xSrANO4UiCfJSQPxOLTbJDe8561XawsEa
         H0ngJzObzXo+Z62alWX74Pa6xFzVtriDIVFDbM11GdqNs7YTQnNxjjgNRKpdDQpNhYUl
         +OPAI8jHrvhAMQjXSJTCA6iFxdl29wVZOoTbKSNs9pqce+ChR0SmSFdiDpYrTf/+Ld8r
         buxg==
X-Gm-Message-State: AOJu0YzmktIc2L2LCZ+kTEY/BvdAR8szytD7lVneE1zdMqd3qKuBnXVN
        t80gQm2vUmzzVm8xkU22oIDT9jMRY7OZLZUTlpUd+A==
X-Google-Smtp-Source: AGHT+IFcGwxsD14iTBsfb5A6WM9HKpgER1VektslYkA2MPFERnEZVoaEsnHQM17447rTKPxBIUUzlSQbAxSsLf5oFEA=
X-Received: by 2002:a81:9e10:0:b0:579:effb:ae1c with SMTP id
 m16-20020a819e10000000b00579effbae1cmr1828509ywj.26.1695194881940; Wed, 20
 Sep 2023 00:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
 <20230817145940.9887-2-dmitry.baryshkov@linaro.org> <4eaekxgmikdacvvprysb6btdqootbc6paomzhuqjtzd6rgqxkc@birohtqp4rbo>
In-Reply-To: <4eaekxgmikdacvvprysb6btdqootbc6paomzhuqjtzd6rgqxkc@birohtqp4rbo>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 20 Sep 2023 10:27:50 +0300
Message-ID: <CAA8EJpozPp2-oqr2mWAuA_8mTSc8whnOAg+zYZSWNmQBg_eLxw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sm8250: Add DisplayPort device node
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 20 Sept 2023 at 05:08, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Thu, Aug 17, 2023 at 05:59:37PM +0300, Dmitry Baryshkov wrote:
> > Declare the displayport controller present on the Qualcomm SM8250 SoC.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 89 ++++++++++++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index eb00bbd3e1f3..8d705a1713fb 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -3638,6 +3638,8 @@ port@1 {
> >
> >                               port@2 {
> >                                       reg = <2>;
> > +
> > +                                     usb_1_qmpphy_dp_in: endpoint {};
> >                               };
> >                       };
> >               };
> > @@ -4405,6 +4407,14 @@ dpu_intf2_out: endpoint {
> >                                                       remote-endpoint = <&mdss_dsi1_in>;
> >                                               };
> >                                       };
> > +
> > +                                     port@2 {
> > +                                             reg = <2>;
> > +
> > +                                             dpu_intf0_out: endpoint {
> > +                                                     remote-endpoint = <&mdss_dp_in>;
> > +                                             };
> > +                                     };
> >                               };
> >
> >                               mdp_opp_table: opp-table {
> > @@ -4432,6 +4442,85 @@ opp-460000000 {
> >                               };
> >                       };
> >
> > +                     mdss_dp: displayport-controller@ae90000 {
>
> displayport-controller does not seem to be a valid child node of the
> sm8250 mdss. Please make sure that the binding is updated, if not
> already done.

True. I added the compatibility string to dp-controller.yaml, but
missed the mdss schema. I'll send a fix ASAP.

>
> Thanks,
> Bjorn



-- 
With best wishes
Dmitry
