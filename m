Return-Path: <linux-arm-msm+bounces-3921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C3380A1C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68B781F2144F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0189B1804A;
	Fri,  8 Dec 2023 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O6pwzduE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FE4122
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 03:04:30 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5cd81e76164so18452427b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 03:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702033469; x=1702638269; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tmWSiLFpH5ilop9PgBwEvCl5zyYcl/sRlYRMt6cwB08=;
        b=O6pwzduEgfLIEYMWLFQAi2lxdt0lTx/zb4zr52eBLiWuoFV8V7WptdD3WuIgGxovL9
         wZz9hJJaBbMyJhAFNhr0QBV0T6X1Cc0YHHhqP5fO2zCVkB4Lr3BT8WRAqhr+uiUj4pI2
         LOGvvicm1RnWfcWW+0UEAtikHmBFdhM6GPbxjeRU9x1DZ6oovsQ3zRl2xWYeCk5G1YeF
         hVz3QpurKLy1fUVXizgdpJ4qUs+3aJ/55waeN8GESHBAMejfah1nPPOl/d2CKdD97/kI
         vjgeenHJ0GECd2EcR44Nn0cDL4yZeL6lwx1f9uzxjYu7Dn1L1cvet9gjuJKQOsVxDjh4
         P0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702033469; x=1702638269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmWSiLFpH5ilop9PgBwEvCl5zyYcl/sRlYRMt6cwB08=;
        b=tSqC6S/IPr1wAESBL2Z+BOawIGZE8In3z8NAWRDWgpDuDEplBBXbXRTsLMBfeSQckJ
         rUpHJ6ZrxHVrz9/c/7lW79gTtC6vWmmrHabQNbzFqWiWXsPZ7KJuEEqaEpcLUTZbQOWu
         vP8/zdckw4L1PSQN0vZ/y18FVDRAUI9uOa5Rro5udoNJC11Y+8C9+5He+Izui5e9Bu2r
         IO9OGjnDzl1pDOJVDZaxURZaa7eSeLOqppaln5MrzHh0cKnu2LcC1cFKO6b6s9ba+Xqk
         /RH3kEKFeSiIifiukXA60k1bQQqtCmSSNSGC9UeEKn5fmLMiiJEE3OMDH2Nnk+XJaxpj
         dezQ==
X-Gm-Message-State: AOJu0Yzmin37CW4FWJZHcmqBZkkJtVGzfQMWLhiKuF3ZrrJ0gnlqJHap
	YmvLDoy/pDAjTAPWnobF/8cU5h6fHwJrntyxqWVGZQ==
X-Google-Smtp-Source: AGHT+IGCB8quVSHKY0fmnpid8nxEPOPtVtmvqpR1rpFARtS3Ovn3+gVCYD81mAQa7wkJ4TWtjHLTA0qrGC8SKmGeTt4=
X-Received: by 2002:a81:4312:0:b0:5da:2235:493 with SMTP id
 q18-20020a814312000000b005da22350493mr3478692ywa.10.1702033469187; Fri, 08
 Dec 2023 03:04:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-edp-x1e80100-v3-0-576fc4e9559d@linaro.org>
 <20231122-phy-qualcomm-edp-x1e80100-v3-2-576fc4e9559d@linaro.org>
 <b6d3928c-75ba-47a3-93fc-a60729be2e35@linaro.org> <545d3ace-66e5-4470-b3a4-cbdac5ae473d@linaro.org>
 <ab7223a2-9f3f-4c9c-ab97-31512e7a0123@linaro.org>
In-Reply-To: <ab7223a2-9f3f-4c9c-ab97-31512e7a0123@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:04:18 +0200
Message-ID: <CAA8EJpoboN85bLiayXJgn5iwh+Gn0OtK0aZ26ZJu9H3xkTT2Tw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: qcom-edp: Add X1E80100 PHY compatibles
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Johan Hovold <johan@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 09:47, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/12/2023 20:16, Konrad Dybcio wrote:
> >
> >
> > On 12/7/23 17:51, Krzysztof Kozlowski wrote:
> >
> > [...]
> >
> >>> +allOf:
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - qcom,x1e80100-dp-phy
> >>> +    then:
> >>> +      properties:
> >>> +        phy-type:
> >>> +          description: DP (default) or eDP type
> >>
> >> Properties must be defined in top-level "properties:" block. In
> >> allOf:if:then you only disallow them for other variants.
> >>
> >>> +          enum: [ 6, 13 ]
> >>> +          default: 6
> >>
> >> Anyway, I was thinking this should be rather argument to phy-cells.
> > I'm not sure I'm for this, because the results would be:
> >
> > --- device.dts ---
> > &dp_controller0 {
> >      phys = <&dp_phy0 PHY_EDP>;
> > };
> >
> > &dp_controller1 {
> >      phys = <&dp_phy1 PHY_DP>;
> > };
> > ------------------
> >
> > as opposed to:
> >
> > --- device.dts ---
> > &dp_phy0 {
> >      phy-type <PHY_EDP>;
> > };
> >
> > &dp_phy1 {
> >      phy-type = <PHY_DP>;
> > };
> > ------------------
>
> Which is exactly what I proposed/wanted to see.
>
> >
> > i.e., we would be saying "this board is connected to this phy
> > instead" vs "this phy is of this type on this board".
> >
> > While none of them really fit the "same hw, different config"
> > situation, I'd vote for the latter one being closer to the
> > truth
>
> Then maybe I miss the bigger picture, but commit msg clearly says:
> "multiple PHYs that can work in both eDP or DP mode"
>
> If this is not the case, describe the hardware correctly in the commit
> msg, so people will not ask stupid questions...

There are multiple PHYs (each of them at its own address space). Each
of the PHYs in question can be used either for the DisplayPort output
(directly or through the USB-C) or to drive the eDP panel.

Same applies to the displayport-controller. It can either drive the DP
or eDP output, hardware-wise it is the same.

-- 
With best wishes
Dmitry

