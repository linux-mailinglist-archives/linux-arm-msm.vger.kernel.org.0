Return-Path: <linux-arm-msm+bounces-34353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC099D40B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 17:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3BA01F23B82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 15:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D9E1AF4EE;
	Mon, 14 Oct 2024 15:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ji/ScHZ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7040A1AE016
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728921404; cv=none; b=JDvdSRLlBHTXNkPhpxmbULY1fP1cAJwHCv+iuc/qC3o+q8mIlFyCEXNLz7r3QDwGLqnY764eADZfNpTtPq1QZiQfHO0OBHHfXH1fo3Q/211cDozQtfsojdeR2ODGtEWhOQlACT6IBRVjfZWIlzABYtMA+ADKVGgGzhJFjZaqlT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728921404; c=relaxed/simple;
	bh=PbHHo5NkxCIAhHxxNosz6EiO1+G/cFptBNu8I2yfy60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R0ZxGOhZeX5gK6CQA/7HW05x5pR/ICU5mkcJkVv78FnxkbV3dKhXXA2/3udsgeihxynvEkm8cg/HibhL4E0C6jOYwwMYrPlb7weuCH8/XndWOS+ZV/QxP/2aSeeoea8LNa1QWa765Mt2iKwS/1cqSQuNuIFwGRBuLUDAn7HviSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ji/ScHZ9; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e63c8678so2005253e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 08:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728921400; x=1729526200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lDudDK0/43d4Z7N9Z+/XaVR+3f/xGvlf/JVC+34lAE=;
        b=Ji/ScHZ9JdLkGRA+HJCbn8CvMBZwWOLPrpeMl2OTXmMjfiwF4NC8KYyNFf3/R/G5Ii
         JdfcU4jVnL3PljPl5ZKZYQmdZIVK9hJ3Yyypw1w1pStvJ2KKNqGZZ5s92bl89Vz0QCkS
         qk1dgQuxASicwjb4vysJ38jifbraBWc39YHp5YO5WYEiy7T536pE/LIbQht/J/FCFJyq
         dKMcimn/wdQuMUqSlFlayodptl/D3pqbvWeQJC3a7qiYZM6kjErJ0rbu4Rl4/KMeuoLO
         W917arkA049t6W1rpKlnq1I2oaOa9EZV2Px2Yn3uDHFL5rWw/GrShajx5iEx1jkt3qEo
         9kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728921400; x=1729526200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lDudDK0/43d4Z7N9Z+/XaVR+3f/xGvlf/JVC+34lAE=;
        b=tXwPPgPI5Olvjm0a/KfaWSHv/x23dZ24vYUtNp4bJTm+XDeM8WoexagiGD3PldzmcA
         8KGPtb6ta+K3XQ6FPCTy6ll89t5vV/10jAkz+12rk/N9vBT257EIDCa/J61CzOW/EPn+
         xJr3/Tv8oUV8oiNPAKbukTUYYcYM46eQ4gSd4SKhlAdWr05qXsEFJMIe6bj9OquHzxGo
         mYUueQz2bn5p+KJtgA2IXyPnMf2yfBoy4zFFDWZEr2fF3XszppLXKgd1QkuZs1moHCAG
         qlY5yg1WEVpxXy7YyJYVQt4lDF0JtdNQrOeBy9UNR+lUMc5NNvRdjHdPOslGfIjWxU67
         vEMw==
X-Forwarded-Encrypted: i=1; AJvYcCUoB0osXKk+wxcKIh12nDQzxlRDvNaqjVM7c8dQx4luQC65lhTjw8w88Tgjzm4q/vbjOytvdfVhsHfAf30k@vger.kernel.org
X-Gm-Message-State: AOJu0YybRM1hpY5xAT68Xg60Iz7GAkxBDV5VRl67TUyS/1qMN59Ljhpe
	YH/MT5ecE7m2nfYV0L3LbQOLelEvUnvGicswDnGUt7dADZokGMdkGxrQRjQHWC3mmnQeyYQiMw2
	ypq4DbkXbEiaDlkVWm6T7DRyJ4F4Bj1H/rGlziA==
X-Google-Smtp-Source: AGHT+IE+ZXs7dOrxKsDNzCmr6QC4qsHoQPFLeLElLsyDMriCOYdNYZk7Gf9I/GFd8xo0qdQL/do3JSPGT9kn43tp4+A=
X-Received: by 2002:a05:6512:2398:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-539e54e72a2mr3758293e87.14.1728921400266; Mon, 14 Oct 2024
 08:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
 <20241014111527.2272428-2-quic_kuldsing@quicinc.com> <CAMRc=MftQBH_d4Ew_5jdqqk1WpM511huWJH2ZDwnhXVYDboYLg@mail.gmail.com>
 <d00f0a6e-575c-4886-8e06-30d5d1c15d81@quicinc.com>
