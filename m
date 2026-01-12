Return-Path: <linux-arm-msm+bounces-88602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B41D1423A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 17:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCF963066F20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 16:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675B0364049;
	Mon, 12 Jan 2026 16:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuMzKpcd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421163612CB;
	Mon, 12 Jan 2026 16:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768236130; cv=none; b=OFNQh9Qu5HUqlwmYXO1Rl+l7YIeC1HE3FGHcVcV568THDLwcKHcEPXQgoSK4+2sjTgx9XgwMlkwOyxxkF4Hl6Mmh/cB4usFiRIjdQi9CCaXHuYcuiGaPwI9xZXX45bUb/RzsFWLf8BGnuOs4C9fbohZpQW9LRL4EFnB20E3HLV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768236130; c=relaxed/simple;
	bh=G9B2hVlV2rFtoaRFNjq8bmhBptBly4XOE50jKCYkXiQ=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HhLC0E04ituVc+8Qi34igMA1SXyTRvyHBPBumhoo+QuOHmN98fysy/qz0TD4jIQ5vL2Iew4pm24YlxTJ0F2s5X0QfyMBf6/5RB2JgA82BeN0d303s95HQJKtfabETpqJdU1cF9RR0ahXUzMqbmvOsOJFWZS9mKSERh/21N+9tXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuMzKpcd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4021C16AAE;
	Mon, 12 Jan 2026 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768236130;
	bh=G9B2hVlV2rFtoaRFNjq8bmhBptBly4XOE50jKCYkXiQ=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=EuMzKpcd0fm9qsLM4hASm1Tpa/S4YN7GVGsxDV26HJOipbTUS36D5VnvdAGGKbvFT
	 bj4S86C7HAxeYwO5vFsDSA9c/J4QikMIR824VqiCDdMvd2FBFNJ84sh78g2wozQ1vR
	 9DUWcMAb+ktKuLqLrpNzPKQiMGW9vtfyFDCkdwTfSLR/CRFcrYd/Hqr1+9P8tyrQ1M
	 SfjGwWngqEtVwSqAdMXI4MG7blDiaPuF9a2CYh3mREH5+Anhu/93KZpcLzRQ6D/+9R
	 gnXz4HYWEY1UgrRJBKNAwkvPPGvGnFVH7V3a5Pr5u+TJhjLR+LDOYJynfvkG3d9z9P
	 EDGhbCr01c2Mw==
From: Rob Herring <robh@kernel.org>
Date: Mon, 12 Jan 2026 10:42:09 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org, 
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
References: <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
Message-Id: <176823586306.507061.1753959146753763642.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Enable download mode
 register write


On Mon, 12 Jan 2026 20:47:25 +0530, Mukesh Ojha wrote:
> Enable download mode setting for sm8750 which can help collect
> ramdump for this SoC.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
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
 Base: tags/v6.19-rc1-51-g65ce09d2f164 (exact match)
 Base: tags/v6.19-rc1-51-g65ce09d2f164 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: syscon@1fc0000 (qcom,sm8750-tcsr): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: syscon@1fc0000 (qcom,sm8750-tcsr): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml






