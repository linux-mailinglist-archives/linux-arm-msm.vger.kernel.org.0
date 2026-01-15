Return-Path: <linux-arm-msm+bounces-89288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F20BFD2930B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 00:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79308301FF9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 23:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D168D328B52;
	Thu, 15 Jan 2026 23:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWKYmyNs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DEE221F0C;
	Thu, 15 Jan 2026 23:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768518647; cv=none; b=toByz2odJYvc9Xm15cgKVVUrrDjTKYltqkbIX59SM9qvLmw+uq2YjeXxmZbvVQaF6wRLeMXhSS8RZF4usJP7mRv2Nx0p0amaNaFB++pMdAQblDFTkjcUrbPlvpy7eTds+stsXw0ZQQ0B1MPSZrPSEw3AJvH0Ms5j16xFHF0kPoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768518647; c=relaxed/simple;
	bh=QJV6qF/B9JS8s459sD+RsIzuE5M6Vu3GHT9YKChQUvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2/XyOEiQnMHBMCWoJDsWsYcup5lkkd74B1uZBHUUOz1naLr5yQmAopfIcD45URhQciVEW8x51M2vMw8ONFWz8cz92t1DgqnRfenk0pWhvto9rX8P++TMAOXeHKmYDwLbPtX+G1o4mE8HWTrQoOFjBemu9pjVA9zJc3pOpHJ0VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWKYmyNs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCC9C116D0;
	Thu, 15 Jan 2026 23:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768518647;
	bh=QJV6qF/B9JS8s459sD+RsIzuE5M6Vu3GHT9YKChQUvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWKYmyNsaFGECkB6eM5adijukFFa8E+mSN7J+Yqq0CdRZEwP6dBdgq2SfpmihUT6c
	 piwLNvcfEndZTGAJglorMOs/NBFqvpnRwl2FRJLfcEmQ7nYWGh61J80QWKuhW4UeVY
	 VDphRId0s72FsAi/J9Ink1JbAWEtl4ZgjFRTVIryrFLH1ZWNyhjQFIGQE0+S0xfomz
	 Clf9Q9Oh1hzZX9zVHyWYouYyTgLhwas8psO2LJbQ7PrPlJw5p23lCSqBszQvrSworC
	 UuW4Y2/hiRZ3MFClm9e46yXZ5iXVP6gARJoNtQiIDUQU4k5PzuXNcZArIUJ+185o2C
	 trUQbblqkEfsQ==
Date: Thu, 15 Jan 2026 17:10:44 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
Message-ID: <ph7gjuffgbxbn3k4oubdqsrogf4apxe3leowxdcu3l4wejownh@lx4s7zdah3u6>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114211759.2740309-3-anjelique.melendez@oss.qualcomm.com>

On Wed, Jan 14, 2026 at 01:17:57PM -0800, Anjelique Melendez wrote:
> Document the Kaanpali compatible string to have fallback on SM8550.
> Document the Glymur compatible string to have fallback on X1E80100.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 012c5661115d..13503ae79a8d 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -38,12 +38,18 @@ properties:
>            - const: qcom,pmic-glink
>        - items:
>            - enum:
> +              - qcom,kaanapali-pmic-glink
>                - qcom,milos-pmic-glink
>                - qcom,sm8650-pmic-glink
>                - qcom,sm8750-pmic-glink
>                - qcom,x1e80100-pmic-glink
>            - const: qcom,sm8550-pmic-glink
>            - const: qcom,pmic-glink

I'm sorry, Anjelique, taking another look at this I forgot about the
soccp-angle of the problem when we spoke.

Imagine when we add the next platform, using soccp and the other
properties of the Kaanapali pmic-glink solution.

This would require us to go:

compatible = "qcom,nextgen-pmic-glink", "qcom,kaanapali-pmic-glink", "qcom,sm8550-pmic-glink", "qcom,pmic-glink";

Because qcom,nextgen-pmic-glink isn't fully compatible with
qcom,sm8550-pmic-glink - as we see in pmic_glink.c.

> +      - items:
> +          - enum:
> +              - qcom,glymur-pmic-glink
> +          - const: qcom,x1e80100-pmic-glink
> +          - const: qcom,pmic-glink

And the same goes here.


So, while both of these are almost compatible with the previous mobile
and compute target, respectively, they aren't actually compatible.


The commit message of this commit needs to spell out how the features
differ in these two new targets in order for anyone to be able to say
whether this patch is makes sense or not.

Regards,
Bjorn

>  
>    '#address-cells':
>      const: 1
> -- 
> 2.34.1
> 

