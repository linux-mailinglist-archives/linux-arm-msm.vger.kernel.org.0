Return-Path: <linux-arm-msm+bounces-29730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D371A9620E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BFD72847B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A760D15A85A;
	Wed, 28 Aug 2024 07:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFhSWA/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79225328DB;
	Wed, 28 Aug 2024 07:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829772; cv=none; b=mUVXBbLmESgac9SaBI4MSknmnlAtn5f7okGcR8I2ho+GKv3hUYaiT/L+WxTXFiu1y2w1A1Y+X9sG7b0YhGV6SVh33xf6QfAXLePr/uPn4g1oyngFChXjnBbTJvB6vaI6Y7R/dcgju9ThJGMnkCTe/KSkZSpkbYMXOCO0ane1gKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829772; c=relaxed/simple;
	bh=jdMhW5goHxB0zL3hLhs8bUX+/LW25O1qlrnzr7n+pQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ui8MQ5RmmMTtLOizT3FgflFkXwgMsEqu/TJlnfw7xbbmFiu0Ay8kXFH0dUJvdyP45WuioigZUxBe7AeMSlCH8/ComtY4rRiUAWJ393WYEzlGrDQGP72QM0yGRSBDalc6rN7XbFHyiGLqmHoa3a3rntBwBqRQn6+NY4WuRbIsaaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFhSWA/U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32968C4AF66;
	Wed, 28 Aug 2024 07:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724829772;
	bh=jdMhW5goHxB0zL3hLhs8bUX+/LW25O1qlrnzr7n+pQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFhSWA/U1CiuHaVIHLrorNQf6hX/7m3b1vT45jjjOQzh3KCsxLv3t+jNhPjxXCnSZ
	 vcckelTAMwFVHRDyumo0nBfzOM/hbloMhOGdvYc34hArJ9V1YyX12wske4lgQG9942
	 6gY/3wgrNxE3r3aMrHYDweGx2FzVJ8Hi8uvymFxHuFamavndCs7Jd5GNIb/oLRZI3j
	 53KTBuCVcY5oTtvN0awdu+QVLozL/0GWyv8j4xre7sEJNfQ3RIL3TY4gdhr2Nrr+dQ
	 BcCtFKY/7Dew8AoCM/mFdl68iNJGUxAlNXEZGXAyh2RedaGo4j6j2pbtVL/7yTL8tt
	 ITHGqwhUUY3iA==
Date: Wed, 28 Aug 2024 09:22:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, andersson@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mathieu.poirier@linaro.org, bartosz.golaszewski@linaro.or, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, quic_tengfan@quicinc.com, Xin Liu <quic_liuxin@quicinc.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sa8775p-pas: Document
 QCS8300 remoteproc
Message-ID: <eetb73ycz7kzcgknuzorsnoszhpdljuxepuoflhakobli6dozl@q2sbmj77hedo>
References: <20240828030511.443605-1-quic_jingyw@quicinc.com>
 <20240828030511.443605-2-quic_jingyw@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828030511.443605-2-quic_jingyw@quicinc.com>

On Wed, Aug 28, 2024 at 11:05:10AM +0800, Jingyi Wang wrote:
> Document the components used to boot the ADSP, CDSP and GPDSP on the
> QCS8300 SoC.
> 
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> index 7fe401a06805..44b070a17ca0 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> @@ -16,6 +16,9 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,qcs8300-adsp-pas
> +      - qcom,qcs8300-cdsp-pas
> +      - qcom,qcs8300-gpdsp-pas
>        - qcom,sa8775p-adsp-pas
>        - qcom,sa8775p-cdsp0-pas
>        - qcom,sa8775p-cdsp1-pas
> @@ -64,6 +67,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,qcs8300-adsp-pas
>              - qcom,sa8775p-adsp-pas
>      then:
>        properties:
> @@ -75,6 +79,23 @@ allOf:
>            items:
>              - const: lcx
>              - const: lmx
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,qcs8300-cdsp-pas

This looks the same as sa8775p cdsp. Why new entry?

Best regards,
Krzysztof


