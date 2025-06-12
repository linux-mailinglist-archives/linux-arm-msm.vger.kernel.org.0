Return-Path: <linux-arm-msm+bounces-61048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E546AD6675
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8972F17FE8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFE0221D80;
	Thu, 12 Jun 2025 04:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q46dSIl8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3631922172D;
	Thu, 12 Jun 2025 04:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700861; cv=none; b=RhnDDkyK6rIqfmybcfe73e9ij6EqxwS5HQ/ozqMOM8IlAHOAQfym9o+2ngve9v70BmvNu+FFJwiuu/9bPKzgWpdHl8MZl3HlCjMk9UFFRcUBKX//AoKnym958CsID+4xDx1Ao3cyjNRiN8dHvI9/vHSoH0QYZQQcZJAH3hPcgFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700861; c=relaxed/simple;
	bh=wtqMGF7deYh5yhJVAwCPkwyqjfTVoiPw9lfeUdWW8x4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sL1K4zsMBuDBt0myFF5sKrQFpc5Ik+AWqqbtfzkLHfbup0OGi6WdLg32GO01Lgb7a8DeV+0Y/0sP4jhnnVkWhpQQWG0DNzBRK37VqyOuM60EFVS1XL+EAdAr4efqG3k+8G/WZU+mDzJ1P6yf6W6bE6Ctx91De+6L2iWrLz+ksDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q46dSIl8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C12C4CEEA;
	Thu, 12 Jun 2025 04:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700860;
	bh=wtqMGF7deYh5yhJVAwCPkwyqjfTVoiPw9lfeUdWW8x4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q46dSIl8PUriWjn12J2IThiilZ2/YsRk666r+s74LqqZP4ExjpvNtCBUNuzvxhiYX
	 53b+gXb5HB9L+A8UoS2frKcN8Od3v3IvMXbIIuw+chy3J8n7bT4otl8na8yPawc3kB
	 E0KBt+E2J+24+NqrbATV87mlU9okqa6+jy1UYZCeBiou/sZd6PoGQbpXha9NJtVLvO
	 nWyKLIQFwb4NGasam37YzzO0ehsKpzes7/PXKBzzupboyMn1bbP1LbWsvVtI3V8ZHe
	 9eNEl0zTodmoICjvAyP52FatMl0WsGdhUuiQwlLdgCShiFdYnOzClNf9x/75vHm/Sr
	 8cByH4E9jPBvA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH] arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+
Date: Wed, 11 Jun 2025 23:00:41 -0500
Message-ID: <174970084202.547582.17760199751687785442.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605173608.217495-2-krzysztof.kozlowski@linaro.org>
References: <20250605173608.217495-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Jun 2025 19:36:09 +0200, Krzysztof Kozlowski wrote:
> Enable the drivers for camera clock controllers on Qualcomm SM8550 and
> SM8650 SoC (enabled in all DTS files like SM8550-HDK or SM8650-HDK) and
> video clock controllers on Qualcomm SM8450 SoC (enabled in SM8450-HDK
> DTS).
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+
      commit: c5d02bbaa217b2454ba1ce7528113aa2ecf14f3c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

