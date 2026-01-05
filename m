Return-Path: <linux-arm-msm+bounces-87544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B00CF5537
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3200430318E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0ACC3431F5;
	Mon,  5 Jan 2026 19:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rT55W6WU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9741E342CB8;
	Mon,  5 Jan 2026 19:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640598; cv=none; b=LxWrnx7F7VFT+t89mi2F5hEPT8pTSOfeBHqfohSOnoArRVw677QQJvnxQgoRTmBbhpG4HOA2G2hMRRby/g0qZa41n7hiTAjBalWFCxKgZ2mcbcKjRSt50lorVR+8kSaodoeazOPSwMq7ZatJgoIEXu/oqlZ94b2bKk3ELi8BD94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640598; c=relaxed/simple;
	bh=pBljs1/FMQUZyoLtluD0z1yUFNDf4wiTWSLCG9KI6fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzoFAcCef/etqZWRnRtlo7STx2LTeXG6s+Cd3DG/XBvb2MzLlGbIvj9EGlQShVD6+YWv7A3bWB1u+YN08Uco7+OMjk6TYoj2mCV6MsX26YbcCYjf0hezI2c+oWcTnMEYM0dSa42cE2pC556wuqLjH86TblEZvU1w4Uam+DhCizk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rT55W6WU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34008C116D0;
	Mon,  5 Jan 2026 19:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640598;
	bh=pBljs1/FMQUZyoLtluD0z1yUFNDf4wiTWSLCG9KI6fM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rT55W6WU7tINamoV6J3IN7Px+My9N6Xj29aHFfPqLan7M9Pn7mU09L3yG3/KhATxg
	 KTiEjZYC3WkV6Vp4QFGtSF4MGSPjy72x2BucEGG7irKFjeAZnvOtCsJMenqONwyBrt
	 aJ2QboJEUmygUvCB7Yw9rsgszMyIKyrBc3/DecgumOckpCNleimpU5DEkdY52UOZ8L
	 pdckD1Fr2M2NZrahg15Qx2wlN0H9CJIU+Fs9gWK8+hBH5GHC2Wr0cUQuV4K+5WvoaM
	 PK89Nar2tSjgey/lD6OAqMAJC8kPkVti+mynQhO/DEm8jKEsgoHumFnB5vy90V73OA
	 1M9VRMuZxthww==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: monaco: add QCrypto node
Date: Mon,  5 Jan 2026 13:16:18 -0600
Message-ID: <176764058418.2961867.8978724825685350296.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224-enable-qualcomm-crypto-engine-for-monaco-v3-1-6073430bbc13@oss.qualcomm.com>
References: <20251224-enable-qualcomm-crypto-engine-for-monaco-v3-1-6073430bbc13@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Dec 2025 14:03:02 +0530, Abhinaba Rakshit wrote:
> Add Qualcomm Crypto Engine device node for Monaco platform.
> 
> QCE and Crypto DMA nodes patch was applied as part of
> commit a86d84409947 ("arm64: dts: qcom: qcs8300: add QCrypto nodes"),
> however was partially reverted by commit cdc117c40537 ("arm64: dts: qcom:
> qcs8300: Partially revert "arm64: dts: qcom: qcs8300: add QCrypto nodes"")
> due to compatible string being mismatched against schema.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: monaco: add QCrypto node
      commit: 6691966f4afc06c674b7679a772b7423cd16c545

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

