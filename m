Return-Path: <linux-arm-msm+bounces-80527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC18C39813
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 09:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41B314EA515
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 08:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B49B2FFFB3;
	Thu,  6 Nov 2025 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpxDrKHA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6E12FA0F6;
	Thu,  6 Nov 2025 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762416340; cv=none; b=u+UtK0QkDWH9KuMY/6tNNfxV1u2GXZGrn3Prpi3XDJfykJWPNGdWkULhfQwYGXEi1p7tNqW+bOCoMEr7avMvoE3MtIMc4brc8YFQygp2wUPaWUlhot8ebroWa/wvp+r+0A+uwMik3fKwzYzkQCfhG3iGUTnef8VD9APAtGGQi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762416340; c=relaxed/simple;
	bh=qpxsOFgQa/w4T51ERTogrIXKELvgZXJGgArc9ROXHMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaCNoDxdi4H2wcOLIvPIxvAxf+TfGdxWkj/n3LCxkfyqSL0I5m2EM6SjVSWKBd2znMazFrPapwy8/9c/85N52KOdbJr/yJGhiCxapJ42XSO5vzwW/1v2uO7Sg+P15Y50Ku5htV/xQgXD5bh914mJ4H5KJ6iItZK0SQuxP0KKmpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpxDrKHA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56432C4CEF7;
	Thu,  6 Nov 2025 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762416339;
	bh=qpxsOFgQa/w4T51ERTogrIXKELvgZXJGgArc9ROXHMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EpxDrKHAnz1DlGIbNm/BpmF1dkcSJwFBI24HpxSmBzIb7+KMeSX0gmcTq+2F3aV/O
	 3QafZZ7ra4v/q8XDtfVSbofDqKoV1QP1WkvCSzym0Ny+hHqWaJBXIY3KS3AjU+wwCJ
	 uXck37w3I0Cwk6Axur0tYuxL+sqgW8gAS8pv6YdwibM/K0ug5YlRqFDmcBUA4QRw4d
	 Cs3Nnv3GgEGD8OxGIkdVl0iBfnccoSZ1G1zxjR+dbT2m6EmTMIgJe9Qv/cC2D6deVx
	 d2e8uPUkSZsZd72gTswoe9yNKMP38DaIKe3WACrmUNs0HAe6xlQvDapncMq3wAY4M6
	 i8lCzeaRb0Yxg==
Date: Thu, 6 Nov 2025 09:05:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ettore Chimenti <ettore.chimenti@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	stefan.schmidt@linaro.org, stephan.gerhold@linaro.org, wse@tuxedocomputers.com, 
	cs@tuxedo.de
Subject: Re: [PATCH v2 1/7] dt-bindings: vendor-prefixes: Add ASL Xiamen
 Technology
Message-ID: <20251106-lemon-kittiwake-of-freedom-dfcfdf@kuoka>
References: <20251105154107.148187-1-ggo@tuxedocomputers.com>
 <20251105154107.148187-2-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105154107.148187-2-ggo@tuxedocomputers.com>

On Wed, Nov 05, 2025 at 04:41:01PM +0100, Georg Gottleuber wrote:
> From: Ettore Chimenti <ettore.chimenti@linaro.org>
> 
> ASL Xiamen Technology Co. Ltd. is a Chinese high-speed interface and
> display system chip design company. Adding it to the vendor prefixes.
> 
> Link: https://www.asl-tek.com/
> 
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index f1d1882009ba..278cb879781f 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -176,6 +176,8 @@ patternProperties:
>      description: All Sensors Corporation
>    "^asix,.*":
>      description: ASIX Electronics Corporation
> +  "^asl,.*":

So the prefix is asl-tek, like its domain.

Best regards,
Krzysztof


