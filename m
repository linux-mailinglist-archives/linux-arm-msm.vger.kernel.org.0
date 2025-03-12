Return-Path: <linux-arm-msm+bounces-51138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E67A5DBDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 12:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE1DE3AF716
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 11:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B6123C8A2;
	Wed, 12 Mar 2025 11:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTziJHhg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B59E3D3B8;
	Wed, 12 Mar 2025 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779958; cv=none; b=k1XLUMrEc16AS83Iamo3vksnWno3m9qmlTeAEm9o4PDuJa/9wgdKw82K7uak2GEtL2RnRe72WBrHhplol/YnSl/yIHWGp4Kc840Mo+LLJxGj/7a9IBSoHq1yppIzBgeOtBSTfGoi1kZqzK8UYWR+RDcpPJdevb9YG9nV7/c4ZGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779958; c=relaxed/simple;
	bh=AGRqmwUTIygKiqPKyMDl1Xfn64z9qv9+ODfA6XnE8TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4vhCYKCtEGNDZDf/TcPPUC1jzPCxbDsGv23BiUZz6bm/LxPeo4ilzA92Mlwp26CZzgMjrYovnyJLJLMpJWHp5/hb7JK2c2wg4St0wIwJ8KnpMfj557COC71u557URB/qEdBOUHW56/+2KsRdLvdMxTVt+CUUoDSREUuNcDJaWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTziJHhg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E2FC4CEEE;
	Wed, 12 Mar 2025 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741779957;
	bh=AGRqmwUTIygKiqPKyMDl1Xfn64z9qv9+ODfA6XnE8TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jTziJHhgTLIits6Md7rklsxcwoC9511QKZbqrNdHamLJeb8xlvPSyzn5P7U3j4DFA
	 4oZ7OpgqzERYsppkzvV3JIeNcwJE3+bhHmtnf0iqrR7O89CdJ/5qcyE0b425Q9hRXY
	 H99+UB8CZWASWwCWItFuxNluGPeWJWlU86ru6bmXDmaTDbije+cPwtlsUkEYJHjwjq
	 ngeFDD6nRaMxX+pf2eu/hgCOT0hhoW97KEiPIu7Hu22CD0deC+nkK7NTAmbK0uFbw9
	 dFxeVuaBEmIUVN+lKMcB80K9iKEqp2+XbmjM9CbTYe9zgwQUcaPRPyXd6s33cGcg05
	 ADtHScuiRjJ8g==
Date: Wed, 12 Mar 2025 12:45:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
	marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, 
	quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 03/10] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
Message-ID: <20250312-calm-steadfast-cricket-fe9dd8@krzk-bin>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-4-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250311122445.3597100-4-quic_amakhija@quicinc.com>

On Tue, Mar 11, 2025 at 05:54:38PM +0530, Ayushi Makhija wrote:
> Document DSI controller and phy on SA8775P platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> index a90a8b3f1a9e..628ca68871f4 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> @@ -52,6 +52,26 @@ patternProperties:
>          items:
>            - const: qcom,sa8775p-dp
>  
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        items:

contains

> +          - const: qcom,sa8775p-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

Drop fallback

Same comments further

Best regards,
Krzysztof


