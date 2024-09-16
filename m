Return-Path: <linux-arm-msm+bounces-31838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2949797A4A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 16:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6DD51F29C01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 14:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC5115B570;
	Mon, 16 Sep 2024 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOUscq5w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878015AAB8;
	Mon, 16 Sep 2024 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498726; cv=none; b=Yb43h8Mw45Jz08Ix7DA7oA73ciYTF8g5cMSLRwoRvmi37+KXL6HwyRXiA+E7Vi6C0gOOeGoPdVfJ+D/RCxsedQFOSPxpiMqdOfRLTRtQgOgPsQZ+5V65soWIQtDKqdvqrenJl7ePASruqZKVUxvCI3DOrQNLJw7OPthfrOVTFLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498726; c=relaxed/simple;
	bh=Ve3u0BVMFeX/LNQLymrr4NCz7ZzGxNyFH/P5sJDXYR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXnNkV25qRzcjVT20Uf2ngpMmveAkHxA5Dt+33GCEyLdOb1baNXDLfc2hR4ZcIxEDnULP0GxreR/rmQnn+qOmknkcKYfiFKMsVRX9NBgTY0efKLVfVRpSLkuIgpkyxFUuV0B3liacUyOHn+HOseWSUbvg7UqzkwJsYLR0J60nq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOUscq5w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CF8C4CEC5;
	Mon, 16 Sep 2024 14:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726498726;
	bh=Ve3u0BVMFeX/LNQLymrr4NCz7ZzGxNyFH/P5sJDXYR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOUscq5wmq5gDlhoFZZwdLAvPYor48lfYxyXj7clwcx93X9ND9hjm03aBbBHllPU5
	 1SNBhnbf4zCSQMHoxaQ/e/n1Rax+2ToL49yJ5Rts+SZh58NJ+/N6u0AQOCBvpqRTBc
	 NMJ7q1quUh6FamnWvl8DhT5FD4dtXizSWbcjKdytMX5g8TMauK7wRsmSGLE1ZDBKfK
	 5xqyUc1eQEUcU2oVFffY93xke0Uy5MoLeNk25DPl+Ja9XtPoErdWJs7o0fL+rs0ObZ
	 LLjPfKY5Qkd3pjfkqUNrjBrMr+cctJ5T1XGu+JxjCWBLhg56iLoytiw+JQnP/jMPFV
	 TZNABT8FRBV4A==
Date: Mon, 16 Sep 2024 16:58:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com
Subject: Re: [PATCH v2] dt-bindings: nvmem: qfprom: Add compatible for QCS8300
Message-ID: <qguphm7aph2rklnnxwdfhlb5udkqb2liozndrhcpy5h2hkvnng@54rj5vzkmun4>
References: <20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com>

On Wed, Sep 11, 2024 at 03:34:33PM +0800, Jingyi Wang wrote:
> Document QFPROM compatible for Qualcomm QCS8300. It provides access
> functions for QFPROM data to rest of the drivers via nvmem interface.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
> Changes in v2:
> - decoupled from the original series.
> - Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


