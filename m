Return-Path: <linux-arm-msm+bounces-13181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BC486F606
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 17:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B9272842C0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 16:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344495A0E6;
	Sun,  3 Mar 2024 16:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eLo/brN7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B136BB37
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Mar 2024 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709482712; cv=none; b=vGd0DfnTmkFx5azHimRR51iqwYVmLJ4aMiUPyxpAJOnE/R2ed79He/TmH2E3SFb2RIc3EVvxLCaAuUkeT6EPoNwFH3FXUFwKkf1vtyBeG0vhG1U01su9G0kLRa6T6TZluAb3Iwr3ml+kpYHPTFfu8a1VrrXjjj1cYK5rDzHi/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709482712; c=relaxed/simple;
	bh=5lbWX20jXzbZW13RUe2xknNtpt+9FhgCimtMs0ceGPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qmv7DaOP3Pk97yONoZaU2giWg8wHlS1Pd4AyyzkVVxgw7cLQTUdOW5ous4sF+l9m7x3ba9sgXgRf618ePRTefEVgPMTbHAFFK3DhTFLSR3WBiMSapLR/6G64FtAY4Rn8RHVwvNiaSJpoerz1K2H27a0OXUVnPQjGrfHFDZO4QPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eLo/brN7; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7d995bd557eso2346588241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Mar 2024 08:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709482709; x=1710087509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lbWX20jXzbZW13RUe2xknNtpt+9FhgCimtMs0ceGPE=;
        b=eLo/brN7mFBTp6q8PJNFot+TRAaKn8SbwNgFjudD+VLy61FCATcgnEq44dvkuMmzdN
         MR04XyNAMC02gwam8CPEIB/X/Ug0iNpmOKCj21YO+jODaSZathoePpP+x6aklzBDnhgt
         kx0xzB+PRczaFgEhgTpz9ESM+8DjazA1XSsd40SWVg3D8hE72G06Zl2Rk1x4wFR/NIEo
         JLuyolJozghgvaJrn7yVeFnNBcyAqh++uemRF1mvE4GEOzwLogZ3s10cpyB+8+LL7P9E
         A8b1OytcaEu9QapUY/ZQGPRXIY2N+nGA/edin78YaMajyaGJ3m2bEKB3ueY9qRiPvRZy
         W/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709482709; x=1710087509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lbWX20jXzbZW13RUe2xknNtpt+9FhgCimtMs0ceGPE=;
        b=k0rvdHzMBjd4OoFd7IfFZkF14PCy6NyHA2N/oLGcdui74v+71ITy2wuqpzBdZspinf
         xQt6cEfUKBNLYlCeqB1KNvnlM3iYRgfKYjQEKrXmgYT9MgTGRqycdeNgi2AzkjJSAmVY
         3m5lFwlxesO2B6kehDki/XTzCkZw+l2reLA8LPStMxKHm0QDtY11/GTdKdYVuSCgf+Sy
         zQ+r00ZR7rnS+/snSUCtOBzl1/qej33O59fpX2xw0JtcFadOlJwjZcbXxFjqXc76NEC5
         QTEBE7dDalevMDhrTlFAWAs6pHL61Z8K2KapxVz67DmUpV4zTX67Qe8Uoy+hYPLSU1Ut
         3YdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2sgN1IcUFTwgS7Qi5BwT5UlV6kP8lJ2UCt0BoAKnDN0mtTkW3cG0tPjyMdPYtruMoCD8Tdgxtk+hFjfxkQ9/qDxTBvtVds1D6pd1DA==
X-Gm-Message-State: AOJu0Yxac/JSCBy82kvFE3J+SOwp4IAtG9ttfAnlghdrx4rHKz4mDB4x
	mJe06anN1OeppZnyBCt/FTopAY6NuGAq2HDRXDfVS+abQiAtglBqv3n37kfO8BuGBFnkO5vFl4L
	k+HlLfCnTaiukmQs0YCURFfofL5nG2q0z+hLxPQ==
X-Google-Smtp-Source: AGHT+IGyI41WMKoAA4MXwCQXHx7ZlI5FvkVvX0A235k9WDLAqKjNndb2nYnp0LWOi3xwxYq9MDPxNvgoiiKypYmIo24=
X-Received: by 2002:a05:6102:559c:b0:472:a0f3:9c5f with SMTP id
 dc28-20020a056102559c00b00472a0f39c5fmr5276276vsb.23.1709482709397; Sun, 03
 Mar 2024 08:18:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205182810.58382-1-brgl@bgdev.pl> <20240205182810.58382-9-brgl@bgdev.pl>
 <yu5uhamdlygti3jo73ipy3gxhcmgxrm5g6imgqg6ksleim4ton@npvzlex2j4xi>
 <CAMRc=Mctm-cyYPpu-Vb+fr1cWJPUW49shaa9HEXYp+rkF_CHUw@mail.gmail.com> <odnisr4flot3rgwwqpjob3qtw63jow7hcj4guy6ao6spdz6fm4@wtcm62o3hgxm>
In-Reply-To: <odnisr4flot3rgwwqpjob3qtw63jow7hcj4guy6ao6spdz6fm4@wtcm62o3hgxm>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 3 Mar 2024 17:18:18 +0100
Message-ID: <CAMRc=Mezj4BQ=-4SfgdE6OmKX0X8+xedvroBNeaDeyqey4=2DQ@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] firmware: qcom: qseecom: convert to using the TZ allocator
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Deepti Jaggi <quic_djaggi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 5:53=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Tue, Feb 20, 2024 at 10:54:02AM +0100, Bartosz Golaszewski wrote:
> >
> > I disagree. If we have a better interface in place, then let's use it
> > right away, otherwise it's just useless churn.
> >
>
> The functional change and the use of cleanup macros, could be done
> independently of each other, each one fully beneficial on their own.
>
> As such I don't find it hard to claim that they are two independent
> changes.
>

This series would be 50% bigger for no reason if we split every patch
using the new allocator into two. I absolutely don't see how this
makes any sense. We're removing the calls to old interfaces and using
the new ones instead. The new ones happen to support cleanup so we use
it right away. If the old ones supported cleanup then maybeeee it
would make some sense to convert them first and then use tzmem. As it
is, there's really no point.

Bart

