Return-Path: <linux-arm-msm+bounces-5364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E7A8185BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 11:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419BC1C22904
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 10:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F317114F78;
	Tue, 19 Dec 2023 10:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PtQqGyxn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884E14AA5
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 10:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dbcfd61bd0fso3010428276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 02:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702983256; x=1703588056; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=anBAHVOVvM4j+dShGvK/3C4/G3dScYLizOG8GPTA2U8=;
        b=PtQqGyxnb59oE1Y8l3nRja5tO6nIt8+d17p9dNfBbDzO+U8yuCvbnxVq6lBdi7rB2T
         hiUY7wFISQfsz6j7rcCTZCB+jBA54nHdlkTWiGtLUz/Ci5CxlAk746xMdf6k8tNAvvIc
         eKD+JHHOf6RJW1o0WC01wceZDmW/e6/t11tsuSkkYVwd6b3BseRX7/vr7pIIa+FvJn0L
         KNCjNhwqY4dQwpo/kehzamd0dwzXUKpjufXJFpvLbU5UPQ2j2AfF5BYM7RXgoPH0T8NS
         ivH69Ykqvp6Yf4VHNO5yh5jYCQmyfIPxEQ98JfrUv7TW+UsopMo03CBmQcSCD5KXWMnF
         CNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702983257; x=1703588057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anBAHVOVvM4j+dShGvK/3C4/G3dScYLizOG8GPTA2U8=;
        b=XTHPJ501++CclHHsdF5VeAsjycGDudUTsUYtOzn5keGn7MgU5c/4WeK3G6oMfJnQb6
         e/sgWBSpzCjheZ5NOLx/TQ37CXR8fTM8GVt6mzaz9uNn1bYpddYPl5XltYklLrMVq2/0
         H+l7WYRruJuQo1h34nDHjYTWAg+Fli/hjSv9PEwxqcHhXOij4/8JxZJGoSK4NPoEhQN+
         q858Ntl02LZHNVXPM1n9tQGME8tkWluOAS8zakJWFxWdBK5LaOJLYr6OBMc71PCWRqs9
         r9823QT5BKSDOUBDvBNpc21b9sMJkeegozc05JTDQuCINfv60L8rt86elqe8UL6aGXBC
         DSZA==
X-Gm-Message-State: AOJu0YyIRfyQXRRyvh1lVoCi/0xulqm19nh2A0vjOAKQ6NGklTxqtQmy
	ksmxhhLaAfi0DESZGcLN5BKO94/d7vqkFEMgVnrqarrbMmhoGCdX7L8KawzW
X-Google-Smtp-Source: AGHT+IGhEzGlCWq1rL4qGXwqd4YgBr4sH7tRvCT6SHVQRBa1xR5Wj9Q5ZKq/NSBF7Ket2OSBTP2miMI1NRXQhn1lFrM=
X-Received: by 2002:a25:4294:0:b0:dbc:fbba:2e6c with SMTP id
 p142-20020a254294000000b00dbcfbba2e6cmr487272yba.45.1702983256719; Tue, 19
 Dec 2023 02:54:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219005007.11644-1-quic_tengfan@quicinc.com>
 <20231219005007.11644-5-quic_tengfan@quicinc.com> <ec730ce7-2021-4cad-97e6-0a86c6063533@linaro.org>
 <cd5a0140-295a-4f48-a378-3c2b8be0f499@quicinc.com> <f0f707c0-dd96-4409-bfc5-118d885933e8@linaro.org>
 <d955f3bb-c73e-4777-b268-a8abc70788ef@quicinc.com>
