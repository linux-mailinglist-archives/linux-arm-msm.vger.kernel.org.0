Return-Path: <linux-arm-msm+bounces-73615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582FB58631
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 22:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E4C77AF065
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 20:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AD627A103;
	Mon, 15 Sep 2025 20:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZcf23FE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09357218AB4;
	Mon, 15 Sep 2025 20:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757969472; cv=none; b=IZkOpo82Z1zV4NwF/H+4oOyqm9bM4FvIKOk3Vk8ACAslEutDkRzqV6mPjFZeFOxcal0nxXnHSWMudTyHA74evfMECkZR593NUpGl0MVTAZz6nCKVBxk3ulHMNLL2U7iMJEa9pqgbMHN0TUS6WSUuERM3CvYvVB6KS/NyJPvLwBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757969472; c=relaxed/simple;
	bh=9YHg41vqt0ebRojz/97YvJYCP7RgDKdx97lGOjBB2ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bw39lsSnuP5C/tUAdHyzxTbVP0djgrZ4cpdNXcHT1opFosqnfXqOe1fNCSF+QUIPXaDqh4dArZnIzZHMmphHTLASP4RK9nntpGWkANAHXLRiiZSRd3WDLYJs4LJTO138i/jNJE/B3R2lCEX7xN2niNo8BPbGvE+lzfCsFQ5mjSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZcf23FE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C589C4CEF1;
	Mon, 15 Sep 2025 20:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757969471;
	bh=9YHg41vqt0ebRojz/97YvJYCP7RgDKdx97lGOjBB2ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZcf23FErrbnS9UYHQyPcHCxzzAmUd7sP6OZz3ydB1KANzajkJyICv4kS+dr50Hw6
	 atIbLqGJnkJPjrSM2mGx7smoiSZYf8Wdt3SPAZqECDUp/wZDK+SKXQVc/jhQyjGkGq
	 oALm8Htug3FoKsRrqcDjTsdI2PrwmNjTCuTGI5Pf+pIFiWdcgbdgH2BHk19zXdTUXC
	 FH+RRv/plrUvw5cSSEek6qFDwLK5WJofClRIJTOnPYavW8s7v625a3hWNsLPIzEPtg
	 ejYC/9RC1K2knNNMPTRpkWGnl0uahTa32urdVr3Lj0BXePZYmhm30ZbcEO1d6Hpbo8
	 GaEYl1f1jH0dQ==
Date: Mon, 15 Sep 2025 15:51:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Johan Hovold <johan@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: Add DP PHY compatible for Glymur
Message-ID: <175796946956.3372194.9955509101824246732.robh@kernel.org>
References: <20250911-phy-qcom-edp-add-glymur-support-v3-0-1c8514313a16@linaro.org>
 <20250911-phy-qcom-edp-add-glymur-support-v3-1-1c8514313a16@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-phy-qcom-edp-add-glymur-support-v3-1-1c8514313a16@linaro.org>


On Thu, 11 Sep 2025 17:45:22 +0300, Abel Vesa wrote:
> The Glymur platform is the first one to use the eDP PHY version 8.
> This makes it incompatible with any of the earlier platforms and therefore
> requires a dedicated compatible. So document it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


