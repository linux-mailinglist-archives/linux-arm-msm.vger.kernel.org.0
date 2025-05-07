Return-Path: <linux-arm-msm+bounces-57047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1969AAD510
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B39F468B0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 05:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833EA1E0B91;
	Wed,  7 May 2025 05:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9T1sA47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA91D5CFB;
	Wed,  7 May 2025 05:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595094; cv=none; b=jl3LykS7gP1LnEvgzMV8OJ/my4WzMolzTQ9yEuDyPu54A1BQNKx8CSOVkTZzfwJHDhyIP9g66yuhowCcuMlJmUGRBCUT3qGqYfRBQYjUF2GzVFKmcD0HOwi/kj/JTxRmiWh8dBKxuDN75DUBBBrHiMXaqHezABvegTKlaaxvFhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595094; c=relaxed/simple;
	bh=VqLzePtK1zk4IDdSyMT4jeybzDjh3hrth6xldiD545s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=igflM85TT4wEWbUPVoE2i550ha/QdNReaU65Hjq1DojeEA4l054DVFbeTUyLb+CbxlWxCYDjB0cFrSos9MarGIkmFuVj1iv3VOuCTc7rFywMZYXjK0Ab3a1RTLOJQuMpPVGKtX5qDJZQXW9T/GfInI6AW/1NtnDEau7SBLHfwmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9T1sA47; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C1FC4CEE9;
	Wed,  7 May 2025 05:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746595094;
	bh=VqLzePtK1zk4IDdSyMT4jeybzDjh3hrth6xldiD545s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I9T1sA47NLqQp0xriRNa5TTyUnyd5wTkULdRLnZCsPAyljyuyBEf9miQBaGy7XaHp
	 QYrrxYFl0bg46dYoT6yQbUkHnA0Seb9FCPAfsaZL1aZmpY8fpL0qi2+69xWRwCVM4S
	 3XyMXguxkycbxWjIkHDCVHkEMTtDz3mIIwT+a0TFqaH/ag/xKF7lK+TKRhxxRos2jt
	 QUl1IBIc6LG09aOIBgYknjTqZZRPMOUyOiEOejQMLHISjPxuLB9b2eiNRbFJdYmpuE
	 Hq2w9Ag529uFJTDld1JjgybLdkOnep9hlyOmsuE3Ue5bvDMhTd59eIaa9OIyt6xa+9
	 jR4OIWFn1nuWg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: x1e001de-devkit: USB retimers related fixes
Date: Tue,  6 May 2025 22:18:04 -0700
Message-ID: <174659505820.5380.18331626591249839304.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-0-0129c4f2b6d7@linaro.org>
References: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-0-0129c4f2b6d7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Apr 2025 14:25:21 +0300, Abel Vesa wrote:
> These fixes align all the USB retimer related nodes on the Devkit with the
> CRD and T14s.
> 
> This patchset is based on Johan's:
> https://lore.kernel.org/all/20250318074907.13903-1-johan+linaro@kernel.org/
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e001de-devkit: Describe USB retimers resets pin configs
      commit: f76fdcd2550991c854a698a9f881b1579455fc0a
[2/2] arm64: dts: qcom: x1e001de-devkit: Fix pin config for USB0 retimer vregs
      commit: 635d0c8edf26994dc1dcbc09add9423aa61869b0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

