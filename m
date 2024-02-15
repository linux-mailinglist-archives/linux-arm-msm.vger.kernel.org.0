Return-Path: <linux-arm-msm+bounces-11148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C4C855D1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 09:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 498101F2213E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 08:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23F5175AA;
	Thu, 15 Feb 2024 08:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ONft8A2R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB4217591
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707987451; cv=none; b=ElRnsCiecgb76wQtlgFlIs69fRUK2VrGei454D6NXheBtkM+952U2tP6bR2H3KbYi4GrVpb8hAULJWR1UL5K5vhtb7uOITIrgtdfastoCxSRKFPkqtZgy1SX4EmMKNC5KJKKN3SFw4vEsG5RZTr5fEQtQqCfZWZcjiLOby5F1EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707987451; c=relaxed/simple;
	bh=gdmLnxhQOsykYEmZA05uUUFW7SoK3AppDKd9mrlEzAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syRZFF/D2JsJsNIGLwStmq/sb3Q4M5Dy09rGYPVJ8C92XznfUZvG2o80RRbiRlQuZIs2csMZmgqkMx+YttRp1WGQ5e1OKTRIYoMz7kdyW2bAXL+UWSAKDr6T9vXnNzVriyvQq6qwrkRlLhM5C3lUJaEV1gW7cbbPHwPv4An3hLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ONft8A2R; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso585941276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 00:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707987449; x=1708592249; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2LUKvvO0vO65OIaoT4uEDhTmsAFdJFekcZb965xfIYg=;
        b=ONft8A2RnJ4P3uky87Q1beqZRisPQh9HGhtxaA6nz8ep5rvX5TlJUW//H9053TCBLq
         i7a3rCuZ2dFAjPuu5uDI2xPVJVO5rX0EUkpGuENFeohGqJX/a/GRi369ViEbyVvjnp6k
         cz6gNr3hPpGXwIAloPj0yRkNKGsMBYs1z6aZ+d36c/SZ378fbx8uMlm2GWUBWvoBbG//
         o8/9yP3VkN6kVB8mZU6Q95omnp06BHmKOaDsVtP7OpRxrTgTOM0jrxzwcuFHjSLaPhEF
         iQI/g6hwk1aNpdWDLjSV8dFIoOsd4szKN0yOdirykgwhT4Re6e2HLEOUg1JBULP1OLHX
         acUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707987449; x=1708592249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LUKvvO0vO65OIaoT4uEDhTmsAFdJFekcZb965xfIYg=;
        b=lUI3ZTRXu3dQ8WvPcNvCF7wHNwQ+i45vY3SLEFg/UX6k05goUpNmTUqj50Sh1Y6AVB
         /XJ7uDqKBr+c4Z3Uu4XNiF475T0qndiEVEHpctIOhdXfxOfRJl8nZUbP6D+qhdhmk48M
         mc9QastMZ9WKrD4PbYPRec3UBGvW7BQKA5rjmtfnJbP4jrJKBJJzMgL9G2B7mafSnLm1
         /r3zXZ5TKMpyyieN1UfbZjFNB2QQ511gFBbaFxjMLwwoKjbbRPyb59cYlvnwjKv1e9I0
         +KZEk1K/leiK4TvM98TtCcORy+20fQfVDxCaBmp20pVo140Zbc5iogRHqExTksu7aXO3
         +rIw==
X-Forwarded-Encrypted: i=1; AJvYcCUwNXZKGb4wuM1D6u11gmkeXNvtT+4y84koCnJ5yewxuaM2Ak4m60B3zR1MZdQCYx4UKvW+4JFw+swMRCwXW3wLsO4CojzfOM5hRbhxYQ==
X-Gm-Message-State: AOJu0YwN1ouHKzcflc6//Ei6LWRltOGt3y7HM3WwB11LPhCuHjw2kJ5y
	t0h6WgN4p+zEU+r/cBVznGannFSvouanXGf6bgGU7W05Mn3ahH1vv17D6MV2o6Zk67BaGtgHSal
	/3UJMCch0aMLBpYI5cUMMbozW1fOW+BNWBl7b6g==
X-Google-Smtp-Source: AGHT+IE6RYujoiukOMbHJVW8RduxEYwZlk90aC5R8138xYHJnZgnxV3e7RrjwElTThc/Ul8MJqhkoqiAyBNezrx7DiQ=
X-Received: by 2002:a25:d68b:0:b0:dc6:aed5:718a with SMTP id
 n133-20020a25d68b000000b00dc6aed5718amr909613ybg.26.1707987448952; Thu, 15
 Feb 2024 00:57:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com> <20240214180347.1399-20-quic_parellan@quicinc.com>
In-Reply-To: <20240214180347.1399-20-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 10:57:19 +0200
Message-ID: <CAA8EJproQgakmQKJ2hKobw+53qSOA7tRw7-nCwk3bWQP=Zq+ng@mail.gmail.com>
Subject: Re: [PATCH v3 19/19] drm/msm/dp: allow YUV420 mode for DP connector
 when CDM available
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> All the components of YUV420 over DP are added. Therefore, let's mark the
> connector property as true for DP connector when the DP type is not eDP
> and when there is a CDM block available.
>
> Changes in v3:
>         - Move setting the connector's ycbcr_420_allowed parameter so
>           that it is not dependent on if the dp_display is not eDP
>
> Changes in v2:
>         - Check for if dp_catalog has a CDM block available instead of
>           checking if VSC SDP is allowed when setting the dp connector's
>           ycbcr_420_allowed parameter
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
>  drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
>  drivers/gpu/drm/msm/dp/dp_drm.c         | 6 +++++-
>  drivers/gpu/drm/msm/dp/dp_drm.h         | 3 ++-
>  drivers/gpu/drm/msm/msm_drv.h           | 5 +++--
>  5 files changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry

