Return-Path: <linux-arm-msm+bounces-3945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 857A080A2FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 13:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1598EB20B5C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A681C287;
	Fri,  8 Dec 2023 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R2QGvqbJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D4A1985
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 04:17:43 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-db979bbae81so2069108276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 04:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702037862; x=1702642662; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DaQSgVgjNOrxYGF+6uUUzWR0hTH/PyjaW2hJgF8XM1Y=;
        b=R2QGvqbJ1jJSIcQw1HwxWijEwRt4+J4vTNT+X6LS5cB8iJhhbLGifI7JPmRrlHqNbT
         CW2HB4Euz4N7lhwPIj7GH1v5eRPSdtIHpj6Xz228uZL3oPYj2ynWzhPpltVR4BdPpG6s
         4TdVnIaaUq5KoE9jSUumKBSquel9YYpQdCTbxsCKYxjEmId8GWBcmgvP84Acj1xLzHDZ
         Xd3JWnNsUHS6+TMtfJaMLdNBugijLKnYX6Xw2frKpXFZb8URGfHC8Il5/+UOtXAqnAdf
         KLiFQEqI4w+7SuGsNLVrm0BKd37aQ3UilB1LQ3BTNjxGmixtSH8q78CyfH8jnN2wmf2E
         H8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702037862; x=1702642662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaQSgVgjNOrxYGF+6uUUzWR0hTH/PyjaW2hJgF8XM1Y=;
        b=hVvzFymxXe56+BLNuJfFZvNKzsNwhk1yEFXUXo36rugGn4wHwutL6d94cSLMcVIj5a
         ctV9LYjNePvWzRdaJkjN2H4Y1jAqnDg/KYU5JWx4sVb98OnFFGtA7JuUHHwdNz7+rWxu
         JUsGnOieGm7hUOcxMUBRb6T7BwRHuopXi1L/wbGtgDFSawlfvZmyYhLTZp2J+5t5FZwc
         vZQ5JXZk7xUw6FfADXbmqPN4rvn8o2A+fPHnhXEa9UzCx6lIOe8+8ecf3+O/yMy2/EZ3
         nYucBfKlDa9+qdBNNMij3X7spZ39uC9PR55yVu8H2J0sGTaKHa2fzKC/0s+OgOlzFp1T
         P6kQ==
X-Gm-Message-State: AOJu0Yz60QE7pEDsGWbX1ZLL26jw6TF7P0s1G/csm8xg5tWLm7r1AZaP
	aCX/N0ayZM65F3vNGXqS9cRC0JzeUXBihXdeTdUz4g==
X-Google-Smtp-Source: AGHT+IFVLi0PmrbEXzEz9l5oahwRWzv3grTcYR+5T6Ej5uSDfjl+Pasu1aypm54EERJEJMZsKxQ4QGqbaXU2cg1NKsI=
X-Received: by 2002:a81:af02:0:b0:5d7:1940:8dd1 with SMTP id
 n2-20020a81af02000000b005d719408dd1mr3016048ywh.56.1702037862435; Fri, 08 Dec
 2023 04:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-edp-x1e80100-v3-0-576fc4e9559d@linaro.org>
 <20231122-phy-qualcomm-edp-x1e80100-v3-2-576fc4e9559d@linaro.org>
 <b6d3928c-75ba-47a3-93fc-a60729be2e35@linaro.org> <545d3ace-66e5-4470-b3a4-cbdac5ae473d@linaro.org>
 <ab7223a2-9f3f-4c9c-ab97-31512e7a0123@linaro.org> <CAA8EJpoboN85bLiayXJgn5iwh+Gn0OtK0aZ26ZJu9H3xkTT2Tw@mail.gmail.com>
 <d9d27fa4-6ede-4958-b717-db425be61068@linaro.org>
In-Reply-To: <d9d27fa4-6ede-4958-b717-db425be61068@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 14:17:31 +0200
Message-ID: <CAA8EJpq7dB+45fiq2WmkMmSO7KszY0Et_t1gZ9ZvfsSxftpm8g@mail.gmail.com>
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

On Fri, 8 Dec 2023 at 13:45, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/12/2023 12:04, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 09:47, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 07/12/2023 20:16, Konrad Dybcio wrote:
> >>>
> >>>
> >>> On 12/7/23 17:51, Krzysztof Kozlowski wrote:
> >>>
> >>> [...]
> >>>
> >>>>> +allOf:
> >>>>> +  - if:
> >>>>> +      properties:
> >>>>> +        compatible:
> >>>>> +          contains:
> >>>>> +            enum:
> >>>>> +              - qcom,x1e80100-dp-phy
> >>>>> +    then:
> >>>>> +      properties:
> >>>>> +        phy-type:
> >>>>> +          description: DP (default) or eDP type
> >>>>
> >>>> Properties must be defined in top-level "properties:" block. In
> >>>> allOf:if:then you only disallow them for other variants.
> >>>>
> >>>>> +          enum: [ 6, 13 ]
> >>>>> +          default: 6
> >>>>
> >>>> Anyway, I was thinking this should be rather argument to phy-cells.
> >>> I'm not sure I'm for this, because the results would be:
> >>>
> >>> --- device.dts ---
> >>> &dp_controller0 {
> >>>      phys = <&dp_phy0 PHY_EDP>;
> >>> };
> >>>
> >>> &dp_controller1 {
> >>>      phys = <&dp_phy1 PHY_DP>;
> >>> };
> >>> ------------------
> >>>
> >>> as opposed to:
> >>>
> >>> --- device.dts ---
> >>> &dp_phy0 {
> >>>      phy-type <PHY_EDP>;
> >>> };
> >>>
> >>> &dp_phy1 {
> >>>      phy-type = <PHY_DP>;
> >>> };
> >>> ------------------
> >>
> >> Which is exactly what I proposed/wanted to see.
> >>
> >>>
> >>> i.e., we would be saying "this board is connected to this phy
> >>> instead" vs "this phy is of this type on this board".
> >>>
> >>> While none of them really fit the "same hw, different config"
> >>> situation, I'd vote for the latter one being closer to the
> >>> truth
> >>
> >> Then maybe I miss the bigger picture, but commit msg clearly says:
> >> "multiple PHYs that can work in both eDP or DP mode"
> >>
> >> If this is not the case, describe the hardware correctly in the commit
> >> msg, so people will not ask stupid questions...
> >
> > There are multiple PHYs (each of them at its own address space). Each
> > of the PHYs in question can be used either for the DisplayPort output
> > (directly or through the USB-C) or to drive the eDP panel.
> >
> > Same applies to the displayport-controller. It can either drive the DP
> > or eDP output, hardware-wise it is the same.
>
> Therefore what I proposed was correct - the block which uses the phy
> configures its mode. Because this part:
>   "this phy is of this type on this board".
> is not true. The phy is both types.

But hopefully you don't mean using #phy-cells here. There are no
sub-PHYs or anything like that.

-- 
With best wishes
Dmitry

