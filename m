Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E69344E7D93
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Mar 2022 01:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbiCYUBL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 16:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbiCYUAy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 16:00:54 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E1817F3F5
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 12:51:07 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id e4so9301024oif.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 12:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=eUek1jmX1h1x8PcNcflTTCV7rdiqXP/FImxouF9eXrk=;
        b=MuYU2U53+0XditHV3+xMmufekP83Q86clHPRUFiYJI5c83MMgqsqZU6OE0iD7uqI1D
         bq5BpO0h+DDnBW2dzr+T0KLiCp0GgYfvXmXPzjeUTmIwglTcDMjx2JTa8I15roXjfJQr
         QDYKF7wfPMDa6WIjm4l4EenX4il5h6oLp4L78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=eUek1jmX1h1x8PcNcflTTCV7rdiqXP/FImxouF9eXrk=;
        b=XOrLiAjxxIp2twLnrh7QdyFpWfWYjtZhNyKc8UyS01yng4q2cZmMQ8uPXjTcnFerVu
         kDflzdvjx3d0TxSaHGnUkCrv/UsTHwuaboop8ClIeTqTPc8YummZ+RrAbJWEqnzdtDju
         20xJjnEeuzgAm6lBig99KO2Pa6ScuG0y4WsblFmtOf7VL8kZNfZj2x7KMe89NN1/1DV2
         /wFcKXFjs5q+00k892088YzwbwdTlxI3QAd+jpOOeeQ2183uF6ExW/6Y7lRuNow54xWx
         3ZLh2N6paIP9fmmoF621uYPks8mIr1fs3VCjI08hJS+I/1FiydfvcBoCxgcXtwO5+flO
         2wOg==
X-Gm-Message-State: AOAM531XP/gh/C26yCkFIyI6k9EnAfopXfYHzslp0inke6HueybZU/2/
        PCn0M2D6K/Ynd4HG94OWxDEEkEg6FsxeF2cK/jGBNQ==
X-Google-Smtp-Source: ABdhPJxjJgDkwaOL+igFbYKoHRlPcGxtCqcdt2HqSpDefQv8NNUO1BG5eOIgAhxWNNRmCDuEqZtRbL5DhxFUglZ6hXs=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr5910648oie.193.1648237866373; Fri, 25
 Mar 2022 12:51:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 14:51:05 -0500
MIME-Version: 1.0
In-Reply-To: <MW4PR02MB718635E7712D44094E6E91F3E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n52Uzo47N5QzoKOwny3XTrArA4nM-KPqAVxAPewSAyNOWw@mail.gmail.com> <MW4PR02MB718635E7712D44094E6E91F3E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 25 Mar 2022 14:51:05 -0500
Message-ID: <CAE-0n500xV_SA_-KQ4Sh-8PV=rfaXxrMBAh5tnVpjCMD+VEyqg@mail.gmail.com>
Subject: RE: [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     "robdclark@gmail.com" <robdclark@gmail.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "dianders@chromium.org" <dianders@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "sean@poorly.run" <sean@poorly.run>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "sam@ravnborg.org" <sam@ravnborg.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (QUIC) (2022-03-25 06:30:58)
>
>
> > > +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> > > +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> > > +
> > > +       aux-bus {
> >
> > Can this move to sc7280.dtsi and get a phandle?
> >
>
> Okay, I will move this to sc7280.dtsi like below.
> Shall I define the required properties under &mdss_edp_panel node in the sc7280-crd3.dts?

The below patch looks good.

>
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3283,6 +3283,18 @@
>
>                                 status = "disabled";
