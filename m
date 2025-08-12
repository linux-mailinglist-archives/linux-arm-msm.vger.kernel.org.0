Return-Path: <linux-arm-msm+bounces-68616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AE6B21AB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 04:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 456F83BF542
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 02:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696642DEA60;
	Tue, 12 Aug 2025 02:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPaIDJLG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABDB2D8365;
	Tue, 12 Aug 2025 02:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754965449; cv=none; b=QRx6EuoRCCqazW8rw2xFKUSvjTZeVKp7s0BtKENAUir1LMNnbXDR6+hqKYJIuQzvkWX0nOMQeetLNqQJZ2PfE+BF+K7/lNla97dbHY2QH1LgedfefdeqGc/xuBBbwoboGLmBVdxz9N4+k3nDT6RdqbVTqlK0n9hz6KgYhSUJAuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754965449; c=relaxed/simple;
	bh=asvWv2bSNLXLGWE7FVWYNqw9ZydiOrnVs4ABf4yoFN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWK5DsqnAF0X6MRAbeRlVQPzH/ik/XO27twr2TkULxYGBIoruAbJPzfNgy8ornP94lZg1Aw6AZjWg4BSHlD75D5P6vzzoSPKeld9hzh84FaT3VngdKQFXsVOVCZ1y14p8U3ua5zFqbK+/bPtKqty/LEMdp8yglQPKA+Yy3c5lUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPaIDJLG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E597FC4CEED;
	Tue, 12 Aug 2025 02:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754965448;
	bh=asvWv2bSNLXLGWE7FVWYNqw9ZydiOrnVs4ABf4yoFN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPaIDJLGYLmEv2EsWT+mb1K0/93aktw5DRUhh+JmzXo8Q1fZl8FHcNpQZMeyU03KZ
	 QkFdwU7k6DmPjlsNI+R2reM+EwblwHQy324uoZ7WhfB+gbH3ortN567kcIRikOdcRN
	 DkTytLZXs6dNjPgSN46bfWoWtEcQGnI7ueFr+B2cxHnux2lHuviH6cSsjCcxtvZZxq
	 YR2SUsHKCX2EqJspBW6WON+obvsxk4V5K+aI0kdOzAIh4UQRXzbfX/0BDqvqIOHE5P
	 KA5dPgITJopVyLiQ9hv+ednY6dnRB7HRXUwp1p8BaFU/qlnH2FLe7dxnA9SYqwO+dj
	 CwG++Rp9dHrtg==
Date: Mon, 11 Aug 2025 21:24:06 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH v3 0/2] Enable audio on qcs9075-evk board
Message-ID: <l7kwna7lebazoaqxz3zdkv325kw4ohsuidfzltdy3msfiburb6@iz4atympejdx>
References: <20250724155632.236675-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724155632.236675-1-mohammad.rafi.shaik@oss.qualcomm.com>

On Thu, Jul 24, 2025 at 09:26:30PM +0530, Mohammad Rafi Shaik wrote:
> Enable audio support on qcs9075-evk board.
> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker amplifier is connected via HS0 and I2S
> microphones utilize the HS2 interface.
> 
> DT-Binding link for sound compatible:
> https://lore.kernel.org/linux-sound/20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> ---
> This patch series depends on patch series:
> https://lore.kernel.org/linux-arm-msm/20250530092850.631831-1-quic_wasimn@quicinc.com/

Please resubmit once this is tested on a clean upstream branch.

Thanks,
Bjorn

> ---
> 
> changes in [v3]:
> 	- Updated link-name from HS0 MI2S to HS1 MI2S and sorted nodes in order.
> 	- Link to V2 : https://lore.kernel.org/linux-arm-msm/20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> changes in [v2]:
> 	- Updated commit message as suggested by Dmitry Baryshkov.
> 	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> Mohammad Rafi Shaik (2):
>   arm64: dts: qcom: sa8775p: Add gpr node
>   arm64: dts: qcom: qcs9075-evk: Add sound card
> 
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 54 +++++++++++++++++++
>  2 files changed, 106 insertions(+)
> 
> 
> base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
> prerequisite-patch-id: 853eaf437b81f6fa9bd6d36e6ed5350acaf73017
> prerequisite-patch-id: 6d9fd3e0257f120cff342c287774454aad2be2e8
> prerequisite-patch-id: 736cbcd47d5e7cfcc53fcaa7da920eac757ce487
> prerequisite-patch-id: 4eddce6daeaa125f14380586c759f8cb8997c601
> prerequisite-patch-id: baac180e8715b5cf2922f79346440d92569704f6
> prerequisite-patch-id: 65730290d31f18e66e2ba0dfdeb1844d7442c272
> -- 
> 2.34.1
> 

