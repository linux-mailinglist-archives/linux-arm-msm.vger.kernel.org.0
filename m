Return-Path: <linux-arm-msm+bounces-29208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FBE95A052
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 16:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FAA5B20E02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 14:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D3D1B2ED0;
	Wed, 21 Aug 2024 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="banTexL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2DA1B2EC8;
	Wed, 21 Aug 2024 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724251613; cv=none; b=tBMDw1YdwdUL+EdRW46+q9aJoI0PdAcpSED0bgvnr0qZWyo6tA46tVl8elvCy583tSRK1fPS4GRMU4KYKZUi9r7xDEjFgCAhdQJWk0oAg2Yq5+2s3+g6MLrVK2bzB49MThku8VvyM1ZwbPTSToWNCTHUqI+2ESS0ODc3v1xwMzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724251613; c=relaxed/simple;
	bh=Nf/FDB1hz0PP0eJy42aHSJJLFOhOw+Dh5xfCnQTiyh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DMKshu9aPBTubFfqh2feU92syUZDm6ddFPFDBh/bDk+yLeuHxO+26wk/IUuMIZAjBkZuDT8aZvVJ+RwQR5UogMuzdkBYnn2oeGbvoqas4LZ+ojBWw3qakZpDpfKV+vDpHJvSjDahEBSlts1WM0VvYwSJ3G2BjbgmoMIlfVV3dec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=banTexL9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09252C32786;
	Wed, 21 Aug 2024 14:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724251612;
	bh=Nf/FDB1hz0PP0eJy42aHSJJLFOhOw+Dh5xfCnQTiyh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=banTexL9eblhefbWe3PFdjlOmLpBlsdeGEZu23V/zjXjgwjzuhB4d5GILG6MRyVUe
	 zUYec7PQQiUKWw/DypU5YI7LQ6te10nRapQmexFq38QL/SOBdJvhInDji1R+ZghlRn
	 GxfxsdFJcnWn6u8CF+S4W9xfLWPXm0M08mAWwWlyUBJK78topSu2Lq2JAcNvrTTpcq
	 k1Np9K48CWHuTjwiyTJlunEeOR8q1z3VpjO1qddMFLiYjWJbegRb0jLMOpmQNK5Em/
	 LFATdTcwOx/kmzQtBMSyzIcJMk6GygkXensy1liIPgbuE/BfDkMYghJ9Qgrm58Micp
	 wT+qA7mSeJrig==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_dikshita@quicinc.com,
	quic_vgarodia@quicinc.com
Subject: Re: [PATCH] clk: qcom: videocc-sm8550: Use HW_CTRL_TRIGGER flag for video GDSC's
Date: Wed, 21 Aug 2024 09:46:44 -0500
Message-ID: <172425160168.1359444.7921872955756396238.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240812134752.28031-1-quic_vnagar@quicinc.com>
References: <20240812134752.28031-1-quic_vnagar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 12 Aug 2024 19:17:52 +0530, Vedang Nagar wrote:
> The video driver will be using the newly introduced
> dev_pm_genpd_set_hwmode() API to switch the video GDSC
> to HW/SW control modes at runtime.
> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for
> video GDSC's.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: videocc-sm8550: Use HW_CTRL_TRIGGER flag for video GDSC's
      commit: d628455ab3c22bf633935f5d09451530c44c4ba3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

