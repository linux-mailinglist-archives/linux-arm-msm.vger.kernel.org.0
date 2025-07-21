Return-Path: <linux-arm-msm+bounces-65870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43010B0C00F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 11:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F1453BF150
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 09:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E7828DB7B;
	Mon, 21 Jul 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prIb9brq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F628D8C8;
	Mon, 21 Jul 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753089579; cv=none; b=IH/+zcE0bZMp+R6T8cssItBk9rAHL6YONz7uD+pcIBvAU7hyXHaPuYPR+c4l0NJOE5dLBn8NI9TS9eVXm50MJyI6muH4skmQaeZ4HnHpL62v16NiWbdbTDlwFuThqLT7UlSsPQt8vPCHnavgl0VjsNlZGbpANfSd1vdOLXPcS3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753089579; c=relaxed/simple;
	bh=1O6qgZHNCTzxqtoMwL2LoFK2ceOAh2w0TjTzof8c+Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHDbaH0A0EFjtawjnhG+9SViApqqhnoxZvJJcI9O8jdm7WhHNhwJnTWedUZODw/BQGQAyAE6xKcXPv3Sl0XUyYbm8D7Yi7WgznmRniZ5xxBnG6ubllsYh26fd/j29GNciHyXaeAHRED2j3yjshtiENm5GguUrjrKNKym5jl0pTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prIb9brq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC75AC4CEED;
	Mon, 21 Jul 2025 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753089578;
	bh=1O6qgZHNCTzxqtoMwL2LoFK2ceOAh2w0TjTzof8c+Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prIb9brqCDoJJMvY+L+ynnNCx6xgVEHxxu8CcuPcizoGs6SwxSjRzTjNt3viua4Q4
	 lHOx/7IVJ3HL4SceNVesqW3oIBALN0p6sP/jwbxudcGNHNpU8whIvgU8O1Dw/8E84/
	 Wi9wAEtv5gONeO741RX1pFpJGDnQYq1ngb7kLNNgtC8mg7f5ePkLdUXRkYtOp3+o2I
	 4GPBh31u/DWcLS0ZSxsJgkqkj4/uijJKq7mXwZOG5hZKs8R3vD39D313CBr+ct5Cp5
	 63//0lpqsxtM53VlRyBRzaATIqadPWCFRihpZlYf2QfS/lWorw+PNev2uDCAud1eZJ
	 sJHrVxnmG0ifg==
Date: Mon, 21 Jul 2025 11:19:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com, linux-clk@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: clock: qcom: Add bindings documentation
 for the Glymur TCSR
Message-ID: <20250721-striped-defiant-hippo-6dee44@kuoka>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-3-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250716152017.4070029-3-pankaj.patil@oss.qualcomm.com>

On Wed, Jul 16, 2025 at 08:50:12PM +0530, Pankaj Patil wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> The Glymur TCSR block provides CLKREF clocks for EDP, PCIe, and USB. Add
> this to the TCSR clock controller binding together with identifiers for
> the clocks
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

And same for documentation...

> ---
>  .../bindings/clock/qcom,sm8550-tcsr.yaml      |  3 +++
>  .../dt-bindings/clock/qcom,glymur-tcsrcc.h    | 24 +++++++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,glymur-tcsrcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> index f3afbb25e868..9fbf88836782 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> @@ -8,12 +8,14 @@ title: Qualcomm TCSR Clock Controller on SM8550
>  
>  maintainers:
>    - Bjorn Andersson <andersson@kernel.org>
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>  
>  description: |
>    Qualcomm TCSR clock control module provides the clocks, resets and
>    power domains on SM8550
>  
>    See also:
> +  - include/dt-bindings/clock/qcom,glymur-tcsr.h
>    - include/dt-bindings/clock/qcom,sm8550-tcsr.h
>    - include/dt-bindings/clock/qcom,sm8650-tcsr.h
>    - include/dt-bindings/clock/qcom,sm8750-tcsr.h
> @@ -22,6 +24,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,glymur-tcsr
>            - qcom,sar2130p-tcsr
>            - qcom,sm8550-tcsr
>            - qcom,sm8650-tcsr
> diff --git a/include/dt-bindings/clock/qcom,glymur-tcsrcc.h b/include/dt-bindings/clock/qcom,glymur-tcsrcc.h
> new file mode 100644
> index 000000000000..72614226b113
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,glymur-tcsrcc.h

Filename matching compatible.

Best regards,
Krzysztof


