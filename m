Return-Path: <linux-arm-msm+bounces-38374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D38829D2CD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 18:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9940B283207
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5000F1D1F71;
	Tue, 19 Nov 2024 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ss2liA1C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAE01D1300;
	Tue, 19 Nov 2024 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732038119; cv=none; b=Xy89lbhrwX30004MukNayylpRJcoFlVsbcWi+zXiELidSSFDbInoDhlab/o+BscVCzMjI0PZdtNwT5WDGvz+rQw4XWzAAGkPtOr5+rihHO5pq3lTt5aLZZHLzTLcsXj2cIgbYesnRgTGWyJ9t+Tu6/mdxlgDuo5HdukFttOY0XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732038119; c=relaxed/simple;
	bh=fC4Iu6ZTvWHVn0mAs02BF67Zmknk558M9DVYXjCgc4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQVKOAZEcRnxNlrkmP13qIwJ7F7fOwgtvBD/dQcjEvzOsWnns9JwxKcItOL6hLhQm5OfEaHzOLbX0Od8IIt32lhhFosIvhMw2DBQVj/oBej1Ik5Mmo68AfBh186EKRTcV1M35N/e1wSsw/wf1a+s6CccP7zEqQ7F5WXMhctN4tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ss2liA1C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83357C4CED0;
	Tue, 19 Nov 2024 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732038118;
	bh=fC4Iu6ZTvWHVn0mAs02BF67Zmknk558M9DVYXjCgc4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ss2liA1CbtHjZtbxReG294xHb1gK7mWNfZcPAT3S6IoLVxeHOZMI+N76tfRN18dpw
	 L0tCD/2wgFXBxM1qWJDBHnZDl/jeJfSvEHTX64KLSF1Eqd1AT5HZnLaeeEifiYC+XE
	 lzfgTvx/U3s/CbkjsUN/v/hPdBPOhRs0AnlvtVG0F7ff9y+iQ7JyaMYz5BzwDNwaqL
	 Y6jZEput4/yxkde6XPdP7J7qVCn3OVSJuYQ8YpwqS3PL3KAOPep8m8CF2eRqxyswUn
	 9TkeeWfUkuZBtlY/nZGfs6xrY9pj0jxfGmYU/5GRXFRCYHDkZzQmhcg24iyx4m/WQX
	 y+yEn6R3bYzJw==
Date: Tue, 19 Nov 2024 11:41:56 -0600
From: Rob Herring <robh@kernel.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, quic_tingweiz@quicinc.com,
	quic_aiquny@quicinc.com, quic_tengfan@quicinc.com,
	quic_jiegan@quicinc.com, quic_jingyw@quicinc.com,
	quic_jsuraj@quicinc.com
Subject: Re: [PATCH 1/3] dt-bindings: net: qcom,ethqos: revise description
 for qcs615
Message-ID: <20241119174156.GA1862978-robh@kernel.org>
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
 <20241118-schema-v1-1-11b7c1583c0c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-schema-v1-1-11b7c1583c0c@quicinc.com>

On Mon, Nov 18, 2024 at 02:16:50PM +0800, Yijie Yang wrote:
> The core version of EMAC on qcs615 has minor differences compared to that
> on sm8150. During the bring-up routine, the loopback bit needs to be set,
> and the Power-On Reset (POR) status of the registers isn't entirely
> consistent with sm8150 either.
> Therefore, it should be treated as a separate entity rather than a
> fallback option.

'revise description' is not very specific. 'Drop fallback compatible for 
qcom,qcs615-ethqos' would be better.

However, this is an ABI change. You could leave the binding/dts alone 
and only change the kernel driver to match on qcom,qcs615-ethqos to 
achieve what you need. If there's a reason why the ABI change is okay, 
then you need to detail that. Did the driver never work? Are there no 
users yet?

> 
> Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 0bcd593a7bd093d4475908d82585c36dd6b3a284..576a52742ff45d4984388bbc0fcc91fa91bab677 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -23,12 +23,9 @@ properties:
>            - enum:
>                - qcom,qcs8300-ethqos
>            - const: qcom,sa8775p-ethqos
> -      - items:
> -          - enum:
> -              - qcom,qcs615-ethqos
> -          - const: qcom,sm8150-ethqos
>        - enum:
>            - qcom,qcs404-ethqos
> +          - qcom,qcs615-ethqos
>            - qcom,sa8775p-ethqos
>            - qcom,sc8280xp-ethqos
>            - qcom,sm8150-ethqos
> 
> -- 
> 2.34.1
> 

