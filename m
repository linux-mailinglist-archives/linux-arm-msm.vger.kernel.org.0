Return-Path: <linux-arm-msm+bounces-4187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD080C51B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 10:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 351061C2097D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 09:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542D9219F1;
	Mon, 11 Dec 2023 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="njyTUaf3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64AFD8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:46:25 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5b383b4184fso36322757b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702287985; x=1702892785; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ztyXivNuoKy+BneSWBkP9rSJnlB8B4ezbvE54Oo1NlU=;
        b=njyTUaf3QvDiCSwjCwaAIG7S5UCt1cjiAFoNlC1tWka/9mYvZNgh3bA8o0CBMy1jQS
         7vjB8AoHltjMlSA7gJrZGMaXwbqhORSwZl0M9auBSCHiSIkwZUMysUQpdFBoDatRvRBl
         7JGrjiVP9v2SMionehLDTPRuHm7hAA6NufW3ecRHLBYEKPAc1xBLe+1Pg+FXIwLfMiYA
         kPojistpa+LUKX8OYIdcqX+JN950aOghtJgIda4IYnsHhYkBngn/ELejey1M08c0dFNl
         HrAyjv/79XNSS6ftd+ZUxB1QEMvU8USWCGZMIyC8vwkZqY3CjtnLcqoBXWRYx0P/A+/h
         IKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287985; x=1702892785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztyXivNuoKy+BneSWBkP9rSJnlB8B4ezbvE54Oo1NlU=;
        b=gnmKrlIKqB6CotHu+E2VumnyNYybndlxg6Wbso/+7i6NXhZmXUtxA81ubqGEH7J9hA
         JYsmLJPD/nYdqbUCd6g6VBbhoiSLcWI0g59dBQrhraiNNWYTc1zpYaJkaauGhvGg52JJ
         CasM1ttTz7ujkvBHSnCiDAZIhBU/yEeem1r2nAS0e2L4kUg1G1RpXMPhXNqgfSYlY4bW
         ReKXFOgvsyTh33VFeQgCaT534zaGSdGWHUIITbq6vloD6VukxitIzaOYtIAZoLWOKyRX
         RRSH1PJGq+nJvi4nyy+FmnCqv4QJIdcSQuJu0/K+gyZqekByqW8LCtBiQ1bOsxzDyfIJ
         JdLg==
X-Gm-Message-State: AOJu0YwRMHqGqUnsu6I6j041ojjKbx61cX3Oy54C0zKDnqUjsQ78++01
	N4QfH+8eRRnl/p4BxJq76Jzn07LCyRCN+2sQwsuK2cNwjaYqALq7Z65a+g==
X-Google-Smtp-Source: AGHT+IHURBFzCJzZFsNF1co2h/izQ0cL38z/U3Y37n9DKZ7fTanIIaYzh9eONAyPtqR8UEIN3d2Z/6hvKEoyRrb3Guw=
X-Received: by 2002:a5b:20d:0:b0:da0:350f:fd6a with SMTP id
 z13-20020a5b020d000000b00da0350ffd6amr1668920ybl.46.1702287984965; Mon, 11
 Dec 2023 01:46:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
 <20231209232132.3580045-8-dmitry.baryshkov@linaro.org> <5025892d-0cbc-462a-b7d8-95828680dd8b@linaro.org>
In-Reply-To: <5025892d-0cbc-462a-b7d8-95828680dd8b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 11:46:14 +0200
Message-ID: <CAA8EJprp+Rf5BKEnaoCooWVKGfg6SRg-uc=NRywc10qy=Yj2Xw@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sm8150: add USB-C ports to the
 USB+DP QMP PHY
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 11:33, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 10.12.2023 00:21, Dmitry Baryshkov wrote:
> > Expand Combo USB+DP QMP PHY device node with the OF ports required to
> > support USB-C / DisplayPort switching.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index ea7c92c0e405..38423a9f8408 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -3447,6 +3447,29 @@ usb_1_qmpphy: phy@88e8000 {
> >                       #phy-cells = <1>;
> >
> >                       status = "disabled";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +                                     usb_1_qmpphy_out: endpoint {};
> style 1
> > +                             };
> > +
> > +                             port@1 {
> > +                                     reg = <1>;
> > +
> > +                                     usb_1_qmpphy_usb_ss_in: endpoint {
> > +                                     };
> style 2
> > +                             };
> > +
> > +                             port@2 {
> > +                                     reg = <2>;
> > +
> > +                                     usb_1_qmpphy_dp_in: endpoint {};
> style 3
>
> :(

Which one should I stick to?


-- 
With best wishes
Dmitry

