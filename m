Return-Path: <linux-arm-msm+bounces-11675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9F485A365
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77D43B21892
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236F436118;
	Mon, 19 Feb 2024 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DD/0soRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CF73589C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345855; cv=none; b=kp4hOlxLDKCvCBU+WRPWXkXl6rEn5+Z45rScHjvWda9AQbKHSZXNX2IoV3uh1jsTm1z2wu23LCCcnv4tnONSbg9l1DtMY9MPNbURTm1Q8K0Iqi4U2WO0EL40Tx466V799NdROZ/JoE5db6ukmDydzraStZKC6y/han7aj8/1bgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345855; c=relaxed/simple;
	bh=jeszU7cS6hiWuSbHa6Gl/NZ+4dTstY0j8dyZDzSMMHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AMaRI7/ITi9bjW18nRehRSN9wQIqOAHycuoWWidt1MErnCNaEU41KSH5O6CV9WS3PmTkSMltaw9H0qBQdnYcrCH7DVJw9PUnZG437Z7wg3HtUz+dCftJzFyLVdSFHQ5G9LjkL/vGRsfsyILpzF1WadKNCoBRo/xgG3ZCCjNtuJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DD/0soRE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512b85d03daso438062e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345851; x=1708950651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjMb4d1hbiL9rkEx3BrswRg3MQUneLIxmtF5Ztvz0jI=;
        b=DD/0soREgkRoEVHbH3uBDuiSZYSKJgYJwTrNnESgIEibNkh05r1Zjxo1rs0cGdBif3
         /DchscPfxdI8KzJ/ld5j7Jei2PS0wdIgUSgwLv5Y46akKVJW9/KxkajJW77h3GHxAdz5
         aJhXQaoVFzTazdQuOqp42bHh81C2oskR4ya5kwW8o9JmHdHbumxtuNmlrFKjtWSltGbO
         fNIXsdO7uOQC81nvV/s8STrBxmftNDgHuXN0eBb7vZboNSULkzXWO4TqY/YE3dGUk65I
         aGq6V6j2COHf6DW2fJzaOtV3N40tIDNDW4qTxSm2l/J9xLIIopGJHaKCAFfxlG7oIy8y
         EB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345851; x=1708950651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjMb4d1hbiL9rkEx3BrswRg3MQUneLIxmtF5Ztvz0jI=;
        b=uJiZKL9i+yyIXd1kavLjF0wAiV3Dfd3VLWgNvGZFAlzDqd009oIz93tcHDHH+xuYSi
         0qwFX9FAVsbYlZ8c7Nc9/IvyLTaOXGR+Mb4iJGVzQ0bCa3ZMjYzE+ylPO/VtDCpddQWG
         JKKdU40zGAPs78UBrd/px67WX2yPjt7Rahd8EFoKEsBzIcM+G8rwOlH3AzD+DepCIW7R
         rnBYqCmnqmaRd7MhH2O0P0nNwU08Yof+4DMnvYo91e433L6ZiZPsXCk9otjXxwEZ3r3I
         XWUbLvSPlqjIJRYRKpfUTC1b15JgibGBsAuTW9ayT1PAogD8WNAvTfoQjLgX99eDlnYr
         ZCPQ==
X-Gm-Message-State: AOJu0YycWlNr+OMsvv1K/QevzpNeTWPiZf2NrOdnw4un7Ax8uPzByhRm
	2Zi7YdLAEDSbS9ntCarZ24MvGFMEz9GyKjYr5pMdx7SeWM560++WrgOHZaYvStc=
X-Google-Smtp-Source: AGHT+IFsnM5T1SLVsoU88JG+DcwZETnLSFkjv32tNAhdISToncKjt/6wK4uHEKC7yxoH4WxJY1IvhQ==
X-Received: by 2002:a05:6512:b86:b0:512:b39b:9768 with SMTP id b6-20020a0565120b8600b00512b39b9768mr955071lfv.31.1708345851583;
        Mon, 19 Feb 2024 04:30:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Replace dsi_get_bpp() with mipi_dsi header function
Date: Mon, 19 Feb 2024 14:30:39 +0200
Message-Id: <170834569503.2610898.3555817415070936483.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240204-drm-msm-dsi-remove-open-coded-get-bpp-v1-1-c16212de7e86@somainline.org>
References: <20240204-drm-msm-dsi-remove-open-coded-get-bpp-v1-1-c16212de7e86@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 04 Feb 2024 18:04:39 +0100, Marijn Suijten wrote:
> drm_mipi_dsi.h already provides a conversion function from MIPI_DSI_FMT_
> to bpp, named mipi_dsi_pixel_format_to_bpp().
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Replace dsi_get_bpp() with mipi_dsi header function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/99d519fed75b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

