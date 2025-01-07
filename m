Return-Path: <linux-arm-msm+bounces-44183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2941A046B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3E973A1000
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224C61F8676;
	Tue,  7 Jan 2025 16:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SA9pIWG/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B4E1F4293;
	Tue,  7 Jan 2025 16:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267959; cv=none; b=RK0QpZbZo31vTojZjnWg9DDsml3hIK6KJSXjJYQOPk61AGe1k+vd2T0cesx/uKwlfGUYhB4VIs6KKtLpw4PhdCy4xvlQOWdglCXw4Z/zTGzcEyH3YT/8BL/gMVEwM+uikyFn6abSpAcpL3ImUtxHP383w/ulv5HIBInp4itzRHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267959; c=relaxed/simple;
	bh=m2MxLdVMshHyNMgaNy65P502j18nFpvORskgmtYEIRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UZjgt7zfVLPoJ/P6gGKPd92L5Z/b6t8L/aGmUNMqhEejst6LVJeTlNZ6MNBourRu3lD+ecLJz+lPEOh/XoZziU/g+Cn1N7H5T5xqBuFCVJRLCCWqX6LwT21YFswaQ7yR5Wh9PqXO/Io9TugHotejjfo3hJY+xoOx3WB9+rf3Ay0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SA9pIWG/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B329C4CEE3;
	Tue,  7 Jan 2025 16:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267958;
	bh=m2MxLdVMshHyNMgaNy65P502j18nFpvORskgmtYEIRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SA9pIWG/O4mkKCeRJqtvLnUqhP+fx1WKkadGaCg4AaTHs52+Xx9Rq3fs2uy0JJ0Pl
	 /A5qwcsEkmgpoJGBDN7/6izVsON0Ti8QZZ0qN4rI8u6vqpbo/ROvevWhMURBD76zMv
	 gsbUcdicqlI7jY5NUUA1Re8x/IVEtpXCkp6oiV6p2nA+xXNbxdgAEIHcDJn6pgCMcE
	 GUOSrymW4fY2qAOa44/bsjQl5GvujC2r7jZcYHRJrlNnINHFlQ/vx/O6BeO7XLVquR
	 G5UjvPdptQaDf58MT2JMkSViWOqtxR0ZfWUpLhXsS6tBAJfDrNh5M2AEP3BDng+obK
	 AH+G0Q7PyUS4A==
From: Bjorn Andersson <andersson@kernel.org>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	vkoul@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: quic_srichara@quicinc.com,
	quic_varada@quicinc.com,
	quic_mmanikan@quicinc.com
Subject: Re: (subset) [PATCH v3 0/4] Enable TRNG support
Date: Tue,  7 Jan 2025 10:38:47 -0600
Message-ID: <173626793398.69400.2966173101437982484.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226114500.2623804-1-quic_mdalam@quicinc.com>
References: <20241226114500.2623804-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 26 Dec 2024 17:14:56 +0530, Md Sadre Alam wrote:
> This patch series enables support for Truly Random Number
> Generators (TRNG) across various targets, including IPQ95xx,
> IPQ53xx, and IPQ54xx.
> 
> v3:
>  * Organized the device tree binding changes in sorted order
>  * Added Reviewed-by tag
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: qcom: ipq5424: add TRNG node
      commit: 7ae7df37528744ce4606456e084698a9e33254e2
[3/4] arm64: dts: qcom: ipq9574: update TRNG compatible
      commit: b3d6e8c68c3a69e09036c823fe27111665744ca5
[4/4] arm64: dts: qcom: ipq5332: update TRNG compatible
      commit: 4bb53051c92448537ad4cf194f6cd19556a843aa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

