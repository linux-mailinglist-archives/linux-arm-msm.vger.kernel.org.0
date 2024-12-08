Return-Path: <linux-arm-msm+bounces-40927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B0C9E86E0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 18:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB300281793
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 17:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFB418A6A8;
	Sun,  8 Dec 2024 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFho3fZg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AE61885BF;
	Sun,  8 Dec 2024 17:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733677400; cv=none; b=M74EEMCQ5eND+jIMfk+HTGHne1nwWeQFz/tllsPpSg2gYKwqO/yjmosSCsMcBg4VKStPwoHd7P1K4M6SVRDS/reRtlV7MdigA5DLsVoX80UhbmioNv+ie96SlG5TjLBZCoKDwG6tr3Q/8Yv/x8WX46v1IlZyoTRIlXHdIp4SvV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733677400; c=relaxed/simple;
	bh=INxFuGsShly/nK8ADXRSaHS4A5KYdvp1EMhC6Mi7d68=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XS+t+0gExh4ufDLtUUAT5fv45TRYvnD5NJzFaqsmBE6oL7cBy3Fh+dWlqcZbFcdyuGoStSZN/jQZ09lRwMiJZyxYZhJRMGvsNOpCPgRVlrflekSqIKfTrvYBJtNM6kqjOjLGpahWw4MV8lPijHmtBIC3ZRIsXR+9EIwSgIa4SGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFho3fZg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7CAC4CED2;
	Sun,  8 Dec 2024 17:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677398;
	bh=INxFuGsShly/nK8ADXRSaHS4A5KYdvp1EMhC6Mi7d68=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=QFho3fZg4LqMYujPwnsgMlUaay6S9fuhH3MFDxdFeS6lQjK4pZd+3dBcwlyqfYz70
	 nKLSssLsKDYelwBdOpPy+upR+l6Za6sGn6JcrXZAW4OVyRlo83LSFs6SHt5Ke+u3vr
	 Z9lzGHA+qqFioyidXRsZxL7s909RNqcbjf+mkW6BKQzi8eZmF4dWEIAjvdvGKVgIlE
	 ZH+mOGDPFbNRyXVsswSWXuQz6i42rAm7l5ZpggGnZfiI71trkkXTK3wx7jR5vTLpXy
	 aKvPUljc8sUeuYb/5CSAhltz3XMnT8sDHhkV6kZm0eCQVQ9QyBmRMKJIEDucRxcq00
	 gmKdToZWZxDQQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, gregkh@linuxfoundation.org, andersson@kernel.org, 
 konradybcio@kernel.org, dmitry.baryshkov@linaro.org, mantas@8devices.com, 
 manivannan.sadhasivam@linaro.org, abel.vesa@linaro.org, 
 quic_kriskura@quicinc.com, quic_rohiagar@quicinc.com, 
 quic_kbajaj@quicinc.com, quic_wcheng@quicinc.com, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Varadarajan Narayanan <quic_varada@quicinc.com>
In-Reply-To: <20241118052839.382431-1-quic_varada@quicinc.com>
References: <20241118052839.382431-1-quic_varada@quicinc.com>
Subject: Re: (subset) [PATCH v4 0/6] Enable IPQ5424 USB support
Message-Id: <173367739170.1042266.14968940115846326756.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:33:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


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

[1/6] dt-bindings: phy: qcom,qusb2: Document IPQ5424 compatible
      commit: db4427afa66062b37269f3398fed790d138506c7
[2/6] phy: qcom-qusb2: add QUSB2 support for IPQ5424
      commit: 9c56a1de296e70d16f1daac203d420378743a363
[3/6] dt-bindings: phy: qcom,qmp-usb: Add IPQ5424 USB3 PHY
      commit: d70656aee767090f700edd0de535ff3ffb0b351f
[4/6] phy: qcom: qmp: Enable IPQ5424 support
      commit: b8ef065c13872f5a4155e71c338597fde683cfd6

Best regards,
-- 
~Vinod



