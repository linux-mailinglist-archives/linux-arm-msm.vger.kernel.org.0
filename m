Return-Path: <linux-arm-msm+bounces-72999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4120B51A92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 16:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC9E0582509
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 14:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1C8329F20;
	Wed, 10 Sep 2025 14:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="W9I9dslU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623ED32A83E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757515386; cv=none; b=dAVrp3L3bjy5CUQzw8iDibI3cb1bBLXCfrFG0OCNgg7g996lua+k+7LM1O1I4ISgGQKGPpdhZwVM+x1MqGymOUD0khlP+Ok/3AlGv/Dc0AMbAjxOXKHZ4VIFmgysd7BC1m5QicF/PG7zfoL5bJ9aKEmR39BaX+B5DlfGQ7GQjWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757515386; c=relaxed/simple;
	bh=N/wKflTYmUXg8HGSLU8QR0Phvp1v3e5wOBQSK2/SdsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFihasjJueWv+OcR9AvJ1GY6NNn/cKPq9sHDDc1sUx724naKnPkZ9KIjn5GsvOB9FgbaUnhfhyTpXP9qwRF9tbx0/CSuI5A/5LIRswha865nOiS42g83zkRufggCAYeruePQmcsW+ygGYlwwb+QvrCyDN4w9RQUL4bnimoSjrtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=W9I9dslU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f7039a9fdso6971249e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 07:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757515382; x=1758120182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkhFCZ5ofWJHJ2EhMv0fguBBuTeG4Pes0q1AF4EcfFA=;
        b=W9I9dslUEhE3BND5cfXcf2bNcL4/rCz7WLDlhW+n9sFA6JGBh87OqomtvMoUqGtFTg
         ubzNGCcC2aymD7bAYd0SWlbahLdtbCyCVZox8r16Fr72k6xtRyLwBi7GEpFjZ1ZOeLrU
         iSacvW2KM9340LWGAOGYB/zl+mDq2tBTwUQ+y6PnVrvUoDuUVud/+JxQGirrpV113Nfd
         C9z0o06DC7YeQ5CfnuUjo+V/l2SeLKEnqJnN+RI7Bh4Yxl/8ADILf5bFeJ4+4C+t37u2
         sisVmjs5eilsldP3ExVtTkBAUtVFdsswM78rsxPCpS8KAiV+f+wXBmoFLDVEcBJiP07q
         sgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757515382; x=1758120182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkhFCZ5ofWJHJ2EhMv0fguBBuTeG4Pes0q1AF4EcfFA=;
        b=fGm88vsmaInRlhoBPGD0SBL8PLSVc5ajPLgg7UKctYwDvqUs5+6WHeRg5I95IPZkaA
         Hg02JbRm3uxALT1jN39GOqeoi9l+cg8bR1zKPHNoNhklMhbr7LXaIEtZgOD8cJrI1NA1
         9vhmvmLo6pRn2v81zwf4VyEHkq+k5G7xgE3Aqoojx+pHY074uOWLyyncK+SOLmZeDMDP
         N4mje8rEuiuURM98aLBSo4/smUFG0WD/zO9/M7Wjsrp415ygUCoyDemB/TED44acohfX
         b0wNsl1yLpjQjKVkGkpyI8HeuIQ0k7EdrdbFp5LT25LhdaPY0dsGjqw/Ne6x1PgjE1p8
         ALQg==
X-Forwarded-Encrypted: i=1; AJvYcCUzEGfyKoKomkInpobSahxHqZ8OOaO6OTRC3FtJE+4rPwCbQ0N8zfDta671jwM+pjVB1ePjjN9sbWAthl6C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx86XOoZUqYuYQKF2sMPvXPyPGMoeVqgyfwzAzMqi2cxxLEfhE4
	nvPJsqbQ9AaJlUij93c5obF5s/f0P3rOBt3urqE1e7VC7z8BzzW1AwwAJg+JLmlBeUa4MSRwPhu
	Tsw/7arBlYbF+jJ21/nm6tEx1qgrJhtN0ffauLy/SUA==
