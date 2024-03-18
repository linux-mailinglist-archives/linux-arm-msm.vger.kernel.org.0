Return-Path: <linux-arm-msm+bounces-14407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2487EBFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 16:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91411F21926
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 15:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3AC28DD6;
	Mon, 18 Mar 2024 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8/RU1zk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13361CD3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710775293; cv=none; b=UfKTBobzIBOBKFuAbsPafrnj3EBmHIOAeGY34kcxWQZzInAGMlYyvudYfwEoU17VHUCnNh85NkOqbjGEnlCemtaBkHtBC4wrU9zp4ZELf4Koep+pNuUXV6mBIMHE/RURhiYz9JvJJ6TMznLRI2J48/g55QuPBVR1zzCtvg4DdfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710775293; c=relaxed/simple;
	bh=qYFnOCn6WDf/TDGMX2fOvjOWt1OS3MGMyadhL+gfoDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfpQlimhm6tVwm8aFr03qRZJNOtDc3GDI/d69wGLkyoOqWmfSZpasx64RUeHLQtxaiYPlJm4BxK9rHuiCuIn7Pz5lUHw72Si+uSYYSO/N3uMkp+UsTm7ZPcf/Zr7zyId4G89bHjjDYZjT2uQqI9+1ZurmrO6Yctir/exnYj7PkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8/RU1zk; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dd161eb03afso3773887276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710775290; x=1711380090; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hOVOG+zKU5pC1qctxxPXGwr2e/TIrZYm9xcdBAyBJDc=;
        b=N8/RU1zkpnJYM4Tcm7jCRKQP0ZfJS9cg1Eeok6KbjScryXhTEs3jmM8CVBZDSfcyTt
         byOgFbQjBo0sGS8flfRMBewxu8oT2Z28Jpp/OlS20Bdv9Xp2+n+q3uwAO1++bbmePSzJ
         c89xEPBuSvSOstryLDOJ6DzeTKJ5Zy99HsfVluYxIfFAfwCJyyWRJUoTb1V62IRCUkO/
         WCW8kKvGkeL4Bqzr+eztQz3o4lSSmQYkxj/Tw0jNuxyZqzUaezeieri9801EneFnncUW
         99fLKIo9gl7JKR4eWfgMZ57ZGBLMAfE4pDg12GoDE6VhYz34+L4H72BnGh+cAerb7Qfm
         qk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710775290; x=1711380090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOVOG+zKU5pC1qctxxPXGwr2e/TIrZYm9xcdBAyBJDc=;
        b=Vx45iIMCiKZ13V9YDbqptssDVnAyiAz1m5gCm6wWbQvKkGG29eGmVzf28aszU5YJuk
         lMjzpLCZMiriIZqcfLkVad10EobuHn5uP1/Zrehoy2STFx2O5sdPMtsdrvRhpIRt/LUt
         Epk198SBcSKS4qqv8NOqLZ4OSYP5sl7qCf1FnDUYCUfxdXkbAh2AMWK5yNonCIpJ/w+m
         V6yQiPuQpsoa7ykphvt9FmilOgzXBmdrzkiimfjoDuU6n4bulk03G4uTS5v+F21r5foq
         sDlunITNTdHAwsAzKWD59dedAcsCl7KhO46qmxpSkoU9xQ8wjCJIHrGqMlEoLrywEdLX
         tgPA==
X-Forwarded-Encrypted: i=1; AJvYcCXFVBeUKWBeF9xQSZilTpNqC3zMwXPBvQ52l4qG9PZmt7OKFsUp4eiH2unMdHK8e4jfCUKjQE/+AGcAgEl9mSJUA+y05DtrKHvS1JANEg==
X-Gm-Message-State: AOJu0YwdRd+YsZ8Egx0cLbgULYzHUu94Q9qdIizwX6noVWB3YL98nqIO
	CZTLPLS5Z8CI0QaOno4V4SHRPQmvDAF3FhZi1H+7+ca7cWH2UvPqxx42JHSDE1ZFZL0LcFHafOA
	7L/al/G7hk1T0cyFanXu7Ena1ttgQjdZ5Oa4Ixw==
X-Google-Smtp-Source: AGHT+IFJe43EDKmy0gsRwURevoOtqocpaWKI8M3F4/AHqWtzh9RYrXXwtHPYbESuPhxVR8rlneuVdtvcCGFvYumLYjQ=
X-Received: by 2002:a25:a2cb:0:b0:dcf:bc57:cd61 with SMTP id
 c11-20020a25a2cb000000b00dcfbc57cd61mr10785295ybn.50.1710775289937; Mon, 18
 Mar 2024 08:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-fix-some-qcom-kconfig-deps-v1-0-ea0773e3df5a@kernel.org> <20240318-fix-some-qcom-kconfig-deps-v1-1-ea0773e3df5a@kernel.org>
In-Reply-To: <20240318-fix-some-qcom-kconfig-deps-v1-1-ea0773e3df5a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Mar 2024 17:21:17 +0200
Message-ID: <CAA8EJpqxuVrL7_OYCAFaMM8bocpRHbqZ30B5=KS-7wUn2vH4cQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: Fix SC_CAMCC_8280XP dependencies
To: Nathan Chancellor <nathan@kernel.org>
Cc: sboyd@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, bryan.odonoghue@linaro.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Mar 2024 at 17:19, Nathan Chancellor <nathan@kernel.org> wrote:
>
> CONFIG_SC_GCC_8280XP depends on ARM64 but it is selected by
> CONFIG_SC_CAMCC_8280XP, which can be selected on ARM, resulting in a
> Kconfig warning.
>
> WARNING: unmet direct dependencies detected for SC_GCC_8280XP
>   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
>   Selected by [y]:
>   - SC_CAMCC_8280XP [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
>
> Add the same dependencies to CONFIG_SC_CAMCC_8280XP to resolve the
> warning.
>
> Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/clk/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

