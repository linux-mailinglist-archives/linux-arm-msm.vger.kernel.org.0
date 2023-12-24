Return-Path: <linux-arm-msm+bounces-5922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EC781D812
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Dec 2023 07:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2EDA1C20CEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Dec 2023 06:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03266ECD;
	Sun, 24 Dec 2023 06:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pkGaoGBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875CE10F8
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 Dec 2023 06:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5e7409797a1so26551807b3.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Dec 2023 22:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703398984; x=1704003784; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uzEslKtk67JLuRJ0T5eEkiarqj7aZaFBzQA/v07nMCM=;
        b=pkGaoGBe44Q5wj1y7zcpbleIRvmozER953HTTCzH7Y4rwmrC0S5yL/ZG23f3ZsFDV3
         BeJJKviJM3fj9kQQ2aWcDHYjwiHsJWKb7y612X48Ja9K0r7sBL/4GO1eAlO3PJBhERQh
         3ZbJkRzEcGY26Sfgcvzl59Uyz1QA+WypHi+cIlkiVlG1XwFjRW9RnK3vVf7MtjhGlAsB
         yeNLx2brMsQDrVI/tTtIJ6Tzz6fE4RpEfLiQ7C4jd+MHPtVEJsOx/ESc+MC4vrPa/vy+
         UDejwWaNqAks7rI1Q2evv03Kwcpp6XPSM5zB+LBujyJkM1Qfy1S11vhy5v+w2HmvSAtp
         Nl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703398984; x=1704003784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzEslKtk67JLuRJ0T5eEkiarqj7aZaFBzQA/v07nMCM=;
        b=HgaYIFKNMLfnBf2ykxyVS6FmXNm+kd4kUQ9Jt79JjHZH8X9AWi6Fq504fX5L37qafU
         gFBsoRkOHoKm0yz65XgFZnc+tSqWjHNnpNfi2vYFf6L7/zmskq3VAea3eZ5RF+skKCcO
         sjUNeygcXmi4WdGqiQ117M8VOhFxnZwsRvdSWzsyjDm1AfUhaLhUe5ehs3ZI4ZjDbDtr
         lVqVra3UG5My8Ftv45+yyvbCPUHigA0xdEDwRq2SHEgVHtujQA+9JDO2lzezzLvKVO+9
         0oLCR/3rDtASIBHyoMGwG4g7IeGbk6mXqCAWAI5JYL1meoTxxVaLvki/V6gDdXC5qI8h
         Q1zw==
X-Gm-Message-State: AOJu0YzMRyY0mUKM7G0CKhrJ7leZjyQCMD0RVEFBPfUnnA085xASp3lB
	xiukGaZS/gk651ggAIZRDnqcKZ+a0JYEZfbgBFcGvBeZH/qiPQ==
X-Google-Smtp-Source: AGHT+IF0zC4Gb4jWv5/ciMlayuYg3GXPYLIF2K58bCCtZziIJhml00lCFYMRxCeEtzCaiTnFzUK8fcVQ2q+0FM+NAKA=
X-Received: by 2002:a81:a152:0:b0:5e6:8fd8:2742 with SMTP id
 y79-20020a81a152000000b005e68fd82742mr2130461ywg.82.1703398984475; Sat, 23
 Dec 2023 22:23:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231223-x1e80100-phy-pcie-v2-0-223c0556908a@linaro.org>
 <20231223-x1e80100-phy-pcie-v2-2-223c0556908a@linaro.org> <CAA8EJpo774xzmpb2+72sJ80kmcCqJK-gDfkaLERGgmPeSZV3PQ@mail.gmail.com>
In-Reply-To: <CAA8EJpo774xzmpb2+72sJ80kmcCqJK-gDfkaLERGgmPeSZV3PQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Dec 2023 08:22:52 +0200
Message-ID: <CAA8EJprYvF08D_82QZ+nEhBVq74B2uS0UKic0Qj3kwHdHqm0XA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-pcie: Add QMP v6 registers layout
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 24 Dec 2023 at 08:16, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 23 Dec 2023 at 13:55, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > For consistency, add the QMP v6 registers layout even though
> > they are the same as v5. Also switch all QMP v6 PHYs to use this
> > new layout.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
>
> On Thu, 21 Dec 2023 at 05:51, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >
> > The SA8295P and SA8540P uses an external regulator (max20411), and
> > gfx.lvl is not provided by rpmh. Drop the power-domains property of the
> > gpucc node to reflect this.
> >
> > Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8540p.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)

To resolve possible questions, the lines above got c&p-ed from another
email. The R-B tag is applicable to the patch in question (v6 regs
layout).

>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry

On Sun, 24 Dec 2023 at 08:16, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 23 Dec 2023 at 13:55, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > For consistency, add the QMP v6 registers layout even though
> > they are the same as v5. Also switch all QMP v6 PHYs to use this
> > new layout.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
>
> On Thu, 21 Dec 2023 at 05:51, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >
> > The SA8295P and SA8540P uses an external regulator (max20411), and
> > gfx.lvl is not provided by rpmh. Drop the power-domains property of the
> > gpucc node to reflect this.
> >
> > Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8540p.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry

