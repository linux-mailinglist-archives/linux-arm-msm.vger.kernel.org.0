Return-Path: <linux-arm-msm+bounces-86366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6593CD9C85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 16:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1CB3302F801
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 15:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991DB3563C0;
	Tue, 23 Dec 2025 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Moq8GR81"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB8129993D;
	Tue, 23 Dec 2025 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766504025; cv=none; b=Etw7tKDS6WCYedEX9AVta6zLnxM9Cwq4d5q6wtn/8xbgxWk3jXTXCAP88Y+fYhs8NY0Dsvopwylv8vOjEHPIiNQyqM2Ezx0NibyF5ZubbBacd4yma1QHPeeafwTi5OUDBxu3vSBEVKAOz/LAizGHHDtNs5oz2d/tM+uvLW332CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766504025; c=relaxed/simple;
	bh=2DVRrk++tpb6Jms48QLSo8E9mB5dFTs95V9wz2vjVMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvAOaSy1pdZNjJa1+6woG/k9ngeKv1OslWcjy27i2AernYMOwP/U/y7vOh1J1FCZakzizJAMLQtrGEX24sBuoQercCdvAMeMB/asus6qBbi51PaFNpxJjHeYIYUQ3mZsCo46jCQltsjsdCOfpGqgruUOHDtckMorQnLO3IFmoGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Moq8GR81; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584F0C113D0;
	Tue, 23 Dec 2025 15:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766504025;
	bh=2DVRrk++tpb6Jms48QLSo8E9mB5dFTs95V9wz2vjVMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Moq8GR81iOv/pHAs7cDjtW0BfaXCADsOId11ocr0i9RMoe8VV3vOO0wDRDD01NtdI
	 nyZd9NuD29Oqmx2ZqA58YHaJi4OvPPThNFlOmINLlIzuqbQaJn0c4vqJjek7DH3lzg
	 61wSvURt0cFdSFUarXsEfT2HhxTK8LXVjajXTMZyIngZJyqt5y8XgTtHDUzp78gnuc
	 jHZKrTyE32aLxMtlWv457oK9DON4Cr1AXfgAfxqjwnOUGybovZMLYFFpyYWlnf6GbA
	 I/03k4X6/GwjNlarsWE2go/cojSE0f5uRjaWHlMh4PsR8EEni34Mhsp8Wdww08id9k
	 QhZRMyznE0iYQ==
Date: Tue, 23 Dec 2025 21:03:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/2] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen4x2 PHY
Message-ID: <aUq2VWecmWRNX139@vaman>
References: <20251216-phy-qcom-pcie-add-glymur-v2-0-566a75672599@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-phy-qcom-pcie-add-glymur-v2-0-566a75672599@oss.qualcomm.com>

On 16-12-25, 10:25, Abel Vesa wrote:
> The Glymur platform comes with two PCIe Gen4 2-lanes controllers.
> 
> Add support for their PHYs and document the compatible.

It fails for me now. I guess I picked up bunch of patches which is
causing this. Can you please rebase on next tomorrow and send

-- 
~Vinod

