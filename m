Return-Path: <linux-arm-msm+bounces-44056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B471AA03341
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 00:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A051A163B99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 23:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BB11E25E5;
	Mon,  6 Jan 2025 23:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVxcJfOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12CF1E231A;
	Mon,  6 Jan 2025 23:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736205633; cv=none; b=udYAEW5zH7cp6TXKcKJvKqemjAzhhyD+koYhTM8bRkHXydBQF8+A1QTZ1Emv/lC5tFgpK8O8BXfZPePsE7PYyStck+56/CMzw6HqBQ20P+JXQNqeF9SE69totwoJu84ZynztYS16pNryMtZBcz2hgYtKuP1R7rMLHY8Dy19GWSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736205633; c=relaxed/simple;
	bh=nNMeca1KPvkfqy3QnMHoCwHQluqtZ9hq1GhYIg7cB8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JAd2PJpy5ywt7OUiCAJW+eDu3hxUC+z3bz20Z4lbnfIEXNtH7LhU+oVjWzu69W0U3h5xJ/U7Whs1kRJ1NWJz3msmfwK8cN6sp1lQ55psHIII8wcdatRclDrlZucNb+M0qqj1EQBVF4BhRyC02S24AfXuNuGA7FpkmfkfM1Ds73I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVxcJfOl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963C6C4CEE4;
	Mon,  6 Jan 2025 23:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736205633;
	bh=nNMeca1KPvkfqy3QnMHoCwHQluqtZ9hq1GhYIg7cB8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EVxcJfOlq9y8n9w1XL+PV3QS2C+Tn1preALMbupo9EN+vhzzKGPE/l8d8liKZ4p2a
	 Hwa9X84peQ5IBC9+1JzXWesRYEaT66FUL8rAJyl2qIvYAmM5yO9alPKLuwlFP2lKF4
	 RTBjBDjJLDLxRruc3dDNZhlulS2WgqCVEyX/dCQb9S9uoeYVoX3Q4XUEZawBaxxsHL
	 hmuGimtw2pRba7tIGDsBbobWAMo6qy5Qx/kEtyQARp/KdBcMnwtQiHpkUDnR8Oppwf
	 Sa3aB9+Lygtbt7RVaNzBXNW0li0CY//1JEk5h6rGzIT+KGFIRc0R5XoEqZBblbbTrj
	 yq4uXNkvFCkEg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Prashanth K <quic_prashk@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	cros-qcom-dts-watchers@chromium.org
Subject: Re: [PATCH v4 00/17] Disable USB U1/U2 entry for QC ARM64 targets
Date: Mon,  6 Jan 2025 17:20:28 -0600
Message-ID: <173620562619.21468.12633829539050439876.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231081115.3149850-1-quic_prashk@quicinc.com>
References: <20241231081115.3149850-1-quic_prashk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 31 Dec 2024 13:40:58 +0530, Prashanth K wrote:
> Enabling U1 and U2 power-saving states can lead to stability and
> performance issues, particularly for latency-sensitive or high-
> throughput applications. These low-power link states are intended
> to reduce power consumption by allowing the device to enter partial
> low-power modes during idle periods. However, they can sometimes
> result in unexpected behavior. Over the years, some of the issues
> seen are as follows:
> 
> [...]

Applied, thanks!

[01/17] arm64: dts: qcom: sm8350: Disable USB U1/U2 entry
        commit: 8582f8cee2f015ff4b8c5df3221917f3878f4c2a
[02/17] arm64: dts: qcom: sm8450: Disable USB U1/U2 entry
        commit: f9a963fc2510d32916e2e730c1b326c2ab3d312e
[03/17] arm64: dts: qcom: sm8150: Disable USB U1/U2 entry
        commit: 20f36ce4db5b544de640b5e47ac656fdd97b4896
[04/17] arm64: dts: qcom: sm6125: Disable USB U1/U2 entry
        commit: 2c1cf4b8cd8b4c574f1e367fd7f4fd44c1a1169a
[05/17] arm64: dts: qcom: sm8250: Disable USB U1/U2 entry
        commit: 06fcb653237b91e4befed93254b7c53e0d6139dc
[06/17] arm64: dts: qcom: sm6350: Disable USB U1/U2 entry
        commit: 8e252c3e4500eb8708de1d6e9ebead55a78a5d5d
[07/17] arm64: dts: qcom: sc7280: Disable USB U1/U2 entry
        commit: 0a13ba449afd4158cc981ff8b53d5c62aa34b377
[08/17] arm64: dts: qcom: sa8775p: Disable USB U1/U2 entry
        commit: 1052c4c63639ade18bfa2902371fd5e6c44b01e4
[09/17] arm64: dts: qcom: sdm630: Disable USB U1/U2 entry
        commit: 10b4593ba0f8b410d946d587828e6cae8f7cc78b
[10/17] arm64: dts: qcom: sdm845: Disable USB U1/U2 entry
        commit: c6b3c16f2c627a487653bc52d99b05a2bc453dc0
[11/17] arm64: dts: qcom: sdx75: Disable USB U1/U2 entry
        commit: cd2a6747583b441ad898834d3dd246ed271ad35d
[12/17] arm64: dts: qcom: qcs404: Disable USB U1/U2 entry
        commit: fc492c79faac5b44cb548578e35467873391094c
[13/17] arm64: dts: qcom: sc7180: Disable USB U1/U2 entry
        commit: 69336441c3c2dec512ed9c46d977c6587ebc795a
[14/17] arm64: dts: qcom: x1e80100: Disable USB U1/U2 entry
        commit: 9555a30e5f5d6fe97eed96907e867dc7543e1ccf
[15/17] arm64: dts: qcom: qdu1000: Disable USB U1/U2 entry
        commit: f70a41cefdd457d21198aeb5a062b98fddf780b3
[16/17] arm64: dts: qcom: sc8280xp: Disable USB U1/U2 entry
        commit: 49cfd97a335acbbdc9737e471a8ea3cbcea6c476
[17/17] arm64: dts: qcom: sc8180x: Disable USB U1/U2 entry
        commit: b7fdfac3f372b9d633cca6c1c54878118c8a5932

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

