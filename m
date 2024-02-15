Return-Path: <linux-arm-msm+bounces-11146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFBE855D49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 10:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACF48B3138D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 08:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F7C18628;
	Thu, 15 Feb 2024 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MB1W8N8i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA44171D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707987349; cv=none; b=MxBM9/rI9oGss5D4BgU5duJ3sxay1TCLj5+9OlLcdzawnpRQxfJQVmfWJVANFA9zs/dlarGJV2zh+QERGqLeGk94B1ZndD8DdpjSRQwkoj/wwcKZPBL0OW1Y61gCA/JTLpr53qy20JlSo0xYEr6/waz8at8Bz1vEFsIwj0hEj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707987349; c=relaxed/simple;
	bh=Uwkhg8nmF9a5jzbJDateJHiIVJm0VCqSJhr8niy4XeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7KuaYuNDvYKl95GiBotsUGp3mO2d0d3CcM7ASu8IRqdKUHcYdr5qANxnP5oZVgMXxGVmWOJ+6curfRWN68qow1cwdGy4dXEAlqlbydo+AmBOBSKYC1kbm8Pu3TjH51rLtZjEahLIVqJWyDCoRBFD+VHMxX9l9qK6kNEcrHPQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MB1W8N8i; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so1474716276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 00:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707987346; x=1708592146; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A6CQ+IRO32lNLtjlKEcSjvtD+crehBuMoEtTj27QIp4=;
        b=MB1W8N8iBsdroMbZia/9JI/Qs16puVeQEA1QcEPx2rzCL+D58Wrd1pFy31bsGmTrhZ
         wM5mfv9rHi9WoevrFcvHIR9uLmIOthUBItlynLmPTZDLZRnXFNUoEfsMozmcI5mlT0PK
         PJjuySoqtz63NWqpqRPuZ1yep6nxlEyfNpPKRYkfFTHzuvhn/JMhPzZVsd3c1+APMZcB
         zqckycJc+IHma4p7TwMfexXbgUuOFjQjFNHriBpA4NB8dUb8ZJ9QWrdVpqxno97F5eQ5
         j5YH4SnZkNXSfuCJTok6wYXepsph98G8bw2GV4e/C1aGKR1yLmOoEf6wSq1DgcJkxuhp
         vhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707987346; x=1708592146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6CQ+IRO32lNLtjlKEcSjvtD+crehBuMoEtTj27QIp4=;
        b=eBmrtnFHluaVw1Uvnfb8asGGV/NBj27QAFEvS3X0EIgTWwo8eAAUgBuqQFt809ZgFM
         TwFczIHjyImMwTdBHUXDjBbZYefQ3RLceMjHrKMiM+9klkJBoZMfbVhrzKVMwgCri7iY
         3AWG8j0bRERy3ZuM6DYMIzKY7L5bBC/q04CS07zsgbDd+dEDDI2FT12irMbc4JzMZt0W
         D+gtKAIExNypYR8+15xXFHIvUY+XYRbcrgdHPPamJVN6/IkVukvomYRK8b/pVht81nHF
         SiYW2AkrqRRWcgCSkQr0TlfaKsxyshYf7t5abYonlOkuVCVa8TrV/Dq180VgsqvlmuH+
         XgZA==
X-Forwarded-Encrypted: i=1; AJvYcCXj50B+vnDdgVHIioU/w6ejoXNcUepvccWuRb9XujSmLhFDOBKkLfwYuzqeMl+7iICHVEo6mv+oOuJANfsXZ0sJUdLOgIRTnao9iacLoA==
X-Gm-Message-State: AOJu0Yz3xatJUOOkWz2AP0WD3toN1XSjQ9t2SV67O4cPegxuMIK161gE
	LSSYA5jCeQ1TAdS3Ic30UqbJsfdfzyXy6pWmS0kj7qgYCwOZch1a7dxw26+RyE8ETUJWnJe+zAh
	Xm1YA6trmO0cQUArfiae9/ZGg7hP3dHIL+kzrGA==
X-Google-Smtp-Source: AGHT+IE4lbTZKhBywpPpsira5YbX/aKUOSR2Y7bKcNEGDTo00brA9daDt/YyPAL9VY6ak8GFW08RebDPlLnamXNKJ9Q=
X-Received: by 2002:a25:3c87:0:b0:dcb:b072:82d8 with SMTP id
 j129-20020a253c87000000b00dcbb07282d8mr3327167yba.15.1707987345897; Thu, 15
 Feb 2024 00:55:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com> <20240214180347.1399-18-quic_parellan@quicinc.com>
In-Reply-To: <20240214180347.1399-18-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 10:55:36 +0200
Message-ID: <CAA8EJppidULwO=PG7t9iZbSeK3v_=W_92s9sVyJ5Do0W9ja3Sg@mail.gmail.com>
Subject: Re: [PATCH v3 17/19] drm/msm/dpu: modify timing engine programming
 for YUV420 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Adjust the encoder timing engine setup programming in the case of video
> mode for YUV420 over DP to accommodate CDM.
>
> Changes in v3:
>         - Move drm_display_mode's hskew division to another patch
>         - Minor cleanup
>
> Changes in v2:
>         - Move timing engine programming to this patch
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

