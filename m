Return-Path: <linux-arm-msm+bounces-48430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9F5A3AD4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 01:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B956C18848BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 00:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0BD18E361;
	Wed, 19 Feb 2025 00:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggVmzORq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE718C02E;
	Wed, 19 Feb 2025 00:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739925745; cv=none; b=eqfsGr0ZqV23w2IEHk8XcKvOi5f8FKwQij5/J6R/0j7JDPb6N3wBZ9LKCUmGp4jH0yTd8HXJ2Y+k3dcylzBXg832/LsCcPaqcLYET/6Le+I3Hh+o/P/Y09HNIPt5SdnOngE0qusqAYDQmRtoLQV5NO2raIhkDHLHH6t6HBDu5i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739925745; c=relaxed/simple;
	bh=f0k4KSUTAqbejValPrNrPgcn/wUgra4IHgX5PdWRz4o=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GWugs5f8GpL7PWAUWaIPwTyLkS6IJFPYL8A26MwL8oe4uUhtZd2eBX2VPf86/QJqueXN9Wr2GuNtIFwYJj2CGPT/coNV7I6TBpg/0iwQsCXoI8D0Y910pv4QtCR3j+LPwod0qBIpTuatN6RJJmoEcjc9Bd0LMMIgwdNPctOwjk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggVmzORq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC334C4CEE2;
	Wed, 19 Feb 2025 00:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739925745;
	bh=f0k4KSUTAqbejValPrNrPgcn/wUgra4IHgX5PdWRz4o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ggVmzORqn8DcfOc5m6mxjEKACv1LM9Q6VlIpKXlIf1uCUyvcSRLtyfhk2wnFMUyqT
	 pcohOJmye8l2DtXnp6cxFXhK5HXr3mri0Jo9LmpW+9wjO/GggWyKTQi5WzvCLfKPVR
	 4wtaCGlwiNhi3g/LugbTHCd6O6lExAhcJHxiT+LvhjgoNPwAaUa1UdBoaURiHBVTmo
	 iKEvxIQwAUPHxdaZGwuMl8auwNT8X7ls3rD/hkgZgnDcV/tkpCZ1r3ZiUcHnvLIBeg
	 IKdUkDI7p+BD2bhkrNtLOrtxV1VNQt4oNNe40MzkZh4QMI0XZsUj7DUma1yQkTqad6
	 gL95zLarAQFTg==
Date: Tue, 18 Feb 2025 18:42:23 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
To: Lad Prabhakar <prabhakar.csengg@gmail.com>
In-Reply-To: <20250218125157.412701-1-prabhakar.csengg@gmail.com>
References: <20250218125157.412701-1-prabhakar.csengg@gmail.com>
Message-Id: <173992516574.2065471.6769423656886654409.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: Drop `tx-sched-sp` property


On Tue, 18 Feb 2025 12:51:57 +0000, Lad Prabhakar wrote:
> The `tx-sched-sp` property was removed in commit aed6864035b1 ("net:
> stmmac: platform: Delete a redundant condition branch").
> 
> Therefore, it can be safely removed from the device tree.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.csengg@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts  | 1 -
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts  | 2 --
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 2 --
>  3 files changed, 5 deletions(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250218125157.412701-1-prabhakar.csengg@gmail.com:

arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#






