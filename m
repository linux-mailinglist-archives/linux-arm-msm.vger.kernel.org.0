Return-Path: <linux-arm-msm+bounces-43449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B73AA9FCED7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DBC11881882
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159EA1DE4C9;
	Thu, 26 Dec 2024 22:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HahVOpDg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40AF1DE4C3;
	Thu, 26 Dec 2024 22:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252770; cv=none; b=NcwibRhOXKmXNjRGgSwLgo1poaM3gGpJsMB/tsHt4nZTyFUrZ4gJ+D1lIgFWL4JB5LxymB3fNgizI77+YJHse0DOfeOF3mu0CoQKAq8Zk9uA9yXaA/I3LPP9H5nCVj8X6ShQYjt3FQmAOJaPuA5S4Unr1SbXgNEdC1ujZyrx3v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252770; c=relaxed/simple;
	bh=l2Dh1Kl2OCNlzK2AAtlMN5VV2BuJKSwtExrxPpLULnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+JK3o7JJrkmo/ycBY0KXp695wRuMOxoVEmiTSm5v44GKDrQK6sdGKn+t+FCtcNaWaStfumrJ7Q9pvgWSuwyre4R9WgP7BWZG5MGtvsF9Oi1y6ehxOPjaVm4LyqUeebMCZF3ae61tnFGpm8L7h2MDU08vkn5JLfBpKfC64U8vmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HahVOpDg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6931C4CED3;
	Thu, 26 Dec 2024 22:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252770;
	bh=l2Dh1Kl2OCNlzK2AAtlMN5VV2BuJKSwtExrxPpLULnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HahVOpDgyxOlZEJOPt6PW/A1Pp3Y5k9TIgsZQ9S0I4bhpyGE95hbIsYSQ45qWv4Rf
	 NMo+nJ9ap7kv2nYQc4WvAjkRu7JePTx8nHoip7TQdJTfbMuMd5IyS/VnqiM+Y4DhHI
	 s2TlIPWLD8xgXKQ7o9PM3rcEDjbxU/3sbWT4eTHW3x6Y+2LEvtqUA8e6t69LZpqETd
	 ELMTOx+4tv5TrCuwDCXT7H01WWackNEfU+y2LsAMYcxwHihCnM/cFamJn28YD4sSOp
	 UFWFeoQaxhtuqdJYdyFzP0Wy5jkxxbZszJwXdkonbF3mHXRNtyrq7Uaqf93GJP7MGz
	 dMDpik/zkJ1Og==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH 2/3] arm64: dts: qcom: x1e80100: Add uart14
Date: Thu, 26 Dec 2024 16:38:54 -0600
Message-ID: <173525273252.1449028.14353538594375001980.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241007-x1e80100-pwrseq-qcp-v1-2-f7166510ab17@linaro.org>
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org> <20241007-x1e80100-pwrseq-qcp-v1-2-f7166510ab17@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Oct 2024 20:22:26 +0200, Stephan Gerhold wrote:
> Add the uart14 instance for X1E80100 (typically used for Bluetooth).
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: x1e80100: Add uart14
      commit: 85b4b74ba904c9e5825c99dec8c6bef25222abc4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

