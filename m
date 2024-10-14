Return-Path: <linux-arm-msm+bounces-34334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A3E99CAFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 15:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59DC32813C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FA21AA7BC;
	Mon, 14 Oct 2024 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KhEERjrZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0301AA7B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728911171; cv=none; b=delSjJqILB755sitcCmIEER1XmJNqf5uFKIFO0BWHpCI7vabBJS8ATuKS3aoCNgjs9bg2MKVUk8I3ZbDzF9vXs+VCSUWUy7LMIppuAy0bGrzGfiZKFzRha3RRYDWEqSp1oOXGafx0m/EkwSBWkmrKemmCHRrqOFQAU0MiYkg32o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728911171; c=relaxed/simple;
	bh=LCNS312XX8+QtPMLYe1AhAHuLD8/5nIRC3vEE2GCZXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZnkBuI0Yc0zx25hLX3iMbR5bgyvmf2BQ98CfsYqrRuFys/5lw6ml0p6n82boOA5GHqTC0o6/3ApCiyke0s187Nd5ULmlrJ97I9TK/6l/G5K3fLaXY3owVvX5swk3iNYJPK32PJX6kPmk2oJ+SxocmpopQmMfrWtW7aK4HBCrhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KhEERjrZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e1543ab8so3996249e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728911167; x=1729515967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KbDLhMcvfgwNdAQUxsq+9HS6SfLDbI1Cx605AIvkyo=;
        b=KhEERjrZHh1uVqqmefRgJpp5a5PqNEN/WVt5no1ccHX/QrZ1ow4DD+wjIWT85E//wD
         1aqRunAA+894XMWrAPBYAIKr4KEKHEnVVLKXlpRb+L3TLI8tkhoE0UPrm+obtR255dWT
         tovaEVJDvS6TXyYzk6KBNPR7xURY5Wy8zwL0dHwHbenCMafVV56WSEV5gl1uJIexgC9a
         bf3J8wEZTk/VCNaWAtrsaq0o9WAXPUXunLcnE7wirzOyRVSeXMuF4W1hgjKYQlVnoeVL
         pCcCQDECGRBTDybPAwBqIsN6tIswSOn2YZTi4rtmUE6JD3UN37F6NxfKojdBzfBuiDeZ
         M5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728911167; x=1729515967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KbDLhMcvfgwNdAQUxsq+9HS6SfLDbI1Cx605AIvkyo=;
        b=Xvt8VDbYXAO9Xfr6mSGGY4KsxaPAlYOiLQ4K6A6rCY67mlMRXgDvFXXqIsgQUxo7VL
         hrvLMMNo+jpRX0w1n+umn9KCpgjCVmpBX1mo2bhCPfQ+ve9lxZ5ymHkjzkaIsf+SJX6b
         DSyEyYCTDLgkotEaDbdL3egB6eAJr2HJypoT8ltw2d2Rmr9QRvK2rlHiah1u5QV003k3
         EoBrzRVbOFM29KOa1IYEufNsa6I29AYdVGcSh2ljSANjRc1Afn+E4bSFrCkFPlD5iGqT
         0UHkrgi21Gr9khwLIJTjHyrvgLcpEo5ZDQQ0R46AYrPp8jtlHGS4un00NH2bZFYfc6h5
         LFSg==
X-Forwarded-Encrypted: i=1; AJvYcCWfEpsWIk1kZdWQY4ZYqMXYq8NHEBSun+s8YMm8y1JLFh+2jrDsZTxJjYWxJhEAEkq13pmxq2mChbZtR0Ld@vger.kernel.org
X-Gm-Message-State: AOJu0YwG/DxdzUApszz6EDQzYhnnAI1FYF8FzAz/Z1LbaCPOYbz0Ueoh
	qWaMYfgWNWc3TQ2oUfEChmYInjK8T00RFXGptC3JeO1zGLznr6x2N01eqUtkVrGjDpPK8ndIJri
	aZepq58jGzluAo+hV5joykV9bNtLgpKKM6YmuCQ==
X-Google-Smtp-Source: AGHT+IEi9IXCmsD/OTpLrWSBlnQTF9y5K6Luts4kPNK9yagRWRstei7sNO9KfkZuBL7Rewk8E0uOpRK3pAasdzgDkpY=
X-Received: by 2002:a05:6512:1598:b0:539:905c:15c5 with SMTP id
 2adb3069b0e04-539e5521da6mr4247180e87.35.1728911167032; Mon, 14 Oct 2024
 06:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com> <20241014111527.2272428-2-quic_kuldsing@quicinc.com>
In-Reply-To: <20241014111527.2272428-2-quic_kuldsing@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Oct 2024 15:05:55 +0200
Message-ID: <CAMRc=MftQBH_d4Ew_5jdqqk1WpM511huWJH2ZDwnhXVYDboYLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for
 unsupported SHM bridge enabling
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Qingqing Zhou <quic_qqzhou@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 1:19=E2=80=AFPM Kuldeep Singh <quic_kuldsing@quicin=
c.com> wrote:
>
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
>
> When enabling SHM bridge, QTEE returns 0 and sets error 4 in result to
> qcom_scm for unsupported platforms. Currently, tzmem interprets this as
> an unknown error rather than recognizing it as an unsupported platform.
>
> Error log:
> [    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed to e=
nable the TrustZone memory allocator
> [    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm failed w=
ith error 4
>
> To address this, modify the function call qcom_scm_shm_bridge_enable()
> to remap result to indicate an unsupported error. This way, tzmem will
> correctly identify it as an unsupported platform case instead of
> reporting it as an error.
>
> Fixes: 178e19c0df1b ("firmware: qcom: scm: add support for SHM bridge ope=
rations")
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Co-developed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 10986cb11ec0..0df81a9ed438 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -112,6 +112,7 @@ enum qcom_scm_qseecom_tz_cmd_info {
>  };
>
>  #define QSEECOM_MAX_APP_NAME_SIZE              64
> +#define SHMBRIDGE_RESULT_NOTSUPP               4
>
>  /* Each bit configures cold/warm boot address for one of the 4 CPUs */
>  static const u8 qcom_scm_cpu_cold_bits[QCOM_SCM_BOOT_MAX_CPUS] =3D {
> @@ -1361,6 +1362,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
>
>  int qcom_scm_shm_bridge_enable(void)
>  {
> +       int ret;
> +
>         struct qcom_scm_desc desc =3D {
>                 .svc =3D QCOM_SCM_SVC_MP,
>                 .cmd =3D QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
> @@ -1373,7 +1376,15 @@ int qcom_scm_shm_bridge_enable(void)
>                                           QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
>                 return -EOPNOTSUPP;
>
> -       return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
> +       ret =3D qcom_scm_call(__scm->dev, &desc, &res);
> +
> +       if (ret)
> +               return ret;
> +
> +       if (res.result[0] =3D=3D SHMBRIDGE_RESULT_NOTSUPP)
> +               return -EOPNOTSUPP;
> +
> +       return res.result[0];
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
>
> --
> 2.34.1
>
>

The patch looks correct to me and like something that should go upstream.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

That being said, this doesn't seem to address any of the issues that
we saw with SHM Bridge and it still leads to a crash on sc8180x. :(

Bart

