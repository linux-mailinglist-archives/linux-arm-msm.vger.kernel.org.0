Return-Path: <linux-arm-msm+bounces-79962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6FDC26FA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 22:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 167304250E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 21:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E30B27B331;
	Fri, 31 Oct 2025 21:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdTQF6nI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82D153BD9
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 21:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761944784; cv=none; b=goeB5DvlFeR36sp0eu9PSE+s259XMNfNEX3IxSJZzq/Ntn6DMfhJH4NfyNlmd+iA9kEFU+aOT0y8hLeJeFxpgtoYoiMq7HIyu+oGDtIjKtNxp9eaHoQ1BBd7JocMNk5k7G0Et/RJ5KLT2StWsFUheg/EsYn+AFnmh4PbdcleQ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761944784; c=relaxed/simple;
	bh=ZQ8kJ/dQVhvAPrJjeJICrE9lcMOn5vbnS0hI7K0vOqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZpmuByzKJ1cwPbfNiVvzW0n0HCftbo3RzrKr78MCYbT3UAq/MxGjvNhiGYiyV4tRevYhR38HbilP6q9hP5gl0vWY1E/+J5iVWAuvFnTNajmpbTLUTVphkgA7O5EZWHmZkAhNipSMG2r3CHiAxyaL6QfesAe35SdraifJ/Gs1Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdTQF6nI; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78617e96ae1so27794677b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761944781; x=1762549581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQ8kJ/dQVhvAPrJjeJICrE9lcMOn5vbnS0hI7K0vOqE=;
        b=KdTQF6nIOCkJvRxfFMQQkkrpr6lmEuf7pbpriKg4wNp0MXwV54aRbM1g0NRIFJuVzv
         y2lyXfLw3LhxoAmyBxQaIOUysMqIj/SaumDWF5UVLqZQOUbxXkIqWTHYiCwu+TMlGhek
         bWTC2UxZL5BnUISTNf3I4naf0lAeODfI1nXDY8AQZphPgllxWOkLXlXfORJFn0T2qVVs
         MQ6jZa65fEF+jKCenLh2K6gmWyOkSzt0cvfQ8r+h5Gp85C2jdJjxeiQ7jpN7SmeSNkcK
         pIHaGpK3gTFiUCbDK54b6Xo331/G6b6TyLc6T1TQquZTSzYEfEHTn67B4ptHRidnJsWh
         cM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761944781; x=1762549581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQ8kJ/dQVhvAPrJjeJICrE9lcMOn5vbnS0hI7K0vOqE=;
        b=KPcNIEf1ETixaeUqpMUlPrsdBxJUDOkT620JC7ed2aI4zEN4iFMD2748ZneL5wsSQn
         xRk6sSkBiOiSUh/utspFdVCDSaskUHPJMP662vR56rK9AO8GMQ8qJCm5Q7GObpJcz67N
         fn782fzsrGHA8vlmmANfp+xhSBO+pTXfmpJObmdblP6aViXb/JWPvFwH9t7/3uH/WCvO
         yxpFQs5mPL6rs0CZK8xsY0Nn5n1sksQXZM0TLF0ypnuaHfaWLZcbhFvW0tUzfrYaFTQx
         diZWlSPsUtWZI4er0pdYoH44Nrc1Yk9jIoXfDmHa3IuZE7CW5Y4/Ix8uqOIa3RGaqSEQ
         QHXg==
X-Forwarded-Encrypted: i=1; AJvYcCX3m2RHkVBIesdwxtMhRDHgz/IIIK738ZMcgMOs/RG7R6YXAo2953AmlKShG350TkxX1t+RGC94vFSKvE7r@vger.kernel.org
X-Gm-Message-State: AOJu0YzHAmKFBMvHpVuHgypVEbbyRSrsPD/BGpK6ndBbavkJ32ytwIXH
	+2Okx9PqODg5BVI987IKFwe3q4M64Okt2x8Te0rNlA4LM/aPsZ+vWFmVMindMVLguGFeOmSUfJC
	848sQvTJ+SWS00eKdD8yb0sBYNLJ7DHk=
X-Gm-Gg: ASbGncuirhcac5+QD00oWLx2bwhlLzkcl4nnOL/oUla6kQPnZGA3Ie93fYpM8+XIxpb
	MbnzjwZMlrU89YDkmdlHSR7MhQKxv+95UXeWmQ9ixPmF+OG+mcpngYo4Q1mAbZlddn5lMCYCNgd
	kSCYFeJE/Y0/Z/0IuWy/x012a7uRAhZMcA6ZTc58CfUzTGAwGv0Et2doFJbNHUuyHqPqsMlvv8B
	bxIpgpoY1yz0KywojmnM5zOYnDEqLUqczQwDGCYsCCHV+YaZ1QeMOa0OzoUDw==
