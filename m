Return-Path: <linux-arm-msm+bounces-19791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D10FD8C41B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 15:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71CC8B219D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 13:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED26715216F;
	Mon, 13 May 2024 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjATwxOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B693B59164;
	Mon, 13 May 2024 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715606403; cv=none; b=czBROKtje/w+TeToV4DWk/+WeqdZjTccw6zk76AgRyatuA+nA82m9MISmADM6CUijNWqPJTH58vkRFOpRxRw1ts4XqDWKk8QhyLGnrW0iGyBxzdh/ipY4xKWOxa60MPHTgXxbHyPnNF1Bnamn55/GmEIdRhkU+xSZrvSU+pM1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715606403; c=relaxed/simple;
	bh=BjpNrBf8xUWY5HdIXv/CHqnmjNgz1AFEpMF+3oZD9OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fj4mfUNWA846zvRnuT7CmAroO/j/0pgQc5rvEB74Y0YIJ+7NpjVDgHqZTGArMnz3lzNMADxTqcCX9bmaFAOO0pyQYE/6IhEqkUMym+WDOq2Y5sd5AxPKd2bMmmyL3HjLERlLe18bCTqRJHYOtv+Ssovfn6bv1tPqga6vzsWGujY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjATwxOc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E700C113CC;
	Mon, 13 May 2024 13:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715606403;
	bh=BjpNrBf8xUWY5HdIXv/CHqnmjNgz1AFEpMF+3oZD9OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OjATwxOcxE557ut6FtoTfM6PpRJDPrRlPU/al+dv5Klyw2dNvIZvdyKHXSYYkXY0/
	 8bhBMvZSPvuej0IPQCbZ5pzM+FfuN/bDVQKHUEA7/eE/FLv+QF//U3kyt2ArZj+0Eu
	 dSPmZC+LcMxapYSlFC1OuR+iVjCC35fDZknl9C0ydmBw0vv2AZqfhSaVwpABfJBhxu
	 6jahv5FmUlAHo7BeVD75z0KrFib4iaHHvamocBJVvlY0ppofqSe1cPn/vZit3+C2sg
	 kl/00P294uoj+B0lPpQj8QH3arjHPY52k7iBo/IAkapUSLnTaQjPKFbUu+wMtRqSf3
	 +ok8tYJNY3BJQ==
Date: Mon, 13 May 2024 08:20:01 -0500
From: Rob Herring <robh@kernel.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: qcom: Add AHB clock for SM8150
Message-ID: <20240513132001.GA2421461-robh@kernel.org>
References: <20240509-videocc-sm8150-dt-node-v4-0-e9617f65e946@quicinc.com>
 <20240509-videocc-sm8150-dt-node-v4-1-e9617f65e946@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509-videocc-sm8150-dt-node-v4-1-e9617f65e946@quicinc.com>

On Thu, May 09, 2024 at 03:54:03PM +0530, Satya Priya Kakitapalli wrote:
> SM8150 videocc needs AHB clock, so update the bindings for sm8150
> to add the AHB clock.

Breaking the ABI is fine because ____.

> 
> Fixes: df3f61d2cdc9 ("dt-bindings: clock: add SM8150 QCOM video clock bindings")
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,videocc.yaml         | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index 6999e36ace1b..68bac801adb0 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -75,7 +75,6 @@ allOf:
>            enum:
>              - qcom,sc7180-videocc
>              - qcom,sdm845-videocc
> -            - qcom,sm8150-videocc
>      then:
>        properties:
>          clocks:
> @@ -101,6 +100,22 @@ allOf:
>              - const: bi_tcxo
>              - const: bi_tcxo_ao
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sm8150-videocc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: AHB
> +            - description: Board XO source
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: bi_tcxo
> +
>    - if:
>        properties:
>          compatible:
> 
> -- 
> 2.25.1
> 

