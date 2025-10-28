Return-Path: <linux-arm-msm+bounces-79084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 804EDC12CA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 04:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42EB2464D77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 03:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7543280335;
	Tue, 28 Oct 2025 03:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqZw5jEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9A438DD8;
	Tue, 28 Oct 2025 03:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761622827; cv=none; b=sgtxAMNnkN8Z3wWXlZPk+KA4HV98rAq4wGiLpxkWGFWhFc2Z4jPPUmrjMDUYFp5rZ0SX5KeerjmC7ksmk1g4wK5WwL/Lo+V87E/CeGZbOd16zAjVwlAPg/Ok6u0eCCtgDWYu3E8BHKt62d9YTO0TNkn9Jc1dVYlhA6fFaCmXpyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761622827; c=relaxed/simple;
	bh=ezrLV6K1BjnICYX9Q6TIXznszDYx+9nLurhAr0ZdnG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUAlB2oAC9JhATdCJH38NAKcMt8yETi+JBo4mQBAMc+Ge6EQh+rUvgSGcRuMlAFeYqjw+TmUuvAqyjv/1FwOFGPO7raenuzL7RXYgAkYt7HbE7/Njb3gNgqT/K6qzomBRsO7JeTTkDX/zDAnxugDwQyg2wLKYk7D621XpTXWh0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqZw5jEV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6C8C4CEFB;
	Tue, 28 Oct 2025 03:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761622826;
	bh=ezrLV6K1BjnICYX9Q6TIXznszDYx+9nLurhAr0ZdnG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqZw5jEVp3C02UQ33E3i0+oK7DN9H3hiKf34TfvhHqEZE+Eqz1B8165OvX2OHuJJ4
	 F8WcBCSPh7drFWd2cLzAj/ub1qbkxiauJ41n1zaTNaLEFyRz2p1KoKmMnKL7ufmaHO
	 kllpyxi5LDr0lVEwWKOlEbUn9ui92MhqKvb5CKt+Fqp4yCcyY3ecsZpsjJggLk45p4
	 2CK2kvy7atToYzDsYIe/PE8qouXJN28TLV1ybS1/+qAf0K7sbZ1sComwsBur39G74u
	 iiNZye5RTKHf9gR/m8vtlbR3o1M6xUa06sZ4obl49Sxix6MwnFSzYadAIa++K/yC/w
	 jp1UrGkcLqt8w==
Date: Mon, 27 Oct 2025 22:43:22 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yongxing Mou <quic_yongmou@quicinc.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/2] Enable DPU and Display Port for Qualcomm
 QCS8300-ride platform
Message-ID: <75yh4ohk7hpnyrvym2w23lxzvbmo5jbzmzuszmgdarqptptlng@d5to6wqc2s25>
References: <20250917-dts_qcs8300-v6-0-5c862aa80f64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-dts_qcs8300-v6-0-5c862aa80f64@oss.qualcomm.com>

On Wed, Sep 17, 2025 at 02:09:46PM +0800, Yongxing Mou wrote:
> This series adds the MDSS, DPU and DPTX0 node on Qualcomm QCS8300 SoC.
> It also enables Display Port on Qualcomm QCS8300-ride platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> This series make top of:
> https://lore.kernel.org/all/20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com/

Seems like this dependency timed out. Please resubmit these patches once
the necessary bindings have been accepted.

Thanks,
Bjorn

> ---
> Changes in v6: Fixed comments from Dmitry.
> - Rebase to latest linux-next and remove merged dependencies.
> - Modify DP controller compatable to use fallback.
> - Link to v5: https://lore.kernel.org/r/20250806-dts_qcs8300-v5-0-60c554ec3974@quicinc.com
> 
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
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 220 +++++++++++++++++++++++++++++-
>  2 files changed, 261 insertions(+), 1 deletion(-)
> ---
> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> change-id: 20241225-dts_qcs8300-4d4299067306
> prerequisite-message-id: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
> prerequisite-patch-id: 59af38ff68afe283dccd4295951153e59e512bfc
> prerequisite-patch-id: 05fc429deb58c4aadd82f7d0d714af7d34d8399e
> prerequisite-patch-id: 52ee61224c7589b2122799998a8e99829d06eb47
> prerequisite-patch-id: f664581f48278298bc3501eecf637d1eb16dbf9e
> prerequisite-patch-id: 465ab53516efbbe38f85409e7ccb3793b05402c6
> 
> Best regards,
> -- 
> Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 

