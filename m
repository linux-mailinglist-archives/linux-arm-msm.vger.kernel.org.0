Return-Path: <linux-arm-msm+bounces-80143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF85C2CDDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 16:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CD1A2341C44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 15:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1BF3019D6;
	Mon,  3 Nov 2025 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="znpocFcy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F2423AB8D
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 15:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762184818; cv=none; b=f/DTvK1DtQr8+uBNtF824GdbvqO9FRmJCHKo2fZY/oxl2tsiRFa2lt903wnA2xi0eFyRZfzNt04MVj/SIPn0z13tpRmYvCDo4WkBx60pPMtEyBDrlYJ8qKCIrXmrDm504AH9qrWa2kVPTOZJEMQYBtiw8nyzvEIy2tIJ13VHQ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762184818; c=relaxed/simple;
	bh=I9fyilSv+BBiKKVMx658AqQIHyDJsv4UF1qfFI6oBJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPgzJhx/9tmdqGaM2s4wSQpqwr3WPPmKRbFLeN4JxfH9130p+6dUnvtt8CfB0KhGP2Xbwbyx5RoyPqmPkrZvJPDVVyVxb+RYWwvauBTbY/4OSyJzDXY6Uslj/xWCgu3POwQX1g5Ba9Y2NsDhKPYLFmxUcIlvHTKQjsgoebmrqRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=znpocFcy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29599f08202so17137725ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762184816; x=1762789616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2MHtJbnKG4Y1cKxUevHeLcjufmG2/9m4jUTZ+Gv760=;
        b=znpocFcyuowtWU5meTT53VwJTADcNH++p5MYoE88IQGQo9Ck5+1zDLy42Fbiy0gvvF
         ouc85ffFWJo24ZLbW8ay56gUelO5xXyaWlhB4c+7srydPI1Bp6UuMr8YM9+XMF+Sf1vu
         WXcSJpVtiWTufWCgcbbzOX6PgCSLRw4ube7RmD2Ao9VMd0pDk9FsM7JVZUqGoYnPSLVj
         SHNcvl3+RO5X60f+0tft6zny+y8Uvg1tHk/AcqpVqc3TAPWWuMErl7MipX4EsYM5jRUQ
         8Y+bSgNjAibFxnRnrBjvEwl/O3BKzxAUZyJ+Ki2hPWaqD6xtvOstn96o33KeYN6DqE4M
         8s8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762184816; x=1762789616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2MHtJbnKG4Y1cKxUevHeLcjufmG2/9m4jUTZ+Gv760=;
        b=KXyV8nQXWIdDml5QVOxmlg0YiW0Ugxm54fMycIPT8rhgUdGAuHlUGb4GtTj2fUrgPG
         w0WwF1RyMJVWO3spB5m7tlOJAQhZF9vSwreJbtCah/nSq3ufTwk+BlC4D2RObPdQboQg
         7TGsHGWECbhuhDfukadvfSyRL0rcrRxruj/AEHtpa4gxCXPYWxgqsycbEOhTQPBEIrXb
         UbIOtW3waA6f+vTkhmXJCwN3McTBlxdzl1903DDG0E8grnQy3nm5m6hVksLTb0cH6Abr
         dJ8RAT9978wAuYwXGe6oMpdlfGO8oNgJqqHY0H9B1x6wvuwy6MpFEev3+wSJto6wd1tH
         YkrA==
X-Forwarded-Encrypted: i=1; AJvYcCUYn6wcXjeQwqe4gNy6kp1SMnc9IkKfuWlgYDysHh+xKXbaJ2jhr2NkI40VtpCYb93LO/JpicYqvxgkE5Em@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5/KMVCMlKzfAsHCfbr6hjgHuGlm0K0NWZo83UG+0H/5DT5QFA
	nNCy9aRyIWseSGCiqmWY8cygBWZpoZb5wgheK+NNgucYTaGO4PQmYTM+yLzMjffR5nGYFx1a6tX
	o7d+iEUBQYWPRq4sZ9WH0NJTCfZ5k3hQWVfgipg32Jg==
X-Gm-Gg: ASbGncvrUhlvI0botlYLFrYpC1Z38muBRjSa7IJahzUSZ8X1QyDbbADWTQHKKSMn5BS
	j6kBXAoio9s7WRutcJe7regsxwHlu3jwayWEOOJgxojHn0Hq4oIOPoSutg6gsQ6ht7ReBYMKI9T
	G4OPmqpDDOyzUQDldQCfN01GCvsPOCMIDdd6VmUAQj9ZdJF4VFiYQuz78iIBaNx7A57fyW1KMe6
	XfrexpHMVD3b+/SqWTsBwHU1in/3YctMMXu+29wpnrHwzWX3zIsOIl0bFmqPxBBmJJ5zcU4UU1R
	w6G0uIFF3Ypnjxj4epcdgP/D/T4=
X-Google-Smtp-Source: AGHT+IEHcT4nMnHsVZpNXomSXuk/lGBQbjdeGw2Btvhh4nv0D+IGAkb7LgX6xKGUUqvDu575VUA7gnGnoCi4VeA8JuI=
X-Received: by 2002:a17:902:c40a:b0:295:54cd:d2dc with SMTP id
 d9443c01a7336-29554cdd5eamr138128095ad.16.1762184816049; Mon, 03 Nov 2025
 07:46:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com> <20251102-multi_waitq_scm-v8-2-d71ee7b93b62@oss.qualcomm.com>
In-Reply-To: <20251102-multi_waitq_scm-v8-2-d71ee7b93b62@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Nov 2025 16:46:37 +0100
X-Gm-Features: AWmQ_bmCR2WVQhkJBwAO950LpEMAQOHLxipl-BASrBXeNuZam9uVHcWhKApvvOA
Message-ID: <CAMRc=Mfh+WQx-vasZed6jWi5nUjg=K+ScVRBMCiFgK397=JbVg@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] firmware: qcom_scm: Support multiple waitq contexts
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
>  drivers/firmware/qcom/qcom_scm.c | 75 ++++++++++++++++++++++++++++------=
------
>  1 file changed, 53 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 28979f95e51fbee94b84c1570a4d88a76f72db4e..0b6efa7c2bdc25a3ba152c25d=
5451d1154779ddd 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -47,7 +47,7 @@ struct qcom_scm {
>         struct clk *iface_clk;
>         struct clk *bus_clk;
>         struct icc_path *path;
> -       struct completion waitq_comp;
> +       struct completion *waitq;

Why this change? This makes the name less descriptive if not misleading.

Bartosz

