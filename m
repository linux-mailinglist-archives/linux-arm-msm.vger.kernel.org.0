Return-Path: <linux-arm-msm+bounces-35182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62B9A5F98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B8B81C21BFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 08:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB121E25F2;
	Mon, 21 Oct 2024 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgPpQAzt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC63200CD;
	Mon, 21 Oct 2024 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729501186; cv=none; b=XDUlevtWhGEIKOHQX52UAFzOakHo2YmPI8egLZBejJJFdKvXq1XBoDlB9YO0G16ueTDR617rST6whNuDXBNdiRljkT0T/Oa2Z3D/Yd1dcUQ9JMySDzg3/WNAKlkmZ7xVHmTbYmf1LM+BwqXPQVYGHivyQYY/O35rtlm+Hlh/k1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729501186; c=relaxed/simple;
	bh=PH3c7sNRlTJQ8UrMesvwHDTPplIjFX9uGGS2GepOphY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAPNSPrtZx770Vzov9WvbTJTyfJ55o7CZ+HC7C1dBmsH0f3DStJbnCLBPHRq0k3aYwFV9WznEwIpI2BRDjqjxNiptyKetGF09Ta4ksqVKRmSSIqH2lnz9qdfBIYqUHmsB5H+xGzWrr25i8R6KNGepKXBgdDtCaO6yZv7c1FljII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgPpQAzt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543ECC4CEC3;
	Mon, 21 Oct 2024 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729501186;
	bh=PH3c7sNRlTJQ8UrMesvwHDTPplIjFX9uGGS2GepOphY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgPpQAztCmoZykb3o5x0lzRd4ouldK7IOtBUBz104yoqChexZnNU2D9BfEwsH7HMn
	 ZYab+IFFin0h6Fc5LOC1Hu6+Ltu7ZxqjWq53tf1xneDsK/CJx6RmWkgLXGADHy7Hn0
	 5lsmTvLNLFlyz+NyybuUrprYgFzDmorcT1gPzz/JENfqQ+0x018NoL8KT6xITo2kXt
	 cYMOH3NpwZqRL5gomgWqwcz4tZIHHT6biZi2elpEVLRv4LQBmPy5siQaJGLvl2nF9V
	 B6cvpqPalcDTuWit3eJ4AxgJ7dei3M+/O5UusF1kAAb0+XO6xcyT20zdn94yGm/0LF
	 7ziQtXW2xyN+w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t2oGY-000000004GJ-0biB;
	Mon, 21 Oct 2024 10:59:54 +0200
Date: Mon, 21 Oct 2024 10:59:54 +0200
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
Message-ID: <ZxYYCvwTn5V2cw3m@hovoldconsulting.com>
References: <20241018-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v1-1-f543267a2dd8@linaro.org>
 <ZxYDwAUNV5Jhar4I@hovoldconsulting.com>
 <ZxYWiwMzmU6wneu/@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxYWiwMzmU6wneu/@linaro.org>

On Mon, Oct 21, 2024 at 11:53:31AM +0300, Abel Vesa wrote:
> On 24-10-21 09:33:20, Johan Hovold wrote:
> > On Fri, Oct 18, 2024 at 04:37:36PM +0300, Abel Vesa wrote:
> > > The PCIe 6a PHY on X1E80100 uses both resets in 4-lanes mode as well.
> > 
> > Again, this is a bit misleading as PCIe6a is using the
> > 'qcom,x1e80100-qmp-gen4x4-pcie-phy' compatible in both 4-lane and 2-lane
> > mode even if the original dtsi got this wrong.
> 
> But the lane config within the phy driver differs based on the
> compatible.

No, it differs based on the value of the TCSR register.

> > PCIe6b will be using 'qcom,x1e80100-qmp-gen4x2-pcie-phy' as that one is
> > a 2-lane PHY.
> 
> Wouldn't the PCIe6a also have to switch to gen4x2 compatible on a board
> where PCIe6b is used?

Nope, it stays the same (e.g. as the hardware block is the same).

> > Perhaps you can rephrase this so that it doesn't sound like you are
> > using compatibles to configure PCIe6a?
> 
> But currently we do configure PCIe6a based on compatibles.
> 
> What am I missing ?

No, as we've discussed in multiple threads already:

	https://lore.kernel.org/all/ZwPDxd9JJbgDeJTi@hovoldconsulting.com/	
	https://lore.kernel.org/lkml/ZtG2dUVkdwBpBbix@hovoldconsulting.com/

Johan

