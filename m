Return-Path: <linux-arm-msm+bounces-57232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AF4AAF580
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 10:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 007AC3A94E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 08:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F1622E3F9;
	Thu,  8 May 2025 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9W/iAf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A743222DF83;
	Thu,  8 May 2025 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692406; cv=none; b=XkVVLwS4N2y6krShwbttBHOFk8dZx92fgXNFD5Y9VwqyHT/KEttR+llkgGGIg5NOYVLn4b0Ait7s4CGzDr+pYEkO/HSzRMEOSuwrHFzUOaYqwBjyCspt7CD1+jSKuUftn0k9FQqR4KGTyiGA+Pv/rZBXxnHalje2DkuHqIwH4Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692406; c=relaxed/simple;
	bh=CYQ/e7inFWvv5fdVT73hsrbTbLuCIkw9CeE/xLnCgH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikuL1BwbJr8IfznjoboahTKeoTz4RLyOAsRrrGDf2M8hD5Cd3lW4l3XrlowWtfWHgbm5Bplme/rcu8KdBYaRq2hAvv3WEEKhm3xrSwn8Tx51r5b/UNgW2wkzJZW/t6pm4gr5nfvM1AANqvGXRc/2GlbjJYYX+9+W+dnrsjlXyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9W/iAf0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBD6C4AF0C;
	Thu,  8 May 2025 08:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746692406;
	bh=CYQ/e7inFWvv5fdVT73hsrbTbLuCIkw9CeE/xLnCgH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9W/iAf0YxhXtRJba0lkljhjgfCn3uxiLoEsUg7+SpTathmVLV7JOwQ1FBrYmIQAa
	 +0yJ/9CtgY18d6beHZRRPPy5dHxjezAijm+E4KmC2l6ciqGD4F5FJ3TInZc0j9xNdR
	 qi/bSRB7jstbUVGBe1wa0uLQLMEASPZzWNqVjbeddtq1Iid3j1GTYNgQ3uBYNXbMXK
	 lM1e1/PrT/7q2gTbDsgAyz+d6HOD3nlHCHjkkdEL8gKyeBoSiIWKxF45eWolSj8EFY
	 bIxfqrGZz1xfhyarrp7ViFrnS3e9+/AILpMhkrg1MhiiYAUrIULoBUrUEPJ5DsFn8p
	 y2YWWvDz4Z9iA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uCwU6-000000007T8-248Z;
	Thu, 08 May 2025 10:20:03 +0200
Date: Thu, 8 May 2025 10:20:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
	linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
	quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
	quic_cang@quicinc.com, quic_qianyu@quicinc.com,
	Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
Message-ID: <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508081514.3227956-6-quic_wenbyao@quicinc.com>

On Thu, May 08, 2025 at 04:15:14PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
> clocks provided by the TCSR device.

This still looks wrong and you never replied to why these supplies
shouldn't be handled by the tcsr clock driver that supplies these
clocks:

	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/

> Hence, restore the vdda-qref request for the 6th PCIe instance by reverting
> commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref
> supplies"). For the 4th PCIe instance (Gen3 x2), add a new driver data
> entry, namely x1e80100_qmp_gen3x2_pciephy_cfg, which is a copy of
> sm8550_qmp_gen3x2_pciephy_cfg but uses sm8550_qmp_phy_vreg_l instead.
> 
> Fixes: 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
> Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>

Johan

