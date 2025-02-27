Return-Path: <linux-arm-msm+bounces-49624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5CBA474C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CE1C16FFA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC3E22DF80;
	Thu, 27 Feb 2025 04:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z49xeXAw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC86E22CBD0
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631078; cv=none; b=ftP8Z0XH1NtIxaS6RXyt5/P4vtsPbW83Ln1YsW68gU2LK2m4oOz6On3Kwy7FnX7D0K5PWkS8Vt+PwQw19W1u3UKujWYx2qFbCOtZTCozP0IVguZrXUcQ/wxFVu0c0c7UEjeSX7M/YH7Bxo5ffX1YhKcTSZqlBhAtTc+huf4jchk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631078; c=relaxed/simple;
	bh=3zyLLsNGRo/NqxJBZh+XUixvV4IVu35ZfNffeLgMl5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZUW/GRC95+9YUw/DpfCm+3unjmrRyJA+pCD2bLQ2/WzhdDByP+BW3D/8zveLDNToHOqu84kjxjzvnNzejaZKPt7UfcjuHLiSoR5h5jqCTcocPE4XJO8WfNI9C5gRs+B44drqdngMoVOUIULA2DUr0WVf/NgxxFRLoshWHTCxNgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z49xeXAw; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30b823cc44aso4834781fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631075; x=1741235875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6XslM7pJXykrnKKkRhn2NSz+JQLPJqLzjVxpIMfxMM=;
        b=z49xeXAw6ZvAzmo9xOklNM0NR68KG2z2RmMmF+fr6YEq10iwkPAOPGYw9qXejZC0LI
         1MjzxA9y2vuDaaxywLe59DcJsR4HiGU73ip+H7WvXyo4xr9BDnDztvFQoCCmuo972B3D
         jk3AvLQZkQ5rvd05prAkCIVveE1xrjTmupgfBmhc5JUl7LuTctVQQUhPynXSa8ftKkR3
         fzEVziH+9Hu8x9k/8BuXScVyCD0yTy5gC9R2r1gN9DAw1Ju1UWDZ2HOSTKrwmgi0fGhO
         k0m6+KOS+D64okD0l9qqMlLcpH6zO+pCILRagsQqtlxmXs0FdtezZ5hVJojvOLxgK9oV
         Kwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631075; x=1741235875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6XslM7pJXykrnKKkRhn2NSz+JQLPJqLzjVxpIMfxMM=;
        b=taziysjlxzGXYlUO8LDNmcpNfLC9zYFfwUEwesMAsiRNFSh/o3Pj9FPdFudBiEbV+2
         jlTC5Iu1IeH4JklcqQSMVAV1icTU3zULAHWUoZUYlR5O7Itdt977ZdR9LSlXh0ZTB7GL
         Vlf6VPTVY8xOZtp06XRi3PY+o2uBlbIG910Vm11eKflTPeqWhHUBtwIIOgAv3SJGX++J
         SOGqk0GvkCHTUmmOh9CEZhumMor8f0bUqMSD359f8YUU8F+gzRRXo2MJeMExagve4Ii2
         wx5+hRXVhle0DFLcByIz8atuofOuQvyBzajbyywRQZA8RxkzB5JHHBYxCmb9hrHlRKK5
         WGKA==
X-Gm-Message-State: AOJu0YxpvAjkPm4Wuq4CRaiyL139jocl0q2GdnmE7KZeiTXloqxJXxlE
	lE0QVMD8E1H9I90nCZJAJmDVfC7B4PFChP/ipMQVFQ5Wf7Dy6hsYdN4YZH+D0TA=
X-Gm-Gg: ASbGnctyVpVPCkv0j6MikDFJDJxUr9FzZo+7I8qHf9y22aS2guweqD89PJUB+XzmrIn
	iSc05Fng9LJHILAw1dZ21gna/ypxSrCs6J8IaLheqlR/CdQfp/TJvShfDSclHpuHvGWoIeAvJpw
	E39jMi7im/obwnkKGch3k4MHlHaxu0PYcwq82ho+MtGtT1lh1RiEOTfKZlfc8FzTrT0jwKfdiQZ
	lnzzzoTzjrcRBsDh/So2vhvFblsrYdYt2GMoSrOlzrYQuMuzU8gAQPZNJX17RXuQvwQoEYw51wv
	AIurvp5bqraCzwLRJ8rTJVgclEtOF3SSN/i4XEJfsA==
X-Google-Smtp-Source: AGHT+IG/y3BiL2mYCdzvxaR3HQ4vcwVJ7Z9hxPTuLMNoKwnf+P+hPCClI8k7cx+mmtTgSswFFHqxIA==
X-Received: by 2002:a05:6512:39c9:b0:545:fad:a747 with SMTP id 2adb3069b0e04-5493c56f259mr3879927e87.5.1740631075092;
        Wed, 26 Feb 2025 20:37:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:37:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] drm/msm/dsi: Minor cleanups
Date: Thu, 27 Feb 2025 06:37:29 +0200
Message-Id: <174063096231.3733075.12973526206464749561.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Feb 2025 14:17:43 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Patch #2: Update commit msg
> - Tags
> - Link to v1: https://lore.kernel.org/r/20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org
> 
> Few minor improvements/cleanups why browsing the code.
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks on error paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/709cc0620107
[2/4] drm/msm/dsi: Simplify with dev_err_probe()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d5bc3c3389d7
[3/4] drm/msm/dsi: Minor whitespace and style cleanup
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cce156257ed3
[4/4] drm/msm/dsi: Drop unnecessary -ENOMEM message
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b39e7014ed31

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

