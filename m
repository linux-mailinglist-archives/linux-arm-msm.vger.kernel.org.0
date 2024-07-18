Return-Path: <linux-arm-msm+bounces-26554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9331934CA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 13:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C9291F20CAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 11:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8FA137757;
	Thu, 18 Jul 2024 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkMErM4I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF27839E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721302639; cv=none; b=qqfTuYx13ZQ/Hj8grLndOHm7aloOb4LBOfQ09GatV2gXzrSDPXBpuy2Mu1VGfm3qAVFMq2gD/oK3EC5nPrRJL0HsrlJhi4Ky367ciHVDNLvzyq11598M881wHxA6xRbeanQiWzgOIbwTL92U8ipXs6g69zD4psj6I57NJ9jqrg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721302639; c=relaxed/simple;
	bh=BoeAl8nyM9Fg5cGLn2jKl97Er54CwR7pIU+BXQ4QSY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkOK6/dV1TY+AvFBmv4Ng46UGTR1REC338jJje3ymxJ7nkolREC9IZ8r4I4HgzZe0PcRwHqrVx1kL5jRKHs92tfbmp1rX34s7QC7FiS8iO2JF1ZG0rSf4CdEI183+fsDG4wE/qrOHP8xD/Q3e3bX0MlCOx1hxp8VZqFodwgKbWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkMErM4I; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e05e898f29bso651503276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 04:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721302636; x=1721907436; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gme3CQO/Yqxtuaji/DB7S+/smdWB0CpFOl94tfqV2eE=;
        b=zkMErM4ILLdjmuyjp4OPVBWnhT+XjaXojADxvsnhqSJq1fTWR3m2NWbOEfAIQeB7Em
         p7Ipg+ztgqsO7vMIVOp9lbI8tSZ+S+EHgPi6Ie7wxij0mPw/fBPPaVQKw5RbHZZnkkaR
         7UOUBzKYUUUdDNAwRzTZIH5ZaCElRxj3WP7SiG6zn5jYb0/PrckkNuLQ9J/fQbrdiCg6
         WIMUylYEmw3APnOrgeUP6H85GPMPWjhLw6A7aTdqVFavI/yEwK+KLwVCwKNVG1Az+nOt
         vCQN4Tbt+HQuW/+V08vHFNvaEsaqgzZCiaUg/S/i5bPehYbBW7lnHGN75B6jU5yGuwxX
         hczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721302636; x=1721907436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gme3CQO/Yqxtuaji/DB7S+/smdWB0CpFOl94tfqV2eE=;
        b=luMfV+rq3T/6paJQQh0A7kFZzn6YgIbPzl+0sQknwMW3V5aVf1LZbfykHnUhG0/38E
         tpPgNhEJV7379mDN5PThfgmmWhWwlYdkApcpADuT2/jql/o9RXgzpZD+75PO+YojpSO+
         34lQzRIFkFOZDIJJnZ+1aTyCoShhFyPHzBbCWf+4qOAgP+WBXw/dL91UkHeNl/6hh8Ie
         Mblui273+qEKc2TsTJgrD9dMbvIoG7pjCANxayr8rPPr+ZdZM6wUz+1BK610akiswA4u
         aMzwO6nGNiglKuNtKJYnCUBtyWF67aWpP6OKYGT9NhUYhwOd7V4S2klHVOYaYCvVGI76
         X7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWi1SryK8J79Nze2qlJRExiGlywhaYBonDmvyni1ZsgV5L8+bTHqMwZY1P7QxupjEzNMlKHdPZKqcXwpr8Da/heWgDptZ45UiDX2jHwzA==
X-Gm-Message-State: AOJu0Yy/J2ipol0w8Wc8TMNypJA+IZK3c7vXk6b3vr/eAjLJ03tEYEWn
	Yi9a4sCFLAkKHBI3efuDn5kXB0ohqqwh4MlVGsPYMPMAnK0zWjvpPbbsmwWqoKfctp5oCirAUOK
	5wfi/7rHMl3OGmuXH1qPsVOMDSB/wUErX9IARig==
