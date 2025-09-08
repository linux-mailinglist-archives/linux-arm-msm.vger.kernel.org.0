Return-Path: <linux-arm-msm+bounces-72636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A15FB498AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 20:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D6594E2CD9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46C531D753;
	Mon,  8 Sep 2025 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tN3E+0j9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDBA31CA50;
	Mon,  8 Sep 2025 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757357284; cv=none; b=na8qi4B14xG87sslk15jr7cAxm0N+qD9S0np4KYLFGZv9OeZVhlmC9e8nUQ1Fs8tgL8DHcATv6kb5bt3YLo3KnjePvk2aRMMCG5ChvWwDt0dl0spPMvwd8ZYnsaGYwzC+4TQxs1skvdg5nh5C6izFmrZnlFsKDuzKl2QNhXv5Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757357284; c=relaxed/simple;
	bh=asgVt7kXXFQq9NolDcO/FOQcig+ET0oHX2D9MNxkrNo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RhzIRObuMWP7EnREOIpqHuh9uCPf3hZLaaTpnt28twhHvmekCChKcV+pDtZCqUI+u2yN6NTxaRQ/sGeKVpzmxqtCrjqgg3rzaTwggyPt12suguSY5NzF7pB+bNl68J+f0R2zm91//40xYiR9U/ULkMfajfew2KBdRt5V+DFcaQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tN3E+0j9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFC9C4CEFA;
	Mon,  8 Sep 2025 18:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757357284;
	bh=asgVt7kXXFQq9NolDcO/FOQcig+ET0oHX2D9MNxkrNo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tN3E+0j9JLum05rZhmJP+O30kycs9OV6pFcgDPXQDkN4HYITIb7tR15o1fxTGF4pE
	 sE/IcB4pzYiIwYnrjj+xy/mggFYoHphW94+bPClWNHJRmmr1W+/hELt2vHyO6kPr5y
	 Qe6Yfst6DqGE+27KxN1Hc04mWAMHdwa0uGA34dv/BqpdYtkOUTgEQsM5OapmPkr3V0
	 UFGa62sAwAznbpwhAreI4biicXwRA0POKIqAfc+vWxDYmS/tKVbwcslEGqW4OznImJ
	 WSfaBxCfGnSIU0WRz4iI9Kk8HV89XcfMWWql2ErkWd7SkmaMDctZIAMmwD08Osi7SB
	 S/QUoUd4CkErg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qianfeng Rong <rongqianfeng@vivo.com>
Subject: Re: [PATCH] soc: qcom: use devm_kcalloc() for array space allocation
Date: Mon,  8 Sep 2025 13:47:59 -0500
Message-ID: <175735727826.2621347.8114673155122448856.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250819035935.434121-1-rongqianfeng@vivo.com>
References: <20250819035935.434121-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 19 Aug 2025 11:59:34 +0800, Qianfeng Rong wrote:
> Replace calls of devm_kzalloc() with devm_kcalloc() in master_stats_probe()
> for safer memory allocation with built-in overflow protection.
> 
> 

Applied, thanks!

[1/1] soc: qcom: use devm_kcalloc() for array space allocation
      commit: 4ea9e8e5066cc14be72a34c30f16a51b10ead279

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

