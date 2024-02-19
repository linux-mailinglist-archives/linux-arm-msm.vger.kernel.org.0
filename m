Return-Path: <linux-arm-msm+bounces-11670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A35785A35E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EF281C2376D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779E433CDA;
	Mon, 19 Feb 2024 12:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RGLYMwvL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F692E3EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345851; cv=none; b=FaefWKnH9Ufb+EGZEXplOJC4AJbMmvUBdZsq5cfTn6gYgrYSFpvR3Kn732eHiYu9fVPnUSnPGfRYPd3SSxiq0q7pRlpjMrWF0Mbh1lbl28PVcox99+zcJAMaS0WJORCXFvFof98EzKJ+OAJxoEfW+vO4lKOawmfrM3xofjQVEp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345851; c=relaxed/simple;
	bh=reEKp/2i7+nkRURC6rzn5QxWVPFWTl7jxgOOwU+T3TU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rD8nAoK0P3m/PxXSmlPiq44gjf5a9cELcce42A/m8iYm9t7Zc/TV60xGFRi8s4kaVBdzKzYiHRL/ckALsfPjQd/utVAiF2XhHDPKJddw30M/b7bGHvGpg4W4TtsFkpQfan8LjH7sEtXLjUC2Ua8El+5xwvMammwSGvn9ZcA9CYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RGLYMwvL; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51197ca63f5so3965409e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345848; x=1708950648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqUC7cuIQqkJ0gS7eqwu1gxHdis9+l+nkFywUCkY/qk=;
        b=RGLYMwvLB/0TyxLyVbAEz2khttZqW0t9/xGD9uZlzadR8iWeaMroxssBiWWXWtwCWl
         /+lzGBkc+ZS1CTSJWfHFlQJ+vUqZC2BvyqYvJTBceKHbvN6r8sNnoOZXDrhALbhVcoa4
         J0vOZ+e0uVBBU+50f0X5rDrhWIjDiEgkjhbJrAr6D7BpMcvjEzpClfmqCl9MG6K0pROd
         3lP8T1H4a07dcisSxOAuX16Mf9nDvcSZez5UlPqi9DFoSSspgl6dkpbPKMEO73qx2laS
         wlk1R241UQKOOUsT3GzykzSwEmmVQfc8xkF9Idb7TMvW/l1TYlP178ByXDYTarcfgHmX
         corQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345848; x=1708950648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqUC7cuIQqkJ0gS7eqwu1gxHdis9+l+nkFywUCkY/qk=;
        b=aO3qx8LF8qbg1KuNS04Y+JAnC74QVAxGMR5zZwszlyFSSFVQNvJAo22QWWrwaCA2xl
         WeIoMkWItkvt1DjjzYVJSWSmztXMZWAyyaYdwIYpIhRWHVJDW+WgaVk4JQm7HgBaETK3
         ZCNFg2L58jOxrpK5FROp3DYAkqggJ7Hho9NTjR2fSvdjDhkfa0SpDuKRspbiduQRiEvg
         4O3A+CdSlQ0+kUHBFdk8j/29lA+LdDC8gVZ4+NGGqeanuI6fwsozlWDCW297XRUQ24pg
         R/tR8rromZDL0hV9rk9h2BwRnlHE/bToeQHKtNqbfgLY0BxvewcN5Vbr5OQO1yQBMxn+
         CJlw==
X-Gm-Message-State: AOJu0YyMdEkeoqKyTVuVODB1p1EXHzTyReul7JSekDGFPztJ+Z5joQRN
	rW5GR6PJJJ59UTB2x1LAQP38Q/bQ6OHWbDKUys5ZME2zxgxccjxQ+HuZRIVq3wo=
X-Google-Smtp-Source: AGHT+IHNdPSE3GczBi9T0DN9rQxAmvZca5C9487Cr1vL/kGDEv0s4gJKgLoYiqB9g73htQAToLy7/Q==
X-Received: by 2002:ac2:5f72:0:b0:512:b051:7b06 with SMTP id c18-20020ac25f72000000b00512b0517b06mr1986283lfc.31.1708345847746;
        Mon, 19 Feb 2024 04:30:47 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH RESEND v3 00/15] drm/msm/dp: clear power and parser submodules away
Date: Mon, 19 Feb 2024 14:30:34 +0200
Message-Id: <170834569505.2610898.6936484745958965912.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Jan 2024 20:26:19 +0200, Dmitry Baryshkov wrote:
> Reshuffle code in the DP driver, cleaning up clocks and DT parsing and
> dropping the dp_power and dp_parser submodules.
> 
> Initially I started by looking onto stream_pixel clock handling only to
> find several wrapping layers around a single clocks. After inlining
> and/or dropping them (and thus dp_power submodule), it was more or less
> natural to continue cleaning up the dp_parser until it got removed
> completely.
> 
> [...]

Applied, thanks!

[01/15] drm/msm/dp: drop unused parser definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/08c5b691ee54
[02/15] drm/msm/dp: drop unused fields from dp_power_private
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9aeb50ea0ea9
[03/15] drm/msm/dp: parse DT from dp_parser_get
        https://gitlab.freedesktop.org/lumag/msm/-/commit/31a01db14b90
[04/15] drm/msm/dp: inline dp_power_(de)init
        https://gitlab.freedesktop.org/lumag/msm/-/commit/47103b582412
[05/15] drm/msm/dp: fold dp_power into dp_ctrl module
        https://gitlab.freedesktop.org/lumag/msm/-/commit/17cb153f81df
[06/15] drm/msm/dp: simplify stream clocks handling
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9bd0946d5ca1
[07/15] drm/msm/dp: stop parsing clock names from DT
        https://gitlab.freedesktop.org/lumag/msm/-/commit/77d0243a3313
[08/15] drm/msm/dp: split dp_ctrl_clk_enable into four functuions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e518c27218c6
[09/15] drm/msm/dp: move phy_configure_opts to dp_ctrl
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b4745f741e79
[10/15] drm/msm/dp: remove PHY handling from dp_catalog.c
        https://gitlab.freedesktop.org/lumag/msm/-/commit/64eba0d63c70
[11/15] drm/msm/dp: handle PHY directly in dp_ctrl
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f304bda5bfda
[12/15] drm/msm/dp: move all IO handling to dp_catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1577814118e7
[13/15] drm/msm/dp: move link property handling to dp_panel
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3ffe15b30a63
[14/15] drm/msm/dp: move next_bridge handling to dp_display
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b3b1d122a80b
[15/15] drm/msm/dp: drop dp_parser
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6215f1558bab

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

