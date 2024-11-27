Return-Path: <linux-arm-msm+bounces-39320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E63A9DA839
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 14:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D1C282E98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F581FCD1D;
	Wed, 27 Nov 2024 13:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fDPxZ2n1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D231FCCF3
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 13:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732712926; cv=none; b=S7OHUX+qZ3lxjq3ihBdIT7OnuLTdkIyIGGwGI7Ytcx/LlMegJG8xqYjou1YY3rmfxgcq9gkJxsHvq+N1V5cfQq77aHR/1+0mSGiTqp+EQJtsRZoJz9M3pskNe2wfqMgrqtMAyc5p/oDYzoH4tG9cFduknwJfYtptLIjyD0lb/C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732712926; c=relaxed/simple;
	bh=STCfL3GsKf/AOQi4vbhGaEdxgftPACg3jwZIG7ref3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ei/o4cnZ/iNjG+pnlBW53gdv42hSHieP4DY2WXt5GFxaqB6jVHVg5ixZy6nM0imi6n8J9zJu+5gDDJQtF7iFOgxDWUSKb/5AUxb1vyJOVKJXBT7sXSpMULUJ3dMbU+6r06muyNWjlMqrJ3pFCW/vZDP02n/Ko+ueo/ps/yfda78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fDPxZ2n1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53df1d1b726so514630e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 05:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732712923; x=1733317723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dpswvTaRge66vj7YjaC/6aZT4nt4DTSU3DINcL/KGM=;
        b=fDPxZ2n1R9eKxnkE0yTKyg8cwuboimFdA1BJowBdLAKXlzvSnRu59uUbyiy+e8HZYF
         Eyvsfytc6o5t7E/sKElx4Hn4IBWcgs+5hAucEY+Phh63m5w7MaD84c2ZvXSWanc0K6aS
         50HRXPi9deK5tpAml1mzZFjfkjkAh8EOe/UjjpNm8zgfDtx69hRLQwLsNOsNVfQzXZHu
         hQXdEu+0FhbgkJ6TaskJRijZneXDHBOrolHoQdNWAVC2arD8ZFOoc0wfYgpjGryRZqPF
         wmbz0NbHEaTCcx3PWKEcmtr1owWQNg/tuGqMe3U1qqmLix2OIdmMs6ZHfmW/0cbul/hw
         ZA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732712923; x=1733317723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dpswvTaRge66vj7YjaC/6aZT4nt4DTSU3DINcL/KGM=;
        b=nw0SLoRVtm8I/j7+Rg7OQuvaKNNJc3n7mFrfowMX29IX+Qa+iF+LP70XH77MdHqcpv
         ypLk5reF3hc2s4xi8ddgO4sqd1JGEPU2WhcYvcDPcX/5S3KD+vE0uaoiws9VDbKn3elf
         b4j9oyn4aRwyM26RtfNJN++GLyqqSkSRUvnr5TljpMDGzIiIDYuDUaCW6L9v/+3tTURb
         WZa66Lxl57fEX/e0SOUq4/TNJuGcFZT/j0dboYA0Epgqyv478EpCiMImOgEF6ONG7sb+
         65TVduxPMnnjXnUVBkJnZv5dEHzWko1RAE6a7a0DDS0Q1sal1o5p6GzXN+ZV9d2CxWTV
         wfNA==
X-Forwarded-Encrypted: i=1; AJvYcCVK7yEUEeJ/Hdsk58PqunHngUGlFT6hWEgNdTPX7CK38+zyuzivweIhyNo5h5AvyTWhPY0pqHLpm1iFuXBA@vger.kernel.org
X-Gm-Message-State: AOJu0YyoH9oTFKdzPEJRzCsQ70VBekp1OyZ3Iv6zdfin0DZhTK1WPwF8
	TYEV/bUC4AofQHC0U7ZWEjfW7bd97/Mp+ptsZpD9AiSuB+AcI+yQCXpk03WRvlKFUUy6cahh5DQ
	8x4iiQKUk6y3lBFLTHtaALYT0xEHWhyAZRTTqDQ==
X-Gm-Gg: ASbGncuWcfQAB3umSCgQiEgpN0FFRqR2o8GkYqj4n5UcC1Pzui+8ewP9HO1wqVHLYaX
	kbCyaP/8IV3uJbQFkBk1TxpZ8LLOaVBzq1NLQVzBYCgnWsgE3TK1nI3T2YWcJ1mU=
X-Google-Smtp-Source: AGHT+IFqryFgOZJLLptnd4IzLulOUkyCGy+nqG1q8FUpptIWr2Y34pCBKnW7QjQl4HqmdUnAxe95e40GRyaOYV61QJI=
X-Received: by 2002:a05:6512:124f:b0:53d:ed6c:30de with SMTP id
 2adb3069b0e04-53df0016b58mr1784542e87.0.1732712923117; Wed, 27 Nov 2024
 05:08:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127115107.11549-1-quic_janathot@quicinc.com>
 <20241127115107.11549-2-quic_janathot@quicinc.com> <873e45b4-bcca-43fa-ab90-81754b28629f@kernel.org>
In-Reply-To: <873e45b4-bcca-43fa-ab90-81754b28629f@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Nov 2024 14:08:32 +0100
Message-ID: <CAMRc=Mf-cO9M9=P50mhPDvRRBSYVZUDrEVa1jcMvAsjdAq6VLw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: qcs6490-rb3gen2: enable Bluetooth
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Janaki Ramaiah Thota <quic_janathot@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, quic_mohamull@quicinc.com, 
	quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 2:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/11/2024 12:51, Janaki Ramaiah Thota wrote:
> > Add a PMU node for the WCN6750 module present on the qcs6490-rb3gen boa=
rd
> > and use the power sequencer for the same.
> >
> > Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 174 ++++++++++++++++++-
> >  drivers/bluetooth/hci_qca.c                  |   2 +-
> >  drivers/power/sequencing/pwrseq-qcom-wcn.c   |  22 +++
> >  3 files changed, 196 insertions(+), 2 deletions(-)
>
> DTS is always separate and cannot go via the same (driver) tree,
>
> Missing bindings.
>
> Missing changelog, it's v4 so what happened here?
>
> Best regards,
> Krzysztof

Ah, so this is where the driver change is at.

Janaki: the DT binding lives under the "regulator" namespace so it's
Mark Brown who typically takes changes to it via his tree. I pick up
driver changes into the pwrseq tree. Bjorn takes the DTS changes. Luiz
and Marcel are responsible for Bluetooth changes so you will have to
split all these changes into separate commits.

Bart

