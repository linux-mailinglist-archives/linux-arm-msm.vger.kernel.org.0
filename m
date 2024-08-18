Return-Path: <linux-arm-msm+bounces-28887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4430B955CFC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 16:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8E5E281D58
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 14:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E58F7FBD1;
	Sun, 18 Aug 2024 14:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAOi6FkK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA882BAF9;
	Sun, 18 Aug 2024 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723991627; cv=none; b=WHsBYBPdrEFfB9GPdieahQEy5ZKLmwc+wq332cxrofWhm/MYvR0xTUfN9zozMPGrKMG89y78F/gBwuNDV0VA35OVIPe8I3C0mcHAIx9uF3lCaQxS6LJh5SPMl7NNLKvH1O2431S4LBWilcX+keepef2x6xy8GnV2CjEuVM2m7bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723991627; c=relaxed/simple;
	bh=WMOYZxTxoRYylJn+hMOa5ljrn4vL8U77f+OVDXxqRks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1xR96KtqmJu7g+qvT40E3lq2X4xjTl7m/bWu6OBrxsCBCe2JiURczHRFuQFEZRpL+GZBlPY3UJ1yfdo0hJTdfINtV/i2u1OnqezJi538Rk3jFn46auG2rqAEF5g74e0+9BPDxkMosA0G/m1lORioFEeHOFgE2u5vVuRC1voPHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qAOi6FkK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332F0C32786;
	Sun, 18 Aug 2024 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723991625;
	bh=WMOYZxTxoRYylJn+hMOa5ljrn4vL8U77f+OVDXxqRks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAOi6FkKMHCCeC6JMPU8HaEKCyWU8hIeagasQAtCbXLw7QPN0XxFOi/hMIOV/2jT4
	 msKjK+BJyYf2bVN23qfCmThA1X7Qcd6eVRlt9pCbhv8Bt6mw76+hP7k4zIT0a0r1yP
	 akq0RvfIxsTgo6f/w68fA/d/eIG4yE4A6YerhdH7bKqkYUkylfw1PflPadBYfoV0lI
	 bRrhukrVBIyd7UN6uTcxdI7lZe61UyiKy3ZQloFViPIsG5VwTciUhRgQ2x815z4Y22
	 5TCSiAN/wJhfYBILux1nf9IeujhrAWn/nDDMUPnB859iv5CZcPTE4ord/2XMR2FaHD
	 1fWMuSpUI4kgg==
Date: Sun, 18 Aug 2024 08:33:44 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: snps,dwc3: Split core
 description
Message-ID: <20240818143344.GA31572-robh@kernel.org>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-1-91f370d61ad2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811-dwc3-refactor-v2-1-91f370d61ad2@quicinc.com>

On Sun, Aug 11, 2024 at 08:11:58PM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The Synopsys DWC3 core is found either as a standard block or integrated
> with vendor glue logic. So far the latter has been described as two
> separate IP blocks in DeviceTree, but the two parts are not separate.
> 
> In the case where the core is integrated together with vendor glue,
> resources such as clock and resets are often customized by the vendor,
> such that the standard properties doesn't make sense.
> 
> Split the snps,dwc3 binding in a description of the core properties and
> the standard "glue" properties, in order to allow vendor bindings to
> inherit the core properties.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  .../devicetree/bindings/usb/snps,dwc3-common.yaml  | 417 +++++++++++++++++++++
>  .../devicetree/bindings/usb/snps,dwc3.yaml         | 391 +------------------
>  2 files changed, 418 insertions(+), 390 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> new file mode 100644
> index 000000000000..65e7900f904a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -0,0 +1,417 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/snps,dwc3-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare USB3 Controller common properties
> +
> +select: false

You can drop this.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

