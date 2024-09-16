Return-Path: <linux-arm-msm+bounces-31844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6DE97A4FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03DE81F22861
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 15:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394E3158D8D;
	Mon, 16 Sep 2024 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6GF5xte"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8A9158D6A;
	Mon, 16 Sep 2024 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726499539; cv=none; b=ojKo3VJtB+WBPybT4GAJBWrunrA5xL4XnBVupmE4cdQu3Rtavp0kPK5S5gwX9kAk3csNqNvoKvwDtk07FHZba36u1/nooR/37nMNujJR68d7OcMjzsAbuxIeTYIoirE8p1kGXCIJPONb97Rcj3qHOkjd2qE4gn/0HLcoSPp3acA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726499539; c=relaxed/simple;
	bh=+qE0cfhCjeT1ZOLJII3aqab5TfZnXv8TrPWTDIupKos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNOiZ7sC08xE74vOwwaOOruvkvfdcp/eAuKu1DOKaO+hiMNR/m3oq3xl7Gxh0GZ4x3He6Azy8rH+elcuvBh9TP9Uc1TUjlMT0vqpXUw+qazK1ro7AHbu/U4KDRvOUYXp63i5JaaKC16Uhm34tKCTyw324eZxOScFf+rWHKBM5yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6GF5xte; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA6AC4CECE;
	Mon, 16 Sep 2024 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726499538;
	bh=+qE0cfhCjeT1ZOLJII3aqab5TfZnXv8TrPWTDIupKos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6GF5xted92dISuDjRMW7It4JqxMxuElYpqt+FQHSP0Cen+iV0GO6wlMb8A6KW5c8
	 dVg7VRay1ysGmL96nx+7Ce+y9bdVm4m02cabTtFgG9R8tL6QfTQoWcTEEhD8V8pFyO
	 MQAJgm3yhsTZ9iuCh0TJAOrilfRWBIZfzc9bOtynimj9SkuVfFQ/ud6U7x5//zETBB
	 /u1lx46+XJGXcASep+RLs8RmlBagbHMb551foFbkEsLG/bZxiDPFGSpzPcZE4h/Xo2
	 OejxMhdIcJ5+BTt2ugWPIxqdM4+gNfQn4DGZ/enZYK3xSM8qd6lP+7nDBFSos4Sgwf
	 TrwWb7bNSJNxQ==
Date: Mon, 16 Sep 2024 17:12:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: qcom: Document qcs9100-ride and
 qcs9100-ride Rev3
Message-ID: <q6xs5vc3uy4y2qhgmhzfdpocn5edvfl2zsgfovbgz6rlvqjhpv@sutqhfpwcwfs>
References: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
 <20240911-add_qcs9100_support-v2-3-e43a71ceb017@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911-add_qcs9100_support-v2-3-e43a71ceb017@quicinc.com>

On Wed, Sep 11, 2024 at 07:10:57PM +0800, Tengfei Fan wrote:
> Document qcs9100-ride and qcs9100-ride Rev3 is based on QCS9100 SoC.
> 
> QCS9100 is a IoT version of SA8775p, hence use the latter's compatible
> string as fallback.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


