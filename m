Return-Path: <linux-arm-msm+bounces-35269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D949A721E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 20:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EBCBB20DC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 18:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEA91CFEAD;
	Mon, 21 Oct 2024 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdEuE9l7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C3F79CF;
	Mon, 21 Oct 2024 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729534602; cv=none; b=emOqsCmWJJXC1XzIlUXz3KW1HYR/Q1MJzGPw8nVa31hef/PVY/r3ZD+vfsS1KN11Oz+fsOfccMebCtY9ayeNG2klnvwMLF3FQtf4Ry6BIkjNDrS0bFZzngMQjYhHVKN3VFXQsDfTicLTtxo614BRZEfLP5mRGFOOKnbjaEIJwXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729534602; c=relaxed/simple;
	bh=535weqGthcOSSyLKIbRyjS0M8aM1BuA4DQbzV12il9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZoEJpFsqtSys1SIUChxzfAtfPcWiPndrdRYSMpC1oIDmdEQFTGKaGL5qp9X5Y3PRr48Lgj2peqJzZhz4rnShNs4IUWcuUncoC0JXSQa44Q3kiR5NwAxpVnSaaA5SldP7U2WN3K9qntEpC5SrDsq8X9OHDiN/oOI7oTkKzGeghI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdEuE9l7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59079C4CEC7;
	Mon, 21 Oct 2024 18:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729534602;
	bh=535weqGthcOSSyLKIbRyjS0M8aM1BuA4DQbzV12il9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdEuE9l7w4kvRQh74utaeulNFvw7nn+FImK0ByIqLqsnkIrC+XOTNUsBjFkqpGhE6
	 HZJBPw8orsxmPx4hE7MXM5zBaUsRcb6R6Hqmj2/tki0dDi6ILPyLC6d0+0RzxXektw
	 hYk7bY5rCTtA7rNUjJ1FZ4VzURgQ1LetB6Msn9yVJBiQWzmeEY5suWCCndt49FLpz/
	 2feM0JT1aweEHZbFqk4tFZ7UEJwyhw+zlxEY3A84t1+nNMRagAqap82nIpZfL57JBB
	 0hOr7w2/eqosTr4XTxAgaTEgQMiAhBjUTGSFcRNrRhigotTilgHvp9pJT+Y1n2HC9L
	 FZOE9P2nwF4wA==
Date: Mon, 21 Oct 2024 13:16:41 -0500
From: Rob Herring <robh@kernel.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: clock: qcom: Add QCS8300 video clock
 controller
Message-ID: <20241021181641.GA874673-robh@kernel.org>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
 <20241018-qcs8300-mm-patches-v1-5-859095e0776c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-qcs8300-mm-patches-v1-5-859095e0776c@quicinc.com>

On Fri, Oct 18, 2024 at 04:42:33PM +0530, Imran Shaik wrote:
> Add device tree bindings for the video clock controller on Qualcomm
> QCS8300 platform.

That's obvious reading the diff. How is it different from the sa8775p 
version? It must be different or you should have a fallback compatible.

> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
> index 928131bff4c1..07e5d811d816 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
> @@ -18,6 +18,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,qcs8300-videocc
>        - qcom,sa8775p-videocc
>  
>    clocks:
> 
> -- 
> 2.25.1
> 

