Return-Path: <linux-arm-msm+bounces-27651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 292209441B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 05:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D29E91F22B68
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 03:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EA21487D1;
	Thu,  1 Aug 2024 03:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZFOptOk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669C61474D3;
	Thu,  1 Aug 2024 03:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482401; cv=none; b=OWct063iD+Ga41vZQCl1edaDhjzojq8YnyYFRYwxjDr/d2HhTnj6W2yWjQ4Xom2dM24kaCd8oLK0nn5EgRTAOnlEVaPqO/FiPxgJ2QClzudVIhJfwJ9R1Yvxev58IR5dXcNtjJqB1hSD37HwMrm3zjVTlG/kLo74bXKVkwNV5Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482401; c=relaxed/simple;
	bh=25TrG4O2kN94BnmymtTMRYzSKgHLaUJUcOFTVR/I09g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lX92IqJ5AbV6mWtmXdkmw2LnkPxS6dc7UE4vbxfsCnrJEelFyyrNnxvavcaNzvPGIKamYDPMUGUolxvphX0uAkKJjMdHxPR+jFHJ7YP69raHytjBYD4V48JMUbn1BVjbPAUUglibLdWmZRal7oXv6RsyrTjl9Z/jBBtJ+dOk2iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZFOptOk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7154DC4AF09;
	Thu,  1 Aug 2024 03:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722482401;
	bh=25TrG4O2kN94BnmymtTMRYzSKgHLaUJUcOFTVR/I09g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eZFOptOkeNNCr2kwiS6tnofW2NUH4GnmpYoU1LHNgjmIQNpdiXUNUPKsr02+4hfov
	 hpQsSXYhfdPLU0riLjIis0gkDJei5fNMQ1s2BVOBMccfrIBFnedX+/uHWJ0NN0fjFD
	 p6qCEwUUNVEDs/m59W1RjOa2ed9fXU81opgF23UUwUdqLaplO60L4i1lGkbK4XEGh4
	 0hD7GqQ+Q3Fj5Cbfnhh+d1dJrQ5NV8hLVqtdKapQ48PRNL+5JJ9CVXdKEDzr/ZQCcR
	 5vkigLu80QjLXObPyq7YGM9PdTcGlEsFm7rRKxbMLHidWxYyZF7iLKAYNWQkppUX3y
	 Uwx5ZlpEQFKCg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/8] arm64: dts: qcom: x1e80100: PCIe fixes and CRD modem support
Date: Wed, 31 Jul 2024 22:19:44 -0500
Message-ID: <172248238583.319692.7680841582882308787.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722094249.26471-1-johan+linaro@kernel.org>
References: <20240722094249.26471-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 22 Jul 2024 11:42:41 +0200, Johan Hovold wrote:
> This series fixes some issues with the current x1e80100 PCIe support,
> adds the PCIe5 nodes and enables the modem on the CRD.
> 
> The fixes should go into 6.11, but the modem support depends on them so
> I decided to send everything in one series.
> 
> As Konrad noted some of these issues have been reproduced in the other
> x1e80100 dts. I'll send a separate series addressing that.
> 
> [...]

Applied, thanks!

[1/8] arm64: dts: qcom: x1e80100-crd: fix PCIe4 PHY supply
      commit: 30f593fa0088b89f479f7358640687b3cbca93d4
[2/8] arm64: dts: qcom: x1e80100: fix PCIe domain numbers
      commit: f8fa1f2f6412bffa71972f9506b72992d0e6e485
[3/8] arm64: dts: qcom: x1e80100: add missing PCIe minimum OPP
      commit: 98abf2fbd179017833c38edc9f3b587c69d07e2a
[4/8] arm64: dts: qcom: x1e80100-crd: fix up PCIe6a pinctrl node
      commit: 6e3902c499544291ac4fd1a1bb69f2e9037a0e86
[5/8] arm64: dts: qcom: x1e80100-crd: disable PCIe6a perst pull down
      commit: 8a6e1dbf1362e78081e71b2690750e9556136f26
[6/8] arm64: dts: qcom: x1e80100-crd: fix missing PCIe4 gpios
      commit: 42b33ad188466292eaac9825544b8be8deddb3cb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

