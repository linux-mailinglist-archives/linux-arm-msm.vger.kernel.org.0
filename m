Return-Path: <linux-arm-msm+bounces-30363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BABE996788C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 18:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5F7A1C204F6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 16:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4282D183CDB;
	Sun,  1 Sep 2024 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qp0Dm8Xk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C5F183CBD;
	Sun,  1 Sep 2024 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725208383; cv=none; b=lDSyzOtuHU0nlqIltqj3ljpog72iM5z1u1COFbmKHHW98S26UTlyN5JEZyzquWwj3FJWm6DtQ08gubkC0/S0iE2m8i1XtwX0R5TX20slFM2nB3xk4Ta26/mxYfIsYh3VlEhEbinFzARvH90RxP3MJv/AGIl/KHO4675XmDLrWu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725208383; c=relaxed/simple;
	bh=iMGDRvpGmErh3kT77LApW0C+MmED9uptTCxVciaFglc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qM1g2CHdqYZ2RY1DTLJfS23aoOqRYbL9qw5ZOpyU1DxND9t1zE2HfmqJjzoYkJzD5nj84Wczv6OYB8GJNbyAAccsit/5/Cwm8kr1TRg75or1/zVDc5ORSqqXxHqCp6SAqr0flmb9lGqEGUmX/BRka1fUMPwKW9wuKi8fUhIBPvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qp0Dm8Xk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B658C4CEC8;
	Sun,  1 Sep 2024 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725208382;
	bh=iMGDRvpGmErh3kT77LApW0C+MmED9uptTCxVciaFglc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qp0Dm8Xkyz6mVcS4CLaMgcdwI2IiOxMPJLS0MOSPfed0zjIYIUu82N2Y8pBciQppd
	 6Yu3j/FmCx5SGPd1jtQSwUnpOyBLiv6qo3+/Op0FTxP3CZCm4z3y3huJxF83Ov/Skm
	 T3enHKYTUF6118sa8SXSl2Pn8Dj+gz15PkKA+mHb0VIgGnLfki+DyAaRyTkfpl6c/h
	 pmuvOmDvWG8lUiGYn+k1jgWm2pzkNqTcSaAUum4q5U5/nlk2Dc3++Apu2hoTOaf5qv
	 lWyVG/ZOdIEqzWuKkCXko8jpwktL/UivpIIcliZBKoJCEl9fp6HXRUBCXQ4des7yLZ
	 CH2TIip3HFVFw==
Date: Sun, 1 Sep 2024 22:02:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 0/2] phy: qcom: qmp-pcie: Add support for Gen4 4-lane
 mode for X1E80100
Message-ID: <ZtSXNt5ZSrM2t5xK@vaman>
References: <20240823-x1e80100-phy-add-gen4x4-v3-0-b7765631ca01@linaro.org>
 <172495833400.405683.4328817324548517864.b4-ty@kernel.org>
 <4ab9dcb6-4a0b-493c-943b-5de05457c592@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ab9dcb6-4a0b-493c-943b-5de05457c592@kernel.org>

On 30-08-24, 12:01, Krzysztof Kozlowski wrote:
> On 29/08/2024 21:05, Vinod Koul wrote:
> > 
> > On Fri, 23 Aug 2024 10:04:14 +0300, Abel Vesa wrote:
> >> On all X Elite boards currently supported upstream, the NVMe sits
> >> on the PCIe 6. Until now that has been configured in dual lane mode
> >> only. The schematics reveal that the NVMe is actually using 4 lanes.
> >> So add support for the 4-lane mode and document the compatible for it.
> >>
> >> This patchset depends on:
> >> https://lore.kernel.org/all/20240805-phy-qcom-qmp-pcie-write-all-tbls-second-port-v3-1-6967c6bf61d1@linaro.org/
> >>
> >> [...]
> > 
> > Applied, thanks!
> > 
> > [1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHY Gen4 x4
> >       commit: 0c5f4d23f77631f657b60ef660676303f7620688
> 
> Heh, we discussed yesterday on IRC that this should wait.

I must have miseed that...
 
> Why do we keep discussing things in private...

This ideally should have followed up as a reply to this thread...

-- 
~Vinod

