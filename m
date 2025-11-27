Return-Path: <linux-arm-msm+bounces-83586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D3C8E38A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 13:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97C8B3ADCDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 12:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA4432D422;
	Thu, 27 Nov 2025 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bh6rPduj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F073617BA2;
	Thu, 27 Nov 2025 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764245638; cv=none; b=oZN5UqbpXiSji+GnLrPCRkttJMlKA1riXUGYabAMcxQVi1jiSaQTXA19137NnU1Bbfjn+CyRtptownMr81X4zGoGe6am7dDScpZQZbvZj0udsYinDwBSsVTkRglH4PhgEyg9yN3mAgRZRUOEgqkWLqmfEAjcxoT510nhEfNmxtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764245638; c=relaxed/simple;
	bh=vkyNrxzBL31HzfZQEt130P0SdOrTqfWzMLDKaesDnRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsqDa4Z3iAldW+uZ2Ww3MKr3bjyQ1YlmQngv5IVUx/EUbnRZpsZ7lM/W6UTrVOxpXjUKrXS9jpgdw06liSuddtMp9v0Est/IrXQoUIY8p1BE/dXDCM75/Qz9C4nsTs9ISIbZYoYga6GhK5VUO7OwQo83QtOo7vUrT8fu7touDcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bh6rPduj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB3DC4CEF8;
	Thu, 27 Nov 2025 12:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764245637;
	bh=vkyNrxzBL31HzfZQEt130P0SdOrTqfWzMLDKaesDnRM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bh6rPdujYrZQPzrSgAgzuVKL/dLj6OmBVgSd43P5wWB0BMk+laTRbydcqcwmiMHpb
	 daeK5o5+TylY3HGnYduVFwUXtO10aHQ9F8R5KsLhgIl4bavL/A2UO55dTtifP3RrvJ
	 5bJgYMp5Rj79aefyqoidWfMl3GPbLNrT5FG/q900Ae5W8zOWKs/yqMH8YE7Oq9fgJs
	 cnfANV1p1iEUkc8/qyhzR/FDQqHpv7OUrpUl/eqvVM899VMVkOYqFsNlr62K6I0EZT
	 kMsm3/DiSJqGEPmbj9cWU0bUalu6nzNL9NKiq2IoXN/sCOENKw83FBiuXz//1YQj9K
	 5xTRxvwQ/tX5w==
Message-ID: <e9363a14-183e-4d12-91b0-1ac5655e6e90@kernel.org>
Date: Thu, 27 Nov 2025 13:13:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,snps-dwc3: Add support for
 firmware-managed resources
To: Sriram Dash <sriram.dash@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: jack.pham@oss.qualcomm.com, faisal.hassan@oss.qualcomm.com,
 krishna.kurapati@oss.qualcomm.com, andersson@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com>
 <20251127-controller_scmi_upstream-v1-1-38bcca513c28@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251127-controller_scmi_upstream-v1-1-38bcca513c28@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2025 11:31, Sriram Dash wrote:
> On Qualcomm automotive SoC sa8255p, platform resources like clocks,
> interconnect, resets, regulators and GDSC are configured remotely by
> firmware.
> 
> PM OPP is used to abstract these resources in firmware and SCMI perf
> protocol is used to request resource operations by using runtime PM
> framework APIs such as pm_runtime_get/put_sync to signal firmware
> for managing resources accordingly for respective perf levels.
> 
> "qcom,snps-dwc3-fw-managed" compatible helps determine if
> the device's resources are managed by firmware.
> Additionally, it makes the power-domains property mandatory
> and excludes the clocks property for the controller.
> 
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 173 +++++++++++++--------
>  1 file changed, 111 insertions(+), 62 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 8cee7c5582f2..d2d1b42fbb07 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -12,68 +12,65 @@ maintainers:
>  description:
>    Describes the Qualcomm USB block, based on Synopsys DWC3.
>  
> -select:
> -  properties:
> -    compatible:
> -      contains:
> -        const: qcom,snps-dwc3
> -  required:
> -    - compatible

I wonder why do you think dropping some code is fine...


> +      - items:
> +          - enum:
> +              - qcom,sa8255p-dwc3
> +          - const: qcom,snps-dwc3-fw-managed

No, you cannot keep coming with more generic compatibles.

If you want generic a compatible, you already have - qcom,snps-dwc3 -
and that "generic" part already said that everything is compatible with it.

Now you claim that existing generic compatible qcom,snps-dwc3 is not
generic enough and you need one more generic compatible.

Next year you will say that two generic compatibles are not generic
enough and you need third generic compatible.

In two years we will learn that three generic compatibles are not enough...

I think I was complaining on the lists a lot on this, so I am surprised
it is still coming back.

So no, you cannot claim that you need more generic compatibles because
one generic is not generic. NAK.


Best regards,
Krzysztof

