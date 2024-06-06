Return-Path: <linux-arm-msm+bounces-21834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FFD8FDB1D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 02:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE40D28627C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 00:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6EB38D;
	Thu,  6 Jun 2024 00:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpLVKVIT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859D8364;
	Thu,  6 Jun 2024 00:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717632149; cv=none; b=lQFpkgdsduLi5DTPJipUdUHboroBZekPmBLZtAk17Qhw8tU4AtKS4CClaChAXuI/ndWz4fUUeIIHYGmjrtHNojVtVPyLLJCAYRzKgTcDkJdvdXKkVJf/1tV99DyY6cC1hwi5jmF1a1o6Qg/ROXcPRtpj7O0FVVx6+PysK/2jVPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717632149; c=relaxed/simple;
	bh=2G2tZzmDv9j7iW8NqCgiq2C2uMvnSDId5qDlOWEF8sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYuLAFTtXn0dGLMOr5qOCVhk/4xst5jgkEOC7hW/PNITK41mews/gc1c1Imn/VI5q6jaZbBvQrACN+j8GpN4Fhz3IChm6gTE61JY7okE9Bebq6SijV0qTqF1AHejBrjVjhsAxnDeaLLYa466Toh0jL75KAHBjQR+7pE7YOne7Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpLVKVIT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBC3C2BD11;
	Thu,  6 Jun 2024 00:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717632149;
	bh=2G2tZzmDv9j7iW8NqCgiq2C2uMvnSDId5qDlOWEF8sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IpLVKVITL0BtDoEW8ENkufsrauDT2dEGsHufCcmP/rrP2ajQ/MtwexE2ty3vw2Ect
	 X+dtDdO9eaX50HARB5RrF3wiZNb9NKrSphLfrkWs+BZA5CNGgLPL5GoCNDzaiG8WCs
	 NRz9OOELSLIJLFxXV/AO7Xd8X41x0mrtilPe28Ks8nQGt+wAqsg6sZlwCla5a6dCAW
	 +Yzllipm9Q7rDf60GI9qezkncDtnAFPxeBh+5lYIcl+a9cJFd5L7BepgKH9HSt75Iw
	 dlo+h+7sIBN3lTMBu91UBuyH6/ZFdg0K0qGXkaDoftXkv/N2B37nnBBWDlVgF30hMu
	 NjTAMYwi2OE9Q==
Date: Wed, 5 Jun 2024 18:02:26 -0600
From: Rob Herring <robh@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	MSM <linux-arm-msm@vger.kernel.org>,
	DT <devicetree@vger.kernel.org>, freedreno@lists.freedesktop.org,
	Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v2 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
Message-ID: <20240606000226.GA3460814-robh@kernel.org>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
 <9d54a12a-ae66-491c-aa1e-96b7daa02201@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d54a12a-ae66-491c-aa1e-96b7daa02201@freebox.fr>

On Tue, Jun 04, 2024 at 03:47:20PM +0200, Marc Gonzalez wrote:
> HDMI TX block embedded in the APQ8098.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> index 47e97669821c3..13199f1676f7c 100644
> --- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> @@ -19,14 +19,15 @@ properties:
>        - qcom,hdmi-tx-8974
>        - qcom,hdmi-tx-8994
>        - qcom,hdmi-tx-8996
> +      - qcom,hdmi-tx-8998
>  
>    clocks:
>      minItems: 1
> -    maxItems: 5
> +    maxItems: 8
>  
>    clock-names:
>      minItems: 1
> -    maxItems: 5
> +    maxItems: 8
>  
>    reg:
>      minItems: 1
> @@ -151,6 +152,27 @@ allOf:
>              - const: extp
>          hdmi-mux-supplies: false

You need 'maxItems: 5' for clocks in the prior if/then schema.

>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,hdmi-tx-8998
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 8
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: mnoc
> +            - const: iface
> +            - const: bus
> +            - const: iface_mmss
> +            - const: core
> +            - const: alt_iface
> +            - const: extp

Please match the order of 8996 for the ones that are common.

Rob