X-Google-Smtp-Source: AGHT+IE9sBE0jM85fWoe+G8dRBhCXA3kX4jwHQnI5VFiFvn+DYXwglZxhpeYQTVBqJJN5EkFNvDu2iBSj3Q8Q2wI6b0=
X-Received: by 2002:a05:690c:d88:b0:784:ab8d:4b97 with SMTP id
 00721157ae682-7864856cc5dmr46049457b3.58.1761944781434; Fri, 31 Oct 2025
 14:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014044135.177210-1-ghatto404@gmail.com> <20251014044135.177210-4-ghatto404@gmail.com>
 <e114504e-4bdd-46b9-b708-8eebc3075163@oss.qualcomm.com> <CAMQHOhfjsi1L+3j3TrcjEjPp3xkn94KOdsrVZvJCyUDFBBSeqg@mail.gmail.com>
 <d06a254f-bf54-4bdf-bd09-3ee5e5b31bad@oss.qualcomm.com> <CAMQHOhe=WYhtsjHMcRnJOi8UhnNNBfveTWRGSZ_bg24gFysAEw@mail.gmail.com>
 <8bd5486f-38a9-4104-8d09-234f642b45fe@oss.qualcomm.com> <CAMQHOheTkKC8NcRrPxKZdB_h0SJGNJVMd4NUD7TE4becPouWyQ@mail.gmail.com>
 <73d30994-3ec3-41bc-9b07-638d4173dfe6@oss.qualcomm.com> <7C2DF8E1-D84C-428C-B064-3D8CA16FEA29@gmail.com>
 <7e5f753d-a26d-40fb-9cde-ec17eff85c27@oss.qualcomm.com> <E9C95D16-18DB-4AE9-8C50-BE3481A25FB3@gmail.com>
 <a04742f3-8a1b-4d69-acd9-5d8dbd5a8886@oss.qualcomm.com>
In-Reply-To: <a04742f3-8a1b-4d69-acd9-5d8dbd5a8886@oss.qualcomm.com>
From: Ghatto <ghatto404@gmail.com>
Date: Fri, 31 Oct 2025 18:06:08 -0300
X-Gm-Features: AWmQ_bmacakBqv4QAY89pzDEVGDDX2AV4j0-p1iYjULhBum7nlyX1fQqrIZTKCE
Message-ID: <CAMQHOhdmf5TvF3bA4QcTdBY+A2ao1_bDXPPya5aiOjHJ0yLqbQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: r0q: add touchscreen support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 6:50=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/27/25 7:32 PM, Eric Gon=C3=A7alves wrote:
> >
> >
> > On October 20, 2025 9:18:18 AM GMT-03:00, Konrad Dybcio <konrad.dybcio@=
oss.qualcomm.com> wrote:
> >> On 10/17/25 8:22 PM, Eric Gon=C3=A7alves wrote:
> >>>
> >>>
> >>> On October 17, 2025 5:20:43 AM GMT-03:00, Konrad Dybcio <konrad.dybci=
o@oss.qualcomm.com> wrote:
> >>>> On 10/16/25 10:08 PM, Ghatto wrote:
> >>>>> On Thu, Oct 16, 2025 at 6:06=E2=80=AFAM Konrad Dybcio
> >>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 10/14/25 9:04 PM, Ghatto wrote:
> >>>>>>> On Tue, Oct 14, 2025 at 11:18=E2=80=AFAM Konrad Dybcio
> >>>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>>>>>
> >>>>>>>> On 10/14/25 5:10 PM, Ghatto wrote:
> >>>>>>>>> On Tue, Oct 14, 2025 at 7:01=E2=80=AFAM Konrad Dybcio
> >>>>>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>> On 10/14/25 6:41 AM, Eric Gon=C3=A7alves wrote:
> >>>>>>>>>>> Enable the ST-Microelectronics FTS2BA61Y touchscreen. This pa=
tch
> >>>>>>>>>>> depends on "Input: add support for the STM FTS2BA61Y touchscr=
een".
> >>>>>>>>>>
> >>>>>>>>>> The second sentence doesn't really make sense to be included i=
n
> >>>>>>>>>> the git log
> >>>>>>>>> I'll keep it to the cover letter then
> >>>>>>>>>>
> >>>>>>>>>>> The device has an issue where SPI 8 (the bus which the touchs=
creen is
> >>>>>>>>>>> connected to) is not working properly right now, so
> >>>>>>>>>>> spi-gpio is used instead.
> >>>>>>>>>>
> >>>>>>>>>> Some Samsung devices used to use spi/i2c-gpio intentionally, a=
lso
> >>>>>>>>>> on downstream. I'm assuming this isn't the case for r0q.
> >>>>>>>>> It isn't, the device uses fts2ba61y on the spi8 bus - I hosted =
the
> >>>>>>>>> DT at https://github.com/ghatt-o/ss_experiments/blob/main/r0q.d=
ts if you
> >>>>>>>>> want to take a look.
> >>>>>>>>>>
> >>>>>>>>>> Did you enable gpi_dma1, qupv3_id_1 before spi8, when testing
> >>>>>>>>> The driver probes, but it fails to recognize the touchscreen de=
vice
> >>>>>>>>
> >>>>>>>> Could you post a complete dmesg and the precise DT diff you used=
?
> >>>>>>> https://pastebin.com/QkYa8nMp (android dmesg) mainline dmesg does=
n't have
> >>>>>>
> >>>>>> The link has expired =F0=9F=99=81
> >>>>> https://pastebin.com/s4abJS9M shouldn't expire now!
> >>>>
> >>>> And yet it did!
> >>>>
> >>>> Feel free to just attach it to your message.. the list may bounce
> >>>> it, but it will still reach the To/Cc recipients
> >>> Attached the dmesg.txt file.
> >>
> >> I'm interested in what happens early when the SPI hosts are programmed=
,
> >> whether there's any additional debug messages.
> >>
> >> If your log buffer is overrunning, you can add log_buf_len=3D8M to you=
r
> >> cmdline (which will make the buffer 8MiB long)
> > Is it that big of a deal though? spi-gpio
> > works just fine for touchscreen.
>
> It's like using CPU rendering even though your computer has a GPU in it..
Yeah, but CPU rendering is slow, while the touchscreen
on spi-gpio is just as fast as it is on Android.

>
> Plus we don't expect the upstream driver to have such odd issues, so I'd
> really like to get to the bottom of it
I don't think the log buffer is overrunning, where can I find the SPI host =
logs?
>
> Konrad

I'm gonna drop this patch so the other ones are able to get merged
while I work on the driver.

