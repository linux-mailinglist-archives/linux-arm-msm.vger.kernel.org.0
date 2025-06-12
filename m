Return-Path: <linux-arm-msm+bounces-61046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1E5AD666E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72E0717F9D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAFB210184;
	Thu, 12 Jun 2025 04:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LU+txM/W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE42520B81E;
	Thu, 12 Jun 2025 04:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700859; cv=none; b=pEe4XWbGtPI8lBNut3COnNdQPShookY/gH4aNicQ7gMGukAHX0PkPZhDIMi5CiQIOW4Qn4Z97GgWXcnSDpmeWM86XDbnR+4WtjpxshyUrr32oROzVh29xPcojZs8+7pqJkSIAbLcr6WSrW8Zo2R1644Mu4PVJzCTY7Uvj69kD7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700859; c=relaxed/simple;
	bh=n5qIWRLEp+KCJIzcgFkNr9a8YYeFWWgX2UXPJeOOJqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qOPYhtjnkmF86ll7VRTA0CIB5Cp1evvYJhJqXgWO0hkx/3b+K4d1kC4HqQggTtBAs30XWMkAVBi/AKVJqYzA/6rpxSnzoJFunF9OON4NkFDDy1eTRwNMUXwpdqKLHr9CaUO6+OEVNDPN6+U1unZ40VzujCj1YNSDKO8EcW1MkcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LU+txM/W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91417C4CEEA;
	Thu, 12 Jun 2025 04:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700859;
	bh=n5qIWRLEp+KCJIzcgFkNr9a8YYeFWWgX2UXPJeOOJqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LU+txM/WmchyeRWGJiuxxmKg1PM6js93skQnlFVxb5xD+SKZRKlUYYphFc+ufvNc0
	 rFX90n2esE0A86zCJLMgBQcS26sViKKtjnkLNMsJ17T+7tfRRbH1XK8HguzUh/N8/e
	 LAzN9fUu1fbKZzOPqn4qpe2CeYYB9s7vEUSfNgEjD3m65pm0+yDJ5v+B6fApbvibIz
	 FtEGe/gdhPx/63P2TiTfeFAiScteqfKNE5sN3N6Ym3AIjVfQXDO63tiu38+AieD+TQ
	 pGrCAFtlWsA9AolqlYE/+0vU+U048+rGeA2V7m/xt0mmSC/n59IZq+bPxnsuW6AjIG
	 flPGB1ZbIIJ4A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: sm8750: Add sound
Date: Wed, 11 Jun 2025 23:00:39 -0500
Message-ID: <174970084203.547582.11155224197455531897.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526-sm8750-audio-part-2-v3-0-74429c686bb1@linaro.org>
References: <20250526-sm8750-audio-part-2-v3-0-74429c686bb1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 26 May 2025 13:46:31 +0200, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Add vdd-px-supply to audio-codec node
> - Add tags
> - New patch #3 for QRD8750.
> - Link to v2: https://lore.kernel.org/r/20250519-sm8750-audio-part-2-v2-0-5ac5afdf4ee2@linaro.org
> 
> Changes in v2:
> - Patch #1:
>   - Use v2.1 compatible with v2.0 fallback (Konrad)
>   - Use hex address in <reg>
>   - Re-order nodes to keep proper sorting by unit address
> - Patch #2:
>   - Re-order codec/cpu nodes (Konrad)
> - Link to v1: https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8750: Add Soundwire nodes
      commit: 5b87cad934105e87f43de305122965444a36aecb
[2/3] arm64: dts: qcom: sm8750-mtp: Add sound (speakers, headset codec, dmics)
      commit: bd227f88faeb4cd9efc76f26c9ed91c058e6158a
[3/3] arm64: dts: qcom: sm8750-qrd: Add sound (speakers, headset codec, dmics)
      commit: 6f018e1881fb3460870c7e50152886fc4b076495

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

