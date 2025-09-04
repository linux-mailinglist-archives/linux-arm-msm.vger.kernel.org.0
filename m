Return-Path: <linux-arm-msm+bounces-72075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 656AFB43F42
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F0061889828
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3757E31CA6B;
	Thu,  4 Sep 2025 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+BqF3zy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B752303C9E;
	Thu,  4 Sep 2025 14:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996541; cv=none; b=CLcnDOd8HsFe9fnxfBsVCPpKu2hEFzeCy6OUNlQnBYQRqvkI8HaPcSc0TW97Hhrb+ehHcPxrudr+mRb0/ooy9zdua674/Tvl9/IM562eGRYoAW++CDVLENlftijNgRXgPtN9lKHxTiQOya9cYy5NS9iLjsk0xxd7x1QbC7e5bks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996541; c=relaxed/simple;
	bh=zI6dlT7OfZMIFDyCs2yOrFWg2VXfUlEcp0qJeItApO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u6hst4N1zn8Z0Zle50aoTtMXaR+OPLGY4z5cPFbwD1rsU07SKpO7sq9igSpLepWcZcKi/lxX/jOXxoCJjBclxvvAggT7Jj384N2QM5Usowb2V8jLMYpKhfm9FlWSM/29jZ+hGZPy7cJ3tGijWTsukCOjCQ7BwWSEdZ99MlDyEFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+BqF3zy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4991CC4CEF0;
	Thu,  4 Sep 2025 14:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996540;
	bh=zI6dlT7OfZMIFDyCs2yOrFWg2VXfUlEcp0qJeItApO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W+BqF3zyMBbLODFjNyiAuAEyCtRns/mqv+H9HndxC3iKNf3z/4J/jCuKNAl5evtkt
	 HaHHknaPNaPM8UHHc4aYtWQ2maQXO+lXKmffFqsB32SQjtzkd7C0QHzyW+ZHWCeNA1
	 5Zk6XmzwlEjXUsZ9YSHfWb++3W2n7kiIY57bi/TYPL+SBmR4URCuAgy+UjTkym491x
	 GWndwGJKIXbcWxY5CxfzrU/Gs8/l7coFDPlqOceCwf5hv4Ys5iN2NRlunCjpaBBJi/
	 au2wEFxhFBKTVZ5z1oNsGC9jMHqj7TRtgHL3FQatPNn3P5MB42z22fB04/7qyu3rRA
	 //A/W+hLISu7g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/8] clk: convert drivers from deprecated round_rate() to determine_rate()
Date: Thu,  4 Sep 2025 09:35:32 -0500
Message-ID: <175699653023.2182903.15754546225268713483.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 28 Aug 2025 20:38:19 -0400, Brian Masney wrote:
> Here's a minor v2 to my larger 114 patch series at
> https://lore.kernel.org/linux-clk/20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com/
> that only includes 8 patches where a v2 was needed. To reduce the noise
> in everyone's mailboxes I'm not including the other 106 patches that are
> still valid. I will supply a 'b4 am --cherry-pick xxx' command on the
> other cover letter to exclude the patches in this series.
> 
> [...]

Applied, thanks!

[2/8] clk: qcom: alpha-pll: convert from round_rate() to determine_rate()
      commit: 0e56e3369b60506ac030546c8a63a1aef153d486

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

