Return-Path: <linux-arm-msm+bounces-36306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9F29B4A6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 14:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AC6D1F23A45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 13:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E555206067;
	Tue, 29 Oct 2024 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7KpE/W2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FF6206055
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730206834; cv=none; b=bB9EJVA3IxBJkM8UCFHng0rq0ofkdu0sN+yczwHo1sXQHG8f5N4pJy/vaRRVn6/TxkDB25vPjLI1J5qbYJ18cbuV/+nv8NTaexm40QMKKZrg3maqWohbAszfy6ufJwI6jODTIX+/dgZpRyBxTxE+ue5faMLfUWIMQSvP99QoFUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730206834; c=relaxed/simple;
	bh=YmsNP2KTqCdcVBZwhpdMQVUtMGwCTgWv9lgMj09bDmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CwCFa8dNemtBPDq4TBg1uyL+Zaruq+5nVGLbfMURELJaXbN/PPDzf2ES+QsumROODgGkcrUU4KCD1nwz7eBu+jkiM90zbr8lKLR1i4QGx8mAHcnC1uZSqU9VMvBS0nAGg0pMGpxvtBIaCg698NvMZ+RjnOPCNjKjKRMYnNkZy2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y7KpE/W2; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e5ef7527deso59277887b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 06:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730206831; x=1730811631; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9olNTqPKz+laBr1M4W4FfYgdBmMaq3StAwgPxtx+j7k=;
        b=y7KpE/W2J/V0XD9GX9GmgPy8CUx/KHXFf2sQ4k06bZ7l9/NriFqUGUvXgYTxJ9Lihx
         jYIGdVoAKMPJAftYqxPdjYB0LJ3DF+yTcGUsgF0A1u+vPivG1RjnSCtNT8rOMyS1h8Uc
         Xn/ihMR7nMS5XwK4csTc6fX0xOneZWjbvBplDpujZwR3nj+UmSlkzWRuIkJWpahjieJb
         XLrVsqRIteaYU2j6XEcMcwQeArsWRwD19hSJ9Ktl5KAmPaKql+B9zE63Ci6caPiLU3eM
         ig/DNRU8OqdNDgZXfbdgM2yKE9bZxfWZXun2bXubkUZgtHvMvkNB1uNiF4qz4Qanohde
         +UXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730206831; x=1730811631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9olNTqPKz+laBr1M4W4FfYgdBmMaq3StAwgPxtx+j7k=;
        b=ruG0/QvqGu9dRPiNX37zp3K8sPOCvMW+BO6Irme2Y4/2C4ViZpUVXsKGODE/OAYmNq
         7alqf+9/jy17tP8KElef3/A9QsyJEkT6SJmgf3veysF2WaFICdT3U4UsxI7d8G1cqk5+
         g7NmJcGzaQfkrqjJO0wWZvQxow+kz1qPzrNhk56WO3y1kpvZAoOasclgoMNhbys9txtI
         5DxASJvYqZ9wC2aGdAAPmzbac//g07pd7/kcldEerh8q444cBQ6t9g0glf2YphFCuJiu
         SmaOA8nVqzJ2rXEf2Oh7iMeNpfWL/ExIIm1XhjmSDSqMWlEWBZOJ5dKW1guCcQGxF/Yy
         crDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6tsxps47XBeWuDJcSeeFEPU1/sEJUSWnRLQvU4oyiHsFCs8+/YeOL2ktERB6q1Jv/1VJvicOfGUbn0/bk@vger.kernel.org
X-Gm-Message-State: AOJu0YwcMuEeOmNLSfQf/7IyPJisUB1dsZfRudrqA1FpysULYdGi2XeN
	GLcENcW/3flMR0hiwKB7CgbkbfqK/rhU1F5CXg35gewUnX+OXmyX9SbmKOX1TBHsSH1UYLJy2Oz
	yMErsJfS8w/XvG5rvhsBE3VSI4hQpAe9uR8XHwg==
X-Google-Smtp-Source: AGHT+IFbKndRQHp+7RzFAeO0rylRtbyrpK9kh0Zw4o5eR2NycLUcgLYSm3N60gfqGUIcaqo/gsLqHGbK1ZMtf/8ZCd0=
X-Received: by 2002:a05:690c:385:b0:64b:5cc7:bcbc with SMTP id
 00721157ae682-6e9d8aa8014mr135400007b3.32.1730206826513; Tue, 29 Oct 2024
 06:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008112516.17702-1-quic_mukhopad@quicinc.com>
 <20241008112516.17702-3-quic_mukhopad@quicinc.com> <zluuezrywecffsh3f7yzrtvd2sa3nyzl52sk6bluvjch5icvuu@noecozosseko>
 <e7543055-316e-447e-ab0e-15d2fdd19dca@quicinc.com> <CAA8EJpqcnxbZAUJm0fdbQNjZ3Dw189oDMkC+0pMLz1XGO7HhnQ@mail.gmail.com>
 <fad3508a-bb02-4162-8803-fba5de25e752@quicinc.com>
In-Reply-To: <fad3508a-bb02-4162-8803-fba5de25e752@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Oct 2024 15:00:11 +0200
Message-ID: <CAA8EJprTc=kviF=MYQFqnE4g0Xk+jmT96=ihm3D75Me1Yw-WQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display Port
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_riteshk@quicinc.com, quic_vproddut@quicinc.com, 
	quic_abhinavk@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Oct 2024 at 08:08, Soutrik Mukhopadhyay
<quic_mukhopad@quicinc.com> wrote:
>
>
> On 10/28/2024 3:15 PM, Dmitry Baryshkov wrote:
> > On Mon, 28 Oct 2024 at 10:49, Soutrik Mukhopadhyay
> > <quic_mukhopad@quicinc.com> wrote:
> >>
> >> On 10/8/2024 5:46 PM, Dmitry Baryshkov wrote:
> >>> On Tue, Oct 08, 2024 at 04:55:16PM GMT, Soutrik Mukhopadhyay wrote:
> >>>> Enable DPTX0 and DPTX1 along with their corresponding PHYs for
> >>>> sa8775p-ride platform.
> >>> What is connected to those DP lanes? If they are routed directly to the
> >>> DisplayPort connectors, please add corresponding devices (see
> >>> dp-connector).
> >>
> >> We are defining the functionality of gpio101 and gpio102 as "edp0_hot"
> >> and "edp1_hot"
> >>
> >> respectively. This ensures that the hot plug will be directly routed via
> >> the display interrupt
> >>
> >> line "mdss0" to the display port driver and no external dependencies on
> >> dp-connector is
> >>
> >> necessary.
> > Please describe the hardware, not the driver necessities.
> > If the board has a DP connector, please add the node. E.g. it allows
> > one to specify the label and the type used by the connector.
> >
> > Also could you please fix your email client so that you don't have
> > strange/unnecessary line wraps and empty lines?
>
> Addition of DP connector node with the hpd-gpio property does not allow
> hpd to be detected since the gpio
>
> 101/102 have the "edp0_hot" as function. If the hpd-gpio property is
> removed from the DP connector node,
>
> the probe of DP connector will fail.

No, it wont. It uses devm_gpiod_get_optional(). And if it does fail,
it is a bug which needs to be fixed.

And please, fix your email client so that it doesn't insert stray empty lines.

-- 
With best wishes
Dmitry

