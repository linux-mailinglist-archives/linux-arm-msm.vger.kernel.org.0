Return-Path: <linux-arm-msm+bounces-33180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA482991767
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 16:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBBA61C20E4F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 14:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E2F15532A;
	Sat,  5 Oct 2024 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfaaX8Tq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AB01552E0;
	Sat,  5 Oct 2024 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728139034; cv=none; b=l90Rw9YGR6R5HNnV8blP4axLVAQKdmHSL853/ZmNfewCEvs5exM8kL0eZQiybgpYicbtu6ejuLOPFtc6UlqeWRFRUydqVz+eyTK/JtjF2Qm52A3liWsQB0rKpMoKW/F75Hs5j3UGsqEvgZp3HA0apokVg3gesomaVZ9LBvI1EpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728139034; c=relaxed/simple;
	bh=PZqPw0NfxQ/DbCT3bbqtAszcPV+I/aAYlgSZklIL9gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZD3dLZkzl9j6M5ya/1rDIAaIP6sNzf5a4e3eAufKB27Zr1IXI0i8y4OnMC9IztKja6gB14Op1IVGynQc/4r3C1kRkAegY2Qo9bVE40KEzJRtucZDjhXOXb/h2xMskaTLeg3QMjAWYF4T0QB8lrp9pFH7rPECK4P7uZXapZXwJUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfaaX8Tq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5FFC4CEC2;
	Sat,  5 Oct 2024 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728139034;
	bh=PZqPw0NfxQ/DbCT3bbqtAszcPV+I/aAYlgSZklIL9gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SfaaX8Tq32kuyA9TYaFh0ULWSZ2hQNXhoKA8I1Pt7it9tSo6426I9FfTko78Lfo1c
	 uyXsYHmmVxOJeK8qSxVDj4uAsPhEKTOL900cdSH3+6YyGaUo0XfBdrPLUBSUq3UVzJ
	 NhZSKc3zTSXMzTFLqGw/uW/ej+hugiNyrxt/XYfi40ehCTTU/+5jhefMZtJM1xooM3
	 MhyEDm1X3b7S7Sa1hE7r/coUNVvRlck+aUExcOcmDgs8DzFnuI5UPzPDslldfLisjZ
	 JWf3FkdIXykWYYAW0g95UsS5JNkEFsdwclq35RX7XVJdPBFMzgNlQzm1HK+CiDzeio
	 j9pKgupz9Vv6A==
Date: Sat, 5 Oct 2024 09:37:13 -0500
From: Rob Herring <robh@kernel.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
	agross@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_narepall@quicinc.com,
	quic_nitirawa@quicinc.com
Subject: Re: [PATCH V1 1/3] dt-bindings: ufs: qcom: Document ice
 configuration table
Message-ID: <20241005143713.GA148600-robh@kernel.org>
References: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
 <20241005064307.18972-2-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005064307.18972-2-quic_rdwivedi@quicinc.com>

On Sat, Oct 05, 2024 at 12:13:05PM +0530, Ram Kumar Dwivedi wrote:
> There are three algorithms supported for inline crypto engine:
> Floor based, Static and Instantaneous algorithm.
> 
> Document the compatible used for the algorithm configurations
> for inline crypto engine found.
> 
> Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index 25a5edeea164..5ac56e164643 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -108,6 +108,11 @@ properties:
>      description:
>        GPIO connected to the RESET pin of the UFS memory device.
>  
> +  ice-config:
> +    type: object
> +    description:
> +      ICE configuration table for Qualcom SOC

What goes in this node?

> +
>  required:
>    - compatible
>    - reg
> @@ -350,5 +355,24 @@ examples:
>                              <0 0>,
>                              <0 0>;
>              qcom,ice = <&ice>;
> +
> +            ice_cfg: ice-config {
> +                alg1 {
> +                     alg-name = "alg1";
> +                     rx-alloc-percent = <60>;
> +                     status = "disabled";

Examples should be enabled.

> +                };
> +
> +                alg2 {
> +                     alg-name = "alg2";
> +                     status = "disabled";
> +                };
> +
> +                alg3 {
> +                     alg-name = "alg3";
> +                     num-core = <28 28 15 13>;
> +                     status = "ok";
> +                };
> +            };
>          };
>      };
> -- 
> 2.46.0
> 

