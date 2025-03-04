Return-Path: <linux-arm-msm+bounces-50189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FD7A4DFCC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 14:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57A177A1C3E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 13:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6552046AF;
	Tue,  4 Mar 2025 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NUefgo7k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF485202F79
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 13:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096429; cv=none; b=kCyTXb6jRBbwdsuoOLebnDxP5oyTRJexSQrl5JJD2g+hMwuCl43gG2HYDNE91rh/NN3RGwsORqT+3xDXe4bMXJMRZbn92bCnNy75e+CTY+lYza6/nGm7/0+9uafb86eu2jolbhnZub2cRpblcqLj4ZYpYdy+Ly/FV8iXFNgPXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096429; c=relaxed/simple;
	bh=bPfPD93l7XWp4K+A8697cOeG4hODBPIveR4prBwHvnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=My2EUBVeKYwhnRw81G54Vo12TT0DSALB4Tgaqga3j1/cG0Odi5Y331P7JHSxtg3lgEQ9yOo4KioJ0bYV6Mb2sKCavHLdqf+oLkhDoWW6s2yS+uBTWw7A9f1k+FnmW5KaUtwOmX9Y1jCIEf7cfaD4eIS4YJiDHUhGKrDvlVZo7QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NUefgo7k; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30762598511so60521991fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 05:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741096426; x=1741701226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPfPD93l7XWp4K+A8697cOeG4hODBPIveR4prBwHvnk=;
        b=NUefgo7kHIk+4aFdgqDgTSFip5L2P1BdbtbOiVnb3neDYbdirwG3e5bniKbKaXoXxR
         27t5+yl4cui/jMEdOSG9BbdcxZO3elc2PGVV9E9oVfjpMmiFZiCWaeQZGV4D5Caq81nT
         Emjl0DNvlnBMrZVOT7eeu1tva+AKNl2jyodvwtmUftGwiZPBpi4MONrp93tEhGYBeS5b
         267Ccd2QT1/j8Wwbp74DGwzcTdWIG1sAbxESyFVhNwh2Tx87aAkHu30v/yHGmiAoGG6F
         L1Rzr3Ej5/YOG9wD/wuOn5VW2W6A3shmWcd1aHjUN1286LXfHq9SuOBCpOrjFs/jtNE/
         jUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741096426; x=1741701226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPfPD93l7XWp4K+A8697cOeG4hODBPIveR4prBwHvnk=;
        b=LzkhGCR6UgiIQTn0bOW5FXOdC8SiSFMz0ybrrxTiufrCFn1GCX3HPJldLsi3XM0SO3
         wsBBlXSsuzDatJV38Ozfb7NHT8fenuiEKcaKLvO4BatyD+CSN/XVeU5OqmvTdABP8RLr
         kV3Nu/GButwviPCgYHn4I1RP8e5JSUJKylM0/0BJtEzVAnNmvtfCytjEC8rEXt41e8uJ
         UkbTwOu4uUsYQvHpiQpP0JbearD/XDe+By4hOxWulWWy9ge80+IjgAgDGRmfnnfUmLS1
         Fk0J5Bf+lsSxMwxh1qX70irqVAFcHEiOXHrTdASyfp2Gl2+pX4fBTjZ/jNiw+pF3atQD
         p5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWnqmXD7yk2xbu2+ACy9/T6WEwQsnHFMxmYtMC92GqsxKa1YQuZTSrqDGHW6gpt/4ptwok1xHntOW5T2OH5@vger.kernel.org
X-Gm-Message-State: AOJu0YxBuPT9syRNGo6jCLSU9jX7QCbN5KGif82V5a2pcpMOJBIQkz2e
	KAzvNslAJ4diZRmQqvVlMnilXmnbTypwJti4bkYDPMkHq0/jvJ+Mrk95+wSOFKN3R9nygfoE8H5
	WvBL3XmrDfzr9y1E+ASJ8ZYdkbpRxB/Ajb6ZEtQ==
X-Gm-Gg: ASbGncuqZsMt2XIudr/ZdidpGn7yraINPJkJamB8jIFzFM3UIWMVpzEic99LO1W6EZO
	jWlThoa3DQ9Ipcx5LdFCkTUPuP7yY8ykC3VAqIWmysQ8gBCG2TQpRX4s6iit6xnCtw+Id6tdfRF
	DdrCJF6iloSgGKtbUabmsVviB1/Qdjf3p/6LxZRL6pWsoHBuvoRwvKxuNrHg==
X-Google-Smtp-Source: AGHT+IH0S2v41EEsvJXTKAOj3SfZ26o8r//LfcPgvdTehENLascdrE2cLJn81POKQEF9iSB4U34UjDsa7ZB3cfqLe1Q=
X-Received: by 2002:a2e:b8d1:0:b0:308:eb58:6581 with SMTP id
 38308e7fff4ca-30b9310e789mr74920241fa.0.1741096425972; Tue, 04 Mar 2025
 05:53:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-multi_waitq_scm-v5-0-16984ea97edf@oss.qualcomm.com> <20250227-multi_waitq_scm-v5-1-16984ea97edf@oss.qualcomm.com>
In-Reply-To: <20250227-multi_waitq_scm-v5-1-16984ea97edf@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 14:53:34 +0100
X-Gm-Features: AQ5f1Jo4X3PGLBSfl3KtFivfqe8YrWZi-sunmx5ghXII1IKVvNqLLxFv_MJbJ_I
Message-ID: <CAMRc=Md=QY-HdA0Tdpd3rh1pma8cCtdde0mv91TtG0ML8Ej_pQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] firmware: qcom_scm: Add API to get waitqueue IRQ info
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@oss.qualcomm.com, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 6:40=E2=80=AFAM Unnathi Chalicheemala
<unnathi.chalicheemala@oss.qualcomm.com> wrote:
>
> Bootloader and firmware for SM8650 and older chipsets expect node
> name as "qcom_scm", in order to patch the wait queue IRQ information.
> However, DeviceTree uses node name "scm" and this mismatch prevents
> firmware from correctly identifying waitqueue IRQ information. Waitqueue
> IRQ is used for signaling between secure and non-secure worlds.
>
> To resolve this, introduce qcom_scm_get_waitq_irq() that'll get the
> hardware IRQ number to be used from firmware instead of relying on data
> provided by devicetree, thereby bypassing the DeviceTree node name
> mismatch.
>
> This hardware IRQ number is converted to a Linux IRQ number using newly
> defined fill_irq_fwspec_params(). This Linux IRQ number is then supplied
> to the threaded_irq call.
>
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.=
com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

