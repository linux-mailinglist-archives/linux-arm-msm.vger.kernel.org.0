Return-Path: <linux-arm-msm+bounces-43070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A579FA48D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 08:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9927F165C31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 07:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A7F17BB25;
	Sun, 22 Dec 2024 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZF4XxKx8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5879317BB0F
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734852692; cv=none; b=rrX3KmtZfn9LCkZdU9aFwREZ3LJZAyNaUP8MN4FcjPOOqWTrL8OqJNpAMZJa3QW4OlnJv9dJ8/ExcsMZ1OJlvvIFJ4Heom1eMJiFiMu1yXq+IvUZQKGNnyNu4JCFZD4hsEQv+bqsh2UGOUIsx5s4d+juC5heNq9QKOFboOSwWRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734852692; c=relaxed/simple;
	bh=YC4coFNyGi9nHctHoNDs0rCk2xmTRRp5jg0E+QVGM20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fa3QZbTznVItET2Gwfno20UZ5zdX+TjzDfcB0gzCH93sOOJfNWgiN9mSLboPMoj2R8zZOFcBvNhwXRGbPd4WDS7h/0DRJt3r0ro/z/FzPGwyCYrc9O/KYSi7n0N/jWoDKmABmV1lXIHjLV1qq4YpTuOQjzakxhozZ2ATSh5Vayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZF4XxKx8; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53e399e3310so3697608e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2024 23:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734852688; x=1735457488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4tWENes0KylDXpgmRg5/jOA7aphz2fds2f1aAKkLl0=;
        b=ZF4XxKx8v0Fjvf9rOLjGMiacwMWaDDKaKPSV/NJszpv7AKbJsWzPeCuH/jr+7DCajG
         vBRXDfOqJsNEwbuiGwoQ9yanb63GRRRCbHDmzf25zD7kGvABfEDXONqxYHySPIcUUC2U
         khtfOx/nxeCuljlztizHpD+mYY4VK9jWa2tpBg59BcJOQ/6XwUA6BHdgNR7VUZB8Rnp1
         w6gR5TPxWOate6PG/aTAdPlFhZlCp5OgBofsRGu7fzsGNJOee9TffIKNZ+BpGsvo5FXU
         2dXkMVUtOOd6O2gaSTSs+Pu81xGxnPo6/tjFn0bLpoJjH+cw1HcMHhEV+ssxvzfaP1s2
         kljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734852688; x=1735457488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4tWENes0KylDXpgmRg5/jOA7aphz2fds2f1aAKkLl0=;
        b=SbPWlz8iUnk5UZtRvZ6gWpMx5RlIUA8k2xA7D/hQPoK2stA+pM3tFveSUeUJIuk3ql
         Jfw4zwWbg4RaAUvxVwOmeyybrjHy/02FQcUWfaQVnBjcOMeOvVNsRAE0xT5Qvz8XjY9D
         DgjGmXbZErR96ZPd2T34HU+7J35ZmBWAdaTJByrtFhNa62j+4NCzBFb8xefSH5apV2cq
         TbZqN3wivKZGtALIbPJibXrGHLQOvY7SfM110r/2GvySfAlGJCtCvrXlKRqQWiDCZQoC
         uwn2u3eRNvG89s0NURe2mqhCOMRstU2pyzDjrMIhxr+mApgJi7Xq8JvUuDL0xYVWoQ14
         FQGA==
X-Forwarded-Encrypted: i=1; AJvYcCXjoUKZCS1SdFDhM5KRBYEH6e29zym+/sFKK4EDlJEA2OngcAWKwz9PY5SDy/Y8ZlNtMVDty579QB3VMs8e@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6UpW8u4Udxmh6MGpT6r1bWjywKy18EkW2bCwImfLOpeF/SvXF
	EAVPUwuy8At+uPGnG5x7oa/AnIY/duqTe/73RTs5x+YduYLoskh/cQUd6jc/0mU=
X-Gm-Gg: ASbGncvc2SIrAfckfxeHuyuxTaC+t3k6EKrfnsFI4cyxRbY9wgq2IMpJNzQXaYja5uL
	WLSjv5W/WZdZZotkHTeNVaUAhuCC6NHpx3eUKQpq/pDUkXF7r+wd8zAxYdbd5hTp4piX3AreknD
	2bEWopMDOV2+FVLSUKaBvBQVjeg+d1GCy0u0Sw4le7r306DLrUlSK7qMTGbYRu8186TRwlsFLbN
	tnWSb6tGt1G1jikLLVZxCnEZnH2vBBK4NpnsuFmb1/xzmgPASlNZ8uaZZOpmEFqyOZqNb3Z
X-Google-Smtp-Source: AGHT+IGp894fOidXwA2xVrPSy+TcSR+A1Ol/YQtOYVIHOGQiGKFP+Vy9QFAeQtlN9/c0wOZodFaWug==
X-Received: by 2002:a05:6512:ba6:b0:540:2160:ade3 with SMTP id 2adb3069b0e04-5422953c19cmr2265129e87.25.1734852688318;
        Sat, 21 Dec 2024 23:31:28 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422360072fsm917416e87.102.2024.12.21.23.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 23:31:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paloma Arellano <quic_parellan@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/16] drm/msm/dp: perform misc cleanups
Date: Sun, 22 Dec 2024 09:31:25 +0200
Message-Id: <173485266468.157212.8050342542703139695.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Dec 2024 00:44:05 +0200, Dmitry Baryshkov wrote:
> - Fix register programming in the dp_audio module
> - Rework most of the register programming functions to be local to the
>   calling module rather than accessing everything through huge
>   dp_catalog monster.
> 
> 

Applied, thanks!

[01/16] drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ba3627bf82c1
[02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
        https://gitlab.freedesktop.org/lumag/msm/-/commit/486de5eec0d8
[03/16] drm/msm/dp: drop obsolete audio headers access through catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c0caebf37960
[04/16] drm/msm/dp: drop struct msm_dp_panel_in
        https://gitlab.freedesktop.org/lumag/msm/-/commit/429783c22fe9
[05/16] drm/msm/dp: stop passing panel to msm_dp_audio_get()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c9261bcc1546

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

