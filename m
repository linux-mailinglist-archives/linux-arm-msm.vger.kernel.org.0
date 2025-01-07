Return-Path: <linux-arm-msm+bounces-44185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7EAA046BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C856118883A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F0C1F8921;
	Tue,  7 Jan 2025 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwCZc93I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477871F76D2;
	Tue,  7 Jan 2025 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267961; cv=none; b=BrXUQTNG6oV1RXOtRpvVgMv7UtiwuuztVUEVqfpTSiV0jjoV5RM1lEQfa1O3WnXDcgCzPds4dAutqv+pK0bcBhF0iUKAByIXugy56lcH905Lw2qxtDKMHDchETUZFkH5cMJmWQt1fHtCQPrMoCXoyZRyu5BYvUGrJiSqqpxLZ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267961; c=relaxed/simple;
	bh=KOM1hb1tGT4et2Q7p7YvEEAR5/JTM8UUMim2vAfNIAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OeHXvztuRodRJoASC2I3cdK/wvppyZII7XMeF1iddtTp+YQTVLR3hk60Kk+qGAcCqGbDwZ49km6GgblWx6YIOrGcZG1cTliaOa7xn1KFNa6xNfA8cGUnylMPotE+cbPgKGNG8MPYFFXQaehoTPicnkwzfALEMYvp2BHUqOy3uyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwCZc93I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE547C4CEE4;
	Tue,  7 Jan 2025 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267960;
	bh=KOM1hb1tGT4et2Q7p7YvEEAR5/JTM8UUMim2vAfNIAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PwCZc93IC15MWzakrElK56LLq2dHY/Z0kfN5tz9laTBGxkfH4+B1zbJXpafGIXEbo
	 vV3bxRfCBYA5qK/CzlDFhQqpMG2ItiBi4jBEuNqQltH4Oi9eD7g0VZsiKg+Wg6skSZ
	 F/kkO7cHOsjL099BbDrxwc13n361nycnzSeYUnzblscEyyOVcEqx2a7xcGexqBbcgn
	 SCxjffb5LANzv7MRbzwdZ/hMtp9GaoHydLnc37+pDfNr3Nihkh8h2g49Ef6+sD7WMx
	 elV8uXE7qBQmDlcmwD6YmV08lrvGgz/LJXpSMoOMrJV82njx5bCbqmvW/iIf/KbRQJ
	 NSBbeL03MZFNw==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v2 0/2] Remove apss_dbg clock from IPQ5424 gcc driver
Date: Tue,  7 Jan 2025 10:38:49 -0600
Message-ID: <173626793403.69400.201506218508426724.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217113909.3522305-1-quic_mmanikan@quicinc.com>
References: <20241217113909.3522305-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 17 Dec 2024 17:09:07 +0530, Manikanta Mylavarapu wrote:
> The gcc_apss_dbg clk is access protected by trust zone, and accessing
> it results in a kernel crash. Therefore remove the gcc_apss_dbg_clk
> from gcc driver and dt-bindings.
> 
> Changes in V2:
> 	- Fixed all review comments from Krzysztof Kozlowski.
> 	- Patches were re-ordered to ensure each patch is bisectable.
> 	- Detailed change logs are added to the respective patches.
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: ipq5424: remove apss_dbg clock
      commit: 5051b61d769ecc02b218499c35bee4cc1c38b7dc
[2/2] dt-bindings: clock: qcom: gcc-ipq5424: remove apss_dbg clock macro
      commit: 46e6075287e68e1d3d0ea8ecda610064636e0854

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

