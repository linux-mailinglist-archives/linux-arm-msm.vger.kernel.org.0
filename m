Return-Path: <linux-arm-msm+bounces-23741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C40C8913899
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 09:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F8602827E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 07:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5023D762FF;
	Sun, 23 Jun 2024 07:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HCHYRZOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9397A49621
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719126859; cv=none; b=WPMadqpfRt0R9w+UFY0dEnHpFbvfb2HF8EXdz6qGzPpm4GdxEwDKdotRjgU2IGzeY16Z87WDz+cYwv5rZULDpylmOKkvn0jpXOLvxxrTQHE6RT6UoV4RiBlk4xamkB8wyYL0PerJ3Uvw1tNMEvTlL//2A2VoVe0+E90NlC7sUho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719126859; c=relaxed/simple;
	bh=faINjmwVgkbeg09kmf54YuPPiXG/1hQ0/O9qVuo97To=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EE03MI92XbCRRbIz6ETcIoO1Z1gcN8VtTEbkk7iRgcY3elxYNyoCaa8NCdjYTFtBWsU/6gsbWFhCFHPMtKW1DHUq31mUxExaMll4Q2EFQmj7eagk/3bB0+HsPECXQ9wz9qYtX48E8ZmxOwD8nshqVkHymt6JbITILFYYWlKa9Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HCHYRZOn; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec5779b423so7398801fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 00:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719126856; x=1719731656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFJAq35jeUfYu0Q755yYYR78x5vyrjKi2e0M/c+GQ0Q=;
        b=HCHYRZOnDHmDH6qNMz07ksZssjYRgo3ndsga7EMe3FpBm2egm34JBpLY/OJZBSn5M2
         90oc/nzDCM6p3cBYk4rNaOUy6duY1ut2E9cGiV5fV3nWZj96+ZdUQ52g/1GOsNz3Cybo
         sA3rw6L2BMONKmEfkX7v5T0QqQfajdbp1StPFsZwT4eYjw0cFqfDAHv5k129DfJoyxvG
         IkS/+yXei+B0epiko1ErVhHW3kegw+ghQolkIAmxq6r16gU+DWh8b08Z541lq59vIiq3
         Xs2ZydWNIXRrEvZNQ/rNGd9Hw7oF3B/7o9AFsnnrjgIvKYZuX2mGIXgbJu/Xk0TvuSXR
         y5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719126856; x=1719731656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFJAq35jeUfYu0Q755yYYR78x5vyrjKi2e0M/c+GQ0Q=;
        b=YadJlLpKsXqB8S0/PpsPPsA+2cJL3JtDDRA4No/G+wnMyQ1/e5aTq3H5BLqdyh/gDm
         RCq2VqyCfdyDZ3R/Wfi7b4Rn342LQauHsDxQxnfbJuhRerhAaBAs35HvWwwSSa+c/r6w
         VaVZlzaldhck2HfU9m9+MimIUa5v4WMWTEVF+FP/ngQurASgB2pd9CXpmM24g5P6C6p1
         vH5DTvl32BeMPnotFjQN6521GwpZbDljnNUJcLNHOIhmoUUsYMZ93nHn2ygdJAX0W3zz
         NIVyLGPsPhtXvqOkMDulh20DlGefhX2p4HfRfuOktIqgjzsLFYLOzEO8ANVvgvXELlus
         HDvg==
X-Gm-Message-State: AOJu0YyWDqm461vLy7fXuuvj+3ubZhmQc20IcU7ZYj54vVlIR9mArout
	z7Z46u5WPG2oIpt4D2/y6RJcOg9Y5GKqRrR+JY/MogMwhqrRmEaWUEovD+yPOX4=
X-Google-Smtp-Source: AGHT+IEMbjEmaH7+DYR5ilu78Zy766qs3toD5t35p6uDn52e2juXI3EJ3jd+a3h4Ght7Hbsge4I2ag==
X-Received: by 2002:a2e:9f10:0:b0:2eb:fc08:5d83 with SMTP id 38308e7fff4ca-2ec59389fffmr13590671fa.44.1719126855720;
        Sun, 23 Jun 2024 00:14:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 00:14:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Jun Nie <jun.nie@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jonathan Marek <jonathan@marek.ca>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 0/6] Add DSC support to DSI video panel
Date: Sun, 23 Jun 2024 10:14:08 +0300
Message-Id: <171912674298.840248.15697903647146535027.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
References: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 May 2024 13:56:44 +0800, Jun Nie wrote:
> This is follow up update to Jonathan's patch set.
> 
> Changes vs V5:
> - Add hardware version check for compression bit change in cfg2 register
> 
> Changes vs V4:
> - Polish width calculation with helper function
> - Split cfg2 compression bit into another patch
> 
> [...]

Applied, thanks!

[1/6] drm/msm/dpu: fix video mode DSC for DSI
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f9ce482d7dc0
[2/6] drm/msm/dpu: adjust data width for widen bus case
      https://gitlab.freedesktop.org/lumag/msm/-/commit/17236bc0ee0a
[3/6] drm/msm/dpu: enable compression bit in cfg2 for DSC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/063557239c26
[4/6] drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
      https://gitlab.freedesktop.org/lumag/msm/-/commit/007870b8eaf5
[5/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9ecd0ddd223b
[6/6] drm/msm/dsi: add a comment to explain pkt_per_line encoding
      https://gitlab.freedesktop.org/lumag/msm/-/commit/294b38100595

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

