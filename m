Return-Path: <linux-arm-msm+bounces-23828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B50913F6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 02:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23839281410
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 00:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AA6623;
	Mon, 24 Jun 2024 00:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFWZ0mpU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CADC53A7;
	Mon, 24 Jun 2024 00:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719187984; cv=none; b=jlKZWd1phsrYR+mzIF8zgDS8lw4kYceVyStxJFu43v2AE/ioK2R/+VYfBlFUwHjCbLoj2IF/XwYi3UvF8hedGJYYgea2z+Rmr3riwqYABQqYmIWfu6R5wl/8VYPENc9/sP6DoSCoQakaW3+D6cIASCz3pPXHf2bVl7fWu7/gMcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719187984; c=relaxed/simple;
	bh=r13Hhd3r9OVP8v75iWfubcVtTc97zZqfxivXseH/ZEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EO09xZWs9lilmI2K1NzAVpqsTF/1JL6Ftz1xxlpEUKRNTeJBV82QVzvjsLWFMRa76sdbyBkYOM1gc042h05yks5YueX6PUC4dN/qy7W2EIb0l6SoXPdj6XsX/Sql6rk29hTshiVOogYXgJCZO8zeJxBqYFUbKOFJNOTw0+EYc5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFWZ0mpU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B75C2BD10;
	Mon, 24 Jun 2024 00:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719187984;
	bh=r13Hhd3r9OVP8v75iWfubcVtTc97zZqfxivXseH/ZEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PFWZ0mpUi8ZBzS3snTaBjJMFBJoyeBNALmyPtHcMR0rPWS185GVaHUla6rdqjTeh8
	 5ddmptTzpED5k95VcNtziZ3ToV/1MzI9SNWzFQH4/PGtwC5U/6C0GclEn76l57uKKf
	 insgahMw1sz8J1OBYWu7CNTH8wyYxJiGSb1RVgquwqkkEnbPap3c5vs8wEhZpSVzu5
	 URCFJLDmB7CGSV1tsLJt5WWabPcfXqcz6ARAhDnS2StJHbF2m9JgLfvY8sPmiLHirX
	 vM9n0wW7nIUnizjFJMNrbPcHwnJcJpJZh+KHI5vpshXRWYpWmjhkGgNAUxZ4WJf7fG
	 pNhc0cmbKsXnQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Shazad Hussain <quic_shazhuss@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_jkona@quicinc.com,
	quic_imrashai@quicinc.com
Subject: Re: [PATCH v2 0/6] Update GCC, GPUCC clock drivers on SA8775P
Date: Sun, 23 Jun 2024 19:13:01 -0500
Message-ID: <171918797812.9262.9958160262802500413.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
References: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Jun 2024 16:38:20 +0530, Taniya Das wrote:
> Update GCC, GPUCC clock controller drivers on SA8775P platform.
> 
> Changes in V2:
>  [PATCH 1/6]: Dropped fixes tag for removing ufs hw ctl clocks
>  [PATCH 3/6]: Updated commit text on setting FORCE_MEM_CORE_ON
>               bit for ufs phy ice core clk
>  [PATCH 4/6]: Updated commit text on removing CLK_IS_CRITICAL
>               for GPU clocks
> 
> [...]

Applied, thanks!

[1/6] clk: qcom: gcc-sa8775p: Remove support for UFS hw ctl clocks
      commit: d3b33848627d2b0e02bfcd74ea1671d0d6df3aec
[2/6] clk: qcom: gcc-sa8775p: Update the GDSC wait_val fields and flags
      commit: be208c0ccf7d861fc6109ca06c1a773512739af9
[3/6] clk: qcom: gcc-sa8775p: Set FORCE_MEM_CORE_ON for gcc_ufs_phy_ice_core_clk
      commit: 955606a7b073d724a50a6ab1119987e189fc3e36
[4/6] clk: qcom: gpucc-sa8775p: Remove the CLK_IS_CRITICAL and ALWAYS_ON flags
      commit: e69386d4a42afa5da6bfdcd4ac5ec61e1db04c61
[5/6] clk: qcom: gpucc-sa8775p: Park RCG's clk source at XO during disable
      commit: dff68b2f74547617dbb75d0d12f404877ec8f8ce
[6/6] clk: qcom: gpucc-sa8775p: Update wait_val fields for GPU GDSC's
      commit: 211681998d706d1e0fff6b62f89efcdf29c24978

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

