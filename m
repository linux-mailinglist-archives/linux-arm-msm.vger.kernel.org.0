Return-Path: <linux-arm-msm+bounces-44970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF22A10145
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 08:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F7BC1887893
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 07:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4B224332E;
	Tue, 14 Jan 2025 07:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qV3iz51k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67955240235;
	Tue, 14 Jan 2025 07:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736839697; cv=none; b=Buwh62onU7gbx2UDiVR3hQf9UVRlNuSDHtdaYum76AF4QS2Z00nGi4Tejw65npG6lXSsNSjIWT0WQ4r7e0+Zy1GoF7b6BJelwLAYLnbsLiZSwezBGbUouicbCDLZA2fEu+IfM1BpSo3ZLFZ7CM8GX7almeirtwm9dc9fpydHRi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736839697; c=relaxed/simple;
	bh=+XR/a+ADO7ckXyAl949/cflRubrUalFmRFFORbd1wek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNjlpdr4OEOnHrliQWVQA2cYZn0ljraaVD4LCM7VuGCbILvdxIDqyZci0vS6v8YRB8K/K31s+oWc9z8FCchIYna5UcftWh++qniY+O/eCV3x2ZjT5N4ehIXt4EkUxt9HVO+6sxucVOFk1xIXiUFeItXRuq6oUYiIxvhEiOZeVRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qV3iz51k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247D6C4CEDF;
	Tue, 14 Jan 2025 07:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736839696;
	bh=+XR/a+ADO7ckXyAl949/cflRubrUalFmRFFORbd1wek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qV3iz51kMcPnWT/z+AC7i88zIyHVY5x/tLrlVI+biUjYrUEvrHg1EFTVLOgNqn5ao
	 VagSclC2vJWNx95o/vcsI28qnL207cQpk37dWdOpCNhDO06dHSRc3g1VcDwwPd39wO
	 U+7XhxQuu83S6zIt+LfB+lPOT8XoOr1WT27IGhyDNqA2oGsvZ2KoldHd1xoqvXiOcw
	 A/l7QmOZhxrskE6ZyTVd3FUiG1ijiuMK/Ip0DvPqTo0w7ZfMElvzRGrt3EotbXebB2
	 aJzTWcm3gaD8LJx2fHucPWUMfU2mTPlbKF29XbCJ3V9F9EEI5UVDkFlO1Hw4kWraUU
	 gaPnRMaWCYGSQ==
Date: Tue, 14 Jan 2025 08:28:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 SM8750 to QMP PHY
Message-ID: <oosxr4qv4uesvikfm5xkqwqurs5xm4oji2dksdz4yzkwroucix@wqmljdzdujbi>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-1-09afe1dc2524@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-1-09afe1dc2524@quicinc.com>

On Mon, Jan 13, 2025 at 01:52:07PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add an entry to the compatible field for SM8750 for the QMP combo PHY.
> This handles the USB3 path for SM8750.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


