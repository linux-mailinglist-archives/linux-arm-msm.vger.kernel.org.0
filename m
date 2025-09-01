Return-Path: <linux-arm-msm+bounces-71427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A00B3ECE2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98A451B2122D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 17:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2523320A1F;
	Mon,  1 Sep 2025 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFfWtwLz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1A832F777;
	Mon,  1 Sep 2025 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756746243; cv=none; b=JrXO1dXJiZySSIZzPrtBcZ6QnUYft3DAp5zJJcXkt5fS/fWoZFAP3tafJx70yQFM2UhKGBXCpaPW1jOi2+pm6FFz3+DdG8zU7IDek9tK9maVbBbWKWvfTJYYMlyGKKf7ZA1+5DyT5jk9Ik851AdFKrvg+dkKIl1IUwG/AbFQCRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756746243; c=relaxed/simple;
	bh=uznjV6GNtsUeaw8/qZ8vz+/Qm7K/KuRh7317nxeEPLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SKJk5fOh07Zc9pBRTombm1AJtbwJyOjyX8EXwJuzO82awCWonSRQN/w2P/mcTuLTli2pVGoBoJ/nsYpQ18Bs8dKgY44pq4ynoA+quiqJ23XP1lRwoU+qIn68EmLwsW4B6GPjp6iwg7ZeGJuBH06O0i8gfk/f9pwjDhZi+isCgYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFfWtwLz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CCEC4CEF1;
	Mon,  1 Sep 2025 17:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756746243;
	bh=uznjV6GNtsUeaw8/qZ8vz+/Qm7K/KuRh7317nxeEPLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fFfWtwLzE3P+Mt49+YmZCC4AOAq9O2gFL5m3JARScjkvB1ukfrvR47IpCM+hADOqW
	 fngm/6eVS8jp4T93IcSEF46eGhpWvx3CS5nq+Gr3CuTLczvlnn5kwpSjJuz0tcaQcO
	 A8UKT8OjBwJaCxWXaHdG3gykZrx4Cu9vufEJe0t63g7+CBnhb/NEhGkrtuOFy+Wdhb
	 IHujTtco+R/xtMgRvq4mw7kywIzqioxgZ/27AqWSsVz7zLA7p4nlXlxpvkWZ7q04U5
	 mHEJXntqlNDt7X8t3XhaiLuOYZKXZcTUv3WTUzxEyAEwezXKM8yXcQrFsi/8TT+acd
	 O/yLS65LONKew==
From: Vinod Koul <vkoul@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Wenbin Yao <quic_wenbyao@quicinc.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20250821-phy-qcom-qmp-pcie-nocsr-fix-v3-1-4898db0cc07c@linaro.org>
References: <20250821-phy-qcom-qmp-pcie-nocsr-fix-v3-1-4898db0cc07c@linaro.org>
Subject: Re: [PATCH v3] phy: qcom: qmp-pcie: Fix PHY initialization when
 powered down by firmware
Message-Id: <175674623951.175374.7267419073491468594.b4-ty@kernel.org>
Date: Mon, 01 Sep 2025 22:33:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 21 Aug 2025 10:01:47 +0200, Stephan Gerhold wrote:
> Commit 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention
> support") added support for using the "no_csr" reset to skip configuration
> of the PHY if the init sequence was already applied by the boot firmware.
> The expectation is that the PHY is only turned on/off by using the "no_csr"
> reset, instead of powering it down and re-programming it after a full
> reset.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: qmp-pcie: Fix PHY initialization when powered down by firmware
      commit: 6cb8c1f957f674ca20b7d7c96b1f1bb11b83b679

Best regards,
-- 
~Vinod



