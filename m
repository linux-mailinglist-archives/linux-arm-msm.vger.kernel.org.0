Return-Path: <linux-arm-msm+bounces-51487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3349A61BA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 430FE174F40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18AD21148A;
	Fri, 14 Mar 2025 20:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4a5jqan"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F33205504;
	Fri, 14 Mar 2025 20:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982507; cv=none; b=utUpqYLMIUYOIAlsNijYptH7FXaSyRrryHQmch/5fBuqA1zLduHI7lp6Kzm9enOL3eAA6yHLM0AGUoIkXbJ4RTfwRLH+KtbhDKrzyYYAvMVAqT+gQjC5w23nB6aLRKfO+QeYGbiLaaSdkd95llyI7iOU++BJmRBcqNZegsCb9NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982507; c=relaxed/simple;
	bh=ut330dTdfnpJqsYvKk6rN/hDpShbrLHwwyNbq5NzDts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tpO7pkz+T6VR09ixxKQpZSqkX24NHn5rkkVL2//pR0x7NE+Qt5z0eG4vwB62RKHG323T17QQymAPMkV2d7OU5PK8Ei9TyDnmMSzBVUozZNCzhE/p1wCZFEYmMVDloViPAQv7fOqmFrxjz7aJIlzvdYnvOYiFM/IhJaA1HEuyMrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4a5jqan; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9E3C4CEED;
	Fri, 14 Mar 2025 20:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982507;
	bh=ut330dTdfnpJqsYvKk6rN/hDpShbrLHwwyNbq5NzDts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l4a5jqanCgfApP2rJPV1sFJA0u6h5eZHObS/VevCq+WdIf21mlLGcXbCUBHRJhi8h
	 wONdYNkHFJ+iVaLw9/LjTlFU1M9K5iLJmSHkWhdh2DP5jJL3NBwTSI8+eUwLnj7Clu
	 oJ15ozEGNdGkVJEhegahgvdHVj5pRYErjTEaXd3AulO1UZpiWmaKJmSgyd6pBA04Y9
	 OvZOxqon1wmduUZYvX6pCwsFXui/+KPbl3bFtCsk/XsGbn56g1R9UNfr2TFcS+V33J
	 K+dHzHe2akQXpwFusxm7l8EyxAkCHpg8OplYeg+F5Qfik3gkysVeQ2CkbWf6KJtnNf
	 CAMH2MhSt6wiQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop `tx-sched-sp` property
Date: Fri, 14 Mar 2025 15:01:01 -0500
Message-ID: <174198247875.1604753.605934829072180644.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218125157.412701-1-prabhakar.csengg@gmail.com>
References: <20250218125157.412701-1-prabhakar.csengg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Feb 2025 12:51:57 +0000, Lad Prabhakar wrote:
> The `tx-sched-sp` property was removed in commit aed6864035b1 ("net:
> stmmac: platform: Delete a redundant condition branch").
> 
> Therefore, it can be safely removed from the device tree.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Drop `tx-sched-sp` property
      commit: df52f9ab185e91886c8fb0660a0768d29b4cc379

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

