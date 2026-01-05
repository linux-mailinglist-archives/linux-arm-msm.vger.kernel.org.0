Return-Path: <linux-arm-msm+bounces-87482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E0CCF4251
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A15653077652
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439953385BE;
	Mon,  5 Jan 2026 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkOlDxSW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BC2255F3F;
	Mon,  5 Jan 2026 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622101; cv=none; b=k+TruaSC6PM2bbiWOloG5vENytH8W3JS67AG3BcWYQB+hu/nmVPS8qCJREDdVtPq2wvoL6/mFQjCp5XSUcvceHA95ZT4bO4WpFziGGLEJAxhXjCjdnILy/W0MC5RF/jFjxqI8KqW2vIIcMtMvqnQYaZ5Cxn8kZFBdIX6N+INvPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622101; c=relaxed/simple;
	bh=to8eUGgU5EWZAgOuezn8x6O8LJS981ABlZcMFiTj9eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NRGdJR8VudwVfOMEcygUXWeyhH+osTJ8ZU7VX9t6oJOLHO0uFRw905u4wpfTpveR6+p7VUwFxZGP/KZpgJEVOel3npH0KkwHHrKWcjCbSiW0jyg2bYB0W8XF6Ma9F0fI0qdc29bO3Ss4a41dYpaVi2uaoKe95lUQRQsZYGT3OZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkOlDxSW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2F1C16AAE;
	Mon,  5 Jan 2026 14:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622100;
	bh=to8eUGgU5EWZAgOuezn8x6O8LJS981ABlZcMFiTj9eA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QkOlDxSWXUUyKCP9uNk+abQz2nPiWIwu2ZjYHmuvbfTeIdEL73FkVYogM72EYxMe2
	 XDNZ4Y+eZcDcA1vv9rd1ao4EPLbzQdQuXgmskVhUSOS+hK/16InmszmnBUZ5huDPx6
	 St/ahnG17FZ1ejmWQ8PBPfloVgGHLyxXvz4eF55zSfFjG+HZHUyV/t05mhu54pxZQI
	 mHzAsfzTVOPsfkO0Vbapwt+uUEWo6TkFbt/LMRcZLnl6OZ7Dcli1ER0/CdI9HFRodf
	 nenHJ2OEucMZOo/c/c0X6RdR0R7pfnjEUt2D5y8xDh9uICylFVLTBcelotokaFiZUf
	 zWK2u0p9teJ5w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 1/2] arm64: dts: qcom: hamoa: Add sound DAI prefixes for DP
Date: Mon,  5 Jan 2026 08:07:29 -0600
Message-ID: <176762206364.2923194.15000641449194582431.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Dec 2025 13:00:52 +0100, Krzysztof Kozlowski wrote:
> Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
> controller, need to add dedicated prefix for these mixers to avoid
> conflicts and to allow ALSA to properly configure given instance.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: hamoa: Add sound DAI prefixes for DP
      commit: d12cd85a4ff494bb73e2e8f8af7ed66851241941
[2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback over DisplayPort
      commit: ba439ad9134c8b9ce033056c059cd161d30afec7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

