Return-Path: <linux-arm-msm+bounces-53601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42317A81BC5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 06:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99465886CCD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 04:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61ECF17A309;
	Wed,  9 Apr 2025 04:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k38rmXDx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C2A3D76;
	Wed,  9 Apr 2025 04:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744171442; cv=none; b=olL5OWO3wkj98legQX9jFgFGKmCu7o4xeOM2gdyBngYWgzA/H2caPgmfhph9YgEPSbjikNMspdBKZGh+uRhjtTx0Vu83zd2iHy88+xdaVYtfhCey3C1QEZGJaGY7aZNcylBqhNVE6GMoxlghGtr7mx0WAfmQc4N9WJE2QvL4DKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744171442; c=relaxed/simple;
	bh=D03yomViP85sZ7xkf5etK1i+y2JadkTdw7EFuab7kVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jAhp7rL0dFnuuskT192xMNhs8k9ZVWUAWLYc0cFeqv2E8xTsBKrYgWTrzFX/1pmFfbB8HCmQnshJwOyqrMvAz+qASC8dvSPntCGktZp6I3NuAVLKXVydwTxjxSJ20fZW873Bd5xg/8gIi8nZBLmtpH3m9aCHZobRqbATMwZLCvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k38rmXDx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE062C4CEE3;
	Wed,  9 Apr 2025 04:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744171441;
	bh=D03yomViP85sZ7xkf5etK1i+y2JadkTdw7EFuab7kVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k38rmXDxCqQT3hB1u+hC500R/vsTcgMNqpyf28DpXoFQjPVOT2cBOIGUq8iYzHmtR
	 thy3gTfGh6mudDEgEDE7H7rcxh0cm8APa8RqH4TIimxpDcYS+PrPJC7IvK1rETxmNh
	 LKciXo0L86TV6fF/bgGXzzflAs0RJeZPEKpJV4oubf1f5+lRwmj5n3recncubx/C3u
	 qrkoGjlNe1l2hB3O2nkt5VTyKIntsGTfxQZFXxklWZQ5Z19Ry+zUT7hIiC2KrIvFWU
	 j3yWdce7Yh82xrCzZ21QTg6gbBl+UToTMWf/B6nxooQuW0MAEANgwNC7uQU85OARhF
	 qz7FeadRPIrhw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 00/24] ARM / arm64: dts: qcom: Use the header with DSI phy clock IDs
Date: Tue,  8 Apr 2025 23:03:59 -0500
Message-ID: <174417136198.113796.2666820396319444637.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
References: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Apr 2025 11:31:57 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Collect tags and rebase (no changes).
> - Dependency was merged, so this can send be applied freely.
> - Link to v1: https://lore.kernel.org/r/20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org
> 
> Use the header with DSI phy clock IDs to make code more readable.
> Changes done with sed with alignment/wrapping fixups. Verified with
> dtx_diff.
> 
> [...]

Applied, thanks!

[01/24] ARM: dts: qcom: msm8226: Use the header with DSI phy clock IDs
        commit: 17268faf29992d37033d6ad1a5ed5d924f2430d8
[02/24] ARM: dts: qcom: msm8974: Use the header with DSI phy clock IDs
        commit: 1afdd80d1e021f758c975d857c6beb6da5c891bd
[03/24] ARM: dts: qcom: msm8916: Use the header with DSI phy clock IDs
        commit: 651af46f33ab284400e0fc307e5a81de54c75945
[04/24] arm64: dts: qcom: msm8917: Use the header with DSI phy clock IDs
        commit: 7c92da246e1a6933f25fa015d6c43a6bcfb2c7b3
[05/24] arm64: dts: qcom: msm8939: Use the header with DSI phy clock IDs
        commit: 011e7f2c26dcb42c255ab54207f548d68c3b8e38
[06/24] arm64: dts: qcom: msm8953: Use the header with DSI phy clock IDs
        commit: 8e35fab460cce97e387a2c975db45b762b551521
[07/24] arm64: dts: qcom: msm8976: Use the header with DSI phy clock IDs
        commit: b06f27d09ed455f153d2523f96bbd94ecf6a69d8
[08/24] arm64: dts: qcom: msm8996: Use the header with DSI phy clock IDs
        commit: 4b32499da71716e075ea2dba115e3fe8b6f8ed2f
[09/24] arm64: dts: qcom: msm8998: Use the header with DSI phy clock IDs
        commit: f4220c41decc1944ef319c859840aa5405eee6fa
[10/24] arm64: dts: qcom: qcm2290: Use the header with DSI phy clock IDs
        commit: 48478f726f3793a9d1cf9b10d6487a81ea7e3c73
[11/24] arm64: dts: qcom: sc7180: Use the header with DSI phy clock IDs
        commit: adaa876233c102e53fb2bafe4f502474613f4ed2
[12/24] arm64: dts: qcom: sc8180x: Use the header with DSI phy clock IDs
        commit: 4390fc773154ea25c0aeb4e75d0425cfa8de431f
[13/24] arm64: dts: qcom: sdm630: Use the header with DSI phy clock IDs
        commit: 3c1ae3b255555406c5ff030190649437e399dde9
[14/24] arm64: dts: qcom: sdm670: Use the header with DSI phy clock IDs
        commit: dc489ba0dea37e3655d265f5889ade0d173229d5
[15/24] arm64: dts: qcom: sdm845: Use the header with DSI phy clock IDs
        commit: 77764620c1888e8c8dc169f7c2f693fc4db96964
[16/24] arm64: dts: qcom: sm6115: Use the header with DSI phy clock IDs
        commit: b44bf3bc74912649b2495894e82f5384e24e2060
[17/24] arm64: dts: qcom: sm6125: Use the header with DSI phy clock IDs
        commit: 4f40ebbebcd9a7a03b72aac478c7df7c7b44c635
[18/24] arm64: dts: qcom: sm6350: Use the header with DSI phy clock IDs
        commit: ab7cd7f3968f14171d50ba0b0655186c3857d258
[19/24] arm64: dts: qcom: sm8150: Use the header with DSI phy clock IDs
        commit: 35ed99d7f589f310688fa0d088913e5c8927da43
[20/24] arm64: dts: qcom: sm8250: Use the header with DSI phy clock IDs
        commit: 855ff06098b7f3a2aca21b79d32d212fd096a98e
[21/24] arm64: dts: qcom: sm8350: Use the header with DSI phy clock IDs
        commit: ee4bb3169263bad99d68e0039e944ae53e77691a
[22/24] arm64: dts: qcom: sm8450: Use the header with DSI phy clock IDs
        commit: 0d18a031499d4ea2b86cdc8120c22bdcf22bcac0
[23/24] arm64: dts: qcom: sm8550: Use the header with DSI phy clock IDs
        commit: 0d046b7ad7d3c7f2dfc53fc5ad48e2fe2c3f2186
[24/24] arm64: dts: qcom: sm8650: Use the header with DSI phy clock IDs
        commit: 314ffec606514cdf6d4bbedaaeeba0c826b6afc2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

