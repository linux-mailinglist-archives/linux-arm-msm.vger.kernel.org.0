Return-Path: <linux-arm-msm+bounces-44288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C95DDA0516A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 356C4168A47
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A46C1A2390;
	Wed,  8 Jan 2025 02:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPLv/uSI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4241A0BFB;
	Wed,  8 Jan 2025 02:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736304782; cv=none; b=mO4CW3dt4XlCn1LhkPR/d5mVHovJlzH0dmicmEWpsPvfOV6ZPrzEy4gUsxw7eGW6fon26RG3PUOpA0h00qhu/aiLCrv7o63pGTgsYsA2gSkY26+0YIged5AUmI4X21rtaU/22vrxlynh7J0qsJ48Wtgu1ZIy+DL817XDG/JTAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736304782; c=relaxed/simple;
	bh=ufcq6flOOrgDz3MNbTIBL5NJpjm15U9HOoOqbFdz9F8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mYIAvC+bUBr0GjVyfBl4+uLFLLbzvBNzHr5FPeC3oSUS0X0huIHACmIDvTRzlGhtMLPCjziFIw3plsHrmqlz+vKvUpGPpX/5ro25wOBWCRNQoqjofGI8aPBx7R1nQVvelbnFEOMlJe0Hdoqmg0RoVHv98O9tGFJOSmA31/iNOkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPLv/uSI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32684C4CEE2;
	Wed,  8 Jan 2025 02:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736304781;
	bh=ufcq6flOOrgDz3MNbTIBL5NJpjm15U9HOoOqbFdz9F8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FPLv/uSIyNPO0Kzg/kXNAz/mH8RneBPn45jtIBL/Wu+ZV0wegUKBpfoMHvYDUVC1G
	 jrrt75w7CQzxpjlRm7U985Oo4f1I0ymu9/NHOgicGY/TyBg/yzmOSfCFmXEhDO1tGF
	 cjPrcFJeedTNvnZjQpp8ZskRDnO9SUtpBqwVhnIgbCLpaFLwrMOwaZpRSCmB97kTIh
	 oksP6GI59OV6qN/mYm8HvsdRyNVaT8w9QInZIX8d9yw0XKT7I6aW/GFAo7PzdLCMoL
	 yefliQJyllV3YK1di/qVANYcMrSFCiVWOBlt65XiW5Zi4qkIj/H7G3J6B28hUg6BC1
	 z3zYQ9O4vksAA==
From: Bjorn Andersson <andersson@kernel.org>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	konradybcio@kernel.org,
	dmitry.baryshkov@linaro.org,
	mantas@8devices.com,
	manivannan.sadhasivam@linaro.org,
	abel.vesa@linaro.org,
	quic_kriskura@quicinc.com,
	quic_rohiagar@quicinc.com,
	quic_kbajaj@quicinc.com,
	quic_wcheng@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: Re: (subset) [PATCH v4 0/6] Enable IPQ5424 USB support
Date: Tue,  7 Jan 2025 20:52:50 -0600
Message-ID: <173630476480.101108.1048165154885202122.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241118052839.382431-1-quic_varada@quicinc.com>
References: <20241118052839.382431-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 18 Nov 2024 10:58:33 +0530, Varadarajan Narayanan wrote:
> The IPQ5424 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
> can connect to either of USB2.0 or USB3.0 phy and operate in the
> respective mode.
> 
> v4: Fix regulator names to match with other Qualcomm DT files
> 
> v3: Added reviewed-by to one of the patches
>     dts: regulator node names changed
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: Add USB controller and phy nodes for IPQ5424
      commit: 113d52bdc820da14dc0694bb5c57b3cda7ceea30

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

