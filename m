Return-Path: <linux-arm-msm+bounces-59267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F8AC2A8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 21:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEAC9188AC32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC30681741;
	Fri, 23 May 2025 19:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvI3RPAE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492782AD1C;
	Fri, 23 May 2025 19:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748029605; cv=none; b=eQ+S0oC3z1szPAyOdBOdvqNMVF8jAsXr5EN4tL1KzP2wjrSZsogbmLP2MXVW+LTdEBoPsReA3sin9DFAv/ueUUWc+utk80CcmxeWjwf/PRBzqycIqE+DuNlSXLaWqQOR+g3ULB2oP+XNZx4aVzE6xBvJjvAY/cdfsJwUBVOVSgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748029605; c=relaxed/simple;
	bh=EqiLnnFd90nR9vg7bI6Zx6r9o7Cju6YX152X6CZpZyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUCZFEVJMqybWsBCsxcY0ebHKnigKjQsyTImQ9KQUOm1sgg6BDZP7WI1Ps1ClZQouFYQLzYwqrRGg7pBbWSwnE4SfyBCT64ZsAYr7RTjmtuSQk7ivYBM0vwRjV3eC98uMbfVwcrlZTTS5swQBZsFxmDaSO1M6gYh/1Wwl4ZcGV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvI3RPAE; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-864a22fcdf2so12905339f.0;
        Fri, 23 May 2025 12:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748029603; x=1748634403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH7Kc1vKStGhdLpNpPoNF5u+RXKK7FsevcMrcWkSN7Q=;
        b=UvI3RPAEQ1ZRgeg3NklzXn1Z3GfpV87yZLfLSkx4rVyhauJ83APWiGWCdf2QPhadbK
         5rVgGNXZkixB1yYFYakQ52zn9y/EqcIwtYZUnH5QZda9BJCJWPHKdLxoOQlAAIskrkha
         l6qsExv8TM8s2cL0Vj16fOHIYoxkXdojIOJcDSZkKKLFGK7ASgQbSzOAEIvGpLFJEddi
         K/LfhiBD5ikQFODo0qd4kWDr7Gf/1yAJ9L0boauPUC3ZmNESSjHGQEH+9ks5siWNRoX/
         n/9ERdRwsIcO+eBZk2E0QbwHDyqh5k0bbzjtoB0BWHkxQ4ZaTY9we30dkstrHwdDmPR+
         Kq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748029603; x=1748634403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VH7Kc1vKStGhdLpNpPoNF5u+RXKK7FsevcMrcWkSN7Q=;
        b=rh7Wp60PKn03qT/BiiB18HMsEGdjjmWgDVP/bC3eBHlqgFFrTuGz3jAREp5HbkwR/3
         12qyfLt0oPiDkKuZWaLJRzF+lceGaNNgMIrPOXyoRbNHb9W720s+sr5zCD8G7DhgTtrV
         VwVLPuSQcufOLKw6Z0eChl3H+51+qiDmCmXFtGpMQKEOvGZJX+V4cbstAZoxkUaviJQS
         AkqpI7sYArrlnMU3to8kCXynehR6uaKnHc2OTys0OsF1PISOtbQyFQv+y/rp2Mq9DBpY
         JSnYuLoQL9OlcYZaJI9yezqTYh41nXxzNoH7zqVeowC4785QROU+nNbCHEPlveNXJjIu
         YP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+1+njV8BnE8UCpM8ayXyvf0A9Pk8zPZnWxtta2erRefx5QIzd3i32/LQsuGspVmddnU3pljzQI/axCbh9@vger.kernel.org
X-Gm-Message-State: AOJu0YwNV8bISdZHs74QjXEbBY5fBqNHxDy01+oz/YuIw6DEK1dK+UDO
	u71JIKwpU64B5F3yUO0ABGeJETdhO9NNhZG207Bwm6TEqwaZ3ptQFeYvPQjno4YifVpt20EMlyd
	DjTXlw87xVxnZFgNQs17uEqXi4DJnItk=
X-Gm-Gg: ASbGncsh1KLwyXf7XyUiDluvfq+f/N+qVJwd03fFx/D5O+r3KnZcDTwEVRLVGxNmgjs
	bYG+6SNVfctnC2ryiDm1f7rwvdcjJom0bDOBEyM4suOai/TzlpNSjOZm6JkXPRBVkUp+i3xZClG
	Cmr1+kQS8Bk1JtV0eJKlL1y7rf66WyGa6aM+onAaFhMlETK5KGsd7G+fI/blGbins=
X-Google-Smtp-Source: AGHT+IGMftXo7Njr6w4K8Mw/ol29QY3aQyQ3p5YvAHE41Swza7DaKB+7+kOazksjYArbPCUaJPhAn6qMbwvTwjqEZiE=
X-Received: by 2002:a05:6602:36c5:b0:864:a1fe:1e4a with SMTP id
 ca18e2360f4ac-86cbb697f0cmr97966539f.3.1748029603262; Fri, 23 May 2025
 12:46:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-maintainers_update-v1-0-0396d439d6af@quicinc.com> <20250523-maintainers_update-v1-2-0396d439d6af@quicinc.com>
In-Reply-To: <20250523-maintainers_update-v1-2-0396d439d6af@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 23 May 2025 12:46:31 -0700
X-Gm-Features: AX0GCFtQq68cUClG56z1LQRDi-fNpHk0rCU3t98OHqV-tf8ZP0Lroq_Bezws8ao
Message-ID: <CAF6AEGv-UFTk1QmJtwr=_eP31wAOJF0ioS82i3LfmPF4arFb9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: update my email address
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-kernel@vger.kernel.org, jessica.zhang@oss.qualcomm.com, 
	lumag@kernel.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 11:27=E2=80=AFAM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
> My current email address will stop working soon. Use
> linux.dev email instead.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Acked-by: Rob Clark <robdclark@gmail.com>

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3bc0da6f9033be0d5da35210a84ba189be4e5c0c..c2244004b966368fd4084d579=
df934f1cf6c1c3e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7639,7 +7639,7 @@ F:        include/uapi/drm/msm_drm.h
>  DRM DRIVER for Qualcomm display hardware
>  M:     Rob Clark <robdclark@gmail.com>
>  M:     Dmitry Baryshkov <lumag@kernel.org>
> -R:     Abhinav Kumar <quic_abhinavk@quicinc.com>
> +R:     Abhinav Kumar <abhinav.kumar@linux.dev>
>  R:     Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>  R:     Sean Paul <sean@poorly.run>
>  R:     Marijn Suijten <marijn.suijten@somainline.org>
> @@ -20473,7 +20473,7 @@ F:      drivers/regulator/vqmmc-ipq4019-regulator=
.c
>  QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
>  M:     Vikash Garodia <quic_vgarodia@quicinc.com>
>  M:     Dikshita Agarwal <quic_dikshita@quicinc.com>
> -R:     Abhinav Kumar <quic_abhinavk@quicinc.com>
> +R:     Abhinav Kumar <abhinav.kumar@linux.dev>
>  R:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  L:     linux-media@vger.kernel.org
>  L:     linux-arm-msm@vger.kernel.org
>
> --
> 2.34.1
>

