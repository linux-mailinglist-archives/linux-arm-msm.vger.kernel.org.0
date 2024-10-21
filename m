Return-Path: <linux-arm-msm+bounces-35259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B689A6A3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 15:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF4F91F248FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 13:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC031F5848;
	Mon, 21 Oct 2024 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXXfwab4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB6B1DFFB;
	Mon, 21 Oct 2024 13:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729517326; cv=none; b=q3LnQZZWXNbU/wvs5CuEFqk5p6dmIAVVbXZLS9JMZLLFqEADBpbM8f8LiX1oHnkwhV7BIv+bM6baE820SF7eXr4x2qeLhxIFlRjxwoPnOPp4re1cAg0VpQnBRlLs4FFj5SI/0TmCfkDx5mNl9lATBkbDMrTPN+wMRtQV4drTN+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729517326; c=relaxed/simple;
	bh=I/lqGfR6DjRwRm7x77Ce84OzvDVzs3+1+CsEADwNolo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8j+igZ5BxHGBJicRmv2d6ZQuQJimrHvbs117DEAyeLEjXcsA3Efna9w+T2RE08kTUTaRQ1VWGyx2Jjy25kPWWL9Coe5mQVG20agwTXrcfuk/Mni2SqBMW+oUDqgmSLk3iAS8yF0sz/vsCwyvret0PZCac320KrK4raH4LyfXNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXXfwab4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80200C4CEC3;
	Mon, 21 Oct 2024 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729517325;
	bh=I/lqGfR6DjRwRm7x77Ce84OzvDVzs3+1+CsEADwNolo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXXfwab4dNShaGhHGRWIl//4ACrC9bDO2LurXIq+yB26mxrFkuaJh8yl9VnF3G8Va
	 jw1VH8el1Akp5ByhaXYe/m/fByNwNmM6DRRW1z1mBaKmVsZRRXD9NQ3fI0KABx0GV0
	 KZOp605UfqLoLlZMnamVV9C6Gl3dIXFl5Qd3xleNzS2Y2cH1KTUTcnkJJeIvSye2qO
	 oFRxvjLC/pUMr2Fj9gkJIAxLqqxfr4+I85y5rxWiAO8MyVJjojLE9jpb0A8KLY1aR5
	 Y4q7uMf/yU3j7lOElSiLfab9o3Ei8So+bvLhaK5QmGV6Mu0YSbjlaetx+MDWxlzWje
	 /uAwumpfztBlw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t2sSt-000000001Bv-2NzU;
	Mon, 21 Oct 2024 15:28:55 +0200
Date: Mon, 21 Oct 2024 15:28:55 +0200
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
	kernel test robot <lkp@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Fix
 X1E80100 resets entries
Message-ID: <ZxZXFx9T-9Uw0Ndw@hovoldconsulting.com>
References: <20241021-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v2-1-1b11a40baad1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v2-1-1b11a40baad1@linaro.org>

On Mon, Oct 21, 2024 at 04:10:21PM +0300, Abel Vesa wrote:
> The PCIe 6a PHY is actually Gen4 4-lanes capable. So the gen4x4 compatible
> describes it. But according to the schema, currently the gen4x4 compatible
> doesn't require both PHY and PHY-nocsr resets, while the HW does. So fix
> that by adding by adding the gen4x4 compatible alongside gen4x2 for the

nit: s/by adding//

> resets description.
> 
> Fixes: 0c5f4d23f776 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHY Gen4 x4")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410182029.n2zPkuGx-lkp@intel.com/
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Picked up Krzysztof's R-b tag
> - Re-worded commit message according to Johan's
>   suggestion
> - Link to v1: https://lore.kernel.org/r/20241018-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v1-1-f543267a2dd8@linaro.org

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

