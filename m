Return-Path: <linux-arm-msm+bounces-88320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81885D0C04C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 20:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BA9130123CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 19:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FEF2E7F3A;
	Fri,  9 Jan 2026 19:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot+P+qJk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054EC2E7631
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767985894; cv=none; b=kpRFJwuSHtEQVpzaEu3lT2ygicm/LnXH7wsFsO65WFplyHznE9KRlu5OiMquKS8tEAxZ72fdh/aH28Ku2FIoh+7yU5iAkz4rSqy/FPELFs/wobrIHewUPy1TjVx6CY96NHhySp6V6ClqLn1M1BrFnt1PVf4dXCpbp9Yxv5uBsR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767985894; c=relaxed/simple;
	bh=capi1eQmEYYcpeLmvuBwQLEqV5FUgPLgSckxnyAvCmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Da5bdRapTC9YpuBhrp15HFGyYBwx/zfjcyZ3EWbz4j2yi8zDeDO9mN+7Nv2s+LeqQl4sfV6VV10/Vh/jXQR3aUfBmv2V88F1exmSrNX4MlFiw7tCnqQzcjJE1/++bJOnIcYVHrC/iPW6VO/3KiFf+pLYkrZW3e8qji5XJbJ52a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot+P+qJk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a08cb5e30eso8597265ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 11:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767985891; x=1768590691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGucWZxG4H0oACzMuTEPVrhVqGkXJT23twyUUE6h0GU=;
        b=Ot+P+qJkdum0e34DsqVBc61PSl41WOeeRn6OxBNk0p2AWEowv27SmjdQ8KHZpBtNqe
         TJ969dHuNHTaVnNNkCyOk2lM2IK5YHzUhsjYmbMjvB1sUqqXun1R8RdiK3oM4Gr6Uhtt
         z/NsAgkZbHyAlobnv+g1K1b2MuBHlBaa8k1fknM5/EzD60g/E65WCDtcnqRnB8jGB8mm
         XX/IhoI9IliDMRW97y36vlr/L3/2YYGvs07bLqZ9n8rOU7mloHpUAR+ONsI4UYTkrJE1
         UXYU0WYQbKYZ+v2KuJ8Ci89uaBQn2I+YsmDjd9aZx1N5waEVLL3jH2upQHj4ynhOkczf
         HBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767985891; x=1768590691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jGucWZxG4H0oACzMuTEPVrhVqGkXJT23twyUUE6h0GU=;
        b=E6is6wDyxKFXTLuIIaid6h4++LyM6nN9oRWuukpX4L9eYadvtmYORJbLA7dpGdsz/R
         Ro+jUMuPpWLbeFHcI1p7n3uBnMtughxP0SRgiPus8F2dEPmBMDlWUzAxj2dAq+ma4UQz
         N0yD2+uFH9W4RFFqHENSmYENwuSLCTsgcERV1vI9+5MIsplcxGzWdDI8ssd0PsILMgr1
         f9PDsDdgU3JSCpdoBMQvrEGUwP4itSnsg8ORfBDkTA5VXxIT9BFa4fJ7k5peZoAmRWq6
         HtCqn0PGZ5dyGqxypEF/bj7EUzPiIKD5p3iZbZbqlesc4B6laaTmz4ALFONVMrnesJ/2
         WM4g==
X-Forwarded-Encrypted: i=1; AJvYcCUv8CwXwqh3IrVwyJl4EqIacEC2yuSNJc5cGQDgRwg5p3oLgmjIWVPR/rJUcLkSLplEQl8ngfUhUMMu5IqJ@vger.kernel.org
X-Gm-Message-State: AOJu0YydAxgiIywUxEeOAaC16UaEFWag8eFNSsClvmDv0e2sYF29PBfP
	uenr4fHaD2vBj4m0I8FKnY/KF2w+Bk/hIjCKFjwzy+qHhXXPYmfxX4drEDCnTZ373y8d6RfaCh+
	ynwOeRs/wd746giktQ9d6Q7gLcsXO0nI=
