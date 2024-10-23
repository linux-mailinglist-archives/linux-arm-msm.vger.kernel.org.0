Return-Path: <linux-arm-msm+bounces-35553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B719AC043
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 09:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF13D1F2426E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 07:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83A1155342;
	Wed, 23 Oct 2024 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lJQRYlII"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007D1155300
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2024 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729668724; cv=none; b=UM9JBxfElshoo0r9pglndTiemOjQORHcWcYQtpzWq2RmgeQrAZt7uPvrfocxw0nfCARW2Gq8ZS6psvmfGc0NaOQhD5FNc5J+DOS1VzkYVZOudVrd0VVaCl98E2NLurZkM5HAG1M0L7+DEdqBhHqJTJpbKfyohZZ/3eMJ78L5gnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729668724; c=relaxed/simple;
	bh=VXV9mLECZwGynUC8Cv6LVE6f5sDys723w3AAwBrxcGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSIXxhI/Z4L+zDu06R5I28dZslwGI7Hs2tgzIi8PdsUUOahfbSxMZ2zmaKPWT7hEicCwMb1Vf293gENZNpgxKKVBGcBm6SdV+jA7kFEthseQdsAuqxR/PfoyTnq8ZCXGfVkpHoEbwVheV2IdprRShvknhY5FlvnmSWuiJOi2J4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lJQRYlII; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so7400877e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2024 00:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729668721; x=1730273521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDnS1sToRRe/vNiGWXop1N5e3vBYmlYJp+TdvdJ7lzs=;
        b=lJQRYlIIGxPIHPakVcST0zxPyKC1yoRX4QGftN6Y7DTW1JDoQbrbOU9G/J5VyKHAOv
         rc1R1lMbCutIGxCYFVShHJ6zNx9yXkFV0FtvSmN5Aum48kIWrqHsIZ/ofI5IrwJipFlF
         wJDJ4iKghXVlHTOqDeAIZR10f/XyI8D/+pACFGe5MN6Vu3/sOQhVkHleFbAr+VTc2B91
         CTQ1I8s49wMdYW2cY1W3X46Sdie87t1tqb0xCfBS8hwOroEQ1NXomav4E6j/RWE1d6tI
         ok0y3Beotzrk7BVF2WDgcyK8AUOsSm4B6W5wWkXEwOOa5/TEF38xfDRl9J/qk48TRJTz
         eVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729668721; x=1730273521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDnS1sToRRe/vNiGWXop1N5e3vBYmlYJp+TdvdJ7lzs=;
        b=xFB/Kly9UCbXsTTGwOeakF5cbcXSnMEU4qv1e3YQNAF/dErWUmfGaibkbe3XmEARFv
         kKd11z6Phrv9YsLNZ3tdbyxSlxLcZCiFWLjpNYtQo0lPQ1XYIvjljZKH/o7rC+p40HSr
         snwv8Ku1qbp7sa7Q4cLtzgWs/t16L9micelimeRNuO45FabMB0CVVW9CfjNhfTzCKzes
         pOnhbSD7fMpXoOkFOIdOy6R6GzZ3Ajue+SZJF5q2vefRR7rEUAaa3dtsysNyoRiQzd24
         TDckb0YCSvXz1adinwThI5Evn7HDd2FAKF40tmXzfZ4614/ZMdoUTHP4AScivR/yPkk4
         28SA==
X-Forwarded-Encrypted: i=1; AJvYcCWx+uiLCWJGALMTre7CG41TKA1Wi7a5pgj6IGfaOYCAcUilAi1FH26iwEi18CJnFacUQUrL70mz8IAdYAfh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ieTTS3TozQwsZ/Q6t+eHlYhi2ROtsWhd8hskpT1ENy1cGM0s
	wg3zLm2Yo9xvFsmvHO4EwjJGRO3CMigLxEtFVsc+MUqMP7t0CqWv6bjkB56AymXmH3ikDxck2yX
	aCzkef3vD+9hXjH8wWnYjgwc7AHNDFC3odHcgyA==
