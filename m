Return-Path: <linux-arm-msm+bounces-30465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0377E9694DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2C062850DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF8B1D61A9;
	Tue,  3 Sep 2024 07:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkDAMP1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A914D1CCEEC;
	Tue,  3 Sep 2024 07:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725347453; cv=none; b=OQiRsFbNnGwKiK2LM5Z6+yUtP52WCVubBjew0jiQCn3UNhdgGNNu4CBHJdp/JSNV4HU6CJ43QZmHH+ipjW7YYZfCNHFGI+HsVnR/IYIX+8DQ/J0E8sYgTwBjXF3QtPwyLNx7gaXXpiKca1cHnT7w+HPCo4F/DqQalZhp3MCPa+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725347453; c=relaxed/simple;
	bh=T4H+4ElO/PwnBQCNIGbmM+SHoxH07n02T/pQCzCLhPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2hYv/SbQjmegAwmsyTHCyz7bXr/9BF7FOprtaUljZ2teFr06KwnUElTGc3B0JpxN6q2IrBjuLTt5lKGoIxShqt9u19Kcvy/vkp114P4tV6l6HMrdeezyKQZbGkjsoSm2C5qf31YBD6Nh4ekHpl+1pqvJYYDRZqp/0vJspaSlIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkDAMP1N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45816C4CEC6;
	Tue,  3 Sep 2024 07:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725347453;
	bh=T4H+4ElO/PwnBQCNIGbmM+SHoxH07n02T/pQCzCLhPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkDAMP1NsoY2wXAXdzoz2K4xJLRUr7NHz6EKTWqFrdn0t9sV6eWWs/zeKlzij5rPl
	 mPKJ/GNaZDUarxmw1FWzy0zO85uGz0tmmqf0BgBBK8FgqcSwRn9v58t9UmFOK3Kt9L
	 AAxopvM0m8Ky7Y/LxLTW/E/5Cp6rIzP+3vyPPQsfptw0rsp3mAFeKdhGp8UmSp7GfN
	 AHjS/Gyb4jMBUUlsenqhfttnvdRq5NDWX4GejeosNkd+w03WZRBBZAhemvIZOuIcj2
	 oyIrmGdBmsxNBKBkFZcN/+2UIukaTBWedTQdhkubZ0n79JS/MJ8dkCZqqZbJaKdGi4
	 l5WncypdvKe5Q==
Date: Tue, 3 Sep 2024 09:10:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: cache: qcom,llcc: add num-banks property
Message-ID: <g7fyt57kzynzpux5nea2v22gcuu24asbr54axzms7mhdh4jq5a@xdyqifloofbk>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
 <20240903-qcs8300_llcc_driver-v1-1-228659bdf067@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903-qcs8300_llcc_driver-v1-1-228659bdf067@quicinc.com>

On Tue, Sep 03, 2024 at 02:21:29PM +0800, Jingyi Wang wrote:
> Add a property "num-banks" for errata.

This you said in commit subject and we see in the diff. You *MUST*
explain why.

> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> index 68ea5f70b75f..03241b719c98 100644
> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> @@ -56,6 +56,11 @@ properties:
>      items:
>        - const: multi-chan-ddr
>  
> +  num-banks:

No vendor prefix? So this is generic property? Then add to some common
schema with proper explanation WHY.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The num of llcc banks

And what are llcc (or LLCC?) banks?


Best regards,
Krzysztof


