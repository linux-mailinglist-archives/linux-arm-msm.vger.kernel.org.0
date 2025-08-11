Return-Path: <linux-arm-msm+bounces-68544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79C1B21458
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C277068037D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DEC2E0B6E;
	Mon, 11 Aug 2025 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeEDpPuz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581FE2D6E42;
	Mon, 11 Aug 2025 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754936912; cv=none; b=I2LBKrc4ySrmHMtLyXUkDIbwFZ+mbt3IHzqbvwfkV/Q9+i+DYjIHeCewj9fshc7VW3QOr01X0Dd8unMaMo7uG6oBezkpzm9Z0ycjltfDduU6L1N0W5ZsqjzTxTng0kFlpvVdjY6AaaXyL/UtZFuXHkMpl7ZFWswcxrKxXnPc/6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754936912; c=relaxed/simple;
	bh=tqwjdiTot5WYXpxvZnRpdn8Qr76CfS2H524SF/laMpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGUMVIZJ6DiIcuGC104m23HFTNaEBgtFixa+Z+W+ctGwmkxnihMzR7HuYO2sQXfsGt7YkNmrx1xqcnX46DzzYV0qFAw7vCF+4RMoQrcHV8cKQH5gtBk6+Tumkfq+bS+1dHigLsKYr+drDBQfSkSgqhHQRJqFVHmPjgOs/Q/ihic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeEDpPuz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D278C4CEED;
	Mon, 11 Aug 2025 18:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754936911;
	bh=tqwjdiTot5WYXpxvZnRpdn8Qr76CfS2H524SF/laMpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KeEDpPuzsdOPDS3TchBRds2gIOJdr97Gf58AXbNqzgBsurWK+x0Tno5z7B519/7xE
	 AXjNmPtTiB6BWmP1ViKGGSAkqtQhWH+Yskr/MxZ5gVJsaqvqde4qKNBto2rxL59arW
	 2FPz8apmKzRMNvfG9f5kQdw5SDRAleHvsjly+QrxY2tBDLe2jVamRUURINuHfVRGol
	 wpoLOFeSvbSkIbvJJlZzehERNg65zLJLVJdVdX4z93oKVFAYwZyVixj4LJZb239aMu
	 CtBeYnFJzXw42jWH0wkgLRnJutoFDxFW94B1fWYMrXUTNohzQIqhmpJPpM8Se55Lah
	 FL5m/LZgARBuQ==
Date: Mon, 11 Aug 2025 13:28:29 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Enable DPU and Display Port for Qualcomm
 QCS8300-ride platform
Message-ID: <3dn4lo43ozz6bkqkefotcog4zto5eiu3zqlyicpwowzany5vnp@i2ilryuroxhc>
References: <20250806-dts_qcs8300-v5-0-60c554ec3974@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-dts_qcs8300-v5-0-60c554ec3974@quicinc.com>

On Wed, Aug 06, 2025 at 03:12:02PM +0800, Yongxing Mou wrote:
> This series adds the MDSS, DPU and DPTX0 node on Qualcomm QCS8300 SoC.
> It also enables Display Port on Qualcomm QCS8300-ride platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> This series make top of 3 dt-bindings
> https://lore.kernel.org/all/20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com/
> https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/
> https://lore.kernel.org/all/20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com/

Seems there's still discussions ongoing there. I'm dropping this from my
review queue, please resubmit once all dependencies are available in
linux-next.

Thanks,
Bjorn

> ---
> Changes in v5: Fixed review comments from Konrad.
> - Use interrupts-extended to introduce interruptions.
> - Sort the dp_hot_plug_det node by pin number.
> - Link to v4: https://lore.kernel.org/r/20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com
> 
> Changes in v4:Fixed review comments from Krzysztof.
> - Add the 4 pixel stream register regions and the correspondings clocks of the DP controller.
> - Change DP controlller compatible to qcs8300-dp.
> - Rebase to next-20250717.
> - Link to v3: https://lore.kernel.org/r/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com
> 
> Changes in v3:Fixed review comments from Konrad, Dmitry.
> - Correct the Power-domain for DP PHY should be
>   RPMHPD_MX.[Dmitry][Konrad]
> - Correct the interconnects path for mdp and align the property order
>   with x1e80100.dtsi.[Konrad]
> - Rebase the patch to latest code base and update the dependencies in
>   the cover letter.
> - Link to v2: https://lore.kernel.org/r/20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com
> 
> Changes in v2:Fixed review comments from Konrad, Dmitry and Krzysztof.
> - Reuse eDP PHY and DPU of SA8775 Platform.[Dmitry][Krzysztof]
> - Reuse DisplayPort controller of SM8650.[Dmitry]
> - Correct the regs length, format issues and power-domains.[Konrad]
> - Integrate the dt changes of DPU and DP together.
> - Link to v1: https://lore.kernel.org/all/20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com/
> ~
> 
> ---
> Yongxing Mou (2):
>       arm64: dts: qcom: qcs8300: add display dt nodes for MDSS, DPU, DisplayPort and eDP PHY
>       arm64: dts: qcom: qcs8300-ride: Enable Display Port
> 
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  42 ++++++
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 215 +++++++++++++++++++++++++++++-
>  2 files changed, 256 insertions(+), 1 deletion(-)
> ---
> base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
> change-id: 20241225-dts_qcs8300-4d4299067306
> prerequisite-message-id: <20250113-dpphy_qcs9300-v1-1-842798ceee78@quicinc.com>
> prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d
> prerequisite-message-id: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
> prerequisite-patch-id: 59af38ff68afe283dccd4295951153e59e512bfc
> prerequisite-patch-id: 8bfdc32738e6cc937a71dd9a4e4fa23b5289e105
> prerequisite-patch-id: 69e200a46a6742648379c1ae426cfba7edc064b8
> prerequisite-patch-id: 465ab53516efbbe38f85409e7ccb3793b05402c6
> prerequisite-patch-id: f664581f48278298bc3501eecf637d1eb16dbf9e
> prerequisite-patch-id: 533900187c99bef436792ea43d79fff5bbc5412c
> prerequisite-message-id: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
> prerequisite-patch-id: 4782272bb7d2403e2f2dbf762586d4570e6b6ba6
> prerequisite-patch-id: cfdd5c37d38b2a4f1386af4021ba3920c6d8dcf8
> prerequisite-patch-id: c874bf64aec8cb2ff0bc91051620ac771cbeeeea
> prerequisite-patch-id: 63defbfb812a2f9c6365a98538421aea374e0e13
> prerequisite-patch-id: 0ffa9d544d516d4e14700229a4ab6a9c7751823f
> 
> Best regards,
> -- 
> Yongxing Mou <quic_yongmou@quicinc.com>
> 

