Return-Path: <linux-arm-msm+bounces-54862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D0FA952BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 16:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECF273B505E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 14:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF111B4247;
	Mon, 21 Apr 2025 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1h9Q/V3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51D21A83FF;
	Mon, 21 Apr 2025 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245536; cv=none; b=RoD5vYo6/s1C1sOdUWkAK+OkLduJ3s45oHLscxLfOdsRk7qm6UOOZO97sKqoUl3EhScenE7mU646cJ926//nQh9iRVJ8dEfNc92Uulo6VlIAHihnYcUwnQ2VnVHLWwFwVCnoGW+IJB05t6BLiJi6Yx+z6bfOzUtT3gy4Z/FKc14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245536; c=relaxed/simple;
	bh=ZF7/d8zZAzECaycUfu1kBA8GvpttgAWVoDU+v0DIgEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AEX+1aeuJ0lpgB8+AfCjEl8DyoH+ShBW6oF5GsHEKROh/vx+jneGYIV6gNXIE1CMpNYPf8Q6r3IIEfHXTQVqM+xa7pG7jcvDypi2pL3jW+gZpS3cZSVLtS0EN/j45f9JmwfPF7vOd1pCkytEhRTRKCR+wvTRNgOJ23jw3EaKjow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1h9Q/V3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83F8C4CEEC;
	Mon, 21 Apr 2025 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745245536;
	bh=ZF7/d8zZAzECaycUfu1kBA8GvpttgAWVoDU+v0DIgEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W1h9Q/V3/Rtv3sJcTTcOW8WDV85Cm22HBkUvtpaOI0m2zidMzXU66Yhv67WJOMCn8
	 PBzmWLEVlqDvVqmT/FCbhwiFu3ktKCzlbqL0/R0RmMQ64TPhUmdDgGo2oXluBGERPA
	 IGwGan1c7DpeYhMuut2JXw1Qg1+m0ZVDuw1r2WT932eCKHFLzEL6bMpF691/UnytDC
	 5L3GMyM7YzMVMuq5F8mTEqCx3thBm/TglYlnuznffsm4GQVdE+gYGD4HzCBf9TKPWq
	 i07b978JD0mct9bh69HuDcY9rUZzuVLN9E2S/7Puy6CiluUNVk0umWtAWetcJUnvMu
	 E3z1g1uFrjLLw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] Add snps,dis_u3_susphy_quirk for some QC targets
Date: Mon, 21 Apr 2025 09:25:31 -0500
Message-ID: <174524552575.708487.5624208070172830014.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
References: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Mar 2025 18:00:14 +0530, Prashanth K wrote:
> During device mode initialization on certain QC targets, before the
> runstop bit is set, sometimes it's observed that the GEVNTADR{LO/HI}
> register write fails. As a result, GEVTADDR registers are still 0x0.
> Upon setting runstop bit, DWC3 controller attempts to write the new
> events to address 0x0, causing an SMMU fault and system crash. More
> info about the crash at [1].
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: sm8150: Add snps,dis_u3_susphy_quirk
      commit: 9bdbd5286ea597db6131c197ae9ee8614cce1890
[2/5] arm64: dts: qcom: sm8350: Add snps,dis_u3_susphy_quirk
      commit: a7dac91e56ae58e1479002e5b94fab73039f2e29
[3/5] arm64: dts: qcom: sm8450: Add snps,dis_u3_susphy_quirk
      commit: 9588f10adb5b67bea7eeebed2490c20dfbe82e77
[4/5] arm64: dts: qcom: qcs615: Add snps,dis_u3_susphy_quirk
      commit: ad2011e02dab5ccc9f38848a3d909855a4ae7c8f
[5/5] arm64: dts: qcom: qdu1000: Add snps,dis_u3_susphy_quirk
      commit: 25eee6c64376fcdc375b97c7e1f105e132654563

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