X-Gm-Gg: AY/fxX7hIzhIGfOQLKoUmYbioMRiyoEqePRJl4i+1SLpR0S/FF8Syvyl3/buECAC1oI
	vIfb9IECHdtr3fah5IdBczUUyTvqGMtxVBjoXMHSTn4yJ0WogpnLZxmgqyZyQZ7qtA27+Sa3YhL
	43Cv9X/8gpRityOKm+iZiG1bfRYhU2zlCjp+Xel/W5b9iIs0Fl/paDkz8tNzE/WZFoXMBUVZyzw
	yfQt758eHDaAUdpvt9aVEJsrdfL0I7ndCirzOttReSw2pN7H8VdQtAe7P8ayRpuSGQt1sY=
X-Google-Smtp-Source: AGHT+IF7dTGSqJqWZzwnIHslSdlw6WekSrgn4f0+hOUkO918cHCqTxp+XTuZOMvQz9g2tVbmrdlQKCQmnYtBYPnHFfw=
X-Received: by 2002:a17:90b:2e0c:b0:343:e480:49f1 with SMTP id
 98e67ed59e1d1-34f68c28ea4mr7819215a91.5.1767985890668; Fri, 09 Jan 2026
 11:11:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
In-Reply-To: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 9 Jan 2026 14:11:19 -0500
X-Gm-Features: AQt7F2qD5NQlHCyqdD_zHjmxV20bvOEGT_rKXFuqrKobJujnG-hNvI21StHEA5Q
Message-ID: <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 9:22=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> SMEM allows the OS to retrieve information about the DDR memory.
> Among that information, is a semi-magic value called 'HBB', or Highest
> Bank address Bit, which multimedia drivers (for hardware like Adreno
> and MDSS) must retrieve in order to program the IP blocks correctly.
>
> This series introduces an API to retrieve that value, uses it in the
> aforementioned programming sequences and exposes available DDR
> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> information can be exposed in the future, as needed.
>
> Patch 3 should really be merged after 1&2

No. The HBB value currently returned by the bootloader is *not* always
the same as what we use currently, because some SoCs (like SM8250)
with the same DT ship with multiple different DRAM configurations and
we've been using a sub-optimal value the whole time. After all, that's
the whole point of using the bootloader value. But patches 1&2 will
only make the DPU use the bootloader value for HBB, not the GPU. So on
one of the affected SoCs, it will introduce a mismatch. You can't
change anything until the GPU side uses the new ubwc config as its
source of truth.

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v3:
> - Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
> - Handle rare cases of DDRInfo v5 with additional trailing data
> - Rebase/adjust to SSoT UBWC
> - Expose hbb value in debugfs
> - cosmetic changes
> - Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v2-0-de=
ad15264714@oss.qualcomm.com
>
> Changes in v2:
> - Avoid checking for < 0 on unsigned types
> - Overwrite Adreno UBWC data to keep the data shared with userspace
>   coherent with what's programmed into the hardware
> - Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
>   branches separately
> - Pick up Bjorn's rb on patch 1
> - Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-0-94=
d505cd5593@oss.qualcomm.com
>
> ---
> Konrad Dybcio (3):
>       soc: qcom: smem: Expose DDR data from SMEM
>       soc: qcom: ubwc: Get HBB from SMEM
>       drm/msm/adreno: Trust the SSoT UBWC config
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
>  drivers/soc/qcom/Makefile               |   3 +-
>  drivers/soc/qcom/smem.c                 |  14 +-
>  drivers/soc/qcom/smem.h                 |   9 +
>  drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++++++++=
++++++
>  drivers/soc/qcom/ubwc_config.c          |  69 ++++--
>  include/linux/soc/qcom/smem.h           |   4 +
>  9 files changed, 485 insertions(+), 120 deletions(-)
> ---
> base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> change-id: 20250409-topic-smem_dramc-6467187ac865
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>

