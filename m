Return-Path: <linux-arm-msm+bounces-12373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AB0861527
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 16:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF64DB20F49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 15:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896857175E;
	Fri, 23 Feb 2024 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pG46sheQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACA929AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708700782; cv=none; b=RMaJepCOCNoTmewxtyUSZypjTIobXci4mk83bHECld7F4MwBOZNzXMR5DWDSKPxt8yOhrvCD73raP6jJuGMzuBU18rQhArAwXb1ZLfG6VdWw80vviBxU9WNycgPd/rMe5pKriuUXeACSX4GCHnQtJfVHozB/nHRK6dHOOJOldVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708700782; c=relaxed/simple;
	bh=X0urF8PTOLTnSGAFxgaALR8kxbAgRsy7o0cdpZScDMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HQRB9z/4pnTzPL1qrCsNv9D6/UHgOMZEPt9Pw0tS8rXGtOSwzopn78On9ns7Q+h2LLDXArs8fEIW+h3WUGnuQe2w030dq3bAbZvO20zHcoeHmIkoA9dnqKpFtGCQMWDPugB/mH4HR4BtHofyQgxCbZvB0ipWFF8diryh5c+BQto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pG46sheQ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d2533089f6so9639861fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 07:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708700779; x=1709305579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sJGs1NYZ5QUnzqdBB1Q8b+bNbJNb63ZLKIOCTbd53c=;
        b=pG46sheQReakcqs32/t5ZiJgxeD49hsHsnso+dcl4BGKpvIy9vl2MoqSMb7QeQWrR4
         zvyxAD09Go943rhpJ1SCoLUe99zjqOjuejtfW+54PZ/HWOpfGIrCEdPE6fVjVwlL2YDl
         LONVCPy6oWa+u5FEf2TLJ76ASQNOuMx8ih/4SJJhPgsh9p3HI6fk9xpgaY6sKObrEfm4
         /D+D0L59H6CLMX7ACVOL+7FB+FYSbpyIv//HHEc4Tte3xmLxf0Mcg7qkGL512LYkiz4y
         IQd1FYAb1+SzNPbYvWCHOSudjmCRC1yqMJWlJJfMG3XqeN+J7e/b0rgLf4nzNzNXoQYA
         8ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708700779; x=1709305579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sJGs1NYZ5QUnzqdBB1Q8b+bNbJNb63ZLKIOCTbd53c=;
        b=b0X0KfmuTIB/aLMjQ82EMX4NMc4Gtq1qqhavBXa/0sx487q1YviD7RX4slH7OXUgrf
         jHWdmK/p0kqd01hfdO94DIB6JBVue9lvSButnVErI3GrKOri8DnXVtQwqKT41B4kh+14
         dWSWNOYNruxLy+Bx7E2awbXXh8fRw5peCggPj0QqZ//RHsIWS9eSP4DmyCcNe1GA6isI
         5+zbZ6JplVeoff8jN3rIYXH64u1YA/V4gQJWpvVeNsomGa/U3hegVG5X3tbyzv0CjQ7s
         gc5GPhUaudWV+25a+v4mlCi5450bDeyKqiJCqIFHDtmvwspuHaxyGh1EVk9ZKDzwKgpQ
         ZcqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFDXYr4Fp328gAcorW5zpAhXHP0IH2myyt7cvMexpiiLOfPQYzZfjhDbtZabLdjkPPExi11W3fIYLkPn/kDfq+WYvD7MOiy28HssiaVg==
X-Gm-Message-State: AOJu0YzkhCvel9yZ6fcLOEJRb/10+yPI3/NtKw0FGP9dUKDQzkR+hC/Z
	ZxA7PTkLXpRsuG3i3PttLbBtr9NXljhugM+d5KJb5bO2VuJ/oxCYc0id6Lza4bQ=
X-Google-Smtp-Source: AGHT+IGfCIE307IqSzsAUBlWRNDb7b8z9zOXY/2OH+3bNQA44KSVllJBbJFnbX+Qnh3P7Q37qv1Exw==
X-Received: by 2002:a2e:a488:0:b0:2d2:61fd:7c2d with SMTP id h8-20020a2ea488000000b002d261fd7c2dmr63698lji.17.1708700778286;
        Fri, 23 Feb 2024 07:06:18 -0800 (PST)
Received: from eriador.lan (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id u24-20020a2e91d8000000b002d0c8fa072asm2681353ljg.20.2024.02.23.07.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 07:06:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
Date: Fri, 23 Feb 2024 17:06:15 +0200
Message-ID: <170870071756.13438.16980480346490993922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217150228.5788-1-johan+linaro@kernel.org>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 17 Feb 2024 16:02:22 +0100, Johan Hovold wrote:
> Starting with 6.8-rc1 the internal display sometimes fails to come up on
> machines like the Lenovo ThinkPad X13s and the logs indicate that this
> is due to a regression in the DRM subsystem [1].
> 
> This series fixes a race in the pmic_glink_altmode driver which was
> exposed / triggered by the transparent DRM bridges rework that went into
> 6.8-rc1 and that manifested itself as a bridge failing to attach and
> sometimes triggering a NULL-pointer dereference.
> 
> [...]

Applied to drm-misc-fixes, thanks!

[2/6] drm/bridge: aux-hpd: separate allocation and registration
      commit: e5ca263508f7e9d2cf711edf3258d11ca087885c
[3/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
      commit: b979f2d50a099f3402418d7ff5f26c3952fb08bb
[4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
      commit: f79ee78767ca60e7a2c89eacd2dbdf237d97e838

Note, PHY patches (5,6) do not have dependency on the drm patch, so they can go
through the phy/fixes tree.

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