X-Google-Smtp-Source: AGHT+IEK2ev9QPtrBKDzVLlsCGByk6yC63CaBBDnCdtvxdxEVyPX1rKNF762+ltBf4iC5q9xlQzJcBiOhNNRs0Vycjs=
X-Received: by 2002:a05:6902:1502:b0:e08:56b8:e06a with SMTP id
 3f1490d57ef6-e0856b8e2ccmr638562276.26.1721302636459; Thu, 18 Jul 2024
 04:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1721300902-24242-1-git-send-email-quic_dikshita@quicinc.com>
In-Reply-To: <1721300902-24242-1-git-send-email-quic_dikshita@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Jul 2024 14:37:05 +0300
Message-ID: <CAA8EJpo4OijebJ9n3TONnB+huT3+VkZEE9LCHETV8iWAYZXsdQ@mail.gmail.com>
Subject: Re: [PATCH] qcom: update path for video firmware for vpu-3.0
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-arm-msm@vger.kernel.org
Cc: linux-firmware@kernel.org, quic_vgarodia@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jul 2024 at 14:10, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> - Rename qcom/vpu-3.0/ to qcom/vpu/ to have common sub-folder for
>   new firmware files.
> - Create symlinks for firmware files for vpu-1.0 and vpu-2.0 in
>   the same sub-folder.
>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  WHENCE                    |   2 +-
>  qcom/vpu-3.0/vpu30_4v.mbn | Bin 2306664 -> 0 bytes
>  qcom/vpu/vpu10_4v.mbn     |   1 +
>  qcom/vpu/vpu20_4v.mbn     |   1 +
>  qcom/vpu/vpu30_4v.mbn     | Bin 0 -> 2306664 bytes

Ok. You know that a single instance of the file had troubles getting
through. Now you are sending it twice when it's not required at all.

Please fix your setup so that git diff / git format-patch shows
renames are renames, not as an remove-and-add pair. Git does that
_by_default_, so it's something in your setup that changed this.
Please revert to the default behaviour.

This is how it looks by default:

diff --git a/qcom/vpu-3.0/vpu30_4v.mbn b/qcom/vpu/vpu30_4v.mbn
similarity index 100%
rename from qcom/vpu-3.0/vpu30_4v.mbn
rename to qcom/vpu/vpu30_4v.mbn

Also please consider using GitLab MRs or pull requests instead of
sending huge emails with multi-megabyte binary patches. It's all
described in README.md. And I think it should have been added to
Qualcomm internal documentation on upstraming.

>  5 files changed, 3 insertions(+), 1 deletion(-)
>  delete mode 100644 qcom/vpu-3.0/vpu30_4v.mbn
>  create mode 120000 qcom/vpu/vpu10_4v.mbn
>  create mode 120000 qcom/vpu/vpu20_4v.mbn

Please move files to the new location and provide backwards-compatible
links rather than doing that backwards and providing
forward-compatible links instead.
Also please use Link: tag in WHENCE instead of creating symlinks manually.

>  create mode 100644 qcom/vpu/vpu30_4v.mbn
>
> diff --git a/WHENCE b/WHENCE
> index 5e91462..876f562 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5942,7 +5942,7 @@ https://developer.qualcomm.com/hardware/dragonboard-410c/tools
>
>  Driver: iris - Qualcomm Iris video codec accelerator
>
> -File: qcom/vpu-3.0/vpu30_4v.mbn
> +File: qcom/vpu/vpu30_4v.mbn
>
>  Version: VIDEO.VPU.3.1-0076
>

[skipped two instances of vpu30_4v.mbn]

> diff --git a/qcom/vpu/vpu20_4v.mbn b/qcom/vpu/vpu20_4v.mbn
> new file mode 120000
> index 0000000..56cdfe6
> --- /dev/null
> +++ b/qcom/vpu/vpu20_4v.mbn
> @@ -0,0 +1 @@
> +../vpu-2.0/venus.mbn
> \ No newline at end of file



--
With best wishes
Dmitry

