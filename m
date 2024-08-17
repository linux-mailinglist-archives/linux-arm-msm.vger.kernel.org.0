Return-Path: <linux-arm-msm+bounces-28857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78226955625
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 09:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB8E71C215F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 07:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EF313E8B6;
	Sat, 17 Aug 2024 07:22:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6136B13CFA3;
	Sat, 17 Aug 2024 07:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723879348; cv=none; b=fOeKMZ43V2SRC37owseCLOzRnaAYhw300LUx+pAJzbLFCz+q+RtHRcs+3qRXrbIhDvCUZi2/osr9gBmuR9UhtT32Nv/24IsRaAy0rXEwfwEYGRVzL6IuEjbFABqdCUotM/2LymVpVwKZECV3qco+JwH+ybKVtYvOpo5Lii7Iarc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723879348; c=relaxed/simple;
	bh=Np0iZIvgkS1TzlrGK0ozcN32SOiCaPJC28K+RYFj+9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLacbLwHGDGFpRpUO9oGIvmbH9dLkN1XdSe8N4sn63Tz9ChjBfnjgJ4pnSXWFVD9DTWedjC3p2TAtoHx9zn/XLw/UOsrPetuvQ5oeBzMU+QHPc5OvCuzE8f907vj62HhC6xsSAkI6Yp17C7Fcq7yx6TXn+QaFk5xCEIsbt85mvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 2ca76661;
	Sat, 17 Aug 2024 09:22:24 +0200 (CEST)
Date: Sat, 17 Aug 2024 09:22:24 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 0/6] Add initial DTS for Samsung Galaxy Book4 Edge
Message-ID: <hicd25odlgpjbha237skp3uqcneutznorl5ybsdweezz36qlo5@hiwnqxnzhote>
References: <3lmcfffifsg6v3ljzxfbk25ydh6446phdff7w75k6gwoyw3jkw@ryc66frtyksk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3lmcfffifsg6v3ljzxfbk25ydh6446phdff7w75k6gwoyw3jkw@ryc66frtyksk>

Please ignore this submission.  I forgot to commit the new changes
before re-running the patching, hence the updates are not reflected.
I'll submit a fixed v5.

Sorry.

On Sat, Aug 17, 2024 at 09:05:58AM +0200, Marcus Glocker wrote:

> This DTS adds initial support for the Samsung Galaxy Book4 Edge laptop.
> Keyboard, Touch-pad, and UFS are working.  The Touch-screen needs further
> investigation, and is therefore disabled for now.
> 
> Changed from v3:
> - Improved commit messages.
> - Added missing clock line for ufs.
> - Removed invalid microamp lines for ufs.
> 
> Changed from v2:
> - Squash Makefile patch to new DTS file patch.
> 
> Changed from v1:
> - Provide the patch in the expected format.
> - Added missing bindings.
> - Removed sound node.
> - Changed regulator syntax to be consistent.
> - Changed touchscreen node comment, and removed false pin definition.
> - Rename ufshc@ to ufs@.
> 
> Marcus Glocker (6):
>   dt-bindings: crypto: Add X1E80100 Crypto Engine
>   dt-bindings: phy: Add X1E80100 UFS
>   dt-bindings: ufs: Add X1E80100 UFS
>   arm64: dts: qcom: Add UFS node
>   dt-bindings: arm: Add Samsung Galaxy Book4 Edge
>   arm64: dts: qcom: Add Samsung Galaxy Book4 Edge DTS
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  .../crypto/qcom,inline-crypto-engine.yaml     |   1 +
>  .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   2 +
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     |   2 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../x1e80100-samsung-galaxy-book4-edge.dts    | 959 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi        |  71 ++
>  7 files changed, 1037 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dts
> 
> -- 
> 2.39.2
> 

