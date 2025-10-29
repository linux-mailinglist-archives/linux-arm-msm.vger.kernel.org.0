Return-Path: <linux-arm-msm+bounces-79467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6793C1ABF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3148D1AA2ED1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7CD340A62;
	Wed, 29 Oct 2025 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMqj0c6j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFDA2BEC42;
	Wed, 29 Oct 2025 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744223; cv=none; b=b37VrzTsIKpAB/tt5uKqXSeuKBmyvnpXvIAYNiwBSkxdISaIJmr+3Tr2UgxhVaXjPKOlMJyVishY92VEoWQxupF5wbmwfzxE7HEV9kQs+pNtyECa8fhH1w61rRTS9eWTGHxlVmTDYrUNIcuGTiJF8a0MyxC1y4EuUG3bkcdzNb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744223; c=relaxed/simple;
	bh=HCxiUT+UcTpmkTorfEO6P4LldSqqZM2AKFoTHcwUw1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgrxDOR51lVOw0Hl+X8dg2wPKr1RvMaaA25Cw5yQSicRKko416DxiTD12x1bqcww30QENzxln/DOOArfl22eV9QDpqRvZztp1aiiYs/ToaDfCU5dn89qPe9hCjOKOL4mtm/JB1nRIgL3WVfaNv140VTl6JnDEPX1QRPqiRhS8PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMqj0c6j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E074AC4CEF7;
	Wed, 29 Oct 2025 13:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761744223;
	bh=HCxiUT+UcTpmkTorfEO6P4LldSqqZM2AKFoTHcwUw1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMqj0c6jewONZQkpIMwhyBeLMDViDr3QUKhVRVzhdrsfVCO3Gsydgwfl/NIx9UiQK
	 UPcAeGmU7A0+DmkovRG/vay07/+7pI09+58tGc2jfm7ZGChknuMqc1r4wcBvWEIX4u
	 afiYaqkIdu/eVnN3Y21jr37h3qLit780N97PJOacyZs64E+VOKi8QMfPRNRYzUKs/5
	 DCGWsTujAOVAjmNCxCgJBzwZo2e9SYbsHxBsXvYLdYp6Z/WDnQj0J2qClC8MvkKgP3
	 Os1v/B2ap5qiZiC0Qd7q9laoYK0VdOo/9vBuwCmfZNMhEsuG8sB/1Y/jisM7HyucB0
	 4prVIwCwUTQrA==
Date: Wed, 29 Oct 2025 08:23:40 -0500
From: Rob Herring <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/7] dt-bindings: remoteproc: qcom,sm8550-pas:
 Document Glymur ADSP
Message-ID: <20251029132340.GA668444-robh@kernel.org>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-6-6c81993b52ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-knp-remoteproc-v2-6-6c81993b52ea@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 01:05:44AM -0700, Jingyi Wang wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Document compatible for Qualcomm Glymur SoC ADSP which is fully compatible
> with SM8750 ADSP. Also with the Linux Host running on EL2, the remoteprocs
> need to be hypervisor independent, the iommu property is mandatory to
> ensure proper functionality.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml     | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 3b66bd106737..8cb839ba1058 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -29,6 +29,7 @@ properties:
>            - qcom,x1e80100-cdsp-pas
>        - items:
>            - enum:
> +              - qcom,glymur-adsp-pas
>                - qcom,kaanapali-adsp-pas
>                - qcom,sm8750-adsp-pas
>            - const: qcom,sm8550-adsp-pas
> @@ -101,6 +102,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,glymur-adsp-pas
>                - qcom,kaanapali-adsp-pas
>                - qcom,kaanapali-cdsp-pas
>                - qcom,sm8750-adsp-pas
> @@ -247,6 +249,17 @@ allOf:
>              - const: mxc
>              - const: nsp
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,glymur-adsp-pas
> +    then:
> +      properties:
> +        iommus:
> +          maxItems: 1

This doesn't make 'iommus' mandatory as the commit msg says.

> +
>  unevaluatedProperties: false
>  
>  examples:
> 
> -- 
> 2.25.1
> 

