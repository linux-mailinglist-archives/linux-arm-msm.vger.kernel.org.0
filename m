Return-Path: <linux-arm-msm+bounces-38370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D7E9D2C61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 18:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DCD3B29623
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D371D0E20;
	Tue, 19 Nov 2024 17:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Abev9CKP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120951CF5C7;
	Tue, 19 Nov 2024 17:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732036452; cv=none; b=ZgDepKs9V61ICv+4ABRdHe+4qPLHf9ugv/++ObcoC0lvQji7PyWTEsCH90xVevM2HkoluYQvfmI4FKXkjyBCoJvCxl8KDHCVAnDPOBE3Txnt37ofRCwL0KG+oq/L4YCXWOGUCsum/LA3IPmo17SLAyHeI4Jm0IHR0rAiw5Eg4is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732036452; c=relaxed/simple;
	bh=SpYWF5BuNymVlgtPmYea7bJ82YUuZDD1naojG4vo4W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1X0WUUOC7ks4pWZSqFF48noWJ8wPUGNhrHjyPT70yjzgjCT/mTXre7a9+Ll55m8fA2gxq15ssI+2dVj43pRxhMd/LVlWArRwYGCMd+TwUUoKRLDiLgyGDPrh4t5SaXQUDuGjwacLSZrJUf5z5Atxv+u/ArtQxRgGZ7OOWYfrTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Abev9CKP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55946C4CECF;
	Tue, 19 Nov 2024 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732036451;
	bh=SpYWF5BuNymVlgtPmYea7bJ82YUuZDD1naojG4vo4W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Abev9CKPq6SLcS249mjBIdGpgW96Y2N9Jc6+YkuTkSC40mRIE+6vjDo3Xszgi9QWG
	 wnv5Z3i5pGBc39/I0viYN9Yvj3xfFq4wxblnKlm4RmTpAxqjrrlwA0qQfTfaONSzE6
	 VKRdMCBnJNbOCURTF7fwVL79Z1Tk+sAbzf1KzSGHIp5hWFLUB7BvdxcYF1V34mHsVc
	 6uBCbtkvffaHBm03ZAf1aY+QHJ7eGYs7VxdCWW/N4pBrIG7VZDspc7KSxeAIVITNll
	 1S/xkSrhBYfp7A0d/iSbIJo+F/MJKaBkm6tQQy4MZlmaz6OHuN3fRAY1YrLsM/YPqw
	 Fdmq5j2mULoKw==
Date: Tue, 19 Nov 2024 11:14:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: Consolidate SC8180X and SM8150
 PAS files
Message-ID: <173203644923.1838066.16484557197129964234.robh@kernel.org>
References: <20241116-topic-sc8180x_rproc_bindings-v1-1-ae5d3f7ab261@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241116-topic-sc8180x_rproc_bindings-v1-1-ae5d3f7ab261@oss.qualcomm.com>


On Sat, 16 Nov 2024 12:40:04 +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SC8180X PAS bindings are plain wrong, resulting in false-positive
> dt checker errors. SC8180X's remoteprocs happen to be identical to
> SM8150's from the kernel point of view, so reuse that binding instead.
> 
> Fixes: 4865ed136045 ("dt-bindings: remoteproc: qcom: pas: Add SC8180X adsp, cdsp and mpss")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,sc8180x-pas.yaml      | 96 ----------------------
>  .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  7 ++
>  2 files changed, 7 insertions(+), 96 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


