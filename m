Return-Path: <linux-arm-msm+bounces-64300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17273AFFB20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEBB63B1252
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 07:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74554289835;
	Thu, 10 Jul 2025 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTtkzOjt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4881C241661;
	Thu, 10 Jul 2025 07:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752133264; cv=none; b=KZjJaoTkY7lCzVvI3XLOat12C+ELjLMGaAJv+whdGeciYmUKjUwkNmUQzKZ/eR3KJ1PVobpF3pNotc/23a/uenX4r6mT9gC+FyVkYexGYfZhMhsDvE+AB31FTBZOaX9idczByD3eJv3wfnmXWhTKkcgG1Q+Hii9XQv4t82kPy7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752133264; c=relaxed/simple;
	bh=b2c/dVIItYgaV3VbxqZOwJymzOT16/6fke9H997b7hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ex7yA1OHWUZrWBmQgORnleArdNyxYXx9mfWauF+RZY9DLe/RJCDrMwzQuNB7QWYTqYHjy1IVBoVbi3zo2/Ppyecbh5u1WtpU5pKY2tpVGUdq+vlJFR1nw/5/PB/sHZ62VcdamCDxJNYSKX8ZTPS/zHvqkO3a2f73loehY6gvu9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTtkzOjt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C17C4CEE3;
	Thu, 10 Jul 2025 07:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752133263;
	bh=b2c/dVIItYgaV3VbxqZOwJymzOT16/6fke9H997b7hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTtkzOjtwhWjyFFyXM2O1VXAwQSdphl3g9kFAPvCHxUo0RwSJzLghLgzRK0OtOvKb
	 gkpT2jOMR3L62DZQ9v6RcC4n9zWCbCdEggJQwcVHgf31PmT/HB1BdWHOgUiQFp2XC9
	 V810dqNoO5XaYyGE830hv3yFDIzCYRb9xt7zk3OBwOFasNwXbjf/xfbMQyxA1Vs+nR
	 cUFA3V70Ag+HnAKMfroPVImGuFZHOSO4xjK4RlpBW9g33ufbqr64eNqx8f+KINJ1LI
	 psb8kjWgTZ2supBAwdp35zBSP+cPf0SE5j/48pvDk18tTJeduQ+jNdKmk3mS+WeNxe
	 5pzqZ2qZXMu4g==
Date: Thu, 10 Jul 2025 09:41:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: x1-hp-x14: Commonalize HP
 Omnibook X14 device tree
Message-ID: <20250710-horned-sandy-turkey-df269b@krzk-bin>
References: <20250709-hp-x14-x1p-v6-0-f45cc186a62d@oldschoolsolutions.biz>
 <20250709-hp-x14-x1p-v6-2-f45cc186a62d@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709-hp-x14-x1p-v6-2-f45cc186a62d@oldschoolsolutions.biz>

On Wed, Jul 09, 2025 at 09:26:53PM +0200, Jens Glathe wrote:
> Commonalize the HP Omnibook X14 device tree for derivation of Hamoa (x1e*/x1p6*)
> and Purwa (x1p4*/x1*) variants. Required because the device trees are not
> compatible.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  ...hp-omnibook-x14.dts => x1-hp-omnibook-x14.dtsi} |   27 -
>  .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1611 +-------------------
>  2 files changed, 35 insertions(+), 1603 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


