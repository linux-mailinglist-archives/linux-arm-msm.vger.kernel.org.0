Return-Path: <linux-arm-msm+bounces-86884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F07FCE8246
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 21:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 447223002B8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 20:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6373A2D63FC;
	Mon, 29 Dec 2025 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPzElT1i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E42D5946;
	Mon, 29 Dec 2025 20:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767040771; cv=none; b=kKAzgumlryHzosgbtA2WIsDBWjJG2eEae7rhs55sPP4eyqIJpuSO2YL3zQkUqKM8uoDNrJBlK+whrEoIY0385bB659ipttZz9ZTY74WjCSK3GbdAByokWWh5rUDc86SXilT+htsjj4KJGgNYJIbiPfZcoyTDDSP3+njXtJLCsCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767040771; c=relaxed/simple;
	bh=uYfz76glZUJL24MjBKBuV2G01LQWfT3Ca+KuRvq4AQg=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=n4dVYrcAUIr1ZBSZEFQwS4x5GwovqfAhDsma3q4ynreLbLBR/Kqn52/jnRoZ4k6BvF+Hto5Ady27Ey5+sVlsCL//Hj+YZL/XzE8/Fa9DSOTXMhOSZLETxQlp8kbAYQNUbKHOtecbeDrUjCkg5ENRIeZ2W0BUyFQE/PpT8OH3DQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPzElT1i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1305C4CEF7;
	Mon, 29 Dec 2025 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767040770;
	bh=uYfz76glZUJL24MjBKBuV2G01LQWfT3Ca+KuRvq4AQg=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=mPzElT1igyVRepSGYb7Yj0PmsDvlXfLytNszI03II/dwFcNnyC761iB+xV5sL275u
	 wHSIZuMFWvvEhjeEP6uyIkYPv6Updv4HQvEsMdZ3l3ovBVCtm4lDRZIZPFc+3RO1QN
	 2TD0OrFS2TPypV4v6dPDlX9L3f9FvoNzdPz2cuLBZJ1k62QQMUyAtCt0AcvwQCvu8o
	 Nu0d/35rTCxyJl+3xe+Zsor+kTO23YpVUU24UXG1WGimjkgQPeS7s5pGyATF+prn9t
	 Xlb4RSExV3EMkDE+Fy9KSteuzA5Nawk9E2yxMhytMFkaArc0P9lvsASBUKcTmeUSqA
	 BVUAD6a/rgw6A==
From: Rob Herring <robh@kernel.org>
Date: Mon, 29 Dec 2025 14:39:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>, 
 Prakash Gupta <guptap@qti.qualcomm.com>, konradybcio@kernel.org, 
 vikash.garodia@oss.qualcomm.com, andersson@kernel.org, 
 dikshita.agarwal@oss.qualcomm.com, akhilpo@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, lumag@kernel.org, 
 robin.clark@oss.qualcomm.com, devicetree@vger.kernel.org, 
 conor+dt@kernel.org
To: Sumit Garg <sumit.garg@kernel.org>
In-Reply-To: <20251229071258.456254-1-sumit.garg@kernel.org>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
Message-Id: <176703895892.2173273.270267541659374260.robh@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties


On Mon, 29 Dec 2025 12:42:57 +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Fix IOMMU DT propeties for GPU, display and video peripherals via
> dropping SMMU stream IDs which relates to secure context bank.
> 
> This problem only surfaced when the Gunyah based firmware stack is
> ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> as a fault by Gunyah hypervisor which were previously ignored by QHEE
> hypervisor.
> 
> The DT changes should be backwards compatible with legacy QHEE based
> firmware stack too.
> 
> Suggested-by: Prakash Gupta <guptap@qti.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20251219 (exact match)
 Base: tags/next-20251219 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251229071258.456254-1-sumit.garg@kernel.org:

arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: display-subsystem@5e00000 (qcom,qcm2290-mdss): iommus: [[38, 1056, 2]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml
arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: video-codec@5a00000 (qcom,qcm2290-venus): iommus: [[38, 2144, 0], [38, 2176, 0]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml






