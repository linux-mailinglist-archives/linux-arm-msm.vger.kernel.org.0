Return-Path: <linux-arm-msm+bounces-28680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D63953BB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70DA01F253BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D346F156F4A;
	Thu, 15 Aug 2024 20:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Foea1jlz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9813156F3B;
	Thu, 15 Aug 2024 20:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754470; cv=none; b=LAXMcHQcG9qw/3N80lGTUcrpIqqKC8ALM6aRlmhQy+XBsfJTX+ebE6sxxwlGhFwJAnq3jKZqWbtVsvNxfVuKsQpXBovGU4WZ6aeJCYznGiOaZiNK5Hj+mzBT62/L/LbUB8/zVdhwjwmKCl7nEtLrEVu59sQTlAZzXVxgsLq4IIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754470; c=relaxed/simple;
	bh=TK6lbymrIrAaAD0r9MG8bxB6OwdLFFQpg4ukBBVT0+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DVAU1F7us3PAAaDrqKi/8M761rHeIxAMK0kCnNkLshgn3Pt0Ao+b90oUbBCTyB0+rfqzBRzrtOwq4cuSY7BPEW43MuK7KwLrdm8+OwR+5BkK2eO9tVk6pkY/NzYGwPNNlMtgbb0AqRLsD2LbPpETBXU4O/TsHGV9qZ3iTCcgEj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Foea1jlz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3989CC4AF19;
	Thu, 15 Aug 2024 20:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754470;
	bh=TK6lbymrIrAaAD0r9MG8bxB6OwdLFFQpg4ukBBVT0+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Foea1jlzF2HL7MHuUs25TQcPs9NSgPRTRm48OISVyWK60hB3o1EuswbnWLTcmia9K
	 TyOw2uWbgdKDaZ5BA+G9WdmWaDakvhZ6TErkbsgdxO9Tv7fbTwZvimi43niVCJh9Kd
	 tBws7Ws2VDIYdz5hnqYNwI96F+fjPIqd9iabVjs6H2K/8L7WxKV3tbR0I4EJqe0nxx
	 O8k32/aFcIuoHYytNr+uNRDJRwjvdJhY+xmLmVRw0jOTCMZL4x1P3y+was2Us17WJh
	 3Hi1RzmEUkW0+f0hPFrKGiuXH0AbBtbJesC+KXHsNGLuv00w2ViCnPqN7Fys2s87re
	 Pl7IHKmqrhDEg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: disable GPU on x1e80100 by default
Date: Thu, 15 Aug 2024 15:40:26 -0500
Message-ID: <172375444811.1011236.13289783244778155957.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715-x1e8-zap-name-v3-1-e7a5258c3c2e@linaro.org>
References: <20240715-x1e8-zap-name-v3-1-e7a5258c3c2e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Jul 2024 22:17:44 +0300, Dmitry Baryshkov wrote:
> The GPU on X1E80100 requires ZAP 'shader' file to be useful. Since the
> file is signed by the OEM keys and might be not available by default,
> disable the GPU node and drop the firmware name from the x1e80100.dtsi
> file. Devices not being fused to use OEM keys can specify generic
> location at `qcom/x1e80100/gen70500_zap.mbn` while enabling the GPU.
> 
> The CRD and QCP were lucky enough to work with the default settings, so
> reenable the GPU on those platforms and provide correct firmware-name
> (including the SoC subdir).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: disable GPU on x1e80100 by default
      commit: 1f7574a1f9a892dd79e0dfc03f38573e9c399ec2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

