Return-Path: <linux-arm-msm+bounces-78830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9389C0B56F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 23:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8A6A4EC09B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 22:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C75220F21;
	Sun, 26 Oct 2025 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/j6GBVG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CDC72633;
	Sun, 26 Oct 2025 22:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761516969; cv=none; b=MHwrOF3Db+rjmS/EXdbnCJGxAsT27Pj09Hc276xatM/xeNf5n2HTCvL8Bz4nkqIoMZd1n4f9ts+JTzaIrwcHl28s13xXIMO4jUlx0Mfm7tsKkyxq1vm6kDXvFX7igYFwX+h+gI0ow2W2lGziC5bb/BESdXaM9g7YNvsp5KrL2bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761516969; c=relaxed/simple;
	bh=hf0MQPvlwmnrQZ4Uh99kWaLjaZ9p9BCXmhKHUoGG2mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrfOmda1PHoPRIxnQEQfH6jIXwC8O262dQGnPP/F3PCKv/uNPWn0CS4TYNatwic1YSBanh6HJqVfzttkyqtIXGCsQPJBnmexjhd+GILbr1rEMKJJqVYVaM9GIGZqPDDkNno2ibC0vRHcEcTQYxj6neohbdMH3CU21zL16vVlPN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/j6GBVG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9567DC4CEE7;
	Sun, 26 Oct 2025 22:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761516967;
	bh=hf0MQPvlwmnrQZ4Uh99kWaLjaZ9p9BCXmhKHUoGG2mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/j6GBVGkEhI9/N41FhFhd4ryMzet+M82sLkGIz5HjOGHn+WBbgsLKlatHXT/SOnI
	 nzEARrhX19fxGqqj4S7dw3Ef4lFCfEp67sOivOHryRU+IyGH8DtLLA4Hj3kYmSWViH
	 N7z1cVP8yrXGtiG6y7L32VdeXY1+aemuHIcieeXdaM5TlBDO4LBSf79lF9+KBfdDHd
	 2oI1/FCmkxwvNOWRUwwDLdwbf/qpgAS0FQuwjbMJ73YsbSRq27bQKx4iXrb9S1xohw
	 UMEIi+lTS2u5qKW2SpneTi+Bele1CtEZ0cyR+BNCCCKoAKp+D+exdeZCOMpPAD7LWP
	 M6/ieCZn18PyQ==
Date: Sun, 26 Oct 2025 17:16:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>,
	Robert Marko <robimarko@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>, yijie.yang@oss.qualcomm.com,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
	Bjorn Andersson <andersson@kernel.org>,
	tingwei.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: firmware: qcom,scm: Document SCM on
 Kaanapali SOC
Message-ID: <176151696290.3032844.3392500971988332495.robh@kernel.org>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
 <20251022-knp-soc-binding-v2-3-3cd3f390f3e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-knp-soc-binding-v2-3-3cd3f390f3e2@oss.qualcomm.com>


On Wed, 22 Oct 2025 00:28:43 -0700, Jingyi Wang wrote:
> Document scm compatible for the Qualcomm Kaanapali SoC.
> 
> Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


