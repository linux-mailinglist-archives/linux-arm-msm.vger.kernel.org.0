Return-Path: <linux-arm-msm+bounces-84938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3B1CB40C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 22:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD5B030657A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 21:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101C532E721;
	Wed, 10 Dec 2025 21:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrGdy2wc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D752414B953;
	Wed, 10 Dec 2025 21:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765401592; cv=none; b=IvDveveosrb7zCGYsO+wqbKtTrun8IjlBcB9y3U3mj3TfXeYTnHpryqYynhmvR4bT+o3FYEW6y4n2+iHrzrixwaDdwzQN1+AI04GQM2hcnbh2U9ealqTmm8GmGhh5R6gPEOhD3bU6GkZ7aBuKB0cQv2RLcXR3n6s99Vu82ua60E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765401592; c=relaxed/simple;
	bh=LRy9OKjqzKVMMtq0PqPtKw1sozkQrlq8m/LF5E2xCuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQxm3+zS8WWdek5ujxFa9OeEUUXJB/bez2XyqPKl5qnsatkGGV6SOU4pDQEt1vh7XVu5cL35zAslP2F5x7cUWfalKM4zJZQjy/NI7l1P7jg7vIMAe65436zojkxygsA+BKzzeRRajo+DM/DHDDc/ZHCzZ914gfuxy1dcXJJ4ZMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrGdy2wc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43982C113D0;
	Wed, 10 Dec 2025 21:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765401591;
	bh=LRy9OKjqzKVMMtq0PqPtKw1sozkQrlq8m/LF5E2xCuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrGdy2wc1+apC6pVUqDgA5YNnPqK+lurEw795lR9UkPstj9zhgP0KCn49qYzKSAIm
	 NRG+7Sivi5/Y5Tf4M8nGD7SRFm5zm6Rx9j6zZJKRGRsjjx/XqzY6IoJ+NjEEcLrhGN
	 ylF4GihuO645eTGvIf3Zyrlb7/hxdLwNCNOQuUxDsJqBtL4TS+omQ6LMeDVTLt4ZVt
	 BdEAOWGJnEROb1c37vZ3jEuL5ny34gLCijLA/iGV8uUlXAscDCVj0cONiGMHZZWUHE
	 EfCVF8eznDl0IOeyuHBEVxO/M/Zoen0aGeuWz8Wg1Tyx43hdFVYbCBEBg9ObCzmOEa
	 kyHtxpWTTui+w==
Date: Wed, 10 Dec 2025 15:19:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, vkoul@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH v8 1/9] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add Glymur compatible
Message-ID: <176540158800.3359535.4500963269576510341.robh@kernel.org>
References: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
 <20251209-linux-next-12825-v8-1-42133596bda0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-linux-next-12825-v8-1-42133596bda0@oss.qualcomm.com>


On Tue, 09 Dec 2025 15:09:37 -0800, Wesley Cheng wrote:
> Define a Glymur compatible string for the QMP combo PHY, along with
> resource requirements.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


