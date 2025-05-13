Return-Path: <linux-arm-msm+bounces-57763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBDEAB5E0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66F9319E1AEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043F719D89B;
	Tue, 13 May 2025 20:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmBEn0bO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7C61FAC50;
	Tue, 13 May 2025 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169216; cv=none; b=C4smY3CXERRfigTRvGDb5fX3iD+/J7xkzO8CG7JBYGRoIMXze8gSJHYT8c9J79GApi2NhsFNc6E9/ijzAl4EWkm7zXIR6rryaKT8DDxlmhToEokDDcuxfIFC4fjhtC1tncFtnuPTw793G8YyC1hnae58lB9x/0rPWEyHnxirhn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169216; c=relaxed/simple;
	bh=+j808kvkFFM08tP2KQUAU8onbCu16u11zEuUrBIdQzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bGumEs/4Pyx+WWwzjvxo4hTvHhArMZEfv7TBnGqRouLdn0QOeZz5Fz05ffetjoCAzNVUQHNqjaX8JoPuDpYN4MSRH303Qr157l+3KQusUoq0UtVfukL+ZqBrYQfTxSZGkWK+HSDRfCNQ1PwIxC/2tGWgYZvHbeBLE3GzKGFOwNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmBEn0bO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EBE3C4CEEF;
	Tue, 13 May 2025 20:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169216;
	bh=+j808kvkFFM08tP2KQUAU8onbCu16u11zEuUrBIdQzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DmBEn0bO8kHFi1zHYmyDl3232tvOgUKcMv7n44K1Ul65lPpKte7hxcJCysGaWVrvq
	 a02mRmSap43UvfZiwrHdW0s7s30dLJG3aJB9k8ieGBpmfdLXt4uLaDa7KLtj0ZyI1D
	 xovoEvIFog+kinZZg3AaxBuC3b4rd3FHbqCUa2sVT34RrLS+SDtwudwhlLecpvVbBU
	 sUKexlskHvzVmZRuD9TURGJrmDuI71aUXGZJALmf/p2Jym1ceAJAddkd8gvsqbU8av
	 jRpJsAAyclk3O+XIHvID2RvFxKpDM3fWeYb0Tl5Tqg15lahq4rKEJMfjN4wxaN403P
	 OhvN6zkMjcouQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: apq8064-lg-nexus4-mako: Enable WiFi
Date: Tue, 13 May 2025 21:46:39 +0100
Message-ID: <174716895376.39748.14615340278406920831.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318-lg-nexus4-mako-enable-wifi-v1-1-e3b4a09d9f68@ixit.cz>
References: <20250318-lg-nexus4-mako-enable-wifi-v1-1-e3b4a09d9f68@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Mar 2025 13:51:21 +0100, David Heidelberg wrote:
> The Wi-Fi setup is identical to that of the Sony Xperia Z (Yuga).
> 
> Verified against the legacy kernel configuration inside
>  arch/arm/mach-msm/board-8064-regulator.c
> using LineageOS 14.1 kernel sources.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: qcom: apq8064-lg-nexus4-mako: Enable WiFi
      commit: 5e1be5d4617f68030eeab0532cf134948e19f5a2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

