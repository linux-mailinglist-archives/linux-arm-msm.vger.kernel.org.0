Return-Path: <linux-arm-msm+bounces-21450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB158D7DD9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 10:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2330D1F24C45
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 08:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0BE6EB56;
	Mon,  3 Jun 2024 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RvLIL4y4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71203D551
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717404605; cv=none; b=VI5kb7376xXDRm7iuvKyShhGOkN9JJzPlu852GeLI6CNXM/3a0fGJrrR0o35+nLwtbvC9scXNLa04WTRZ/X7Z0BDLXoQdGHQ899ZaTnZMg7tU3KuwNebeo8JRZNRXTPm6D8lQP2ChWrHj/asv0Ket9YVRmlfOfg6vg7evwURfCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717404605; c=relaxed/simple;
	bh=dfoQFsA6SLL4wcUbcBXpinLax5A25U36hCg32xNjGxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnMdaGjlSwRRA1SWvJYEDX0X/VAX2Fzef158WbPnQHK3RaJeMUSeUPb3voNutj6tpvboaCTYNVhegFbbVHGLbJW7rilJqDmTExQitnyblN4b/kPnJDfOsa43yMq2AkKXLzkUQ+jLun1zLS4tzMW+QUpxWZv5yv3MHa1y3thzh88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RvLIL4y4; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-62a08099115so38358507b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717404603; x=1718009403; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TH62Yup3G9u8vLN8Ga3Ij8RqgPg+rX8ETtG6ob+WsZQ=;
        b=RvLIL4y4zBQ5prmsgP2CaA6A+uwEUtXRNc58oP1U+YicLPhc2aI5/s3KiTGSQwF7KK
         K5O/j5W6WDHKqyIQ9/84Rtgw8u0kCA8Z+ZQLgby5vkyme2OgNsFTK/99CTfYet79LxyL
         oJGv/fWzI2m1KmH8RQsneW0ppPQpAhr4Ov6D9BDE2b10cqty/2AhAq2sujraBY2tdxIs
         L3ycutcpTMv8BcLgdy5Y8NP01OcylZ6eJfRIktv7Th1+Ny5gCZ4yf6AJerVisOt9bIQN
         2H4wdgM1xlXB3wG6n+4A4XNu+VQ8stqT/ZfcqTIf8hqb4OCMmQVvU8L2EdMV36TDzcg/
         tQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717404603; x=1718009403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TH62Yup3G9u8vLN8Ga3Ij8RqgPg+rX8ETtG6ob+WsZQ=;
        b=eA6EkTap1+2c5mw2vmnrbzdkLCkO4VTEAK7ouTGOKyTlx4U6FDhxEOS+MSDjLEMqG/
         L03pE9tj/q0rfxMV0X0y/V7//rSVy1mXEbwhCl8U5Upap00UGZCv/q+SXQszf176A5BA
         PWBxs1F3u+WSl5Wjz7YGY7YSXgL5kHZ6qM0gcqBmQan9GrFOKN1cmMmvpt/GOD+vQVj0
         mowPOYyimv9rgC3mf1ru4WdLYpFbvb+5p6wd/1zLuR1umWP6Y2ee+qk+vI4GTOpSKucq
         UShxRZroWy5IVwWKYLkouxD7Ci+9VsFjBrgSK91PT7s28vE4kBqJq/jiz64fUshCLPVz
         AL4w==
X-Forwarded-Encrypted: i=1; AJvYcCWIVGHFDq+WhhGuX44Rd3Fsg4kmVpIOJSkBvmZH3edqMxaZPwVbcfMH15Ou8nVdjMbKab1eoUn/5BsEam7a+nbRB/JFwb/VV+1rD+Tdbw==
X-Gm-Message-State: AOJu0Yzriix+nlWfATrcGwko9BdAS+PJhvJLQKhTdlLe8ucUH87vWuEA
	otc9ht0BM1GrolHfNNxHWUW/jRcazJBTqnjRV/2RhsmCCTYVbKAA/LEz/EjiIB9+sBPRW55K4+w
	RaYsEd2EOMSeoTB6G8ziZmHo3xEIrFNj9+CLu/A==
X-Google-Smtp-Source: AGHT+IF8k6LvzxBQXvPeOtqCn1OCAasXTKSxbvnfog6OJ7lM/2LaGW7ZCPHxo6bcXahe6A5T83BMVLsZ3/yavZ95yUg=
X-Received: by 2002:a25:ab45:0:b0:de8:a770:4812 with SMTP id
 3f1490d57ef6-dfa73db2ab8mr7409755276.40.1717404602753; Mon, 03 Jun 2024
 01:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
 <20240527-x1e80100-dts-pmic-glink-v1-2-7ea5c8eb4d2b@linaro.org> <Zl2DUXWUN0088-Af@hovoldconsulting.com>
In-Reply-To: <Zl2DUXWUN0088-Af@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 3 Jun 2024 11:49:51 +0300
Message-ID: <CAA8EJpp2hK1P86vrZOwXfNBz3nBXugCcERE9yBRCaCE3aDbqOA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: x1e80100-crd: Add pmic-glink node
 with all 3 connectors
To: Johan Hovold <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Jun 2024 at 11:48, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, May 27, 2024 at 11:07:28AM +0300, Abel Vesa wrote:
> > Add the pmic-glink node and describe all 3 USB Type-C connectors. Do this
> > for USB only, for now. The DP port will come at a later stage since it
> > uses a retimer.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 143 ++++++++++++++++++++++++++++++
> >  1 file changed, 143 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > index c5c2895b37c7..2fcc994cbb89 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > @@ -49,6 +49,101 @@ chosen {
> >               stdout-path = "serial0:115200n8";
> >       };
> >
> > +     pmic-glink {
> > +             compatible = "qcom,x1e80100-pmic-glink",
> > +                          "qcom,sm8550-pmic-glink",
> > +                          "qcom,pmic-glink";
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +             orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> > +                                 <&tlmm 123 GPIO_ACTIVE_HIGH>,
> > +                                 <&tlmm 125 GPIO_ACTIVE_HIGH>;
>
> With this series applied, I'm getting the following error on boot of the
> CRD:
>
>         ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init failed, stop trying
>
> Known issue? Do you need to enable some quirk in the UCSI driver?

Not that I know. The message is caused by the UCSI not responding to
the PPM_RESET command. A trace from pmic-glink would be helpful.

-- 
With best wishes
Dmitry

