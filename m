Return-Path: <linux-arm-msm+bounces-42267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF29F2419
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 14:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 830361651D5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 13:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C82418EFDE;
	Sun, 15 Dec 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XZzhGGea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0C8189912
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 13:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734268251; cv=none; b=HdD8GI4IbYZVwVqULxdRoi00Gi57SrjS3g8hP64ThdBZfGX5Wbm8Cg4HdMaRzFP+rsLd40ZcpI3jtNksYYb0fzF1Ll9SYyrL1igCs5P3/TeyuImb17Ag1Z4YsRyWCmWjVS/HAJiXLSu0oMGGQY53PljlLpBOvKX2yg/e/a40iGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734268251; c=relaxed/simple;
	bh=ADTR+Btsk0OAPsd0n8EjK45gpLwGQp7Pfzua9Ld7g2o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmBthDStm1T5KQWKuyrTATnTKsVxGnGwONLS+Tg6+FMpPzTpWfpyhKq0ibU3tutcvY33j1GJf9cAop7CDoUC+CbV+FcG/pIqSniF85t/Yb6nCrEcRr4gFWu5MXq5DojO4q4EoWYbRPWFMDLnd9AdQjz5QXxlcXGrKu3fsxQBBPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XZzhGGea; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54024ecc33dso3525811e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 05:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734268247; x=1734873047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8Lufl0ILgKZ9FP7Gdlued8m2MWHGsVjFWpSoKBOb0E=;
        b=XZzhGGeaimC7BfJOEBGfQh/b3U6eIC5ZUWGNQGFDiPclta80ooM1Xh1CcTDjE6T5ki
         31xLO7c+YJRRc+vC3fUnfnuauLpJTLIjs5bL3xa3/sRd/4LoQD2w+ee7fQd6cqE34rwn
         RCHhznIxzWsOBiqa/jvKUYW6l7aSOA50/EajRRLlqsjwPo3xU+v/GEljT5jDsngwvqer
         lEUlo3S37OUZ2oRwnt9dc5efcVIdPij6Y+D5OSIDZC688yr1RjmJij1IG6r8XOgNhSRR
         xK9qtOgXqtClqI1xPMp0eEPeA98LYJ2HiU8imaCue40pelTadC+8sCU7wbAgbFGlgsNV
         +Wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734268247; x=1734873047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8Lufl0ILgKZ9FP7Gdlued8m2MWHGsVjFWpSoKBOb0E=;
        b=VnBvELiinuQXNS0QURvaprw165ELCcBeHLXeDC8anHdYeREWPImTQ0ZSTnKOn0E/7A
         LoYeWid7hQ9m+A2ThxC068ndexKcpSm2cvlqSDh+qFElHr0/Zvq8vIXLqe5gvMbCRynd
         MxH9FW2LpyrbbX8KdXRNrIThXZ4cpB5Icdk+7MnB4gyjgJfh0B3sVfAcFBm6fbc6XwLf
         MyGpyYIcssHD6F1pQap2+Tbb/fdPp0ZULGWap0ek2iAWBUBAISI5bTwxF1x5iJzCFqLw
         ssO1xwgI+D8VGfHB3JIlyxqRYhHiku+0YTKL8Ne4kCoTBKRiRlUMLLGAST22AmoaqU+J
         1efA==
X-Gm-Message-State: AOJu0YxIhwaC2HH2zbAzGgj/JIofhIkbMLurJIMsmhQgpV+mxFoyzurx
	SKCGyofN2C7VPFMu17cHADcNxuV2Ebmf475pFtx9AAOinIEZnbSF/4mFjhjbbDE=
X-Gm-Gg: ASbGncvT2PgS8zdyBum/u96Bnm+7iN84eTzB3lmqN2UzX9cuYUin2bt9XfT1fbZ/uFh
	ubejrsPoPMnQP0cexmstBUfNGr9qUQ2cFy9iQwYfqvb78qQ8kSPZ9BbONIFWr1qtg89xXb+OBvj
	MYp61uGNZUusQVqMmm5Cw8mgZ8c29HGO/n/RipXiKuFimBS3VmKWAW3wbQ8nfdpUxlmiMXcqYbx
	aWjGwPYwv5VrDHba+rGMrdH+vQWVn74ADnsPk6ybg8yH2rqAHpQq68391WKIMTnbgrObV6/
X-Google-Smtp-Source: AGHT+IGqHIES4nMAi89BEi/1nE8BdUE7Xhkvgu1X5vkOxL6g5oVRbKfjkZ5/mlLOzrD9vjkEYsggXw==
X-Received: by 2002:a05:6512:e98:b0:540:2122:fae9 with SMTP id 2adb3069b0e04-540915e2c9emr3090946e87.46.1734268247484;
        Sun, 15 Dec 2024 05:10:47 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 05:10:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/3] drm/msm/dpu: support virtual wide planes
Date: Sun, 15 Dec 2024 15:10:40 +0200
Message-Id: <173426667305.2196979.4925128538148948458.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
References: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 15 Dec 2024 14:40:15 +0200, Dmitry Baryshkov wrote:
> As promised in the basic wide planes support ([1]) here comes a series
> supporting 2*max_linewidth for all the planes.
> 
> Note: Unlike v1 and v2 this series finally includes support for
> additional planes - having more planes than the number of SSPP blocks.
> 
> Note: this iteration features handling of rotation and reflection of the
> wide plane. However rot90 is still not tested: it is enabled on sc7280
> and it only supports UBWC (tiled) framebuffers, it was quite low on my
> priority list.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: add support for virtual planes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/774bcfb73176
[2/3] drm/msm/dpu: allow using two SSPP blocks for a single plane
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8c62a31607f6
[3/3] drm/msm/dpu: include SSPP allocation state into the dumped state
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d82c9281189d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

