Return-Path: <linux-arm-msm+bounces-89463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C031D3887E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 22:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71D8D3062156
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 21:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B169307AC2;
	Fri, 16 Jan 2026 21:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fr5DhMef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B6F3043D5;
	Fri, 16 Jan 2026 21:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599557; cv=none; b=ivmIJLD8W5FR9MemCS+Vnjxxnx4ddImgDG4m5Ffqpi0Cw09VGxr7khjNCdK8KctHukByjbDs3aKv6McR4U25mJBUO863LNa11Sp6zqMtamKjIOgp28JxFR/vYs5nBxGtXh5B+q8nIWAhVQVKK1Vla5YCVbAxm7CtlTD6to/g93k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599557; c=relaxed/simple;
	bh=gZ6F935oAy0hZJGZt9nHlLlvQbrDVPbPvJezyKPnO5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JO85SLIbHpFiw9SWWRWA7yUa0EBLqlqIobZqhR0T1lUwLgBNS9SvLffOahAIHWKzoLariu2nPfqgJzuqL3YjHb1PqmA2/1D92PucCmPvSohFPHFD+lQuBX6F6ex8rVJR3uPTRKPlZvSzIV7MwVfK94u2lQaNEh2h0EBcC3ncovA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fr5DhMef; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFF1C19422;
	Fri, 16 Jan 2026 21:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768599556;
	bh=gZ6F935oAy0hZJGZt9nHlLlvQbrDVPbPvJezyKPnO5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fr5DhMefgi99wgpgYBXuJOptO6XhAdgJWG0mRXvoRIEhIwkxPf+AnZPUVjZkl93L4
	 4Q1A7chEbIeskjzzIhF5ScZPgpvCeIHmNRAr88yuKimZFInSfCpgMDQU341sBzf+wU
	 rdrWchKV+xFEPAd8rJztplgJPiyoilBK9C9E18nGx2VSQl9Tj7FZ5rDv92NUffz7xN
	 Y5kxAIj7q1t58fG+1ISmWjfdORUz2x2szrAotzMpmqMKxbQKVEdCTQhzQYgMTLch8z
	 7PgtOMwCoCfPa9PIgrAJubVmNkRcKklnxsdDvkd7zBh8Cr6QO/JWpWdwfyEqSB6Sg4
	 AHgmFOIfwZWQg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Jianping Li <jianping.li@oss.qualcomm.com>
Cc: ekansh.gupta@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: Add memory region for audiopd
Date: Fri, 16 Jan 2026 15:39:08 -0600
Message-ID: <176859948748.425550.11781509851394853890.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251117070819.492-1-jianping.li@oss.qualcomm.com>
References: <20251114055639.1050-1-jianping.li@oss.qualcomm.com> <20251117070819.492-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Nov 2025 15:08:19 +0800, Jianping Li wrote:
> Add reserved memory region for audio PD dynamic loading and remote
> heap requirement. Also add LPASS and ADSP_HEAP VMIDs.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: kodiak: Add memory region for audiopd
      commit: 90a58ffa9c55831b557ae4819adbe280ea04d3e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

