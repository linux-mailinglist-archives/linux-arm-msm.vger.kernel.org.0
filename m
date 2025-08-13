Return-Path: <linux-arm-msm+bounces-68984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D24B249B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 14:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C1B6564956
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E412E4256;
	Wed, 13 Aug 2025 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlUeQlv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028D717B402;
	Wed, 13 Aug 2025 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755089149; cv=none; b=h9xIfaSPjBttUk3bOeM6kUfd+BUeglv9AanvTrZJp+iOXZ//ZmnNho0jeQLS9BMXklulxkU7FAGRuKoM9lR+jLndsOSws+5cS68g8JYyG1ppe0v7yC0qJn7N+0R2KpIkyU9ASyjeS1Lpi/4kvz/4ZfzjwRa7l000a7tntUG1SS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755089149; c=relaxed/simple;
	bh=9ePhaM1+lxmQ0wWNlZFhwrXN02tFwzOJ5rJ9YVsxj8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ob7mzr+8MN1F4GeHnhgBl+0VNZ4Nh9ngoRiP0a9VasYnhOg8ZQt+qmYR/xQI8ru1HtoAuesoy3cf2lZYAFqcsW98KsFuBkV0HqYYwVpGLv7esm4RXowIZcf3YncKXJULIwFNnx4Oe1buDVPGLoYaw9MNhwxkD5PALJooUdJhsH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlUeQlv+; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-33226bac198so54017231fa.2;
        Wed, 13 Aug 2025 05:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755089146; x=1755693946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wDWF4Sa7ylWnFNsNSrALrZPCLAjto7yWCScsWR903E=;
        b=PlUeQlv+TtAhuxPu2BI8Q7nPpGoBOWIJorU/ccTjUuAifuF+TXWMgtr/e7pw7qaIY0
         QaQZQ1pfVnqpJVP1OK8KkpVYMTsrubSm6fC2lRfPS0xSTD7wX25QeHXK1EstBvKTGTdo
         id8WTB6NOVSvT0daW5zcpba74e9Y1v7p4bp1eCWpwplxBt1afQ7Roio+aam2Om1wvAnd
         TbmVUQn7L2A3GbFd7XHv6SzmR9yDicuKdonCp/6+6saNizs/6sezMuA7NR3v1OakIIFS
         0ZY6qVocQn+4ssgv3pxr2Z6TBtUYY5QpuMgTPg4Jg/bkqvckX7v0L77wb5HLlXh5hsnO
         Kb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755089146; x=1755693946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wDWF4Sa7ylWnFNsNSrALrZPCLAjto7yWCScsWR903E=;
        b=w8HQmD4cF4yj+vjuREfCNKPqXvBUp16EiMevqCEpxhlZStkqlTv08IjNo5vWwyw7fG
         +RB1TvgoMmpLnD98HO5rAqqfqdKHg3jRPqn/VXELVlDuhFNQPveF5H8KAIzTnlWRxfJV
         zQika8mvyywe4BQW/OW30dJNU5p6ENlwKTqZ880vGHks9MsTNqJL8y/0PC+/xwwBrOzo
         uFYwgxuFIY6BxaDc2hmpe1wILxNzybkkLOdxM6qkoY/6AKnqUoCBV64NZ4qVqiqcI6ox
         O1jFP250VTombuA5KAdHBLuWixg+I5tfP6Qk5sCZz9Uclc+ONQ3Dz852YHXJ+l2xvUrb
         900Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaHzJ08QfaBicYHI9ZgkYzZW3n8BylW30mTFqNT4fn34HjDdeiqEEIloCB1rWT9sijm1SgHKGi6CfZispo@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl4IyjBckmbMXfJdZwBCXt1lkt64qs64op2rSJydvYl2wnUjWT
	1jmiWpf4p+nMgfOxfXpEgFW6FfnZO/JjVW3C2l2uZoHRCoKo2zEEB4O6d96KnOA95foLYmPmd3Q
	GicHFuIfu9PVxaD3bmdWJnHzID5j7JBM1qg==
X-Gm-Gg: ASbGncuiaR1RaMKZTg2x0jE80PUg0z3QBO/KlgESHO4OwMIV1dRtl0cWjjyfwG1jgh8
	TJE7ph9d9Ae12eseKLHFwacn1oGvOpxRv0Rub4W3aYrlWoqURjdNqkbdVd8bB0Xm5vFj1mHVleU
	D2ZtnZToCJCp4Lqw7r9VJU7iC1qEohkL2laGadDQxOcBza4UwEb9SZIVh7Nr52sdTNIrO58qA8R
	vDKKDw8x6/iMbyt
X-Google-Smtp-Source: AGHT+IFb6GHILskGsSoW6ADpqf5XYwiS6CXsY9y9iACV8Xm0q/GD0sh7JmfzjOL4mCjsBz1B7V4U4+gqXZgn7192U7Y=
X-Received: by 2002:a2e:b8c9:0:b0:333:f25b:2905 with SMTP id
 38308e7fff4ca-333f25b85c5mr4129501fa.35.1755089145709; Wed, 13 Aug 2025
 05:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812113620.3135226-1-quic_shuaz@quicinc.com> <20250812113620.3135226-2-quic_shuaz@quicinc.com>
In-Reply-To: <20250812113620.3135226-2-quic_shuaz@quicinc.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 13 Aug 2025 08:45:32 -0400
X-Gm-Features: Ac12FXyNEigQyl_WIa7cKA8CUZjD9vf7yqWeFbPinEKFpZYqgNLiErqlmJpLkj8
Message-ID: <CABBYNZJTiTy6+LDDVpkfJFEstwKJ5kQ2KyRhCQGa5asW8GyyhQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] driver: bluetooth: hci_qca: fix ssr fail when BT_EN
 is pulled up by hw
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_bt@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuai,

On Tue, Aug 12, 2025 at 7:36=E2=80=AFAM Shuai Zhang <quic_shuaz@quicinc.com=
> wrote:
>
> When the host actively triggers SSR and collects coredump data,
> the Bluetooth stack sends a reset command to the controller. However,due
> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits=
,
> the reset command times out.
>
> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
> commit: 740011cfe94859df8d05f5400d589a8693b095e7.
>
> The change is placed under if (!HCI_QUIRK_NON_PERSISTENT_SETUP)
> because this quirk is associated with BT_EN, and can be used to
> determine whether BT_EN is present in the device tree (DTS).
>
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/hci_qca.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 4e56782b0..14b2d1bee 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1653,6 +1653,19 @@ static void qca_hw_error(struct hci_dev *hdev, u8 =
code)
>                 skb_queue_purge(&qca->rx_memdump_q);
>         }
>
> +       /* If the BT chip's bt_en pin is always pulled high by a dedicate=
d 3.3V
> +        * power supply via hardware the driver
> +        * cannot control the bt_en pin of the SoC chip, then during SSR,
> +        * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be clea=
red.
> +        * This leads to a reset command timeout failure.
> +        * Also, add msleep delay to wait for controller to complete SSR.
> +        */
> +       if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
> +               clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
> +               clear_bit(QCA_IBS_DISABLED, &qca->flags);
> +               msleep(50);

Ok, I don't know how many times I have indicated that using msleep, or
similar, sort of indicates the driver is blind to the controller
state... also this seems to be assuming that the so called SSR is only
in progress when HCI_QUIRK_NON_PERSISTENT_SETUP? There is also no
explanation about why 50 msec would be enough as well.


> +       }
> +
>         clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>  }
>
> --
> 2.34.1
>
>


--
Luiz Augusto von Dentz

