Return-Path: <linux-arm-msm+bounces-3951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7233780A362
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 13:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27F25281860
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375CF1C68C;
	Fri,  8 Dec 2023 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XOfpj0vx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932761989
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 04:36:48 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5c8c26cf056so18305597b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 04:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702039008; x=1702643808; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kl14rNbix2kUzr/44N3YRDcJydiYUcssbsUy/Lxl2Z8=;
        b=XOfpj0vxlepbk0G6TFcUUXcXEywmHU2GDIJnhha/hYzdL2OueK2wQbOBCdBOiR2h9H
         DI6XJFGO133UJHu7mHxGqBMSntnC2Thto84DmkEHkuqLvYA8fUcFJQGS70TIH343u2q0
         tDJOeRYU9IDZPY6ob7fgpTjdIqpqyIc9Envf4uE0DEjhpZ/DsKch/VTSD7awleJgpSOt
         OG5TCyfQsez4hObwE1/3yBO9yUyRGBW2hld7jGnkttq6fSxV+rA9RR5tY0Kfguz6ulOZ
         KZ6hnM1tkx3FeAKugSneE2eScgnTnNEJDsoBrl0FUoXUt0V9ZO/lqoL0/fPIwskxm3SI
         aYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702039008; x=1702643808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kl14rNbix2kUzr/44N3YRDcJydiYUcssbsUy/Lxl2Z8=;
        b=stfiU3CHs8/ASvYyKOvwj9rRm1zYHdnRo1OL4O4fdxg5Fq4XRR0Xdz//HsXDnb1DGy
         HtIE+uy5PYRLxTCpUE/TOTMqkgn5pSTrSVyLbo4A85UzQAOUyrG0hStHbvda/rJ+g6jE
         6SeXbhK4hxokO8QajL+AIiGDCbgjCIjnYhKfPZRrlxZmEaeBjH7Fg/YCkxjSmCrmDYft
         9P1/6kO6jAVHdscujF/X00LB58dUPPpv5x8vSB05VzTpJYKClSFnUCPVzCa93BKBTApY
         BeW0cP0XkuZPwPf3Mz54nd+wcxcdwVZ0X1NlehZbCcP0y//CNdtlLxgGYITp6Tkzhy34
         MrTg==
X-Gm-Message-State: AOJu0YwKgRy91NJ+D/C5AgfRBu99rEzeR5/xxzDl2kTg1B4FfUxE7+cf
	OZgQc48oGnBJjDdEABZ6mdBapcL2qS9AYNSEu3RXig==
X-Google-Smtp-Source: AGHT+IHy1Q9+E3f10R2PU3el+hjqwtKsVqfZDIhUgZWe8w1MbNoJfMJQ2xQDqxpqyqTpj4DJAI8bmmBSs7ObsVLSxWY=
X-Received: by 2002:a05:690c:fc3:b0:5d3:9f2d:658c with SMTP id
 dg3-20020a05690c0fc300b005d39f2d658cmr4498370ywb.24.1702039007771; Fri, 08
 Dec 2023 04:36:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208105155.36097-1-krzysztof.kozlowski@linaro.org>
 <20231208105155.36097-3-krzysztof.kozlowski@linaro.org> <CAA8EJpqKM45=6R0fHjDjNWfZpR-QxRoJo-ioB-t-WT188jpqnA@mail.gmail.com>
 <cbf0b9a6-2752-4ab5-ab21-af28e87fc1e6@linaro.org>
In-Reply-To: <cbf0b9a6-2752-4ab5-ab21-af28e87fc1e6@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 14:36:36 +0200
Message-ID: <CAA8EJppBTVw5ZoVGCxx9LYu-1dtEPqiE-H6SMk+6BCDd4O_DSA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: PCI: qcom: correct clocks for SM8150
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 14:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/12/2023 12:09, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 12:52, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> PCI node in Qualcomm SM8150 should have exactly 8 clocks, including the
> >> ref clock.
> >>
> >> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Please take the patch via PCI tree.
> >>
> >> Changes in v3:
> >> 1. New patch: Split from sc8180x change.
> >> 2. Add refclk as explained here:
> >>    https://lore.kernel.org/all/20231121065440.GB3315@thinkpad/
> >> ---
> >>  .../devicetree/bindings/pci/qcom,pcie.yaml    | 26 +++++++++++++++++++
> >>  1 file changed, 26 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> >> index 5214bf7a9045..a93ab3b54066 100644
> >> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> >> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> >> @@ -559,6 +559,32 @@ allOf:
> >>            contains:
> >>              enum:
> >>                - qcom,pcie-sm8150
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          minItems: 8
> >> +          maxItems: 8
> >> +        clock-names:
> >> +          items:
> >> +            - const: pipe # PIPE clock
> >> +            - const: aux # Auxiliary clock
> >> +            - const: cfg # Configuration clock
> >> +            - const: bus_master # Master AXI clock
> >> +            - const: bus_slave # Slave AXI clock
> >> +            - const: slave_q2a # Slave Q2A clock
> >> +            - const: tbu # PCIe TBU clock
> >> +            - const: ref # REFERENCE clock
> >
> > Can we change the order of the tbu and ref clocks and fold this into
> > the sc810x case?
>
> I prefer not, because this is an ABI-concern and we are supposed to keep
> things stable.

Ack, fair enough.

-- 
With best wishes
Dmitry

