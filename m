Return-Path: <linux-arm-msm+bounces-3950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E14BA80A354
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 13:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B97D281258
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0981C691;
	Fri,  8 Dec 2023 12:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vV79CjBb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BA521985
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 04:35:41 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5d95a3562faso19513187b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 04:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702038941; x=1702643741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GF4BPHYAiYD5N4yRheSGUKFfKbUOf7tXCDFHJS8cLkA=;
        b=vV79CjBbp1D/VLLWbWXkJImlkRuybeeP8zcWhCY3NuPHKNhr0wQj9gb6qjgSYFpOv8
         i5XKWinNd8iUTwW8/8QGL6pXj0qMcYtAx/JLMsvbk1ySMaEJOpsVuS+eSv/5FCptutPq
         CJeIb+Z0adGO6yHkjctDla/l3qHwPr0rOZBWFXXhkts6AO8E2lNDdkaA0q8BrJzX5qHk
         3sF2HGEUFtOHlHcrzq6zPLVIEKhXQszaW9i3l2kFyUfCP9NKGoMtM2m7vGWta2wrwo5d
         lOaP9F3acV9Rc78xb3vAMD7q/zzxJbDV0X2tvWvXVUCzyo4LMrz82G0CaHTpAT2ZLfHM
         qEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702038941; x=1702643741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GF4BPHYAiYD5N4yRheSGUKFfKbUOf7tXCDFHJS8cLkA=;
        b=ZPxka2HUzeKNpWWLnLQQR3b5RJhQLMQ3EHvDtu7RbNoPN4kz0+0M0SJOMtqHyS6SbO
         e02qaT/uVn5n0v+qdMJBjKPXwy4NCAm7mSdUwX6LIg9yM8g9iXWVB1e1lGtQdV5AhbJg
         NNrGIEci7rg+9nWxLC8Vf72FRLNXaf53Ux1t0XhWoHdtlFZrtlMjfo63qJyfgL3YfQk/
         ragUd3woanprOthE7XKUJLlLe6a1PSeikdFKOynfUC1bm5nnD5xB90j9vITu/PJQmrhg
         Faz4X2X6yZQF9sNQjeP4OKwl1D4peTkqcso7AELJvozECGaWvEU7ukcsuS9bW94JMVyl
         QO0Q==
X-Gm-Message-State: AOJu0Yzs5mDazhIoOSVKXxZ9pGA6ACY1FYfJv4EMD/X2Dug4JCH8jONT
	Xc03jSKc09/2AA7TOUcOpVVuT2DfpUPjSH9lZnVhXQ==
X-Google-Smtp-Source: AGHT+IHjiAfVpGoEX5W6+Qp5O0zy6x7IcQev0y6h80bzgke0FujuZlCuGUYIR8OIaRDTiVrsTrVnDcbA7RwRrpbFc7Q=
X-Received: by 2002:a05:690c:368a:b0:5d8:67b8:6d13 with SMTP id
 fu10-20020a05690c368a00b005d867b86d13mr4004640ywb.76.1702038940776; Fri, 08
 Dec 2023 04:35:40 -0800 (PST)
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
 <d9d27fa4-6ede-4958-b717-db425be61068@linaro.org> <CAA8EJpq7dB+45fiq2WmkMmSO7KszY0Et_t1gZ9ZvfsSxftpm8g@mail.gmail.com>
 <d885928d-035b-4abd-890b-c9626b925d76@linaro.org>
In-Reply-To: <d885928d-035b-4abd-890b-c9626b925d76@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 14:35:29 +0200
Message-ID: <CAA8EJpr+C23evpRWMHatF6ChNvr3G-sAuXOi4e-7Tix23JV=Fg@mail.gmail.com>
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

On Fri, 8 Dec 2023 at 14:21, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/12/2023 13:17, Dmitry Baryshkov wrote:
> >>>>>> Anyway, I was thinking this should be rather argument to phy-cells.
> >>>>> I'm not sure I'm for this, because the results would be:
> >>>>>
> >>>>> --- device.dts ---
> >>>>> &dp_controller0 {
> >>>>>      phys = <&dp_phy0 PHY_EDP>;
> >>>>> };
> >>>>>
> >>>>> &dp_controller1 {
> >>>>>      phys = <&dp_phy1 PHY_DP>;
> >>>>> };
> >>>>> ------------------
> >>>>>
> >>>>> as opposed to:
> >>>>>
> >>>>> --- device.dts ---
> >>>>> &dp_phy0 {
> >>>>>      phy-type <PHY_EDP>;
> >>>>> };
> >>>>>
> >>>>> &dp_phy1 {
> >>>>>      phy-type = <PHY_DP>;
> >>>>> };
> >>>>> ------------------
> >>>>
> >>>> Which is exactly what I proposed/wanted to see.
> >>>>
> >>>>>
> >>>>> i.e., we would be saying "this board is connected to this phy
> >>>>> instead" vs "this phy is of this type on this board".
> >>>>>
> >>>>> While none of them really fit the "same hw, different config"
> >>>>> situation, I'd vote for the latter one being closer to the
> >>>>> truth
> >>>>
> >>>> Then maybe I miss the bigger picture, but commit msg clearly says:
> >>>> "multiple PHYs that can work in both eDP or DP mode"
> >>>>
> >>>> If this is not the case, describe the hardware correctly in the commit
> >>>> msg, so people will not ask stupid questions...
> >>>
> >>> There are multiple PHYs (each of them at its own address space). Each
> >>> of the PHYs in question can be used either for the DisplayPort output
> >>> (directly or through the USB-C) or to drive the eDP panel.
> >>>
> >>> Same applies to the displayport-controller. It can either drive the DP
> >>> or eDP output, hardware-wise it is the same.
> >>
> >> Therefore what I proposed was correct - the block which uses the phy
> >> configures its mode. Because this part:
> >>   "this phy is of this type on this board".
> >> is not true. The phy is both types.
> >
> > But hopefully you don't mean using #phy-cells here. There are no
> > sub-PHYs or anything like that.
>
> I am exactly talking about phy-cells. Look at first example from Abel's
> code.

I always had an impression that #foo-cells means that there are
different units within the major handler. I.e. #clock-cells mean that
there are several different clocks, #reset-cells mean that there are
several resets, etc.
Ok, maybe this is not a perfect description. We need cells to identify
a particular instance within the major block. Maybe that sounds more
correct.

For the USB+DP PHY we use #phy-cells to select between USB3 and DP
PHYs. But for these PHYs we do not have sub-devices, sub-blocks, etc.
There is a single PHY which works in either of the modes.

Last, but not least, using #phy-cells in this way would create
asymmetry with all the other PHYs (and especially other QMP PHYs)
present on these platforms.

If you feel that phy-type is not an appropriate solution, I'd vote for
not having the type in DT at all, letting the DP controller determine
the proper mode on its own.

-- 
With best wishes
Dmitry

