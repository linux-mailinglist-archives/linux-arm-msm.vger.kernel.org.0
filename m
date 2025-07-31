Return-Path: <linux-arm-msm+bounces-67264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC10B1759E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 19:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CFCE3AA889
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 17:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4E722FF2E;
	Thu, 31 Jul 2025 17:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hr8y+RLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D17F13D51E;
	Thu, 31 Jul 2025 17:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753983117; cv=none; b=Wh8iPXOwIa0CPZc6yvsxlg8aK/S6UuU5rugMlwkDHye6DFrkbgNFqnSg7i6MMbzVlMcU1WzQ67U4RZIuwBvr1dI9H5j1C42kjiEvMuNNi4tDqG15shqvXE+7ChbJXJT+avKNTMJUOOxSVZJL0P9pvtcVA4mHNdCkn8CiUTeQBsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753983117; c=relaxed/simple;
	bh=q8RHvNw5haIaAD1qXQTMAcuvS12A6cc3pUZcRFKcza0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCzci3nO7s4oyHDMbCijtT0uP87tbSEzLPumRpbfXXKvrUsroB2G9R5rCT37RQsJzQd0lCBln4M7XlBNnnHKKJcYU88RedLCxWd1sG9uvPweX5jXqHYhbXiLgW4OyFSnynsDXD7EZTJtrkKD8wffqkA/fOnJwEygs3L5qsQ9JEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hr8y+RLR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7881FC4CEEF;
	Thu, 31 Jul 2025 17:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753983116;
	bh=q8RHvNw5haIaAD1qXQTMAcuvS12A6cc3pUZcRFKcza0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hr8y+RLRa7MCWUELapOyKiuItv34f/1VkYDDXM+YrS4Zyj/0mGeNBgYOz1Fijnvud
	 KBFQgdBI+dDTTIf7Fbe6iX0mN29loln2HYTpqCErnQEaCfF6veLF+f9FcS9jyjWVNf
	 aFVvJXozzbgUCjXHjNR35za6w3rD6SknYE765ONGLSebZtyIuVF3NY0fs6+fFmldPj
	 PhiT1CnYhtP1l1T8mrdl27kU23+XJXp3uk1Amkj9JEjD4v9GI5ljSZsIQ27WeHa1zn
	 TH4diMLnCenmKJC9qdMtrgLz8YKkXZ54bkvVtVBqvygMsp2ZeF8JvyqJ44yP/Xoe6k
	 JdGOsNUjfgocw==
Date: Thu, 31 Jul 2025 12:31:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-scsi@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Avri Altman <avri.altman@wdc.com>,
	Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: ufs: qcom: Split common part to
 qcom,ufs-common.yaml
Message-ID: <175398311503.2264608.6277120840359704565.robh@kernel.org>
References: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
 <20250731-dt-bindings-ufs-qcom-v2-1-53bb634bf95a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-dt-bindings-ufs-qcom-v2-1-53bb634bf95a@linaro.org>


On Thu, 31 Jul 2025 09:15:52 +0200, Krzysztof Kozlowski wrote:
> The binding for Qualcomm SoC UFS controllers grew and it will grow
> further.  It already includes several conditionals, partially for
> difference in handling encryption block (ICE, either as phandle or as IO
> address space) but it will further grow for MCQ.
> 
> Prepare for splitting this one big binding into several ones for common
> group of devices by defining common part for all Qualcomm UFS schemas.
> 
> This only moves code, no functional impact expected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/ufs/qcom,ufs-common.yaml   | 67 ++++++++++++++++++++++
>  .../devicetree/bindings/ufs/qcom,ufs.yaml          | 53 +----------------
>  2 files changed, 68 insertions(+), 52 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


