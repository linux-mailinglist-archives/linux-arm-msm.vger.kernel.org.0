Return-Path: <linux-arm-msm+bounces-14408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2987EBFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 16:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69D10284068
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 15:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2A54F1E3;
	Mon, 18 Mar 2024 15:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AySasqtO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BAD28DD6
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 15:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710775311; cv=none; b=msALgKKHCQ4vd6KP4B8OULSJpTcChmXRIk/qfCjn1g59bXE+FjVUE9JRWYU0/gB++B3a1F5a3q/PVuNfhyTesP+tzlshnlX3AZqmlq+Ay3TrXKlmFevcB0yS66i6p7cxh6iTPCMT/2wxo7npYweJCHJA41wtREBt2JOd9GiZ6lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710775311; c=relaxed/simple;
	bh=fOMNZ9RkrucUBElQm7DZeJsg0EKL7/lwJeVNrUgtgk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WG9A07CHcFLqmEF3C0N8sXpOKEp4DhJ2Y1F/hwu7L9+83Kir7VGr1jzu0Yr81R66+mTGpAFXBFjVTvpaaFBzXt7PizZcrkPBeRLUcn49dgsU/Id4C5czNlhFzkMHpO3gNq84hFSOezFwSYuAGkmhsZNkXrahotTLdaqBTbsnTVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AySasqtO; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-609fd5fbe50so48093107b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 08:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710775309; x=1711380109; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fuDnp5FuC/P7zMV0CMzQ7SKWMn/6RKLauSf7pCwN0Ys=;
        b=AySasqtOQHI6gpMFxXXyF6Fgc01CJ/5voQ3SBktO4Yxxzsr8hnJ+FarTkeWrop1+TH
         mBcCEoEPZZEjZQJMLCuYA+Uya+Dmjvdo8FqdP9ECoYqeUyOxyS40EcX9Ii1DNfzZ8twI
         h7lcMiiYwZZo5qlS/Etq7PYdwQlO8H96Q4CVNqLgH9EuNKXrpZX2UGcmzfRx/65SpSK/
         zBlRn+AqvvxLI1laLI+ZgcEQf9xJIvyWlr1hhRp11f2GHEdMPJDqRvPGPxDj8MY9gW99
         HxECwPD89GAJeXh93w/e2kXoSWovuR3N9pcGFQLkLpNO+X+ec9N5DSptW4hpoUWfnmO/
         Nhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710775309; x=1711380109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuDnp5FuC/P7zMV0CMzQ7SKWMn/6RKLauSf7pCwN0Ys=;
        b=Di4y9X0ZKrsFfObBZfZ7KyvjRNxkiWwjTZgVbMp7oStf63XUkPO53AZncHBuNEX60+
         71x3NWzHY7MJez1kcX/NU/eB9JqYt5Qdr7rIFNs0dli9NPJ/WVtQtrVzzSfHDhSd1o5z
         q3RmrmIEvQRt5paqEyP7dMib7Pw/h38xvTNHIwn8uLHEiwdfOhVF2iXXrozMfQ/+MTRB
         0oUSPP3WYn/iFn2emiGKdbW1Rrncd3J5Gv4c9T8YWJOq000dtORDlC6rKM4FU7fozT3Q
         ZiqoNGn3k4cCCWtKIjmFGTD/wEfhCfV4vusEJS7tn/ZcLaRjQZLXGs48y5e8ZbiG9cue
         rBuA==
X-Forwarded-Encrypted: i=1; AJvYcCVKyWokDUXgcDUhvfPvuF1a8DrQpQ2liDdMPiVnRW1plxobAQr8bVzEKLzoRILldp87mx86G+k0QPVyfqXQTdUxOEBpZ6OeSC1vqkSxSQ==
X-Gm-Message-State: AOJu0YyESrHlqzbFomVIiQrmQ3BPdDrj4538FD41oyXHkJFw/UFoXoo5
	Ln5SYvPTCKsMAp60CCywVdUVrEhEzb1aKdjPSvTRoR4/aBR711LDTXFKSPk6SHpdGqqaYh2wwUh
	V4T5mrGqtMdJC2b7muN6cRjTcd3cJwUsUU/RG6g==
X-Google-Smtp-Source: AGHT+IF0vRwq0/LTZx5W4OOx+6BDAgX2Cv7pmp/4K30l52XoHIktLBjVZGf3PZvQhq3f4F6CP5ViSyfckOvjx94eNnE=
X-Received: by 2002:a81:8402:0:b0:60c:bda8:cd7c with SMTP id
 u2-20020a818402000000b0060cbda8cd7cmr11623167ywf.10.1710775309518; Mon, 18
 Mar 2024 08:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-fix-some-qcom-kconfig-deps-v1-0-ea0773e3df5a@kernel.org> <20240318-fix-some-qcom-kconfig-deps-v1-2-ea0773e3df5a@kernel.org>
In-Reply-To: <20240318-fix-some-qcom-kconfig-deps-v1-2-ea0773e3df5a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Mar 2024 17:21:38 +0200
Message-ID: <CAA8EJprT0d1gn-JbPRdXUz2iMAjxzX2_nKjMxZNG5dvtjSmz_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: Fix SM_GPUCC_8650 dependencies
To: Nathan Chancellor <nathan@kernel.org>
Cc: sboyd@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, bryan.odonoghue@linaro.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Mar 2024 at 17:19, Nathan Chancellor <nathan@kernel.org> wrote:
>
> CONFIG_SM_GCC_8650 depends on ARM64 but it is selected by
> CONFIG_SM_GPUCC_8650, which can be selected on ARM, resulting in a
> Kconfig warning.
>
> WARNING: unmet direct dependencies detected for SM_GCC_8650
>   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
>   Selected by [y]:
>   - SM_GPUCC_8650 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
>
> Add the same dependencies to CONFIG_SM_GPUCC_8650 to resolve the
> warning.
>
> Fixes: 8676fd4f3874 ("clk: qcom: add the SM8650 GPU Clock Controller driver")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/clk/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

