Return-Path: <linux-arm-msm+bounces-9765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CA1849366
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 06:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE701B2137C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 05:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A452B667;
	Mon,  5 Feb 2024 05:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNfj54lb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23E0B654
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 05:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707111403; cv=none; b=jrF1X80Uiyybh7UT+d36jBcUSIXvW3Glkdi9d/LOoQWl/NkvbbgEjRhINIKr5hro0IVQp2ibZr9k00kei9FWTpkP/vxZ8hqK9V6+XKeSZ8Q9KaDA9rPXYFhq1cVdd2VNe+RQ9xE2fZngztN02csA1oXjSDh0yxGR16m1pZBoaIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707111403; c=relaxed/simple;
	bh=WlCWI3klOe5pkvThz1EPuEI+ZHZLCMAdYXncpKLqSck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nwg+ejM1fX0qkM8NoKgGZRNOpFI1+5flSX66dqk3PyIvnxoVcBsI689pi3hEIV4SHk1WZ2rsuMCTpuKLzPl52YdTf3XXEx9u0p8sZPzYl3PErRsIeXKkDSwnrLWKpSZmZWFOwR4cBmN0B+8Wh7tODVPLY6ZB4C8XtgHn//IHZeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZNfj54lb; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6045a02fb87so5041737b3.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Feb 2024 21:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707111400; x=1707716200; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ku77vJzYqMBmibC6mrHtASTXJT8ZC24sq+LSAb6JyZ8=;
        b=ZNfj54lbrDFDDS4P4XT9MrLqn4Xp7pccoZ6VFd0HmjGlejcY26wy8uS/PAAl83mdsG
         nVabVPV1Mziu+gjAbXvMumnoHbLI+Q0B6/e4JrKroWsfKLDUO6oDLQANaCO157xBVDRF
         orxaRzZn7B7Bl/RzI6sD7UVhyE4VE8+Kjebei4lK/2DjHcYzvPzeKYtL7Hi0qJtUOV3N
         5Qzcn7ntNBIAw2Koq/0Z6F+aa+1paug22WXzOde5bj21IwL2zaJq92fQ/3sXQfJQGQlJ
         AR6yb+dh0Hs5ibFk4/YK5DBoDe2WXJpfT7xYEorA/Htfwg0lB3FMXlhPs06LZ46CvCaa
         lkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707111400; x=1707716200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ku77vJzYqMBmibC6mrHtASTXJT8ZC24sq+LSAb6JyZ8=;
        b=vavHyjJ5T2rmP9+bQ46Zi+IMQg/OhfbihRB3R1yHhqmNTo32mvrrfl/xENXf6rGOY8
         exwg6240unjNzrH5uwZVmixN1EdiDvl0f8TnHU+d9GdiavIYGPbyrDY0sAaQPpdHn0Mj
         XBhj1juPeTZslr4cDa9Szi4KvTuzy6KVW8jbZxLiojAAqpz+KXD2ipDrCPtnTgiKws+/
         Waz1QQoMiMgmpDP2QIT/9hOKIue51VUKVFEzT4f1Hmgke4X1O3z+W99n9P7KBBgkCUm9
         FwBfazHt0EKjhlEP6Lcga3ZNiOBx/x+K1a0QVHJE3ljHxU8KeEFDzf9kA12Vfgw8FOLV
         W/Rg==
X-Gm-Message-State: AOJu0YztLnBUzyZrvSiXWsjZ3iIsAXmyScZZT4+U7Bf9tWBmfJ+uOKru
	w7p1jNSe78izCSwGsIAHwe+TYjAP3rD/7vfGzQZxZ1lDoq9BAV6JT9Q8ofF9YS7pgO+BUDLizPP
	MEbCnRY1Iuhd9suaRyWLFqa9sSWZaDiYWUkPlDw==
X-Google-Smtp-Source: AGHT+IHr9trlZD353vY7+YKiQW0Y5tTkr+iwyEbiM+jJSnRiuXSLhqcGHfmxwltH6jMksJn3VVYVupmOMLfNMZJhCmk=
X-Received: by 2002:a5b:70f:0:b0:dbe:9e8a:94e8 with SMTP id
 g15-20020a5b070f000000b00dbe9e8a94e8mr7276386ybq.54.1707111400563; Sun, 04
 Feb 2024 21:36:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1706296015.git.quic_uchalich@quicinc.com>
 <12bfdd23772c49530b8b0993cc82bc89b3eb4ada.1706296015.git.quic_uchalich@quicinc.com>
 <CAA8EJppapW5nOFphBWove1ni8nbkA=xHON9D13NYeYHhyqL1Fg@mail.gmail.com>
 <94b097d4-dcfa-4136-ba75-f665f5bc747d@quicinc.com> <CAA8EJpqa5YArFk893nDz_oibbV=oqGEeYq6_jw582rQs=O_WpA@mail.gmail.com>
 <30d972b1-9685-408b-a87c-98352c4a2449@quicinc.com> <CAA8EJprPZThviO0vZfyYz+YShPKxg9YcuOUUCv4B_ePghuB8XA@mail.gmail.com>
 <b01116fe-6c38-329e-70b6-62fb0c585584@quicinc.com>
