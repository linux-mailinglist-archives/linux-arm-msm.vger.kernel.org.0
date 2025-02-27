Return-Path: <linux-arm-msm+bounces-49626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C33DA474D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5E647A5678
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808EF22F38B;
	Thu, 27 Feb 2025 04:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wif+XbA/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71CF22E418
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631083; cv=none; b=uW7QSoAYvMmpdcyooKGzM70rzo4wSJz2N76mMluZDQSl/O+ox4eDF+79xlXY0Qz0prbZnL/riC5vk04cHq49q0d0OAefFGYU/k/cNnOa+B7jDtIu8k9/p9wl/aIaiM0omudwpnGfjmbIMmSxbY96Z5R/FemO3kIo1DcrvO7IJhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631083; c=relaxed/simple;
	bh=dWNxMncDzzJUrRXPZy3Dx27/tlTILtsYWC8EwQlImeM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6ZtdO3BByuTQsyvfSXHM3YrcYsgZoK7sqHmnMaW7oBr0DRRYEehcgOeWgoUBnqGapqDMZepJWk0hHMtSPhBm2wKEfo7fRTgkk7zF8Qh21Qwv1YTnr8SNEcg8gUF4DY7lnkQbV72ScKg2J5rmgnxbsS7wYHfLJq16lkhF1WnagM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wif+XbA/; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54527a7270eso473026e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631080; x=1741235880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzmKzyqYbo3hawEWPEGsqia1eprcAJ4Ylg+Lj6WDtUQ=;
        b=Wif+XbA/SyCXOpBjX29yKxXCNFC/So+C9YmYbtUXaZyMKyvzdXo6J5z4kJamgbu9Tn
         MgzTK24HJ6C3u2VrNNc4nzy1cLgHWC+G8yHcD5mal3nuLVqO6LQhrVKC27OuhliOoRO9
         axhoRizPpW15zt0PllBmKfuKo19DgR9r55q66H2pWqfinfToP+24QGVJp4NOsuG6rbcF
         GQRIDERUxNnbmV4tZx2v7E9GE3bEgBPaEFN92tiWb/TRd18NDOu/dgUiqsz7NQpObGSZ
         kaWeXxSyAWHsxNqJLNZ2QOab+/lfkM246wHH03vfrwjromtRG81I5LDtitzaWjuFArmC
         BTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631080; x=1741235880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzmKzyqYbo3hawEWPEGsqia1eprcAJ4Ylg+Lj6WDtUQ=;
        b=mhxilDtyK+EOx2QKa083pf7T4UUCIQ/F1UUKUa8xmIG1KNDUk3LQaC9IcFwfvc4nfn
         mUYGQ5p7DIfCWQcfBHafbD/xO+4yfGV2MT7yG8IhlaFb8vCZQTdadaVVkKJG0R8qZAVw
         oWQBxmX80iELOYUhYc+5Q78LlJYNzUSuFFn0pGMYUS0eg2Bu3zgE/xYKxSSSJOvok+NP
         4iteF22IT7uDF9oUhxHazJgFQxp7gG+Qe084jhAxhJRF0aqpjKVdJXLwW+FFr0IqBxi1
         /4bd5b2IQjpXcfXIbkAkp5X6X6WjCX7XLztwAbmtEDw6CSksz1FhrFq2gXxGEigui9e/
         LwrA==
X-Forwarded-Encrypted: i=1; AJvYcCWzlQxsZLKlkqAEFWT9xCa8rJXzcRndUAJXPXweFTFL/a8/tCoLzI65o1hqHcSTUZesmKf84mmFDZwd9JFX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3iptrSSNufOzgw8tlZnVGpcJcqtOB6mMuKCoCPDi16hB+JM4
	PdmwuYxm+TjX3HWP4Z5KBcXPG/mbz+D7lBhVWMZKPGZsU4VkR337YabjY9wJHiw=
X-Gm-Gg: ASbGnctPAGQAin3FOnR+Y10NEFoVBuL6Cp5ipg1PLKe2x0zTn/OePSm6sb2tRFpCoJI
	v5iMMbe9BnppJTwgm2A9xaUcaVTmWw7Isz6ACoWyy2UaVBvt2yHiJls4E0ejkQMtyNHY8mMwyl7
	ZgikQiDWm584egHNv1HdjKrTXL7ycIvJp5k2oVS9X5GLp2ylAoFA2tFRbTLPaRM1Xslz+pe2lSj
	h6//ye5fzf2X7/6lUzhXTvQibfIjJBZ1EIB3v7bbQukVaX7RdS77PT3ToyauAK5nqPt7PXZvPQS
	qMSIdiBS6z98eS8qb/zB1psgO1ItoLhZBJL2ZLuWnQ==
X-Google-Smtp-Source: AGHT+IGJyfv5tGen846vyQRMebF2qwsXcYi2q7UIL/kDESpfQBWqyP/hiC9cUT0/ZbRg3Tu8CrhGDg==
X-Received: by 2002:a05:6512:10c4:b0:545:93b:30bf with SMTP id 2adb3069b0e04-54839259932mr11279171e87.41.1740631080047;
        Wed, 26 Feb 2025 20:38:00 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:37:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Martin Botka <martin.botka@somainline.org>,
	Jami Kettunen <jami.kettunen@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fall back to a single DSC encoder (1:1:1) on small SoCs
Date: Thu, 27 Feb 2025 06:37:31 +0200
Message-Id: <174063096235.3733075.3774428548713459070.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
References: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Jan 2025 17:23:44 +0100, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the Fairphone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the Fairphone 5.
> 
> By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Fall back to a single DSC encoder (1:1:1) on small SoCs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b6090ffb30f3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

