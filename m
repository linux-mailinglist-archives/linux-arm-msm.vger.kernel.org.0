Return-Path: <linux-arm-msm+bounces-60858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7D5AD412B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4243189EF66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321B3248F64;
	Tue, 10 Jun 2025 17:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zemp2pbB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051AD248F5C;
	Tue, 10 Jun 2025 17:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749577446; cv=none; b=VSVCSbstiASVSgqKssxTD4h7brkx7jwJ2ygreGYdl9/HLxpDvkkC/ErBnvS8k/Pxh0tM9EWPf8MKskq3kB25accjnxqyqMEtOEAF9e66Fxrwodu7CkH2kSXxS6p5ok3lQRGv3ldeq1PcPrJflk+UPbaV6bAqtmpcODZD7ChXFUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749577446; c=relaxed/simple;
	bh=kuF/EAO9IS+mnI+wo9091yeDU+qi5L0v6tsMO0RHpkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KaYy+uUXp0JwZL5lDcTW0PngQucyiBisSwc4j6m9noVuMZAR54HzdAYImk3KE6IqNThQy0H/8CH+PTbyXlSekVpgCLY8LTIJW4GCfeKGFJ5hU0XqVdefg3fcWBLviNnzQL1/a5gPdLSrgJko2mvsMWhQ1+IBtBKV0eXQCWfUqUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zemp2pbB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2D8C4CEF5;
	Tue, 10 Jun 2025 17:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749577445;
	bh=kuF/EAO9IS+mnI+wo9091yeDU+qi5L0v6tsMO0RHpkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zemp2pbBu0+5C1ooPMseYeNb+53pt1icntEgmUVM7ez1WqgXaGMSM36rNGD7qTRYZ
	 1PbzTzK85pJwEe+C1L0CCzqkxK10ze+fsQudO4xSx+unovej/TsHUmCB6n3FB89hf/
	 evMtK7wxpA8P5HGKJgmTZnlfJPJAUwJzT5NdZ17v7sUnjAySJ/Hb3F00CMvLIzFCT/
	 VLW7OuU58JlQutU8Weh3pq0r2mnexM1QVccaKz7fOHptT6YI6jOr7+q8BSXNhChWic
	 Uv7d3+5hEexw/YePmA4aTCfJus/nOk8Z/HcJ/2GJ01NPxS8b97yCHAq9pa3MUykDxF
	 z4l/RYnHogScg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Trivial stray lines removal
Date: Tue, 10 Jun 2025 12:43:58 -0500
Message-ID: <174957743667.435769.1609847746481859291.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605151040.56942-1-eugen.hristev@linaro.org>
References: <20250605151040.56942-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Jun 2025 18:10:39 +0300, Eugen Hristev wrote:
> Remove stray lines
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Trivial stray lines removal
      commit: 5f9ec130f1b92347cd6efeea5d9c2d2fb93cd59a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

