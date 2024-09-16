Return-Path: <linux-arm-msm+bounces-31835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC88D97A492
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 16:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 979B51F286E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 14:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750531581EE;
	Mon, 16 Sep 2024 14:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4mFNmx8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACE1156C76;
	Mon, 16 Sep 2024 14:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498510; cv=none; b=RNQNLJvfFHTq0ex6rsJddrqyGBuyU0W3M8rEHmSApXBOcOLBoTNJgLrSkH+KY+NL5EdJ1opq7buRSP7eXhc0Lv0YST1I5H+k0vOpF8wXEsnvjg10bDgrImP8fi9LuMyGuEEOnAIHzoOsNnJ5nOOTkgIY47+IB0xDAQWV0sfK48o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498510; c=relaxed/simple;
	bh=/1a1DNHbwbbz0Apyb+d6ZwiAL3OpWzaeUP/511Aorkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEl7zMxaEA3iOmzvQZQCmSH/9usa84dzoLe3AQy/7SBx7JbPlgujXPzZW+yeoNuzThA7K6AmoRazY4j+dRaC7/7knoNfxzbs2ME+xpNghZvdLh9R3gUs9n+HX9xePP3rVI1pPDXBzhDrERp64a2DYfdKcdW329gkXTLD1aJAjjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4mFNmx8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A58FC4CEC4;
	Mon, 16 Sep 2024 14:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726498510;
	bh=/1a1DNHbwbbz0Apyb+d6ZwiAL3OpWzaeUP/511Aorkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J4mFNmx8oP3ifgogxE83UD8gqp/XWalQQ3FTFX3K4qSrzlIyNpTsnLGRV4o9KsIgL
	 csoBogMttiL5IxOQgbWPwMN+Ayo+QzfV7kNTySMn4eMzXMBim9IF3rLC6ClJ64rszr
	 2BdRqxVXRsAUkG51mPNLqRVB18WKgldw8dBCmFQe3DNPVIZaiBYUfOWyxqorxafo//
	 u9ZYri3Nj48QvKwizVK5rFLRlDLjtVKvWwmsQ4ByVh68kPblzd7XA7fCeOGRPQLELT
	 1oDFgDRc+8Jtxldf/Ti2e9McSyEp/UH4uSNc8e8d7Fn4Y74fNT2UZ2SoxzqRQf7rQ0
	 RYLqdEHzbBoJg==
Date: Mon, 16 Sep 2024 16:55:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, quic_tengfan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com
Subject: Re: [PATCH v2] dt-bindings: mailbox: qcom-ipcc: Document QCS8300 IPCC
Message-ID: <txtuudywzk3ppychqhlsoxqecc5kpuynzk4376gqniwiwvlvok@txccsolza5cd>
References: <20240911-qcs8300_ipcc_binding-v2-1-ca15326c5d0f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911-qcs8300_ipcc_binding-v2-1-ca15326c5d0f@quicinc.com>

On Wed, Sep 11, 2024 at 03:25:15PM +0800, Jingyi Wang wrote:
> Document the Inter-Processor Communication Controller on the Qualcomm
> QCS8300 Platform, which will be used to route interrupts across various
> subsystems found on the SoC.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
> Changes in v2:
> - decoupled from the original series.
> - Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


