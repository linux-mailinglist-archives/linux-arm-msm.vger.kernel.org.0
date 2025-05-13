Return-Path: <linux-arm-msm+bounces-57760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C13DFAB5DF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE5297B35CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7792C0843;
	Tue, 13 May 2025 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnAF9fXP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6781FBC8C;
	Tue, 13 May 2025 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168943; cv=none; b=cfkq9dsBhTqDH18uWJvFPB9diIStnXTdf8uQ1DLFUCVnkdE1m9vIC/DTj2VrluMNftDZvLg99E0gO2WKnZWmJkNu4sUwpjnhsGxdom0a+dgsJPQwlcJpYYQdPCCDnQJEitWyMQNKx23WIF3fk2/5FeqrOdd13rzNgWBvplffr9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168943; c=relaxed/simple;
	bh=r6q5X22Skq2ZwqXsFmTM4pU0q1u5UYfvrOlfLwpTzLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ThYCRb26oplfzM+pjLLm5kXGR7mFQSk7Ahb9Aqvxf9BnUsH/yrL8rDE+iehKc7UHoDLZFWyfiS9/0wTJKWjGl+/Iy6+oCRirRApd4APRQwFg5HsbI2VJ3iT1fY0eRJGv33UdOzXe00O0DJrNrTD+CymzSAD492YOFx83JoOH9KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnAF9fXP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE878C4CEE4;
	Tue, 13 May 2025 20:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747168943;
	bh=r6q5X22Skq2ZwqXsFmTM4pU0q1u5UYfvrOlfLwpTzLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pnAF9fXP4D4plRRSlrPKkhr5l2IERRVc1TPzPqzkz19ZBVJmbQSbsGZTcRKlpMoj7
	 iBRCn9YUoIebZvwaJUV6Z81rF8T21cfvwnsSUmSSFKoyfLJaLmBaNPeN4AyNplrQBb
	 0Ywu8wRDx5BvEh/8Lherrqm1g4ynYY1oyYGe3LY2m3/waY6Kqc0VVq8dNsqT4rmeLQ
	 7HfxW7R8dRT0tCAGSdXFv9TWwk8v3vS9Uog6gs1n8lMklZf/aGihQKTzhjq9pP+QZs
	 r0E5/ZBJvwEH4FK/z2KD6t/oBY9sY3tM5THoGLKUsDXUq/G72ox8W8fDPBvX5l74vL
	 3prFSkJjJwr+A==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rpmsg: qcom_smd: Improve error handling for qcom_smd_parse_edge
Date: Tue, 13 May 2025 15:42:12 -0500
Message-ID: <174716891500.3696994.4790082123092933727.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326-apcs-mboxes-v3-1-e20f39e125f2@lucaweiss.eu>
References: <20250326-apcs-mboxes-v3-1-e20f39e125f2@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Mar 2025 19:09:29 +0100, Luca Weiss wrote:
> When the mailbox driver has not probed yet, the error message "failed to
> parse smd edge" is just going to confuse users, so improve the error
> prints a bit.
> 
> Cover the last remaining exits from qcom_smd_parse_edge with proper
> error prints, especially the one for the mbox_chan deserved
> dev_err_probe to handle EPROBE_DEFER nicely. And add one for ipc_regmap
> also to be complete.
> 
> [...]

Applied, thanks!

[1/1] rpmsg: qcom_smd: Improve error handling for qcom_smd_parse_edge
      commit: 75499b3232b6b9194de3cce4ccd60e49c6b70cc0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

