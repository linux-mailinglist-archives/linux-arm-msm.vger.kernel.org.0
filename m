Return-Path: <linux-arm-msm+bounces-87382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A25EDCF2470
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 08:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C60193000B7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 07:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A08A2D97BB;
	Mon,  5 Jan 2026 07:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLNvTwzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA92C0281;
	Mon,  5 Jan 2026 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767599586; cv=none; b=Xryt029OBMWKzCCcOpi7yxuc8QeDC8WKlFZIRaIlWUcfVGxpelJX6KPooZrKYTG+FBCpJgftZCVRj+qZWQRvrcCM1IP/ilulWXHi08NwUcyJRsLkefTc/PF10c5NtwGrf8wGFPTFV/1EiL0aDvSY4Xj/RkGqmI5mWBZXvM7JRhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767599586; c=relaxed/simple;
	bh=Vl9Fn6kZeCMLR1Ud+b/QmBMv3YvMdmFK0HP02rXbN+M=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B4BIfcnUQU8n9EfLdiO+LXaXQVg0pppa64itJAVG1arbQbdxuSBcwN3ofG4CCmH1RtUCYVu08HHGXro8cCVZZtP/1Btg4EYUxhGhwBtBcZ0LaRSS7AlJ3Kfed6jDE2wp2DQPFwom1z7V1xRFoY6ikf/rkTbAr4BGDo0CwRaGBHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLNvTwzm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70913C19421;
	Mon,  5 Jan 2026 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767599585;
	bh=Vl9Fn6kZeCMLR1Ud+b/QmBMv3YvMdmFK0HP02rXbN+M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=FLNvTwzmBC4xn47pAo7WQakISc5qNVy905ywL+KdRXqSBdJpxCqpVqntzwL7cpNm8
	 foXBQl94KmegRQjGxYIAYR1doIkP+umcM6Cwy2/E+Wogjuf+CyyZCmok0JvVHMVIHD
	 zzjKfKaVmUBPHgsD2c3BXJOJC1sFMO2MPwgZj4Qu72X+0veEm3DObxFnjCCoAmcfgn
	 RID3v+DWFyuWGLyvdhDMXI1sR8x88tMCuZo97ZOeTXqr/YEZrailxp352d4wTgU2PJ
	 +A+8RDoJLiNejbLcKqaS95nsxqjzATzte8JEncyWJ0SkwpHtmMka9QhqSKTuXXzEKn
	 U/O0Gg9RwdSwA==
From: Srinivas Kandagatla <srini@kernel.org>
To: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260102124808.64219-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124808.64219-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] slimbus: qcom-ngd: Simplify with scoped for each OF
 child loop
Message-Id: <176759958394.16703.16018114241492921567.b4-ty@kernel.org>
Date: Mon, 05 Jan 2026 07:53:03 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 02 Jan 2026 13:48:09 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/1] slimbus: qcom-ngd: Simplify with scoped for each OF child loop
      commit: 6af1ec752dd456ffbff48fa3c9f717470ae83e9e

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


