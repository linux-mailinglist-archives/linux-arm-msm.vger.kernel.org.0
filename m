Return-Path: <linux-arm-msm+bounces-49897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDD0A4A5FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 23:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84BD57A4B80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 22:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649451DE2B9;
	Fri, 28 Feb 2025 22:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfEWj0Dl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3502623F39A;
	Fri, 28 Feb 2025 22:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740782178; cv=none; b=TxlEmt4cywHr6w6qUuoyeqRx0tmyofU3gR8+9ikiiTslSwm3HMwsert44PEyj5wabYp9Iz195ldya4r5bkVksQ3maBzPmzMK3yDLEUehZtjjW/Y2B3A058bTwu8eRk9S71dL+ABIdcwh8pgubkRCscoz3DLau5lz1cpDBf+nt7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740782178; c=relaxed/simple;
	bh=trd+8GTKhRLhBPavf4IOlzQe3opgYKvvSUglWL26lW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQsORJTkeQdgae7mbLVV+byAWviNAnc0zp4fEWlHQSYuUmvOi4/tR2lj5ZKqN6khssAxx+2L1V8A/FYM2VrjHyyd2WF0hYZSZkU6St5FDXoTp98/CEsUuiCQFthkTFgqqM3Ulj5s+XdjY0k80Revoq1SiW2QjEbOwKUre/ALGGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfEWj0Dl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B44BC4CED6;
	Fri, 28 Feb 2025 22:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740782177;
	bh=trd+8GTKhRLhBPavf4IOlzQe3opgYKvvSUglWL26lW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dfEWj0DlqoNjTgGPuPjKK/81b24RfFVVWsbFLyY/EaJQ/l/MuSZfNJRmCA/wgyCGa
	 Vd00wkjF2fljiMAhtMtaHRXB75v4ca/E7r5wD1xGB8aVtEtZ0my1DX0A/cqFoMZGDm
	 ZKsX1buNTLCKN0J6PFzHBQf23K+f0UdXglylgebUif2AZkbKnulsVpj7a+GihkmV5c
	 mQWTRItKUd1QlkGNGeeXiDLSSudUp09NuPBZD5MXf3mucLZGsdanRkmUEgeUn7rA6c
	 7+jMwri/+XT6+LepZrrZN7lxFzmyenJHCBZcMJq6D233Q+TXiBddbbyEsTn70jhk5U
	 fbXJVqR/5+9XA==
Date: Fri, 28 Feb 2025 16:36:14 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: usb: Introduce qcom,snps-dwc3
Message-ID: <20250228223614.GA3792644-robh@kernel.org>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-1-4415e7111e49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-dwc3-refactor-v4-1-4415e7111e49@oss.qualcomm.com>

On Wed, Feb 26, 2025 at 04:17:48PM -0800, Bjorn Andersson wrote:
> The Qualcomm USB glue is not separate of the Synopsys DWC3 core and
> several of the snps,dwc3 properties (such as clocks and reset) conflicts
> in expectation with the Qualcomm integration.
> 
> Using the newly split out Synopsys DWC3 core properties, describe the
> Qualcomm USB block in a single block. The new binding is a copy of
> qcom,dwc3 with the needed modifications.
> 
> It would have been convenient to retain the two structures with the same
> compatibles, but as there exist no way to select a binding based on the
> absence of a subnode/patternProperty, a new generic compatible is
> introduced to describe this binding.
> 
> To avoid redefining all the platform-specific compatibles, "select" is
> used to tell the DeviceTree validator which binding to use solely on the
> generic compatible. (Otherwise if the specific compatible matches during
> validation, the generic one must match as well)
> 
> Mark qcom,dwc3 deprecated, to favor expressing future platforms using
> the new combined binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 619 +++++++++++++++++++++
>  2 files changed, 631 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index a2b3cf625e5b..6d818e6dddbc 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -4,11 +4,22 @@
>  $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm SuperSpeed DWC3 USB SoC controller
> +title: Legacy Qualcomm SuperSpeed DWC3 USB SoC controller
>  
>  maintainers:
>    - Wesley Cheng <quic_wcheng@quicinc.com>
>  
> +# Use the combined qcom,snps-dwc3 instead
> +deprecated: true
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: qcom,dwc3
> +  required:
> +    - compatible
> +
>  properties:
>    compatible:
>      items:
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> new file mode 100644
> index 000000000000..37af52e01803
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -0,0 +1,619 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SuperSpeed DWC3 USB SoC controller
> +
> +maintainers:
> +  - Wesley Cheng <quic_wcheng@quicinc.com>
> +
> +description:
> +  Describes the Qualcomm USB block, based on Synopsys DWC3.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: qcom,snps-dwc3
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,ipq4019-dwc3
> +          - qcom,ipq5018-dwc3
> +          - qcom,ipq5332-dwc3
> +          - qcom,ipq5424-dwc3
> +          - qcom,ipq6018-dwc3
> +          - qcom,ipq8064-dwc3
> +          - qcom,ipq8074-dwc3
> +          - qcom,ipq9574-dwc3
> +          - qcom,msm8953-dwc3
> +          - qcom,msm8994-dwc3
> +          - qcom,msm8996-dwc3
> +          - qcom,msm8998-dwc3
> +          - qcom,qcm2290-dwc3
> +          - qcom,qcs404-dwc3
> +          - qcom,qcs615-dwc3
> +          - qcom,qcs8300-dwc3
> +          - qcom,qdu1000-dwc3
> +          - qcom,sa8775p-dwc3
> +          - qcom,sar2130p-dwc3
> +          - qcom,sc7180-dwc3
> +          - qcom,sc7280-dwc3
> +          - qcom,sc8180x-dwc3
> +          - qcom,sc8180x-dwc3-mp
> +          - qcom,sc8280xp-dwc3
> +          - qcom,sc8280xp-dwc3-mp
> +          - qcom,sdm660-dwc3
> +          - qcom,sdm670-dwc3
> +          - qcom,sdm845-dwc3
> +          - qcom,sdx55-dwc3
> +          - qcom,sdx65-dwc3
> +          - qcom,sdx75-dwc3
> +          - qcom,sm4250-dwc3
> +          - qcom,sm6115-dwc3
> +          - qcom,sm6125-dwc3
> +          - qcom,sm6350-dwc3
> +          - qcom,sm6375-dwc3
> +          - qcom,sm8150-dwc3
> +          - qcom,sm8250-dwc3
> +          - qcom,sm8350-dwc3
> +          - qcom,sm8450-dwc3
> +          - qcom,sm8550-dwc3
> +          - qcom,sm8650-dwc3
> +          - qcom,x1e80100-dwc3
> +      - const: qcom,snps-dwc3
> +
> +  reg:
> +    description: Offset and length of register set for QSCRATCH wrapper

I think you want to drop this. Or do you need 2 regions? The wrapper 
regs and the DWC3 regs? Probably worth describing separately even if 
they are adjacent currently.

> +    maxItems: 1
> +
> +  power-domains:
> +    description: specifies a phandle to PM domain provider node

Drop the description.

Otherwise, looks good.

Rob

