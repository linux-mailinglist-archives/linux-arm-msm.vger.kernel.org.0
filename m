Return-Path: <linux-arm-msm+bounces-83262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED9C855D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 15:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B99D4EA102
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2DB324B24;
	Tue, 25 Nov 2025 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xLdAGdtJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A8331BC84
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764080375; cv=none; b=OpwTY4s89D09JU2vPqb035P7ir/inOjCmWjKUxvsw/Ye7cOeuhhqou0itFz6lN6StGBKuAYK8Alzzy8CA0dFUppbN3gxQuoKL0qSPyukwoxXRQmK/yTdN2un/cmv0vp/TTBDCbSUHaA12ngy3OsEnxHFSTHlnjmx5duDqnZpCCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764080375; c=relaxed/simple;
	bh=P7SIxPhHJVLDbgEW2nk/FMKjMfpphtAbr1C9o0Cw9xg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5KyknrpHm2K1MZsYXl9cuzKFkhVwFYYnfrhIa+nVB4z241UhGuT3rpEzhS+YykCFuf/51XQm2hDku8r3B4G8J+w6y7OCYzKo7wdMKnb34UkZqPnZMBcjhx+2tbWjrFkD4DZ/dIVV0wowxGondVBQIYcxep7vEpDAfcPjczdCLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xLdAGdtJ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5943d20f352so5719201e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764080371; x=1764685171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7SIxPhHJVLDbgEW2nk/FMKjMfpphtAbr1C9o0Cw9xg=;
        b=xLdAGdtJZKnHKXDs2bPLeUMVFde3M8NKz/NOcaiuoV6q0Ojj5/cCx96ID4QLhfFuAl
         Ie+v4ZKQU2fJbG9mNO8Ziidec/uxj8Po+ypMguPgPG0+XV4KY53UTww+4V7antu/uOAI
         F5UHQmzoR/A19k/XZuUDW+bCBUjGab/UdEwFqFNLqfv1BZrBcg7GWpCqw4NUWpGtWmTy
         cFlQXhHjDH9UjiP3bYi6JpS78ZdXxq+xr6ihq2UOnmd062Nf4oyYJ+Y/VumBIrIVbjCt
         aDo44X8vbeXorCNJhoM7C/kxt0k1eqs88T3G+mnKRmNRjq8piH/VHFlYdwSgZyd2fpMp
         HW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080371; x=1764685171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7SIxPhHJVLDbgEW2nk/FMKjMfpphtAbr1C9o0Cw9xg=;
        b=oBMoIyAMXrOAe+x9L531X44i2K0aJwCv1igOBdxsvz6AeptioKyUgrreomxAfSOc4a
         M7vZ0AcAkSlh7oD7qsiUSPQAh6MNW+KH/y7gxypyphKbix1M5GjZ5Sey7tf+9UTJTyBN
         HKa1t/HdPevAIRQyLuel/mklmopYvPAO4VfuOmA3pPwZ+9cF40gOMTMaRHHMUgtWBXFV
         n0YgpGryI3xBUtGQbwDAEjnUL11+M5ovkqx2wP66uAvWMsVkfk6McuxrJFpWAFKNYdoV
         eKbzebxd+TmZPsKtgA9gRoSqNG91FgbFNwTwuEEwAdkGZMRIyw5TUQJmnqdh6D1w5TL7
         gs8Q==
X-Gm-Message-State: AOJu0YzpaCn5lXlpSgKI69f66rTj00SESJ8fND/O/iQUMctigHG2P58v
	v0LgnR0bk1nfPg5d22khcNGAt1BW4hWwTKcO3Uc17Q+muh3L1k7uTaruAd0TRVBPJvEvDSWgZ3X
	KGiVsbw31ReO/8dG1tY1rKlCDjLSOcelGH49jx7mc/Q==
X-Gm-Gg: ASbGncu1sAsKU0X1QWRvzgyhMuD5FW7o7ICzUqquI3Xxd4oijLE+RnmCGiga3pqxbJe
	6wYIaS2gYU2apGJ9ODYp8ndAiWdhW9sCBXbrRZAfOSPazj3y6o1hmd586a4fAYUj57gHxmtGuBw
	11zzX5EyDI0JnePVwhKlZQb2Mi8cSM57kFodzJY3NVwLcTlOZyq4kKSLiYpKFuMkfbzapcI6WHH
	V32IW8wWT3ISH1w4oEF4KoaPQIhT/ru3tyLKEpkqTIjN2aZJRanbTqCLUZzKjot56yh4XPkI7Qo
	QuGRXD8/76QkajZQVsfKtc407YY=
X-Google-Smtp-Source: AGHT+IHjykXDXRuYmyiHgRlKoptIq/bzLmVXtn+AKtKhnsSb1GSQNb7m7uuQ2lGcPAQr9tqzDp7jUORCN1C+V6UvgI0=
X-Received: by 2002:a05:6512:3e10:b0:595:9dbc:2ed7 with SMTP id
 2adb3069b0e04-596a3edf0c1mr4648188e87.43.1764080371371; Tue, 25 Nov 2025
 06:19:31 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Nov 2025 06:19:30 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Nov 2025 06:19:30 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251123-multi_waitq_scm-v9-2-0080fc259d4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com> <20251123-multi_waitq_scm-v9-2-0080fc259d4d@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 06:19:30 -0800
X-Gm-Features: AWmQ_blf4hIx0pH_pVxabJproDhmOxJXfb15QSx_VDU8EPdwe_cs53CND3hxUkI
Message-ID: <CAMRc=Mduqp1MaGZ2_Kfmb31WMntAW1FtAUgr1GBhGEy7PY21fg@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] firmware: qcom_scm: Support multiple waitq contexts
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 23 Nov 2025 15:19:31 +0100, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>
> Currently, only a single waitqueue context exists in the driver.
> Multi-waitqueue mechanism is added in firmware to support the case,
> when multiple VMs make SMC calls or single VM making multiple calls on
> same CPU. Enhance the driver to support multiple waitqueue when
> support is present in the firmware.
>
> When VMs make a SMC call, firmware allocates a waitqueue context,
> assuming the SMC call to be a blocking call. The SMC calls that cannot
> acquire resources, while execution in firmware, are returned to sleep
> in the calling VM. When the resource becomes available in the
> firmware, the VM gets notified to wake the sleeping thread and resume
> SMC call. The current qcom_scm driver supports single waitqueue as the
> old firmwares support only single waitqueue with waitqueue id zero.
> Multi-waitqueue mechanism is added in firmware starting SM8650 to
> support the case when multiple VMs make SMC calls or single VM making
> multiple calls on same CPU. To enable this support in qcom_scm driver,
> add support for handling multiple waitqueues. For instance, SM8650
> firmware can allocate two such waitq contexts, so the driver needs to
> implement two waitqueue contexts. For a generalized approach, the
> number of supported waitqueues can be queried from the firmware using
> a SMC call.
>
> Introduce qcom_scm_query_waitq_count to get the number of waitqueue
> contexts supported by the firmware and allocate =E2=80=9CN=E2=80=9D uniqu=
e waitqueue
> contexts with a dynamic sized array where each unique wq_ctx is
> associated with a struct completion variable for easy lookup. Older
> targets which support only a single waitqueue, may return an error for
> qcom_scm_query_waitq_count, set the wq_cnt to one for such failures.
>
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.=
com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