In-Reply-To: <b01116fe-6c38-329e-70b6-62fb0c585584@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 5 Feb 2024 06:36:29 +0100
Message-ID: <CAA8EJppZ8GYqDTvdv-zvfE9gtzW2rOnp8Vft_zetorMP2kvF-Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] soc: qcom: llcc: Add regmap for Broadcast_AND region
To: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Feb 2024 at 02:01, Satya Durga Srinivasu Prabhala
<quic_satyap@quicinc.com> wrote:
>
>
> On 1/30/2024 10:57 AM, Dmitry Baryshkov wrote:
> > On Tue, 30 Jan 2024 at 19:52, Unnathi Chalicheemala
> > <quic_uchalich@quicinc.com> wrote:
> >> On 1/29/2024 2:03 PM, Dmitry Baryshkov wrote:
> >>> On Mon, 29 Jan 2024 at 20:17, Unnathi Chalicheemala
> >>> <quic_uchalich@quicinc.com> wrote:
> >>>>
> >>>>
> >>>> On 1/26/2024 12:29 PM, Dmitry Baryshkov wrote:
> >>>>> On Fri, 26 Jan 2024 at 21:48, Unnathi Chalicheemala
> >>>>> <quic_uchalich@quicinc.com> wrote:
> >>>>>> To support CSR programming, a broadcast interface is used to program
> >>>>>> all channels in a single command. Until SM8450 there was only one
> >>>>>> broadcast region (Broadcast_OR) used to broadcast write and check
> >>>>>> for status bit 0. From SM8450 onwards another broadcast region
> >>>>>> (Broadcast_AND) has been added which checks for status bit 1.
> >>>>>>
> >>>>>> Update llcc_drv_data structure with new regmap for Broadcast_AND
> >>>>>> region and initialize regmap for Broadcast_AND region when HW block
> >>>>>> version is greater than 4.1 for backwards compatibility.
> >>>>>>
> >>>>>> Switch from broadcast_OR to broadcast_AND region for checking
> >>>>>> status bit 1 as Broadcast_OR region checks only for bit 0.
> >>>>> This breaks backwards compatibility with the existing DT files,
> >>>>> doesn't it?
> >>>>>
> >>>> It shouldn't as checking for status bit 1 is happening only when the
> >>>> block
> >>>> version is greater than 4.1, which is when Broadcast_AND region support
> >>>> is added.
> >>> Let me reiterate, please: with the existing DT files. You are patching
> >>> DT files in patches 2-4, but this is not enough. DT files are
> >>> considered to be ABI. As such old DT files must continue to work with
> >>> newer kernels.
> >>>
> >> I'm sorry, I think I'm not understanding this right.
> >>
> >>>>>> While at it, also check return value after reading Broadcast_OR
> >>>>>> region in llcc_update_act_ctrl().
> >>>>> Separate patch, Fixes tag.
> >>>>>
> >>>> Ack. Will remove this from existing patch.
> >>>> Thanks for the review Dmitry!
> >>>>
> >>>>>> Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
> >>>>>> ---
> >>>>>>   drivers/soc/qcom/llcc-qcom.c       | 12 +++++++++++-
> >>>>>>   include/linux/soc/qcom/llcc-qcom.h |  4 +++-
> >>>>>>   2 files changed, 14 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/soc/qcom/llcc-qcom.c
> >>>>>> b/drivers/soc/qcom/llcc-qcom.c
> >>>>>> index 4ca88eaebf06..5a2dac2d4772 100644
> >>>>>> --- a/drivers/soc/qcom/llcc-qcom.c
> >>>>>> +++ b/drivers/soc/qcom/llcc-qcom.c
> >>>>>> @@ -849,7 +849,7 @@ static int llcc_update_act_ctrl(u32 sid,
> >>>>>>                  return ret;
> >>>>>>
> >>>>>>          if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
> >>>>>> -               ret =
> >>>>>> regmap_read_poll_timeout(drv_data->bcast_regmap, status_reg,
> >>>>>> +               ret =
> >>>>>> regmap_read_poll_timeout(drv_data->bcast_and_regmap, status_reg,
> >>>>>>                                        slice_status, (slice_status &
> >>>>>> ACT_COMPLETE),
> >>>>>>                                        0, LLCC_STATUS_READ_DELAY);
> >> Above if condition will be true only for SM8450, 8550 and 8650 - whose DT
> >> files have been changed.
> >> It would never check for other existing DT files - I guess I'm failing to
> >> understand why the code
> >> would break with other DeviceTree files.
> > I'm saying that the driver must continue to work (well, at least not
> > to crash) even if somebody runs the kernel with older DT.
> Thanks Dmitry. While I get the ask, wondering why someone would use old
> DT while DT
> is also being updated in this series along with the driver change?

This is quite simple. The DT might be coming from the sources other
than just the kernel. It might be a part of the firmware. It might be
stored separately in the /boot partition, etc. The rule of thumb is
that you must never depend on the DT being updated together with the
kernel. This is one of the reasons why DT maintainers spend so much
time and effort to get DT bindings right in the first place. Once they
are merged, we have to support old DT nearly forever.


--
With best wishes
Dmitry

