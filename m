Return-Path: <linux-arm-msm+bounces-80145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41601C2CEC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 16:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED29A1883C94
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 15:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDFF2264A0;
	Mon,  3 Nov 2025 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DzX6VnVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13D2313E07
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762185085; cv=none; b=qXe1UpJlBPuNpfN+9mCBt9n/eJtWQ/UBR0j5z8jmFCeDHXkZxyiob8I2lSspBXgHmJFZbRTqb7BZMXS6DwVbJ8kXgMTCMVcq1P6fPszNLInotLUXkLX5TV5VlW/32VaAGLBJsecILFWrq3Y4qMH+Z1fK2k7dD6cR1lQbcQiyGqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762185085; c=relaxed/simple;
	bh=OQjvFetmiYdL/f1kIguow4v6f8CTl1kBF1K8Pqz4soo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0BlMP0MGY8cGiphHXaWl1J/U6IH0t1zD2lmtZtjkSgVJNuAyHdl6tKr9aUdgDHiD6Zfh3A3m/BXXOx6iVagyTllFoNVw5lIG7D98GW9DJiaddwfuujSEzsIMnNqoC1Tl6xSAoool7x5iXT85WZSkeVdnTXQopBRJFB5XGE8e48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DzX6VnVg; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-378d50e1c82so43666331fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762185082; x=1762789882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQjvFetmiYdL/f1kIguow4v6f8CTl1kBF1K8Pqz4soo=;
        b=DzX6VnVgaT0I0H7uPROUX9fLAf9HeUmPq8AATD81p3KeSauSE4J4b3r2J1Xm0lyZFn
         IxDZ7EijMY2BMSK9dN8GslQII7sUilG/fIYne7JK5VBjYjmwp/EQ/Ca3793IqIWPI0aU
         SWQvvmahMIs92m89j8eKdkDhWrmzL0JBvszbP2Xy+jXgfzgPEy2W/LS9p0mIRnWgLwUR
         fTtletr3F28d5gLG17l55wdSiXVJKjGUrNhCZBRaiZFs4PoZxl28LiqTP9p05G2hDmrv
         ZulPhdZFDWNzJ8Eqe7iT/1gitZ1oVnhaT1XrZ2q60QK8ShLJ5gObg5xO/UClD7Y2ma4n
         P3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762185082; x=1762789882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQjvFetmiYdL/f1kIguow4v6f8CTl1kBF1K8Pqz4soo=;
        b=cYhimWaZAoFpr+G4nLy6bPXMpguJeKSGyaiXNoY+gFDkBIhBSs8gwemtk08k9cmYT8
         o5eHfI5VTjyKKQ1TFw7+WvqLDkJqk/1BsS0WB4PbIHdUVJpDbXkZ33svB1F0lFTI0nIv
         2fPro8KKacdi/BX0w3T2MGNCgmI3oW5P+9WPqhdiF+jdd3/0AIN18jwjaFOruZX3BpFq
         cWS+Wnr+M+NjH1t/R+Ukig1dipgPu8pjr7LVRDwmyD6+SjNcSault1Q7M+WwVPJIwVQh
         DjDNZmXnsVIZDsa/ZKtbK9yXgW7XpVw95wAdcOfowfG9XZulkqgKCcs/rVggDOgIWknm
         t5xg==
X-Forwarded-Encrypted: i=1; AJvYcCVn7qPVOipqf+fLHyWZJk27SDPHWQoO72C76dKt6bWOMQVDOTtgE6OmP59sUamUn87ioKDEr1RLkHQL1mGw@vger.kernel.org
X-Gm-Message-State: AOJu0YzKEse/rtlPpVFdeRA1+xeO9geG++5JTuhQ52KEz0JpHtoAMhDj
	PX3Xfv5saNetVweA4fF1pew9IEX1m22HBBZ8W/0moR+3fSuYCUWqDRw6K/7+/8djC+SUSOWz7ta
	XoMC2aQq6P70PASEP+5bCDhEejwVOKQzqsXhKqYRkofl5DJysi4XgL1GT2w==
X-Gm-Gg: ASbGncs3PgzfinGAiYMYWI2mZA99Xn8ioElUGYThR/fYB1c/36ltDp2uDb0Sb2ZBSoK
	j4EdbnAxf8XU5y/8hCpxwUsu4MIL4ve/XoXdCgc0wKzFQWqlA0iJUizVsu0FHYe25Diqy4P/MR1
	51xog/nqUv0m9DU+Ey9E9+Sh0krT9hzDXEd5Z5gNLCEuHRVfk7X/+zYzGBOWdVr0gae2Hb1yzHi
	hHGCBycRiXh5yW+0l48dozVl0xN1cANPUUwJnW2zTowxqfytXOsikTydFvcGdJPGA70l4LgaVjS
	WVVPHVOoAfbbL0Vn/0K2csxe0BE=
X-Google-Smtp-Source: AGHT+IFTE4kkY8oDuTyU0JwlMBj0Hp150L5ddl1U+wRmCvIHSNJ+3Z5q9aY9yIm7uAl9rRZGAyGuOJtuvjOMAYlfU+I=
X-Received: by 2002:a2e:a78a:0:b0:37a:36be:7282 with SMTP id
 38308e7fff4ca-37a36be76afmr14962851fa.41.1762185081776; Mon, 03 Nov 2025
 07:51:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com> <20251102-multi_waitq_scm-v8-3-d71ee7b93b62@oss.qualcomm.com>
In-Reply-To: <20251102-multi_waitq_scm-v8-3-d71ee7b93b62@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Nov 2025 16:51:10 +0100
X-Gm-Features: AWmQ_bnzH0TpAGhoJr1R3tesTFaI7U48hH9uGbCfmc6L1UxxdFzOBxUD6y2t5Ec
Message-ID: <CAMRc=MfEgnmUXQr4U-919c5VLvW7PCduzS5e569FmqrtYvbJWw@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] firmware: qcom_scm: Check for waitq state in wait_for_wq_completion()
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 2, 2025 at 9:19=E2=80=AFAM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>
> Modify wait_for_wq_completion() to check if task is in idle state using
> wait_for_completion_state().
>

This is not what's happening. wait_for_completion_state(comp,
TASK_IDLE) puts the waiting task into TASK_IDLE state. It's not
checking anything.

> This allows for detecting when waitq contexts are in idle state and
> propagates it to __scm_smc_do(), which is beneficial when task is idle
> and waiting for a kick to accept new requests.
>

Could you elaborate on what benefit exactly this is giving us? It's
not quite clear from this paragraph.

Bart