In-Reply-To: <d955f3bb-c73e-4777-b268-a8abc70788ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Dec 2023 12:54:05 +0200
Message-ID: <CAA8EJpqjJe49xmRyb40_ypdZCn0njBLuF7vsah5Gm1b=9trn5A@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
To: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Tengfei Fan <quic_tengfan@quicinc.com>, 
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 12:20, Aiqun Yu (Maria) <quic_aiquny@quicinc.com> wrote:
>
>
>
> On 12/19/2023 6:01 PM, Krzysztof Kozlowski wrote:
> > On 19/12/2023 10:57, Aiqun Yu (Maria) wrote:
> >>
> >>
> >> On 12/19/2023 3:02 PM, Krzysztof Kozlowski wrote:
> >>> On 19/12/2023 01:50, Tengfei Fan wrote:
> >>>> QCS8550 is derived from SM8550, it is mainly used in IoT scenarios.
> >>>
> >>> What are the differences? You need to describe the hardware, you have
> >>> entire commit msg for something useful which will avoid such comments
> >>> from reviewers.
> >>>
> >>>>
> >>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> >>>> ---
> >>>>    arch/arm64/boot/dts/qcom/qcs8550.dtsi | 6 ++++++
> >>>>    1 file changed, 6 insertions(+)
> >>>>    create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
> >>>> new file mode 100644
> >>>> index 000000000000..254657f46c5e
> >>>> --- /dev/null
> >>>> +++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
> >>>> @@ -0,0 +1,6 @@
> >>>> +// SPDX-License-Identifier: BSD-3-Clause
> >>>> +/*
> >>>> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> >>>> + */
> >>>> +
> >>>> +#include "sm8550.dtsi"
> >>>
> >>> This is a weird file. I thought qcs8550 has differences from sm8550,
> >>> e.g. lack of modem, so why do you claim you have here MPSS?
> >> MPSS here in qcs8550 is a GPS only MPSS.
> >
> > Is it different or the same? Is the interface the same? So many
> > questions and so little information. You have entire commit msg to
> > explain this.
> we can add all current email information into the commit message in next
> patchset.
> >
> >>
> >> QCS8550 will have a different firmware release with sm8550, and it will
> >> have different memory reserved for the firmware to be used.
> >> While firmware release along with memory map was not settled down yet.
> >> That's why currently qcs8550.dtsi is an "empty file" and only include
> >> sm8550.dtsi. As long as the firmware release is settled down, we will
> >> have more detailed different node here.
> >
> > So the DTS is not really usable now?
> curent qcs8550.dtsi is an "empty file" which is identical to "sm8550.dtsi".
> While qcs8550-aim300-itot.dts is currently used with a "temporary
> reserved memory" for those engineer qcs8550 firmware for boot up and
> limited function verify.

You know, this doesn't work this way. Once the board dts file lands
into the kernel, it _must_ be supported for quite a while. So if you
land your 'temporary' memory map, you will be forced to stick to it
forever.

If you want to share the interim state, you _MUST_ state that in the
cover letter and you _MUST_ mark your patches in a sufficient way so
that they can not be merged by accident.

> So the idea here is to postpone only the firmware related reserved
> memory part. And open an "empty file" qcs8550.dtsi for common which can
> be used for other board like qcs8550-rb5-gen2.

Unfortunately, this means NAK for this patch and for the whole series.
Please finish the memory map first. You can not change that after the
patches have been landed in the kernel.

And BTW, as we have landed the qcm6490-rb3gen2, could you please drop
the second dash for the sake of uniformity?

> >>
> >> By the way, RB5 gen2 will also relies on the current qcs8550.dtsi, since
> >> it is using the same qcs8550 soc, and will use the same firmware release.
> >>
> >> We have patch version2 remove the qcs8550.dtsi, and have SOM dtsi
> >> qcs8550-aim300.dtsi include the sm8550.dtsi. While after discussion, our
> >> understanding is that we can have an qcs8550.dtsi like this. Feel free
> >> to let us know if it is not right understanding.
> >>
> >>>
> >>> It's really confusing now.
> >>
> >> We can have a syncup to clear the confusing point if needed. :)
> >>>
> >
> > The code and commit msg are confusing. I need to keep asking you to get
> > any information.


-- 
With best wishes
Dmitry

