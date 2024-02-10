Return-Path: <linux-arm-msm+bounces-10496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 170F38503B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9F21B24727
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 09:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F712B9CF;
	Sat, 10 Feb 2024 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="agezzqaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB12225610
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707558241; cv=none; b=CtADuAm6otsy96SlDrBvwJRr2l4hXRmCZaecQrfEgVLJ0ahsPEOdLeg+J6mbo7LL2PrgcZlkuaneeKLIropScAIOaW302zWLDVthJReICDSALz/xzpIVEq6SA5rejtVuX8lcjQXy/9mhJns83rCZuGoFIOVeUYdgtRKTqj1UB78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707558241; c=relaxed/simple;
	bh=zPS5ASXeJxmsZk5+aJtSTxHGAfQQfBhC+eveE5Dd6HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qF3o6zI+SZb8FHuxtlfoqSVmu+fYjV7VwT9DbVZ3BgOerOWT1ONEYaPKXgMR+Igkaf2wu1IJl+AJkvbjdRMXiD02LeI8hLgMnSs3P8ATaEC/khF/K1wc0xIylQx/PQUaj3b88WBBQL3zSnWCfD2SzoLUcVmvcyMebDb0swdt7T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=agezzqaQ; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc745927098so1521949276.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 01:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707558238; x=1708163038; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+RI3dWBvWyqq/yEA1r1jf7HN95TUMuR4sMgCLHlYNCo=;
        b=agezzqaQVddThfnPMW34K1oUFzZTa7qMs95Gsw/RMoJAOXP0EVKjU6XEur6FRzBNzd
         71REQpcNJqjndAKUO0o6qfELTo4Ttjw4/u9Kz/sXkTxuv+D87ZfXGYeeUhRXEOvZ1/YT
         Rway+hK/G39ljO/qTp1DF2LQHVUXZIaMjvbqKmhV4iZWyaCoZluhTt3BbYcBWoqSIzfk
         UlrKM7WNqwazsmpt95cPbGtF+14psbuPqbOCvuvduxcsK1zwzQho5sKpvjE6uJeGI6pr
         hBLqUBmGW0Rn2e7IKDoGmqJkVrm75K6qQ13cVFfTRVldAr1uS/76XjTQ6MxGq9rfpC5z
         VP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707558238; x=1708163038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RI3dWBvWyqq/yEA1r1jf7HN95TUMuR4sMgCLHlYNCo=;
        b=SrRBaXxvkv60xCwHcOJ6FaBFr/M0WsB2HPFzsnRAb0nU3zUNO5BguL+SXKAj3yHkZK
         mfNdWrZTKRqgKoP7q9RPU8vKujaIG/aKNteusIr5+mWgZ4vQFq9xDjosLB0GLrd02PBH
         82uJI4Y5q5lVF+ELPU65enCq46Nh9RlZ1f/UsnTdC03mdB5xjn+SPBm7jmvfI7vuyrKX
         xey7pCeA4auN74pFy0rD+jO+ZtT7VZkccGvHGeSNWZItuoQq589+O6VZsMalUnV8ZNvw
         idROD+wJNt/2cZy537BqDi62H9LubjHhAUoM2zcQ7NLblBB9g/1a8tz3kFuNW1Ok70rD
         6aKw==
X-Gm-Message-State: AOJu0YyLtiR1FbFyY+xIhMLGeZHnKk1AopNIbIZ3LlR/43Lzihl1QYAO
	4QTDNVMPIsllBqjypH8xDuHNgvhSFEqmK9nA/I2nqO1ZV80xLpEI8WpAWPH+Ga523CNbdXD/ZOt
	k7Yku5FTpjfjIMVZLqUuW84XFsKjJrWD0rdyuCg==
X-Google-Smtp-Source: AGHT+IGxEsODyIQpa3+puvUQSQAHWgFROHjBlYgNuoD0UH4Y1xDQcQ9joz75lQkRTpTguUXW4Z8MIDNAxAlhshGy4+E=
X-Received: by 2002:a25:246:0:b0:dbd:4883:44ce with SMTP id
 67-20020a250246000000b00dbd488344cemr1345322ybc.32.1707558238734; Sat, 10 Feb
 2024 01:43:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-9-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-9-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:43:47 +0200
Message-ID: <CAA8EJprtCLn2s3xj1VeOZ4-Ot79PGNfk2Bv8fqPLeGWD71+XNg@mail.gmail.com>
Subject: Re: [PATCH v2 08/19] drm/msm/dp: check if VSC SDP is supported in DP programming
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> In the DP driver, check if VSC SDP is supported and propagate this value
> to dp_panel. In dp_display's dp_mode, the out_fmt_is_yuv_420 parameter
> must also utilize this value since YUV420 is only allowed when VSC SDP
> is supported.
>
> Changes in v2:
>         - Move DP programming when VSC SDP is supported to this patch

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry

