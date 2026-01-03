Return-Path: <linux-arm-msm+bounces-87322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7BACF02A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 17:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3EC1300F258
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 16:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A814A30E852;
	Sat,  3 Jan 2026 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+K5a7AK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC1D238C1A;
	Sat,  3 Jan 2026 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767456193; cv=none; b=NVquFvfWcoNQ5m4tlM9JXDtVGQLQ5m0ma7nDNidPR+IomupO2GPXWfvyc3LQWwVZMklf8ErNlSNGJ+qrKd8pcUXuhTOmTrQ49tpRFdRKImLLV5mWi89WBhAd6QEIYPmGAnj839aLb55jACc4xiX/+PV8Mei/IyhGNWzX1kKUsbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767456193; c=relaxed/simple;
	bh=0ATwBgSCA304+zVcamhIA5woTg/JKull178yywwaJ4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4XnOIbvpJ5u4eHBgerbH2E1fmLxiLXYFDgv4oqa1GxAYr9JwCtc5rcjbE+mkE1tEgyZ/UMJ8Ma9EJG1m7sZPsvJGNtrX9fGkgNyJwUFeyu7YrL0krjWKL+kvpP8bQD8onNM5ZJ6ymIrIsDFeQMSm3e7KqXRyUg24uTkOYisNWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+K5a7AK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEAAC19422;
	Sat,  3 Jan 2026 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767456193;
	bh=0ATwBgSCA304+zVcamhIA5woTg/JKull178yywwaJ4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O+K5a7AKJLCut5SNGwXHcj3zaIi2PAC1MxLjbZ0RQaDidgqce+qJ39Cjg8qdloTL2
	 ZftQ6pjpbUjSv1EPbALu+O3QVVEl6/NxZuUe+U/4dw6Yx2N6oGcEozMpEyC3Q85lLM
	 juPp6+zPjhLxRUe4ruCLmkoAzSsdlpilirPnwJQL9SLnNuQlLyFUBSEKBJ64X/JAG+
	 tQM4O3fiJBiSM7zbqkH/KP025BlmUQoVLqOsiFCwPQkJXGesH7cSs+jssj4otnTof5
	 LAA3mUq/UR2GGOpYsXKaZGrQHMZdANgSBKPwvM3jWvMuPi7LQTaDQSgPx04XYluqI6
	 znTc9hJlM/Rvg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: sm8650: Enable CAMSS and image sensors
Date: Sat,  3 Jan 2026 10:03:00 -0600
Message-ID: <176745617456.2631416.2861100615641371235.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
References: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Dec 2025 06:15:01 +0200, Vladimir Zapolskiy wrote:
> Enable CAMSS and Samsung S5KJN1 image sensor on SM8650-QRD and SM8650-HDK/RCC
> boards.
> 
> The changeset uses v4 Samsung S5KJN1 image sensor dt bindings:
> - https://lore.kernel.org/linux-media/20251204041134.131707-1-vladimir.zapolskiy@linaro.org/
> 
> Changes from v1 to v2:
> * added Tested-by tag for the changes tested on SM8650-QRD (Neil),
> * dropped mclk-pins level from MCLK pad pinmux descriptions (Konrad),
> * moved 'status' property to the end of the list of properties (Konrad),
> * renamed supply property names to match the sensor driver changes (Luca),
> * added blank lines separating groups of properties under isp dt node (Bryan),
> * removed an optional 'data-lanes' property of S5KJN1 image sensor,
> * rebased on top of next-20251203 tag from the linux-next.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sm8650: Add CAMSS device tree node
      commit: e8560ac937d92e16e636bbaf387f638b3198fa9c
[2/4] arm64: dts: qcom: sm8650: Add description of MCLK pins
      commit: 0ddb0d63453f320806727604702b6f6636a645c3
[3/4] arm64: dts: qcom: sm8650-qrd: Enable CAMSS and Samsung S5KJN1 camera sensor
      commit: 328407ba89ae6656c143967ba65465c50150aaf8
[4/4] arm64: dts: qcom: sm8650-hdk: Add support for the Rear Camera Card overlay
      commit: 1c20a021de58a23bdc264b91d75e944d19e49ba2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

