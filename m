Return-Path: <linux-arm-msm+bounces-18149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D118ACA19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 12:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0B32283EDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 10:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5825413CAA3;
	Mon, 22 Apr 2024 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfWW2/38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F3213C9CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713780024; cv=none; b=Kvjl2+1PLgUYPqWZVTS52kX0RdtmYbUHp6z4EdO3o2UIvfg3Ij0vkeIu2AJjcEYt+Rb5AE1D9/21kRfty9IaKtkl6KE2yGGIhXCJlB3dW9Ziik9efsJ5Xos6vY51b/aZR7rX5yMXlEpTU8EbxVaRUdi9RyfwxvuJ+Ll+Dtgg0Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713780024; c=relaxed/simple;
	bh=2MYeFddZE6jhnGVLqQLIsG6n52OsJy9BifCmmy7rs2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7tRCGJe7HSnYh5vmmauslOzJSmGhHpWHzCGYT8fHm2xkIo8PGUTuPhkRLlpfBu9ISzQkBh5AKnnqkZqEuZe+bVMU72DSAWa/ust8fY30JNZwTkvKiW/tinO+tfXj1HVglrVXMAH7PJ4CQTfK/sg248IzWDEpxpzddZHw01n4UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfWW2/38; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so3126914276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713780022; x=1714384822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MYeFddZE6jhnGVLqQLIsG6n52OsJy9BifCmmy7rs2w=;
        b=LfWW2/38Ykb4CyG7PczDnGOjb9E2LJgR5FzC8b47bV5Mk5N4+sEohphTMdbb4bcC7O
         fgf8eI3w1kx8mKN46vO5mlm0Px3BJ9xkH1iqQ8glo3UZBouwpYU5H/6kBOwIzmAboUrr
         +4S5JcHJVhaUjdJ3OGRWB9zWLdta54aCimwMVoOn2wcw2GWFPvHlL0hNLN0GVCJ7/8iL
         eHmT3n2tXPlwoqqVHeE6q7BLPPX9e726LXc8uZ11DOLZKThG00+LtSqaMGtNfg8qx5kh
         VBf2vonEbDqZms8gJFWWpeh3EZwZMJK6jRbOiDReaX14F/lXjflMVhySPlAm8rCClOyn
         OTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780022; x=1714384822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MYeFddZE6jhnGVLqQLIsG6n52OsJy9BifCmmy7rs2w=;
        b=vl3Gfots2C8av14tclmvgTlS0GCpYzdy42WniOlbV6wHkgHihnhvQ9JtS0fysCtNX3
         Ggr4rX1toWRXaCbaIbNksPD9dPTAOXbq6oc1tQ/3Z7kaiGLoxYPmfgRdNdGfEV2R+Syn
         HZWK35KlgHqT3DSOLt42+t5ng6yuOC5WIeI2ntOymgNeP1oqNV70hgLiMbFVu7QkY7Iu
         0ZxQX6/aNx5dQGiCZop//UpfyjW8Au4p8jC3XHWXE95bYarmFaoqQ/Stiw98l7qUi/do
         qUX7zrE09APRAr0A3dr7a0hdZHpGxqk8dRuuq/huUofvKG0DxiuGHaoqi82YbBHPAuhF
         /pRg==
X-Forwarded-Encrypted: i=1; AJvYcCWhivW82ydsvknDd9/ZqiHQA2DhSQHaptuYomRhWSJ9Ps2uRpwv197V8LJMrCNMjMqYp5qhI2BAXBLpWS+xjsshTgGPqC88nyZVpVsImg==
X-Gm-Message-State: AOJu0YzU4D97JjG3GXrhFd/bJV0nXGvGDIktim+hnkP09LvMt14X1riO
	Sd7AGmGUnp9C1MrtB9IaZ+aJs14PVQUU62CqSTMP3USALkroaEvEdISt0SQvTAEIL29K5zmziYV
	zZ4TR4R9oJ79+zT/Byq+gK7UZKXB/QGuuo1id+A==
X-Google-Smtp-Source: AGHT+IHbBAbCSSKh+Ocb9jiNKVh/DB2SxHf3//CLOL1UZnbbdg1GJVfSWTlZKJ2zsSAoTdZErEZaPNUgvBoomS4y2UI=
X-Received: by 2002:a25:acc1:0:b0:dc6:5570:898e with SMTP id
 x1-20020a25acc1000000b00dc65570898emr7558121ybd.17.1713780021745; Mon, 22 Apr
 2024 03:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org> <57a99244-373c-40c0-9e32-9e8272c0c3e1@kernel.org>
In-Reply-To: <57a99244-373c-40c0-9e32-9e8272c0c3e1@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 Apr 2024 13:00:10 +0300
Message-ID: <CAA8EJpqzqfQCLCgj=G910V8Nk6b3adB0CTPPOO+G==+_=q5+oQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] soc: qcom: add in-kernel pd-mapper implementation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 20 Apr 2024 at 14:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 19/04/2024 16:00, Dmitry Baryshkov wrote:
> > Protection domain mapper is a QMI service providing mapping between
> > 'protection domains' and services supported / allowed in these domains.
> > For example such mapping is required for loading of the WiFi firmware o=
r
> > for properly starting up the UCSI / altmode / battery manager support.
> >
> > The existing userspace implementation has several issue. It doesn't pla=
y
> > well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if th=
e
> > firmware location is changed (or if the firmware was not available at
> > the time pd-mapper was started but the corresponding directory is
> > mounted later), etc.
> >
> > However this configuration is largely static and common between
> > different platforms. Provide in-kernel service implementing static
> > per-platform data.
> >
> > Unlike previous revisions of the patchset, this iteration uses static
> > configuration per platform, rather than building it dynamically from th=
e
> > list of DSPs being started.
> >
>
> I applied this patchset and... it does not compile.
>
> drivers/remoteproc/qcom_q6v5_wcss.c:243:15: error: implicit declaration
> of function =E2=80=98qcom_pdm_get=E2=80=99; did you mean =E2=80=98em_pd_g=
et=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>
>
> That's just defconfig, so I have doubts this was tested.

I usually do not care about defconfig. This was tested as the
built-in. I had the WCNSS driver disabled, never needed it. Enabled it
now.

--=20
With best wishes
Dmitry

