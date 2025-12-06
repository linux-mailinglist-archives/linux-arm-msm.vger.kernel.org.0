Return-Path: <linux-arm-msm+bounces-84553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CA375CAA008
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 05:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3AFAE3027860
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 04:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF2F2BEC28;
	Sat,  6 Dec 2025 03:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDYXetbw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB55325785D;
	Sat,  6 Dec 2025 03:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764993595; cv=none; b=aCEeIgO1Iamu3gYmFbwcaJlwro2kQHReTmRworGn86YLdPofTLI39LYw9iwPxIPnYB7yNp3cfiE5a5rKm8StaTCm8HHv4uApV5QpWO+giIscC3mAen5rpyFlpVhKFb2SRxg4kqeKrKufLg/qUradsBBGO6f7YjDn4gl4ty+s+iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764993595; c=relaxed/simple;
	bh=pEPt3HWjY7ucCmubfRLXzLpIWQ5q9hgoRVtNASqK7Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7ZTj0xCWMjsgxgG0TKCoV3BVi6HslHwEAqnHMllI/4xGLSiSOh8Aq45vLsEnu3owN/5m/K1Sclt8G4QTwNNuMgIFpDySj8GiSD3ob7/HeNKgEzTdP5u4e9501KKZ2rWrrZnTbXpf3YVbBhHRZbkTjgyrey20nulm1IUzJ4VwMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rDYXetbw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6C8C2BCB3;
	Sat,  6 Dec 2025 03:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764993595;
	bh=pEPt3HWjY7ucCmubfRLXzLpIWQ5q9hgoRVtNASqK7Rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rDYXetbwG8rYwJvMZsec3bXyR4eq4MONW1gnGfMDcanX+gOp2m8KZ4kpccJzE7Sww
	 TdRRJkKVxgMAzTPeLEBjYZqjnVYgzbNJ0pASHV11n58pfD8TefW0QFK/crCmlemknZ
	 fxu4jjfo9r87xA5um+3mzFsz8RDoVDViuv5tTvqOHnj1oaroFyzB00NSszDnIWgejD
	 kB21MqVE1cRtthlvajHUnTq4+FxP/fml9FvFlpyXrW5ALgcjNBIHrn+2Sq9PwbbeIG
	 NlC7qmKsX4Hvb5fkse5aKSnvWYc3USaHcKWsVHR6kOWd+ebRWljt/uE4GlpBnbIl7z
	 1x/ccbGIhwM/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Start using rpmpd for power domains on MSM8974
Date: Fri,  5 Dec 2025 22:06:08 -0600
Message-ID: <176499396494.224243.12900669334147776741.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Jun 2025 15:19:55 +0200, Luca Weiss wrote:
> Switch over the ADSP PIL to use power-domains instead of a regulator,
> and have one commit switching over the MSM8974 SoC plus all the devices
> to use power-domains.
> 
> Note, that I'm aware that these changes are not backwards compatible and
> not really bisectable, but since it only affects the ADSP on these
> pretty old boards, I say it's fine to have this. Get all the patches
> into the same release (6.17?) and then we're good again.
> 
> [...]

Applied, thanks!

[3/4] ARM: dts: qcom: msm8974: Sort header includes alphabetically
      commit: cc09be7d644063334634baa6bb8f3860d6e05dcc
[4/4] ARM: dts: qcom: msm8974: Start using rpmpd for power domains
      commit: ce1799781200529149cc9e013ae1fdd6eb04b2b5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

