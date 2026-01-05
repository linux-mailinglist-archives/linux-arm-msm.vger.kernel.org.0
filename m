Return-Path: <linux-arm-msm+bounces-87465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDD8CF40FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBCBE30CD9EF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF93B29B229;
	Mon,  5 Jan 2026 14:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGShol8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E641298991;
	Mon,  5 Jan 2026 14:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622077; cv=none; b=SIlcTwezw8hh5HVRL9oE8bP+MWJMj76j5LOuX7cLPPlxKGGyI4tNkxJDebUAv4NBYbpsruCANlZGf+0g9kVdXEY91rED4hapM2uOgbHuftcn9xzltcBAuUt9Wh7aAvpYX/mg9PDYkMTTR+nY8oMcTQN8FvPKhsw/+AppYzhNCG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622077; c=relaxed/simple;
	bh=c4sWJ4xGHFMsifFablIa0HXZuPmynaHtewNzlY/P0qA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UseeVaJjv9gwtt4i7BwQBM//ugFy7UpT07Rw97L3N8gMTTsHYCaPaN+WRd7J9Z9RTFgktvVgzEWhzL7Az699EohPYEwKHdxdYv0oKM7xyIE+5aqJEzJH6ONzZxTjWLoXIbI16f0WmHmWM+4K5QWUgElo8Zw94DyFCSjEyUZmjGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGShol8L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADB9C2BC87;
	Mon,  5 Jan 2026 14:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622077;
	bh=c4sWJ4xGHFMsifFablIa0HXZuPmynaHtewNzlY/P0qA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NGShol8LteRebSNNiomZu2tzv3XfmGMc3LQWW/aIK6X88BhaPzChvezIfigSkYywZ
	 SBnt9pquG1Z2PdrkhRGx13lCvJmcoN2gacTZDAnf/sTKRnCvgroJfWoTj5CxuL6NB/
	 2CTsu2vzZN3Dt80aQJNxHiMCfT4kzUiCXWLNq/wc+plRmVqcVZQy0pZ7EdoCQWRr2I
	 dJ454tjhcaTao8SyWpAayAHU80d+z0iDE8GAfbe8TUtLUj5AA277QWcq9P/x5OqO2p
	 BYGDDRBgYLxS+BZNIaLEZ3iPjYQTPN3uoibCdo+b2iOtk4PUBSZ1GgasWnHDwbYTSz
	 95liPLgGlQPpQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sam Day <me@samcday.com>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 0/2] Introduce framebuffer for Oneplus 6 and 6T
Date: Mon,  5 Jan 2026 08:07:12 -0600
Message-ID: <176762206390.2923194.7151237302667512164.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206-sdm845-oneplus-fb-v1-0-19b666b27d6e@ixit.cz>
References: <20251206-sdm845-oneplus-fb-v1-0-19b666b27d6e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 06 Dec 2025 18:45:41 +0100, David Heidelberg wrote:
> Unfinished bits of framebuffer support was laying long enough in
> downstream forks, let's push it.
> 
> 

Applied, thanks!

[1/2] arm64: qcom: sdm845-oneplus-enchilada: Sort nodes alphabetically
      commit: 9bf9c47cd8e54d0653147bc7a7e6c135607286be
[2/2] arm64: dts: qcom: sdm845-oneplus: Add framebuffer
      commit: b0d5c96e860c28159541e7bb8ed277b0fee13a0c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

