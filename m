Return-Path: <linux-arm-msm+bounces-45275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC025A13C09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 15:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 477B0188CEF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 14:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4347522A7F2;
	Thu, 16 Jan 2025 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grMrFL8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113EE1DE2B9;
	Thu, 16 Jan 2025 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737037340; cv=none; b=iqYXAHASY64HWRczsiyrmmvrHfKAlSDigTeHX4uF+ySd+KeCh1mmzwq5cRIxwLtPAgujGtg8imHpdpPxnOT54CJ9CUNFFdgE+OeBUi7AIAogd/xshgAQiWdXfn+vDKQOyneUeFWOhdQHgCUY0Mg/uAOzZvbC0+d1jU+t4oQ7rRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737037340; c=relaxed/simple;
	bh=pJsxjspJlyLcmmLB+dqam9qL9oikWlt2JRgFOhW2txs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iV97pR77z2OtU9cKAK7X/SuQsyvVAp9gctSmjHke3u6rSjLbl2ntDmxq12RkqfGLT14Em/w4tGxpDMywgDVJn3L7Gt+T9p3Z1ufG0aheUmnEdLUA7vmFm+7fsXKDtF0B790R4lnru1Crtchtr36hDTocqz2+F0ep+PujviWIF18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grMrFL8a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A0CC4CED6;
	Thu, 16 Jan 2025 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737037339;
	bh=pJsxjspJlyLcmmLB+dqam9qL9oikWlt2JRgFOhW2txs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grMrFL8aJmaqLvYKCBlJB99+CeWOHD/Ig5q8fG/c+00f+Qp2ZUfzLiqRyOSSeJUDj
	 Dfugujjxs5/XdrfFLP9NgPbEl6RTxMu7kiCISRyQDz6RREF0lHI27BB14l+crs4LM3
	 s2ZnF0yVOS+l8r9gotY04OPjazx2e28vu/g/0EqBRrzli35kX3dDwSFCLOPFO3hGYp
	 OPAag/EnKhYqWbuhxd0WxH/z93GG9aw1cYtq5tOjFW0Gsi6emhnTt3emr6+4xSy06K
	 G0SRzeYRLdINoRYVw9hObUbbjvxcCGk0XRuGB+6E9bFda+ouj/YIh2qEA8DBZkKmdV
	 8PP3pfZN+TCbQ==
Date: Thu, 16 Jan 2025 08:22:18 -0600
From: Rob Herring <robh@kernel.org>
To: Xin Liu <quic_liuxin@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	quic_jiegan@quicinc.com, quic_aiquny@quicinc.com,
	quic_tingweiz@quicinc.com, quic_sayalil@quicinc.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: ufs: qcom: Add UFS Host Controller
 for QCS615
Message-ID: <20250116142218.GA2176564-robh@kernel.org>
References: <20241216095439.531357-1-quic_liuxin@quicinc.com>
 <20241216095439.531357-2-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216095439.531357-2-quic_liuxin@quicinc.com>

On Mon, Dec 16, 2024 at 05:54:37PM +0800, Xin Liu wrote:
> From: Sayali Lokhande <quic_sayalil@quicinc.com>
> 
> Document the Universal Flash Storage(UFS) Host Controller on the Qualcomm
> QCS615 Platform.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Looks like this was missed. Applied.

Rob

