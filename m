Return-Path: <linux-arm-msm+bounces-49625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A54BBA474D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65F791890892
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA2122E3EC;
	Thu, 27 Feb 2025 04:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dq8MLF08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767D21F5844
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631081; cv=none; b=b6I7TXCaBscQk2SEMzLz1GN0dmKW6grYcZgVyNpr876hTtebFNaCVQaFK4+63CLIMcJv/3L3aw2ljjCpVQeXSfvLcV8jnBqG7cAIYKlxIZnaGP8LWFnmp91IuIO16IGmGcfz/07l9F5O66xC00bcKZk2dAoI/kc3lVDAB4q8kVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631081; c=relaxed/simple;
	bh=+FtkdcKwebMwwWijXZdGjuw30u68u75GZtx0tF0H7xA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ej7Bh2aeQJUKjFGfzx36rkqhwx0ZxK2lYxAvJeLOBSRQ0TWs617F2lCXcxCDOwzCtyxszozu8EU0AWQvo/MB+NFZmPBsogRDjXgn+VfFdIUf9WoOiXAnmvhbJCcyjOsy5QmssYYtTC2qEMdOE6IbY47t1KH+re83G7UFV6KOvlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dq8MLF08; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-547bcef2f96so517142e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631077; x=1741235877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UXkglY36wWDlWtl/BHCk6udvb24Qtv5ABZXv7WU9qc=;
        b=Dq8MLF08Sodxfh5rH0TE+MnAknCMTi9Zv4ooZpGA7C8t/GhmXXp+I95gRf/xYmk/o9
         O/vI0CYMwQHVN/BEYVfLkti9KO0TOGCDDqw8VeBsJ0l14uEHGfDMslZowuOX7AwfaOjr
         z1O0ihy6A20FHop7hpCQEMVFat7n9G1iSGqnYLvComJPdPZBefl7UAzJkmhhDujsHVdD
         jNQMHnCOgkLPAANkOdkhO6hsKhGMs/4tMVAIwEh6sxkLwJ9+dRkGNhaJUu7rRayEBea8
         xoXwi1VPepV6/oNNUjRdPlxCTJPJsEhtYueSEavpdjXu+6+CQoTXojHmeBnTz1SaEhLS
         RFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631077; x=1741235877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UXkglY36wWDlWtl/BHCk6udvb24Qtv5ABZXv7WU9qc=;
        b=eORN+gTXMhSH1YKJY9/VVXPgr62Sxi8wWVSkDj3fEngLEJEbO8nr6vV+cp5jKumPbb
         dr1xLlFF2/shNvvTTdqn8Mi3FtwqG+NyaKKqkzUJWR4sLEz2Wpnqm7wT0jYXKw75Brlu
         WX5rQ5Yq2Z96r2VoJfhb69HuJmAiOLOoFGVg6Gx5ZHTz3SvZWGeBLPr/3B+vL1EVE9I6
         rkMmC479iWHfRLRz3Y+YxaBXoC++QJnCuBQ8ffuBXH3kLZ9SE0rNHb/XQeUVrdIYN6sn
         opeI5smjbbAbBfLgAqVqYC+OWCfr3WDbbbaAUeTFv/aGxlHDQSyK2gkdJu3vMDdK5iwZ
         3djQ==
X-Gm-Message-State: AOJu0Yx6Z7ja/tUlvIapwIR/nSGuBaBygmgJnForipWk70E4pJdwVXTj
	lZCgt5pIXKx31y4SuYvZ/3xouCrocN83UhrxXUjmADgxpJk62gUEJwIDj3oqYWw=
X-Gm-Gg: ASbGncs+cAqW1bkvJZrMYe9kJRxpguw2KqdSYtqUyi2D62hXWqEdChW00pPXXDmoQ6d
	uYBZ2jGKwEuO1CQODnj9cG3Ci4dqfL/B+bBamB+dBvbPx/WuiC+GxOmnNvD2p8A/6aejTv2WuX1
	2UF7dBpEuFzbZehkjnm83yIhPlXnSYvpvNa920wLkIL38L1CjXBhdeuk8i8YnRqgbg4dE/yfTMi
	3HmG4/eO2Pps2mYyIp31M9HulhOroZlE8zrJPHdANddqy3Ag1TDUGXfAGtve+WSDK3FySPbWFOx
	VkeS4F5RR8XiLRvG6uzyuPO90iLPAZwmLy2/bhXfPQ==
X-Google-Smtp-Source: AGHT+IFGmZMN8HiHF0dUQ37JUE6cIWIJ4a/etc3Mst5jjknmhWL9hK7goaPc0rslMBYFrA3hJCn4bg==
X-Received: by 2002:ac2:4c4b:0:b0:545:76e:322 with SMTP id 2adb3069b0e04-54838ef895emr12381337e87.31.1740631077556;
        Wed, 26 Feb 2025 20:37:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:37:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Marek <jonathan@marek.ca>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v5 0/2] drm/msm/dsi/phy: Improvements around concurrent PHY_CMN_CLK_CFG[01]
Date: Thu, 27 Feb 2025 06:37:30 +0200
Message-Id: <174063096227.3733075.7538565845819141467.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
References: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Feb 2025 17:23:31 +0100, Krzysztof Kozlowski wrote:
> Changes in v5:
> - Drop applied patches 1-3
> - Split part touching pll_7nm_register() from last (#4) patch to new patch
>    - Thus: new patch #1 in new numbering.
> - Link to v4: https://lore.kernel.org/r/20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org
> 
> Changes in v4:
> - Add tags
> - Patch #4: Add mising bitfield.h include
> - One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
> - Link to v3: https://lore.kernel.org/r/20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org
> 
> [...]

Applied, thanks!

[1/2] drm/msm/dsi/phy: Use dsi_pll_cmn_clk_cfg1_update() when registering PLL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/de36ea80b303
[2/2] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01] bitfields and simplify saving
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0699018b41d7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

