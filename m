Return-Path: <linux-arm-msm+bounces-79715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 302FEC212AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85651189074F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AE2369976;
	Thu, 30 Oct 2025 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tybFdWkn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6236996F;
	Thu, 30 Oct 2025 16:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761841369; cv=none; b=Buol1IV6XvPO28xk8c1JVOfa0vbn/byX0GG406yAeDCmotQEu6Jc+0y3TPC+QewC/5Jar4/w2JNyIMgJC4ftmNQDu+9n14uLnS2QrQjUFPyyX3F64o5R2KGM/FJ9NYoWmHpTZxpNnNIufVJ5CrD4tSk8mOBQ6KarREnHEMaJrow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761841369; c=relaxed/simple;
	bh=P3F6FNR2z+xsU0YPcxjJGPxww0x9NMZ6Na5PqU31D4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=doB14b+YqmuKBoEaHI/L5Ni47iJCj21Rxym7Ny0HhVmMoipGmMv/jgeCmg6tFc3DPz7useFwVMEimAT25cHBQgAJ8dWNnwOz0d8FYjA1N02SYHXevODJVgZtXqVO2A616vqHZ4K7nvhJoJEe+8eYrFaXfIxfdHqZHp689Xb8ldM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tybFdWkn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C307C19422;
	Thu, 30 Oct 2025 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841368;
	bh=P3F6FNR2z+xsU0YPcxjJGPxww0x9NMZ6Na5PqU31D4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tybFdWknYeHd7GYsmZnN9Go8Dgv0EqqCKhRnMRx0yqxBtQ33zo1Qaycm7iRtJ1Vng
	 wPVqrGJBPOYqDPNnmP7IDua+PZ5oDJdVXuGdpNPhF3nveTqoukjXjEnazhQ1BpJHdd
	 l4MNVigmle9Yp0ZO4k8gkgO4PCKsgTnMah4x7zKVQuFn0KHXADrA2JNYCPG3jejpeO
	 BTved38HeWwhrkGDu/qgamNYc3Xnk6gJGtH57HOVgxaGpbHGd4JYYetGbmFlsDdIng
	 iUodQubO2H6/OQozJHkJuPKrRWecduAveIw23aAupuZ+drDwJ6NKo7goTG+c2gzF8O
	 GrxwwW/56YL4A==
From: Bjorn Andersson <andersson@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	quic_nguyenb@quicinc.com,
	quic_rampraka@quicinc.com,
	quic_pragalla@quicinc.com,
	quic_sayalil@quicinc.com,
	quic_nitirawa@quicinc.com,
	quic_bhaskarv@quicinc.com,
	kernel@oss.qualcomm.com
Subject: Re: (subset) [PATCH V6 0/4] Add level shifter support for qualcomm SOC's.
Date: Thu, 30 Oct 2025 11:25:40 -0500
Message-ID: <176184154241.475875.8535266594593136722.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908104122.2062653-1-quic_sartgarg@quicinc.com>
References: <20250908104122.2062653-1-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Sep 2025 16:11:18 +0530, Sarthak Garg wrote:
> Add level shifter support for qualcomm SOC's.
> 
> - Changed from v5
>     - As suggested by Krzysztof Kozlowski reintroduced minimum/maximum
>     in dt bindings and avoid repeating constraints in free form
>     text.
>     - As suggested by Krzysztof Kozlowski/Konrad Dybcio update commit
>     message reflecting discussions and previous disagreements.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sm8550: Limit max SD HS mode frequency by default
      commit: c3398456f6f6121e79f6c3d9bff00076cf7a3521

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

