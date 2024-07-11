Return-Path: <linux-arm-msm+bounces-26004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D4692F24B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 00:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAE621C2215A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 22:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD851A00CE;
	Thu, 11 Jul 2024 22:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRJgImUw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFCF14C596;
	Thu, 11 Jul 2024 22:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720738412; cv=none; b=M/R90M4Y8My8MI88bvr2R/gpWUTlQsXA0Jwv/2wdbhduqLijwXHF3Led75n/3SdZTh8rjgwWn9iwdFzIKYJtgEqzHMEzIEwlneQopU1DsKueGYHknGFNF2dxV11kLsdmc9NQTqyZk+Up92Ns9WExPLjD3VDGCCBDPKLZ2iZ+Z1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720738412; c=relaxed/simple;
	bh=ofndv/zw9XA0mWAXytFcHbCoYH5AfpN6Z0ZOKdwE13A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1/E+vLJPZEygSOCutMlIlgNj01o1cAbblsHiGFc9tP7HeWm422Bijm1l+PlHG09moi8prdcID3Osmr04FnkenMXa5bS6qFd1IkjIzgoB24d5VoG38ol5kfOHFzWi5vYAfEZAHzePZrR9KSo1b3gbhVkc5ok/Cw2vWFojD2e15M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRJgImUw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C869CC116B1;
	Thu, 11 Jul 2024 22:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720738412;
	bh=ofndv/zw9XA0mWAXytFcHbCoYH5AfpN6Z0ZOKdwE13A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRJgImUwXxRDU4ZFiXi5TbBPoo/9R57ohVP4ma6bhp6yugygPbTIi6lkE2KJUdaO1
	 YSOk8NhLPUjCCvdarb7p7291ZHdwotBmbDycfEPGRB8qSRe/hXSXe9mKx/CkGkCURv
	 D8yW0cn8Gy2Mak5S+5/ykyBBduPjk6Wiw6XN8DtCC7mVpD/UWLFefkCUuFD0e3xcau
	 LVtShkDHPdYpJLQe1wfhHaZYKWElMbolQsoEYI7Jmh/n/9TV6whQxbVTfHnByoSFQV
	 C9MC+WJUs1v3x+kS4g3J/s6u4zpp8Atmylm2/p/GfGpyn/ZKP8ddPdZmyh1patBbwT
	 oOpbFES2lnEjQ==
Date: Thu, 11 Jul 2024 16:53:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: drop obsolete qcom,usb-8x16-phy
 bindings
Message-ID: <172073837103.3268845.15106965323950109239.robh@kernel.org>
References: <20240711122016.41806-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711122016.41806-1-rayyan.ansari@linaro.org>


On Thu, 11 Jul 2024 13:20:14 +0100, Rayyan Ansari wrote:
> Remove the bindings for the Qualcomm 8x16 PHY driver that was dropped
> in commit 4756f35fdf14 ("usb: phy: remove phy-qcom-8x16-usb.c") in 2017.
> 
> Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
> ---
>  .../bindings/phy/qcom,usb-8x16-phy.txt        | 76 -------------------
>  1 file changed, 76 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-8x16-phy.txt
> 

Deleted files are an automatic Reviewed-by. ;)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


