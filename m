Return-Path: <linux-arm-msm+bounces-26716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EFF938A49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5EAB28195D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EC713E02A;
	Mon, 22 Jul 2024 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFlIo849"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480AB12B63;
	Mon, 22 Jul 2024 07:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721634033; cv=none; b=vBwsXy7U1nmtm1z5mD3tSm35rfSLgOIPxCukan/L5vyoiizzJorsQconcxEf54dUgDGjuZVDfS0k7GAvacHbH74sN4coO+j13zW74/S6yPmQnJmF5PUBCArBBc3Unh12GC9pv9WeCz9LXWbkpUlaiaGtCZ8RV5H9mh8HB15Nd20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721634033; c=relaxed/simple;
	bh=6L+ZYap7/j/td1nj7iqlPmjPTQJPSDWxRAfAEpLqVbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSXHvtQDOqDx3pUenY1MW+v2mb3uCOPkhGNKfZHexcwC46r0RHUqR+Ptq9WVctHgeMSKeSJvrSF8zZOMCo4rF82tBeKCD1iit3KG8t1B0P3o1fXx2iHxoSLMjc75m+bnTQOee2KyO8vwzunYLGXYmEDSNwuPND9A83VqUE3lMro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFlIo849; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06C2C116B1;
	Mon, 22 Jul 2024 07:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721634032;
	bh=6L+ZYap7/j/td1nj7iqlPmjPTQJPSDWxRAfAEpLqVbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rFlIo849vD164UIKFxa8fP+rqf07j8ibynSJgvkCNzpndWo+twyu4m6lNXEwflq2K
	 oMH2s/uymQqHbZAkar2EDY4lw5uR5864XFaKqYfMhSiK1CtnDFmeI++ryDozfuk6LN
	 +sOuOzKDmt5jlmY3KGLWPcHntZhiatN5OE9m0O02YHNpu4rCre855ZwQn+WqXA3wQ2
	 dt7AJhngwbEjmpyULeFmpswsU9R4gL1tQC4h4mSHXAPULPDytLRmqY/41Nz8zPsfqE
	 zs1A/aXRq3ogyDHtk+HSiU3FPGJDFCVLnf5aCPLCKw7mRkSBXluSAkcMnS+xmQjzrV
	 GFkfnshPirUYQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sVnep-000000001i5-25Ts;
	Mon, 22 Jul 2024 09:40:31 +0200
Date: Mon, 22 Jul 2024 09:40:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: x1e80100: add PCIe5 nodes
Message-ID: <Zp4M7_joSOkp70D-@hovoldconsulting.com>
References: <20240719131722.8343-1-johan+linaro@kernel.org>
 <20240719131722.8343-7-johan+linaro@kernel.org>
 <b0e46b2f-7408-4e89-9496-323e1ab761c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0e46b2f-7408-4e89-9496-323e1ab761c7@linaro.org>

On Fri, Jul 19, 2024 at 08:39:05PM +0200, Konrad Dybcio wrote:
> On 19.07.2024 3:17 PM, Johan Hovold wrote:
> > Describe the fifth PCIe controller and its PHY.
> > 
> > Note that using the GIC ITS with PCIe5 does not work currently so the
> > ITS mapping is left unspecified for now.
> > 
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> feel free to also add
> 
> required-opps = <&rpmhpd_opp_nom>;

Sure, thanks for the reminder.

Johan

