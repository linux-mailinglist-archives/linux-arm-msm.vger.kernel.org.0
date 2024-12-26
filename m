Return-Path: <linux-arm-msm+bounces-43426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4925C9FCE88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2D9A16297B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EBB1B87DE;
	Thu, 26 Dec 2024 22:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhGxHJFu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FFC1B87D6;
	Thu, 26 Dec 2024 22:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252739; cv=none; b=BR2QXYiB1l0v38Ylo4Tnhtt8uL3spDx20DgmsmqFC/gahugf+W1EmGK08t3a9aPcQBb5ZO7/pCkPkXtmwq5s0qhZ4lmzcULm9FKFtbsaG5yIKQ5/qw1L8rFKQZqG+ta/NGBpqmOMdoUg6XolDTKyDLXxsUwIZ/1l50avQLj/xCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252739; c=relaxed/simple;
	bh=c0GWesiKZ7aSPdCLMnYcTcPpAUoHI/Prpc5ysy19OoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U2+J0aHMFmVQtyEmJ2IVDfFM3V1TGVrBE0/C8lBchdr3YgmZrE5uXRghlLedjuHg/zf/F78LKTomtiiBApDUehOe6pSKpdc99i4ezT9VpKRDlnY+6sd2qeF1biBkItu7Q8ebeobDOodvsOgYVBEvh0JNSrV4Ak2utX2igiZ20Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhGxHJFu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1541FC4CEDE;
	Thu, 26 Dec 2024 22:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252739;
	bh=c0GWesiKZ7aSPdCLMnYcTcPpAUoHI/Prpc5ysy19OoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jhGxHJFu7PnlBaswB0UuoQs1RXp3JG2Vqcm0b+evfgkdqrxfRwL4bgOUsQiLbKCcg
	 DyL3RkX59pi0uQiha3Dwr4Y2cECS5VFwfgh9qlepi6LLGwGBrZSDBJn2V4kW0LcguI
	 b0D2Ns1GiL5BobBYlg51sAvyFS6gzzncFNZlS4NpMD+6+vi+Liqdjq7yNJcZVks58r
	 qN/F/kqNKdtvTLHxIXKfIb7DteKAGXjbMovUbvz52LbXmODgDdSEcg9fDOyxDz9txl
	 zma2YObe7Rjqh/GVhSvhwYTpnTjxDa0fZHffpTzDpSQT2edmEO/AUbRp6tKhzoiGLq
	 WouR/8KceXRgA==
From: Bjorn Andersson <andersson@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: x1e80100: Describe SDCs and enable support on QCP
Date: Thu, 26 Dec 2024 16:38:30 -0600
Message-ID: <173525273241.1449028.5715156604566002763.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226-x1e80100-qcp-sdhc-v5-0-0b28f2e13c85@linaro.org>
References: <20241226-x1e80100-qcp-sdhc-v5-0-0b28f2e13c85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 26 Dec 2024 13:47:37 +0200, Abel Vesa wrote:
> The X1E80100 has two SDHC controllers (called SDC2 and SDC4).
> Describe both of them and enable the SDC2 on QCP. This brings
> SD card support for the microSD port on QCP.
> 
> The SDC4 is described but there is no device outthere yet that makes
> use of it, AFAIK.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100: Describe the SDHC controllers
      commit: ffb21c1e19b17f3b2f5f56c70e379ef7c96afad5
[2/2] arm64: dts: qcom: x1e80100-qcp: Enable SD card support
      commit: ab8f487d2f8905641541c27c7929363ee538b0f8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

