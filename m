Return-Path: <linux-arm-msm+bounces-24962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 724EF924FC1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E45428D74F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A15369D2B;
	Wed,  3 Jul 2024 03:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asXBn9ym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3886B61FF5;
	Wed,  3 Jul 2024 03:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977865; cv=none; b=bvosmdKRhNJJ/nb4z9tiKEARQqqD4unMBroc4T+s6HNWlXTZFrXbgxOVDHx+vVKfPxxoqhe5kQLUGxX8iO9VnAVqgDuQyVaHDpJsdza9pnVueELtdQCTVEfnn2zokOxjk+3THJ8pEoU6DvmQsae8CkvO+Mw/rH//LEDLrLibXTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977865; c=relaxed/simple;
	bh=DRYBl4YlMLmuqeaB9jkMsDaAU9hELQ5HpZPkTDMRu5o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bMYxX1Pt5m2o7+0CnWhUolmsaxkXRTXcyFPTam8LhAI/KanLNU7u4nonynmq34wWWfGifooO7QtL0tDzLSaQV/T9pxem3TsVpzgSt21vaInNO+mNKbH6vKodwNruRaHmiQFqDN2eQgfv6aTroXDWmqM8dXossgVxDy0wpqGPdqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asXBn9ym; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18499C4AF0E;
	Wed,  3 Jul 2024 03:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977864;
	bh=DRYBl4YlMLmuqeaB9jkMsDaAU9hELQ5HpZPkTDMRu5o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=asXBn9ymROQj2OtmQ01WVNkqooNRMvSiWOBAACshhTBQXCOMngABujgQ9uRTESSBP
	 AS9xaVoQGi2V0+pR/FiygW2NGTbqltV4uUV9I64+0djf9/7LzgWvZk5BPdOOJRtC3p
	 frZu4gfIrIHZup5YuZQu7HCprYhXUh0XJDyZMMUrVbNy204MAZg3r3uvNPVI+zD7/G
	 HuR6j9hu+kM2YYPqoeRHQVE7m+05BFJJBc8VVEdj5t2NGWquptcREqMR6ujAftvR1Y
	 9ZX3eZXrI7grT9Tgn8VwjRGO/9FX32uZeh9Uhs+GCiwGR3i7uIG57yeN35gKR1d+91
	 PjHa7bDtR5G6A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/3] arm64: dts: qcom: sm8550-hdk: add port mapping to speakers
Date: Tue,  2 Jul 2024 22:37:27 -0500
Message-ID: <171997785362.348959.15000565557349544658.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627122015.30945-1-krzysztof.kozlowski@linaro.org>
References: <20240627122015.30945-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Jun 2024 14:20:13 +0200, Krzysztof Kozlowski wrote:
> Add appropriate mappings of Soundwire ports of WSA8845 speaker.  This
> solves second (south) speaker sound distortions when playing audio.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sm8550-hdk: add port mapping to speakers
      commit: 21663c69b3f75ae52d9f1f6b844aa2bb314a6a3f
[2/3] arm64: dts: qcom: sm8550-mtp: add port mapping to speakers
      commit: 5ba3ba4d4439709c68b96aef3b0e71c63fd9d665
[3/3] arm64: dts: qcom: sm8550-qrd: add port mapping to speakers
      commit: 6bf99fdb4c93b165e77b879606f2e9c2571399da

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

