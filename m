Return-Path: <linux-arm-msm+bounces-21847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6CB8FDD5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 05:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BBC61F240F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 03:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8474CDEC;
	Thu,  6 Jun 2024 03:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrcGvDmG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48EF4BA94;
	Thu,  6 Jun 2024 03:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644047; cv=none; b=AXnSE+JoL5cVDyF2B9aFLStGG8pGliRXMUq3XzxyPxUGb8pinEvDB1Pp6XcLsHux5G2M7518braq33d/U2/Xq3VPPF2Mu0yS7yHljZRb2iG9tn/t0U+wAUgXXyuTTQIGmmpbI8WdSeFdhppJ8U+cVmGWjObkGaxJB4nrLngZ40I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644047; c=relaxed/simple;
	bh=2pmQcBk/FtBwqC+/2lqMCLJ+GWYPjXouuGMDnmP1lz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tkMJ5sYc8qsf3vDcGKOWZSbCcEbf3zWA0dIwAXYHaK6rFbbcm1JiVTA8LninLq0OpXpxGa6l3KgvRcTxhhDCLO8G30sXBwOXwdQI9+MPPIW2ukuL7L0enHle6GJlREbK0iH5UqxOYc3NVeyO+pAdj5TUTyUxeRPZWBONykw83DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrcGvDmG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C652C4AF15;
	Thu,  6 Jun 2024 03:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717644046;
	bh=2pmQcBk/FtBwqC+/2lqMCLJ+GWYPjXouuGMDnmP1lz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SrcGvDmGihRTX8neA2Qyx567v4hUPk0Y/hmDvaLFpEQV/2Fd9pmPacBFy5n8jnkwe
	 C10rALuo8mVhmnRutvYBbaw1yJ/go57HjVugZ8BkUN043fYxZtBnsHHvl7PS1Fu/oa
	 MPWTtaYJgOq5pPEdhcDAJ2QQ9tz4ybROamKk3JfApJd8VWrF197PIYrTXWRC0N1pjt
	 hWCeCqnB2JK7FuwzGjbRiwoINKlq/PDQeS2efHJNVpobKLOuUyVVIP0TxQMRQiQ72e
	 MIqzaw6+SIL8L0aSvh3wBddGiYy6I2FucUMk/dQ7wGtaoGNFQ3dcQyC6ANv88cCuu+
	 EUo2EHORNwt1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-hdk: allow more IOMMU SID for the first QUP instance
Date: Wed,  5 Jun 2024 22:20:33 -0500
Message-ID: <171764403326.730206.14069442659388549761.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240605-topic-sm8650-upstream-hdk-iommu-fix-v1-1-9fd7233725fa@linaro.org>
References: <20240605-topic-sm8650-upstream-hdk-iommu-fix-v1-1-9fd7233725fa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Jun 2024 13:43:30 +0200, Neil Armstrong wrote:
> When triggering I2S SE DMA transfers on the 6th Serial Element, we get
> some timeouts and finally a fatal SMMU crash because the I2C6 lines
> are shared with the secure firmware in order to handle the SMB1396
> charger from the secure side.
> 
> In order to make thing work flawlessly we need to allow more SIDs
> while running our SE DMA transfers, thus add the 0x3 mark to allow
> the 0xa0 SID to trigger while we trigger an 0xa3 SID from Linux.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650-hdk: allow more IOMMU SID for the first QUP instance
      commit: 3c61c786d2f058636a92c5b648873fdd45444085

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

