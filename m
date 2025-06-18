Return-Path: <linux-arm-msm+bounces-61669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA5BADE22F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 06:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECCE3179B3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAFE21C9F6;
	Wed, 18 Jun 2025 04:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZp5RtfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB91E21C9E4;
	Wed, 18 Jun 2025 04:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219787; cv=none; b=MXrLwxDt3WPzHiV0bxbeFlhYg4DfA8DPOl7PcPaPR1u33UDt1CEySpe+Rz85glm9TyGS0cTdb7hpnevZGCVXytjZDhTasa98OBOiuXgbLVbc6o5lgBn4I7zDi/aWc2zr/2h/ovC2iPJM0dy5uWZLnrmo9F/e8l3LSPRWWpD8+CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219787; c=relaxed/simple;
	bh=ax3s8pt9yPxx7IZ5Th3PdebzAZFxeJy6BX8OiAynhJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oIKgIyOMsawcboO+EeYWnz55g8Vg/ypi30uH6tFb+iZmRTgNvbW2JDFpj7yzVvfx/msdtOjB0wDtNBfxmaiQQ4pAC1fa4p1k5eA8NMAhhxStqE9f1qasqothxSP2/siMXcq+3igDRzCXfu2q9weV/7Abjh7tyLi8B8m7sYxDkiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZp5RtfO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195D3C4CEF1;
	Wed, 18 Jun 2025 04:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219787;
	bh=ax3s8pt9yPxx7IZ5Th3PdebzAZFxeJy6BX8OiAynhJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eZp5RtfOFeNGm+5/7tZH81D/HYQ4jmO4gCNrj2dNgt6pGWgoNFge7u0He8GZdvdp1
	 gULNVLmKgz7+KnhU3D8XLXxmSM6oUUzHSN0ylO0G56XdJK/DiLBQIpnGWkyVld3zWw
	 5d/fwvTVkZxLVOKUHDz4hQJ9vmaMS/D+K8sB0Vlk10GFoMtXrME1MZAaJzx+mf201z
	 HI4NpJWmYGl24CPN5PdwDFTmFmYI1g2kNf5ZdfJOXcR7gdnjoeCKDkRRPs46o7oeCY
	 PdLO8XTNio6wdlXvAUL237qPaohdcig5nBLhQrjBL4v/cBWGNafloso8blfiJApge7
	 XyI/p5bRjfC6w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	todor.too@gmail.com,
	rfoss@kernel.org,
	bryan.odonoghue@linaro.org,
	Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Depeng Shao <quic_depengs@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Add support for camss
Date: Tue, 17 Jun 2025 23:09:28 -0500
Message-ID: <175021976651.732077.6463322520296960558.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612-sm8550-camss-v2-1-ed370124075e@quicinc.com>
References: <20250612-sm8550-camss-v2-1-ed370124075e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Jun 2025 16:01:26 +0800, Wenmeng Liu wrote:
> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> SM8550 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 8 x CSI PHY
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8550: Add support for camss
      commit: c5aeb681fcdd23d042d780f89ddcf908a13baee2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

