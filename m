Return-Path: <linux-arm-msm+bounces-7432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8A982FF5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 04:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE7D81C23832
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 03:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF4E63A1;
	Wed, 17 Jan 2024 03:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bv6p26MZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DD85660
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 03:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705462880; cv=none; b=rFq9yEIe6OLrHe0dmFDsUIXAQoKcF/gHcWCtiaboeng5Qb/1OZbSxYil+aDmnZ2CBmFVaMWnaNqExBhHWVaoSqwGnk8UZoUJcCvww8ftgi2Ii/C+UNKUY+MbWu3rxb2NtIzezdEmOZfq2AOHYDkivKDgi/wjFVVTtc+vu0PXvno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705462880; c=relaxed/simple;
	bh=EEId0MKcmgt9JlwyzpnkONCbMwG4GyRqNccGKHgGcYM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=UA2cMdd8qFeNUlbqH5KEvWnfyerXLSgZEuOCVVXQEPyZ47G3qSb1o6hQeRZlE1Gg5a+LZLHWeStkc34/D24weNxAyNWUFN36bmWuSYkeHuAi9wCQlUDbNxsB/XfZuiEQ1Mfkd/i3eoLQLNXBlaXsAPshyns9cOccarL6oBBD2GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bv6p26MZ; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5ff5be20308so8633137b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 19:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705462877; x=1706067677; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=phBopZIe8FQ8TfC3rGLxMMXiYtQqVnQSRAWiIxrbEjM=;
        b=bv6p26MZqLAl/5R/0Y29Rbkgsh48keAAVS4W1Jl0aKWGdzVjyz32pArIO8m16HnQSH
         wHR7QoJABLDXClabDfiLlhlLHmF9DWUFvENXRWCDI9F1ps9Yw3JBzfJUf0NkRWCctva9
         AnfS9IZeO9YNrPa7+W5BmeOgCnhqp4jVGCg+pEAqJyuD00gsgqCaDpIJBcDfiS7GZ3E0
         trN941vl9v8tovIeBHdp3SpIB78Mitp8fYtXVUuxQfJPCUll6InBNXaBPZPz3Uzyn4ye
         JrTh353fHBVyDR7Z7xszUmkBjLLfp4YkODdQ8bca9Hgomkg6QGshh9gh7Zw37bK8yDNX
         uMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705462877; x=1706067677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phBopZIe8FQ8TfC3rGLxMMXiYtQqVnQSRAWiIxrbEjM=;
        b=bKmpF19cduDDH12IACOnQVjevhezYMKQkejRZlSZUNpMJASkMIhXgTiRSqK+5M1GLh
         e5846pR2iRmwWgqtKS4OeTxQXjpDbtlxuCM6ddzLlAoYh/jBc6PQBUo/dOm5WzKCYI6E
         GCR9HxX/KGyWILX6GzyZEuWH+yYNNT+I+z4zzIhH73EVOdvw2JWH4g4VyR0bw1Q8I+cV
         epOOUdZbyi7aEUtqngsQqLQH7nKEYpH/5ait41yOcX3z8wMJDaposDsNOSKpUoMxcEOU
         PJHbYj4cWSQgzlGXExFtvqwWrtXpCSyfkNEMk/b/RJN5KTCozAJKT9d8+v5BD52/Z26A
         DMYg==
X-Gm-Message-State: AOJu0YwbcTfcloFTdhO7Te9o8vgbzq7De5ynPMSrV3I6NGV73zkhAbKK
	7s3ykI9MKUA1gFT0WInZ4ewBVJmUkjkc2RqlDo4B4pYjAysB6LqCXeTdQ96Rpxk=
X-Google-Smtp-Source: AGHT+IGUsoweo6ywE9NuRgmV77Nud0CaiDRCB1/0Ro9u4X0ineqNsXB/m24vmlTNJu02pfPVblJGx7rtTuervD4DCco=
X-Received: by 2002:a81:af66:0:b0:5fc:17ab:2f0a with SMTP id
 x38-20020a81af66000000b005fc17ab2f0amr91991ywj.13.1705462877532; Tue, 16 Jan
 2024 19:41:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240115-lpg-v5-1-3c56f77f9cec@quicinc.com> <CAA8EJpoemnXTmshWrArVOCm0GRSkWZ5tH557nbAjRL1Tgg-Dig@mail.gmail.com>
 <e16f5ff1-9b12-4f90-89d5-f95cbfb859e7@quicinc.com> <6c29ce72-e303-406a-bb75-5b36b0cd8ee4@linaro.org>
 <44ab50c4-c63b-436c-af46-9b4543181446@quicinc.com>
In-Reply-To: <44ab50c4-c63b-436c-af46-9b4543181446@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 05:41:06 +0200
Message-ID: <CAA8EJpq8exe6n3OQnreLCsV+BnZKcu24d==rEKup=+n28nnDHw@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: qcm6490-idp: Add definition for
 three LEDs
To: hui liu <quic_huliu@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_fenglinw@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jan 2024 at 05:02, hui liu <quic_huliu@quicinc.com> wrote:
>
>
>
> On 1/15/2024 6:26 PM, Krzysztof Kozlowski wrote:
> > On 15/01/2024 11:18, hui liu wrote:
> >>
> >>
> >> On 1/15/2024 5:56 PM, Dmitry Baryshkov wrote:
> >>> On Mon, 15 Jan 2024 at 11:48, Hui Liu via B4 Relay
> >>> <devnull+quic_huliu.quicinc.com@kernel.org> wrote:
> >>>>
> >>>> From: Hui Liu <quic_huliu@quicinc.com>
> >>>>
> >>>> Add definition for three LEDs to make sure they can
> >>>> be enabled base on QCOM LPG LED driver.
> >>>
> >>> The "function" property is still placed incorrectly. Posting the next
> >>> iteration before concluding the discussion on the previous one is not
> >>> the best idea.
> >> Do you mean I should update it as below? Seems there is no consumer to
> >> use the function config, do we need to add now?
> >
> > Paste the output of dtbs_check for your board (or CHECK_DTBS=y for your
> > Makefile target).
> I checked the dt-binding file of LPG LED, I will update the dts as
> below, if you think it's correct, I will push v6.

Is there any reason why you are defining three different LEDs instead
of multi-led with three components?

>
> +&pm8350c_pwm {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       status = "okay";
> +
> +       led@1 {
> +               reg = <1>;
> +               color = <LED_COLOR_ID_RED>;
> +               function = LED_FUNCTION_STATUS;
> +       };
> +
> +       led@2 {
> +               reg = <2>;
> +               color = <LED_COLOR_ID_GREEN>;
> +               function = LED_FUNCTION_STATUS;
> +       };
> +
> +       led@3 {
> +               reg = <3>;
> +               color = <LED_COLOR_ID_BLUE>;
> +               function = LED_FUNCTION_STATUS;
> +       };
> +};



-- 
With best wishes
Dmitry