X-Google-Smtp-Source: AGHT+IGD9F0GaVekQ4gDOlaKW2LfSzuAYKH+S+5MGgpd62TAdHFoFw62xcsZs+SqIdbQ+vdLLC3ioV66VL7fi8iGpdI=
X-Received: by 2002:a05:6512:2245:b0:539:fdee:fe04 with SMTP id
 2adb3069b0e04-53b1a2fe3dfmr708253e87.11.1729668720876; Wed, 23 Oct 2024
 00:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
 <20241014111527.2272428-3-quic_kuldsing@quicinc.com> <CAMRc=MfR8rK3EnZx3_9rxkwgv6f8jA4X0u0cGBkpJ89d5i1MKw@mail.gmail.com>
 <f46a9180-ca71-458e-9693-ed9badc85e72@quicinc.com> <21630547-552b-43e0-906f-840610327876@quicinc.com>
 <CACMJSeuM=xmtvJr_DOZNdsj6FpF50xgXx1VED4OW6cv=s2qW5w@mail.gmail.com> <5e52d6c5-6e42-4244-bf66-a2d1343ad868@quicinc.com>
In-Reply-To: <5e52d6c5-6e42-4244-bf66-a2d1343ad868@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Oct 2024 09:31:49 +0200
Message-ID: <CAMRc=MfUzvxmOYsuDKnp3HGvNYYdYFK0Le0aFkFVeHoqoL3Kog@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 8:34=E2=80=AFPM Kuldeep Singh <quic_kuldsing@quicin=
c.com> wrote:
>
>
>
> On 10/22/2024 12:27 PM, Bartosz Golaszewski wrote:
> > On Tue, 22 Oct 2024 at 07:43, Kuldeep Singh <quic_kuldsing@quicinc.com>=
 wrote:
> >>
> >>
> >>
> >> On 10/16/2024 2:31 PM, Kuldeep Singh wrote:
> >>>
> >>> On 10/14/2024 6:38 PM, Bartosz Golaszewski wrote:
> >>>> On Mon, Oct 14, 2024 at 1:19=E2=80=AFPM Kuldeep Singh <quic_kuldsing=
@quicinc.com> wrote:
> >>>>>
> >>>>> The qcom_tzmem driver currently has exposed APIs that lack validati=
ons
> >>>>> on required input parameters. This oversight can lead to unexpected=
 null
> >>>>> pointer dereference crashes.
> >>>>>
> >>>>
> >>>> The commit message is not true. None of the things you changed below
> >>>> can lead to a NULL-pointer dereference.>
> >>>>> To address this issue, add sanity for required input parameters.
> >>>>>
> >>>>> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> >>>>> ---
> >>>>>  drivers/firmware/qcom/qcom_tzmem.c | 6 ++++++
> >>>>>  1 file changed, 6 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/=
qcom/qcom_tzmem.c
> >>>>> index 92b365178235..977e48fec32f 100644
> >>>>> --- a/drivers/firmware/qcom/qcom_tzmem.c
> >>>>> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> >>>>> @@ -203,6 +203,9 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_poo=
l_config *config)
> >>>>>
> >>>>>         might_sleep();
> >>>>>
> >>>>> +       if (!config->policy)
> >>>>> +               return ERR_PTR(-EINVAL);
> >>>>
> >>>> This is already handled by the default case of the switch.
> >>>
> >>> Ack. Need to drop.
> >>> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qc=
om/qcom_tzmem.c#L218
> >>>
> >>> While examining qcom_tzmem_pool_free under the same principle, it
> >>> appears the following check is unnecessary.
> >>> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qc=
om/qcom_tzmem.c#L268
> >>>
> >>
> >> Bartosz,
> >> I am thinking to remove below check in next rev like mentioned above.
> >> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qco=
m/qcom_tzmem.c#L268
> >>
> >> Do you have any other opinion here?
> >> Please let me know.
> >>
> >
> > No, let's keep the NULL-pointer check and add it to qcom_tzmem_free(),
> > I'm not against it. I was just saying that in the latter case it will
> > already be handled by the radix tree lookup.
>
> Hey, I think you misread my comment. Let me explain more.
> As agreed, Will drop (!config->policy) check from qcom_tzmem_pool_new
> because it's already present.
> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/q=
com_tzmem.c#L218
>
> Keep (!vaddr) check in qcom_tzmem_free as discussed above.
> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/q=
com_tzmem.c#L411
>
> And last thing, like we don't check (!pool) in qcom_tzmem_alloc as it
> cannot be null, same way I believe (!pool) is unnecessary in
> qcom_tzmem_pool_free as qcom_tzmem_pool_new should return valid pool and
> if not, should be handled by calling driver.
> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/q=
com_tzmem.c#L369
> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/q=
com_tzmem.c#L268
>

Well I would say this is just churn if it's already there but yeah it
cannot be NULL so I won't object.

Bart

