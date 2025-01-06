Return-Path: <linux-arm-msm+bounces-44032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856CA0303F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 20:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F3973A57BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 19:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D5F1DFD9E;
	Mon,  6 Jan 2025 19:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pg7XiA2I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB621DF97D;
	Mon,  6 Jan 2025 19:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736190656; cv=none; b=fOS34O6aR2VJslEGd8S3q+6M/ucWRrXhT4W7GhEW3rKzF8ClTwKThIqQ0Td+7Ts8BKH+dcCFSqsxOi55oXruxjWi6Yo/3+bWHP/XEHXUQedGyDptiBDHhQA2U16CIDz4vS6UfaSgTBL+tM62NtSqk9YhYzZ16TGzsac0D3YhB3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736190656; c=relaxed/simple;
	bh=2Y7A97aMbUWW+oSyFhzbH5y7x4SdYncWayLow7TnTOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8i/aSmBmc3J/a/+KwNdCAdwz9DC5LCL2zGlY5F6b8g3Ks7ommz9O2JwHwqKokyvl5nNd+kuxYOX6NoYgR9brZI6Y5+nlrHJxnCAHGLEUG6rvc/r+kK+wcy2Cj5VKmffd7g8AJc+ADuNlA9g9/a9+ac2Ia4H1KH0ZyutaSgOiAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pg7XiA2I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718FFC4CED6;
	Mon,  6 Jan 2025 19:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736190655;
	bh=2Y7A97aMbUWW+oSyFhzbH5y7x4SdYncWayLow7TnTOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pg7XiA2IUs1V4wKMOUU7b3qaPJd2WrHbExu/gHdjUU3qv+zp+yl9DiR3elHGduA2m
	 mhav29JdmWzuf/Zz2Jiveb65/a55XcJhQrOdehwJoWdTBfX/uWCdm22BkKlvV/jmjE
	 PzSDaR0go3VHs1cFBgjU3wfGHpciu1pBwfZYHIxQ+hjfBCe0OeoeBEbHTl9iFzyiKP
	 JFThpjyuHsW2xdUe3Pf93JWn50bs/QJwUmuBdB3s5lHdQvnC1mh2xB8c1TDPxVLCFT
	 ZDlvrO6fawpbHjKZ/tx1p9wypQ+CkHtE6Ba2bYLLGrUVEng4vAg8TJbq5bBDzlj0/q
	 S76XCxB+cevvw==
Date: Mon, 6 Jan 2025 13:10:54 -0600
From: Rob Herring <robh@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/5] dt-bindings: qcom,pdc: document QCS615 Power
 Domain Controller
Message-ID: <20250106191054.GA820925-robh@kernel.org>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
 <20241104-add_initial_support_for_qcs615-v5-2-9dde8d7b80b0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-2-9dde8d7b80b0@quicinc.com>

On Mon, Nov 04, 2024 at 05:10:09PM +0800, Lijuan Gao wrote:
> Add a compatible for the Power Domain Controller on QCS615 platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

