Return-Path: <linux-arm-msm+bounces-34635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9F39A143B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 22:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB8A01F22ABE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 20:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29D82170C2;
	Wed, 16 Oct 2024 20:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kdl9aNru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B716B2170B8;
	Wed, 16 Oct 2024 20:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729111358; cv=none; b=KkO5SJQt29nmfLgx8ZTK2VsDel1x3VDFYtnH1u7p8FCs/cS4Uqswy5WAB+EGNbzZpYC9IqEXrLiVq06NMf4vOfltReGZ2APHheAPHrdfElf1pt2742X+ZGwM1w3gS5bKiefmtdF3i6Pkv7eltSV9U/dH3AZKzGPnxG/jB2mqZbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729111358; c=relaxed/simple;
	bh=Lp0AzNRAChIiw5nzARCmUqYz9LKkzl8vnhEh7rW/Lo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DqAUPJu1QHounWaT4oK9QfnTi0wXSc2mvRU8XBxXTxx6SM6Pyhe2qzt0em9cbVRtXxJet2gbAsG2zfWuLVNAHIjlU1pAAzuftY1G5jF22W3Y0afjRoS+MyoC8zICv1e2M/JnPL9fUqsjdGe2Eap1kNxE04jQTsRVTfWBDjldwSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kdl9aNru; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD89C4CED0;
	Wed, 16 Oct 2024 20:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729111358;
	bh=Lp0AzNRAChIiw5nzARCmUqYz9LKkzl8vnhEh7rW/Lo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kdl9aNruL7Santg8u5GQafXbfMckX8b6AHQDa9bHZWsOX2ZIycS7s5ZEs0V5Hx/99
	 75G/WeKrLB81REBQv5DQYgCkZX7NJOYetRr2Cr2zVojSbFX1r5QvtwpUl9g01ivzpJ
	 oYrGLEREpGpwnfXcZXRZLDs1ICmk4v1surX0jMwhAHerrjNmBoPiJ2GVBgwghB8ldL
	 g9YFjziOY+3uaBpZxsSDpviEKtSCf5j01QfjgSdvmXk210N7pJmKC01EPukCE59azC
	 J7iF+KF9EhlD9KtcolAaNRhDgYfAw/5N3HFj2V9jxZY65RY2RvhhvGSdl9rwn1MspE
	 kvjH831kf4zYg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100: Fix PCIe 6a lanes description
Date: Wed, 16 Oct 2024 15:42:26 -0500
Message-ID: <172911112247.3304.6608002416744675055.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009-x1e80100-dts-fixes-pcie6a-v3-1-14a1163e691b@linaro.org>
References: <20241009-x1e80100-dts-fixes-pcie6a-v3-1-14a1163e691b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Oct 2024 14:07:23 +0300, Abel Vesa wrote:
> Fix the description and compatible for PCIe 6a, as it is in fact a
> 4-lanes controller and PHY, but it can also be used in 2-lanes mode. For
> 4-lanes mode, it uses the lanes provided by PCIe 6b. For 2-lanes mode,
> PCIe 6a uses 2 lanes and then PCIe 6b uses the other 2 lanes. The number
> of lanes in which the PHY should be configured depends on a TCSR register
> value on each individual board.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Fix PCIe 6a lanes description
      commit: 837c333f46df8ce6755ba82c53acb91948ec0072

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

