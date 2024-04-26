Return-Path: <linux-arm-msm+bounces-18697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF7A8B3F89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 20:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE85B2826FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 18:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD0663B8;
	Fri, 26 Apr 2024 18:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X+/PgrX/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6244A23
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714157060; cv=none; b=rWC17qa8lp11i52JDbSXGulaXgNKFN+ecv1q2udiz9aZsE7mtpfmlTGJhGuRjhBk5+icu5+wkIPuE7fn31K73qhk0d6VOcveFueaxfOgAJQWyH0kqnPTBA9Hp9A3LDwOp3BxmC+be9aIvFokdIEhFgaUjlr54Xo70loVDYvfRno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714157060; c=relaxed/simple;
	bh=VO6FRrG21n/ml/pdIIwEve7aGeOZZBBkoQGNlRY0wdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATliY9XqpjXgIgR724rnK2WOV7qF4XEIimFeBbK+VJCXOUI6arnpNnvV/BsUCHl+CTn4FVlq4teS5UfmwzyZguw3VMavd1gpEZkx53Hti8JhnTyYMe5pVqi+Ary28fQwyqTp1d/zZ/zrwZVU3M/5eWbGEBJIBG74JP7NLh9kBVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X+/PgrX/; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-de46da8ced2so2803501276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 11:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714157058; x=1714761858; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WiA1UHPkUJSpPMTheghbL/TTPsSdmUdeU6jtU/WQ82c=;
        b=X+/PgrX/ZisgeqDkFiODYRd1fluO+R9DGxAf2/mGFNxANSs4nByRec3MdzDAJWeRpA
         7eYrrSVI7FlQKZj2sS/68FkKrfwKJQ1BF6RiC3+u14BOqwOHUXH9T5fa3wTdopt0vqrC
         8q955VZdXL0NCEtDXskXUbPbcR19Hmlmp/ZMb4dz1188fmXR21nDThQtlJ1TbNSNauF8
         ft99bBHfxv+MHiRkH7bFU/wi87dWGo3YOdtSAjbE9CrfQCK3lX7DwCmWy2lY0LQWPesL
         r0mIzl1HbGnZBuklNflLjs5FEwFSfOMhRvtE+xZ6jjz6dsOmMuQeaVvrfOK+PZvkXhwy
         houQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714157058; x=1714761858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiA1UHPkUJSpPMTheghbL/TTPsSdmUdeU6jtU/WQ82c=;
        b=o0qprIDKSysBk7ZqaNb4vG+5DK/FLSPFGNNHBjwhwx5MpaDmOPr//GKdz+49CVz00T
         mZ825eJJl5wNIejfl97AMsTtJbpVLFOJLi3LY+OSUK8I5rSrHr4bff9LY7b/74ej4K85
         hB6NLf8tayk/Z+nFAuWl+mXqOtni7frb+7L2zL8S2jRlBR2qp+TMa89vV2MDVCL35DWQ
         Dg7miEKhW9frjgmbWNqEr0oIYVLUPvq0ipQWEg0aGBCbs911mG5XvkW9vcV1G9WSj0XU
         mQNOkTWciuWwS0q0zdNLI8bJQnGTj1fPHLgD5+TyKZ8ZM1qojQIzH6GU/3+rTr4t5o5d
         ZZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhPdUmZoRkco7avwo9I6wvDNnby8nR6z5lZWyhZX1yMs42LRsQyclCgzKMgcnxGtQ+1qw9HBtMdE9Bm9YFGNYg2NKthh8yQMWie1kEiw==
X-Gm-Message-State: AOJu0Yxn2JEiE7UuXk34+wwv37YwlYhXohl6JtfmxilpD6nqGBpNvCjK
	xzbRip49B8ipTYjovXfD+gF/6hPJtERBsIVi2/If8pJuiplgyXxP7ZZuJUxZ5bFmoExFnzeG5cR
	TefYaj+tvAbUR4RM6E+uk0hRwbHBKGLI5l5ir4Q==
X-Google-Smtp-Source: AGHT+IH7mi4gG3qx/p/7EOM36O+F7q1UlF4E1n+3QC/o3z4uwxHQybEDslseHLh/YyOCPM7gvMVPXGWCUmmpBIpCQmY=
X-Received: by 2002:a25:5f05:0:b0:dcc:245b:690e with SMTP id
 t5-20020a255f05000000b00dcc245b690emr3787471ybb.40.1714157058089; Fri, 26 Apr
 2024 11:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com> <20240426-a750-raytracing-v2-4-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-4-562ac9866d63@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 21:44:07 +0300
Message-ID: <CAA8EJprn3P4CKABJcepGTthsASLEqiU4Es06YEoP-PmMRBrv4w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Apr 2024 at 21:34, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
> initialize cx_mem. Copy this from downstream (minus BCL which we
> currently don't support). On a750, this includes a new "fuse" register
> which can be used by qcom_scm to fuse off certain features like
> raytracing in software. The fuse is default off, and is initialized by
> calling the method. Afterwards we have to read it to find out which
> features were enabled.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 88 ++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
>  2 files changed, 89 insertions(+), 1 deletion(-)
>

I didn't check the register bits, but the rest looks fine

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

