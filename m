Return-Path: <linux-arm-msm+bounces-48071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46211A3685D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8F063B1C84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A671FCCF6;
	Fri, 14 Feb 2025 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnjyTvzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EEF1FCCEE;
	Fri, 14 Feb 2025 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572710; cv=none; b=c+lLLKC7s1hiEmY1+2SgxnhTtyBX5/JSKDHLRTNUWY52JSd36MDlGEPHEYT1ME9KXxKM3oI+Vj0MdwHwoSj8Fpvx2aBIvIJx/A8PbIeTBHwSWD5enV69oHF7QsQ3CFxtgeoVgXUUgYRGiRNtFhQ1LUxSzIsyQcjbrQ6aXnjboJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572710; c=relaxed/simple;
	bh=SpCdwRQBfYCDk/4gmU1owxLsAqchcJhOtmEpHoN0j2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UXci1ABboHzErLeQ3RRwUfYXY0oXIvA74+SAAw2fzhetZImuINdjW2LduRfrIgolbHG3aZtgDMQZ2ATFHhmMLU8h66QSBLaRLVjWBSLBnMLMX2rOOmwNYp6JUWW7x6qZlscrcDWME6WMuQaGoRXpsyQ+3lsgKqVJ75osifEegSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnjyTvzn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380B6C4CEE2;
	Fri, 14 Feb 2025 22:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572710;
	bh=SpCdwRQBfYCDk/4gmU1owxLsAqchcJhOtmEpHoN0j2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rnjyTvzn6a6eP2xBzzsTZGWs+n7OBtwxsc5xf1J81kmSvokjLnj+UjkZF350TZ2MG
	 q0KUH+aRJbfyejTGonKMXSvPxGIY0ZLf3ZyOKb7mdwk9RpMdEtCjoOrnKjgZhW9Nnr
	 SFVysVArkt17LCDUtGgx01hOdKQrHQ7m/blcWo+MvEwOuEoxtCWCeNTW9+eBm0TBmO
	 5Rs4BKJ2inQR4FckdyYJpHVakwS8aUKCdmKU7ks7hE/kZfd2Mg16o6LJNEv5iPc+ii
	 KCo9qE/VZ/LYVSwH/VqJjUBSwH66KLnY/7xBzp2hdm7j8U9Ak90T2khA6D5wIvWz6a
	 yZ/mQIvUqyX4A==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniil Titov <daniilt971@gmail.com>
Subject: Re: (subset) [PATCH 0/2] Add rpm clocks for SDM429
Date: Fri, 14 Feb 2025 16:38:12 -0600
Message-ID: <173957268923.110887.4300504764987368924.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212-sdm429-rpm-v1-0-0a24ac19a478@mainlining.org>
References: <20250212-sdm429-rpm-v1-0-0a24ac19a478@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Feb 2025 18:04:08 +0100, Barnabás Czémán wrote:
> This patch series add rpm clocks for SDM429 SoC.
> 
> 

Applied, thanks!

[2/2] clk: qcom: smd-rpm: Add clocks for SDM429
      commit: fd77406f30d06d1d5243e6f56e9ada27a057f00c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

