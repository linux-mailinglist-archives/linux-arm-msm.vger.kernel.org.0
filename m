Return-Path: <linux-arm-msm+bounces-51469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 554BFA61B52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46E8919C716D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074E5205504;
	Fri, 14 Mar 2025 20:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTtIvoPn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC522054FC;
	Fri, 14 Mar 2025 20:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982487; cv=none; b=JwdKdw7E+8eY3p/KHilIduBuYzJAy+bEKySw7jY5hHLXsF/r1RYFEI07e0VlblAUYPjFt69U/npL7PqezRZBGUEkdZqbIjshcaFZzAZZIhTNOSVCOM8kpzoJZIy0yeRifMO5NJWKneZtqI48+YeeIljkpOw3t7UiEIb7VnhToAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982487; c=relaxed/simple;
	bh=7QGZ7xaTf/3SlpzVut2WZXHGuqSjQkoHapFcv4678CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z2A3LnzYBIy7jCRzympzdLxjW4SelbQXsXcLuq7N05uReoe2A5PtLKcXQjI6tv21tTh93QVdgyC9E000XAyW5kwfAWEx/Otgxx+ReC6Hla791dwvf2z4IPltqO9JK6OGfqFJg5mvaP+Sg4I8cAQsuS8lGIRB3zEiG3A2Gu7X2YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTtIvoPn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49485C4AF0D;
	Fri, 14 Mar 2025 20:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982487;
	bh=7QGZ7xaTf/3SlpzVut2WZXHGuqSjQkoHapFcv4678CY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KTtIvoPn1yIgjBUa0Axhr94P7Y4aUqbPoPyYBb+E2U9v1uGTzq4qsBrUV0d53N29l
	 AAJ6SOYmrfCXFZjM/7TWekM0iNIxQJKJqsuFEItE8fJlJqYG3ouZyxWpt6JiRDGcoR
	 /A+eiyVOOyNjgq6i1GBCNIEXWsjxOBQM7tv4eZps98AP+Ogv3E6fZBmLj3XtNd9IEv
	 lDQ5TZG5P6GGlq8UkMuzOYR1CzA2v1csVOQ2l42cHARa+IU0UCO2L0EGyttPDC3WwF
	 JSS8HdyKhQD3DxJwahYGyFaetmMerCQu24UylSO7QT3+5Mk5aIXYwKJ6WnI63Wek0p
	 3X4UvyhGMlwEA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: add compressed playback support
Date: Fri, 14 Mar 2025 15:00:43 -0500
Message-ID: <174198247883.1604753.17086131825024158633.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228162308.388818-1-alexey.klimov@linaro.org>
References: <20250228162308.388818-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Feb 2025 16:23:08 +0000, Alexey Klimov wrote:
> Audio DSP supports compressed playback on this SoC. It is required
> to add compressed DAI and separate MultimeMedia DAI link to enable this.
> 
> Fcplay or cplay tools from tinycompress can playback, say, mp3 files:
> fcplay -c 0 -d 3 test.mp3
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qrb5165-rb5: add compressed playback support
      commit: e03ed4ee41c054dcfc3fe8d045e016cc0aa3a22a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

