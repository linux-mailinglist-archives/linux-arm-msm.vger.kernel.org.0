Return-Path: <linux-arm-msm+bounces-35168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E30CA9A5D26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A452C2810EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018411D1F53;
	Mon, 21 Oct 2024 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEkm3zep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFD71E0B6B;
	Mon, 21 Oct 2024 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495991; cv=none; b=E6rw8+dUlEA/F43cRuu6rgJznD45dfS02Z7bvE3ZVYoifq5Gx/tpscN14OtDpqoccWAcveMxr6cQr9jXh25UswlHwbfwKkWxb5aIucEas+h2nybCdauVOEAzuT+lFrJfchmKw6n2iEWtt5zzD7+6daCMHzXf8VPoWtnnkNKvTTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495991; c=relaxed/simple;
	bh=4TW3dWixNNFpQmCA9x5rxesnC5/3OcngBRf8IQiTnNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3Y2w3uS+noBIzcbV/ZZwccpR+E1xymAc8xFJHXpJNiMJQw2KuhG/ggjWtHmb04IyKW3330rCyTSW5SNEzDRdAA1sygiJ4B0t3XTwmgSf/RNpziTBlWYObsHWZBjdtk1EgUdbNLIO7ilYY9PhiHlS6Z6cNZEJnnfAeEDZruL3kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEkm3zep; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43732C4CEC3;
	Mon, 21 Oct 2024 07:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729495991;
	bh=4TW3dWixNNFpQmCA9x5rxesnC5/3OcngBRf8IQiTnNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hEkm3zepBCBryFT3g9Jo9z9pCYg1j1LEX8VwvV6DWA3eqeh2pvPbBaqfDvQcyRnu8
	 yRcpvZMStsaWjpY6BbJm0VspYPb5GnVl9CL7681pew4XiNwY99jy9IAa39UizeTMID
	 IimIiV2p0oTwG5uvGEUtFdleVRFe3NyN4jYoiYKZyLDghS8SeKDA5u7dXIryq7wbkx
	 HbfTf5eq6npTWYbxWbckCIYSHMWYXv0Cdimf9gTnWcC97H8i2Nlp/Ti0frr0bfx0fH
	 7P3r9sT0hKFq028Qw40L3HgVsv/cVWo0rznIPv+qTwNFqZ55DDOIagbWsLvyq3aaB5
	 33ecVGmHttTPw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t2mum-000000001xk-2Lu1;
	Mon, 21 Oct 2024 09:33:20 +0200
Date: Mon, 21 Oct 2024 09:33:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Fix
 X1E80100 resets entries
Message-ID: <ZxYDwAUNV5Jhar4I@hovoldconsulting.com>
References: <20241018-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v1-1-f543267a2dd8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v1-1-f543267a2dd8@linaro.org>

On Fri, Oct 18, 2024 at 04:37:36PM +0300, Abel Vesa wrote:
> The PCIe 6a PHY on X1E80100 uses both resets in 4-lanes mode as well.

Again, this is a bit misleading as PCIe6a is using the
'qcom,x1e80100-qmp-gen4x4-pcie-phy' compatible in both 4-lane and 2-lane
mode even if the original dtsi got this wrong.

PCIe6b will be using 'qcom,x1e80100-qmp-gen4x2-pcie-phy' as that one is
a 2-lane PHY.

Perhaps you can rephrase this so that it doesn't sound like you are
using compatibles to configure PCIe6a?

> So fix the resets entries for it by adding the Gen4 4-lanes compatible
> alongside the 2-lanes one.
> 
> Fixes: 0c5f4d23f776 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHY Gen4 x4")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410182029.n2zPkuGx-lkp@intel.com/
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Patch itself looks good.

Johan

