Return-Path: <linux-arm-msm+bounces-51958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA4A68EE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6E5C427A45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CE9192D87;
	Wed, 19 Mar 2025 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwyeT2z4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3010134BD;
	Wed, 19 Mar 2025 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742393848; cv=none; b=lG/NmeGLLudXGR3fRkqAV1ZyVgLlj6DlJmiUVEEmt1tT+kwoOFcRyASj8+TyaaecinCb0tpNJL29dx7BaVD6u2Wl64O1gbaCVCH+4Ihwf4oDhWdd55hoFKQuZR3M63d6HWT9U86N4qWE2YtNxfQo52WeXHfePzeqk2EMhlEp9q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742393848; c=relaxed/simple;
	bh=mDtA3gGdRl8PPc41t++JV1w8XqYO37gXYMhQwSj/Rzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rf21W4uE43NACKmyJPBCC6W2qLrzm59BMEWemLBiwOIbSV1niaadD4KIciKWljBdNgUbiFTpx1GImIeEj40Dq6Drizlspq7S6AgjX4BfeRLWfoSNBmUZ5lQ4ydp+UEFjbD0ETAgKeuCFL2JfPajpoPuZNdKgGmEB3xflRrJfmTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwyeT2z4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA70C4CEE4;
	Wed, 19 Mar 2025 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742393848;
	bh=mDtA3gGdRl8PPc41t++JV1w8XqYO37gXYMhQwSj/Rzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwyeT2z4i3KYR/l9yujACoL3VqGZUN5Ypf0q9UAV2eg9jabiSUrxF2uwMVM/jXhU3
	 RFZJgpYHLh2GDc21/I4ZjkJNd6eFa3DcSJpEHzFrU37KDzayAgwL4zgp9o/xn+bRAy
	 2//QgkWIizaKKs/wNxrJzQBkbgWKkLtxcJEidxivOSugXhA5t2l127kM51TKYEInlc
	 TwEfE3GdHEz2hXtounEK4jW9W7nm5drcGFFVQrpwwocbflQDJ4zSUR0gRoMW1ZV3cL
	 ApogGo9Hic0RM3Zxcxzo+b+X8u6Mo0QeXJBjjmbskwkFVhsbVqiBOi1Zz6A4h+LpTB
	 w5RzEVxB9jsoA==
Date: Wed, 19 Mar 2025 09:17:25 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-usb@vger.kernel.org, Frank Li <Frank.li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-arm-msm@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 0/7] usb: dwc3: qcom: Flatten dwc3 structure
Message-ID: <ovcwe4r4bb7cubpvqgbh7kiqoomu4qpfnoqi5dkhfojwx6ng32@f2ezf22gtld6>
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
 <174233664011.4094337.15532864486999752175.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174233664011.4094337.15532864486999752175.robh@kernel.org>

On Tue, Mar 18, 2025 at 05:26:02PM -0500, Rob Herring (Arm) wrote:
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com:
> 
> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: #address-cells: 1 was expected
> 	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: #size-cells: 0 was expected
> 	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#

I lost the hunk that removes #address-cells, #size-cells, and ranges
from &usb_1 in patch 7. So, this error report is correct, but does not
affect the implementation.

Thanks for catching this, Rob.

Regards,
Bjorn

