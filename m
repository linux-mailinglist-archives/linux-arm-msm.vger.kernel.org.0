Return-Path: <linux-arm-msm+bounces-35176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C109A5DC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8444B20A76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C411E1022;
	Mon, 21 Oct 2024 07:57:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2228B1DF730;
	Mon, 21 Oct 2024 07:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497462; cv=none; b=fjKFc9xl4XREOt1Nk5/dxBsx+dhBBYFaZZ7Xj7xa0xsii1bZWO9nZsXD1efEsq82gVjNXVS8Q4oyXtN6LK5fF3SbsB8Vwg61nDlGqokDdb+jNtP5NX2xfzSXjXMvoCsThLMMT4QOQNEusFYXap6qF9hpbo64a4UUKpc78nh/mHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497462; c=relaxed/simple;
	bh=0uLjBf18Xz4SF1MWvZb3/ZoXIhPTTkH+q/ljSF3KWM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjsADItlWdBGE5Zs7JeiVA1ygy1ijYfrOD3MQJSPQdPKg5eWhqJxhL0jUU3NN5rWkQv2Ps15V/WMpkWZVs2gqC5XBD9XqqtQVetDIvUTodwHY1Ll8El5nlio+8rwn+/lwe0dYkkEYTaX7JCLXJDA9/745TdlkfASlxAV4RsH8ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC71C4CECD;
	Mon, 21 Oct 2024 07:57:40 +0000 (UTC)
Date: Mon, 21 Oct 2024 09:57:37 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: cache: qcom,llcc: Fix X1E80100 reg entries
Message-ID: <ksadu3tkdrnioetmbkhcxojme3nqacftgmsxgvkeod4iunf5ri@hvu4t3yae7yf>
References: <20241018-qcom-llcc-bindings-reg-ranges-fix-v1-1-88693cb7723b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018-qcom-llcc-bindings-reg-ranges-fix-v1-1-88693cb7723b@linaro.org>

On Fri, Oct 18, 2024 at 04:13:47PM +0300, Abel Vesa wrote:
> Document the missing Broadcast_AND region for x1e80100.
> 
> Fixes: e9ceb595c2d3 ("dt-bindings: cache: qcom,llcc: Add X1E80100 compatible")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410181235.L7MF7z48-lkp@intel.com/
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 36 ++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


