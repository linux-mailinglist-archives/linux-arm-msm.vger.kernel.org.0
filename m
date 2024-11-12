Return-Path: <linux-arm-msm+bounces-37612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDCC9C5849
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 13:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9317B281F19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9386F099;
	Tue, 12 Nov 2024 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+LxlPj8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CDC41746
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415792; cv=none; b=SEwdFLudUnSIB7L9Vba62JZDhd2O8me/vztuC+v5G5mSxyQmdFDUDRxGtXNpC3a2+vqTMlN4adukTWFTIX2pI8va2EymbEOL6beHbw5i0cmftFgJQZlNf2kvYyB/G0iNorB4HHsqlSgqAYw7OBo7T5tWCHZcHUTz1p9Py+PtnOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415792; c=relaxed/simple;
	bh=dJ9M97T50lSd22qj+iVkBVqwUlNtioHRiNrgs3PDWqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwWp8hh72QYVTL3W17T5vQ9sU3QUCDnI5DzkCrN72D7YWDAyX4+iylE3dG/TN5foJTdqJUoXFOHPW29APRts+YMcWRDnrDNUqrMrmi4Ca/MtRuIVQBhuTmnO1e2fI9yV65KSxqbU+WFDGprtmEnN4N6kbCVM+ed0ghSySX9IPRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+LxlPj8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3525C4CED5
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 12:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731415791;
	bh=dJ9M97T50lSd22qj+iVkBVqwUlNtioHRiNrgs3PDWqc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=H+LxlPj87beDzw3vZTDvo2A0Mf/qe931dgn1UDpLBb2ys4L7SXE0Lg7yJrGwHIWlf
	 wynpJuLuxxU81GeUiUFgLlE+cUTHwahWq8/lMmYl/5aH7IdZDdI5nGrWdHSxTS7WPb
	 KB1ghRUlgsIP+TYSzpT0e+b9dbZuKhCr4wYw+oziQQAaVT8wjpIx4J+3r1DMzihMDj
	 4kyKaP8mIReOgHTGMYx51NXWlQFbwb5fCe5YQ4tiYSpY43Ntd8npJU6Id4KVqTyXbN
	 JB0mWa5+I1kUq3AwtxIEoTBjjVpsWi6O0ZK6Np/ilk0EIsY26lvkcCczTfUV8Qvwxv
	 lY3pk51Seiu/A==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6eb0bdf3cacso16910307b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 04:49:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhDUHBCgLuVC5ZBdQO58psV3C9kfA4fpJJ/pFwm5hve0V4y1epM+iQahTCghk0WzFHzr8LxAF+sn84Jx2l@vger.kernel.org
X-Gm-Message-State: AOJu0Yy17SQthIudlC4pDZGrnAljYUhNX4uUtR0cVzOvUahe+wdB4LTk
	TmfYgt1wwrTEKcTcTJGv4gZba1icT591pP5KEpl4kXVDD4kK8UJZ6qtkF34nQShb/9CrnSHMSZ4
	tN/FVdO/vRNYpKl0ySWafg9MUnAg=
X-Google-Smtp-Source: AGHT+IFrhmd/G/nYB1NtcybnJnRF8PwwmRAoTlgcSaS6G+DFLZfGCRDwUMijJz1w+WZeBfKI7RYDCTO8SxxJSEREm1o=
X-Received: by 2002:a05:690c:7444:b0:6db:e1e0:bf6a with SMTP id
 00721157ae682-6eade40bf58mr133494877b3.7.1731415791023; Tue, 12 Nov 2024
 04:49:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a16c9d20-fddf-41ac-b04b-460b38db7d10@quicinc.com>
In-Reply-To: <a16c9d20-fddf-41ac-b04b-460b38db7d10@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 12 Nov 2024 07:49:39 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7B6ZHFW68mHZtZa0gp3Nbi2E1-MFs4OtHhyj-iqZUvJA@mail.gmail.com>
Message-ID: <CA+5PVA7B6ZHFW68mHZtZa0gp3Nbi2E1-MFs4OtHhyj-iqZUvJA@mail.gmail.com>
Subject: Re: [PULL]: Add firmware for Qualcomm QDU100
To: Kishore Batta <quic_batta@quicinc.com>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 5:18=E2=80=AFAM Kishore Batta <quic_batta@quicinc.c=
om> wrote:
>
> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3=
fe:
>
>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quic-batta/linux-firmware/tree/qdu100_xbl_s_melf

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/368

josh

>
> for you to fetch changes up to 01842da45df0a9f862098d1597f6ae5774b3e48a:
>
>   qcom: Add QDU100 firmware image files. (2024-11-12 15:23:11 +0530)
>
> ----------------------------------------------------------------
> Kishore Batta (1):
>       qcom: Add QDU100 firmware image files.
>
>  WHENCE                 |   7 +++++++
>  qcom/qdu100/xbl_s.melf | Bin 0 -> 1424292 bytes
>  2 files changed, 7 insertions(+)
>  create mode 100644 qcom/qdu100/xbl_s.melf
>