X-Gm-Gg: ASbGncsdtiwadHoh07CScudFuGB8sRqG8tNoBoksmxABTEZmRxFCpaGupWZ2yQM6zS3
	Kah289xWp2t7Wq4R7tf9hoGKLQS61GzUzYD5nAaptayzP8Z8oOIvmWKE4Okhte3rf0+21ycjVbE
	t05F/GFEaGfp6HP6cLd96I6jA4yzUFsGRkqea0otAyJxvrBHTIaOeNpz1vc6TuhtBi278ybpk4E
	hcaGJSA0yMcczw/31CVLdUND5NsmyWZ8DdhZaw=
X-Google-Smtp-Source: AGHT+IFwwWMP72rjU0xLemNq3S4L4evCHuBoOQsJ51CqzV+zQGmHuO0tvNuPBH/4DumR325PTGGiK6U/D6n2L75MFaY=
X-Received: by 2002:a05:6512:e82:b0:55f:4429:15a6 with SMTP id
 2adb3069b0e04-5626310e5efmr4881766e87.48.1757515382294; Wed, 10 Sep 2025
 07:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org> <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com> <20250910143618.GA4072335-robh@kernel.org>
In-Reply-To: <20250910143618.GA4072335-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 16:42:50 +0200
X-Gm-Features: Ac12FXw3DEUYlNQHBVzd7vCIYANNaG3yJ5y0y_Zklwl-sYjU6Q6eUcIMkXz0GhY
Message-ID: <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: Rob Herring <robh@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Eric Dumazet <edumazet@google.com>, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Vinod Koul <vkoul@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 4:36=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Sep 10, 2025 at 03:43:38PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Sep 10, 2025 at 3:38=E2=80=AFPM Rob Herring (Arm) <robh@kernel.=
org> wrote:
> > >
> > >
> > > On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Describe the firmware-managed variant of the QCom DesignWare MAC. A=
s the
> > > > properties here differ a lot from the HLOS-managed variant, lets pu=
t it
> > > > in a separate file.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > > >  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++=
++++++++++++
> > > >  .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
> > > >  MAINTAINERS                                        |   1 +
> > > >  3 files changed, 105 insertions(+), 1 deletion(-)
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-=
gmac): power-domains: [[4294967295]] is too short
> > >         from schema $id: http://devicetree.org/schemas/net/renesas,rz=
n1-gmac.yaml#
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-=
gmac): Unevaluated properties are not allowed ('clock-names', 'clocks', 'in=
terrupt-names', 'interrupts', 'phy-mode', 'power-domains', 'reg', 'rx-fifo-=
depth', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fi=
fo-depth' were unexpected)
> > >         from schema $id: http://devicetree.org/schemas/net/renesas,rz=
n1-gmac.yaml#
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-=
gmac): power-domains: [[4294967295]] is too short
> > >         from schema $id: http://devicetree.org/schemas/net/snps,dwmac=
.yaml#
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac)=
: power-domains: [[4294967295, 4]] is too short
> > >         from schema $id: http://devicetree.org/schemas/net/mediatek-d=
wmac.yaml#
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac)=
: Unevaluated properties are not allowed ('mac-address', 'phy-mode', 'reg',=
 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were=
 unexpected)
> > >         from schema $id: http://devicetree.org/schemas/net/mediatek-d=
wmac.yaml#
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac)=
: power-domains: [[4294967295, 4]] is too short
> > >         from schema $id: http://devicetree.org/schemas/net/snps,dwmac=
.yaml#
> > >
> >
> > These seem to be a false-positives triggered by modifying the
> > high-level snps.dwmac.yaml file?
>
> No. You just made 3 power-domains required for everyone.
>

With a maxItems: 3?

What is the correct approach then?

Bartosz

> You have to test without DT_SCHEMA_FILES set so that every example is
> tested with every possible schema.
>
> Rob

