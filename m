Return-Path: <linux-arm-msm+bounces-54292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE76FA89243
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 04:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11C0B3A4D6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 02:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEB0157A48;
	Tue, 15 Apr 2025 02:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anizWvRZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D6C2DFA32;
	Tue, 15 Apr 2025 02:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685566; cv=none; b=slxgV/GjqqtOnKNzk7SvdP+2ske4ml6xZNGIQcjFNlUJPaw5+QlntyeVrVsUZiBIhH5dBFLCjBPmz1aNpffY3/50qCFmEXhJiel6y6PJj5Kc7+KGEcMsjUwGYxpX3+1aNtsoYwQmQlDBheV9t9IcOVmJts/I8O4e4fcoWkbimUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685566; c=relaxed/simple;
	bh=IGxreNlwpqQm5syFJ8pj7BbF6kEXtKAd/PNKLjIuTvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sl4rOw+mt2BxyAK5P5Sd6EEeh+/ht6K5aJtD3/GzaanGN303pU+cJ7ahbyExWoo+AdrasopvwsPkoaWF+dP915mIkyUjZNFGglEKScU83G86yGE8UuDrKXXjngE70nrmhQXk6kPIlvvrrNe0WRJXo0XZTWnbuLvGOfVXjG9DCDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anizWvRZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCE0C4CEED;
	Tue, 15 Apr 2025 02:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685565;
	bh=IGxreNlwpqQm5syFJ8pj7BbF6kEXtKAd/PNKLjIuTvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=anizWvRZYfmt1Bm+YMw3o69qlGNd7ikTjSrCPDfDDjXFX8r1Em34EaA2rWaIaUbba
	 KP6m+GhaBtf1gQN18oXsVnhBlLNMNonJTNSA/PIZhCvCHG2DHLGnLgl44Vw7K7/iWk
	 Lze/6VRbgJGRaY97jBLVo1+Sg03L0yP2s35dDczt76NRZV/zyw40tVoPDArGEoiJWb
	 nguIIIfC3CucCHfZ2m5sEOVbo1ZOh4g1gL26Pg7FkU+c3V0xmKLCPwIOlXhHwRyToz
	 MelztK/oN3r/r+u8/NuLL0VF5gElZI3XQdveWsSISbHnOb/zYMYgwkl2F1Pefn+QDs
	 0gn54hV6vYuLg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Remove unnecessary MM_[UD]L audio routes
Date: Mon, 14 Apr 2025 21:52:38 -0500
Message-ID: <174468553410.331095.18181920532616083271.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411-cleanup-mm-routes-v1-1-ba98f653aa69@fairphone.com>
References: <20250411-cleanup-mm-routes-v1-1-ba98f653aa69@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 11 Apr 2025 10:33:29 +0200, Luca Weiss wrote:
> Since commit 6fd8d2d275f7 ("ASoC: qcom: qdsp6: Move frontend AIFs to
> q6asm-dai") from over 4 years ago the audio routes beween MM_DL* +
> MultiMedia* Playback and MultiMedia* Capture + MM_UL* are not necessary
> anymore and can be removed from the dts files. It also helps to stop
> anyone copying these into new dts files.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Remove unnecessary MM_[UD]L audio routes
      commit: e8acfc1bbcda6978d952d0c18b0b5cebd6dcc3cf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

