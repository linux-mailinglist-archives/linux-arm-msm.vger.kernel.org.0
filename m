Return-Path: <linux-arm-msm+bounces-35236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0589A67E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E73371C20308
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992261EC001;
	Mon, 21 Oct 2024 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rXB6DPGZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758341D0E22
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 12:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513069; cv=none; b=iX1YBCBZWjyH4x3yWiQFpIBln9jmQ2E4tQFsvVF3/VWYcUNWccFqVkQ1H2uiC71855kWjQPJrGYHjNbZxt7o6IGJ7kKo06AL0do92FtMHxTxucn52c87HfiYvwKab3hQMMUX3nR9QH5mm5ssXfFTb17xAM3lwN3HeEuZ13Ah624=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513069; c=relaxed/simple;
	bh=RJfSminkcXDG+GtAhfUy/vkLJjeK09zVdz2qabyle3E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vC2f+OjU7GjqGF84sw2nPPhCfFQ/pCbtQbz8fBmTpL6jSidOT0mz8HPlUCRA2JUuzf87NjQgSf5iAsIUHpJD7RWCdWozx9Gf31arnUzbMDyTKUB0/FpcVIkdEV9N8iPxG6RQVM01LqpR5mdH32VJOYj2JwLHlllPYGMAdzsZYhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rXB6DPGZ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so4455795e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 05:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729513065; x=1730117865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qj8L6W818gEgHt04vljDAKiaT7pf1UJVmBdDiPGwTI8=;
        b=rXB6DPGZSULdr+kasBEGYrM8s8DQBYDkMz/ShcP3eIVkl7GYiRJ/hwYnkRiR++wheB
         +6/PTwrH7VjPsGPMS/15EmFw8cLg1ncGVwy49bDP/hPv058nCVDJJ87FMVBQ0yV2mb0c
         2KrwPn0XsjjEuiBxPFl5ncwtVB3yXuBJ/F4Ysuj2ZfN9LYz1vvwl/mT76nbn3e1Aygmv
         TPmTVnMtt30tMfDzDOQf6O0+cbqVXUMdFwGTFs0xQSsYquoksQeqZenyVd8BKpIST12v
         TOIWJcIZiJmWJlAEjKSQ1iuHXYTk+XXZ1WJ/HprapbxHDlYKE/2k0MRBcFkuLGCZudBm
         s9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513065; x=1730117865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qj8L6W818gEgHt04vljDAKiaT7pf1UJVmBdDiPGwTI8=;
        b=MoWlGgeoohg3baGmLuJ/ym73S651FSgql5sg/4hOLRclyPpzbmO18c+rJ1dv5H0Bmz
         PzsIRpydqrSLvrSVopEwzzQbFN/v11tnf2CFakRb6wgC0ialNk8WRIX/QQqcelRy517e
         3wAX7db6H/NZnzDG9J4HdO2PoJMXSvb1oXh6Yxm0x7wFS002NIVnff/o3JdMzuI/nJzN
         /DCXahFaZ61nsj66wbv6/ALltsB8hjSxk6kiOUVXmWLXZPjqDLromWDwA3Fx8+I4kqJM
         w3n1QvMgK7DR7bAQP76BOA4jVuE7EanM86sJsr+M8Asa6I4X0DcsgX8RjcwD1QE5z7jf
         sKQA==
X-Forwarded-Encrypted: i=1; AJvYcCXwVsavv/yP2vdekCfDgQpn1uxLuaJ0ZRDhg54OdX9nGT38SQS/F556sN8U4p1/jRHAj//k+vR90f+wMJDC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+PuzC5aQK+UgZjeKsfnsSvJfiqbwEWJjs+Bgl3eDYFhYPALkj
	b05FqvFLLJJtXHfjC1Pye2Jmn8mNarditM/ZZWIQZ6qqly92WKz5osChtcyQ52E=
X-Google-Smtp-Source: AGHT+IHpSQ4XePG/buVw97pZjciV4B9MDvBfVGMO4z5/K6mvahYyTrgpo88vPai+GK++A8fXgd+WnQ==
X-Received: by 2002:a05:6512:220b:b0:53a:c17:a290 with SMTP id 2adb3069b0e04-53a15492237mr5085994e87.21.1729513065460;
        Mon, 21 Oct 2024 05:17:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:17:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 0/4] Add MSM8996/MSM8953/MSM8937/MSM8917 dpu catalog
Date: Mon, 21 Oct 2024 15:17:36 +0300
Message-Id: <172950935862.2053501.4807849758391227049.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
References: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Sep 2024 20:35:55 +0200, Barnabás Czémán wrote:
> This patch series add dpu support for MSM8996/MSM8953/MSM8937/MSM8917 SoCs.
> 
> This parch series was tested on many devices:
> 
> - Xiaomi Redmi 5A (msm8917, video panel)
> - Xiaomi Redmi Note 5A (msm8917, video panel)
> - Xiaomi Redmi Note 5A Prime (msm8940, video panel)
> - Motorola G5S (msm8937, video panel)
> - Xiaomi Redmi 3S (msm8937, video panel)
> - Xiaomi Redmi 4x (msm8940, video panel)
> - Samsung A6+ LTE (sdm450, cmd panel)
> - Xiaomi Redmi 7 (sdm632, video panel)
> - Xiaomi Redmi 5 (sdm450, video panel)
> - Xiaomi Redmi 5 Plus (msm8953, video panel)
> - Xiaomi Redmi Note 4 (msm8953, video panel)
> - Xiaomi Mi A1 (msm8953, video panel)
> - Xiaomi Mi A2 Lite/Redmi 6 Pro (msm8953, video panel)
> - Xiaomi Redmi S2 (msm8953, video panel)
> - Motorola G5 Plus (msm8953, video panel)
> - Xiaomi Mi Note 2 (msm8996, video panel)
> - Xiaomi Mi 5s (msm8996, cmd panel)
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: Add support for MSM8996
      https://gitlab.freedesktop.org/lumag/msm/-/commit/daf9a92daeb8
[2/4] drm/msm/dpu: Add support for MSM8953
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7a6109ce1c2c
[3/4] drm/msm/dpu: Add support for MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c079680bb0fa
[4/4] drm/msm/dpu: Add support for MSM8917
      https://gitlab.freedesktop.org/lumag/msm/-/commit/62af6e1cb596

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

