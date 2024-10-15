Return-Path: <linux-arm-msm+bounces-34389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC1799DE22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 08:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C91C1C20FBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 06:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8490E18A950;
	Tue, 15 Oct 2024 06:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBF3Y4CF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B37189F36;
	Tue, 15 Oct 2024 06:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973344; cv=none; b=Xsdv96GvSXLN4D4RV6C3948bVs4dEJlox5wsJMpMVOPDCqb4sM8RvxF1alhFlUITBn91cZWpI8JfpVzShQ6Nx/ldqIzWFkjGGrNCoRii60qJw7E/UrnI1rhsuL+8MpC5KtK/KPuh11BxiROv2IANKUGY79CjabhB1kgFbIjs0Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973344; c=relaxed/simple;
	bh=Qkp+43f50ur+lNFHm71434SGml+Qxjm4lIXR6eMYoJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LD/5Bbn4gbMda+7mKX1U2WDGJCSRjgmj0EeP9WTQyYEPI9SbcQWST2Z4iqKh5Wp/lrGnh6xpdNjsEi7/w75atqDHopZ4JNO30EZqAzPnXX4d/3DNcztfSj/RBnMP4fA4+eFFqCVpAcJtmCfx5E4KNaYqmXuU/EaP5LFka/qtJCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBF3Y4CF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96A8C4CECD;
	Tue, 15 Oct 2024 06:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728973343;
	bh=Qkp+43f50ur+lNFHm71434SGml+Qxjm4lIXR6eMYoJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBF3Y4CFRv2p2RmPQoe0j3cQndHkTIj9xdXVLFOC0cQRtRMIEFO+k4JJO79AnMD5d
	 ETjQ2TxLLC7ZHjmkXBXrYSMjfhFYTnvGm/vqqXvu6yzBymb+5Gj/vdg+AbEpCr2rq4
	 zObUeWQhdvyu0kQAJEwoilU/6tV/rCOmFi9tzlTM8KMADKx4BHTWtxj9bOTptA6QKj
	 gLgtTFyvD5lJYu2I+2tKLimlo2e3nBvDG1bH3+17Ssw52k1KV/7cejJ4FJ9PbQc0+o
	 rwdyKFhphOi6SMgTJBv2+DjqjjYlCl4S3u7DPElpVU33UP4bQs7kQNuJe0uTHUHPTU
	 glIhiXljEYuBQ==
Date: Tue, 15 Oct 2024 08:22:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Subject: Re: [PATCH 1/5] dt-bindings: usb: qcom,dwc3: Add QCS615 to USB DWC3
 bindings
Message-ID: <oluxn5vzewftvotvhzobqm5uheeof7k2vfp5wmkujl3xxxr42g@au7yzzfrbben>
References: <20241014084432.3310114-1-quic_kriskura@quicinc.com>
 <20241014084432.3310114-2-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241014084432.3310114-2-quic_kriskura@quicinc.com>

On Mon, Oct 14, 2024 at 02:14:28PM +0530, Krishna Kurapati wrote:
> Update dt-bindings to add primary controller of QCS615 to USB
> DWC3 controller list.
> 
> Although this controller has a QUSB2 Phy, it belongs to a
> generation of SoCs like SDM670/SDM845/SM6350 where DP/DM is
> used for wakeup instead of qusb2_phy interrupt.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
> Patch rebased on top of [1] to avoid conflict:
> https://lore.kernel.org/all/20241009195348.2649368-2-quic_kriskura@quicinc.com/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


