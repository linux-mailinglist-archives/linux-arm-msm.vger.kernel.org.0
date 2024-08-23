Return-Path: <linux-arm-msm+bounces-29350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E8495CB5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 13:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9030C28471D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 11:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEF2187339;
	Fri, 23 Aug 2024 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+bGUCpZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB2E1E89C;
	Fri, 23 Aug 2024 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724412568; cv=none; b=D5GYnwjyqZBtfgI0xSh1aNpQJVmIaqBgr4ZLSypFpBOznGdIxUhDHLqfXKGtvm8ZDWE+rK3GV7R0XrR9QeyBiHWZyInhPpuPMI0jyDa1lHoDNcZLkRnOmYn6JOYV4Smez0vY4jReamcDQf/3c8xpTareyzVCp31n1t/XWIxbj1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724412568; c=relaxed/simple;
	bh=dbi93srXX6X5aWWuq12x79CNXXVv2vecJLvSMnG6F4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h29ONcEQ2G3/UFyozTzOa/lujlEPcaRcYfXuA/QicQZButQuT2D50aPvpFgG4QbXaIjmAF57vqxq5xoKezffZ1YegxkkZXIzsA50Ny89BKMUWISmbRm4bnDKMmZ7ZKOJD2k0ptHbDWS2q4Q0UQXKh7xFAsr3UX1KYoeB6Gr5ly0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+bGUCpZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF36C4AF0B;
	Fri, 23 Aug 2024 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724412567;
	bh=dbi93srXX6X5aWWuq12x79CNXXVv2vecJLvSMnG6F4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+bGUCpZDRf6ro2Ng9S11mg5W2HOreP0wuOt9pV6jT/Ifu3HhFUcFYG0wzbxH7m00
	 eRAGyZh+SMLE4KdOMNU00PjUul+i7fhj0qfRUjtUijGZyOGphlyyaq4+Zizl4XlYmu
	 jpkbvo0cjesqRLFjRWFWYYLk62WuYKz66mrVB067m+j79ZFO3iZ7MEl9+LpZ5B1Gy7
	 PC4FV9i6LzmuYIxhmFMfMIqyTFrVasoKG7aEutU3oSA7Q/YmSu/xpEYpKmCBb0DwGi
	 D18STdFLYaNT8/VSK4iYPyK6XTIvzCwnwe8gLQIsiXOudtciGOEhA47kGxAKWbxXPB
	 Hbw1PfwjBC0kQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1shSU1-000000003A4-3w4m;
	Fri, 23 Aug 2024 13:29:34 +0200
Date: Fri, 23 Aug 2024 13:29:33 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/2] phy: qcom: qmp-pcie: Add Gen4 4-lanes mode for
 X1E80100
Message-ID: <Zshync9EgQJ_Kfqn@hovoldconsulting.com>
References: <20240823-x1e80100-phy-add-gen4x4-v3-0-b7765631ca01@linaro.org>
 <20240823-x1e80100-phy-add-gen4x4-v3-2-b7765631ca01@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823-x1e80100-phy-add-gen4x4-v3-2-b7765631ca01@linaro.org>

On Fri, Aug 23, 2024 at 10:04:16AM +0300, Abel Vesa wrote:
> The sixth PCIe controller on X1E80100 can be used in either
> 4-lanes mode or 2-lanes mode. Add the configuration and compatible
> for the 4-lane mode.
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Tested-by: Johan Hovold <johan+linaro@kernel.org>

