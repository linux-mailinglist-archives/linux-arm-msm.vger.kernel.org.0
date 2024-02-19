Return-Path: <linux-arm-msm+bounces-11668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE31F85A35C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 705E91F2404F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5E932C8C;
	Mon, 19 Feb 2024 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QFXaElMx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24FD2E859
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345849; cv=none; b=RKvu7x28R95uJu/IYnKj0QLNaGwC69FM4FvUyFABWQxiRYXaYRe09PHnHNEtFhMs2lPdSdkoOG6UJo2ssLuH70tSR1zFKMpQjbt69mTltLgpGflrxz10sFW4RDPUfjI/mjcPD1SULDz24OIU/WVmCzts0oyvUSSb4BemTyZSxRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345849; c=relaxed/simple;
	bh=c5YyX00dX2XThvRQObEMhtqvJiujZIIMJDtM17U1JJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jN9Qwm7ESVRCxaSjqKJvsgfri+Jb9cct+zhuQy3rS+dPJG0NnjKznz0Yxw+p0ENHpR41E7khF512RjC0dzYKa7L/AOaFam57ER891SfVFO7nrTlvpuoJGWcvHxdDANttRLWmu9P7/IkKNT5Kxkw9Jlrr4o9XLn7BnvYNjDXzKjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QFXaElMx; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5129cdae3c6so2585843e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345846; x=1708950646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwFeD2TW/uU5GumRv4G8ieakQTAHSUrEMIKHabcQhzc=;
        b=QFXaElMxclHCdNmMtjUEq0jaTb7O7aUvi0kckOEX4DthphEpbKl8TxDfACpfD66kc5
         9aBXgY+VEVjZ3ndR8kajeMNoK8JFavcUXChasiIf0Uf/W703FZNY15OqK4PkyRDWix4v
         X0TuKaF6qoVqeTBq4mbXPDn1YwoCkqYmk61uzg1HYTYlR25uToKMkRg0KClPvjrnWM4O
         RVG5l6d/Nwor8L1Sl7W3pRECRdpgiScxMXH3Jxov8xRFhAQ1ugo4Nrq1bAaI7IfvJ7mn
         4zvLgsX4am1BNxZ5vpWP5zjFCupOtRuOYt99MBsZuVB0GtYBQii0NmX6BdBdNyQQ4ZGH
         2sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345846; x=1708950646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwFeD2TW/uU5GumRv4G8ieakQTAHSUrEMIKHabcQhzc=;
        b=qbsYNyhSFAhWq0uSlMt55VhTINX7eA9PVtVCZlO5LvUKBsKJqNycuxSlujZXjA+DsB
         hqwtIjXicytw1lKUP/BVHmbrA0oTfRSp3BlTPxyFahNdz1l3eXFrZXboH0Vy006KJ6qz
         KXHBrOF9r9oKbULEZRuct/3eM/42coiNNvIO/rEt0nqErFVU2FMuKDnULXJhXyYuN+US
         z8A2qsOv7jmhTA0nlbQ42mz9Yqs+EH3xMLSMmYkkkWWpFhvfeNlP4xnTHg0zFqy6mWFb
         YL9jUoQV23DCyVJ5HeBJhGI8nKTaS65dkLTSJGFTfGgxsUzwt22Y9mV1kJeWJ9Ti3FVL
         U36A==
X-Forwarded-Encrypted: i=1; AJvYcCXFcCoLLAoLezY+bQzQepdK8Dkvv2ciuuX4a4B5qTZZfabPKhu4zb0AkCXym3iXwppSFSABxntajsXxWlizscQfewqARGasbA795j708Q==
X-Gm-Message-State: AOJu0YyCZgz0VeGnIb0dQyhVBH2erG+m6p/BeAgn2c7p9NCWDv8JemRW
	leEdWy/HaFvq5F600oxAkCLWN+j5WqooLt5Gl6yXMecMEE/24obgRz6cE53Tqc4=
X-Google-Smtp-Source: AGHT+IGYJUPA8wfDjcJd31kJrR8PkED01i9VHPCaeoY4fbeqiJYl09s4pUBmXAHjIBppQ1CCqeCkiw==
X-Received: by 2002:ac2:4c14:0:b0:512:a820:3767 with SMTP id t20-20020ac24c14000000b00512a8203767mr3128533lfq.43.1708345846188;
        Mon, 19 Feb 2024 04:30:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/5] drm/msm/dsi: remove unused fields
Date: Mon, 19 Feb 2024 14:30:32 +0200
Message-Id: <170834569499.2610898.10326330561075740550.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 09 Oct 2023 23:57:22 +0300, Dmitry Baryshkov wrote:
> As a followup to [1], as suggested by Abhinav drop unused fields from
> struct msm_dsi.
> 
> [1] https://patchwork.freedesktop.org/series/120125/
> 
> Dmitry Baryshkov (5):
>   drm/msm/dsi: do not store internal bridge pointer
>   drm/msm/dsi: drop msm_dsi_device_connected() function
>   drm/msm/dsi: stop calling set_split_display
>   drm/msm/dsi: remove msm_dsi::encoder
>   drm/msm/mdp5: drop split display support
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dsi: do not store internal bridge pointer
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ec97f371895f
[2/5] drm/msm/dsi: drop msm_dsi_device_connected() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/891a8d83c11d
[3/5] drm/msm/dsi: stop calling set_split_display
      https://gitlab.freedesktop.org/lumag/msm/-/commit/51c139615b33
[4/5] drm/msm/dsi: remove msm_dsi::encoder
      https://gitlab.freedesktop.org/lumag/msm/-/commit/89cdd4dee1f0
[5/5] drm/msm/mdp5: drop split display support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/df3c7899946c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

