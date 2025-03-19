Return-Path: <linux-arm-msm+bounces-51960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 32387A68EDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 236FD7A7EED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706C91D79B8;
	Wed, 19 Mar 2025 14:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaBkr5EI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442C71D6DBF;
	Wed, 19 Mar 2025 14:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742393953; cv=none; b=C1zg4UTHFtT03HCO20OQyyTdJILyQakmFTbPsRme/zfgcSMFzpvU785Uu3llPMuOiRbLWUyfM4wYUlCVWWRS6kSu80IYtrJ/oylkP+Xo0NiL58HvJTN5I/nnSWykS5itkRSGO3xTkQ+vnbfSq5Afnv1mq3PtsgimurXQiSe3z0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742393953; c=relaxed/simple;
	bh=w4smtBCn6zspBwv+s3zCd/PbteG6YN8a26tl3kbWJz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OSpzIz+ZIjMThrCkoEDyPfGQFhvA7kT31ZoTxrcsRq5t8vqBy0oa9UAScu0HERtR48iB0BCGrL4LibIc8TPhLClRlEABu7HBlp3G669RWliB2NeFFIvU/nZDHukk5Ber2kH/CvAWtni7VAH75jUz4L6bj3Uw63j0qXu6HjT4a7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaBkr5EI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0CB0C4CEEA;
	Wed, 19 Mar 2025 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742393952;
	bh=w4smtBCn6zspBwv+s3zCd/PbteG6YN8a26tl3kbWJz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iaBkr5EIzlLnBjhw2p/Sw1xC1Buv+tYofrN4Hwj2iatwrogpOtSjnucxp5Esc9+G7
	 +7WvrFQoHEDCP5fSNDrAYjgwdtFMC0qCWCyTYWmNRP3OSneuMbzDyK0UclY7st0tc3
	 wH/7E4UBhAbh5OdthYFzZRcG+U3MlcafxRDXQAvSSNEn4ZCTtM3DMXvcScIDgYqYPd
	 O1vHG8jyRSrLT/eyjA6WzmUVNCl71g9NDIkfIecevvk3Ov/ZL6h21iyADH/GRQV7tb
	 dVsNCPj5D3UuO8I2QPcCwK0GqjfxsNj4GC3eTiXARc8JE0Xsu+Ue0R92Ju1J9eVU3a
	 ikFw71QCXYOqQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e001de-devkit: fix USB retimer reset polarity
Date: Wed, 19 Mar 2025 09:19:09 -0500
Message-ID: <174239394605.2278051.6011069436187548916.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318074907.13903-1-johan+linaro@kernel.org>
References: <20250318074907.13903-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Mar 2025 08:49:07 +0100, Johan Hovold wrote:
> The ps8830 retimer reset is active low.
> 
> Fix up the retimer nodes which were based on an early version of the
> driver which inverted the polarity.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e001de-devkit: fix USB retimer reset polarity
      commit: 1a7646d784513dcf0e8b16c1d9124ef54b4ec5e0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

