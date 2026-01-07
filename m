Return-Path: <linux-arm-msm+bounces-87955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9FBCFFA3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 20:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1877F303166F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 19:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5F93563D5;
	Wed,  7 Jan 2026 18:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQFw7jGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CE034A799;
	Wed,  7 Jan 2026 18:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811113; cv=none; b=E5SfbaMm31vm9g6xCh6dqHRLI9ZcQreE2hQchA8vdrj7kVD98rUpt1AJveHYRnuplNOeI7Z7BQylPV+gfYrhCixQzcsvuyGsjrF7VgOB0QZrYznX7CUP9e0ZAAQAxwIJr37LOyTI/mDpoVlivvj5QrVbGsxii6QbaICOWesXT3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811113; c=relaxed/simple;
	bh=oHrbReaf1HeVn8B+9mxlpHHQuipBO6k8H6//aRo1H0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JvsKrjPtePP2Go9v/hB8zpDa6gCL+eFiuVU6fKi8xv95YAIO1iwqjQrMf5u7r/DV5kZRwGJQqN1uVy3VccinZoayV1QgnCL+RCJmRfO1solC0peBocbiGK88X6G7iRcSa88SG5zcT8qeFWv/Pagso1Rmst6VuJFmWn3viv2sVnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQFw7jGM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC5EC19424;
	Wed,  7 Jan 2026 18:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811112;
	bh=oHrbReaf1HeVn8B+9mxlpHHQuipBO6k8H6//aRo1H0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aQFw7jGMhxJkzKM2gGRr//xnmvizt205SAVQ8vHz1LX3G5lsD9oBHUqoqztYLp2B0
	 lLEyws8HA68dQwFCf0wNwTTngYQ23uMzoXVc5QzzGyQbvVsEWFTkM30Ai61WdYb97G
	 qHK4PeNlsVeL9i6xZ/9hQmOek977ta08BeSFBwc+wO0ax4qImqIfDKTtcO8s+JXL+U
	 a4ygXJvIrPoKWgB/PojdHqQeBAR5jQnOiPJeniRgazfFnzoph7qG99123KSIeYrB2m
	 SJj8JzhAUkrGo9ByII0oyT55v38737VoDxcy65JfxRRwiD7+pjH2APeHXF4KrqvyEE
	 Zo40e7bQFbaiw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Taniya Das <quic_tdas@quicinc.com>,
	Petr Hodina <petr.hodina@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel clocks
Date: Wed,  7 Jan 2026 12:38:20 -0600
Message-ID: <176781109953.3262943.6850960519948721977.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 07 Jan 2026 12:44:43 +0100, Petr Hodina wrote:
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
> 
> 

Applied, thanks!

[1/1] clk: qcom: dispcc-sdm845: Enable parents for pixel clocks
      commit: 17f1ae4148fa50f43b3afbd4fdd7b500928c9605

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