In-Reply-To: <d00f0a6e-575c-4886-8e06-30d5d1c15d81@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Oct 2024 17:56:28 +0200
Message-ID: <CAMRc=MeiPbtHUQgJ5yR2EZbqRTS30zeuNEsXcgKdYt2c-X=fZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for
 unsupported SHM bridge enabling
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Qingqing Zhou <quic_qqzhou@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 5:48=E2=80=AFPM Kuldeep Singh <quic_kuldsing@quicin=
c.com> wrote:
>
>
> On 10/14/2024 6:35 PM, Bartosz Golaszewski wrote:
> > On Mon, Oct 14, 2024 at 1:19=E2=80=AFPM Kuldeep Singh <quic_kuldsing@qu=
icinc.com> wrote:
> >>
> >> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> >>
> >> When enabling SHM bridge, QTEE returns 0 and sets error 4 in result to
> >> qcom_scm for unsupported platforms. Currently, tzmem interprets this a=
s
> >> an unknown error rather than recognizing it as an unsupported platform=
.
> >>
> >> Error log:
> >> [    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed t=
o enable the TrustZone memory allocator
> >> [    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm faile=
d with error 4
> >>
> >> To address this, modify the function call qcom_scm_shm_bridge_enable()
> >> to remap result to indicate an unsupported error. This way, tzmem will
> >> correctly identify it as an unsupported platform case instead of
> >> reporting it as an error.
> >>
> >> Fixes: 178e19c0df1b ("firmware: qcom: scm: add support for SHM bridge =
operations")
> >> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> >> Co-developed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> >> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> >> ---
> >>  drivers/firmware/qcom/qcom_scm.c | 13 ++++++++++++-
> >>  1 file changed, 12 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/=
qcom_scm.c
> >> index 10986cb11ec0..0df81a9ed438 100644
> >> --- a/drivers/firmware/qcom/qcom_scm.c
> >> +++ b/drivers/firmware/qcom/qcom_scm.c
> >> @@ -112,6 +112,7 @@ enum qcom_scm_qseecom_tz_cmd_info {
> >>  };
> >>
> >>  #define QSEECOM_MAX_APP_NAME_SIZE              64
> >> +#define SHMBRIDGE_RESULT_NOTSUPP               4
> >>
> >>  /* Each bit configures cold/warm boot address for one of the 4 CPUs *=
/
> >>  static const u8 qcom_scm_cpu_cold_bits[QCOM_SCM_BOOT_MAX_CPUS] =3D {
> >> @@ -1361,6 +1362,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
> >>
> >>  int qcom_scm_shm_bridge_enable(void)
> >>  {
> >> +       int ret;
> >> +
> >>         struct qcom_scm_desc desc =3D {
> >>                 .svc =3D QCOM_SCM_SVC_MP,
> >>                 .cmd =3D QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
> >> @@ -1373,7 +1376,15 @@ int qcom_scm_shm_bridge_enable(void)
> >>                                           QCOM_SCM_MP_SHM_BRIDGE_ENABL=
E))
> >>                 return -EOPNOTSUPP;
> >>
> >> -       return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0]=
;
> >> +       ret =3D qcom_scm_call(__scm->dev, &desc, &res);
> >> +
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       if (res.result[0] =3D=3D SHMBRIDGE_RESULT_NOTSUPP)
> >> +               return -EOPNOTSUPP;
> >> +
> >> +       return res.result[0];
> >>  }
> >>  EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
> >>
> >> --
> >> 2.34.1
> >>
> >>
> >
> > The patch looks correct to me and like something that should go upstrea=
m.
> It's upstream mailing list only. Please see :)
>

Yes I know, by saying "go upstream" I mean "merged into mainline".

> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>>
> > That being said, this doesn't seem to address any of the issues that
> > we saw with SHM Bridge and it still leads to a crash on sc8180x. :(
>
> Verified on qcs615, and qcs9100 by explicitly making shmbridge
> unsupported in QTEE and patch worked there.
> Sc,8180x is something different it seems as there's no scm driver probe
> failure and instead screen stuck is observed.
> I'd like to check this behavior and get rid off it from blacklist
> platform list.
>

Ah then my review is only more confident then. :)

Thanks,
Bartosz

