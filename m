Return-Path: <linux-arm-msm+bounces-34712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B239A1E1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E2821F22807
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1585F1D90CB;
	Thu, 17 Oct 2024 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZxjnM5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97D01D90B9;
	Thu, 17 Oct 2024 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156835; cv=none; b=HMXR6OpCR3JqzTrXF/jAfgvJVUl0OSnHejXNPIsfiAbWjxC5HeFqIgQnbTevECxKLM7trQ49/wRgYthneJuwnI2Y/PQi8YVp84xfwqEc8PlPkyRgRwuspiBtPqB6BMTF4xB/8WxAVpBWGzc84PTnDPZIB34LB6A4nf2c5LRt0Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156835; c=relaxed/simple;
	bh=EaL0DwqYapO/Y83H8NxBhBrPSZO/elEPLp5/NgQzqDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnLex0NHLWSfOxl6ZKDHNBefY+x1FaCZ//8cBTZSWU5wxa3WuYe/rJg4AyP+bFO1e+BB0OszPHUhyNPktXCsA7ZULWKv3pxx9/OJk1hqIPnBi/UJ9bSbnQ0HiP0zBKmnjwIx1skUGwTIqP4ol9kGEgkkuYLr7mvXrAYfLHFL5rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZxjnM5c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D81FC4CEC5;
	Thu, 17 Oct 2024 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729156834;
	bh=EaL0DwqYapO/Y83H8NxBhBrPSZO/elEPLp5/NgQzqDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZxjnM5cbGFmmxY/NcihzyAoxUY5RidF2dJpudHnXR4g/M9ED7HEN6aMCHc4L6/tG
	 nvcx9XHGt1g3IF8jYp45NDhACJtNXseTZ3j/kMAl3GtMZKMDaepkqAGz1U6st8qyLL
	 arySUOz9t2ItkFxU3h9NeBYeyrCSwms+wtzHRaanMACd2eouZHiSG//YTbg/QvE155
	 qcATxUZggxaf7AETEQVkSgBvais8pfIZaidX2Zvgz37JOBapbUn7Ab/EVB0ulRFFZE
	 +I1EeAba3D45PGdUGSdACLrBgPBq34p74cPcxnweFDAyqvlpfqVJwoRbExD8qwWmmU
	 NyB3ojO/z7IDA==
Date: Thu, 17 Oct 2024 11:20:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xin Liu <quic_liuxin@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	quic_jiegan@quicinc.com, quic_aiquny@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_sayalil@quicinc.com
Subject: Re: [PATCH v1 1/4] dt-bindings: phy: Add QMP UFS PHY comptible for
 QCS615
Message-ID: <eirmiqaivwja4bpm7nrsloo2n6pojrvmd25wxc7bgsrzzrh7zn@k3b47pyw3kv5>
References: <20241017042300.872963-1-quic_liuxin@quicinc.com>
 <20241017042300.872963-2-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017042300.872963-2-quic_liuxin@quicinc.com>

On Thu, Oct 17, 2024 at 12:22:57PM +0800, Xin Liu wrote:
> From: Sayali Lokhande <quic_sayalil@quicinc.com>	
> 	
> Document the QMP UFS PHY compatible for Qualcomm QCS615 to support physical
> layer functionality for UFS found on the SoC. Use fallback to indicate the
> compatibility of the QMP UFS PHY on the QCS615 with that on the SM6115.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


