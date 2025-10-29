Return-Path: <linux-arm-msm+bounces-79476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00969C1B549
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69577664990
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD25258ECC;
	Wed, 29 Oct 2025 14:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VfI91Hyl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F92561D1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747382; cv=none; b=QsPolHMu/edewnAAyTWpceFI74YaPpnyochWP/3hl0fc2WHaF+Wf99PPFkZL5D+3S7dDIr/8VW9V0bwk4rsfF81GuVNhfhcG1OfTNWGmTLTgbo921x9SjOsEjXj242bvHQM9320+gsU/IJVrJEV5jhDIt1giX3NNvjHU7IBvSIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747382; c=relaxed/simple;
	bh=fxXFc+EBgs0CbHlD7l9gpLs0cW/F7Jrm+Xjbm4AxTd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4JCXkBcl6ox8mi9xXGkh4yaRFfPwna/xHjzPxFY5CilekUj7kpCpcIfnNBIYS+WCr0hSeAi012yf5s3j5MPLbd2BVulsVgaj2Z4bLXtcTcbY2lmj+HNMPgQCQGa1vMkArszAk+RJ3vz9jYhB1jf19qdi1aHg6lIliMDAWy3q7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VfI91Hyl; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-591ec7af7a1so7341852e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747379; x=1762352179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxXFc+EBgs0CbHlD7l9gpLs0cW/F7Jrm+Xjbm4AxTd0=;
        b=VfI91HyljLDNhAorvxrWdPF96nhcw4Pjs5v8tXY++Vkpvyco/JJOIFFg4X4P/zbEHj
         RN72YzpLoBoNT0D1eh93kbslswE5bwuH9qT3Z7J5Sj6UvU6/2YMEDviqTRoe1mOidjCQ
         L+iYzYJ708OiyFvNuKhpoG8gUQbcQMJobAjopJUP1RgJU0UDKMr3skMgoPdRAvwgpC0w
         BTFvSCyteg0vdmJW80gW+1Hj66FG/4O2TeskrXpc4vUfYGUeNmCisNTWiDLO3rbUaYyS
         zdUWjtf9evKwChIdk80dlzGfaWNqw6rHrmfo4G6rsNLkEkPwaog2jpQJZM+I6Fq+78/x
         lNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747379; x=1762352179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxXFc+EBgs0CbHlD7l9gpLs0cW/F7Jrm+Xjbm4AxTd0=;
        b=k7X2ZrLyzXxE3Yw1icd8ppGerrhLXPOhT8MpzdQBRR3m4S61DsKRZpEMudB0jk1+xp
         OGxiFRQwWcw+FoJISS+NyJ3uhKCgAwBo5wvQewIIryEL9hprnZtU16y6kikmHn+LxJ9m
         YgvOuVkyitAi6VcT9A+IBG9k25sMWTVHoFMI/LnQC7TlCpt2tSyGlJy5tL8HT3+mtZcK
         iX8hv2O+ae8dFM/H+MMN5aPybe7h+6Jpo5xbuvYhQfqXwdoP1hENW9+KN8392g6KIwvh
         q4wujFZZUPwGgY15wwHLonpaZ2UkpL3FLwgpnS1dLB3C69C0zdG32AHxPoTcLSwck71+
         UFmg==
X-Forwarded-Encrypted: i=1; AJvYcCWAOVJPI9JP7kflEPsyDEozzxOcg6BshbAQ317w+f+BAcG/NhBIhBXbT6JCyWUKjKR2o4USjmniTk2MELci@vger.kernel.org
X-Gm-Message-State: AOJu0YzMNyxCfkg/LsO+OQJSpWRkCxbatldirqoY6KcS79A4QyfbilX5
	mkp663qz7aGb+/Oxx6Se0j6sVIhpNFRRrmb9N0Nfybt7VR7nqKOCbiRBrlGLzLcGT9YdGiooNmn
	E3yj2ScmaNOzMEEWf4UfVpKN3/G5Pi65E+F/Zz3lkPA==
X-Gm-Gg: ASbGnctkb8a1aWJGydbG4jXqTBAef+3oqhbEFDInN2IZSqm+adtViE9BHcpVu+QCFTd
	GpiFbHWghvCOupmIlpIoNbWlTXsFbDSrnpRXoGwaf1QYM+pTYN3k6ikmDApnJ6VTQ4Xh7Hvf03b
	A10QX7FFjoNd7Aihdg2igd/l5guSaiL+axiKnC32Cl4AOUzuL2eN2nLCrTa/HWMk1em/Yz+0Fz1
	BKU4yFy8OsPe/eVDcLkKT1SgWYWddyqdlPZ5FPMmWJT9MuWwy4d1GREKRKI
X-Google-Smtp-Source: AGHT+IEptPKEcoqPo9FeMod6gmfhfMTEIiCI11mAJ1ueOUccKAbx+gwAckHYFFXT0qvD476gN9amBjG+i5QCBGdt33A=
X-Received: by 2002:a05:6512:308c:b0:592:fcad:4a11 with SMTP id
 2adb3069b0e04-59412862548mr1117269e87.7.1761747378839; Wed, 29 Oct 2025
 07:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com> <20251027133232.392898-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20251027133232.392898-4-sakari.ailus@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:16:06 +0100
X-Gm-Features: AWmQ_blgtByvILsdIvR8s668JcbrTVKFsoKwNbfCowSDaWebFno1q0hjsKO5ZqU
Message-ID: <CACRpkdYrWJCD+A3u45HAWjARyK=MnfYCy0DH+Uba7JGUtkCzGw@mail.gmail.com>
Subject: Re: [PATCH 4/6] dmaengine: ste_dma40: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul <vkoul@kernel.org>, 
	Sinan Kaya <okaya@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Casey Connolly <casey.connolly@linaro.org>, 
	Abin Joseph <abin.joseph@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 2:32=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

