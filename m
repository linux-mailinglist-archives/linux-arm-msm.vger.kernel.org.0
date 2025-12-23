Return-Path: <linux-arm-msm+bounces-86349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC2BCD966A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 14:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A77083008FAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 13:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0550334C20;
	Tue, 23 Dec 2025 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9wqKS9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC22A7FBAC;
	Tue, 23 Dec 2025 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766495265; cv=none; b=Gd848J5JexIsc9FkGDUFrcViVVh26FDYp9HPgVuu5SiowpAZuzO+PjDVxswVcAx/ylsCsAN1cTBhB1t367/zYMIUizLBOxVFbkuL1AP+v876VvW1dsxY63pN5Ld19Chk0JhbwfSwUmxX+E/vd6/DrK601idOr5oD9nufKURV7KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766495265; c=relaxed/simple;
	bh=qVxOQ+SbHC49l2y+Pa5PbouQI8gM1RI4LV4T3tqLNAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLfngNWfANKtTJYK7aICWBIr2JcRIjXjIENBUkn7TdCX8GnrwiOqnis4xL4b/vvmdUT3+ZcpfCVemSmTA4RcM82plEzlrdm3TfuOvZxCTu8ECHVo3Wbiv7IThsi9xEZs6f7nUbsopAI3AgpempStNZtoPgdtc7J6QCnfKDn6/CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9wqKS9k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5FDC113D0;
	Tue, 23 Dec 2025 13:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766495265;
	bh=qVxOQ+SbHC49l2y+Pa5PbouQI8gM1RI4LV4T3tqLNAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W9wqKS9kW0VBhuIXpTtvOQHHhuFCiosxLcIYcRsts4hC6ou2iPs+hLoAp8pfGmaDr
	 z00xY0UnnDXU3PtDgYzvvgWO9UYQ6gq0Nx31LsPXZGH5sUo+RSTXDis2PKQNzOOxeZ
	 3oLzQl7haY3R8L0mcvTLMqrEuB2/cD+JAkh7k2sSRcJ7kta4RVPbE0bC9FSZfJqBvJ
	 G/kzuojpxrGVOxrfdLLHLW2fw9T/i5oj3XFF5+hFcwn58e0L6FiWe1aO6xYX45nqfU
	 ++DeYKWjuUWwubmftux2EZIxnM78JueAaTdbPfdw+ai2owUAG3cj2x8mch4irso81Y
	 N2Uat5gC3tPVg==
Date: Tue, 23 Dec 2025 14:07:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Message-ID: <20251223-loud-pastoral-ant-f9e74a@quoll>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-2-5b09885c55a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223-knp-remoteproc-v3-2-5b09885c55a5@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 01:13:48AM -0800, Jingyi Wang wrote:
> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
> interrupt. It is not compatible with SM8650 because one memory region
> "global_sync_mem" is not managed by kernel on Kaanapali so it is removed
> in the remoteproc cdsp node.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 31dffd02125a..3b66bd106737 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -35,6 +35,10 @@ properties:
>        - items:
>            - const: qcom,sm8750-cdsp-pas
>            - const: qcom,sm8650-cdsp-pas
> +      - items:
> +          - enum:
> +              - qcom,kaanapali-cdsp-pas
> +          - const: qcom,sm8550-cdsp-pas

This should be placed before list with "qcom,sm8650-cdsp-pas", because
we generally sort them by fallback.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


