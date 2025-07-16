Return-Path: <linux-arm-msm+bounces-65317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AADB07E32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 21:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9309C3B1D1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 19:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E1C2D1F42;
	Wed, 16 Jul 2025 19:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8pZSY3Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726A12C3264;
	Wed, 16 Jul 2025 19:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694864; cv=none; b=U98z5y35c15NSgdEFv/ydhS4vCew0OrRWEJ05do5HAHy7CyU4Qj+X+TRKpgkEh8US4cf0bRvpjn2r1S3z9wM8VUQgLiWP8KOAMl5bPFCdpaFkweRMD33en5rIU0JcFM0pqmmO66QpZm4JyXYt9eX6OXiTzlaItGH0+bN0FnekJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694864; c=relaxed/simple;
	bh=2f9F6KsIbPhR+Xx6USyVQWNHNpkPpww+7zb8c38mNxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PE4Xmf6PTnJp2lGHPJFX8Uho186LJPW48sRzIh6fVAgyYX7wzFThVE83Dg8oo759kPzm5zGfV23zKXzErhmKroYmwzMA5ewzVOrUgQZ3RiEX5J4HVdPcxNqyIHOF0LReJpphCmkMEAxF3vur3ft8Uyic0v1uBi4pTBovQ1pulJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8pZSY3Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C79C4CEF1;
	Wed, 16 Jul 2025 19:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752694864;
	bh=2f9F6KsIbPhR+Xx6USyVQWNHNpkPpww+7zb8c38mNxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W8pZSY3Yhw8TrJfxjBSfFM3jNj2XHqd38twj/33fyNEwUnLxFdk5K4TenC7DS/7cB
	 rZVWs5U4KpXOc2iDn/5ftCw+/3JXNLH0UCL7UuiaIa4rCddwSNlA6ouacWyk9nT9Cg
	 bk20EBox71ofVHr217PtHChydb0093fG3RohBoItQHMWhc1eBUDf9LYKr6MQZSjSzM
	 Ynj6EaRVUYi3W+0cRKcakZGGItPvYZswL75w7oWFgchPSeklSZrTeB12+QbhEJ6YqF
	 wKqYDzCpMRp4wnOQc7WdcTg1JPHBJC4VIQpaDN7oeK2jCZQgiouPhCHrcrsnVr/acp
	 c/4+EE84z6hWA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: rename DisplayPort labels
Date: Wed, 16 Jul 2025 14:40:53 -0500
Message-ID: <175269485294.105136.6056088780288161868.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250621-sdm845-dp-rename-v1-1-6f7f13443b43@oss.qualcomm.com>
References: <20250621-sdm845-dp-rename-v1-1-6f7f13443b43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Jun 2025 21:20:02 +0300, Dmitry Baryshkov wrote:
> Rename DP labels to have mdss_ prefix, so that corresponding device
> nodes are grouped together.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845: rename DisplayPort labels
      commit: e0ad28ecbbb4c9be51bd6664c4673ca893e33ffb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

