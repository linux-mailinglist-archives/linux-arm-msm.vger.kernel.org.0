Return-Path: <linux-arm-msm+bounces-87488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4284CF4467
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 937353020807
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 15:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D1033A9DB;
	Mon,  5 Jan 2026 14:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSrwm1bB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CE733A6E2;
	Mon,  5 Jan 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622111; cv=none; b=KlHtR4TfnFWHCOWgHhMO7RcJv5RV7dpa/ixlUfsWOM1uf+4yRWTm5k59usXOx3xbrEkQTACES7G2FUyy+je3bxHMGWIyxbLfsIck03+oDKiP7LT+UxuoUkN/7pzLLNp6JAplcv3/8nLdIq2dfK7syhrVvmkIXhxLwQnCoroc5N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622111; c=relaxed/simple;
	bh=siaeWWpCWMKJh7afYEu+DKWQFUNrOEakWyi3QHNAwr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tSBFyK5JAxXZQmWF2JlkW+o0qCaH83jbgU1fMeurIGBo8k7sC3p7v5sCWYux2eY4y41gUZPJTpUbu1W70HLJ25QwCGskn+27HshJTpoTgVB1qVHejoJx9qShTnLIfPWrRc4sBxAwP+jRy1WndofW4Onumt1vMe6geHxgwIGz9sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSrwm1bB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7CEC2BCB5;
	Mon,  5 Jan 2026 14:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622110;
	bh=siaeWWpCWMKJh7afYEu+DKWQFUNrOEakWyi3QHNAwr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GSrwm1bBtsAyesWMgWjfD18Zv1zzFDRmdb4/hJL32wBEJrukWy2l7ESLWg6l/u3Z9
	 iB0wFkfcYJ1FzbuDV9liUX76HJOio1ejKHicIO58L67BBovOTpf+pl8YvMV9f1cE3E
	 OZ5yGQv+vbz1QqLwNmEZCwsPh/6DE+Fk+/gTLn3ZjEwf5uVbRuPIuQmYyUH094KuSo
	 SqqX1x30L4TJcecJQjOfLMxIVt1vTP6U5bTtcJf48TO3iKfUb2qsHZDDWceBvYqrbz
	 bI9K1Y4pNJsmlOAxsUmfF+ueIvPqZptXiLuMyTz9QEJnxu8ZqJHDGmMjeLIo1gXiGt
	 MMvSM+KNDoN0g==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Jingzhou Zhu <newwheatzjz@zohomail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Fix reserved-memory issues to enable IPA
Date: Mon,  5 Jan 2026 08:07:35 -0600
Message-ID: <176762206389.2923194.5036173388177374614.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208031511.3284-1-newwheatzjz@zohomail.com>
References: <20251208031511.3284-1-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Dec 2025 11:15:09 +0800, Jingzhou Zhu wrote:
> In newer kernels, the reserved-memory hinders some drivers (SLPI and
> IPA) to load. Correct some of the nodes to address this problem.
> 
> Jingzhou Zhu (2):
>   arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Remove duplicate
>     reserved-memroy nodes
>   arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Correct ipa_fw_mem
>     for the driver to load successfully
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Remove duplicate reserved-memroy nodes
      commit: a499c40ccd8e748ef363e2d13fb7a5c0ed6a788a
[2/2] arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Correct ipa_fw_mem for the driver to load successfully
      commit: bc11f6f1d2470fa59846be077555f9d4b7c2c0d3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

