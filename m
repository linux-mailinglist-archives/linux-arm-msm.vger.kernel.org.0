Return-Path: <linux-arm-msm+bounces-73771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC33B59E8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 18:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF2593B0EA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFF32F5A01;
	Tue, 16 Sep 2025 16:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfEKzCMW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F93B28D8D0;
	Tue, 16 Sep 2025 16:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041908; cv=none; b=W+MOSdPidiuuENdx6C2Y4Bb7corNQsjio63oI1GL/CFPnabjahepiix/oWfum6XvXHA2x/Qx4bfAmkhMH3yhiPrw5pXzCNrFnwJp2x0loOFldV05mmRe1bB1pHnR6K8hZn4Rm6CiEiEt5sx5+mPkEYruKDRuuC8koX6r+yB24xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041908; c=relaxed/simple;
	bh=syemib16GRAwzNRupHQ+7X8BDcUG6jWxEc9yi14PZ5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CPDzzjNYH0dC9jq7y2s7WRmWx6C/ZdpqSJFCVo/Fe1qq2LebRFrOQQPGgMlexR3kbWRAI9YeQNirkEyS0I/gSRwzNb0EGyo+itxTaDRfO+asbKeu+1vEgHO105wvocVgFiO3jkhKycqux35xx1JEAyZGD3YjcQhxXmritIKJYQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfEKzCMW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FDBC4CEEB;
	Tue, 16 Sep 2025 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041908;
	bh=syemib16GRAwzNRupHQ+7X8BDcUG6jWxEc9yi14PZ5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RfEKzCMWQFMSmwwm1fu/X/mMA9icthWzBR3YK9VJmWF2kXpH2lcbxLTcfuWyESUVh
	 xHRZ3/P0hQQ1TqwI8+ThrrKXN0TTM0bjFxf1sp//5GZPde8Zpmdg+ks6VqGyCnDqBx
	 sYZhQmLzgqxdqP2P9Ej81CzoeFk+Tw5VcqDE0v3BWpZD/HRClxl+fJjBRVRGscnHWS
	 oRfz3S8FnyTbyBdZIh3caf5qHGPO0pIIYS68AS1Lx2AAZSx7Glm6Lgd/hftPNZSPyH
	 7tfKyR3w5DpPQrw4xm6HsGMPuPhDZt10g+bmCSxp883GYNJCGQ7vCYh7tSBEwp4vId
	 2fHdqmjYIeAKg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 0/3] arm64: dts: qcom: x1-hp-x14: Add support for X1P42100 HP Omnibook X14
Date: Tue, 16 Sep 2025 11:58:11 -0500
Message-ID: <175804189839.3983789.17469195986909523419.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz>
References: <20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 10 Jul 2025 12:50:32 +0200, Jens Glathe wrote:
> This patch series adds support for the HP Omnibook X Laptop 14-fe1xxx. [1]
> 
> Since this is actually the same model as the 14-fe0xxx, but with an
> X1P-42-100 SoC (Purwa), it needs a slightly different device tree.
> To have as minimal duplicate definition as possible, the hp X14 gets
> commonalized into a dtsi (and it stays compatible to the derived
> device trees, like the Ultrabook G1q).
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add HP Omnibook X14 AI X1P4200 variant
      commit: a58d6100ee2c4a732fb4e1520885958480a82110
[2/3] arm64: dts: qcom: x1-hp-x14: Unify HP Omnibook X14 device tree structure
      commit: 72b50c2fd887f632501ce69e03d8e6bb35c8a1e8
[3/3] arm64: dts: qcom: x1-hp-x14: Add support for X1P42100 HP Omnibook X14
      commit: f8f7cc59dcd234f0dcc4964ff2188a7a2ae09fd6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

