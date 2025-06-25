Return-Path: <linux-arm-msm+bounces-62490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B85DCAE8736
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 16:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CE011883C4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC3125E455;
	Wed, 25 Jun 2025 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3USGO9Cx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6DC25DD15
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863356; cv=none; b=raC2VBazeP/HbdDA6GnDJH1H1xw/e4IumWm3zvKgiWt1IY0iIeKuR8DEmRIC6Aa/gOTjY2I4YtQzP5tHWUwSshwCIcJsA+e8zdox5R58DKQLHfHaGKaRJjFDWVF5ZLuT1SP1/QzuK2fjjto/t9/FcG0SOND66qCB0evnT2c4RMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863356; c=relaxed/simple;
	bh=jrBtoywouXF/4yYfXz6f2gT+dZfD6qO0490nSXgTbM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQIEgKsCg5N1MOa/AmczIT1Ps7LYu9DsoX+tQGqKWArUGfFjQTD1S8O35QqT1zS4sefL/Xo5NT+R2FXLj1uysc9AObbgQpOoyCIZqo7CdHzzcKxlHFrdNsA2401/IlObKgAoddzhjH1SNkJlB8DxxULHOSm/phiinkXQ+t1V6s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3USGO9Cx; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553bcba4ff8so6845987e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750863353; x=1751468153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrBtoywouXF/4yYfXz6f2gT+dZfD6qO0490nSXgTbM0=;
        b=3USGO9CxYLwVCIgGOXUk8Xy6OtQJ5adXMT+EBIbjhWERKO2uu1V+R55zS5iP+qFi8+
         NK+nvZHlTHZxr9xYe2LBAIgMXH40zR/8rTUgbLNIWY+AnU6zwvI95ty3yXyXkXQD3VSW
         Pv9ZzPU7uLHKZzU411ISuf7tWJk+3qRSCVDjFAU1GR17T7FRUzcY6DRek7eANiv03KRa
         6KHnVewXrFAXXttVY83h7UiHaazMKQMQs7s/szhSKLjOq+E/4DY59Y9ewQcs296z099M
         BRcgpVE97GNy2bL2bCvuKQtNpoIihJ6fOaVsbxPNp2XY7QVush3pqB6d9R3Cejjl4sjs
         bZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863353; x=1751468153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrBtoywouXF/4yYfXz6f2gT+dZfD6qO0490nSXgTbM0=;
        b=FcBhzgdtLaAFyk4J9Rv6ZCOaFaFHF8IGpch3v+zHZRdSWMyYWr751QIWGrqMH11ym9
         bvqzcLYyFK8lG5xz7/uXsCP4YqLnlrXeNpEJmVaVPuPrx0CZwylMccFq9R1ab+UmV8Wx
         Sxj4kcy0CO9W9h/7Pf06L975zCNlojjhZpeL8RkAZaN8WnzoAWpBsMy++EgPc5U8ofw7
         uuH26aeqHNY53L1ldjxBcVknLJdhLvua/1bpBEdFIfUk+M094WOcKfNjUqQulnwTG5hL
         3+FkjOCGxMPDzVZ7EljWaroXxkRlUT8A6//bv5KfYeeJqT422/8DGmSw4X3OVpwh+2XY
         P4kw==
X-Forwarded-Encrypted: i=1; AJvYcCWb6gDCIQCMhXGPvCsE//UurGa+j3rbYdBUKCHLLAXyDZq9625nZCROCerJWUMuljR3qPkOr50dMsihqqwj@vger.kernel.org
X-Gm-Message-State: AOJu0YyYUO1iJzeaKxRmYLomcprpI9zUIMM87Vl0FhCszGbSN3dndVC+
	9ZRynP0YY6NVmEYfpIn7kvoGm9/LSGVtjomN7Z92dbUAaPoClD7gpsMATc/kqtsVlC3cpG71ToN
	+8nxD4FEP+RPYw1PdS/1fgTB6Ssk1bKbqxHQqdlVuBssYtBkWFOSOS9B/gQ==
X-Gm-Gg: ASbGncv3K8G3fuVeqczL/qTsVKVLRZAtW8yrRaf4kMVIQUd9SNBzujbfZavOcC5mOMi
	OV1Ukz3JFuXXkA9rM1jL6h3Xb1GK0NlfzTm2cn4yek0l4m2Ah63ORrwuePJ1rNtaDEXJloiAMsO
	5o5PO9vDHB2MBN+u2VfOy4b3r8HVVA6BwbqTuBoxje22v4vfeSvD7KxtN07sKsdb3uy/9gWIB02
	nQ=
X-Google-Smtp-Source: AGHT+IGAUq5gFTw7qUZjZn3rHuNNjUzgrTHXn3aPE83EdUFWdbkV7VelOsQBi1h7nliNA6yx9WJxaL/S6b9yacsmTDQ=
X-Received: by 2002:a05:6512:1591:b0:553:abe6:e3e7 with SMTP id
 2adb3069b0e04-554fdf5cefbmr1084123e87.47.1750863352960; Wed, 25 Jun 2025
 07:55:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
 <20250625-qcom-scm-race-v1-3-45601e1f248b@linaro.org> <efbe6c4d-cbf2-4749-8a3f-a69b2e4b726c@oss.qualcomm.com>
In-Reply-To: <efbe6c4d-cbf2-4749-8a3f-a69b2e4b726c@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 16:55:42 +0200
X-Gm-Features: Ac12FXwpw1VlRY373Rr5D8HNLBzbb_Agr5ioNTABVgBeHneEchkZKiZDcld1xlY
Message-ID: <CAMRc=McS2MceSr6OmZc4stVAmKd0=gAYUH4qCzZUDYQEYVFnFw@mail.gmail.com>
Subject: Re: [PATCH 3/4] firmware: qcom: scm: initialize tzmem before marking
 SCM as available
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 4:47=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/25/25 10:14 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Now that qcom_scm_shm_bridge_enable() uses the struct device passed to
> > it as argument to make the QCOM_SCM_MP_SHM_BRIDGE_ENABLE SCM call, we
> > can move the TZMem initialization before the assignment of the __scm
> > pointer in the SCM driver (which marks SCM as ready to users) thus
> > fixing the potential race between consumer calls and the memory pool
> > initialization.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> I'm not sure any user of tzmem ever checks qcom_scm_is_available()
>

Well, they all should, right? At least the ICE and fastrpc drivers do
check this from a quick glance. Also: every call that has more than 4
arguments will be an implicit user of tzmem.

Bartosz

