Return-Path: <linux-arm-msm+bounces-41672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCD19EE078
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 683BC1886B70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA73F20C462;
	Thu, 12 Dec 2024 07:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLV7dIV7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751F120B7FA;
	Thu, 12 Dec 2024 07:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733989565; cv=none; b=GedeLvaeh9VYdFUGQ9i12PTbgAdGpapNeqpdKJN1A/1+CZ9E9kBD3ChUBoK0IXrFPzO0QKFo3sqa/ig7g79+YxGVuXCsiIUA5zhijCUVL+CQZwME9gioPDHm7yVZ45k1gmxJNt5z/Czg4hlnGCH2Wdkmr1+ylfNI+C5mSs3FyDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733989565; c=relaxed/simple;
	bh=X/MINonNLw6VBy9A+3uHA1lffCMEKUbYMQEs1bEOuhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyW3KoWul9mu2qepGy0Lnu3votbpQ6vkI1uNAchA5prJjGD2rxqUl88Y4xinPOCjC14L16F7/dFaPS7pakYUQME1zYLmo9kG3dVYzvUxL5wgxZUHVP7irwLxAMQ+S90rXo/agy4sgLsgbicYnv9NZJEbXshC5aUhFyefTHwlvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLV7dIV7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35014C4CECE;
	Thu, 12 Dec 2024 07:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733989565;
	bh=X/MINonNLw6VBy9A+3uHA1lffCMEKUbYMQEs1bEOuhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tLV7dIV7nf3IvQodfPA4pExhdYYlzRZRVLQnuIHHNB9GzIkL5jxGbuO13iVeADHO/
	 NxmNvOOGIDdZeaqyoMAXBghFTW46ne2Vxccms1l9ZawieU+z/717sYgGnUvYwytQH5
	 sST8CrIGji30uhkcw/0iZFG+xb/D3VYayK4NJhlv37waJ4BTpUsMSyL6Y+NbdPxvN0
	 iHNOeLKFsStODLgivi16/ZcGRZW/XHcBRe8KdmNUiBLpbK0g3SzTVPhnb7P8y7Fazt
	 JJKhqBU8NsSobuUuhr93k6ZyijfjaGDlocTJLdgAUNB+XdQvwaeei23ZEZXQeGdWsV
	 c2OmpwVXAKJfQ==
Date: Thu, 12 Dec 2024 08:46:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, srinivas.kandagatla@linaro.org, 
	tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/14] dt-bindings: arm: qcom-soc: extend pattern
 matching to support qcom,wsa881x
Message-ID: <uafwpjsclos7tcykjgbru32yu34ncr7stn6v74jmyu65auszik@viadthjz6cm3>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-9-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212004727.2903846-9-alexey.klimov@linaro.org>

On Thu, Dec 12, 2024 at 12:47:21AM +0000, Alexey Klimov wrote:
> Add support for qcom,wsa8815 and qcom,wsa8810 names to be recognised

What is WSA8815 that?

> as a valid compatibles.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> index 2ea6d3f65478..ebccafeb13e3 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> @@ -23,7 +23,7 @@ description: |
>  select:
>    properties:
>      compatible:
> -      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+.*$"
> +      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|wsa|x1e)[0-9]+.*$"

This is odd. WSA is not a SoC. Please provide description explaining
this, if you think otherwise.

Best regards,
Krzysztof


