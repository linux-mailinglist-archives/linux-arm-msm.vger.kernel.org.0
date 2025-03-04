Return-Path: <linux-arm-msm+bounces-50235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D154A4E8AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 945107AAAE0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282F028040A;
	Tue,  4 Mar 2025 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mas1+VsW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF5F280401;
	Tue,  4 Mar 2025 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107624; cv=none; b=ayacfY48/9qE2DVJ7mfc4RceDKjPJAx66LuH5pjx1i/DzUKWWYWMur7oGYxDfez6L77XJWqdnQygODLjcBDGutxGoPXnJiutpO4BDeYZDs6WhSsI3SU1DiZv/TJEMF2dwXQTINBlE4W2YQ6wkRn/vnkHTy7O9MwgDEdQY47/zEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107624; c=relaxed/simple;
	bh=sltXNmTtvPNgg02o6+gMK6emZ6yR2AW8gTpa4mnPZkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BjeNho7jxCrBitRoZZ3l0SXxDT7xFYG/bVNyHkyOUY/PnTxTS901g8IUAGXHypLNANDq0EAczVr+aj5GQdyzgVq9vOUVo359x++RgPg0DHOEsUdh0e7yUoB9jm6rq7Ui+M9QuhRH4ukDLMHIJHyeNRNTJAwH8OhVByz2d+yBVS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mas1+VsW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B66C4CEEB;
	Tue,  4 Mar 2025 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741107623;
	bh=sltXNmTtvPNgg02o6+gMK6emZ6yR2AW8gTpa4mnPZkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mas1+VsWYGpuBN5UWwd42+asCJyRkoxFbfNMJUwPaDmKBuug1NkexdXJVjB7vyiOP
	 MMwvZdCRwTVADXeTFDgqQoi/UF0+whKv4qUvW6d4IENH4ll6WlIo6HeUGLVeXcBOuH
	 SmyCD5rf0xMiguvrv+3uMgkSdpaA2xgM2L1NU78ov0EqJ6/aN1uejtVFnnlYLOP6My
	 44V4zNSpjYhmAB9FGqc+ebK6HS67DQ/48JMijPUDGQpME1ABf+IWNRKUHWvaRccdne
	 vvqhXZZ+fe4Z+8IqFWil6Ved2XcjOMp84zoMKaiK4SWmqd4MuaJSEJX/3MS+hQADty
	 fELwWefrou3Cg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 00/13] arm: dts: qcom: Switch to undeprecated qcom,calibration-variant
Date: Tue,  4 Mar 2025 11:00:10 -0600
Message-ID: <174110761299.741733.15423494263862521182.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
References: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Feb 2025 10:58:57 +0100, Krzysztof Kozlowski wrote:
> Dependency
> ==========
> RFC, because this should be merged release after driver support is
> merged:
> https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/T/#t
> 
> Change will affect out of tree users, like other projects, of this DTS.
> 
> [...]

Applied, thanks!

[01/13] ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-variant
        commit: adbbdcf4b2d6556721b580385ba387baca5c26ee
[02/13] arm64: dts: qcom: msm8998: Switch to undeprecated qcom,calibration-variant
        commit: f1bf8a943bea70c7432731c11761d161882aeedc
[03/13] arm64: dts: qcom: qrb2210-rb1: Switch to undeprecated qcom,calibration-variant
        commit: 41eeff2fc2292c56592206741b05fde63acef4f0
[04/13] arm64: dts: qcom: qrb4210-rb2: Switch to undeprecated qcom,calibration-variant
        commit: a83356f7ba575f536dd2bf2338cafd0d1d2d51ec
[05/13] arm64: dts: qcom: sc7180: Switch to undeprecated qcom,calibration-variant
        commit: 4f8fc2038b3ce9fa1fd52491e774e43bf5e67547
[06/13] arm64: dts: qcom: sdm845: Switch to undeprecated qcom,calibration-variant
        commit: 218718e0c2536bc17c1a10eed35e99100bed5b46
[07/13] arm64: dts: qcom: sda660-ifc6560: Switch to undeprecated qcom,calibration-variant
        commit: 020ec05884e97175a181b33eb60d556ceaa32de8
[08/13] arm64: dts: qcom: sm6115: Switch to undeprecated qcom,calibration-variant
        commit: d39d4fd49337be1e8f6c28e4d31344a2124acb57
[09/13] arm64: dts: qcom: sm8150-hdk: Switch to undeprecated qcom,calibration-variant
        commit: b187df5a0224d2e1b5ab8ea19c98d6ebbe554fe8
[10/13] arm64: dts: qcom: qcm6490: Switch to undeprecated qcom,calibration-variant
        commit: cfbcd6d483dc7203db230cb24c9ee286033682fa
[11/13] arm64: dts: qcom: sa8775p-ride: Switch to undeprecated qcom,calibration-variant
        commit: fda76284e9b4c4606758fb62cfd81dd57e8f2516
[12/13] arm64: dts: qcom: sc8280xp: Switch to undeprecated qcom,calibration-variant
        commit: d12ce84c88013cd4ea770d244d44362f691e1690
[13/13] arm64: dts: qcom: sm8250-elish: Switch to undeprecated qcom,calibration-variant
        commit: 37eb85ae550004790c98605762c2e0326a82e160

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

