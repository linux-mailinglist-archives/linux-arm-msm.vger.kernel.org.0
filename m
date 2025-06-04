Return-Path: <linux-arm-msm+bounces-60249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8E3ACE0FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 17:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 856DC18963E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B766E291142;
	Wed,  4 Jun 2025 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgtefAda"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898ED4AEE0;
	Wed,  4 Jun 2025 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049822; cv=none; b=NytpN7q1OmaTX81H3UBb5wf6guTE17CLswY00mkeL/sheyL7DI4c6ITrb7RZOpQ9XNR5rEZ6O+7HK4HuZDSMjMAQHI3US2Uqf4sqbhMFzAmOfzNdSDuWuesOvVzT2K9TyAm3+iQ8sUY/j6/vvco2FC2k/5ul/DyUwXMItdb8MjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049822; c=relaxed/simple;
	bh=79Ct6+QrZ9TbmPLlyPDYC3WA1Nr8Z20nWCGL8X8r8l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0+DvDKwP2ro/s/yV87Fzt8KAfnGbA3pKiPDKbvUwN1eRWJ8EX2eDBU143ORYb+G8njO6s2yK/es3QTlIcteZnoRc1CYE0yt4VYLaP2XpLA18LlqUDwJ+IP7QgZZPA15UqGca2QNqYrA77doCYfvR6hHBNVdPggzr/nO1mAk4OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgtefAda; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDD2C4CEE4;
	Wed,  4 Jun 2025 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749049822;
	bh=79Ct6+QrZ9TbmPLlyPDYC3WA1Nr8Z20nWCGL8X8r8l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgtefAdaS0h1SgoV/xMChN6Cv2eI2z94uV7biOA8pJWGRN+9BfeYWWAkvZ8fYRPa8
	 t1ZwxRubQUaRrbTOGL0cGe9CdB8VDkkXC8URwevp8wADnWBbzD6MXmXcDlXHp9YaDT
	 aTUBsR48g3DkU6+qDXRVGEyRsHBvHOcdopaewZr3NjAlfh968fAxmtmfrzKNaH3u3G
	 oI4wKqSobA0teOoRuzeNz+RD+2YzpsRZd1h9LeQwJ1VMf+RgKr05prJduO+1QkCgl7
	 KDDCrs0uXS2DuMhZ5N5Yx2pwbplUeN9+z6sUxahrxzkc1b2NhObTijya/AAC1dlfi7
	 JkZGpzhVRqe8A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uMpkx-000000007qM-2gvq;
	Wed, 04 Jun 2025 17:10:19 +0200
Date: Wed, 4 Jun 2025 17:10:19 +0200
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
	quic_cang@quicinc.com, qiang.yu@oss.qualcomm.com,
	Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
Message-ID: <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-6-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604080237.494014-6-quic_wenbyao@quicinc.com>

On Wed, Jun 04, 2025 at 04:02:37PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
> clocks provided by the TCSR device.

As I just mentioned in the thread where this is still being discussed:

	https://lore.kernel.org/all/aEBfV2M-ZqDF7aRz@hovoldconsulting.com

you need to provide a lot more detail on why you think modelling these
supplies as PHY supplies (which they are not) is the right thing to do.

Also please answer the question I've asked three times now on how the
QREF supplies map to PHY supplies on X1E as no one will be able to use
this binding unless this is documented somewhere (and similar for other
SoCs).

The fact that you so far have not been able to provide an answer
seems to suggest that these supplies need to be managed by the TCSR
clock driver which can handle the mapping.

> Hence, restore the vdda-qref request for the 6th and the 3th PCIe instance
> by reverting commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
> qref supplies") and commit eb7a22f830f6("phy: qcom: qmp-pcie: drop bogus
> x1e80100 qref supply"). For the 4th PCIe instance (Gen3 x2), add a new
> driver data entry, namely x1e80100_qmp_gen3x2_pciephy_cfg, which is a copy
> of sm8550_qmp_gen3x2_pciephy_cfg but uses sm8550_qmp_phy_vreg_l instead.
> 
> Fixes: eb7a22f830f6 ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
> Fixes: 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
> Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>

NAK, for now, and please don't post any new revisions of this patch
until this has been resolved.

Johan

